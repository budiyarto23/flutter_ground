part of 'shared.dart';

// margin
const double defaultMargin = 24;
// loading componenet
Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

// font style
TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(color: Colors.black);

// color
Color mainColor = 'FFC700'.toColor();
Color greyColor = '8D92A3'.toColor();
