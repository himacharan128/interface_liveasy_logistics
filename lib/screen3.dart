import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed:(){
            Navigator.pushNamed(context, "phone");
          },
          icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),
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
                'Verify Phone',
                style:TextStyle(fontSize: 22,fontWeight:FontWeight.bold ),
              ),//              verify phone
              SizedBox(height: 20,),
              Text('code sent to ',
                style:TextStyle(fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),//               code sent to
              SizedBox(height: 30,),
              Pinput(
                length: 6,
                showCursor: true,
              ),
              SizedBox(height: 20,),
              Text('Did not receive the code?',
                style:TextStyle(fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),//               din't receive code
              SizedBox(height: 30,),
              SizedBox(
                height: 45,
                width: double.infinity ,
                child:ElevatedButton(
                  onPressed:(){
                    Navigator.pushNamed(context,"profile");
                  },
                  child: Text('VERIFY AND CONTINUE'),
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
