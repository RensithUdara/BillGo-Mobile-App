import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/services/app_utilities_service.dart';
import '../../../../core/theme/app_theme.dart';

class HelpAboutPage extends StatelessWidget {
  const HelpAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          title: const Text('Help & About'),
          backgroundColor: AppTheme.surfaceColor,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Container(
              color: AppTheme.surfaceColor,
              child: const TabBar(
                labelColor: AppTheme.primaryColor,
                unselectedLabelColor: AppTheme.textLight,
                indicatorColor: AppTheme.primaryColor,
                tabs: [
                  Tab(text: 'Help'),
                  Tab(text: 'About'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildHelpTab(context),
            _buildAboutTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpTab(BuildContext context) {
    final helpItems = [
      {
        'title': 'Getting Started',
        'icon': Icons.rocket_launch,
        'description': 'Learn the basics of BillGo',
      },
      {
        'title': 'Add Products',
        'icon': Icons.add_shopping_cart,
        'description': 'How to add and manage products',
      },
      {
        'title': 'Scanning Barcodes',
        'icon': Icons.qr_code_scanner,
        'description': 'Scan products using the camera',
      },
      {
        'title': 'Printing Receipts',
        'icon': Icons.print,
        'description': 'Connect and print receipts',
      },
      {
        'title': 'Shop Configuration',
        'icon': Icons.storefront,
        'description': 'Set up your shop details',
      },
      {
        'title': 'Troubleshooting',
        'icon': Icons.build,
        'description': 'Common issues and solutions',
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Frequently Asked Questions',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          ...helpItems.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: AppTheme.shadowMd,
                ),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      item['icon'] as IconData,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  title: Text(
                    item['title'] as String,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  subtitle: Text(item['description'] as String),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () =>
                      _showHelpDetail(context, item['title'] as String),
                ),
              ),
            );
          }),
          const SizedBox(height: 24),
          _buildContactCard(context),
        ],
      ),
    );
  }

  Widget _buildAboutTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App Info Card
          Container(
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(14),
              boxShadow: AppTheme.shadowMd,
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: AppTheme.shadowLg,
                  ),
                  child: Center(
                    child: Text(
                      'BG',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  AppUtilitiesService.appName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Smart Billing Solution',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textLight,
                      ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'v${AppUtilitiesService.appVersion}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Features
          Text(
            'Features',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          ...[
            'Barcode scanning',
            'Receipt printing',
            'Sales analytics',
            'Product management',
            'Multiple payment methods',
            'Shop configuration',
          ].map((feature) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.check_circle,
                      color: AppTheme.successColor, size: 20),
                  const SizedBox(width: 12),
                  Text(feature, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            );
          }),
          const SizedBox(height: 24),

          // About Section
          Text(
            'About',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: AppTheme.shadowMd,
            ),
            padding: const EdgeInsets.all(16),
            child: Text(
              'BillGo is a modern, easy-to-use billing and inventory management app designed for small to medium-sized businesses. '
              'With barcode scanning, receipt printing, and comprehensive analytics, BillGo makes managing your sales effortless.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.6,
                  ),
            ),
          ),
          const SizedBox(height: 24),

          // Actions
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => AppUtilitiesService.shareApp(),
              icon: const Icon(Icons.share),
              label: const Text('Share App'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _openUrl('https://example.com/privacy'),
              icon: const Icon(Icons.privacy_tip),
              label: const Text('Privacy Policy'),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _openUrl('https://example.com/terms'),
              icon: const Icon(Icons.description),
              label: const Text('Terms of Service'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryColor.withValues(alpha: 0.3)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Need Help?',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Contact our support team for any issues or questions.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _openUrl(
                  'mailto:support@billgoapp.com?subject=Support Request'),
              child: const Text('Contact Support'),
            ),
          ),
        ],
      ),
    );
  }

  void _showHelpDetail(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'Detailed information about $title will be displayed here.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                    ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
