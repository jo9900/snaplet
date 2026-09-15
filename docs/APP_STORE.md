# Mac App Store preparation

Stillmark is intended to be free. **No App Store record, submission, or listing has been created by this repository.** The working product name and `com.jo9900.Stillmark` bundle identifier can be changed before registration.

## Included in the project

- macOS 14 minimum deployment target; Apple silicon and Intel builds.
- App Sandbox and user-selected file read/write access. Apple requires sandboxing for Mac App Store submissions. [Apple: Configuring the macOS App Sandbox](https://developer.apple.com/documentation/xcode/configuring-the-macos-app-sandbox)
- Hardened runtime, original app icons, version/build numbers, utility category, and copyright metadata.
- A privacy manifest declaring no tracking or data collection and app-local preferences under the `UserDefaults` reason `CA92.1`. Recheck this declaration whenever storage or dependencies change. [Apple: Required reason API declarations](https://developer.apple.com/documentation/bundleresources/app-privacy-configuration/nsprivacyaccessedapitypes/nsprivacyaccessedapitype)
- A [privacy policy](PRIVACY.md). Publish it at a stable public URL and use that URL in App Store Connect; a privacy policy URL is required for all apps. [Apple: App privacy](https://developer.apple.com/help/app-store-connect/reference/app-privacy/)

## Owner steps before submission

1. **Developer account:** Use an active Apple Developer Program membership and accept the current program agreement. Free apps can be distributed under that agreement; paid-app agreements are for paid apps and in-app purchases. [Apple: Agreements](https://developer.apple.com/help/app-store-connect/manage-agreements/sign-and-update-agreements)
2. **Signing:** Open `Stillmark.xcodeproj`, choose your team, and register a unique bundle identifier. Use automatic signing with the correct App Store distribution credentials. Do not upload the unsigned CI artifact.
3. **Validation:** Run the tests and the [manual checks](TESTING.md), including the sandboxed signed app, fresh permissions, Retina/multiple displays, saving outside the sandbox through the save dialog, and login-item enable/disable. Test on macOS 14 and a current release before claiming both.
4. **Store record:** Create a macOS app record with the chosen product name and registered bundle identifier. Product-name availability must be checked in App Store Connect. [Apple: Add a new app](https://developer.apple.com/help/app-store-connect/create-an-app-record/add-a-new-app)
5. **Archive and upload:** In Xcode, select the Stillmark scheme and a Mac archive destination, choose **Product → Archive**, then validate and distribute through Organizer to App Store Connect. Use an Xcode version currently accepted by Apple. [Apple: Upload builds](https://developer.apple.com/help/app-store-connect/manage-builds/upload-builds)
6. **Metadata:** Supply description, keywords, category, age-rating answers, support URL, privacy URL, review contact, and accurate screenshots. Screenshots should show the running product with non-sensitive sample content. [Apple: Screenshots](https://developer.apple.com/help/app-store-connect/manage-app-information/upload-app-previews-and-screenshots)
7. **Privacy and price:** Complete the privacy questionnaire based on the shipping binary (currently no data collection), choose **Free**, and set availability. [Apple: Manage app privacy](https://developer.apple.com/help/app-store-connect/manage-app-information/manage-app-privacy) · [Apple: Set a price](https://developer.apple.com/help/app-store-connect/manage-app-pricing/set-a-price)
8. **Review:** Select the processed build, add it for review, and submit. Approval and release happen in App Store Connect; configuration alone does not ensure acceptance. [Apple: Submit an app](https://developer.apple.com/help/app-store-connect/manage-submissions-to-app-review/submit-an-app)

## Suggested review notes

> Stillmark runs in the menu bar. Click its icon and start a capture, or press Command–Shift–2. Grant macOS screen capture permission, then drag a region. The editor supports text, arrows, lines, rectangles, and ellipses, with color and size controls. Copy to the clipboard or use Save to choose a PNG destination. Launch at login is optional and disabled by default. There are no accounts, purchases, ads, uploads, OCR, translation, or video recording.

Apple's screen capture permission terminology may mention recording even though the app captures still images only. Include fresh install permission steps in reviewer notes if the tested macOS version requires relaunching.

Sources checked September 15, 2026. Revisit Apple's submission requirements when preparing the actual release.
