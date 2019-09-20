import 'package:avatar_glow/avatar_glow.dart';
import 'package:cuido_de_ti_v3/app/register_rol/register_rol_page.dart';
import 'package:cuido_de_ti_v3/app/register_rol/resgister_rol_in_bloc.dart';
import 'package:flutter/material.dart';


class SplashScreen extends  StatefulWidget {

 @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  GlobalKey keyButton = GlobalKey();
  
  static const List<Color> signInGradients = [
    Color(0xFF64FFDA),
    Color(0xFF03A0FE),
  ];

  static const List<Color> signUpGradients = [
    Color(0xFF006064),
    Color(0xFF1DE9B6),
    
  ];
  static const List<Color> annonimously = [
     Color(0xFFFF9945),
    Color(0xFFFc6076),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30.0,),
                    AvatarGlow(
                        startDelay: Duration(milliseconds: 1000),
                        glowColor: Colors.blue,
                        endRadius: 90.0,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        child: Material(
                          elevation: 8.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor:Colors.grey[100] ,
                            child: FlutterLogo( size: 95.0,),
                            //Image.asset(
                                    // 'assets/images/icon.png',
                                    // height: 120,
                               // ),
                            radius: 65.0,
                          ),
                        ),
                      ),
                SizedBox(height: 40.0,),
                 roundedRectButton("Sign in", signInGradients, false,context),
                  SizedBox(height: 7.0,), 
                  roundedRectButton("Create an Account", signUpGradients, false,context),
                  SizedBox(height: 20.0,), 
                  Text('---------Or---------', style: TextStyle(fontSize: 24.0)),
                   SizedBox(height: 15.0,), 
                  roundedRectButton("Anonymously", annonimously, false,context),
             
              ],
            ),
          ),
           
          ),
    );
    
  }
  Widget roundedRectButton(
    String title, List<Color> gradient, bool isEndIconVisible,BuildContext context) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: InkWell(
              child: Stack(
            alignment: Alignment(1.0, 0.0),
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(mContext).size.width / 1.7,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                      gradient: LinearGradient(
                          colors: gradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                ),
                child: Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:22,
                        fontWeight: FontWeight.w500)),
                padding: EdgeInsets.only(top: 16, bottom: 16),
              ),
              Visibility(
                visible: isEndIconVisible,
                child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: ImageIcon(
                      AssetImage("assets/ic_forward.png"),
                      size: 30,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        onTap:(){
           final resgiterRolInBloc = RegisterRolInBloc();
           Navigator.pushReplacement(
            mContext, MaterialPageRoute(builder: (context) =>  RegisterRolPage(bloc: resgiterRolInBloc,keyButton: keyButton,)));

        },
      ),
    );
  });
 }
}
