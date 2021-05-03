import 'dart:convert';
import 'package:corona/data_source.dart';
import 'package:corona/panles/most_effected_countries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pages/countryPage.dart';
import 'panles/info_panel.dart';
import 'panles/world_wide_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;

  featchWoeldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(
      () {
        worldData = jsonDecode(response.body);
      },
    );
  }

  List countriesData;

  featchcountriesData() async {
    http.Response response = await http
        .get('https://corona.lmao.ninja/v2/countries?sort=country?sort=cases');
    setState(
      () {
        countriesData = json.decode(response.body);
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    featchWoeldWideData();
    featchcountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.white60,
      appBar: AppBar(
        centerTitle: true,
        title: Text("COVID-19 Panel"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Worlewide",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ConutryPage()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryBlack,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Regional",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            worldData == null
                ? Center(child: CircularProgressIndicator())
                : WorldWidePanel(worldwide: worldData),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Most affected country",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            countriesData == null
                ? Center(child: CircularProgressIndicator())
                : MostAffectedPanel(countryData: countriesData),
            SizedBox(
              height: 10,
            ),
            InfoPanel(),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text("WE ARE TOGETHER IN THIS",
              style: TextStyle(
                color: primaryBlack,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
