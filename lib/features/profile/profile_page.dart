// profile_page.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _selectImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _saveImagePath(pickedFile.path);
      } else {
        _image = null;
      }
    });
  }

  Future<void> _saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image_path', path);
  }

  Future<void> _loadImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('profile_image_path');
    if (path != null) {
      setState(() {
        _image = File(path);
      });
    }
  }

  Future<void> _deleteImage() async {
    setState(() {
      _image = null;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('profile_image_path');
  }

  @override
  void initState() {
    super.initState();
    _loadImagePath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile picture and edit/select image buttons
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? const Icon(Icons.person, size: 50)
                        : null,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final pickedFile = await _picker.getImage(source: ImageSource.camera);
                          setState(() {
                            if (pickedFile != null) {
                              _image = File(pickedFile.path);
                              _saveImagePath(pickedFile.path);
                            } else {
                              _image = null;
                            }
                          });
                        },
                        child: const Text('Take Photo'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: _selectImage,
                        child: const Text('Select Image'),
                      ),
                      const SizedBox(width: 16),
                      _image != null
                        ? ElevatedButton(
                            onPressed: _deleteImage,
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                            child: Text('Delete'),
                          )
                        : Container(), // or SizedBox.shrink() to take up no space
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Profile information with borders
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username: ${Get.arguments['username']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Email: ${Get.arguments['email']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Phone Number: ${Get.arguments['phoneNumber']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Favorite Sport: ${Get.arguments['favoriteSport']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Alamat: ${Get.arguments['location']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}