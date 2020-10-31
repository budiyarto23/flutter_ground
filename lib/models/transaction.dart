part of 'models.dart';

enum TransactionStatus { delivered, on_delivery, pending, canceled }

class Transaction extends Equatable {
  final int id;
  final Food food;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus status;
  final User user;

  Transaction(
      {this.id,
      this.food,
      this.quantity,
      this.total,
      this.dateTime,
      this.status,
      this.user});

  Transaction copyWith(
      {int id,
      Food food,
      int quantity,
      int total,
      DateTime dateTime,
      TransactionStatus status,
      User user}) {
    return Transaction(
        id: id ?? this.id,
        food: food ?? this.food,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status,
        user: user ?? this.user);
  }

  @override
  List<Object> get props => [id, food, quantity, total, dateTime, status, user];
}

List<Transaction> mockTransaction = [
  Transaction(
      id: 1,
      food: mockFood[2],
      quantity: 2,
      total: (mockFood[2].price * 2 * 1.1).round() + 50000,
      dateTime: DateTime.now(),
      status: TransactionStatus.on_delivery,
      user: mockUser),
  Transaction(
      id: 2,
      food: mockFood[3],
      quantity: 2,
      total: (mockFood[3].price * 2 * 1.1).round() + 60000,
      dateTime: DateTime.now(),
      status: TransactionStatus.delivered,
      user: mockUser),
  Transaction(
      id: 1,
      food: mockFood[1],
      quantity: 3,
      total: (mockFood[1].price * 3 * 1.1).round() + 70000,
      dateTime: DateTime.now(),
      status: TransactionStatus.canceled,
      user: mockUser)
];