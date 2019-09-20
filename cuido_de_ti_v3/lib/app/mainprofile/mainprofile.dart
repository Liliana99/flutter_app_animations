import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class MainProfile extends StatefulWidget {
  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  int currentIndex = 0;
  
  Widget _clipPart(){
    return ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 250,
                color: Colors.blue[200],
              ),);
  }  

  Widget _imagen()=>Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: Colors.blue[200],
                        backgroundImage: AssetImage('assets/images/profile/profile.png'),
                        radius: 90,
        ),
                  ]),
  ); 

  Widget _detallesColum()=> Padding(
    padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Home',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                             ),
                           ),
                    ),
                    SizedBox(height: 80.0,),
                    Text('Frank,',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                         ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('   Is my care',
                            style: TextStyle(
                              fontSize: 22,
                             ),
                           ),
                    ),

                    SizedBox(height: 10.0,),
                  ]),
  );

  Widget _encabezadoFila()=>Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      
      _detallesColum(),
      _imagen(),
    ],
  ); 

  Widget _encabezado() => Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        _clipPart(),
      
        _encabezadoFila(),
     
      ],
    );

  Widget body(BuildContext context) {

        return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>
              [
                 
              _encabezado(),
         
          ],),
      );
  }   

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: body(context),
      bottomNavigationBar: BottomNavyBar(
              selectedIndex: currentIndex,
              showElevation: true, // use this to remove appBar's elevation
              onItemSelected: (index) => setState(() {
                          currentIndex = index;
                        
                }),
   items: [
     BottomNavyBarItem(
       icon: Icon(
         Icons.apps,
         size: 30.0,),
       title: Text('Home'),
       activeColor: Colors.blue,
     ),
     BottomNavyBarItem(
         icon: Icon(
                    Icons.people,
                    size: 30.0
                    ),
         title: Text('Users'),
         activeColor: Colors.pinkAccent
     ),
     BottomNavyBarItem(
         icon: Icon(
           Icons.message,
           size: 30.0),
         title: Text('Messages'),
         activeColor: Colors.green
     ),
     BottomNavyBarItem(
         icon: Icon(
           Icons.settings,
           size: 30.0),
         title: Text('Settings'),
         activeColor: Colors.black
     ),
    ],
    )
    );
  }
}