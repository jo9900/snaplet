# Mac App Store preparation

The selected product name is **Snaplet**, with bundle identifier `com.jo9900.Snaplet` and individual developer team **YUAN ZHENG (`54BTJHJKUU`)**. The configured App Store price is **Free**, with no in-app purchases.

The App Store title is **Snaplet: Capture & Annotate** because Apple reported that the standalone name Snaplet was already in use. The installed app and repository retain the name Snaplet.

**Current release status — September 15, 2026:** Version **0.1.0 (1)** was submitted to Apple and is **Waiting for Review**. App Store Connect confirmed **1 Item Submitted** and **Draft Submissions (0)**. It is configured to release automatically after approval at **Free**; the app is not yet live. [App Store Connect record `6812333384`](https://appstoreconnect.apple.com/apps/6812333384/distribution) · [Review submission](https://appstoreconnect.apple.com/apps/6812333384/distribution/reviewsubmissions/details/a45ab88e-0704-4cfa-a44b-4ea69628d12a)

The universal archive at `build/Snaplet.xcarchive` passed code-signature verification. App Store export succeeded at `build/AppStore/Snaplet.pkg`: Cloud Managed Apple Distribution app signing, a Mac Team Store provisioning profile, and a Mac Developer Installer certificate all belong to team `54BTJHJKUU`. The package signature was verified.

## Included in the project

- macOS 14 minimum deployment target; Apple silicon and Intel builds.
- App Sandbox and user-selected file read/write access. Apple requires sandboxing for Mac App Store submissions. [Apple: Configuring the macOS App Sandbox](https://developer.apple.com/documentation/xcode/configuring-the-macos-app-sandbox)
- Hardened runtime, original app icons, version/build numbers, utility category, and copyright metadata.
- A privacy manifest declaring no tracking or data collection and app-local preferences under the `UserDefaults` reason `CA92.1`. Recheck this declaration whenever storage or dependencies change. [Apple: Required reason API declarations](https://developer.apple.com/documentation/bundleresources/app-privacy-configuration/nsprivacyaccessedapitypes/nsprivacyaccessedapitype)
- A public [privacy policy](PRIVACY.md), with its URL saved for English and Simplified Chinese in App Store Connect. A privacy policy URL is required for all apps. [Apple: App privacy](https://developer.apple.com/help/app-store-connect/reference/app-privacy/)

## Submission record

1. **Developer account:** Xcode is signed into the existing account and has access to team `54BTJHJKUU`. Apple accepted the submission without an agreement prompt. Free apps can be distributed under the program agreement; paid-app agreements are for paid apps and in-app purchases. [Apple: Agreements](https://developer.apple.com/help/app-store-connect/manage-agreements/sign-and-update-agreements)
2. **Signing:** Automatic distribution signing and local export have succeeded for `com.jo9900.Snaplet`, using `method=app-store-connect`, `destination=export`, and `signingStyle=automatic`. Keep signing assets and exported packages outside version control. [Apple: Certificates](https://developer.apple.com/help/account/certificates/certificates-overview/)
3. **Validation:** After the owner granted screen access, the installed signed app passed real capture, text editing, color and size changes, clipboard output, and saving outside the sandbox through the system save dialog on macOS 26.6.2. The 3840 × 2160 output preserved the display's 2× pixel resolution and orientation. See [verification results and remaining manual checks](TESTING.md); macOS 14, Intel execution, and multiple displays have not been exercised on hardware.
4. **Store record:** Created as `6812333384`, using SKU `com.jo9900.Snaplet`. Keep the bundle identifier consistent with the existing record. [Apple: Add a new app](https://developer.apple.com/help/app-store-connect/create-an-app-record/add-a-new-app)
5. **Archive and upload:** Build 0.1.0 (1) was uploaded with `xcodebuild -exportArchive`, `destination=upload`, and automatic signing. Processing is complete, the build is associated with the version, and its export-compliance declaration is saved. For later builds, use the Snaplet scheme and a Mac archive destination, and an Xcode version currently accepted by Apple. [Apple: Upload builds](https://developer.apple.com/help/app-store-connect/manage-builds/upload-builds)
6. **Metadata:** English and Simplified Chinese descriptions, keywords, names, subtitles, and support and marketing URLs are saved. Simplified Chinese reuses the saved English screenshot. App Review contact details and the revised review notes below are saved. The Utilities category and age rating of **4+ with regional differences** are saved. Content Rights is saved as **No**, reflecting the local screenshot tool with no bundled third-party content or content services. [Apple: Screenshots](https://developer.apple.com/help/app-store-connect/manage-app-information/upload-app-previews-and-screenshots)
7. **Privacy and price:** **Data Not Collected** is published in App Privacy, and English and Simplified Chinese privacy policy URLs are saved. **Free** is configured with a **$0.00** base price and free pricing in every region. Public availability is configured for **175 regions**, taking effect after release. [Apple: Manage app privacy](https://developer.apple.com/help/app-store-connect/manage-app-information/manage-app-privacy) · [Apple: Set a price](https://developer.apple.com/help/app-store-connect/manage-app-pricing/set-a-price)
8. **Review:** Metadata validation and the final **Submit for Review** action succeeded. App Store Connect shows **Waiting for Review** for version **0.1.0 (1)**. Automatic release after approval is selected; approval and publication remain pending. [Apple: Submit an app](https://developer.apple.com/help/app-store-connect/manage-submissions-to-app-review/submit-an-app)

## Listing copy

Both localized names, subtitles, descriptions, and keywords below are saved, along with the **Utilities** category. **Free** pricing is configured for all regions, with no in-app purchases.

| Field | English (U.S.) | 简体中文 |
| --- | --- | --- |
| Name | Snaplet: Capture & Annotate | Snaplet: Capture & Annotate |
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

Shared URLs (saved for both localizations):

- Support: [Snaplet support](https://github.com/jo9900/snaplet/blob/main/docs/SUPPORT.md)
- Privacy: [Snaplet privacy policy](https://github.com/jo9900/snaplet/blob/main/docs/PRIVACY.md)
- Marketing: [github.com/jo9900/snaplet](https://github.com/jo9900/snaplet)

The support page uses the owner's selected public email, shared with CocoPlayer support. The public support and privacy URLs returned HTTP 200 before submission. Apple requires contact information on the support site. Private App Review contact details belong in App Store Connect and must not be committed to this repository. [Apple: Support URL requirements](https://developer.apple.com/help/app-store-connect/reference/app-information/platform-version-information)

### Store screenshots

Mac screenshots must use **16:10**, at **1280 × 800**, **1440 × 900**, **2560 × 1600**, or **2880 × 1800** pixels. Provide **1–10** PNG or JPEG images with **no alpha channel or transparency**, showing the actual app. [Apple: Screenshot specifications](https://developer.apple.com/help/app-store-connect/reference/app-information/screenshot-specifications)

The included [editor screenshot](images/editor.png) is a 2560 × 1600 RGB PNG without an alpha channel. It renders the actual native editor with synthetic sample content and annotations. It has been visually checked, saved in the English App Store Connect listing, and reused for Simplified Chinese.

## Saved review notes

These revised notes, including the content-source explanation, are saved in App Store Connect.

> Snaplet runs in the menu bar. Click its icon and start a capture, or press Command–Shift–2. Grant macOS screen capture permission, then drag a region. The editor supports text, arrows, lines, rectangles, and ellipses, with color and size controls. Copy to the clipboard or use Save to choose a PNG destination. Launch at login is optional and disabled by default. There are no accounts, purchases, ads, uploads, OCR, translation, or video recording. Snaplet bundles no third-party content and connects to no content service; it only creates and annotates screenshots locally at the user's request.

Apple's screen capture permission terminology may mention recording even though the app captures still images only. Include fresh install permission steps in reviewer notes if the tested macOS version requires relaunching.

Sources checked September 15, 2026. Revisit Apple's submission requirements when preparing the actual release.
