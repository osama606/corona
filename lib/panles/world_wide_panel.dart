import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldwide;

  const WorldWidePanel({
    Key key,
    this.worldwide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: [
          StatusPanel(
            title: "CONFIRMED",
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: worldwide['cases'].toString(),
          ),
          StatusPanel(
            title: "ACTIVE",
            panelColor: Colors.blue[100],
            textColor: Colors.blue,
            count: worldwide['active'].toString(),
          ),
          StatusPanel(
            title: "RECOVED",
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: worldwide['recovered'].toString(),
          ),
          StatusPanel(
            title: "DEATHS",
            panelColor: Colors.black26,
            textColor: Colors.black54,
            count: worldwide['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({
    Key key,
    this.panelColor,
    this.textColor,
    this.title,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: panelColor,
      ),
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: textColor,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            count,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
