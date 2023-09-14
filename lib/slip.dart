import 'package:flutter/material.dart';

class Slip extends StatelessWidget {
  const Slip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.pink.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Image.asset("assets/kcb.jpg"),
         Center(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(style: TextStyle(color:Colors.purple.shade900),"MULTIMEDIA UNIVERSITY PAYMENT"),
              Text(style: TextStyle(color:Colors.purple.shade900),"CASH DEPOSIT"),
            ],
                 ),
         ),
         Padding(
           padding: const EdgeInsets.only(right: 20),
           child: Row(
            children: [
              Text(style: TextStyle(color:Colors.purple.shade900),"KCB ONGATA RONGAI"),
              const Spacer(),
              Column(
                children: [
                  Text(style: TextStyle(color:Colors.purple.shade900),"CREDIT ACCCOUNT DETAILS:"),
                  Text(style: TextStyle(color:Colors.purple.shade900),"A/C NO : 1104513447"),
                  Text(style: TextStyle(color:Colors.purple.shade900),"A/C REF : 059260970016"),
                  Text(style: TextStyle(color:Colors.purple.shade900),"MULTIMEDIA UNIVERSITY OF KENYA"),
                ],
              )
            ],
                 ),
         ),
         Center(
           child: Row(
            children: [
              Text(style: TextStyle(color:Colors.purple.shade900),"Cash payment received  :  "),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                right: 20),
                child: Column(children: [
                  Center(child: Text(style: TextStyle(color:Colors.purple.shade900),"10,000.00")),
                  Text(style: TextStyle(color:Colors.purple.shade900),"-----------------")
                ],),
              )
            ],
                 ),
         ),
         Text(style: TextStyle(color:Colors.purple.shade900),"Kenya Shillings  TEN THOUSAND ONLY"),
         const SizedBox(height: 50,),

        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(style: TextStyle(color:Colors.purple.shade900),"PAYMENT DETAILS"),
            Text(style: TextStyle(color:Colors.purple.shade900),"--------------"),
            Text(style: TextStyle(color:Colors.purple.shade900),"Credit Account  :  1104513447"),
            Text(style: TextStyle(color:Colors.purple.shade900),"MMU A/C Name  :  MULTIMEDIA UNIVERSITY OF KENYA"),
            Text(style: TextStyle(color:Colors.purple.shade900),"Mobile No  :  254769047060"),
            Text(style: TextStyle(color:Colors.purple.shade900),"Payment Details  :  CIT-223-032-2021 --JOHN OMEYO"),


            
          ],
        )
      ]),
    );
  }
}
