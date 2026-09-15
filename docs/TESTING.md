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
- Screen access denial and its recovery message were observed. An authorized capture,
  physical mouse dragging, actual input-method composition, multiple displays, macOS 14,
  and launch-at-login across logout remain manual release checks.
- The signed Snaplet build still needs its own screen-access permission. System Settings'
  Add Application dialog lists `/Applications/Snaplet.app`, but desktop automation could
  not select it. The owner must add it and enable the switch before the complete capture
  flow can be verified; the old Stillmark permission does not cover the renamed bundle.
- Review fixes covered unsaved changes on quit, modal capture reentry, cancellation,
  native text undo isolation, Shift–Command–Z, and export feedback.

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
