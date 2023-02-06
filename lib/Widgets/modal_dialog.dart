import 'package:flutter/material.dart';

// TODO Image Picker Modal Bottom Sheet
void imagePickerModal(BuildContext context, {VoidCallback? onCameraTap, VoidCallback? onGalleryTap}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          height: 220.0,
          child: Column(
            children: [
              GestureDetector(
                onTap: onCameraTap,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(color: Colors.green.shade200, borderRadius: BorderRadius.circular(10.0)),
                    child: const Text(
                      "Camera",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0,),
              GestureDetector(
                onTap: onGalleryTap,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(color: Colors.blue.shade200, borderRadius: BorderRadius.circular(10.0)),
                    child: const Text(
                      "Gallery",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });
}
