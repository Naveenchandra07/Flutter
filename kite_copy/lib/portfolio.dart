import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PortfolioScreen extends StatelessWidget {

List<List<String>> scriptsPojoList;
String userID;

PortfolioScreen({Key key, @required this.scriptsPojoList, @required this.userID}) : super(key: key) {
  this.scriptsPojoList = scriptsPojoList;
  this.userID = userID;
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Page',
      home: Portfolio(scriptsPojoList: this.scriptsPojoList, userID: this.userID),
    );
  }
}

class PortfolioState extends State<Portfolio> {

  List<List<String>> scriptsPojoList;
  String userID;
  double totalProfit = 0.0;
  int totalScripts = 0;
  final oCcy = new NumberFormat("##,##,##0.00", "en_IN");

  PortfolioState({Key key, @required this.scriptsPojoList, @required this.userID}) {
    this.scriptsPojoList = scriptsPojoList;
    this.userID = userID;
    for (List<String> profitList in scriptsPojoList) {
      this.totalProfit = this.totalProfit + double.parse(profitList[1]);
    }
    this.totalScripts = scriptsPojoList.length;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Portfolio',
                style: new TextStyle(color: Color.fromRGBO(57, 57, 57, 1), fontSize: 24.0),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Image.asset('images/dropdown_arrow.PNG',
                  height: 23.0,
                  width: 23.0,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          backgroundColor: Color.fromRGBO(235, 236, 238, 1),
        ),
        body: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Color.fromRGBO(235, 236, 238, 1),
              body: SafeArea(
                child: Column(children: <Widget>[
                  PreferredSize(
                    preferredSize: Size.fromHeight(100.0),
                    child: TabBar(
                      unselectedLabelColor: Color.fromRGBO(57, 57, 57, 2),
                      unselectedLabelStyle: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 2.0, color: Color.fromRGBO(66, 129, 222, 1),),                          
                        insets: EdgeInsets.symmetric(vertical:7.0, horizontal:43.0),
                      ),
                      
                      tabs: [
                        Tab(
                          text: 'Holdings',
                          
                        ),
                        Tab(
                          icon: positionTitle(),
                        ),
                      ], // list of tabs
                    ),
                  ),
                  //TabBarView(children: [ImageList(),])
                  Expanded(
                    child: TabBarView(
                      children: [
                        Container(
                          color: Color.fromRGBO(235, 236, 238, 1),
                          child: Center(child: Text('Tab1')),
                        ),
                        Container(
                          color: Colors.white,
                          child: Container(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                
                                totalBar(),
                                headerImage(),

                                new Container(
                                  color: Colors.white,
                                  child: new Container(
                                    height: 1,
                                    color: const Color.fromRGBO(235, 236, 238, 1),
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                                  ),
                                ),
                                
                                listView(),
                                  
                                new Container(
                                  height: 1,
                                  color: const Color.fromRGBO(235, 236, 238, 1),
                                ),

                                viewReportImage(),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ])))),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: 2, // this will be set when a new tab is tapped
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'images/Watchlist.PNG', 
                  ),
                  title: new Text('Watchlist',
                  style: new TextStyle(
                    fontSize: 12.0,
                  ),),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'images/Orders_ico.PNG', 
                  ),
                  title: new Text('Orders',
                  style: new TextStyle(
                    fontSize: 12.0,
                  ),),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'images/Portfolio_ico.PNG', 
                  ),
                  title: new Text('Portfolio',
                  style: new TextStyle(
                    fontSize: 12.0,
                  ),),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'images/Apps_ico.PNG', 
                  ),
                  title: new Text('Apps',
                  style: new TextStyle(
                    fontSize: 12.0,
                  ),),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'images/User_ico.PNG', 
                  ),
                  title: new Text(this.userID.toUpperCase(),
                  style: new TextStyle(
                    fontSize: 12.0,
                  ),),
                ),
              ],
            ),
          );
  }

  Container listView() {
    return Container(
        color: Colors.white,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Color.fromRGBO(235, 236, 238, 1),
            height: 2.0,
          ),
          shrinkWrap: true,
          itemCount: scriptsPojoList.length,
          itemBuilder: (context, index) {
            final item = scriptsPojoList[index];
              return ListTile(  
                title: Row(
                  children: [
                    Container (
                        margin: EdgeInsets.fromLTRB(0, 2.0, 0, 8.0),
                        child: Text('0 ',
                        style: new TextStyle(
                          fontSize: 12.0,
                          color: new Color(0xFF9C9C9C),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 2.0, 0, 8.0),
                      child: Text('Qty.',
                        style: new TextStyle(
                          fontSize: 12.0,
                          color: new Color(0xFFD6D6D8)
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0.0, 0, 8.0),
                      child: Text(item[0].toUpperCase(),
                        style: new TextStyle(
                          fontSize: 13.0,
                          color: new Color(0xFF9C9C9C),                          
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0.0, 0, 2.5),
                      child: RichText(
                        text: new TextSpan(
                          children: <TextSpan>[
                            new TextSpan(text: item[3].toUpperCase() + '  Avg. ',
                              style: new TextStyle(color: new Color(0xFFD6D6D8), fontSize: 11.0),),
                            new TextSpan(text: '0.00',
                            style: new TextStyle(color: new Color(0xFF9C9C9C), fontSize: 11.0),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0.0, 0, 6.0),
                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(247, 247, 247, 1),
                        shape: BoxShape.rectangle,
                      ),
                      height: 17.0,
                      width: 38.0,
                      child: new Center(
                        child: new Text(
                          "CO",
                          style: const TextStyle(color: Colors.grey, fontSize: 10.0, ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0.0, 0, 5.0),
                      child: Text('+' + oCcy.format(double.parse(item[1])),
                        style: new TextStyle(
                          fontSize: 12.0,
                          color: new Color(0xFF9cd6a2)
                        ),
                      ),
                    ),
                    Container(
                      child: RichText(
                        text: new TextSpan(
                          children: <TextSpan>[
                            new TextSpan(text: 'LTP ',
                              style: new TextStyle(color: new Color(0xFFD6D6D8), fontSize: 11.0),),
                            new TextSpan(text: oCcy.format(double.parse(item[2])),
                            style: new TextStyle(color: new Color(0xFF9C9C9C), fontSize: 11.0),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );                                
            },
        ),
      );
  }

  Container headerImage() {
    return Container(
      child: Image.asset(
        'images/list_header.PNG', 
      ),
      margin: EdgeInsets.fromLTRB(12.0, 0, 12.0, 3.0),
    );
  }

  Container viewReportImage() {
    return Container(
      color: Colors.white,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Image.asset(
          'images/viewReport.PNG',
        )
      ),
    );
  }

  Stack totalBar() {
    return Stack (
      children: <Widget>[
        new Container(
          height: MediaQuery.of(context).size.height * .12,
          color: Color.fromRGBO(235, 236, 238, 1),
          child: new Column(
            children: <Widget>[
              new Container(
                height: MediaQuery.of(context).size.height * .06,
                color: Color.fromRGBO(235, 236, 238, 1)
              ),
              new Container(
                height: MediaQuery.of(context).size.height * .06,
                color: Colors.white,
              )
            ],
          ),
        ),
        
         new Container(
          alignment: Alignment.bottomCenter,
          padding: new EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .02,
          right: 05.0,
          left: 05.0),
          child: new Container(
            height: 70.0,
            width: MediaQuery.of(context).size.width,
            child: new Card(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: new Container(
                decoration: new BoxDecoration(boxShadow: [
                    new BoxShadow(
                      color: new Color(0xFFdcdcde),
                      spreadRadius: 2.0,
                      blurRadius: 2.0,
                      offset: Offset(0.0, 0.75),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(const Radius.circular(3.0),),
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                      child: new Text(
                        'Total P&L',
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: new Color(0xFFA09FA4)
                        ),
                      ),
                    ),
                    new Text('+' + oCcy.format(totalProfit),
                      style: new TextStyle(
                        fontSize: 16.0,
                        color: new Color(0xFF14a644)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]);
  }

  Widget positionTitle() {
    return Container(
            child: new Center(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'Positions ',
                      style: TextStyle(color: Color.fromRGBO(66, 129, 222, 1), fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      color: Color.fromRGBO(134, 172, 243, 1),
                      shape: BoxShape.circle,
                    ),
                    height: 18.0,
                    width: 18.0,
                    child: new Center(
                      child: new Text(
                        totalScripts.toString(),
                        style: const TextStyle(color: Colors.white, fontSize: 10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class ProfitsPojo {
  
  final String scriptName;
  final String profit;
  final String ltp;

  ProfitsPojo(this.scriptName, this.profit, this.ltp);
}

class Portfolio extends StatefulWidget {
  
  List<List<String>> scriptsPojoList;
  String userID;

  Portfolio({Key key, @required this.scriptsPojoList, @required this.userID}) {
    this.scriptsPojoList = scriptsPojoList;
    this.userID = userID;
  }

  @override
  PortfolioState createState() => PortfolioState(scriptsPojoList: scriptsPojoList, userID: userID);
}