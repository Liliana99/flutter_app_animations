
import 'package:cuido_de_ti_v3/app/sign_in/sig_in_buttons/sign_in_button.dart';
import 'package:cuido_de_ti_v3/common_widgets/custom_text.dart';
import 'package:cuido_de_ti_v3/common_widgets/platform_alert_dialog.dart';
import 'package:cuido_de_ti_v3/services/masterpreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class RegisterRolFormStateful  extends StatefulWidget {
   @override
  _RegisterRolFormStatefulState createState() => _RegisterRolFormStatefulState();
   
  }
  class _RegisterRolFormStatefulState extends State<RegisterRolFormStateful> {
    static const heightButtonsProfile = 150.0;
    static String dialogText = 'Ahora necesitamos que entres tú número de teléfono propio.';
    static String dataCuidadorText ='Recibe notificaciones, si el telefono móvil de  CUIDADO esta inactivo.';
    static String dataCuidadoText ='Envia notificaciones automáticas desde su telefono móvil, si se esta inactivo.';
    bool boolDesactivaButtom = false;
    List<TargetFocus> targets = List();
    GlobalKey keyButton = GlobalKey();
     GlobalKey keyButton2 = GlobalKey();


     

    @override
    void initState() {
     // initTargets();
     // WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
      super.initState();
  }

  Future<void>initTargets() async {
  targets.add(TargetFocus(
          identify: "Target 1",
          keyTarget: keyButton,
          contents: [
            ContentTarget(
                align: AlignContent.top,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Cuidador",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: CustomText(data:dataCuidadorText,
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
                        "Cuidado",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                      SizedBox(height: 5.0,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: CustomText(data:dataCuidadoText,
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
      
    }

  void showTutorial() {
       print('showTutorial keyButton $keyButton targets : $targets ');
   initTargets();
      TutorialCoachMark(
        context,
        targets: targets, // List<TargetFocus>
        colorShadow: Colors.blue, // DEFAULT Colors.black
          alignSkip: Alignment.bottomRight,
        textSkip: "CERRAR",
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

  
  Future<void> _submit( String profile) async {
      try {
        MasterPreference().saveRolPreference(profile);
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
  
  
  

Widget _buildContentButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SignInButton(
            text: 'Cuidador',
            textColor: Color(0xFF263238),
            color: Color(0xFF1DE9B6),
            height: (MediaQuery.of(context).size.height)/9,
            borderRadius: 30.0,
            onPressed: () => _submit('Cuidador'),
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Cuidado',
            textColor: Color(0xFFFFFFFF),
            color: Color(0xFF90CAF9),
             height: (MediaQuery.of(context).size.height)/9,
            onPressed:()=>  _submit('Cuidado'),
          ),
        ],
      ),
    );
  }

  Widget _textSelecionaPerfilMasIcono() =>Column(
    crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
                  child: new CustomText(
                    data: 'Selecciona tu perfil',
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
                          onPressed :showTutorial,
                        ),
          ],
        ),
      ],
  );
  Widget  body(BuildContext context) {
    print('body keyButton $keyButton');
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>
          [
            SizedBox(height: 20.0,),
          _encabezado (),
            SizedBox(height: 30.0,),
          _textSelecionaPerfilMasIcono(),
            SizedBox(height: 40.0,),
          //_buildButtonsProfileChildren(),
          _buildContentButtons(context),
          ],),
      );
  } 
  @override
    Widget build(BuildContext context) {
    return Scaffold(
        body: body (context) ,
      );
    }
}