import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String _username = 'Piyush';
  String _email = 'piyush@gmail.com'; // Add user's email

  @override
  void initState() {
    super.initState();
    // Fetch the username and email of the logged-in user from Firebase
    // Example: _username = FirebaseAuth.instance.currentUser.displayName ?? 'User';
    //          _email = FirebaseAuth.instance.currentUser.email ?? 'Email';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              // Show bottom sheet when settings button is pressed
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(35), // Set top left border radius
                      topRight:
                          Radius.circular(35), // Set top right border radius,
                    ),
                    child: _buildSettingsBottomSheet(),
                  );
                },
              );
            },
            icon: Icon(Icons.settings),
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h), // Add vertical space
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60.w,
                  backgroundImage: AssetImage('assets/images/user_avatar.jpg'),
                ),
                SizedBox(height: 20.h),
                Text(
                  '$_username',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h), // Adjust spacing
                Text(
                  _email, // Display user's email
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality to edit profile
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'My Posts', // Add text before the images
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildWebImage(
                        'https://firebasestorage.googleapis.com/v0/b/pinterest-clone-8a9be.appspot.com/o/pexels-hatice-baran-20335182.jpg?alt=media&token=f2e54e3d-f1fa-4b1c-abd7-b09fb2581e64'),
                    _buildWebImage(
                        'https://firebasestorage.googleapis.com/v0/b/pinterest-clone-8a9be.appspot.com/o/pexels-cup-of-couple-7657593.jpg?alt=media&token=b229e15e-ee1a-4e06-8d7f-63f59024bb94'),
                    _buildWebImage('https://firebasestorage.googleapis.com/v0/b/pinterest-clone-8a9be.appspot.com/o/pexels-julien-riedel-20263254.jpg?alt=media&token=dc32f118-fc2d-480a-b245-7d7ab8d7e18e'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWebImage(String imageUrl) {
    return Image.network(
      imageUrl,
      width: 50.w,
      height: 70.h,
    );
  }

  Widget _buildSettingsBottomSheet() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade900, // Set background color to grey
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35), // Set top left border radius
          topRight: Radius.circular(35), // Set top right border radius
        ),
      ),
      child: Container(
        // Remove explicit height to allow the ListView to adjust its height
        width: double.infinity, // Take full width of the page
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: ListView(
          shrinkWrap: true, // Adjust height to contain all items
          children: [
            _buildSettingsItem('Notifications'),
            _buildSettingsItem('Privacy and Data'),
            _buildSettingsItem('Security'),
            _buildSettingsItem('Get Help'),
            _buildSettingsItem('Terms of Service'),
            _buildSettingsItem('Privacy Policy'),
            _buildSettingsItem('About'),
            SizedBox(height: 20.h),
            Center(
              child: TextButton(
                onPressed: () {
                  // Navigate to the login page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginPage()), // Replace current route with login page
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.red, // Set the icon color to red
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red, // Set the text color to red
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(), // Push the arrow icon to the rightmost end
          Icon(
            Icons.arrow_forward_ios, // Arrow icon
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
