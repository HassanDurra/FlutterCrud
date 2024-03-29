import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addProductDetails(
      Map<String, dynamic> productDetails, String id) async {
    return await FirebaseFirestore.instance
        .collection("ProductsDetails")
        .doc(id)
        .set(productDetails);
  }

  Future<Stream<QuerySnapshot>> getProductDetails() async {
    return FirebaseFirestore.instance
        .collection('ProductsDetails') // corrected collection name
        .snapshots();
  }
}
