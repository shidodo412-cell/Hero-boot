# Hero Boot v2.1

Android performance helper + Free Fire training/settings companion.

## Included
- Blue Hero Boot UI
- Device/RAM/battery information
- Boost button (app-side state only; no root/RAM hacks)
- Gaming Tools
- Headshot sensitivity starting presets
- Aim Trainer drills
- Gradle 8.9 wrapper bootstrap files
- GitHub Actions workflow that builds a debug APK automatically

## Build on GitHub from a phone
1. Create a GitHub repository named `HeroBoot`.
2. Upload this project's files, including `.github/workflows/build-apk.yml`.
3. Open the repository's **Actions** tab.
4. Choose **Build Hero Boot APK**.
5. Tap **Run workflow** (or push to `main` to trigger it).
6. Open the completed workflow run and download the **HeroBoot-debug** artifact.
7. Extract the artifact ZIP and install `app-debug.apk` on Android.

## Important
The app does not modify Free Fire files, automate aiming, or guarantee a headshot rate. Sensitivity values are only starting points for manual tuning and training.
