import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../entities/shop.dart';

class ShopConfigService {
  static final ShopConfigService _instance = ShopConfigService._internal();

  factory ShopConfigService() {
    return _instance;
  }

  ShopConfigService._internal();

  Shop? _cachedShop;

  Shop? get cachedShop => _cachedShop;

  void updateCachedShop(Shop shop) {
    _cachedShop = shop;
  }

  void clearCache() {
    _cachedShop = null;
  }

  /// Load shop from bloc context
  static Future<Shop?> loadShopFromContext(BuildContext context) async {
    try {
      final state = context.read<ShopBloc>().state;
      if (state is ShopLoaded) {
        return state.shop;
      }
      return null;
    } catch (e) {
      debugPrint('Error loading shop from context: $e');
      return null;
    }
  }

  /// Check if shop has been configured
  static bool isShopConfigured(Shop shop) {
    return shop.name.isNotEmpty &&
        shop.addressLine1.isNotEmpty &&
        shop.phoneNumber.isNotEmpty;
  }

  /// Get display name for shop
  static String getShopDisplayName(Shop shop) {
    return shop.name.isNotEmpty ? shop.name : 'My Shop';
  }

  /// Get full address
  static String getFullAddress(Shop shop) {
    if (shop.addressLine1.isEmpty) return '';
    if (shop.addressLine2.isEmpty) return shop.addressLine1;
    return '${shop.addressLine1}, ${shop.addressLine2}';
  }
}
