part of 'models.dart';

// equatable dibutuhkan untuk testing.
class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String houseNumber;
  final String city;
  final String picturePath;
  static String token;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phoneNumber,
    this.houseNumber,
    this.city,
    this.picturePath,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'],
      name: data['name'],
      address: data['address'],
      email: data['email'],
      houseNumber: data['houseNumber'],
      phoneNumber: data['phoneNumber'],
      city: data['city'],
      picturePath: data['profile_photo_url']);

  User copyWith(
          {int id,
          String name,
          String email,
          String address,
          String phoneNumber,
          String houseNumber,
          String city,
          String picturePath}) =>
      User(
          id: id ?? this.id,
          name: name ?? this.email,
          address: address ?? this.address,
          email: email ?? this.email,
          houseNumber: houseNumber ?? this.houseNumber,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          city: city ?? this.city,
          picturePath: picturePath ?? this.picturePath);

  @override
  List<Object> get props =>
      [id, name, email, address, phoneNumber, houseNumber, city, picturePath];
}

User mockUser = User(
    id: 1,
    name: 'Taka Hiro',
    email: 'takahiro@gmail.com',
    address: 'Jl. Ketapang Sari No. 14',
    phoneNumber: '043843843',
    houseNumber: '32 B',
    city: 'Balikpapan',
    picturePath:
        'https://images.pexels.com/photos/2787341/pexels-photo-2787341.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');
