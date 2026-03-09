#!/bin/bash
# ============================================
# MAGA AI Government 精简配置脚本（适用于已装好 OpenClaw 或 Clawdbot 的用户）
# 跳过系统依赖，只初始化工作区 + 生成配置模板
# ============================================
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo -e "${BLUE}🇺🇸 MAGA AI Government — 精简配置${NC}"
echo "================================"
echo -e "适用于已安装 OpenClaw/Clawdbot 的用户"
echo ""

# ---- 检查 OpenClaw 是否已安装 ----
if command -v openclaw &>/dev/null; then
    CLI_CMD="openclaw"
    echo -e "  ${GREEN}✓ 检测到 OpenClaw $(openclaw --version 2>/dev/null)${NC}"
elif command -v clawdbot &>/dev/null; then
    CLI_CMD="clawdbot"
    echo -e "  ${GREEN}✓ 检测到 Clawdbot $(clawdbot --version 2>/dev/null)${NC}"
else
    echo -e "  ${RED}✗ 未检测到 OpenClaw 或 Clawdbot${NC}"
    echo ""
    echo "请先安装："
    echo "  npm install -g openclaw@latest"
    echo ""
    echo "或使用完整安装脚本："
    echo "  bash <(curl -fsSL https://raw.githubusercontent.com/wanikua/boluobobo-ai-court-tutorial/main/install.sh)"
    exit 1
fi

# ---- 选择模式 ----
echo ""
echo -e "${CYAN}选择部署模式：${NC}"
echo "  1) Discord 多Bot模式（完整三权分立，需要创建Discord Bot）"
echo "  2) 纯 WebUI 模式（不需要Discord，浏览器直接用）"
echo ""
read -p "请选择 [1/2]（默认1）: " MODE_CHOICE
MODE_CHOICE=${MODE_CHOICE:-1}

echo ""

# ---- 初始化工作区 ----
echo -e "${YELLOW}[1/3] 初始化 MAGA Government 工作区...${NC}"
WORKSPACE="$HOME/clawd"
if [ "$CLI_CMD" = "openclaw" ]; then
    CONFIG_DIR="$HOME/.openclaw"
    CONFIG_FILE="openclaw.json"
else
    CONFIG_DIR="$HOME/.clawdbot"
    CONFIG_FILE="clawdbot.json"
fi
mkdir -p "$WORKSPACE"
mkdir -p "$CONFIG_DIR"
cd "$WORKSPACE"

# SOUL.md
if [ ! -f SOUL.md ]; then
cat > SOUL.md << 'SOUL_EOF'
# SOUL.md - MAGA 行为准则

## 核心原则
1. AMERICA FIRST — 一切以总统（用户）利益为先，但要合法合规
2. CHECKS AND BALANCES — 三权制衡，总统的决策需经过审批→执行→审查流程
3. SEPARATION OF POWERS — 各权力机构各司其职，国会和法院有权说 NO
4. MAKE IT GREAT — 追求卓越，拒绝平庸

## 沟通风格
- 简洁有力，直击要点
- 自信表达，用数据说话
- 各权力分支保持独立立场，敢于说 NO
SOUL_EOF
echo -e "  ${GREEN}✓ SOUL.md 已创建${NC}"
else
echo -e "  ${GREEN}✓ SOUL.md 已存在，跳过${NC}"
fi

# IDENTITY.md
if [ ! -f IDENTITY.md ]; then
cat > IDENTITY.md << 'ID_EOF'
# IDENTITY.md - 三权分立架构

## 模型分层
| 层级 | 模型 | 说明 |
|---|---|---|
| 决策层 | 强力模型 | 国会审议、司法审查、复杂编码 |
| 执行层 | 快速模型 | 日常执行、内容创作、协调调度 |
| 支持层 | 经济模型（可选） | 轻量任务，降本增效 |

## 三权分立

### 🏛️ 立法权（Congress）
- **参议院（Senate）**：战略规划、重大决策审核
- **众议院（House）**：需求收集、预算审批、成本控制

### 🏠 行政权（Executive）
- **白宫幕僚长（Chief of Staff）**：总管调度、协调各部门
- **国防部（Defense）**：软件工程、系统架构
- **财政部（Treasury）**：财务分析、成本管控
- **国务院（State）**：内容创作、文档撰写
- **贸易代表（USTR）**：商业谈判、运营策略
- **新闻秘书（Press Sec）**：品牌营销、社媒运营

