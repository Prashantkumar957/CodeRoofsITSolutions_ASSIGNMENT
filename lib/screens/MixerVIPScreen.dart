import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class MixerVIPScreen extends StatefulWidget {
  const MixerVIPScreen({super.key});

  @override
  State<MixerVIPScreen> createState() => _MixerVIPScreenState();
}

class _MixerVIPScreenState extends State<MixerVIPScreen> {
  bool isVIPSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightOrange,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            _buildAppBar(),

            // Content
            Expanded(
              child: _buildContent(),
            ),

            // Continue Button
            _buildContinueButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Mixer',
            style: AppTextStyles.h3,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.close,
              color: AppColors.textSecondary,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // Title
          const Text(
            'Level Up Your Mixer Experience',
            style: AppTextStyles.h2,
          ),

          const SizedBox(height: 32),

          // Select a plan
          const Text(
            'Select a plan',
            style: AppTextStyles.bodyMedium,
          ),

          const SizedBox(height: 16),

          // Pricing Cards
          Row(
            children: [
              Expanded(
                child: _buildPricingCard(
                  title: 'Mixer',
                  price: '\$24.99',
                  subtitle: 'All of the below',
                  isSelected: !isVIPSelected,
                  backgroundColor: AppColors.white,
                  heartColor: Colors.pink,
                  onTap: () {
                    setState(() {
                      isVIPSelected = false;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildPricingCard(
                  title: 'Mixer VIP',
                  price: '\$99.99',
                  subtitle: 'Mixer + VIP seating,\nfood & beverages',
                  isSelected: isVIPSelected,
                  backgroundColor: AppColors.white,
                  heartColor: Colors.orange,
                  onTap: () {
                    setState(() {
                      isVIPSelected = true;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Features List
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderGrey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Included with Mixer VIP',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                _buildFeatureItem('Unlimited Likes'),
                _buildFeatureItem('See who liked you'),
                _buildFeatureItem('Find people with wide range'),
                _buildFeatureItem('Access to events'),
                _buildFeatureItem('VIP seating, food & beverages'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPricingCard({
    required String title,
    required String price,
    required String subtitle,
    required bool isSelected,
    required Color backgroundColor,
    required Color heartColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.orange : AppColors.borderGrey,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: heartColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: heartColor,
                    size: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: title == 'Mixer VIP' ? AppTextStyles.priceTextOrange : AppTextStyles.priceText,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppTextStyles.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            color: Colors.green,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Handle continue action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite,
                    color: AppColors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Continue - \$99.99 total',
                    style: AppTextStyles.buttonText,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'By continuing, you agree to be charged, with auto-renewal until cancelled\nin App Store Settings, under Mixer\'s Terms.',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
