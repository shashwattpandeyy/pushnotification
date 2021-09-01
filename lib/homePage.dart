import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //Import in the beginning of file

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlutterLocalNotificationsPlugin ftlrnotification;
  @override
  void initState() {
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('app_icon');
    var IOSinitializer = new IOSInitializationSettings();
    var initializeSetting = new InitializationSettings(
        android: androidInitialize, iOS: IOSinitializer);
    ftlrnotification = new FlutterLocalNotificationsPlugin();
    ftlrnotification.initialize(initializeSetting,
        onSelectNotification: notificationSelected);
  }

  Future _showNotification(String response) async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel", "Shashwat", "this is",
        importance: Importance.max);
    var iosdetail = new IOSNotificationDetails();
    var generalNotification =
        new NotificationDetails(android: androidDetails, iOS: iosdetail);
    await ftlrnotification.show(
        0, "Notification 😊", response, generalNotification);
  }

  void api() async {
    var response = await http.get(new Uri.http("10.0.2.2:3000", "/users")); // for emulator
    
    // var response = await http.get(new Uri.http("172.16.42.27:3000", "/users")); // for device
    print(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notification'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () async {
              // var response =
              //     await http.get(new Uri.http("10.0.2.2:3000", "/users"));
              
              var response =
                  await http.get(new Uri.http("172.16.42.27:3000", "/users"));
              // print(response.body.runtimeType);
              _showNotification(response.body);
            },
            child: Text("Click Me!"),
          ),
        ),
      ),
    );
  }

  Future notificationSelected(String? payload) async {}
}
