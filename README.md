# Flutter Gallery App

This is a Flutter gallery app that allows users to browse and download images from the Pixabay API. The app utilizes various packages such as `http`, `google_fonts`, `cached_network_image`, `share`, `fluttertoast`, and `provider`. The main functionalities of the app include downloading and sharing images.

## Dependencies

The following dependencies are used in this project:

- `http`: A package for making HTTP requests to the Pixabay API to fetch images.
- `google_fonts`: A package that provides a collection of fonts to be used in the app.
- `cached_network_image`: A package for caching and displaying images from URLs.
- `share`: A package for sharing content, such as images, with other apps.
- `fluttertoast`: A package for displaying toast messages in the app.
- `provider`: A package for state management in Flutter.

## Installation

To run this app locally, please follow the steps below:

1. Clone the repository:

```
git clone https://github.com/thatskishan/gallery_app
```

2. Navigate to the project directory:

```
cd flutter-gallery-app
```

3. Install the dependencies:

```
flutter pub get
```

4. Run the app:

```
flutter run
```

Please make sure you have Flutter SDK installed and set up on your machine before running the app.

## Configuration

To use the Pixabay API in the app, you will need to obtain an API key. Follow these steps to configure the app:

1. Visit the [Pixabay website](https://pixabay.com/api/docs/) and create an account if you don't have one.

2. After logging in, go to the [API documentation](https://pixabay.com/api/docs/) to generate an API key.

3. Open the `lib/utils/constants.dart` file in your project and replace the placeholder value with your Pixabay API key:

```dart
const String apiKey = 'YOUR_API_KEY';
```

## Functionality

### Downloading Images

The app allows users to download images from the Pixabay API. To download an image, follow these steps:

1. Browse the gallery and select an image.

2. Tap on the download button associated with the selected image.

3. The image will be downloaded and saved to the device's storage.

### Sharing Images

Users can also share images with other apps using the sharing functionality. To share an image, follow these steps:

1. Browse the gallery and select an image.

2. Tap on the share button associated with the selected image.

3. Choose the desired app from the sharing options.

4. The image will be shared with the selected app.


## Acknowledgments

- This app was created as a learning project and utilizes the Pixabay API to showcase the use of HTTP requests, image caching, sharing, and state management in Flutter.

- Special thanks to the developers and contributors of the `http`, `google_fonts`, `cached_network_image`, `share`, `fluttertoast`, and `provider` packages for their valuable contributions to the Flutter community.

## Contact

If you have any questions or suggestions regarding this project, feel free to reach out to the project maintainer at `kishanvirani1@icloud.com`.

## Screenshots 

<img src = "https://github.com/thatskishan/gallery_app/assets/123537725/6a3a26ab-498c-419f-a665-3403d3c18724" width="200px">
<img src = "https://github.com/thatskishan/gallery_app/assets/123537725/0615bdda-f3e3-4601-9c1a-cda92f698f66" width="200px">
<img src = "https://github.com/thatskishan/gallery_app/assets/123537725/833c45f2-dd77-4c02-bb6a-f828a8c9cdcb" width="200px">
<img src = "https://github.com/thatskishan/gallery_app/assets/123537725/2ddcc1dd-0f8c-4282-80d7-f722208227a4" width="200px">
<img src = "https://github.com/thatskishan/gallery_app/assets/123537725/65b31bab-c696-4302-8512-f849c7d58fb6" width="200px">
<img src = "https://github.com/thatskishan/gallery_app/assets/123537725/a53a9e42-742c-4d7b-b24f-8b6b003c48ae" width="200px">
<img src = "https://github.com/thatskishan/gallery_app/assets/123537725/8f1cb830-a98d-464d-9488-359ab5e83288" width="200px">
<img src = "https://github.com/thatskishan/gallery_app/assets/123537725/a944837b-a2e5-47f8-89b3-eade00057f77" width="200px">


## Highlights

<img src = "https://github.com/thatskishan/gallery_app/assets/123537725/8a380527-224a-4f8b-92e2-9786a596f4d0" width="200px">



