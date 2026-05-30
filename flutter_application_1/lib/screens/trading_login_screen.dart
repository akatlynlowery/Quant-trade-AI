import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
class TradingLoginScreen extends StatelessWidget{
  const TradingLoginScreen ({super.key});

  @override

Widget build(BuildContext context){
  return Scaffold( 
    backgroundColor: Colors.black,

    appBar: AppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.pink,
    ),
    body:Center(  
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children:[
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: "Enter your username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          SizedBox(height: 20),

          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Enter your password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
            Navigator.push(  
              context,
              MaterialPageRoute(
                builder: (context) => const TradingHomePage(),
              ),
            );
            },
            child: const Text(
              "Log In",
              style: TextStyle(fontSize: 15)
            )
          )
        ]
      )
    )


  );
}

}
