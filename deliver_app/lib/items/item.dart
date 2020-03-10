import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../style/style.dart';
import 'package:flutter/widgets.dart';

class Item {
  String _name;
  String _pic;

  Item(String name, String pic){
    this._name = name;
    this._pic = pic;
  }

  String getName(){
    return this._name;
  }
  String getPic(){
    return this._pic;
  }
}

List<Item> itemList = [
  new Item("Shopping", 'images/shopping.png'),
  new Item("Food", 'images/food.png'),
  new Item("Bakery", 'images/bakery.png'),
  new Item("Pharmacy", 'images/pharmacy.png')
];

bool equalsIgnoreCase(String string1, String string2) {
  return string1?.toLowerCase() == string2?.toLowerCase();
}

class ItemBox extends StatelessWidget{
  final String name;

  Item itemGetter(String name){
    for(Item item in itemList){
      if(equalsIgnoreCase(name, item.getName())) return item;
    }
    return null;
  }

  ItemBox({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            print("tapped "+itemGetter(name).getName());
          },
          onLongPress: () {
            print ("long pressed " +itemGetter(name).getName());
          },
          child: Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      shape: BoxShape.circle
                  ),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(itemGetter(name).getPic(), height: 107, width: 140, cacheWidth: 140, cacheHeight: 107,),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text('Food',
                      style: itemStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ]
          )
      ),
    );

  }
}
