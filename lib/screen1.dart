import 'package:flutter/material.dart';

class language extends StatefulWidget {
  const language({super.key});

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {
  String selectedLanguage = 'English'; // Default selected language
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
                'Please Select Your Language',
                style:TextStyle(fontSize: 22,fontWeight:FontWeight.bold ),
              ),
              SizedBox(height: 10,),
              Text('You can change the language                                   at any time. ',
                style:TextStyle(fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10,),
              Container(
                height:45,
                width: 250 ,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black),
                ),
                child:DropdownButton<String>(
                  value: selectedLanguage,
                  onChanged: (newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                    });
                    },
                  isExpanded: true, // Set the dropdown to expand horizontally
                  underline: SizedBox(), // Remove the default underline
                  items: [
                    DropdownMenuItem<String>(
                      value: 'English',
                      child: Text('   English',style:TextStyle(fontSize: 20,),),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Hindi',
                      child: Text('   Hindi',style:TextStyle(fontSize: 20,),),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Telugu',
                      child: Text('   Telugu',style:TextStyle(fontSize: 20,),),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Tamil',
                      child: Text('   Tamil',style:TextStyle(fontSize: 20,),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 45,
                width:  250 ,
                child:ElevatedButton(
                  onPressed:(){
                    Navigator.pushNamed(context,"phone");
                  },
                  child: Text('NEXT'),
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
