import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class ImageViewerScreen extends StatefulWidget {
  final String imageUrl;

  const ImageViewerScreen({super.key, required this.imageUrl});

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  Future<void> shareImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/image.jpg');
    await file.writeAsBytes(response.bodyBytes);

    Share.shareFiles([file.path]);
  }

  Future<void> downloadImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/image.jpg');
    await file.writeAsBytes(response.bodyBytes);

    Fluttertoast.showToast(msg: 'Image downloaded successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image Viewer',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await downloadImage(widget.imageUrl);
            },
            icon: const Icon(Icons.download_for_offline_outlined),
          ),
          IconButton(
            onPressed: () async {
              await shareImage(widget.imageUrl);
            },
            icon: const Icon(CupertinoIcons.share),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
