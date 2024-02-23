import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/user_profile_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_firebase/screens/home_screen.dart';
import 'package:flutter_firebase/screens/message_screen.dart';
import 'package:flutter_firebase/screens/profile_Screen.dart';
import 'package:flutter_firebase/screens/search_screen.dart';
import 'package:file_picker/file_picker.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int pageIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const MessageScreen(),
    const ProfileScreen(),
    const UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(),
      bottomNavigationBar: Container(
        height: 66,
        padding: const EdgeInsets.fromLTRB(27, 0, 27, 2),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: pageIndex,
          unselectedItemColor: Colors.grey.shade700,
          selectedItemColor: Colors.white,
          iconSize: 26,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });

            if (index == 2) {
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                builder: (BuildContext context) {
                  return _bottomSheetContainer();
                },
              );
            }
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text_fill),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 15,
                child: Text(
                  "P",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              label: "home",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return pages[pageIndex];
  }

  Widget _bottomSheetContainer() {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        height: 212.h,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CupertinoIcons.xmark,
                      color: Colors.white,
                      size: 24,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 78),
                  child: Text(
                    "Start creating now",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _optionsButton(CupertinoIcons.pin, "Pin"),
                _optionsButton(Icons.dashboard, "Board"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _optionsButton(IconData icon, String string) {
  return Center(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          width: 70.w,
          height: 70.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade800,
          ),
          child: Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (string == "Pin") {
                  // Show file upload options for pin
                  _showFileUploadOptions();
                } else if (string == "Board") {
                  // Show file upload options for board
                  _showFileUploadOptions();
                }
              },
              child: Icon(
                icon,
                size: 26,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          string,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

void _showFileUploadOptions() async {
  // Show file picker dialog
  final result = await FilePicker.platform.pickFiles();

  // Check if a file was picked
  if (result != null) {
    // Extract the file path from the result
    final filePath = result.files.single.path;
    
    // Implement your logic to handle the selected file path here
    print('Selected file path: $filePath');
  }
}

}
