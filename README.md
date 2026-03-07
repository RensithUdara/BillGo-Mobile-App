# 🛒 BillGo Mobile POS & Billing App

![Flutter](https://img.shields.io/badge/Flutter-3.1.0+-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Active-brightgreen)

A modern, feature-rich **Point of Sale (POS) and Billing Application** built with Flutter. BillGo provides an intuitive interface for managing sales, generating invoices, scanning barcodes, and analyzing business metrics in real-time.

**Version:** 1.0.0 | **Platform:** Android, iOS, Web

---

## 📋 Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Architecture](#architecture)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage Guide](#usage-guide)
- [API Reference](#api-reference)
- [Database Schema](#database-schema)
- [Building & Deployment](#building--deployment)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

---

## ✨ Features

### 🎯 Core POS Functionality
- **Barcode Scanning** - Real-time product scanning using mobile camera
- **Product Management** - Add, edit, and manage product inventory
- **Shopping Cart** - Intuitive cart management with quantity adjustment
- **Checkout** - Fast and secure transaction processing
- **Multiple Payment Methods** - Cash, Card, UPI support
- **Invoice Generation** - Automatic receipt generation with transaction details

### 📊 Analytics & Reporting
- **Dashboard** - Real-time sales overview with key metrics
  - Total products, daily sales, transactions count, average sale value
  - Welcome card with personalized greeting
  - Activity summary (revenue, invoices, items sold)
  - Recent transactions preview
- **Reports Module** - Detailed analytics with period filtering
  - Period selection (Today, Week, Month, Year)
  - Sales trend visualization
  - Key metrics display (Total Sales, Orders, AOV, Items Sold)
  - Top products analysis
  - Payment method breakdown
- **Sales Statistics** - Advanced calculations and formatting
  - Daily sales calculation
  - Average transaction value
  - Top products ranking
  - Sales trend percentage

### 🏪 Shop Configuration
- **Shop Details** - Customize business information
  - Shop name and contact information
  - Address details (line 1, line 2)
  - Payment methods (UPI ID)
  - Receipt footer text
- **Persistent Storage** - All settings saved locally via Hive database
- **Real-time Sync** - Immediate availability across app sessions

### 🖨️ Printing & Receipts
- **Thermal Printer Support** - Bluetooth-enabled thermal printing
- **QR Code Generation** - Automatic QR code creation for receipts
- **Receipt Customization** - Configurable receipt header and footer
- **Print History** - Track all printed receipts

### 💾 Data Management
- **Local Database** - Hive-based persistent storage (no internet required)
- **Transaction History** - Complete transaction record with timestamps
- **Product Database** - Complete inventory management
- **Backup & Restore** - Export/import functionality

### 🎨 User Interface
- **Material Design 3** - Modern, accessible UI components
- **Dark & Light Themes** - Adaptive theming support
- **Smooth Animations** - Fluid transitions and interactions
- **Responsive Layout** - Optimized for all screen sizes
- **Custom Shadows** - 4-level shadow system for depth

### ❓ Help & Support
- **Help Center** - Comprehensive FAQ section
  - Getting Started guide
  - Product management tutorials
  - Barcode scanning help
  - Printer setup instructions
  - Shop configuration guide
  - Troubleshooting section
- **About Page** - App information and feature list
- **Share App** - Built-in app sharing functionality
- **Direct Support** - Email support link

---

## 📸 Screenshots

| Feature | Preview |
|---------|---------|
| **Splash Screen** | Animated BillGo logo with gradient branding |
| **Home/Scanning** | Product scanning with real-time cart |
| **Checkout** | Transaction summary and payment selection |
| **Dashboard** | Sales overview with statistics grid |
| **Reports** | Analytics with period filtering and charts |
| **Shop Config** | Business information management |
| **Settings** | Navigation hub and preferences |
| **Help & About** | FAQ and app information |

---

## 🛠️ Tech Stack

### Framework & Language
- **Flutter** 3.1.0+ - UI framework
- **Dart** 3.x - Programming language

### State Management
- **flutter_bloc** 8.1.5 - BLoC pattern implementation
- **get_it** 7.6.7 - Service locator & dependency injection

### Database & Storage
- **hive** 2.2.3 - Local NoSQL database
- **hive_flutter** 1.1.0 - Flutter integration for Hive

### Navigation
- **go_router** 14.0.0 - Modern routing solution

### Features
- **mobile_scanner** 5.1.0 - Barcode/QR code scanning
- **print_bluetooth_thermal** 1.1.2 - Thermal printer support
- **pretty_qr_code** 3.3.0 - QR code generation
- **flutter_vibrate** 1.3.0 - Haptic feedback
- **permission_handler** 11.3.1 - Runtime permissions
- **app_settings** 7.0.0 - Device settings access

### Utilities
- **google_fonts** 6.1.0 - Custom typography
- **intl** 0.19.0 - Internationalization
- **share_plus** 7.0.0 - Share functionality
- **url_launcher** 6.2.0 - External URL handling
- **uuid** 4.5.2 - Unique ID generation

### Code Generation
- **json_annotation** 4.9.0 - JSON serialization
- **json_serializable** 6.7.1 - Code generation for JSON
- **build_runner** 2.4.8 - Build system
- **hive_generator** 2.0.1 - Hive adapter generation

### Functional Programming
- **fpdart** 1.1.0 - Functional programming utilities
- **equatable** 2.0.5 - Value equality
- **bloc** 8.1.4 - Base BLoC package

---

## 📁 Project Structure

```
billgo_mobile_app/
├── android/                          # Android native code
├── ios/                              # iOS native code
├── web/                              # Web platform files
├── lib/
│   ├── main.dart                     # App entry point
│   ├── config/
│   │   └── routes/
│   │       └── app_routes.dart       # GoRouter configuration
│   ├── core/
│   │   ├── error/
│   │   │   └── failure.dart          # Error handling
│   │   ├── services/
│   │   │   ├── billing_stats_service.dart    # Sales calculations
│   │   │   └── app_utilities_service.dart    # General utilities
│   │   ├── theme/
│   │   │   └── app_theme.dart        # Global theme & colors
│   │   ├── widgets/
│   │   │   ├── primary_button.dart   # Custom button
│   │   │   └── custom_snackbar.dart  # Snackbar widget
│   │   └── usecase/
│   │       └── usecase.dart          # Abstract use case
│   │
│   └── features/
│       ├── billing/
│       │   ├── data/
│       │   │   ├── datasources/
│       │   │   ├── models/
│       │   │   └── repositories/
│       │   ├── domain/
│       │   │   ├── entities/
│       │   │   ├── repositories/
│       │   │   └── usecases/
│       │   └── presentation/
│       │       ├── bloc/
│       │       │   ├── billing_bloc.dart
│       │       │   ├── billing_event.dart
│       │       │   └── billing_state.dart
│       │       └── pages/
│       │           ├── home_page.dart
│       │           ├── checkout_page.dart
│       │           ├── scanner_page.dart
│       │           └── splash_screen.dart
│       │
│       ├── product/
│       │   ├── data/
│       │   │   ├── datasources/
│       │   │   ├── models/
│       │   │   └── repositories/
│       │   ├── domain/
│       │   │   ├── entities/
│       │   │   ├── repositories/
│       │   │   └── usecases/
│       │   └── presentation/
│       │       ├── bloc/
│       │       │   ├── product_bloc.dart
│       │       │   ├── product_event.dart
│       │       │   └── product_state.dart
│       │       └── pages/
│       │           ├── product_list_page.dart
│       │           ├── add_product_page.dart
│       │           └── edit_product_page.dart
│       │
│       ├── shop/
│       │   ├── data/
│       │   │   ├── datasources/
│       │   │   ├── models/
│       │   │   └── repositories/
│       │   ├── domain/
│       │   │   ├── entities/
│       │   │   ├── repositories/
│       │   │   ├── services/
│       │   │   │   └── shop_config_service.dart
│       │   │   └── usecases/
│       │   └── presentation/
│       │       ├── bloc/
│       │       │   ├── shop_bloc.dart
│       │       │   ├── shop_event.dart
│       │       │   └── shop_state.dart
│       │       └── pages/
│       │           └── shop_details_page.dart
│       │
│       ├── dashboard/
│       │   └── presentation/
│       │       └── pages/
│       │           └── dashboard_page.dart
│       │
│       ├── reports/
│       │   └── presentation/
│       │       └── pages/
│       │           └── reports_page.dart
│       │
│       ├── help/
│       │   └── presentation/
│       │       └── pages/
│       │           └── help_about_page.dart
│       │
│       └── settings/
│           └── presentation/
│               └── pages/
│                   └── settings_page.dart
│
├── assets/
│   └── logo.png                  # App logo
├── test/
│   └── widget_test.dart          # Widget tests
├── pubspec.yaml                  # Dependencies & assets
├── analysis_options.yaml         # Linter rules
└── README.md                     # This file
```

---

## 🏗️ Architecture

BillGo follows **Clean Architecture** with **BLoC State Management** pattern:

```
┌─────────────────────────────────────────────────────────┐
│                   PRESENTATION LAYER                     │
│  (Pages, Widgets, BLoCs, State Management)               │
├─────────────────────────────────────────────────────────┤
│                   DOMAIN LAYER                           │
│  (Use Cases, Repositories Interfaces, Entities)          │
├─────────────────────────────────────────────────────────┤
│                   DATA LAYER                             │
│  (Repositories, Data Sources, Models)                    │
├─────────────────────────────────────────────────────────┤
│                   CORE LAYER                             │
│  (Utils, Services, Theme, Widgets, Error Handling)       │
└─────────────────────────────────────────────────────────┘
```

### Key Architectural Patterns

1. **Clean Architecture** - Separation of concerns across layers
2. **BLoC Pattern** - State management with clear events/states
3. **Repository Pattern** - Abstraction of data sources
4. **Service Locator** - Dependency injection with `get_it`
5. **Functional Programming** - Immutable data with `fpdart` and `equatable`

### Data Flow

```
UI (Page/Widget)
    ↓
BLoC (Events)
    ↓
Use Cases (Business Logic)
    ↓
Repositories (Data Abstraction)
    ↓
Data Sources (Local DB / Remote API)
    ↓
Hive Database (Persistent Storage)
```

---

## 🚀 Installation

### Prerequisites

- Flutter SDK 3.1.0 or later
- Dart SDK 3.x
- Android SDK 21+ (for Android build)
- Xcode 14+ (for iOS build)
- Git

### Step-by-Step Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/flutter_billing_app.git
   cd flutter_billing_app
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Build Files** (for JSON serialization & Hive adapters)
   ```bash
   flutter pub run build_runner build
   ```

4. **Run the App**
   ```bash
   flutter run
   ```

### Platform-Specific Setup

**Android:**
```bash
flutter run -d [DEVICE_ID] # List devices with: flutter devices
```

**iOS:**
```bash
cd ios
pod install
cd ..
flutter run
```

**Web:**
```bash
flutter run -d chrome
```

---

## ⚙️ Configuration

### Theme Customization

Edit `lib/core/theme/app_theme.dart` to customize:

- **Colors**: Primary (`#6C63FF`), Secondary (`#03DAC6`), Accent (`#FF6B6B`)
- **Shadows**: 4-level system (sm, md, lg, xl)
- **Typography**: 8 text styles from displayLarge to bodySmall

### Service Configuration

**Billing Stats Service** (`lib/core/services/billing_stats_service.dart`)
```dart
// Calculate daily sales
double dailySales = BillingStatsService.calculateDailySales(transactions);

// Get average transaction value
double avgValue = BillingStatsService.getAverageTransaction(transactions);
```

**App Utilities Service** (`lib/core/services/app_utilities_service.dart`)
```dart
// Generate unique transaction ID
String id = AppUtilitiesService.generateTransactionId();

// Validate email
bool valid = AppUtilitiesService.isValidEmail(email);
```

**Shop Config Service** (`lib/features/shop/domain/services/shop_config_service.dart`)
```dart
// Load shop configuration from BLoC
await ShopConfigService.loadShopFromContext(context);

// Get shop display name
String name = ShopConfigService.getShopDisplayName();
```

---

## 📖 Usage Guide

### Starting the App
1. Launch the app - splash screen displays for 3 seconds
2. Navigate to Home page for barcode scanning
3. Access features via Settings menu

### Adding Products
1. Go to **Settings** → **Products**
2. Tap **Add Product**
3. Enter product details (name, price, barcode)
4. Save product

### Processing a Sale
1. **Scan Products** - Use barcode scanner or enter product ID
2. **Add to Cart** - Product appears with quantity controls
3. **Review Cart** - Check items and quantities
4. **Checkout** - Select payment method (Cash/Card/UPI)
5. **Generate Receipt** - Print or share receipt

### Viewing Analytics
1. Go to **Settings** → **Dashboard** for overview
2. Go to **Settings** → **Reports** for detailed analytics
3. Use period filters (Today/Week/Month/Year)
4. View payment breakdown and top products

### Configuring Shop Details
1. Go to **Settings** → **Shop Details**
2. Fill in business information
3. Add payment methods (UPI ID)
4. Customize receipt footer
5. Changes saved automatically

---

## 🔌 API Reference

### BLoC Events & States

**BillingBloc**
```dart
// Events
AddToCart(Product product)
RemoveFromCart(String productId)
ClearCart()
CheckoutCart(PaymentMethod method)

// States
BillingInitial()
BillingLoaded(List<CartItem> items, double total)
BillingSuccess(String transactionId)
BillingError(String message)
```

**ProductBloc**
```dart
// Events
GetAllProducts()
AddProduct(Product product)
UpdateProduct(Product product)
DeleteProduct(String productId)

// States
ProductInitial()
ProductLoading()
ProductLoaded(List<Product> products)
ProductError(String failure)
```

**ShopBloc**
```dart
// Events
LoadShop()
UpdateShop(Shop shop)

// States
ShopInitial()
ShopLoaded(Shop shop)
ShopError(String failure)
```

### Services

**BillingStatsService** - Static calculation methods
```dart
static double calculateDailySales(List<Transaction> transactions)
static double getAverageTransaction(List<Transaction> transactions)
static List<Product> getTopProducts(List<Transaction> transactions, {int limit = 5})
static String formatCurrency(double amount)
static String formatDate(DateTime date)
static double getSalesTrend(double oldAmount, double newAmount)
```

**AppUtilitiesService** - General utilities
```dart
static String generateTransactionId()
static bool isValidEmail(String email)
static bool isValidPhone(String phone)
static bool isValidUpiId(String upiId)
static Future<void> shareApp() → uses Share.share
static bool isToday(DateTime date)
static String getRelativeDateString(DateTime date)
```

---

## 💾 Database Schema

### Hive Collections

**Products**
```dart
@HiveType()
class Product {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final double price;
  
  @HiveField(3)
  final String barcode;
  
  @HiveField(4)
  final String category;
  
  @HiveField(5)
  final String? description;
}
```

**Shop**
```dart
@HiveType()
class Shop {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final String phone;
  
  @HiveField(3)
  final String addressLine1;
  
  @HiveField(4)
  final String addressLine2;
  
  @HiveField(5)
  final String upiId;
}
```

**Transactions** (for history tracking)
```dart
@HiveType()
class Transaction {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final DateTime timestamp;
  
  @HiveField(2)
  final List<CartItem> items;
  
  @HiveField(3)
  final double totalAmount;
  
  @HiveField(4)
  final String paymentMethod;
}
```

---

## 🔨 Building & Deployment

### Build APK (Android)
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle (for Google Play)
flutter build appbundle --release
```

### Build AAB (Android App Bundle)
```bash
flutter build appbundle --release
```

### Build iOS
```bash
flutter build ios --release
```

### Build Web
```bash
flutter build web --release
```

### Deployment Checklist
- [ ] Increase version number in `pubspec.yaml`
- [ ] Update app changelog
- [ ] Run `flutter clean` before building
- [ ] Test on multiple devices
- [ ] Check all analytics features
- [ ] Verify database backup/restore
- [ ] Test print functionality with real printer
- [ ] Review permissions and privacy policy

---

## 🐛 Troubleshooting

### Common Issues

**Issue: Asset not found - "Unable to load asset: assets/logo.png"**
```
Solution: Ensure assets/logo.png exists and is registered in pubspec.yaml:
flutter:
  assets:
    - assets/logo.png
Then run: flutter clean && flutter pub get
```

**Issue: Build errors with BLoC**
```
Solution: Regenerate BLoC files with:
flutter pub run build_runner build --delete-conflicting-outputs
```

**Issue: Hive boxes not found**
```
Solution: Ensure HiveDatabase is initialized in main():
await HiveDatabase.init();
```

**Issue: Barcode scanner not working**
```
Solution: Check camera permissions in device settings
For Android: Settings → Apps → YourApp → Permissions → Camera
For iOS: Check Info.plist camera permissions
```

**Issue: Thermal printer not connecting**
```
Solution: 
1. Enable Bluetooth on device
2. Pair printer device first
3. In app settings, select printer from paired devices
4. Test print with sample receipt
```

**Issue: Navigation not working**
```
Solution: Verify GoRouter configuration in app_routes.dart
Ensure all route paths are unique and properly imported
```

### Debug Commands

```bash
# Enable verbose logging
flutter run -v

# Run analyzer
flutter analyze

# Check dependencies
flutter pub deps

# Version info
flutter --version
dart --version

# Clean and rebuild
flutter clean
flutter pub get
flutter pub run build_runner build
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. **Fork the repository**
2. **Create feature branch** (`git checkout -b feature/amazing-feature`)
3. **Commit changes** (`git commit -m 'Add amazing feature'`)
4. **Push to branch** (`git push origin feature/amazing-feature`)
5. **Open Pull Request**

### Code Style Guidelines
- Follow Dart style guide
- Use meaningful variable/function names
- Add comments for complex logic
- Run `flutter analyze` before committing
- Format code with `flutter format`

### Commit Message Format
```
[Type]: Brief description

Detailed explanation of changes (optional)

Type: feat, fix, docs, style, refactor, test, chore
```

---

## 📝 License

This project is licensed under the **MIT License** - see the LICENSE file for details.

---

## 👨‍💻 Author

**BillGo Development Team**

## 📞 Support

For issues, feature requests, or questions:
- Open an issue on GitHub
- Email: support@billgo.app
- Documentation: [Wiki](https://github.com/yourusername/flutter_billing_app/wiki)

## 🎯 Roadmap

### v1.1.0 (Planned)
- [ ] Multi-language support
- [ ] Dark mode theme variant
- [ ] Advanced inventory management
- [ ] Customer management module
- [ ] Sales export to CSV/PDF

### v1.2.0 (Future)
- [ ] Cloud backup & sync
- [ ] Multi-location support
- [ ] Advanced reporting with charts
- [ ] Automated stock alerts
- [ ] Payment gateway integration

### v2.0.0 (Long-term)
- [ ] Web dashboard
- [ ] API backend integration
- [ ] Advanced analytics with ML
- [ ] Customer loyalty program
- [ ] Third-party integrations

---

## 📊 Statistics

- **Lines of Code**: ~5,000+
- **Features**: 15+
- **Pages**: 8
- **Services**: 3
- **BLoCs**: 3
- **Dependencies**: 25+

---

**Made with ❤️ using Flutter**

Last Updated: March 7, 2026 | Version: 1.0.0 
