import 'package:flutter/material.dart';
import 'package:saloon/theme/assets.dart';
import 'package:saloon/theme/colors.dart';
import 'package:saloon/theme/fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: _buildAppBarTitle(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.black),
                  onPressed: () {
                    // Bell icon action here
                  },
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBanner(),
              SizedBox(height: 24),
              Text("Our Services", style: AppTextStyles.servicesText),
              SizedBox(height: 16),
              _buildServicesGrid(),
              SizedBox(height: 24),
              _buildRatingImage(),  // Added image between Our Services and Best Saloons
              SizedBox(height: 24),
              Text("Best Saloons", style: AppTextStyles.bestSaloonText),
              SizedBox(height: 16),
              _buildBestSalonsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return Row(
      children: [
        Text("Hello,", style: AppTextStyles.servicesText),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            // Implement login navigation here
          },
          child: Row(
            children: [
              Text(
                "Login / Signup",
                style: AppTextStyles.loginText.copyWith(
                  color: AppColors.secondary, // Updated color
                  fontSize: 19, // Updated font size
                  fontWeight: FontWeight.w600, // Updated font weight
                  height: 23.16 / 19, // Updated line height
                ),
              ),
              SizedBox(width: 4), // Adjust spacing between text and icon
              // Image.asset(
              //   AssetPaths.loginIcon,
              //   width: 23,
              //   height: 23,
              //   fit: BoxFit.contain,
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        AssetPaths.imagewithrating, // Updated banner image
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildServicesGrid() {
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildServiceItem(AssetPaths.hairCare, "Hair Care"),
        _buildServiceItem(AssetPaths.faceCare, "Face Care"),
        _buildServiceItem(AssetPaths.nailCare, "Nail Care"),
        _buildServiceItem(AssetPaths.footCare, "Foot Care"),
        _buildServiceItem(AssetPaths.barberScissors, "Hair Style"),
        _buildServiceItem(AssetPaths.colouring, "Coloring"),
        _buildServiceItem(AssetPaths.bridal, "Bridal"),
        _buildServiceItem(AssetPaths.booking, "Booking"),
      ],
    );
  }

  Widget _buildServiceItem(String imagePath, String title) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.secondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: AppTextStyles.servicesText.copyWith(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRatingImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        AssetPaths.rating,  // Using the new rating image provided
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildBestSalonsList() {
    return Column(
      children: [
        _buildSalonCard(
          AssetPaths.salonChamath1,
          'Saloon Chamath',
          4.2,
          832,
        ),
        _buildSalonCard(
          AssetPaths.salonChamath2,
          'Saloon Chamath',
          4.6,
          1000,
        ),
        _buildSalonCard(
          AssetPaths.salonChamath3,
          'Saloon Chamath',
          4.1,
          700,
        ),
      ],
    );
  }

  Widget _buildSalonCard(String imageUrl, String salonName, double rating, int reviews) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(salonName, style: AppTextStyles.saloonName),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: AppTextStyles.ratingText.copyWith(fontSize: 12),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '$reviews reviews',
                          style: AppTextStyles.reviewsText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 4, // Adjust to position the rating icon and text
            right: 4,
            child: _buildRatingBadge(rating),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBadge(double rating) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.amber, size: 12),
          SizedBox(width: 4),
          Text(
            rating.toString(),
            style: AppTextStyles.ratingText.copyWith(
              fontFamily: 'Montserrat',
              fontSize: 11,
              fontWeight: FontWeight.w400,
              height: 13.41 / 11,
            ),
          ),
        ],
      ),
    );
  }
}