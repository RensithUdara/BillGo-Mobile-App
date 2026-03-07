# 🎨 BillGo App Icon Setup Guide

## Quick Setup (Automated)

Use Flutter's app icon package to automatically generate all required icon sizes:

### Install flutter_launcher_icons

```bash
flutter pub add flutter_launcher_icons
```

### Create pubspec_icons.yaml

Add this configuration file to your project root:

```yaml
flutter_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/logo.png"
  
  # Web
  web:
    background_color: "#ffffff"
    theme_color: "#6C63FF"
  
  # All required sizes will be auto-generated
```

### Generate Icons

```bash
flutter pub run flutter_launcher_icons
```

---

## Manual Setup

If you prefer manual setup, follow these steps:

### For Android

#### Step 1: Create icon resources directory

```
android/app/src/main/res/
├── mipmap-hdpi/
│   └── ic_launcher.png (162×162)
├── mipmap-mdpi/
│   └── ic_launcher.png (108×108)
├── mipmap-xhdpi/
│   └── ic_launcher.png (216×216)
├── mipmap-xxhdpi/
│   └── ic_launcher.png (324×324)
├── mipmap-xxxhdpi/
│   └── ic_launcher.png (432×432)
└── mipmap-anydpi-v33/
    └── ic_launcher.xml (Adaptive icon - Android 13+)
```

#### Step 2: Place your logo.png

1. Convert `assets/logo.png` to appropriate sizes above
2. Use an image editor (Photoshop, GIMP, or online tool like makeappicon.com)
3. Place each size in the corresponding mipmap folder

#### Step 3: Create Adaptive Icon (Android 8+)

Create `android/app/src/main/res/mipmap-anydpi-v33/ic_launcher.xml`:

```xml
<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/ic_launcher_background"/>
    <foreground android:drawable="@mipmap/ic_launcher_foreground"/>
</adaptive-icon>
```

#### Step 4: Define colors

Create `android/app/src/main/res/values/colors.xml`:

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="ic_launcher_background">#6C63FF</color>
</resources>
```

---

### For iOS

#### Step 1: Open Xcode

```bash
open ios/Runner.xcworkspace
```

#### Step 2: Configure App Icon

1. Find `Runner` in left sidebar
2. Select `Runner` target
3. Go to `Build Settings` → search for "App Icon"
4. Make sure `App Icon Set Name` is set to `AppIcon`

#### Step 3: Add App Icon Asset

1. Click `Assets.xcassets` in left sidebar
2. Right-click → `New App Icon Set`
3. Name it `AppIcon`
4. Drag your logo.png into each size slot:
   - 1x (120×120)
   - 2x (120×120)
   - 3x (180×180)

**Required sizes for iOS:**
- iPhone Notification (20×20, 40×40, 60×60)
- iPhone App (60×60, 120×120, 180×180)
- iPad - Notification (20×20, 40×40)
- iPad - App (76×76, 152×152)
- iPhone Spotlight (40×40, 80×80, 120×120)

#### Step 4: Rebuild

```bash
flutter clean
flutter pub get
flutter run
```

---

## Online Icon Generator (Recommended)

For quick setup without manual resizing:

### Method 1: Make App Icon
- **Website**: https://makeappicon.com
- **Steps**:
  1. Upload your logo.png (1024×1024 recommended)
  2. Download the generated icon pack
  3. Extract and place files in appropriate folders above

### Method 2: iOS App Icon Generator
- **Website**: https://appicon.co
- **Steps**:
  1. Upload logo
  2. Select iOS + Android
  3. Download zip
  4. Extract to project

### Method 3: Flutter Launcher Icons (Recommended)
- Most automated option
- Handles most sizes automatically
- Supports adaptive icons

---

## Verification

### Check Android Icons
```bash
cd android/app/src/main/res
ls -la mipmap-*/ic_launcher.png
```

### Check iOS Icons
In Xcode:
1. Assets.xcassets → AppIcon
2. Verify all slots are filled

### Visual Check
```bash
flutter run
# Look at app icon on home screen
```

---

## Icon Design Guidelines

### Minimum Requirements
- **Source image**: 1024×1024 pixels (or larger)
- **Format**: PNG with transparency
- **Safe area**: Keep important elements in center 540×540 area
- **Colors**: Use brand colors (BillGo Primary: #6C63FF)

### Best Practices
- ✅ Simple, recognizable design
- ✅ Consistent with app branding
- ✅ Clear at small sizes (27×27, 32×32)
- ✅ Proper contrast
- ❌ Avoid text in icons
- ❌ Avoid complex gradients
- ❌ Don't use entire logo as app icon

### BillGo Recommended Design
- **Shape**: Rounded square or circle with "B" or shopping bag
- **Color**: Primary Purple (#6C63FF) background
- **Symbol**: Bill/receipt icon or shopping element
- **Style**: Flat design, Material Design 3 compliant

---

## Troubleshooting

### Icon not updating on device
```bash
flutter clean
flutter pub get
flutter run
```

### Icon appears blurry on Android
- Check if image is correct DPI for mipmap folder
- Use exact sizes specified above
- Avoid SVG, use PNG only

### Icon appears chopped on iOS
- Ensure safe area margins
- Check if icon is set to "App Icon" in Xcode
- Rebuild from Xcode

### flutter_launcher_icons not working
```bash
flutter pub get
flutter pub run flutter_launcher_icons:main
```

---

## Current Setup Status

✅ **Completed:**
- App name set to "BillGo" (Android & iOS)
- pubspec.yaml description updated
- assets/logo.png registered

⏳ **Pending:**
- Generate icon assets for each screen size
- Upload to mipmap directories
- Configure adaptive icons (Android 8+)

## Next Steps

1. Choose method above (automated or manual)
2. Generate/resize icons
3. Place in appropriate folders
4. Run `flutter clean && flutter pub get && flutter run`
5. Verify icon appears on home screen

**Time to complete**: 5-10 minutes

---

Made with ❤️ for BillGo
