part of 'widget.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavbar({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              child: SvgPicture.asset(
                'assets/icons/ic_home' +
                    ((selectedIndex == 0) ? '.svg' : '_normal.svg'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              margin: EdgeInsets.symmetric(horizontal: 83),
              child: SvgPicture.asset(
                'assets/icons/ic_order' +
                    ((selectedIndex == 1) ? '.svg' : '_normal.svg'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              child: SvgPicture.asset(
                'assets/icons/ic_profile' +
                    ((selectedIndex == 2) ? '.svg' : '_normal.svg'),
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
