class CetalogModel {
  static final items = [
    Item(
        id: '1',
        name: "My Product",
        price: 100,
        color: "#ddddd",
        desc: "Test Product description",
        image: "assets/images/login.png")
  ];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
