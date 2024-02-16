import 'package:flutter/material.dart';
import 'package:os_project/MRU.dart';
import 'package:os_project/Optimal.dart';
import 'package:os_project/RandomPageReplacment.dart';

class ButtonView extends StatefulWidget {
  const ButtonView({super.key});

  @override
  State<ButtonView> createState() => _ButtonViewState();
}

class _ButtonViewState extends State<ButtonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title:const Text(
          '@zain_dev_',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          //Button 1
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MRUPageReplacement(),),);
            },
            child: Center(
              child: Container(
                height: 70,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(45),
                ),
                child:const  Center(child: Text('MRU',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w900),)),
              ),
            ),
          ),

          //Button 2
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OptimalPageReplacement(),),);
            },
            child: Center(
              child: Container(
                height: 70,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Center(child: Text('Optimal',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w900),)),
              ),
            ),
          ),

          //Random
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RandomPageReplacement(),),);
            },
            child: Center(
              child: Container(
                height: 70,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Center(child: Text('Random',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w900),)),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
