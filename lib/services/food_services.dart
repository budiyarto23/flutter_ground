// part of 'services.dart';

// class FoodServices {
//   static Future<ApiReturnValue<List<Food>>> getFoods() async {
//     await Future.delayed(Duration(milliseconds: 500));

//     return ApiReturnValue(value: mockFood);
//   }
// }

// username = doni.bolo.bolo@blackpink.com
// password = 12345678

part of 'services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'food';

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Food> foods = (data['data']['data'] as Iterable)
        .map((e) => Food.fromJson(e))
        .toList();

    return ApiReturnValue(value: foods);
  }
}
