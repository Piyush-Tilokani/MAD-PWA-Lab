import 'dart:js';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
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
                  ),
                ),
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
                  Navigator.pop(context as BuildContext);
                  if (string == "Pin") {
                    // Show file upload options for pin
                    _showFileUploadOptions(context as BuildContext);
                  } else if (string == "Board") {
                    // Show file upload options for board
                    _showFileUploadOptions(context as BuildContext);
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

  void _showFileUploadOptions(BuildContext context) async {
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
