# Mac App Store preparation

The selected product name is **Snaplet**, with bundle identifier `com.jo9900.Snaplet` and individual developer team **YUAN ZHENG (`54BTJHJKUU`)**. The intended App Store price is **Free**, with no in-app purchases.

**Current release status:** A universal, development-signed archive at `build/Snaplet.xcarchive` was built successfully and passed code-signature verification. The first App Store export failed with `No Accounts`, a missing `Mac Installer Distribution` certificate, and no matching provisioning profile. The Xcode account/signing setup must be completed before retrying export. No successful App Store export, upload, submission, or live listing has been recorded. The metadata below is a draft.

## Included in the project

- macOS 14 minimum deployment target; Apple silicon and Intel builds.
- App Sandbox and user-selected file read/write access. Apple requires sandboxing for Mac App Store submissions. [Apple: Configuring the macOS App Sandbox](https://developer.apple.com/documentation/xcode/configuring-the-macos-app-sandbox)
- Hardened runtime, original app icons, version/build numbers, utility category, and copyright metadata.
- A privacy manifest declaring no tracking or data collection and app-local preferences under the `UserDefaults` reason `CA92.1`. Recheck this declaration whenever storage or dependencies change. [Apple: Required reason API declarations](https://developer.apple.com/documentation/bundleresources/app-privacy-configuration/nsprivacyaccessedapitypes/nsprivacyaccessedapitype)
- A [privacy policy](PRIVACY.md). Publish it at a stable public URL and use that URL in App Store Connect; a privacy policy URL is required for all apps. [Apple: App privacy](https://developer.apple.com/help/app-store-connect/reference/app-privacy/)

## Owner steps before submission

1. **Developer account:** Sign the existing account into Xcode and confirm access to team `54BTJHJKUU` and the current program agreement. Free apps can be distributed under that agreement; paid-app agreements are for paid apps and in-app purchases. [Apple: Agreements](https://developer.apple.com/help/app-store-connect/manage-agreements/sign-and-update-agreements)
2. **Signing:** The project already selects the team. Complete automatic signing for `com.jo9900.Snaplet`, including the App Store app-signing identity, Mac Installer Distribution identity, and matching distribution profile. Retry local export with `method=app-store-connect`, `destination=export`, and `signingStyle=automatic`. The successful development archive still needs distribution signing. [Apple: Certificates](https://developer.apple.com/help/account/certificates/certificates-overview/)
3. **Validation:** Run the tests and the [manual checks](TESTING.md), including the sandboxed signed app, fresh permissions, Retina/multiple displays, saving outside the sandbox through the save dialog, and login-item enable/disable. Test on macOS 14 and a current release before claiming both.
4. **Store record:** Create a macOS app record for Snaplet and its registered bundle identifier. Confirm that the selected name is available in App Store Connect. [Apple: Add a new app](https://developer.apple.com/help/app-store-connect/create-an-app-record/add-a-new-app)
5. **Archive and upload:** In Xcode, select the Snaplet scheme and a Mac archive destination, choose **Product → Archive**, then validate and distribute through Organizer to App Store Connect. Use an Xcode version currently accepted by Apple. [Apple: Upload builds](https://developer.apple.com/help/app-store-connect/manage-builds/upload-builds)
6. **Metadata:** Supply description, keywords, category, age-rating answers, support URL, privacy URL, review contact, and accurate screenshots. Screenshots should show the running product with non-sensitive sample content. [Apple: Screenshots](https://developer.apple.com/help/app-store-connect/manage-app-information/upload-app-previews-and-screenshots)
7. **Privacy and price:** Complete the privacy questionnaire based on the shipping binary (currently no data collection), choose **Free**, and set availability. [Apple: Manage app privacy](https://developer.apple.com/help/app-store-connect/manage-app-information/manage-app-privacy) · [Apple: Set a price](https://developer.apple.com/help/app-store-connect/manage-app-pricing/set-a-price)
8. **Review:** Select the processed build, add it for review, and submit. Approval and release happen in App Store Connect; configuration alone does not ensure acceptance. [Apple: Submit an app](https://developer.apple.com/help/app-store-connect/manage-submissions-to-app-review/submit-an-app)

## Listing drafts

Both localizations use the name **Snaplet**, category **Utilities**, price **Free**, and no in-app purchases. These drafts have not been entered into App Store Connect.

| Field | English (U.S.) | 简体中文 |
| --- | --- | --- |
| Name | Snaplet | Snaplet |
| Subtitle | Capture. Annotate. Copy. | 截图、标注、复制，简单顺手 |
| Keywords | `screenshot,annotation,capture,markup,arrow,clipboard,rectangle,ellipse,text` | `屏幕截图,图片标注,文字标注,箭头标注,剪贴板,矩形框,椭圆框` |

Names and subtitles are within 30 characters; keywords are 75 and 81 UTF-8 bytes respectively, below Apple's 100-byte limit. Both descriptions are below 4,000 characters. [Apple: App information](https://developer.apple.com/help/app-store-connect/reference/app-information/app-information) · [Apple: Platform version information](https://developer.apple.com/help/app-store-connect/reference/app-information/platform-version-information)

**English description**

```text
Snaplet makes everyday screenshots easy. Capture an area of your screen, add a few clear annotations, then copy the result or save it as a PNG.

Start from the menu bar or press Command–Shift–2. Add text, arrows, lines, rectangles, and ellipses. Change colors, line widths, and text sizes. Select annotations to move or resize them, and undo or redo your changes.

Copy the finished image to the clipboard or save it at its original pixel resolution. Enable launch at login if you want Snaplet ready when you sign in.

Snaplet is free and open source. It has no accounts, ads, donation prompts, or analytics. Screenshot editing happens locally on your Mac.

Requires macOS 14 or later. Supports Apple silicon and Intel Macs. macOS screen capture permission is required to take screenshots.
```

**简体中文描述**

```text
Snaplet 让日常截图更简单。选取屏幕区域，添加清晰的标注，然后复制图片或保存为 PNG。

从菜单栏启动截图，或按 Command–Shift–2。支持文字、箭头、直线、矩形和椭圆，可调整颜色、线条粗细和字号。选中标注后可以移动、缩放，也可以撤销与重做。

编辑完成后，复制到剪贴板，或以原始像素分辨率保存。需要随时使用时，可以开启登录后自动启动。

Snaplet 免费且开源，没有账号、广告、打赏弹窗或统计追踪。截图编辑在你的 Mac 本地完成。

需要 macOS 14 或以上，支持 Apple 芯片和 Intel Mac。截图前需要授予 macOS 屏幕捕捉权限。
```

Shared draft URLs:

- Support: [github.com/jo9900/snaplet/issues](https://github.com/jo9900/snaplet/issues)
- Privacy: [Snaplet privacy policy](https://github.com/jo9900/snaplet/blob/main/docs/PRIVACY.md)
- Marketing: [github.com/jo9900/snaplet](https://github.com/jo9900/snaplet)

Before submission, verify that these URLs are publicly accessible and add owner-provided contact information to the support destination. Apple requires contact information on the support site. [Apple: Support URL requirements](https://developer.apple.com/help/app-store-connect/reference/app-information/platform-version-information)

### Store screenshots

Mac screenshots must use **16:10**, at **1280 × 800**, **1440 × 900**, **2560 × 1600**, or **2880 × 1800** pixels. Provide **1–10** PNG or JPEG images with **no alpha channel or transparency**, showing the actual app. [Apple: Screenshot specifications](https://developer.apple.com/help/app-store-connect/reference/app-information/screenshot-specifications)

The included [editor screenshot](images/editor.png) is a 2560 × 1600 RGB PNG without an alpha channel. It renders the actual native editor with synthetic sample content and annotations. It has been visually checked, but has not been uploaded to App Store Connect.

## Suggested review notes

> Snaplet runs in the menu bar. Click its icon and start a capture, or press Command–Shift–2. Grant macOS screen capture permission, then drag a region. The editor supports text, arrows, lines, rectangles, and ellipses, with color and size controls. Copy to the clipboard or use Save to choose a PNG destination. Launch at login is optional and disabled by default. There are no accounts, purchases, ads, uploads, OCR, translation, or video recording.

Apple's screen capture permission terminology may mention recording even though the app captures still images only. Include fresh install permission steps in reviewer notes if the tested macOS version requires relaunching.

Sources checked September 15, 2026. Revisit Apple's submission requirements when preparing the actual release.
