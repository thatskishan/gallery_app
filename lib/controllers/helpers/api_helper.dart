import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/image_model.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<ImagesModel?> getImages({
    required String search,
  }) async {
    String myURL =
        "https://pixabay.com/api/?key=37976395-53d38e535cf032a48be1109d1&q=$search&image_type=photo&pretty=true";
    http.Response res = await http.get(Uri.parse(myURL));

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      return ImagesModel.fromJson(data);
    }
    return null;
  }
}
