part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "You've Made Order",
        subtitle: 'Just stay at home we are\npreparing your best food',
        picturePath: 'assets/bike.png',
        buttonTitle1: 'Order Other Foods',
        buttonTap1: () {
          Get.offAll(MainPage());
        },
        buttonTitle2: 'View My Order',
        buttontap2: () {
          Get.offAll(MainPage(
            initialPage: 1,
            // initialPage: 0 = home, initialPage: 1 = order, initialPage: 2 = profile //
          ));
        },
      ),
    );
  }
}
