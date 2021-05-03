import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({
    Key key,
    this.countryData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 246,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
       // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  countryData[index]['country'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  countryData[index]['deaths'].toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: countryData.length,
      ),
    );
  }
}
