import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class MixerScreen extends StatefulWidget {
  const MixerScreen({super.key});

  @override
  State<MixerScreen> createState() => _MixerScreenState();
}

class _MixerScreenState extends State<MixerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Status Bar Area
            const SizedBox(height: 8),

            // Custom App Bar - Exact positioning
            _buildAppBar(),

            const SizedBox(height: 20),

            // Filter Section - Exact positioning
            _buildFilterSection(),

            // Main Content - Exact center positioning
            Expanded(
              child: _buildMainContent(),
            ),

            // Bottom Navigation - Exact positioning
            _buildBottomNavigation(),

            // Bottom safe area
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Mixer',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              letterSpacing: -0.5,
            ),
          ),
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.settings_outlined,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.notifications_none_outlined,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          _buildFilterChip('🎯 Filters', true),
          const SizedBox(width: 12),
          _buildFilterChip('Age ▾', false),
          const SizedBox(width: 12),
          _buildFilterChip('Height ▾', false),
          const SizedBox(width: 12),
          _buildFilterChip('Hat', false),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.lightPurple : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: isSelected ? AppColors.darkPurple : AppColors.borderGrey,
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isSelected ? AppColors.darkPurple : AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Images Stack - Using LOCAL ASSETS with perfect overlapping
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Left profile - Pink gradient (FIRST - bottom layer)
                Positioned(
                  left: 60,
                  child: _buildExactProfileCircle(
                    [AppColors.pinkStart, AppColors.pinkEnd],
                    'assets/img/img1.png', // LEFT IMAGE
                  ),
                ),

                // Right profile - Orange gradient (SECOND - middle layer)
                Positioned(
                  right: 60,
                  child: _buildExactProfileCircle(
                    [AppColors.orangeStart, AppColors.orangeEnd],
                    'assets/img/immgr.png', // RIGHT IMAGE
                  ),
                ),

                // Center profile - Gray background (LAST - top layer, overlaps both)
                Positioned(
                  child: _buildExactProfileCircle(
                    [AppColors.grayStart, AppColors.grayEnd],
                    'assets/img/imgl.png', // MIDDLE IMAGE
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 48),

          // Main Text - Exact text from design
          const Text(
            "You've seen everyone nearby",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              letterSpacing: -0.3,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Subtitle - Exact text from design
          const Text(
            'No more profiles in your area. Check back later or\nexpand your location to see more people.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 48),

          // Adjust Location Button - Exact styling
          Container(
            width: double.infinity,
            height: 56,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: LinearGradient(
                colors: [AppColors.primaryPurple, AppColors.darkPurple],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryPurple.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/subscription');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Adjust Location',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Updated profile circle using LOCAL ASSET IMAGES
  Widget _buildExactProfileCircle(List<Color> gradientColors, String assetPath) {
    return Container(
      width: 84,
      height: 84,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 38,
              backgroundImage: AssetImage(assetPath), // Using AssetImage for local files
              backgroundColor: Colors.grey,
              onBackgroundImageError: (exception, stackTrace) {
                // Fallback if image fails to load
                debugPrint('Error loading image: $assetPath');
              },
              child: null, // Will show image if loaded, otherwise background color
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        children: [
          // Bottom indicator line (like in design)
          Container(
            width: 134,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.textLight.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          // Navigation icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(Icons.favorite_border, false),
              _buildBottomNavItem(Icons.explore_outlined, false),
              _buildBottomNavItem(Icons.camera_alt_outlined, false),
              _buildBottomNavItem(Icons.remove_red_eye_outlined, false),
              _buildBottomNavItem(Icons.person_outline, false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Icon(
        icon,
        color: isSelected ? AppColors.primaryPurple : AppColors.textLight,
        size: 28,
      ),
    );
  }
}
