# JSMD WebSite - 极简Markdown网站

示例demo： [https://jsmd.pages.dev](https://jsmd.pages.dev)

本文档是AI生成，仅供参考。【😊写的确实挺好~】
【😊这种方括号里的，才是我手写的内容】

## 📖 项目简介

这是一个由张玉新（善用佳软）借助AI实现的极简Markdown网站解决方案。项目以不到100行代码实现了完整的Markdown网站功能，包括侧边栏导航、响应式设计、Wiki风格链接等特性。
【😊我用过 Docsify，但还是想手写一个更简单的方案。AI实现比预想简单，但我极致追求「代码行数更少」，花了不少时间反复折腾】
【😊JSMD，有两个含义。一是没有预先转html上传网站，只须原始的md文件，just MD。二是浏览时，MD向html的转换，实际是用 js 实现的，js+md】


## ✨ 主要功能

### 🎯 核心特性
- **极简设计**: 仅需一个HTML文件即可运行
- **Markdown渲染**: 支持完整的Markdown语法
- **侧边栏导航**: 自动从`_sidebar.md`生成导航菜单 【😊这不叫自动~ 还是需要手写 sidebar啊。我曾经想过，直接遍历md自动生成目录，并且支持时间、名称、大小的正逆排序。AI 也提供了代码，但我最后还是放弃了~ 】
- **响应式布局**: 完美适配桌面端和移动端【😊 这一点超出我的预料，AI真聪明】
- **Wiki风格链接**: 支持`[[文件名]]`格式的链接【😊 这是我的重点改进】
- **URL简化**: 文件名自动转换为简洁的URL参数【😊 这也是我的重点改进，默认是 website.com/?file=xxx.md，我改成了 website.com/?xxx ——问号是要保留的；如果不保留，也能做到，但从index点击和直接访问url会有差异，渲染vs代码——突然又想到了什么，后续再改进吧】

### 🔧 技术特点
- **单文件部署**: 只需上传`index.html`和相关Markdown文件
- **无服务器依赖**: 纯静态网站，可部署到任何静态托管平台
- **本地存储**: 侧边栏状态自动保存到浏览器本地存储
- **历史记录**: 支持浏览器前进后退功能
- **404处理**: 自动处理不存在的文件

## 🚀 使用方法

### 1. 基本部署
【😊 最核心就是一个 index.html , 上传到服务器，再加上相应md就够了】
```bash
# 项目结构
your-website/
├── index.html          # 主文件（必需）
├── _sidebar.md         # 侧边栏导航（必需）【😊如果不要侧边栏，可以使用另外一个单页的简化版】
├── README.md           # 首页内容
└── 你的诸多 md 文件们   # 其他Markdown文件
```

### 2. 创建侧边栏
在`_sidebar.md`中定义导航结构：
【😊 这个其实随便写的，没有固定格式要求】

```markdown
# 目录
## 文档
- [[README]]
- [使用指南](guide.md)
- [[项目介绍]]

## 其他
- [[关于我们]]
```

### 3. 链接格式

#### Wiki风格链接（推荐）【😊 这是我的重点改进】
```markdown
[[文件名]]           # 链接到 文件名.md
[[README]]          # 链接到 README.md
```

#### 标准Markdown链接
```markdown
[显示文本](文件名.md)
[使用指南](guide.md)
```

### 4. URL访问
- 首页: `your-domain.com/`
- 特定页面: `your-domain.com/?文件名`
- 示例: `your-domain.com/?guide` 访问 `guide.md`

## 📱 移动端优化

- **自适应侧边栏**: 移动端自动隐藏侧边栏
- **触摸友好**: 优化的按钮大小和间距
- **全屏导航**: 移动端侧边栏占满屏幕
- **自动隐藏**: 点击链接后自动隐藏侧边栏

## 🎨 自定义样式

项目使用GitHub风格的Markdown CSS，支持以下自定义：

```css
/* 侧边栏样式 */
#sidebar { padding: 1em; }
#sidebar li { line-height: 1.6; margin: 0.3em 0; }

/* 菜单按钮 */
#menu-button { 
  background: rgba(0, 0, 255, 0.2); 
  color: red; /* 悬停颜色 */
}

/* 链接样式 */
a { text-decoration: none; color: #06d; }
```

## ⚠️ 注意事项

### 文件要求
- **必需文件**: `index.html` 和 `_sidebar.md`
- **文件编码**: 所有文件必须使用UTF-8编码
- **文件名**: 建议使用英文文件名，避免特殊字符，【😊文件名不要出现空格，会解析出错！】
- 
### 部署限制
- **静态托管**: 需要支持静态文件托管的平台，如GitHub Pages、Vercel、Netlify、阿里云OSS、腾讯云COS等【😊我自己用的vercel, cloudflare, 如果对这些不熟练，也可以用某香港的免费空间】
- **HTTPS**: 建议使用HTTPS协议（某些功能需要）
- **CORS**: 确保服务器允许跨域请求【😊 这是什么意思？不过，确实引用公众号的图片无法显示】

### 浏览器兼容性
- **现代浏览器**: Chrome、Firefox、Safari、Edge
- **移动浏览器**: iOS Safari、Android Chrome
- **不支持**: IE浏览器

## 🔧 高级配置

### 修改默认页面
```javascript
// 在index.html中修改默认页面
return firstParam ? firstParam + '.md' : 'README.md'; // 改为你的默认页面
```

### 自定义标题格式
```javascript
// 修改页面标题格式
document.title = decodeURIComponent(file.replace('.md', '')) + ' 🌐ZYX';
```

### 添加新功能
项目结构清晰，易于扩展：
- 添加搜索功能
- 集成代码高亮
- 添加目录生成
- 支持图片预览

## 📋 部署平台推荐

- **GitHub Pages**: 免费、稳定、支持自定义域名
- **Vercel**: 快速部署、自动HTTPS
- **Netlify**: 功能丰富、支持表单处理
- **阿里云OSS**: 国内访问速度快
- **腾讯云COS**: 性价比高

## 🤝 贡献指南

欢迎提交Issue和Pull Request来改进这个项目！

## 📄 许可证

本项目采用MIT许可证，详见LICENSE文件。

## 👨‍💻 作者信息

- **作者**: 张玉新（善用佳软）
- **创建时间**: 2025-07-15
- **地点**: 上海
- **联系方式**: 通过GitHub Issues联系【😊 没用过，还是微博或邮件联系吧】

---

*这是一个极简而强大的Markdown网站解决方案，让每个人都能轻松创建自己的知识库网站。* 
