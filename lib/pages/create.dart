import 'package:crudapplication/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController street = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController area = new TextEditingController();
  TextEditingController block = new TextEditingController();
  TextEditingController price = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // To Center the Contentr
          children: [
            // First Text
            Text(
              "Add",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),

            Text(
              "\t Products",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.3, top: 30.4, right: 20.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter Street",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ) //Enter Street
            ,
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: street,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            )
            // City
            ,
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Enter City",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ) //Enter Street
            ,
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: city,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            // Area String
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Enter Area",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ) //Enter Street
            ,
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: area,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            //Block String
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Enter Block",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ) //Enter Street
            ,
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: block,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            //Price
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Enter Price",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ) //Enter Street
            ,
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: price,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ) // Price
            ,
            SizedBox(height: 30.0),
            // Button To Add
            Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.orange)),
                  onPressed: () async {
                    Fluttertoast.showToast(
                        msg: "Order Has been Added SuccessFully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);

                    String id = randomAlphaNumeric(10);
                    Map<String, dynamic> productDetails = {
                      "id": id,
                      "Street": street.text,
                      "City": city.text,
                      "Area": area.text,
                      "Block": block.text,
                      "Price": price.text
                    };
                    await DatabaseMethods()
                        .addProductDetails(productDetails, id)
                        .then((value) => () {
                              Fluttertoast.showToast(
                                  msg: "Order Has been Added SuccessFully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            });
                  },
                  child: Text(
                    "Save Information",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
