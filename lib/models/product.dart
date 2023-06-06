class Product {
  final String name;
  final double price;
  final String image;

  Product(this.name, this.price, this.image);

  Product.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        price = map['price'],
        image = map['image'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }
}
