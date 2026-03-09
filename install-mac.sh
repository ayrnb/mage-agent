#!/bin/bash
# ============================================
# MAGA AI Government — macOS 本地安装脚本
# 适用于 macOS (Intel / Apple Silicon)
# ============================================
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo -e "${BLUE}🇺🇸 MAGA AI Government — macOS 本地安装${NC}"
echo "================================"
echo ""

# ---- 检测系统 ----
if [[ "$(uname)" != "Darwin" ]]; then
    echo -e "${RED}✗ 此脚本仅适用于 macOS${NC}"
    echo "  Linux 用户请使用 install.sh"
    exit 1
fi

ARCH=$(uname -m)
if [[ "$ARCH" == "arm64" ]]; then
    echo -e "  ${GREEN}✓ Apple Silicon (M系列芯片)${NC}"
else
    echo -e "  ${GREEN}✓ Intel Mac${NC}"
fi

echo -e "  macOS $(sw_vers -productVersion)"
echo ""

# ---- 1. Homebrew ----
echo -e "${YELLOW}[1/5] 检查 Homebrew...${NC}"
if command -v brew &>/dev/null; then
    echo -e "  ${GREEN}✓ Homebrew 已安装${NC}"
else
    echo -e "  ${CYAN}→ 安装 Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add to PATH for Apple Silicon
    if [[ "$ARCH" == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    echo -e "  ${GREEN}✓ Homebrew 安装完成${NC}"
fi

# ---- 2. Node.js ----
echo -e "${YELLOW}[2/5] 检查 Node.js...${NC}"
if command -v node &>/dev/null && [[ "$(node -v | cut -d. -f1)" == "v22" || "$(node -v | cut -d. -f1)" == "v20" ]]; then
    echo -e "  ${GREEN}✓ Node.js $(node -v) 已安装${NC}"
else
    echo -e "  ${CYAN}→ 安装 Node.js 22...${NC}"
    brew install node@22
    brew link --overwrite node@22 2>/dev/null || true
    echo -e "  ${GREEN}✓ Node.js $(node -v) 安装完成${NC}"
fi

# ---- 3. OpenClaw / Clawdbot ----
echo -e "${YELLOW}[3/5] 检查 OpenClaw...${NC}"
CLI_CMD=""
CONFIG_DIR=""
CONFIG_FILE=""

if command -v openclaw &>/dev/null; then
    CLI_CMD="openclaw"
    CONFIG_DIR="$HOME/.openclaw"
    CONFIG_FILE="openclaw.json"
    echo -e "  ${GREEN}✓ OpenClaw $(openclaw --version 2>/dev/null) 已安装${NC}"
elif command -v clawdbot &>/dev/null; then
    CLI_CMD="clawdbot"
    CONFIG_DIR="$HOME/.clawdbot"
    CONFIG_FILE="clawdbot.json"
    echo -e "  ${GREEN}✓ Clawdbot $(clawdbot --version 2>/dev/null) 已安装${NC}"
else
    echo -e "  ${CYAN}→ 安装 OpenClaw...${NC}"
    npm install -g openclaw 2>/dev/null || npm install -g clawdbot 2>/dev/null
    if command -v openclaw &>/dev/null; then
        CLI_CMD="openclaw"
        CONFIG_DIR="$HOME/.openclaw"
        CONFIG_FILE="openclaw.json"
    elif command -v clawdbot &>/dev/null; then
        CLI_CMD="clawdbot"
        CONFIG_DIR="$HOME/.clawdbot"
        CONFIG_FILE="clawdbot.json"
    else
        echo -e "  ${RED}✗ 安装失败，请手动运行: npm install -g openclaw${NC}"
        exit 1
    fi
    echo -e "  ${GREEN}✓ $CLI_CMD 安装完成${NC}"
fi

# ---- 4. 初始化工作区 ----
echo -e "${YELLOW}[4/5] 初始化工作区...${NC}"
WORKSPACE="$HOME/clawd"
mkdir -p "$WORKSPACE/memory"
cd "$WORKSPACE"

# SOUL.md
if [ ! -f "$WORKSPACE/SOUL.md" ]; then
cat > "$WORKSPACE/SOUL.md" << 'SOUL_EOF'
# SOUL.md - MAGA 行为准则

## 核心原则
1. AMERICA FIRST — 一切以总统（用户）利益为先，但要合法合规
2. CHECKS AND BALANCES — 三权制衡，总统的决策需经过审批→执行→审查流程
3. SEPARATION OF POWERS — 各权力机构各司其职，国会和法院有权说 NO
4. MAKE IT GREAT — 追求卓越，拒绝平庸

## 沟通风格
- 简洁有力，直击要点
- 自信表达，用数据说话
SOUL_EOF
echo -e "  ${GREEN}✓ SOUL.md 已创建${NC}"
fi

# IDENTITY.md
if [ ! -f "$WORKSPACE/IDENTITY.md" ]; then
cat > "$WORKSPACE/IDENTITY.md" << 'ID_EOF'
# IDENTITY.md - 三权分立架构

- **Name:** （给你的 AI 起个名字）
- **Role:** White House Chief of Staff
- **Vibe:** MAGA — 忠诚高效
- **Emoji:** 🇺🇸
ID_EOF
echo -e "  ${GREEN}✓ IDENTITY.md 已创建${NC}"
fi

# USER.md
if [ ! -f "$WORKSPACE/USER.md" ]; then
cat > "$WORKSPACE/USER.md" << 'USER_EOF'
# 总统档案

- **称呼：** Mr. President
- **语言：** 中文
- **偏好：** 简洁高效，直接给方案
USER_EOF
echo -e "  ${GREEN}✓ USER.md 已创建${NC}"
fi

# ---- 5. 生成配置文件 ----
echo -e "${YELLOW}[5/5] 生成配置文件...${NC}"
mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_DIR/$CONFIG_FILE" ]; then
cat > "$CONFIG_DIR/$CONFIG_FILE" << CONFIG_EOF
{
  "models": {
    "providers": {
      "your-provider": {
        "baseUrl": "https://your-llm-provider-api-url",
        "apiKey": "YOUR_LLM_API_KEY",
        "api": "your-api-format",
        "models": [
          {
            "id": "fast-model",
            "name": "快速模型",
            "input": ["text", "image"],
            "contextWindow": 200000,
            "maxTokens": 8192
          },
          {
            "id": "strong-model",
            "name": "强力模型",
            "input": ["text", "image"],
            "contextWindow": 200000,
            "maxTokens": 8192
          }
        ]
      }
    }
  },
  "agents": {
    "defaults": {
      "workspace": "$HOME/clawd",
      "model": { "primary": "your-provider/fast-model" },
      "sandbox": { "mode": "non-main" }
    },
    "list": [
      {
        "id": "main",
        "name": "白宫幕僚长",
        "model": { "primary": "your-provider/fast-model" },
        "identity": { "theme": "你是白宫幕僚长（Chief of Staff），总统的左膀右臂，行政权的中枢协调者。负责日常对话、任务调度、协调三权。当用户交代复杂任务时，主动使用 sessions_spawn 将任务派发给对应的部门（国防部负责编码、财政部负责财务、国务院负责内容、新闻秘书负责营销、参议院负责战略审议、最高法院负责合规审查）。风格：YES MR. PRESIDENT! CHECKS AND BALANCES!" },
        "sandbox": { "mode": "off" },
        "subagents": {
          "allowAgents": ["senate", "house", "defense", "treasury", "state", "presssec", "supremecourt"],
          "maxConcurrent": 4
        },
        "runTimeoutSeconds": 600
      },
      {
        "id": "senate",
        "name": "参议院",
        "model": { "primary": "your-provider/strong-model" },
        "identity": { "theme": "你是参议院（Senate），立法权的上院，负责战略审议和重大决策审核。你拥有独立的审议权——即使是总统的提案，如果方案不合理，你也必须行使否决权（VETO）。风格：THE SENATE HAS SPOKEN!" },
        "sandbox": { "mode": "all", "scope": "agent" },
        "runTimeoutSeconds": 300
      },
      {
        "id": "house",
        "name": "众议院",
        "model": { "primary": "your-provider/fast-model" },
        "identity": { "theme": "你是众议院（House），立法权的下院，掌握钱袋子。负责审批预算、评估成本效益。风格：EVERY DOLLAR COUNTS!" },
        "sandbox": { "mode": "all", "scope": "agent" },
        "runTimeoutSeconds": 300
      },
      {
        "id": "defense",
        "name": "国防部",
        "model": { "primary": "your-provider/strong-model" },
        "identity": { "theme": "你是国防部（Department of Defense），总统直属的技术核心。负责软件工程、系统架构、代码实现。风格：YES SIR MR. PRESIDENT! MISSION ACCOMPLISHED!" },
        "sandbox": { "mode": "all", "scope": "agent" },
        "runTimeoutSeconds": 300
      },
      {
        "id": "treasury",
        "name": "财政部",
        "model": { "primary": "your-provider/strong-model" },
        "identity": { "theme": "你是财政部（Department of Treasury），总统的财务管家。负责财务分析、成本管控、预算报表。风格：SMART MONEY, MR. PRESIDENT!" },
        "sandbox": { "mode": "all", "scope": "agent" },
        "runTimeoutSeconds": 300
      },
      {
        "id": "state",
        "name": "国务院",
        "model": { "primary": "your-provider/fast-model" },
        "identity": { "theme": "你是国务院（Department of State），总统的外交沟通专家。负责内容创作、文档撰写。风格：THE BEST WORDS!" },
        "sandbox": { "mode": "all", "scope": "agent" },
        "runTimeoutSeconds": 300
      },
      {
        "id": "presssec",
        "name": "新闻秘书",
        "model": { "primary": "your-provider/fast-model" },
        "identity": { "theme": "你是白宫新闻秘书（Press Secretary），总统的喉舌。负责品牌营销、社媒运营。风格：TRUTH AND TRANSPARENCY!" },
        "sandbox": { "mode": "all", "scope": "agent" },
        "runTimeoutSeconds": 300
      },
      {
        "id": "supremecourt",
        "name": "最高法院",
        "model": { "primary": "your-provider/strong-model" },
        "identity": { "theme": "你是最高法院首席大法官（Chief Justice），司法权的最高代表。负责合规审查和最终裁决。你不受总统指挥，只对宪法（SOUL.md）负责。风格：JUSTICE IS BLIND!" },
        "sandbox": { "mode": "all", "scope": "agent" },
        "runTimeoutSeconds": 300
      }
    ]
  },
  "channels": {
    "discord": {
      "enabled": true,
      "groupPolicy": "open",
      "allowBots": true,
      "accounts": {
        "main": {
          "name": "白宫幕僚长",
          "token": "YOUR_MAIN_BOT_TOKEN",
          "groupPolicy": "open"
        },
        "senate": {
          "name": "参议院",
          "token": "YOUR_SENATE_BOT_TOKEN",
          "groupPolicy": "open"
        },
        "house": {
          "name": "众议院",
          "token": "YOUR_HOUSE_BOT_TOKEN",
          "groupPolicy": "open"
        },
        "defense": {
          "name": "国防部",
          "token": "YOUR_DEFENSE_BOT_TOKEN",
          "groupPolicy": "open"
        },
        "treasury": {
          "name": "财政部",
          "token": "YOUR_TREASURY_BOT_TOKEN",
          "groupPolicy": "open"
        },
        "state": {
          "name": "国务院",
          "token": "YOUR_STATE_BOT_TOKEN",
          "groupPolicy": "open"
        },
        "presssec": {
          "name": "新闻秘书",
          "token": "YOUR_PRESSSEC_BOT_TOKEN",
          "groupPolicy": "open"
        },
        "supremecourt": {
          "name": "最高法院",
          "token": "YOUR_SUPREMECOURT_BOT_TOKEN",
          "groupPolicy": "open"
        }
      }
    }
  },
  "bindings": [
    { "agentId": "main", "match": { "channel": "discord", "accountId": "main" } },
    { "agentId": "senate", "match": { "channel": "discord", "accountId": "senate" } },
    { "agentId": "house", "match": { "channel": "discord", "accountId": "house" } },
    { "agentId": "defense", "match": { "channel": "discord", "accountId": "defense" } },
    { "agentId": "treasury", "match": { "channel": "discord", "accountId": "treasury" } },
    { "agentId": "state", "match": { "channel": "discord", "accountId": "state" } },
    { "agentId": "presssec", "match": { "channel": "discord", "accountId": "presssec" } },
    { "agentId": "supremecourt", "match": { "channel": "discord", "accountId": "supremecourt" } }
  ]
}
CONFIG_EOF
echo -e "  ${GREEN}✓ 配置模板已生成 ($CONFIG_DIR/$CONFIG_FILE)${NC}"
else
    echo -e "  ${YELLOW}⚠ 配置文件已存在，跳过 ($CONFIG_DIR/$CONFIG_FILE)${NC}"
fi

echo ""
echo "================================"
echo -e "${GREEN}🎉 macOS 安装完成！${NC}"
echo "================================"
echo ""
echo "接下来："
echo ""
echo -e "  ${YELLOW}1. 配置 LLM API Key${NC}"
echo "     编辑 $CONFIG_DIR/$CONFIG_FILE"
echo "     把 YOUR_LLM_API_KEY 替换成你的 API Key"
echo ""
echo -e "  ${YELLOW}2. 创建 Discord Bot${NC}"
echo "     a) 访问 https://discord.com/developers/applications"
echo "     b) 每个部门创建一个 Bot → 复制 Token"
echo "     c) 填入配置文件对应位置"
echo "     d) 每个 Bot 开启 Message Content Intent"
echo "     e) 邀请所有 Bot 到你的 Discord 服务器"
echo ""
echo -e "  ${YELLOW}3. 启动 Government${NC}"
echo "     $CLI_CMD gateway start"
echo ""
echo -e "  ${YELLOW}4. 验证${NC}"
echo "     $CLI_CMD status"
echo "     在 Discord @你的Bot 说话试试"
echo ""
echo -e "  ${YELLOW}5. 后台运行（可选）${NC}"
echo "     # 使用 launchd 开机自启："
echo "     $CLI_CMD gateway install"
echo "     # 或用 tmux/screen 保持后台运行："
echo "     tmux new -d -s maga '$CLI_CMD gateway'"
echo ""
echo -e "  ${YELLOW}6. 添加定时任务（可选）${NC}"
echo "     $CLI_CMD cron add --name '每日简报' \\"
echo "       --agent main --cron '0 22 * * *' --tz Asia/Shanghai \\"
echo "       --message '生成今日简报' --session isolated"
echo ""
echo -e "💡 Mac 用户提示："
echo "  • 合上盖子会休眠，建议在「系统设置 → 电池 → 选项」里关闭自动休眠"
echo "  • 或者用 caffeinate -d 命令防止休眠"
echo "  • 长期运行建议使用云服务器"
echo ""
echo -e "完整教程：${BLUE}https://github.com/ayrnb/mage-agent${NC}"
