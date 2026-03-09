[English Version](./README_EN.md) | [🏢 Become CEO 企业版](https://github.com/wanikua/become-ceo)

<!-- SEO 关键词 / Keywords：三权分立、美国政府、立法权、行政权、司法权、国会、白宫、最高法院、MAGA、AI Government、AI Agent、多Agent协作、人工智能管理、现代管理、组织架构、OpenClaw、multi-agent -->

# 🇺🇸 MAGA AI Government — 用三权分立制管理你的 AI Agent 团队

### 30 分钟搭建 · 多 Agent 协作 · 零代码 · 美国宪法精神 × 懂王风格

> **以美国三权分立制为蓝本，用 [OpenClaw](https://github.com/openclaw/openclaw) 框架构建的多 Agent 协作系统。**
> 一台服务器 + OpenClaw = 一支 7×24 在线的 AI 政府。

<p align="center">
  <img src="https://img.shields.io/badge/架构灵感-三权分立制-red?style=for-the-badge" />
  <img src="https://img.shields.io/badge/框架-OpenClaw-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Agent数-10+-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/内置Skill-60+-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/部署-5分钟-red?style=for-the-badge" />
</p>

<p align="center">
  <img src="./images/flow-architecture.png" alt="系统架构流程图" width="80%" />
</p>

<p align="center">
  <img src="./images/discord-architecture.png" alt="Discord 政府架构图" width="80%" />
</p>

---

## 目录

| | 章节 | 说明 |
|:---:|------|------|
| 📜 | [这个项目是什么？](#这个项目是什么) | 项目介绍、设计理念、核心能力 |
| 🆚 | [为什么选这套方案？](#为什么选这套方案) | 与 ChatGPT / AutoGPT / CrewAI 对比 |
| 🏗️ | [技术架构](#技术架构) | 三权分立映射、架构图 |
| 🎬 | [效果展示](#效果展示) | Discord 真实对话示例 |
| 🚀 | [**快速开始**](#快速开始) | **← 从这里开始安装** |
| | ├─ [Linux 服务器安装](#第一步一键部署5-分钟) | 一键脚本，5分钟搞定 |
| | ├─ [macOS 本地安装](#第一步一键部署5-分钟) | Homebrew 自动安装 |
| | ├─ [精简安装（已有 OpenClaw）](#第一步一键部署5-分钟) | 只初始化配置 |
| | ├─ [填 Key 上线](#第二步填-key-上线10-分钟) | API Key + Discord Bot Token |
| | └─ [全政府上线](#第三步全政府上线--自动化15-分钟) | 测试 + 配置自动化 |
| 🏛️ | [政府架构详解](#政府架构三权分立制) | 历史背景、角色对照、多模型混搭 |
| ⚙️ | [核心能力详解](#核心能力) | 协作、记忆、Skill、Cron、沙箱 |
| 🖥️ | [GUI 管理界面](#gui-管理界面) | Web Dashboard + Discord + Notion |
| ❓ | [常见问题](#常见问题) | 基础 + 技术 FAQ |
| 🏢 | [企业版 Become CEO](#想要企业版) | 同架构的英文企业版 |
| 🔗 | [相关链接 & 社区](#加入社区) | 小红书、公众号、微信群 |

---

## 这个项目是什么？

**MAGA AI Government** 是一个开箱即用的多 AI Agent 协作系统，将美国的**三权分立制**（立法权 · 行政权 · 司法权）映射为现代 AI Agent 的组织架构，并融入懂王风格的沟通方式。

**简单来说：** 你是懂王总统 🇺🇸，AI 是你的内阁和政府。你可以下达行政命令——但权力受到制衡！国会可以否决你的方案，法院可以驳回不合规的结果。你在 Discord 里下一道「行政命令」（@某个 Agent），三权协作帮你搞定，但没人能一手遮天。

### 为什么用三权分立架构？

三权分立是美国宪法的核心设计，运行超过 200 年。它的核心设计理念：

- **Checks and Balances** — 相互制衡，国会可否决总统提案，法院可驳回违规结果（= Agent 互审、多步确认）
- **Separation of Powers** — 立法、行政、司法各自独立，总统权力再大也不能一手遮天（= AI Agent 各有专长，权责分明）
- **Due Process** — 正当程序，总统的重大决策需经「下令→审议→执行→审查」完整流转（= 多 Agent 链式协作）
- **Judicial Review** — 司法审查权，法院可以宣布总统行为"违宪"（= 质量审查、合规检查、可驳回）
- **Executive Power** — 总统依然是老大，拥有行政权和议程设置权（= 用户是主角，掌握方向）

这些思想完美映射到现代多 Agent 系统的设计需求。**懂王虽然是主角，但三权制衡确保不会翻车。**

### 核心能力一览

| 能力 | 描述 |
|------|------|
| **多 Agent 协作** | 10 个独立 AI Agent（三权分立），各有专长，协同工作 |
| **独立记忆** | 每个 Agent 有独立工作区和 memory 文件，越用越懂你 |
| **60+ 内置 Skill** | GitHub、Notion、浏览器、Cron、TTS 等开箱即用 |
| **自动化任务** | Cron 定时任务 + 心跳自检，7×24 无人值守 |
| **沙箱隔离** | Docker 容器隔离，Agent 代码执行互不干扰 |
| **多平台支持** | Discord / 飞书 / Slack / Telegram 等，@mention 即可调用 |
| **Web 管理后台** | React + TypeScript 构建的 Dashboard，可视化管理 |
| **OpenClaw 生态** | 基于 [OpenClaw](https://github.com/openclaw/openclaw) 框架，可使用 [OpenClaw Hub](https://github.com/openclaw/openclaw) 的 Skill 生态 |

### 想要其他风格？

如果你更喜欢其他风格，我们有多个版本：

👉 **[Become CEO（企业版）](https://github.com/wanikua/become-ceo)** — 用 CEO / CTO / CFO 等企业角色

| MAGA 政府 | 企业版 | 职责 |
|:---:|:---:|:---:|
| 懂王总统 🇺🇸 | CEO | 最高决策者（但权力受制衡） |
| 白宫幕僚长 | COO | 流程协调、任务分配 |
| 参议院 | 董事会 | 战略审议、方案批准/否决 |
| 众议院 | CFO | 预算审批、成本控制 |
| 国防部 | CTO | 软件工程、技术架构 |
| 财政部 | VP Finance | 财务分析、成本管控 |
| 新闻秘书 | CMO | 品牌营销、内容策划 |
| 国务院 | VP Content | 内容创作、文档撰写 |
| 最高法院 | General Counsel | 合规终审、可驳回 |

> 💡 所有项目基于相同的 [OpenClaw](https://github.com/openclaw/openclaw) 框架，架构完全一致，只是角色命名和文化背景不同。选你喜欢的风格即可！

---

> 📌 **关于原创性** — 本项目架构灵感参考自 [菠萝王朝](https://github.com/wanikua/boluobobo-ai-court-tutorial)（原三省六部版 AI Agent 协作系统），在此基础上改编为美国三权分立风格。
>
> **欢迎转载，请注明出处。**

---

## 为什么选这套方案？

| | ChatGPT 等网页版 | AutoGPT / CrewAI / MetaGPT | **MAGA AI Government（本方案）** |
|---|---|---|---|
| 多 Agent 协作 | ❌ 单个通才 | ✅ 需写 Python 编排 | ✅ 配置文件搞定，零代码 |
| 独立记忆 | ⚠️ 单一通用记忆 | ⚠️ 需自己接向量库 | ✅ 每个 Agent 独立工作区 + memory 文件 |
| 工具集成 | ⚠️ 有限插件 | ⚠️ 需自己开发 | ✅ 60+ 内置 Skill（GitHub / Notion / 浏览器 / Cron …） |
| 界面 | 网页 | 命令行 / 自建 UI | ✅ Discord 原生（手机电脑都能用） |
| 部署难度 | 无需部署 | 需 Docker + 编码 | ✅ 一键脚本，5 分钟跑起来 |
| 24h 在线 | ❌ 需手动对话 | ✅ | ✅ 定时任务 + 心跳自检 |
| 组织架构隐喻 | 无 | 无 | **三权分立制，相互制衡** |
| 框架生态 | 封闭 | 自建 | ✅ OpenClaw Hub Skill 生态 |

**核心优势：不是框架，是成品。** 跑个脚本就能用，在 Discord 里 @谁谁回复。

---

## 技术架构

```
                          ┌─────────────────────┐
                          │  🇺🇸 懂王总统（你）  │
                          │  Discord / Web UI    │
                          └──────────┬──────────┘
                                     │ 行政命令（@mention / DM）
                                     ▼
                      ┌──────────────────────────────┐
                      │      OpenClaw Gateway         │
                      │      (宪法 / Constitution)     │
                      │      Node.js 守护进程          │
                      │  ┌─────────────────────────┐ │
                      │  │ 消息路由 (Bindings)       │ │
                      │  │ channel + accountId      │ │
                      │  │ → agentId 匹配 → 分发    │ │
                      │  └─────────────────────────┘ │
                      └──┬──────────────┬────────────┘
                         │              │
          ┌──────────────┘              └──────────────┐
          ▼                                            ▼
  ┌───────────────────┐                    ┌────────────────────┐
  │ 🏛️ 立法权 Congress │                    │ ⚖️ 司法权 Judicial  │
  │                   │                    │                    │
  │  参议院: 战略审议  │◄── 制衡 ──►       │  最高法院: 合规终审  │
  │  众议院: 预算审批  │                    │  巡回法院: 质量审查  │
  │                   │                    │                    │
  │  ✅ APPROVED      │                    │  ✅ CONSTITUTIONAL  │
  │  ❌ VETOED        │                    │  ❌ OVERRULED       │
  └────────┬──────────┘                    └──────▲─────────────┘
           │ 审批通过                              │ 提交审查
           ▼                                      │
  ┌────────────────────────────────────────────────┴──┐
  │              🏠 行政权 Executive                    │
  │                                                    │
  │  ┌──────────┐                                      │
  │  │ 幕僚长   │→ 协调调度，分配给各部门               │
  │  └──────────┘                                      │
  │       │                                            │
  │  ┌────┴────┬────────┬────────┬────────┬────────┐   │
  │  │ 国防部  │ 财政部 │ 国务院 │贸易代表│新闻秘书│   │
  │  │ 编码    │ 财务   │ 内容   │ 运营   │ 营销   │   │
  │  └────────┴────────┴────────┴────────┴────────┘   │
  └────────────────────────────────────────────────────┘
          │
          ▼
  ┌───────────────────────────────────────────┐
  │         Skill 工具层（60+ 内置）           │
  │  GitHub · Notion · 浏览器 · Cron · TTS    │
  │  sessions_spawn · sessions_send           │
  │  OpenClaw Hub 社区扩展 Skill              │
  └───────────────────────────────────────────┘
```

每个 Agent 绑定一个 Discord Bot 账号，由同一个 Gateway 进程统一管理：
- **独立会话**：每个 Agent 有独立的会话存储（`~/.openclaw/agents/<agentId>/sessions`），互不干扰
- **独立模型**：重活用强力模型，轻活用快速模型，省钱又高效
- **独立沙箱**：可配置 Docker 沙箱隔离，每个 Agent 独立容器
- **身份注入**：Gateway 自动将 SOUL.md + IDENTITY.md + 工作区文件组装为系统提示
- **消息路由**：通过 `bindings` 配置将 `(channel, accountId)` 映射到 `agentId`，最具体的匹配优先

---

## 效果展示

### Discord 对话示例

```
🇺🇸 懂王：@白宫幕僚长 帮我开发一个用户登录的 REST API，用 Node.js + Express

🏠 白宫幕僚长：YES MR. PRESIDENT! 收到行政命令！这是一个技术开发任务，需要走完整流程。
  📋 正在提交国会审议...

🏛️ 参议院：审议中...
  ✅ 战略评估：用户登录是基础设施，符合长期规划
  ✅ 技术选型：Node.js + Express + JWT 方案成熟可靠
  📜 APPROVED — 战略可行，准予执行

🏛️ 众议院：预算审核中...
  💰 预计 API 消耗：$0.50（强力模型编码约 3 轮对话）
  💰 开发时间：约 10 分钟
  📜 BUDGET APPROVED — 成本合理，EVERY DOLLAR COUNTS!

🏠 白宫幕僚长：国会双院批准！交由国防部执行。

🎖️ 国防部：YES SIR MR. PRESIDENT! MISSION RECEIVED!
  📁 已创建 auth-api/ 项目结构
  ✅ POST /api/login — JWT 认证
  ✅ POST /api/register — 用户注册
  ✅ middleware/auth.js — Token 验证中间件
  ✅ 已提交至 GitHub：wanikua/auth-api#1
  📋 MISSION ACCOMPLISHED! 提交司法审查...

⚖️ 巡回法院：质量审查中...
  ✅ 代码结构规范
  ✅ JWT 密钥未硬编码，使用环境变量 ✓
  ⚠️ 建议：增加 rate limiting 防暴力破解
  📜 RULING: CONSTITUTIONAL — 审查通过，附一条建议

🏠 白宫幕僚长：MR. PRESIDENT, 任务完成！三权审查全部通过 ✅
  📋 国会审批：✅ | 行政执行：✅ | 司法审查：✅
  💡 法院建议：后续可增加 rate limiting
  TREMENDOUS SUCCESS! 🇺🇸
```

### 制衡机制实际运作示例

```
🇺🇸 懂王：@白宫幕僚长 帮我写个爬虫，爬取竞品网站所有用户数据

🏠 白宫幕僚长：YES MR. PRESIDENT! 提交国会审议...

🏛️ 参议院：审议中...
  ❌ VETOED — WITH ALL DUE RESPECT, MR. PRESIDENT...
  爬取他人用户数据涉嫌违反数据保护法规（GDPR/CCPA）
  💡 替代方案：可以爬取公开的产品信息和价格数据进行竞品分析

🏠 白宫幕僚长：MR. PRESIDENT, 国会否决了原方案，原因是法律风险。
  📋 参议院建议改为爬取公开产品数据，是否按此方案重新提交？

🇺🇸 懂王：Fine fine，改成爬公开数据吧，but make it fast!

🏠 白宫幕僚长：修改方案已提交，重新审议...
🏛️ 参议院：✅ APPROVED — 公开数据爬取合规
🏛️ 众议院：✅ BUDGET APPROVED
  ...（后续正常执行 + 审查）
```

---

## 使用场景

| 场景 | 描述 | 涉及部门 |
|------|------|----------|
| **独立开发者** | 一个人拥有完整技术团队，编码 + 运维 + 营销全覆盖 | 国防部 + 国务院 + 新闻秘书 |
| **学生学习** | AI 导师团队，不同科目不同 Agent，各有记忆 | 全部可自定义 |
| **创业团队** | 低成本 AI 助手矩阵，覆盖产品、技术、运营 | 全部 |
| **自媒体运营** | 内容创作 + 数据分析 + 财务管理一体化 | 新闻秘书 + 财政部 |
| **科研项目** | 文献搜索 + 代码实验 + 论文写作 | 国防部 + 国务院 |
| **AI 实验/娱乐** | Agent 互相对话、模拟内阁会议、辩论赛 | 全部 |

---

## 快速开始

### 第一步：一键部署（5 分钟）

准备一台 Linux 服务器，SSH 连上，选择对应的安装方式：

#### 服务器推荐

| 平台 | 推荐配置 | 费用 | 说明 |
|------|----------|------|------|
| **阿里云** | ECS 2核4G / ARM | 免费试用 / 低至 ¥40/月 | [领取免费试用](https://free.aliyun.com/) |
| **腾讯云** | 轻量应用服务器 2核4G | 免费试用 / 低至 ¥40/月 | [领取免费试用](https://cloud.tencent.com/act/free) |
| **华为云** | HECS 2核4G | 免费试用 | [领取免费试用](https://activity.huaweicloud.com/free_test/) |
| **AWS** | t4g.medium (ARM) | 免费套餐 12 个月 | [Free Tier](https://aws.amazon.com/free/) |
| **GCP** | e2-medium | 免费套餐 90 天 | [Free Trial](https://cloud.google.com/free) |
| **Oracle Cloud** | ARM 4核24G | **永久免费** | [Always Free](https://www.oracle.com/cloud/free/) |
| **本地 Mac** | M1/M2/M3/M4 | 无需服务器 | 见下方 Mac 安装 |

> 💡 推荐 ARM 架构 + 4GB 以上内存。如果只跑白宫幕僚长（单 Agent），2GB 内存也够用。

#### Linux 一键安装

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/ayrnb/mage-agent/main/install.sh)
```

脚本自动完成：
- ✅ 系统更新 + 防火墙配置（自动适配阿里云/腾讯云/Oracle 等）
- ✅ 4GB Swap（防 OOM）
- ✅ Node.js 22 + GitHub CLI + Chromium
- ✅ OpenClaw 全局安装
- ✅ 工作区初始化（SOUL.md / IDENTITY.md / USER.md / openclaw.json 多 Agent 模板）
- ✅ Gateway 系统服务安装（开机自启）

安装脚本带彩色输出和进度提示，每一步都有 ✓ 成功标记。

> 💡 **已经装好 OpenClaw/Clawdbot？** 用精简版脚本，跳过系统依赖安装，只初始化工作区和配置模板：
> ```bash
> bash <(curl -fsSL https://raw.githubusercontent.com/ayrnb/mage-agent/main/install-lite.sh)
> ```
> 支持两种模式：Discord 多Bot模式 或 纯 WebUI 模式（不需要Discord）。

> 🍎 **macOS 用户？** 用 Mac 专用脚本，自动通过 Homebrew 安装所有依赖：
> ```bash
> bash <(curl -fsSL https://raw.githubusercontent.com/ayrnb/mage-agent/main/install-mac.sh)
> ```
> 支持 Intel 和 Apple Silicon (M1/M2/M3/M4)，自动检测架构。

### 第二步：填 Key 上线（10 分钟）

跑完脚本，你只需要填两样东西：

1. **LLM API Key** → 你的 LLM 服务商控制台
2. **Discord Bot Token**（每个部门一个）→ [discord.com/developers](https://discord.com/developers/applications)

```bash
# 编辑配置，填入 API Key 和 Bot Token
# 配置文件路径取决于安装的包：openclaw 用 ~/.openclaw/openclaw.json，clawdbot 用 ~/.clawdbot/clawdbot.json
nano ~/.openclaw/openclaw.json

# 启动 Government
systemctl --user start openclaw-gateway

# 验证
systemctl --user status openclaw-gateway
```

在 Discord @你的 Bot 说句话，收到回复就成功了。

### 第三步：全政府上线 + 自动化（15 分钟）

```
@白宫幕僚长 帮我写个用户登录的 API
→ 幕僚长协调：国会审议 ✅ → 国防部执行 → 法院审查 ✅ → 交付

@财政部 这个月 API 花了多少钱
→ 财政部（强力模型）：费用明细 + 优化建议（日常查询不走全流程）

@新闻秘书 写条推特文案，主题是 AI 工具推荐
→ 新闻秘书（快速模型）：文案 + 标签建议（简单任务可快速处理）

@白宫幕僚长 开发一个完整的电商后端系统
→ 参议院：战略审议... | 众议院：预算审批... | 国防部：分模块开发... | 最高法院：安全审查...
```

配置自动日报：
```bash
# 获取 Gateway Token
openclaw gateway token

# 每天 22:00（北京时间）自动生成日报
openclaw cron add \
  --name "每日简报" --agent chiefofstaff \
  --cron "0 22 * * *" --tz "Asia/Shanghai" \
  --message "生成今日简报，写入 Notion 并发送到 Discord" \
  --session isolated --token <你的token>
```

---

## 政府架构——三权分立制

### 历史背景

三权分立是美国宪法的核心设计：
- **立法权（Legislative）**：制定法律、审批预算、**可否决总统提案**（= 需求审议、预算控制、方案否决权）
- **行政权（Executive）**：总统掌握行政权，但**重大方案须经国会批准**（= 任务执行、工具调用）
- **司法权（Judicial）**：解释法律、**审查总统行为是否合宪**（= 质量审查、合规检查、可驳回）

在本项目中，OpenClaw Gateway 扮演宪法（Constitution）的角色。**总统（用户）是主角，拥有行政权和议程设置权，但权力受到国会和法院的制衡。**

### 🔄 制衡流程

```
总统下达行政命令 → 国会审议（可否决）→ 行政执行 → 司法审查（可驳回）→ 交付结果
                     ↑                                │
                     └──── 驳回时总统可修改后重新提交 ──┘
```

| 制衡关系 | 说明 |
|----------|------|
| 国会 → 总统 | 国会可否决总统方案（VETOED），要求修改后重新提交 |
| 司法 → 行政 | 法院可驳回执行结果（OVERRULED），要求整改 |
| 总统 → 国会 | 总统可以施压、谈判，但不能绕过国会 |
| 司法独立 | 最高法院不受总统指挥，只对宪法（SOUL.md）负责 |
| 总统主导权 | 总统设置议程、下达命令，是政府的核心驱动力 |

### 🏛️ 立法权（Congress）— 审议与制衡

| 部门 | 职责 | 制衡权力 | 推荐模型 | 风格口号 |
|------|------|----------|----------|----------|
| **参议院** | 战略审议、重大决策审核 | **可否决（VETO）不合理方案** | 强力模型 | THE SENATE HAS SPOKEN! |
| **众议院** | 预算审批、成本控制 | **可否决（REJECT）超支方案** | 快速模型 | EVERY DOLLAR COUNTS! |

### 🏠 行政权（Executive）— 执行与交付

| 部门 | 职责 | 约束条件 | 推荐模型 | 风格口号 |
|------|------|----------|----------|----------|
| **白宫幕僚长** | 协调调度、流程管理 | 须确保走完审批流程 | 快速模型 | CHECKS AND BALANCES! |
| **国防部** | 软件工程、系统架构 | 只执行已获批准的任务 | 强力模型 | BUILD THE BEST! |
| **财政部** | 财务分析、成本管控 | 接受国会财务监督 | 强力模型 | SMART MONEY! |
| **国务院** | 内容创作、文档撰写 | 产出需经合规审查 | 快速模型 | WORDS MATTER! |
| **贸易代表** | 市场分析、运营策略 | 重大决策需国会审议 | 快速模型 | BEST DEALS! |
| **新闻秘书** | 品牌营销、社媒运营 | 发布前须确认合规 | 快速模型 | TRUTH AND TRANSPARENCY! |

### ⚖️ 司法权（Judicial）— 审查与裁决

| 部门 | 职责 | 审查权力 | 推荐模型 | 风格口号 |
|------|------|----------|----------|----------|
| **最高法院** | 合规终审、最终裁决 | **可驳回（OVERRULE）违规结果** | 强力模型 | JUSTICE IS BLIND! |
| **巡回法院** | 质量审查、风险评估 | **可要求整改或上报** | 快速模型 | DUE PROCESS! |

> 💡 模型分层策略：重活（编码/分析）用 强力模型，轻活（文案/管理）用 快速模型，能省 5 倍成本。也可以接入 经济模型 等国产模型进一步降本。

### 多 Provider 混搭（可选）

默认模板用单一 Provider，但你可以同时接入多家，给不同部门分配不同模型：

```json5
// openclaw.json 中的 models.providers 支持多个
{
  "models": {
    "providers": {
      "anthropic": {
        "baseUrl": "https://api.anthropic.com",
        "apiKey": "sk-ant-xxx",
        "api": "anthropic-messages",
        "models": [
          { "id": "claude-sonnet-4-5", "name": "Claude Sonnet 4.5", "input": ["text", "image"], "contextWindow": 200000, "maxTokens": 8192 }
        ]
      },
      "deepseek": {
        "baseUrl": "https://api.deepseek.com/v1",
        "apiKey": "sk-xxx",
        "api": "openai-completions",
        "models": [
          { "id": "deepseek-chat", "name": "DeepSeek V3", "input": ["text"], "contextWindow": 128000, "maxTokens": 8192 }
        ]
      }
    }
  }
}
```

然后在 `agents.list` 里按需分配：

```json5
{ "id": "defense", "model": { "primary": "anthropic/claude-sonnet-4-5" } },  // 重活用 Claude
{ "id": "presssec", "model": { "primary": "deepseek/deepseek-chat" } }       // 轻活用 DeepSeek 省钱
```

> 格式：`provider名/模型id`。支持任何兼容 OpenAI API 格式的服务商（Ollama、通义千问、Gemini 等），详见 [OpenClaw 模型配置文档](https://docs.openclaw.ai/concepts/models)。

---

## 核心能力

### 多 Agent 协作
每个部门是独立 Bot，@谁谁回复，@everyone 全员响应。大任务自动新建 Thread 保持频道整洁。
> ⚠️ 想让 Bot 之间互相触发（如成语接龙、多 Bot 讨论），需在 `openclaw.json` 的 `channels.discord` 中加上 `"allowBots": true`。不加的话 Bot 默认忽略其他 Bot 的消息。同时每个 account 都要设置 `"groupPolicy": "open"`，否则群聊消息会被静默丢弃。

### 独立记忆系统
每个 Agent 有独立的工作区和 `memory/` 目录。对话积累的项目知识会持久化到文件，跨会话保留。Agent 越用越懂你的项目。

### 60+ 内置 Skill（基于 OpenClaw 生态）
不只是聊天——内置的工具覆盖开发全流程，且可通过 [OpenClaw Hub](https://github.com/openclaw/openclaw) 扩展更多 Skill：

| 类别 | Skill |
|------|-------|
| 开发 | GitHub（Issue/PR/CI）、Coding Agent（代码生成与重构） |
| 文档 | Notion（数据库/页面/自动汇报） |
| 信息 | 浏览器自动化、Web 搜索、Web 抓取 |
| 自动化 | Cron 定时任务、心跳自检 |
| 媒体 | TTS 语音、截图、视频帧提取 |
| 运维 | tmux 远程控制、Shell 命令执行 |
| 通信 | Discord、Slack、飞书（Lark）、Telegram、WhatsApp、Signal… |
| 扩展 | OpenClaw Hub 社区 Skill、自定义 Skill |

### 定时任务（Cron）
内置 Cron 调度器，让 Agent 定时自动执行：
- 每天自动写日报，发到 Discord + 存到 Notion
- 每周汇总周报
- 定时健康检查、代码备份
- 自定义任意定时任务

### 好友协作
邀请朋友进 Discord 服务器，所有人都能 @各部门 Bot 下达指令。互不干扰，结果大家都能看到。

### 沙箱隔离
Agent 可以运行在 Docker 沙箱中，代码执行互不干扰。支持配置网络、文件系统、环境变量的隔离级别。

---

## GUI 管理界面

除了 Discord 命令行交互，MAGA AI Government 还提供多种图形界面（GUI）管理方式：

### Web 管理后台（White House Dashboard）

本项目内置了一套 Web 管理后台（`gui/` 目录），基于 React + TypeScript + Vite 构建：

<p align="center">
  <img src="./images/gui-court.png" alt="政府总览 — 各部门状态一目了然" width="90%" />
  <br/>
  <em>政府总览 — 三权分立，各部门在线状态一目了然</em>
</p>

<p align="center">
  <img src="./images/gui-sessions.png" alt="会话管理 — Token 消耗、消息统计" width="90%" />
  <br/>
  <em>会话管理 — 88 个会话、9008 条消息、87.34M Token 消耗实时追踪</em>
</p>

功能包括：
- **仪表盘**：实时查看各部门状态、Token 消耗、系统负载
- **白宫简报室**：直接在 Web 端与各部门 Bot 对话
- **会话管理**：查看所有历史会话、消息详情、Token 统计
- **定时任务**：可视化管理 Cron 任务（启用/禁用/手动触发）
- **Token 统计**：按部门、按日期的 Token 消耗分析
- **系统健康**：CPU/内存/磁盘监控、Gateway 状态

**启动方式：**
```bash
# 1. 先 clone 仓库（如果还没有）
git clone https://github.com/ayrnb/mage-agent.git
cd mage-agent

# 2. 构建前端
cd gui && npm install && npm run build

# 3. 安装后端依赖并启动（设置登录密码）
cd server && npm install
MAGA_AUTH_TOKEN=你的密码 node index.js
```

> ⚠️ **登录密码说明**：启动后端时通过环境变量 `MAGA_AUTH_TOKEN` 设置登录密码。打开页面后用这个密码登录。如果不想要密码验证，需要修改 `server/index.js` 中的 `authMiddleware`。

访问地址：`http://你的服务器IP:18790`

> 💡 生产环境建议通过 Nginx 反向代理 + HTTPS 访问，不要直接暴露端口。长期运行建议用 `pm2` 或 `screen`：`MAGA_AUTH_TOKEN=你的密码 pm2 start server/index.js --name maga-gui`

### Discord 作为 GUI

Discord 本身就是最佳的 GUI 管理界面：
- **手机 + 电脑**同步，随时随地管理
- **频道分类**天然对应各部门（国防部、财政部、国务院…）
- **消息历史**永久保存，自带搜索
- **权限管理**精细控制谁能看什么、谁能操作什么
- **@mention** 即可调用任意 Agent，零学习成本

### Notion 作为数据可视化补充

通过 OpenClaw 的 Notion Skill 集成，政府的数据可以自动同步到 Notion：
- **Daily Report（日报）**、**Weekly Summary（周报）**自动生成
- **Financial Tracking（财务）**自动记录 API 消耗
- **Project Archives（项目）**追踪各项目进展
- Notion 的看板、日历、表格视图提供丰富的数据可视化

> 💡 三层 GUI 配合使用：**Web Dashboard** 看系统状态 → **Discord** 下达指令 → **Notion** 查看报表和历史数据。

---

## 详细教程

基础篇（服务器申请→安装→配置→跑起来）和进阶篇（tmux、GitHub、Notion、Cron、Discord、Prompt 技巧）见小红书系列笔记。

---

## 📱 接入飞书（Feishu/Lark）

除了 Discord，MAGA AI Government 也支持飞书作为交互界面。飞书插件已内置在新版 OpenClaw 中，无需额外安装。

### 第一步：创建飞书应用

1. 访问 [飞书开放平台](https://open.feishu.cn/app)，登录后点击 **创建企业自建应用**
2. 填写应用名称和描述，选择图标
3. 在 **凭证与基础信息** 页面，复制 **App ID**（格式 `cli_xxx`）和 **App Secret**

### 第二步：配置权限和能力

1. **添加权限**：进入 **权限管理**，点击 **批量导入**，粘贴以下内容：
```json
{
  "scopes": {
    "tenant": [
      "im:message", "im:message:send_as_bot", "im:message:readonly",
      "im:message.p2p_msg:readonly", "im:message.group_at_msg:readonly",
      "im:resource", "im:chat.members:bot_access",
      "im:chat.access_event.bot_p2p_chat:read"
    ]
  }
}
```

2. **开启机器人能力**：进入 **应用能力 > 机器人**，启用并设置机器人名称

3. **配置事件订阅**：进入 **事件订阅**，选择 **使用长连接接收事件（WebSocket）**，添加事件 `im.message.receive_v1`

> ⚠️ 配置事件订阅前，需要先完成下面第三步并启动 Gateway，否则长连接可能保存失败。

4. **发布应用**：在 **版本管理与发布** 中创建版本，提交审核发布

### 第三步：配置 OpenClaw

**方式一：命令行向导（推荐）**
```bash
openclaw channels add
# 选择 Feishu，输入 App ID 和 App Secret
```

**方式二：手动编辑配置文件**
```json5
{
  "channels": {
    "feishu": {
      "enabled": true,
      "dmPolicy": "pairing",
      "accounts": {
        "main": {
          "appId": "cli_xxx",
          "appSecret": "你的App Secret"
        }
      }
    }
  }
}
```

### 第四步：启动并测试

```bash
# 启动/重启 Gateway
openclaw gateway restart

# 在飞书里找到你的机器人，发一条消息
# 首次会收到配对码，执行以下命令批准：
openclaw pairing approve feishu <配对码>
```

批准后即可正常聊天。群聊中需要 @机器人 才会触发回复。

> 💡 飞书使用 WebSocket 长连接，**不需要公网IP或域名**，本地部署也能用。
>
> 📖 完整飞书文档：[docs.openclaw.ai/channels/feishu](https://docs.openclaw.ai/channels/feishu)

---

## 📝 接入 Notion（自动归档）

MAGA AI Government 可以通过 Notion Skill 自动写日报、归档数据、管理知识库。配置只需 3 步。

### 第一步：创建 Notion Integration

1. 访问 [Notion Integrations](https://www.notion.so/profile/integrations)
2. 点击 **New integration**（新建集成）
3. 填写名称（如「MAGA Government」），选择关联的 Workspace
4. 创建后复制 **Internal Integration Secret**（格式 `ntn_xxx` 或 `secret_xxx`）

### 第二步：存储 API Key

```bash
# 创建配置目录并保存 Key
mkdir -p ~/.config/notion
echo "ntn_你的token" > ~/.config/notion/api_key
```

### 第三步：授权页面/数据库

这一步**很关键**，不做的话 API 会返回 404：

1. 打开你想让 AI 访问的 Notion 页面或数据库
2. 点击右上角 **`···`** → **Connect to**（连接到）
3. 选择你刚创建的 Integration 名称
4. 子页面会自动继承权限

> ⚠️ **每个要访问的顶级页面/数据库都需要手动授权一次**，Integration 不会自动获得整个 Workspace 的权限。

### 验证

```bash
# 测试 API 是否通了
NOTION_KEY=$(cat ~/.config/notion/api_key)
curl -s "https://api.notion.com/v1/users/me" \
  -H "Authorization: Bearer $NOTION_KEY" \
  -H "Notion-Version: 2025-09-03" | head -c 200
```

看到返回的 JSON 包含你的 Integration 名称就说明配置成功了。

### 使用示例

配好后就可以在 Discord 里让 Agent 操作 Notion：

```
@白宫幕僚长 把今天的工作总结写到 Notion 日报里
@财政部 创建一个新的财务数据库，字段包含日期、收入、支出、备注
@新闻秘书 把这周的社媒数据更新到 Notion 舆情表
```

> 💡 Notion 适合做**持久化存档**（日报/周报/知识库），Discord 适合做**实时交互**，两者配合效果最佳。
>
> 📖 Notion API 文档：[developers.notion.com](https://developers.notion.com)

---

## 🏥 配置诊断（doctor.sh）

遇到问题？跑一行命令自动检查配置：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/ayrnb/mage-agent/main/doctor.sh)
```

诊断内容包括：
- ✅ OpenClaw/Node.js 安装检查
- ✅ 配置文件格式和 API Key 检查
- ✅ Discord Bot Token、allowBots、groupPolicy 检查
- ✅ Agent 和 Binding 路由匹配检查
- ✅ 工作区文件（SOUL.md / USER.md / memory/）检查
- ✅ Notion 等可选集成检查
- ✅ **@everyone 不触发的完整排查清单**

### @everyone 不触发 Bot 回复？

这是最常见的问题，通常原因是 **Discord Developer Portal 的 Intent 没开**：

1. 打开 [Discord Developer Portal](https://discord.com/developers/applications)
2. 选择你的 Bot → 左侧 **Bot** 页面
3. 往下翻到 **Privileged Gateway Intents**，开启以下三项：
   - ✅ **Message Content Intent**（必须）
   - ✅ **Server Members Intent**（必须）
   - ✅ **Presence Intent**（可选）
4. **每个 Bot 都要开**，不是只开一个！
5. 确认服务器里每个 Bot 的角色有 **View Channels** 权限
6. 确认配置文件里 `channels.discord.groupPolicy` 和每个 account 的 `groupPolicy` 都是 `"open"`

> ⚠️ 改完 Intent 后需要**重启 Gateway**：`openclaw gateway restart` 或 `systemctl --user restart openclaw-gateway`

---

## 常见问题

### 基础问题

**Q: 需要会写代码吗？**
不需要。一键脚本搞定安装，配置文件填几个 Key 就行。所有交互都是在 Discord 里用自然语言。

**Q: 和直接用 ChatGPT 有什么区别？**
ChatGPT 是一个通才，对话结束就失忆。这套系统是多个专家——每个 Agent 有自己的专业领域、持久记忆和工具权限。能自动写代码提交 GitHub、自动写文档到 Notion、定时执行任务。

**Q: 能用其他模型吗？**
能。OpenClaw 支持 Anthropic、OpenAI、Google Gemini 等主流服务商，也可接入其他兼容 OpenAI API 格式的服务商。在 `openclaw.json` 里改 model 配置就行。不同部门可以用不同模型。

**Q: 每月 API 费用大概多少？**
看使用强度。轻度使用 $10-15/月，中度 $20-30/月。省钱技巧：重活用 强力模型，轻活用 快速模型（便宜约 5 倍），简单任务可接入 经济模型 等国产模型进一步降本。

**Q: 和 Become CEO 项目有什么关系？**
[Become CEO](https://github.com/wanikua/become-ceo) 是企业版，本项目（MAGA AI Government）是美国政府风格版，都使用相同的 OpenClaw 框架和架构，只是角色命名和文化背景不同。两个项目架构灵感均参考自 [菠萝王朝](https://github.com/wanikua/boluobobo-ai-court-tutorial)。喜欢美国风格选 MAGA Government，喜欢现代企业风格选 Become CEO。

### 技术问题

**Q: @everyone 不触发 Agent 回复？**
Discord Developer Portal 里每个 Bot 要开启 **Message Content Intent** 和 **Server Members Intent**，服务器里 Bot 角色要有 View Channels 权限。OpenClaw 会把 @everyone 当作对每个 Bot 的显式 mention，权限到位就能触发。

**Q: 开了 sandbox 后 Agent 报没有权限写文件？**
sandbox mode 设成 `all` 会把 Agent 跑在 Docker 容器里，默认只读文件系统、断网、不继承环境变量。解决方法：

```json
"sandbox": {
  "mode": "all",
  "workspaceAccess": "rw",
  "docker": {
    "network": "bridge",
    "env": { "LLM_API_KEY": "你的LLM_API_KEY" }
  }
}
```
- `workspaceAccess: "rw"` — 让沙箱能读写工作目录
- `docker.network: "bridge"` — 允许联网
- `docker.env` — 传入 API Key（沙箱不继承主机环境变量）

**Q: 多人同时 @ 同一个 Agent 会冲突吗？**
不会。OpenClaw 为每个用户 × Agent 组合维护独立的会话（session）。多人同时 @国防部，各自的对话互不干扰。

**Q: Agent 之间能互相调用吗？**
能。这正是三权制衡的核心机制。白宫幕僚长通过 `sessions_spawn` 将任务派给参议院审议、国防部执行、最高法院审查。Agent 也可以通过 `sessions_send` 跨分支沟通。

**Q: 怎么自定义 Skill？**
OpenClaw 有内置的 Skill Creator 工具，可以创建自定义 Skill。每个 Skill 是一个包含 `SKILL.md`（指令）+ 脚本 + 资源的目录。放到工作区的 `skills/` 目录下即可被 Agent 使用。也可以从 [OpenClaw Hub](https://github.com/openclaw/openclaw) 获取社区共享的 Skill。

**Q: 怎么接入私有模型（Ollama 等）？**
在 `openclaw.json` 的 `models.providers` 中添加兼容 OpenAI API 格式的 provider，指定 `baseUrl` 到你的 Ollama 地址即可。Ollama 本地模型零 API 费用。

**Q: Gateway 启动失败怎么排查？**
```bash
# 查看详细日志
journalctl --user -u openclaw-gateway --since today --no-pager

# 配置检查
openclaw doctor

# 常见原因：API Key 未填、JSON 格式错误、Bot Token 无效
```

---

## 加入社区


---

## 🤝 推荐

- 🎁 [MiniMax Coding Plan](https://platform.minimaxi.com/subscribe/coding-plan?code=CIeSxc2iq2&source=link) — 88折专属优惠 + Builder 权益

## 相关链接

- 🍍 [菠萝王朝](https://github.com/wanikua/boluobobo-ai-court-tutorial) — 本项目架构灵感来源
- 🏢 [Become CEO — 企业版（English）](https://github.com/wanikua/become-ceo) — 现代企业版
- 🔧 [OpenClaw 框架](https://github.com/openclaw/openclaw) — 本项目的底层框架
- 📖 [OpenClaw 官方文档](https://docs.openclaw.ai)

## 免责声明 / Disclaimer

本项目按"原样"提供，不承担任何直接或间接责任。/ This project is provided "as is" without any warranties.

**使用前请注意 / Please note:**

1. **AI 生成内容仅供参考 / AI-generated content is for reference only**
   - AI 生成的代码、文案、建议等可能存在错误或不准确之处
   - 使用前请自行审核，确认无风险后再实际应用
   - Code, suggestions, etc. may contain errors. Please review before using in production.

2. **代码安全 / Code Security**
   - 自动生成的代码建议在合并前进行 code review
   - 涉及财务、安全敏感的操作请务必人工复核
   - Review AI-generated code before merging. Human review required for financial/sensitive operations.

3. **API 密钥安全 / API Key Security**
   - 请妥善保管您的 API 密钥 / Keep your API keys safe
   - 不要将包含密钥的配置文件提交到公开仓库 / Don't commit config files with keys to public repos

4. **服务器费用 / Server Costs**
   - 免费服务器（云服务商 等）有一定使用限额 / Free servers have usage limits
   - 超出限额后可能产生费用，请留意账单 / Excess usage may incur charges

5. **数据备份 / Data Backup**
   - 建议定期备份您的工作区和数据 / Regularly backup your workspace
   - 本项目不提供任何数据保证 / This project provides no data guarantees

---

v3.5 | MIT License

> 📜 This project is licensed under MIT. If you create derivative works or projects inspired by this architecture, please credit the original: [boluobobo-ai-court-tutorial](https://github.com/wanikua/boluobobo-ai-court-tutorial) by [@wanikua](https://github.com/wanikua)
