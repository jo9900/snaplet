<p align="center"><img src="Resources/Assets.xcassets/AppIcon.appiconset/icon_128x128@2x.png" width="112" alt="Snaplet 图标"></p>

# Snaplet

轻量、免费、开源的 macOS 截图标注工具。截图、标记、复制，一气呵成。

[English](README.md) · [MIT 许可证](LICENSE) · [隐私政策](docs/PRIVACY.md)

**支持 macOS 14 Sonoma 及以上 · Apple 芯片和 Intel · Swift + AppKit + SwiftUI**

![紧凑标注工具栏与截图画布](docs/images/editor.png)

画布中是测试样例图；应用界面只有顶部标注工具栏。

## 功能

- 从菜单栏或通过 **⌘⇧2** 选择截图区域。
- 添加文字、箭头、直线、矩形和椭圆。
- 修改颜色、线条粗细、字号，移动和缩放标注。
- 撤销与重做。
- 复制标注后的图片到剪贴板，或按原始像素分辨率保存为 PNG。
- 可选开机登录时启动，默认关闭。

没有账号、广告、打赏弹窗、统计追踪、文字识别、翻译或录屏功能。截图始终留在你的 Mac 上。

## 编译与运行

安装 Xcode 15 或以上，在 **Xcode → Settings → Locations → Command Line Tools** 中选中它。仓库已包含 Xcode 工程，没有第三方包依赖。

```sh
git clone https://github.com/jo9900/snaplet.git
cd snaplet
open Snaplet.xcodeproj
```

选择 **Snaplet** scheme 和 **My Mac**，点击运行。如果 Xcode 要求签名，选择自己的开发团队。也可以不登录 Apple 账号进行本地编译：

```sh
./scripts/test.sh    # 运行 XCTest，使用本机临时签名
./scripts/build.sh   # 编译未签名的双架构 Release 版本
```

生成的应用位于 `build/Build/Products/Release/Snaplet.app`。未签名产物用于本地开发；长期安装使用及上架请通过 Xcode 正式签名。

新增或删除源文件后，安装 [XcodeGen](https://github.com/yonaskolb/XcodeGen)，运行 `xcodegen generate` 更新工程。已安装 XcodeGen 时，上述脚本会自动更新。

## 使用

1. 启动 Snaplet，点击菜单栏图标，或按 **⌘⇧2**。
2. 按 macOS 提示允许屏幕捕捉，也可前往 **系统设置 → 隐私与安全性 → 屏幕与系统音频录制** 调整权限（较早系统名称为「屏幕录制」）。如系统要求，请重新启动应用。
3. 拖动选取区域；**Esc** 取消截图。
4. 选择绘图工具或添加文字；选中标注后可移动、缩放或修改样式。
5. 复制图片或保存 PNG。取消保存不会关闭编辑器。

需要登录后自动运行时，在设置中打开 **Launch at Login**。建议先将正式签名的应用放到 `/Applications` 等固定位置。

macOS 将截图权限归在屏幕录制权限中；Snaplet 仅捕捉静态图片，不录制视频。

## 目录

```text
Sources/Snaplet/    应用入口、截图、标注编辑器、设置
Tests/SnapletTests/ 行为和图片输出测试
Resources/           图标、应用信息、沙盒权限、隐私清单
scripts/             编译、测试、原创图标生成
docs/                隐私政策、上架准备、人工验证步骤
project.yml          XcodeGen 工程配置
```

在仓库根目录运行 `swift scripts/generate-icon.swift` 可重新生成图标；矢量源文件为 [Resources/Icon.svg](Resources/Icon.svg)。

## 发布状态

计划免费上架 Mac App Store，**目前尚未提交或上架**。已准备沙盒配置和隐私清单，仍需要开发者账号签名、真机检查、商店资料和 Apple 审核。详见 [上架准备](docs/APP_STORE.md) 与 [人工验证](docs/TESTING.md)。

欢迎提交问题和小范围改进。反馈请附 macOS 版本、显示器缩放设置及复现步骤，请勿上传包含隐私的截图。
