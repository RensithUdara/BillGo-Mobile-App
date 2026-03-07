import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillingStatsService {
  static final BillingStatsService _instance = BillingStatsService._internal();

  factory BillingStatsService() {
    return _instance;
  }

  BillingStatsService._internal();

  /// Calculate total sales for a given date
  static double calculateDailySales(List<Map<String, dynamic>> transactions) {
    return transactions.fold(0.0, (sum, t) => sum + (t['amount'] as double));
  }

  /// Get average transaction amount
  static double getAverageTransaction(List<Map<String, dynamic>> transactions) {
    if (transactions.isEmpty) return 0.0;
    double total = calculateDailySales(transactions);
    return total / transactions.length;
  }

  /// Get top selling products
  static List<Map<String, dynamic>> getTopProducts(
    List<Map<String, dynamic>> products,
  ) {
    List<Map<String, dynamic>> sorted =
        List.from(products)..sort((a, b) => (b['sold'] ?? 0).compareTo(a['sold'] ?? 0));
    return sorted.take(5).toList();
  }

  /// Format currency
  static String formatCurrency(double amount) {
    return '₹${amount.toStringAsFixed(2)}';
  }

  /// Get formatted date
  static String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  /// Get formatted time
  static String formatTime(DateTime time) {
    return DateFormat('hh:mm a').format(time);
  }

  /// Get week day name
  static String getWeekDay(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  /// Check if shop is configured
  static bool validateShopConfig({
    required String shopName,
    required String address,
    required String phone,
  }) {
    return shopName.isNotEmpty && address.isNotEmpty && phone.isNotEmpty;
  }

  /// Get sales trend (increases/decreases)
  static String getSalesTrend(double current, double previous) {
    if (previous == 0) return '+100%';
    double percentage = ((current - previous) / previous) * 100;
    String sign = percentage >= 0 ? '+' : '';
    return '$sign${percentage.toStringAsFixed(1)}%';
  }
}
