import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class phoneno extends StatefulWidget {
  const phoneno({super.key});

  static String verify='';

  @override
  State<phoneno> createState() => _phonenoState();
}

class _phonenoState extends State<phoneno> {
  TextEditingController countrycode= TextEditingController();
  var phone='';

  @override
  void initState(){
    countrycode.text='+91';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed:(){
            Navigator.pushNamed(context, "frame");
          },
          icon: Icon(Icons.close,color: Colors.black,),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left:30,right: 30),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please Enter Your Mobile Number',
                style:TextStyle(fontSize: 22,fontWeight:FontWeight.bold ),
              ),
              SizedBox(height: 10,),
              Text('You will receive a 6 digit code                                    to verify next.',
              style:TextStyle(fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
              SizedBox(height: 20,),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    SizedBox(
                      width: 70,
                      child: TextField(
                        controller: countrycode,
                        decoration: InputDecoration(border:InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      child: Text('-'),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          phone=value;
                        },
                        keyboardType: TextInputType.phone,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                            hintText: 'Mobile Number',
                          border: InputBorder.none
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 45,
                width: double.infinity ,
                child:ElevatedButton(
                  onPressed:() async{
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countrycode.text+phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        phoneno.verify=verificationId;
                        Navigator.pushNamed(context,"otp");
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );

                    // Navigator.pushNamed(context,"otp");
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
