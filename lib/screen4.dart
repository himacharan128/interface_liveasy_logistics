import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left:30,right: 30),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please select your profile',
                style:TextStyle(fontSize: 22,fontWeight:FontWeight.bold ),
              ),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
                child: RadioListTile<String>(
                  title: Row(
                    children: [
                      Icon(Icons.house),
                      SizedBox(width: 10),
                      Text('Shipper'),
                    ],
                  ),
                  subtitle: Text('lorem ipsum dolor sit amet,           consectetur adipiscing'),
                  value: 'Shipper',
                  groupValue: selectedRole,
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value as String?;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
                child: RadioListTile<String>(
                  title: Row(
                    children: [
                      Icon(Icons.local_shipping),
                      SizedBox(width: 10),
                      Text('Transporter'),
                    ],
                  ),
                  subtitle: Text('lorem ipsum dolor sit amet,           consectetur adipiscing'),
                  value: 'Transporter',
                  groupValue: selectedRole,
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value as String?;
                    });
                  },
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 45,
                width: double.infinity ,
                child:ElevatedButton(
                  onPressed:(){
                    Navigator.pushNamed(context,"frame");
                  },
                  child: Text('CONTINUE'),
                  style: ElevatedButton.styleFrom( primary: Colors.indigo.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                ) ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
