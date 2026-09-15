# Stillmark

- Native macOS 14+ app in Swift, AppKit and SwiftUI. Keep the app dependency-free.
- Capture still images with ScreenCaptureKit. Do not add OCR, translation, recording,
  analytics, accounts, advertising or donation prompts.
- Keep App Sandbox enabled. Save through the system save panel and keep captures local.
- Annotation preview and export must use the same renderer. Preserve source pixel
  dimensions; document coordinates are logical points with the origin at the top left.
- Finish pending text input before export, and preserve Chinese input method composition.
  Group each gesture into one undo operation. Cancel must restore the prior state.
- Keep files focused and reasonably short. Change only the requested behavior.
- Keep the UI to one compact annotation toolbar and the screenshot. Settings should
  contain only capture, launch-at-login and permission controls; avoid marketing text.
- `project.yml` is the XcodeGen source of truth. Regenerate and commit the Xcode project
  after adding or removing source files.
- Run `./scripts/test.sh` for behavior and image-output checks, and `./scripts/build.sh`
  for the universal Release build. See `docs/TESTING.md` for permission and display checks.
- When available, prefer codebase-memory-mcp graph tools for code discovery; index this
  repository first. Use text search for literals, configuration, or missing graph results.
- Keep generated builds and temporary UI automation files out of git. Documentation
  screenshots must use synthetic content without personal information.
