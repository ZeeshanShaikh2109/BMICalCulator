import 'package:bmi_calculator/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'constant.dart';

enum Gender{
  male,
   female,
}


class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var height = 160.0;
  int weight = 45;
  int age    = 50;

  Color activeColor = tabcolor ;
  Color inactiveColor = backgroundColor;
  Color maleTabColor = backgroundColor ;
  Color femaleTabColor =tabcolor ;

  Color selectedColor = Colors.white;
  Color notselectedcolor = Colors.white;
  Color maleTextColor = Colors.white;
   Color femaleTextColor = Colors.white;

   updateUI( Gender gender ){
    if (gender ==Gender.male) {
      setState(() {
        maleTabColor = activeColor;
        femaleTabColor = inactiveColor;
        maleTextColor = selectedColor;
        femaleTextColor = notselectedcolor;
      });
    }else {
      setState(() {
      femaleTabColor=activeColor;
      maleTabColor=inactiveColor;
      maleTextColor=selectedColor;
      femaleTextColor=notselectedcolor;  
      });
      
    }

   }




  addsubweight (bool add) {
add? weight++ : weight-- ;


}
addsubage(bool add){
  add ? age++ : age-- ;

}

  @override
  Widget build(BuildContext context) {
        var width = MediaQuery.of(context).size.width;
        var heights = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 1, 134),
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
        backgroundColor: Colors.black,
        
      ),
      body: Column(
        children:[ 
         

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    updateUI(Gender.male);
                  },
                  child: Container(
                  height: 150,
                  width: width/2 -16,
                  color: maleTabColor,
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.male,size: 60 ,color: maleTextColor),
                      Text('Male',style:TextStyle(fontSize: 30,color: maleTextColor)),
                    ],
                  ),
                  
                    ),
                ),
              ),
                
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: GestureDetector(
                    onTap: (){
                      updateUI(Gender.female);
                    },
                     child: Container(
                      
                                 height: 150,
                                 width: width/2 -16,
                                 color:femaleTabColor,
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                      Icon(Icons.female,size: 60 ,color: femaleTextColor,),
                      
                      Text('Female' ,
                      style:TextStyle(fontSize: 30,color:femaleTextColor),
                      ),
                      
                                   ],
                                 ),
                                 
                                   ),
                   ),
                 ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height:150, 
              width: 400,
              color: Color.fromARGB(255, 12, 2, 71),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text('Height',style:TextStyle(fontSize: 30,color: Colors.white)),
                Text(height.round().toString(),style:TextStyle(fontSize: 30,color: Colors.white)),
                SliderTheme(data: SliderTheme.of(context).copyWith(
                thumbColor: Color.fromARGB(255, 243, 241, 241),
                activeTrackColor: Color.fromARGB(255, 247, 179, 201),
                inactiveTrackColor: Color.fromARGB(255, 119, 109, 93),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 25),
                overlayColor: Color.fromARGB(255, 8, 0, 3)
          
                ), child: Slider(value: height,
                max: 250,
                min: 140, 
                onChanged:(value) {
                  setState(() {
                    height = value;
                    
                  });
                  
                } ))
              ]),
              ),
          ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: width/2 -16 ,
                    color: Color.fromARGB(255, 12, 2, 71),
                    child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Text('Weight',
                      style:TextStyle(fontSize: 30,color: Colors.white)),
                      Text(weight.toString(),style:TextStyle(fontSize: 30,color: Colors.white)),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            addsubweight(false);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 177, 199),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          
                            child: Icon(Icons.remove,
                                               size: 40,
                                               color: Colors.white,
                            ),
                          ),
                        
                     
                      ),
                    
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            addsubweight(true);
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color:Color.fromARGB(255, 245, 177, 199),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          child: Container(
                            decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 177, 199),
                            borderRadius: BorderRadius.circular(10),
                            ),
                          

                            child: Icon(Icons.add,
                                               size: 40,
                                               color: Colors.white),
                          ),
                        ),
                      ),
                
                     ],)
                    ],)
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: width/2 -16 ,
                    color: Color.fromARGB(255, 12, 2, 71),
                    child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Text('Age',style:TextStyle(fontSize: 30,color: Colors.white)),
                      Text( age.toString(),style:TextStyle(fontSize: 30,color: Colors.white)),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            addsubage(false);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 177, 199),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(
                            Icons.remove,
                           size: 40,
                          color: Colors.white
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            addsubage(true);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:Color.fromARGB(255, 245, 177, 199),
                            borderRadius: BorderRadius.circular(10),
                           ),
                          child: Icon(Icons.add,
                          size: 40,
                          color: Colors.white,),
                        ),
                      ),
                      ]
                    ,)
                              ])
                            ),
                )],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                var heightmeter = height/100;
                var bmiresult = weight/(heightmeter*heightmeter);
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => RESULTPAGE(result: bmiresult,),
                )
                );
                 print(bmiresult);
              },
              child: Container(
                height: 60,
                width: width,
                color: Color.fromARGB(255, 12, 2, 71 ,),
                child: Center(
                  child: Text('Calculate Your BMI',
                  style:TextStyle(color:Colors.white,fontSize: 30) ,
                  // color:Colors.white),
                     ),
                ) ),
            )  
        ]
       

        
        
    
        )
      
        
    );
  }
}

  