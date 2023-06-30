import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../controllers/helpers/api_helper.dart';
import '../../controllers/providers/theme_provider.dart';
import '../../models/image_model.dart';
import 'image_viewer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Hit> images = [];
  bool isLoading = false;
  bool isDarkMode = false;

  List<String> categories = [
    'Nature',
    'Animals',
    'Food',
    'Travel',
    'Architecture',
    'Art',
    'Fashion',
    'Sports'
  ];
  String selectedCategory = '';

  void fetchImages({String? category}) async {
    setState(() {
      isLoading = true;
    });

    final imagesModel =
        await ApiHelper.apiHelper.getImages(search: "$category");

    setState(() {
      isLoading = false;
      if (imagesModel != null) {
        images = imagesModel.hits;
      }
    });
  }

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });

    fetchImages(category: category);
  }

  Future<void> downloadImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/image.jpg');
    await file.writeAsBytes(response.bodyBytes);

    Fluttertoast.showToast(msg: 'Image downloaded successfully');
  }

  Future<void> shareImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/image.jpg');
    await file.writeAsBytes(response.bodyBytes);

    Share.shareFiles([file.path]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image Gallery',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();

              setState(() {
                isDarkMode = !isDarkMode; // Toggle the mode
              });
            },
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Categories',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            for (String category in categories)
              ListTile(
                title: Text(
                  category,
                  style: GoogleFonts.poppins(),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  selectCategory(category);
                },
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                fetchImages(category: selectedCategory);
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: 'Search Images',
                labelStyle: GoogleFonts.poppins(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (String category in categories)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        selectCategory(category);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                            return category == selectedCategory
                                ? Colors.blue
                                : Colors.grey;
                          },
                        ),
                      ),
                      child: Text(
                        category,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(
                    child: SizedBox(
                      height: 50,
                      child: Image.asset("assets/image/hourglass.gif"),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        final hit = images[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageViewerScreen(
                                  imageUrl: hit.largeImageUrl,
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: hit.largeImageUrl,
                              placeholder: (context, url) => Center(
                                child: SizedBox(
                                  height: 50,
                                  child:
                                      Image.asset("assets/image/hourglass.gif"),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
