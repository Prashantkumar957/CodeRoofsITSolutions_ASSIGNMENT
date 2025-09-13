import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility_outlined, color: Colors.black, size: 22),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Photo Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Top Row: Main photo + 2 smaller photos
                  Row(
                    children: [
                      // Main Photo (Large)
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.shade200,
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.grey.shade300,
                                  child: const Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              // Main Badge
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF3B82F6),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Text(
                                    'Main',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              // Close Button
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Right Column: 2 smaller photos
                      Expanded(
                        child: Column(
                          children: [
                            _buildSmallPhotoContainer(95),
                            const SizedBox(height: 8),
                            _buildSmallPhotoContainer(95),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Bottom Row: 3 equal photos
                  Row(
                    children: [
                      Expanded(child: _buildSmallPhotoContainer(120)),
                      const SizedBox(width: 8),
                      Expanded(child: _buildSmallPhotoContainer(120)),
                      const SizedBox(width: 8),
                      Expanded(child: _buildSmallPhotoContainer(120)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Your Details Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Profile Details List
                  ...profileDetails.map((detail) => _buildDetailItem(
                    detail['icon'] as IconData,
                    detail['title'] as String,
                  )),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Perfect Match Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      offset: const Offset(0, 2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Discover your Perfect Match',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Avatar Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildAvatar(const Color(0xFFEC4899)),
                        const SizedBox(width: 12),
                        _buildAvatar(const Color(0xFF3B82F6)),
                        const SizedBox(width: 12),
                        _buildAvatar(const Color(0xFF10B981)),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Quiz Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7C3AED),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: const Text(
                          'Take the quiz again',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallPhotoContainer(double height) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey.shade300,
              child: const Icon(
                Icons.person,
                size: 40,
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF6B7280),
            size: 20,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF374151),
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF9CA3AF),
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(Color color) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person,
        color: color,
        size: 24,
      ),
    );
  }
}

final List<Map<String, dynamic>> profileDetails = [
  {'icon': Icons.person_outline, 'title': 'About me (Bio)'},
  {'icon': Icons.search, 'title': 'What are you looking for?'},
  {'icon': Icons.wc, 'title': 'Gender'},
  {'icon': Icons.cake_outlined, 'title': 'Birthday (Age)'},
  {'icon': Icons.height, 'title': 'Height'},
  {'icon': Icons.favorite_outline, 'title': 'Interested in?'},
  {'icon': Icons.transgender, 'title': 'Sexuality'},
  {'icon': Icons.family_restroom, 'title': 'Relationship'},
  {'icon': Icons.public, 'title': 'Ethnicity'},
  {'icon': Icons.child_care, 'title': 'Kids'},
  {'icon': Icons.local_bar_outlined, 'title': 'Drinking'},
  {'icon': Icons.smoking_rooms_outlined, 'title': 'Smoking'},
  {'icon': Icons.grass, 'title': 'Marijuana'},
  {'icon': Icons.church_outlined, 'title': 'Religious Beliefs'},
  {'icon': Icons.how_to_vote, 'title': 'Political Views'},
  {'icon': Icons.interests_outlined, 'title': 'Interest and Hobbies'},
  {'icon': Icons.diamond_outlined, 'title': 'Values & Lifestyle'},
];
