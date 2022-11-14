class Cart {

  late final int? id;
  final String? productId;
  final String? productName;
  final String? unitTag;
  final String? image;
  final int? initialPrice;
  final int? quantity;
  final int? productPrice;

  Cart({
   required this.id,
   this.productId,
   this.productName,
   this.unitTag,
   this.image,
   this.initialPrice,
   this.quantity,
    this.productPrice
});

  Cart.fromMap( Map< dynamic ,dynamic> res)
    : id = res['id'],
      productId=res['productID'],
      productName=res['productName'],
  initialPrice = res['initialPrice'],
  productPrice = res['productPrice'],
  quantity = res['quantity'],
  unitTag = res['unitTag'],
  image  = res['image'];

  Map<String, Object?> toMap(){
    return {
      'id' : id,
      'productId' : productId,
      'productName' : productName,
      'initialPrice' : initialPrice,
      'productPrice' : productPrice,
      'quantity' : quantity,
      'unitTag' : unitTag,
      'image' : image,

    };
  }


}