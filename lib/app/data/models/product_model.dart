class ProductModel {
  final String code;
  final String name;
  final int qty;

  ProductModel({
    required this.code,
    required this.name,
    required this.qty,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        code: json["code"],
        name: json["name"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "qty": qty,
      };
}
