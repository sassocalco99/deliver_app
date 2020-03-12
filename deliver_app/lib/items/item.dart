import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../style/style.dart';
import 'package:flutter/widgets.dart';

class Item {
  String _name;
  String _pic;
  Color _color;

  Item(String name, String pic, Color color){
    this._name = name;
    this._pic = pic;
    this._color = color;
  }

  String getName(){
    return this._name;
  }
  String getPic(){
    return this._pic;
  }
  Color getColor(){
    return this._color;
  }
}

List<Item> itemList = [
  new Item("Shopping", 'images/shopping.png', Colors.brown[800]),
  new Item("Food", 'images/food.png', Colors.blue[800]),
  new Item("Bakery", 'images/bakery.png', Colors.green[800]),
  new Item("Pharmacy", 'images/pharmacy.png', Colors.yellow[800]),
  new Item("Your Profile", 'images/avatar.png', Colors.purple[800])
];

bool equalsIgnoreCase(String string1, String string2) {
  return string1?.toLowerCase() == string2?.toLowerCase();
}

Duration _duration = Duration(seconds: 1);

class ItemBox extends StatefulWidget{
  final String name;

  Item itemGetter(String name){
    for(Item item in itemList){
      if(equalsIgnoreCase(name, item.getName())) return item;
    }
    return null;
  }

  ItemBox({@required this.name});
  @override
  _ItemBoxState createState() => _ItemBoxState();

}

class _ItemBoxState extends State<ItemBox>{
  Offset firstPosition;
  bool moving = false;
  Offset lastPosition;
  Offset position;


  @override
  Widget build(BuildContext context) {


    Item item = this.widget.itemGetter(this.widget.name);

    void _handleLongPressUpdate(LongPressMoveUpdateDetails details){
      final RenderBox referenceBox = context.findRenderObject();
      setState(() {
        lastPosition = referenceBox.globalToLocal(details.globalPosition);
      });
    }

    void _getPosition() {
      final RenderBox renderBox = context.findRenderObject();
      firstPosition = renderBox.globalToLocal(Offset.zero);
    }


    return AnimatedContainer(
      duration: _duration,
      curve: Curves.ease,
      transform: moving ? (Matrix4.identity()..translate(position.dx, position.dy)): Matrix4.identity(),
      decoration: BoxDecoration(
          shape: BoxShape.circle
      ),
      padding: EdgeInsets.all(10),
      child: GestureDetector(
          onTap: () {
            print("tapped "+item.getName());
            print("first position: "+firstPosition.toString());
            print("last position: "+lastPosition.toString());
          },
          onLongPress: () {
            _getPosition();
            print("long pressed " +item.getName());
          },
          onLongPressMoveUpdate: (details) {
            setState(() {
              _handleLongPressUpdate(details);
              position = lastPosition;
              moving = true;
            });
          },
          onLongPressEnd: (details) {
            position = firstPosition;
            moving = false;
          },
          child: Stack(
              children: <Widget>[

                Container(

                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: item.getColor(),
                      shape: BoxShape.circle
                  ),
                  child: Container(

                    height: 50,
                    width: 50,
                    child: Image.asset(item.getPic(), height: 107, width: 135, cacheWidth: 135, cacheHeight: 107,),
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
                    child: Text(item.getName(),
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
