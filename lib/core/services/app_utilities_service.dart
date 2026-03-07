import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class AppUtilitiesService {
  static final AppUtilitiesService _instance = AppUtilitiesService._internal();

  factory AppUtilitiesService() {
    return _instance;
  }

  AppUtilitiesService._internal();

  static const String appVersion = '1.0.0';
  static const String appName = 'BillGo';

  /// Generate unique transaction ID
  static String generateTransactionId() {
    return 'TXN_${DateTime.now().millisecondsSinceEpoch}';
  }

  /// Validate email
  static bool isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  /// Validate phone number
  static bool isValidPhone(String phone) {
    return RegExp(r'^[0-9]{10,}$').hasMatch(phone.replaceAll(RegExp(r'[^0-9]'), ''));
  }

  /// Validate UPI ID
  static bool isValidUpiId(String upiId) {
    return RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+$').hasMatch(upiId);
  }

  /// Share app
  static Future<void> shareApp() async {
    await Share.share(
      'Check out BillGo - Smart Billing Solution\nDownload now!',
      subject: 'BillGo App',
    );
  }

  /// Get total days in month
  static int getDaysInMonth(int month, int year) {
    DateTime firstDayNextMonth = DateTime(year, month + 1, 1);
    DateTime lastDayThisMonth = firstDayNextMonth.subtract(const Duration(days: 1));
    return lastDayThisMonth.day;
  }

  /// Generate barcode (simplified)
  static String generateBarcode() {
    return 'BC_${DateTime.now().millisecondsSinceEpoch}';
  }

  /// Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  /// Check if date is yesterday
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  /// Get relative date string
  static String getRelativeDateString(DateTime date) {
    if (isToday(date)) {
      return 'Today';
    } else if (isYesterday(date)) {
      return 'Yesterday';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
