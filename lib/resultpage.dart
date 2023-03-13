import 'package:flutter/material.dart';




class RESULTPAGE extends StatefulWidget {
  final double result ;

  
  const RESULTPAGE ({super.key, required this.result});

  @override
  State<RESULTPAGE> createState() => _RESULTPAGEState();
  

}

class _RESULTPAGEState  extends State<RESULTPAGE>{

  String resultTxt = 'Result' ;
  Color resultColor = Colors.white;
  String tagLine = "Loading...";
  String imageName = "Normal";
  


void updateUI(String result_txt, Color color, String tag , String image, ) {

setState(() {
  resultTxt = result_txt;
  resultColor = color ;
  tagLine = tag;
  imageName = image;
}
);
}

getBMIChart(){
  if(widget.result<18){

updateUI("Uderweight", Colors.lightBlue
, "Eat More Grow Fast", 'underweight');
  }
  else if (widget.result<18 && widget.result<25) {
  updateUI("Normal",Colors.greenAccent
,  'Stay As It Is', 'normal');
  }
   else if(widget.result<25 && widget.result<30) {
updateUI("Overweight",Colors.yellowAccent
, 'Eat Less ;Exercise More', 'overweight'); 
}
else if(widget.result<30 && widget.result<35)
 {
updateUI("Obese",  Colors.deepOrangeAccent
, '''Don't Eat; Just Exercise  ''' , 'obese'); 
}
else if(widget.result > 35){
      updateUI('Extreme Obese', Colors.red, "Exercise Only", 'extreme');
}
 
 else ()
 {
resultTxt =   ('Could not Find Result') ; 

  };
}



  

  @override
  void initState() {
    super.initState();
    getBMIChart();
  }
  


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center( child: const Text('Result Page'),
        
        )
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
               
                width: width,
                height: 300,
                color: Color.fromARGB(255, 12, 2, 71),
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text('${resultTxt}',
                  style:TextStyle(fontSize: 30,color: Colors.white)
                  ),
                  Text('${widget.result.round()}'.toString(),
                  style:TextStyle(fontSize: 30,color: Colors.white)
                  ),
                  Text('${tagLine}',
                  style:TextStyle(fontSize: 30,color: Colors.white)
                  )
                ]
                ),
              ),
            


              
            ),
              Image.asset("asset/${imageName}.png",height: 250, fit: BoxFit.fitHeight,)
          ],
        ), 
      );
  }
}
