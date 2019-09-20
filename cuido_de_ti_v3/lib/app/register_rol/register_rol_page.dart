


import 'package:cuido_de_ti_v3/app/mainprofile/mainprofile.dart';
import 'package:cuido_de_ti_v3/app/register_rol/resgister_rol_in_bloc.dart';
import 'package:cuido_de_ti_v3/common_widgets/custom_text.dart';
import 'package:cuido_de_ti_v3/common_widgets/platform_alert_dialog.dart';
import 'package:cuido_de_ti_v3/services/masterpreference.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class RegisterRolPage  extends StatelessWidget {
RegisterRolPage ({Key key , @required this.bloc, this.keyButton}):super(key:key);
final RegisterRolInBloc bloc;
var keyButton= GlobalKey();


Future<List>initTargets() async {
  String dataCuidadorTextS ='Recibe notificaciones, si el telefono móvil de  CUIDADO esta inactivo.';
  String dataCuidadoTextSp ='Envia notificaciones automáticas desde su telefono móvil, si se esta inactivo.';
  String dataCuidadorTextEn ='Receive notifications from the  Care mobile phone.';
  String dataCuidadoTextEn ='Send automatic notifications to Caretaker mobile phone.';
  print('keyButton '+ keyButton.toString());
   List<TargetFocus> targets=List();
  
  targets.add(TargetFocus(
          identify: "Target 1",
          keyTarget: keyButton ,
          contents: [
            ContentTarget(
                align: AlignContent.top,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Caretaker",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: CustomText(data:dataCuidadorTextEn,
                          style: TextStyle(color: Colors.white,
                          ),
                          color: Colors.white,
                        fontSize: 17.0,
                        ),
                      )
                    ],
                  ),
                ),),

                ContentTarget(
                align: AlignContent.bottom,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 50.0,),
                      Text(
                        "Care",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                      SizedBox(height: 5.0,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: CustomText(data:dataCuidadoTextEn,
                        color: Colors.white,
                          fontWeight: FontWeight.w600,
                        fontSize: 17.0,
                        ),
                      )
                    ],
                  ),
                ),),

          ],
    ),
    
    );
    return targets;
      
    }

  void showTutorial(BuildContext context) async {
     var targets = await initTargets();
     print('targest $targets');
      TutorialCoachMark(
        context,
        targets: targets, // List<TargetFocus>
        colorShadow: Colors.blue, // DEFAULT Colors.black
          alignSkip: Alignment.bottomRight,
        textSkip: "CLOSE",
        paddingFocus: 10,
        //opacityShadow: 0.8,
        finish: (){
          print("finish");
        },
        clickTarget: (target){
          print(target);
        },
        clickSkip: (){
          print("skip");
        }
      )..show();
    }

  Widget _buildButtonsProfileChildrenColumn(BuildContext context,bool isLoading) =>Padding(
    padding: const EdgeInsets.all(12.0),
    child:Column(
    mainAxisAlignment: MainAxisAlignment.center,
        children: [
                _progressButtonProfile(context,true,'CareTaker',0xFF263238,0xFF1DE9B6),
                SizedBox(height: 20.0,),
                _progressButtonProfile(context,true,'Care',0xFFFFFFFF,0xFF90CAF9),
              ],
  ),);


  Widget _textButtons (String profile, int inttextcolor){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomText(
            data: 'I  am ',
            fontSize: 24.0,
            color: Color(inttextcolor),
            fontWeight: FontWeight.w300,
            textDirection: TextDirection.ltr,
          ),
          SizedBox(width: 10.0,),
          CustomText(
            data: profile,
            fontSize: 24.0,
            color: Color(inttextcolor),
            fontWeight: FontWeight.w500,
            textDirection: TextDirection.ltr,
            maxLines: 2,
          ),

        ],
      ),
    );
  }

  Widget _progressButtonProfile(BuildContext context,bool isLoading,String profile, int inttextcolor,int intcolorbutton){

    return ProgressButton(
      defaultWidget: _textButtons(profile, inttextcolor),
      color: Color(intcolorbutton),
      progressWidget: const CircularProgressIndicator(),
      type:ProgressButtonType.Raised,
      width: (MediaQuery.of(context).size.width),
      height: (MediaQuery.of(context).size.height)/9,
      borderRadius: 30.0,
      animate: isLoading?true:false,
      onPressed: () async {
        if(isLoading){
          int score;
            bloc.setIsLoading(false);
            score = await Future.delayed(
                  const Duration(milliseconds: 1000), () => 42);
              // After [onPressed], it will trigger animation running backwards, from end to beginning
           
           return () {
                 _submit(context,  profile);
            
              // Optional returns is returning a function that can be called
              // after the animation is stopped at the beginning.
              // A best practice would be to do time-consuming task in [onPressed],
              // and do page navigation in the returned function.
              // So that user won't missed out the reverse animation.
              };
          
        }  }
    );
  }  



  Future<void> _submit( BuildContext context, String profile) async {
      try {
       
        MasterPreference().saveRolPreference(profile);
        Navigator.of(context).pop();
         Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainProfile()),
      );
       
      } catch (e) {
        PlatformExceptionAlertDialog(
          title: 'Error Entrar',
          content: e.toString(),
          defaultActionText: 'Ok',
        ).show(context);
      } 
    }
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
  Widget _encabezado() => Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        _clipPart(),
      _imagen(),
      ],
    );
 
  Widget _textSelecionaPerfilMasIcono(BuildContext context) =>Column(
    crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
                  child: new CustomText(
                    data: 'Select your rol ',
                    color: Colors.black,
                    textAlign: TextAlign.center,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(width: 15.0,),
                IconButton(
                  key:keyButton,
                        padding:EdgeInsets.only(right:30.0 , bottom: 32.0),
                        icon: Icon(Icons.info_outline,
                        size : 35.0,
                        color: Colors.grey[400],),
                          splashColor: Colors.blue,
                          onPressed :(){showTutorial(context);},
                        ),
          ],
        ),
      ],
  );
 
  Widget  body(BuildContext context,bool isLoading) {
  print('isLoading '+isLoading.toString());
        return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>
              [
                SizedBox(height: 20.0,),
              _encabezado(),
            SizedBox(height: 30.0,),
        _textSelecionaPerfilMasIcono(context),
            SizedBox(height: 40.0,),
         _buildButtonsProfileChildrenColumn(context,isLoading),
         // _buildContentButtons(context,isLoading),
          ],),
      );
  } 
  @override
    Widget build(BuildContext context) {
    return Scaffold(
            body:StreamBuilder<bool> (
            stream: bloc.isLoadingStream,
            initialData: false,
            builder:(context,snapshot){
              return body(context,snapshot.data);
            } ,
          ) ,
          

      );
    }
    
}

mixin Globalkey {
}
