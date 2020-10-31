part of 'widget.dart';

class FoodListItem extends StatelessWidget {
  final Food foodItem;
  final double itemWidth;

  FoodListItem({@required this.foodItem, @required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // food image
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(foodItem.picturePath),
                  fit: BoxFit.cover)),
        ),
        // food name, price
        SizedBox(
          width: itemWidth - 180, // (60 + 12 + 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodItem.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                NumberFormat.currency(
                        symbol: 'IDR ', locale: 'id-ID', decimalDigits: 0)
                    .format(foodItem.price),
                style: greyFontStyle.copyWith(fontSize: 13),
              )
            ],
          ),
        ),
        // food rating
        Rating(foodItem.rate)
      ],
    );
  }
}
