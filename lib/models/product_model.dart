class ProductModel {
  final int id;
  final double price;
  final String title;
  final String description;
  final String image;
  final ratingModel rating;

  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData["id"],
      price: (jsonData["price"] as num).toDouble(),//  price: jsonData["price"],
      title: jsonData["title"],
      description: jsonData["description"],
      image: jsonData["image"],
      rating: ratingModel.fromJson(jsonData["rating"]),
    );
  }
}

class ratingModel {
  final double rate;
  final int count;

  ratingModel({required this.rate, required this.count});

  factory ratingModel.fromJson(jsonData) {
    return ratingModel(
      rate: (jsonData["rate"] as num).toDouble(),// rate: jsonData["rate"], 
      count: jsonData["count"]
    );
  }
}
