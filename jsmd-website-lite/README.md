# JSMD Website Lite

示例demo: [https://jsmd-lit.pages.dev](https://jsmd-lit.pages.dev)
- [[README]]
- [test-css.md](test-css.md)
- [test-simple-markdown.md](test-simple-markdown.md)
- [[早期清华慈善轶事]]
- [[20200422-读书清华书目]]

一个轻量级的单页面Markdown文档查看器，支持Wiki风格的链接和动态内容加载。

## 功能特性

- 📄 **单文件部署** - 只需一个HTML文件即可运行
- 🔗 **Wiki风格链接** - 支持 `[[页面名]]` 格式的链接
- 📱 **响应式设计** - 适配桌面和移动设备
- ⚡ **动态加载** - 无需刷新页面即可切换文档
- 🎨 **GitHub风格** - 使用GitHub Markdown CSS样式
- 🔍 **URL路由** - 支持浏览器前进后退功能

## 使用方法

### 基本使用

1. 将 `index.html` 文件放在包含Markdown文件的目录中
2. 在浏览器中打开 `index.html`
3. 默认会加载 `README.md` 文件

### 链接格式

支持两种链接格式：

1. **Wiki风格链接**：`[[页面名]]`
2. **标准Markdown链接**：`[链接文本](文件名.md)`

### URL格式

- **渲染页面**：`site.com/file` 显示渲染后的内容
- **源文件**：`site.com/file.md` 显示原始Markdown文件

### 中文编码问题

如果直接访问 `site.com/file.md` 时中文显示乱码，请确保：

1. **文件编码**：所有Markdown文件必须以UTF-8编码保存
2. **服务器配置**：设置正确的Content-Type

#### 解决方案

**方法1：使用编辑器确保UTF-8编码**
- VS Code：右下角显示编码格式，确保为"UTF-8"
- Notepad++：编码 → UTF-8
- 其他编辑器：查找编码设置，选择UTF-8

**方法2：服务器配置（推荐）**

**Cloudflare Pages** (使用 `_headers` 文件):
```
/*.md
  Content-Type: text/markdown; charset=utf-8
```

Apache (.htaccess):
```apache
AddType text/markdown .md
AddDefaultCharset UTF-8
```

Nginx:
```nginx
location ~* \.md$ {
    add_header Content-Type "text/markdown; charset=utf-8";
}
```

**方法3：在Markdown文件头部添加编码声明**
```markdown
---
encoding: utf-8
---

# 你的内容
```

## 文件结构

```
jsmd-website-lite/
├── index.html          # 主程序文件
├── README.md           # 默认首页
└── *.md              # 其他Markdown文件
```

## 技术实现

- **Markdown解析**：使用 [markdown-it](https://github.com/markdown-it/markdown-it)
- **样式**：使用 [GitHub Markdown CSS](https://github.com/sindresorhus/github-markdown-css)
- **路由**：基于URL路径和History API实现
- **链接转换**：自动将Wiki链接转换为可点击的链接

## 自定义样式

可以通过修改 `<style>` 标签中的CSS来自定义外观：

```css
.container {
  max-width: 1000px;
  padding: 2em;
}
a:hover {
  color: red;
}
```

## 浏览器兼容性

- ✅ Chrome/Chromium
- ✅ Firefox
- ✅ Safari
- ✅ Edge

## 许可证

本项目采用MIT许可证。

---

**作者**: zyxβ2507  
**版本**: Lite版本 
