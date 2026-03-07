import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String _selectedPeriod = 'Today';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Reports & Analytics'),
        backgroundColor: AppTheme.surfaceColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Period Selector
            _buildPeriodSelector(context),
            const SizedBox(height: 24),

            // Sales Chart
            _buildSalesChart(),
            const SizedBox(height: 24),

            // Key Metrics
            _buildKeyMetrics(),
            const SizedBox(height: 24),

            // Sales by Category
            _buildSalesByCategory(),
            const SizedBox(height: 24),

            // Payment Methods
            _buildPaymentMethods(),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodSelector(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppTheme.shadowMd,
      ),
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              ['Today', 'This Week', 'This Month', 'This Year'].map((period) {
            final isSelected = _selectedPeriod == period;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: FilterChip(
                label: Text(period),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() => _selectedPeriod = period);
                },
                backgroundColor: Colors.transparent,
                selectedColor: AppTheme.primaryColor.withValues(alpha: 0.2),
                labelStyle: TextStyle(
                  color:
                      isSelected ? AppTheme.primaryColor : AppTheme.textLight,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSalesChart() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppTheme.shadowMd,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sales Trend',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppTheme.backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.show_chart,
                    size: 40,
                    color: AppTheme.primaryColor.withValues(alpha: 0.3),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Chart data will appear here',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textLight,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyMetrics() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Metrics',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.surfaceColor,
            borderRadius: BorderRadius.circular(14),
            boxShadow: AppTheme.shadowMd,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildMetricRow('Total Sales', 'Rs.0.00', AppTheme.successColor),
              const Divider(height: 16),
              _buildMetricRow('Total Orders', '0', AppTheme.primaryColor),
              const Divider(height: 16),
              _buildMetricRow(
                  'Average Order Value', 'Rs.0.00', AppTheme.secondaryColor),
              const Divider(height: 16),
              _buildMetricRow('Items Sold', '0 units', AppTheme.accentColor),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetricRow(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
        ),
      ],
    );
  }

  Widget _buildSalesByCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Products',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.surfaceColor,
            borderRadius: BorderRadius.circular(14),
            boxShadow: AppTheme.shadowMd,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.inbox,
                        size: 40,
                        color: AppTheme.primaryColor.withValues(alpha: 0.3),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'No product data',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Methods',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.surfaceColor,
            borderRadius: BorderRadius.circular(14),
            boxShadow: AppTheme.shadowMd,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildPaymentRow('Cash', 'Rs.0.00', 0.0),
              const Divider(height: 16),
              _buildPaymentRow('Card', 'Rs.0.00', 0.0),
              const Divider(height: 16),
              _buildPaymentRow('UPI', 'Rs.0.00', 0.0),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentRow(String method, String amount, double percentage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              method,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 4,
              width: 100,
              decoration: BoxDecoration(
                color: AppTheme.dividerColor,
                borderRadius: BorderRadius.circular(2),
              ),
              child: FractionallySizedBox(
                widthFactor: percentage,
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              '${(percentage * 100).toStringAsFixed(0)}%',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textLight,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
