# Verification

Run `./scripts/test.sh` for automated behavior and image-output tests, and `./scripts/build.sh` for a universal Release build. CI runs both on a Mac runner. Automated unit tests do not grant screen permissions or prove the complete desktop flow.

## Local development verification — September 15, 2026

- macOS 26.6.2 on Apple silicon, Xcode 26.6: all 10 XCTest cases passed.
- Universal Release build succeeded for arm64 and x86_64; Intel execution was not tested.
- After the final rename to Snaplet, all 10 tests passed again. A universal archive signed
  by YUAN ZHENG's personal development team passed strict code-signature verification.
  A stable copy was installed at `/Applications/Snaplet.app`; this is a development build,
  not an App Store distribution package.
- Inspected the native settings window and the compact editor using synthetic image content.
- Exercised native canvas mouse-event callbacks, text insertion, and the Copy/Save buttons.
  Clipboard and saved PNGs were byte-identical at the fixture's original 2000 × 1200 resolution.
- Screen access denial and its recovery message were observed. After the owner added
  `/Applications/Snaplet.app` and enabled its permission in System Settings, the actual
  capture and export flow passed the checks below.
- Review fixes covered unsaved changes on quit, modal capture reentry, cancellation,
  native text undo isolation, Shift–Command–Z, and export feedback.

## Installed app desktop verification — September 15, 2026

Tested the signed `/Applications/Snaplet.app` 0.1.0 (build 1) on macOS 26.6.2 (25G83), Apple silicon,
with a single 1920 × 1080-point display at 2× scale. A temporary native fixture covered
the display with synthetic content before capture; no personal desktop content was
included in the test images. Production code was unchanged during these checks.

- **Capture and shortcut:** ⌘⇧2 from the fixture entered the real ScreenCaptureKit region
  selection. Return captured the entire display and opened the native editor.
- **Clipboard and pixels:** Clicking Copy produced a 3840 × 2160 PNG. Reading the actual
  clipboard PNG confirmed native resolution. The upper-left red and lower-left blue
  markers appeared in the correct positions in both the editor and exported pixels.
- **Text:** Clicked the text tool and canvas, typed `Snaplet real capture OK`, and committed
  with ⌘Return. Changed the selected text from 24 to 56 points using the native slider.
  The text and size change were confirmed in the editor and exported PNG.
- **Color:** Opened the native Colors panel and chose the Tangerine pencil. The editor
  reported the new RGB color, and a fresh clipboard export contained orange text.
  Comparing exports localized the color change to the text bounds; 31,030 pixels had
  RGB `(255, 147, 0)` in that region.
- **Save and sandbox:** Used the real NSSavePanel to choose `/tmp` and save the annotated
  screenshot. The file was written successfully at 3840 × 2160 and visually inspected;
  committed text was present and editor selection handles were absent.
- **Cancellation:** Started another capture with the editor open and pressed Esc.
  Region selection closed, the existing editor remained, and no extra editor was created.
- **Launch at login:** Enabled and then disabled the setting through the installed app.
  Its checkbox state was read back as `0 → 1 → 0` without a registration error or approval
  prompt. The final setting is **off**; logout/login behavior was not exercised.

Local evidence was kept outside the repository: `/tmp/Snaplet-real-capture.png`
(clipboard, no annotations), `/tmp/Snaplet-real-annotated.png` (NSSavePanel output), and
`/tmp/Snaplet-real-colored.png` (clipboard after recoloring). These temporary files are
not release assets.

Physical pointer dragging for region selection, drawing/moving/resizing shapes, actual
input-method composition, multiple displays, macOS 14, Intel execution, and a real
logout/login remain unverified. The automation provider's previously observed drag
delivery limitation was not worked around in production code. Earlier native-event
callback checks cover shape logic but do not replace physical drag testing.

## Manual release checks

Use a signed build on macOS 14 and a current macOS version. These are checks to perform, not a claim that every configuration has been tested.

- **First run:** Launch from Applications; menu bar icon appears. Capture requests screen access only when needed. Deny permission, retry, then grant access. Follow a relaunch prompt if macOS shows one.
- **Selection:** Capture through both menu and ⌘⇧2. Drag in every direction and cancel with Esc. Click without dragging. Repeat on each display, including a display above or left of the main display and different scaling factors. Disconnect a display before a new capture.
- **Pixels:** Capture identifiable content near the edges. Check selection boundaries and exported PNG dimensions at Retina and non-Retina scales. Verify the screenshot and annotations have the same orientation.
- **Shapes:** Draw arrows, lines, rectangles, and ellipses. Change color/width, select, move, resize, and delete. Check short lines, reversed drag directions, and overlapping annotations.
- **Text:** Add English, Chinese, emoji, and multiple lines. Edit, recolor, enlarge, shrink, and move text. Cancel empty text entry. Check text near image boundaries and an active text edit during copy/save.
- **History:** Undo and redo creation, movement, resizing, text edits, style changes, and deletion. Undo all edits and redo them; make a new edit after undo and confirm old redo history is discarded.
- **Output:** Copy and paste into Preview or another image editor. Save through the native dialog, cancel, overwrite an existing PNG, and handle an unwritable destination without losing the open editor.
- **Lifecycle:** Start another capture with an editor open. Close an edited screenshot, cancel closing if prompted, and quit. Escape and keyboard shortcuts must work after repeatedly opening and closing editors.
- **Login:** Enable launch at login in a stable installed location, check System Settings, sign out/in, then disable and verify. Handle system approval or registration failure visibly.
- **Access:** Navigate controls with the keyboard and VoiceOver. Check light/dark mode, readable color controls, and a small display. Verify shortcuts while a text field has focus.

Record the actual OS versions, architectures, checks performed, and remaining gaps in the release PR or release notes.
