import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.only(
          top: 100.h, // Adjusting top padding to move chats down
          bottom: 20.h,
          left: 20.w,
          right: 20.w,
        ),
        children: [
          _buildChatMessage(
            sender: 'John Doe',
            message: 'Hey, how are you?',
            time: '10:00 AM',
            isUnread: true, // Marking as unread
          ),
          SizedBox(height: 20.h),
          _buildChatMessage(
            sender: 'Jane Smith',
            message: 'I\'m doing great, thanks!',
            time: '10:05 AM',
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessage({
    required String sender,
    required String message,
    required String time,
    bool isUnread = false, // Added parameter to mark message as unread
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30.w,
            backgroundImage: AssetImage('assets/images/user_avatar.jpg'),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sender,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            time,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),
          if (isUnread) // Show the red indicator only if the message is unread
            Container(
              margin: EdgeInsets.only(left: 10.w),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
