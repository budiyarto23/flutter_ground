part of 'widget.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  FoodCard(this.food);
  @override
  Widget build(BuildContext context) {
    // FOOD CONTAINER PLACEMENT
    return Container(
      height: 210,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.grey[200])
          ]),
      child: Column(
        children: [
          // FOOD IMAGE PLACEMENT
          Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: DecorationImage(
                    image: NetworkImage(food.picturePath), fit: BoxFit.cover)),
          ),
          // FOOD NAME PLACEMENT
          Container(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 6),
            width: 200,
            child: Text(
              food.name,
              style: blackFontStyle2,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          // RATING PLACEMENT
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Rating(food.rate),
          )
        ],
      ),
    );
  }
}
