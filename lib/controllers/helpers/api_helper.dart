import 'dart:convert';

import 'package:gallery_app/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../../models/image_model.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<ImagesModel?> getImages({
    required String search,
  }) async {
    String myURL = apiKey;
    http.Response res = await http.get(Uri.parse(myURL));

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      return ImagesModel.fromJson(data);
    }
    return null;
  }
}
