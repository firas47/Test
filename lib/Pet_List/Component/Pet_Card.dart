import 'package:flutter/material.dart';


class PetCard extends StatelessWidget {

  final VoidCallback  press;
  final String? name,category,status;
  const PetCard({
     Key? key,

    required this.press, required this.name, required this.category, required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "22",
                child: Image.asset("assets/images/cat1.png"),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround ,
            children: [
              Flexible(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(

                      name??"",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(

                      category??"",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  status??"",
                  style: TextStyle(fontWeight: FontWeight.bold ,  color: status=="available" ?  Colors.green :Colors.amber   ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}