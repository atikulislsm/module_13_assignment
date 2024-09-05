import 'package:flutter/material.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<String> productName=['Black T-shirt', 'Black T-shirt','Black T-shirt'];
  List<String> productUnit=['L','M','XL'];
  List<int> productPrice=[10,20,30];
  int _itemcount=0;

  void _incrementItem() {
    setState(() {
      _itemcount++;
    });
  }
  void _decrementItem() {
    if (_itemcount > 0) {
      setState(() {
        _itemcount--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Product List'),
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.shopping_bag_outlined),
          SizedBox(width: 20.0)
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: productName.length,
              itemBuilder: (context, index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image(
                          height:150 ,
                          width: 150,
                          image: AssetImage('assets/images/tshirt.jpg'),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(productName[index].toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                              SizedBox(height: 5,),
                              Text(productUnit[index].toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(onPressed: (){
                                    _decrementItem();
                                  }, icon: Icon(Icons.remove,),
                                    iconSize: 25,
                                  ),
                                  Text('$_itemcount'),
                                  IconButton(onPressed: (){
                                    _incrementItem();
                                  }, icon: Icon(Icons.add)),

                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,

                              children: [
                                Icon(Icons.more_vert,),
                                SizedBox(height: 40,),
                                Text(r"$"+productPrice[index].toString() )
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );

          })
          )
        ],
      ),

    );
  }
}
