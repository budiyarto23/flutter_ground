// part of 'models.dart';

// enum FoodType { new_food, popular, recommended }

// class Food extends Equatable {
//   final int id;
//   final String picturePath;
//   final String name;
//   final String description;
//   final String ingredients;
//   final int price;
//   final double rate;
//   final List<FoodType> types;

//   Food(
//       {this.id,
//       this.picturePath,
//       this.name,
//       this.description,
//       this.ingredients,
//       this.price,
//       this.rate,
//       this.types = const []});

//   @override
//   List<Object> get props =>
//       ([id, picturePath, name, description, ingredients, price, rate]);
// }

part of 'models.dart';

enum FoodType { new_food, popular, recommended }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> types;

  Food(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate,
      this.types = const []});

  factory Food.fromJson(Map<String, dynamic> data) => Food(
      id: data['id'],
      picturePath: data['picturePath'],
      name: data['name'],
      description: data['description'],
      ingredients: data['ingredients'],
      price: data['price'],
      rate: (data['rate'] as num).toDouble(),
      types: data['types'].toString().split(',').map((e) {
        switch (e) {
          case 'recommended':
            return FoodType.recommended;
            break;
          case 'popular':
            return FoodType.popular;
            break;
          default:
            return FoodType.new_food;
        }
      }).toList());

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

List<Food> mockFood = [
  Food(
      id: 1,
      picturePath:
          'https://www.thewholesomedish.com/wp-content/uploads/2019/04/The-Best-Classic-Hamburgers-2.jpg',
      name: 'Beef Burger',
      description: 'A lot of my recipes call for lean ground beef.  Not this one!  The best beef for making hamburger patties is 80% lean and 20 % fat ground beef.  You really need the fat in the meat to make juicy flavorful burgers.',
      ingredients: 'Beef, Sauce, Seasoning Salt, Garlic and Pepper',
      price: 12000,
      rate: 4,
      types: [FoodType.new_food, FoodType.popular, FoodType.recommended]),
  Food(
      id: 1,
      picturePath:
          'https://www.thewholesomedish.com/wp-content/uploads/2019/04/The-Best-Classic-Hamburgers-2.jpg',
      name: 'Cheese Burger',
      description: 'A lot of my recipes call for lean ground beef.  Not this one!  The best beef for making hamburger patties is 80% lean and 20 % fat ground beef.  You really need the fat in the meat to make juicy flavorful burgers.',
      ingredients: 'Beef, Sauce, Seasoning Salt, Garlic and Pepper',
      price: 12000,
      rate: 4,
      types: [FoodType.popular]),
  Food(
      id: 1,
      picturePath:
          'https://www.thewholesomedish.com/wp-content/uploads/2019/04/The-Best-Classic-Hamburgers-2.jpg',
      name: 'Burger Special',
      description: 'A lot of my recipes call for lean ground beef.  Not this one!  The best beef for making hamburger patties is 80% lean and 20 % fat ground beef.  You really need the fat in the meat to make juicy flavorful burgers.',
      ingredients: 'Beef, Sauce, Seasoning Salt, Garlic and Pepper',
      price: 12000,
      rate: 4,
      types: [FoodType.recommended]),
  Food(
      id: 1,
      picturePath:
          'https://www.thewholesomedish.com/wp-content/uploads/2019/04/The-Best-Classic-Hamburgers-2.jpg',
      name: 'Fish & Chicken Burger',
      description: 'A lot of my recipes call for lean ground beef.  Not this one!  The best beef for making hamburger patties is 80% lean and 20 % fat ground beef.  You really need the fat in the meat to make juicy flavorful burgers.',
      ingredients: 'Beef, Sauce, Seasoning Salt, Garlic and Pepper',
      price: 12000,
      rate: 4,
      types: [FoodType.new_food])
];
