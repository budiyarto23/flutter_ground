part of 'services.dart';

class TransactionServices {
  // SEBELUM PAKAI API
  // static Future<ApiReturnValue<List<Transaction>>> getTransaction() async {
  //   await Future.delayed(Duration(seconds: 2));

  //   return ApiReturnValue(value: mockTransaction);
  // }

  // SETELAH PAKAI API
  static Future<ApiReturnValue<List<Transaction>>> getTransaction(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'transaction/?limit=1000';

    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Transaction> transactions = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    return ApiReturnValue(value: transactions);
  }

  // SEBELUM PAKAI API
  // static Future<ApiReturnValue<Transaction>> submitTransaction(
  //     Transaction transaction) async {
  //   await Future.delayed(Duration(seconds: 2));

  //   return ApiReturnValue(
  //       value:
  //           transaction.copyWith(id: 123, status: TransactionStatus.pending));

  //   // contoh api gagal
  //   // return ApiReturnValue(message: 'Order failed');
  // }

  // SETELAH PAKAI API
  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'checkout';

    var response = await client.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
        body: jsonEncode(<String, dynamic>{
          'food_id': transaction.food.id,
          'user_id': transaction.user.id,
          "quantity": transaction.quantity,
          "total": transaction.total,
          "status": "PENDING"
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Transaction value = Transaction.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }
}
