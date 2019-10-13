import 'package:flutter/material.dart';
import 'package:kite_copy/portfolio.dart';

void main() => runApp(KiteSimulatorApp());

TextEditingController scritNameController = new TextEditingController();
TextEditingController profitController = new TextEditingController();
TextEditingController ltpController = new TextEditingController(); 
TextEditingController segmentController = new TextEditingController();
TextEditingController userIDController = new TextEditingController();
List<List<String>> scriptsPojoList = new List<List<String>>();
String userID;

class KiteSimulatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kite Simulator',
      home: KiteSimulator(),
    );
  }
}

class KiteSimulatorState extends State<KiteSimulator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        title: Text('Data Input Area'),
      ),
      body: MyCustomForm(),
    );
  }

}

class KiteSimulator extends StatefulWidget {
  @override
  KiteSimulatorState createState() => KiteSimulatorState();
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: scritNameController,
            decoration: InputDecoration(
              labelText: 'Enter Script Name'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: profitController,
            decoration: InputDecoration(
              labelText: 'Enter Profit'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: ltpController,
            decoration: InputDecoration(
              labelText: 'Enter LTP'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: segmentController,
            decoration: InputDecoration(
              labelText: 'Enter Segment'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: RaisedButton(
                  onPressed: () =>  addScript(),
                  child: Text('Add Script'),
              ),
                ),
              RaisedButton(
                onPressed: () =>  clear(),
                child: Text('Clear'),
              ),
            
            ],
            ),
          
          TextFormField(
            controller: userIDController,
            decoration: InputDecoration(
              labelText: 'Enter User ID'
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          RaisedButton(
            onPressed: () =>  submit(),
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  addScript() {

      List<String> scriptList = new List<String>();
      scriptList.add(scritNameController.value.text);
      scriptList.add(profitController.value.text);
      scriptList.add(ltpController.value.text);
      scriptList.add(segmentController.value.text);
      
      scriptsPojoList.add(scriptList);
      
      scritNameController.clear();
      profitController.clear();
      ltpController.clear();
      segmentController.clear();
  }

  submit() {
    userID = userIDController.value.text;
    
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PortfolioScreen(scriptsPojoList: scriptsPojoList, userID: userID ),
        ),
      );
  
  }

  clear() {

      scriptsPojoList.clear();

      scritNameController.clear();
      profitController.clear();
      ltpController.clear();
      segmentController.clear();
  }
}