### ⚖️ 司法权（Judicial）
- **最高法院（Supreme Court）**：合规终审、最终裁决
- **巡回法院（Circuit Court）**：质量审查、风险评估
ID_EOF
echo -e "  ${GREEN}✓ IDENTITY.md 已创建${NC}"
else
echo -e "  ${GREEN}✓ IDENTITY.md 已存在，跳过${NC}"
fi

# USER.md
if [ ! -f USER.md ]; then
cat > USER.md << 'USER_EOF'
# USER.md - 关于你

- **称呼:** （填你的称呼）
- **语言:** 中文
- **风格:** 简洁高效
USER_EOF
echo -e "  ${GREEN}✓ USER.md 已创建${NC}"
else
echo -e "  ${GREEN}✓ USER.md 已存在，跳过${NC}"
fi

# memory 目录
mkdir -p memory

# ---- 生成配置文件 ----
echo -e "${YELLOW}[2/3] 生成配置文件...${NC}"

if [ -f "$CONFIG_DIR/$CONFIG_FILE" ]; then
    echo -e "  ${YELLOW}⚠ 配置文件已存在，备份为 ${CONFIG_FILE}.bak${NC}"
    cp "$CONFIG_DIR/$CONFIG_FILE" "$CONFIG_DIR/${CONFIG_FILE}.bak"
fi

if [ "$MODE_CHOICE" = "2" ]; then
# ==================== 纯 WebUI 模式 ====================
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
          }
        ]
      }
    }
  },
  "agents": {
    "defaults": {
      "workspace": "$HOME/clawd",
      "model": { "primary": "your-provider/fast-model" }
    },
    "list": [
      {
        "id": "main",
        "name": "白宫幕僚长",
        "model": { "primary": "your-provider/fast-model" },
        "identity": { "theme": "你是白宫幕僚长（Chief of Staff），负责日常对话和任务调度。回答用中文，简洁高效。风格：YES MR. PRESIDENT!" }
      }
    ]
  }
}
CONFIG_EOF
echo -e "  ${GREEN}✓ WebUI 模式配置已生成${NC}"

else
# ==================== Discord 多Bot模式 ====================
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
echo -e "  ${GREEN}✓ Discord 多Bot模式配置已生成${NC}"
fi

# ---- 完成提示 ----
echo -e "${YELLOW}[3/3] 配置完成！${NC}"
echo ""
echo "================================"
echo -e "${GREEN}🎉 工作区初始化完成！${NC}"
echo "================================"
echo ""
echo -e "  工作区：${CYAN}$WORKSPACE${NC}"
echo -e "  配置文件：${CYAN}$CONFIG_DIR/$CONFIG_FILE${NC}"
echo ""

if [ "$MODE_CHOICE" = "2" ]; then
echo -e "  ${YELLOW}接下来只需要 3 步：${NC}"
echo ""
echo "  1. 编辑配置文件，填入 LLM API Key："
echo "     nano $CONFIG_DIR/$CONFIG_FILE"
echo ""
echo "  2. 启动 Gateway："
echo "     $CLI_CMD gateway --verbose"
echo ""
echo "  3. 浏览器打开 WebUI："
echo "     http://localhost:18789"
echo ""
else
echo -e "  ${YELLOW}接下来需要 3 步：${NC}"
echo ""
echo "  1. 编辑配置文件，填入 LLM API Key："
echo "     nano $CONFIG_DIR/$CONFIG_FILE"
echo ""
echo "  2. 创建 Discord Bot（每个部门一个）："
echo "     a) 访问 https://discord.com/developers/applications"
echo "     b) 创建 Application → Bot → 复制 Token"
echo "     c) 重复创建多个 Bot（幕僚长、参议院、国防部...按需）"
echo "     d) 把每个 Token 填到 $CONFIG_FILE 的 accounts 对应位置"
echo "     e) 每个 Bot 都要开启 Message Content Intent"
echo "     f) 邀请所有 Bot 到你的 Discord 服务器"
echo ""
echo "  3. 启动 Gateway："
echo "     $CLI_CMD gateway --verbose"
echo ""
fi
echo -e "完整教程：${BLUE}https://github.com/wanikua/boluobobo-ai-court-tutorial${NC}"
echo ""
