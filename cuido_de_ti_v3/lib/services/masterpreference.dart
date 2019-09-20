

import 'package:shared_preferences/shared_preferences.dart';

class MasterPreference {

Future<void> saveRolPreference(String rol) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("rol", rol);
  }
Future<void> saveRolContacto(String rol) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("rol_contacto", rol);
  }  

Future<void> saveMovNow(String valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fechahora", valor);
}  
Future<void> saveEmailPreference(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    
  }
Future<void> saveNombrePreference(String valor) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("nombre", valor);
        
}
Future<void> saveIntroPreference(String intro) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("intro", intro);
    
  }
Future<void> saveTelPropioPreference(String telpropio) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("telpropio", telpropio);
    
  }

Future<void> saveAvisoMensaje(bool valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("aviso", valor);
    
  }  

Future<void> saveFueAyer(String valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("ayer", valor);
    
  }  
Future<void> saveHoraDef(String valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("horaDef", valor);
    
  }   
Future<void> saveTokenParejaPreference(String tokenpareja) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("tokenp",tokenpareja);
    
  }  
Future <void> saveAccessToken(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);

  }
  Future <void> saveEsHoy(String valor) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("esHoy", valor);

  }

  Future <void> saveQueFechaEs(String valor) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("quefechaeshoy",valor);
  }
  Future <void> saveScrrenEvents(String valor) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fetch_events_screen",valor);

  }

Future<void> saveCodeCountryPreference(String code) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("code", code);
     
    } 
Future<void> saveCodeCountryPropioPreference(String code) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("codepropio", code);
     
    }     
Future<void> savePasswordPreference(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("password", password);
    
  }
Future<void> saveTel(String valor) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("tel", valor);
      }
Future<void> saveEsDescanso(bool valor) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("descanso", valor);
      }      

Future<void> saveImage(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("archivo", path);
    
  }
Future<void> saveKeyFB(String valor) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("keyfb", valor);
       
      }
Future<void> saveHorasAvisoCuidador(String valor) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("horas", valor);
       
      } 

Future<void> saveMinsAvisoCuidador(String valor) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("mins", valor);
       
      }           
Future<void> saveKeyRegister(String valor) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("register", valor);
      }
Future<void> saveKeyMensajeRegister(bool valor) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("mensajeregister", valor);
      
      }
Future<String> getNombrePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nombre = prefs.get("nombre");
     return nombre;
  }
  Future<String> getQueFechaEsHoy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String valor = prefs.get("quefechaeshoy");
     return valor;
  }
   Future<String> getHoraDef() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String valor = prefs.get("horaDef");
     return valor;
  }
  Future<String> getScreenEvents() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String valor = prefs.get("fetch_events_screen");
     return valor;
  }

  Future<String> getHorasAvisoCuidador() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String valor = prefs.get("horas");
     return valor;
  }
  Future<String> getMinsAvisoCuidador() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String valor = prefs.get("mins");
     return valor;
  }

   Future<String> getEsHoy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String valor = prefs.get("esHoy");
     return valor;
  }
   Future<String> getFueAyer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String valor = prefs.get("ayer");
     return valor;
  }

  Future<bool> getDescanso() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool valor = prefs.get("descanso");
     return valor;
  }


Future<String> getMovNow() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fechahora = prefs.get("fechahora");
     return fechahora;
  }
Future<bool> getKeyMensajeRegister() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool key = prefs.get("mensajeregister");
     return key;
  } 
Future<String> getKeyFB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = prefs.get("keyfb");
     return key;
  }          

Future<String> getIntroPreference() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
    var  intro = prefs.get("intro");
    return intro;
}   
Future<String> getEmailPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.get("email");
    return email;
}
Future<String> getRolPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    String  rol  = prefs.get("rol");
     return rol;
}
Future<bool> getAviso() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    bool  aviso  = prefs.get("aviso");
     return aviso;
}

Future<String> getRolContacto() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    String  rol  = prefs.get("rol_contacto");
     return rol;
}

Future<String> getPasswordPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String password = prefs.get("password");
    return password;
  }
Future<String> getTelPropioPreference() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
     String  telpropio  = prefs.get("telpropio");
       return telpropio;
    }
Future<String> getImage(String _mifile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _mifile = prefs.get("archivo");
    return _mifile;
  }
Future<String> getTokenPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _token= prefs.get("token");
        return _token;
    }
Future<String> getTokenParejaPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _tokenp= prefs.get("tokenp");
        return _tokenp;
    }    

Future<String> getCodeCountryPropioPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _code= prefs.get("codepropio");
        return _code;
    }    
Future<String> getTel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _tel = prefs.get("tel");
    return _tel;
}
Future<String> getCodeContacto() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _codeContacto= prefs.get("codecontacto");
  return _codeContacto;
 }
Future<String> getKeyRegister() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _key= prefs.get("register");
  return _key;
 }


Future<void> clearEmailPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", null);
    
  }

Future<void> clearRolPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("rol", null);
    
  }
Future<void> clearRolContacto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("rol_contacto", null);
    
  }  
Future<void> clearPasswordPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("password", null);
    
  }
  Future<void> clearNombrePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("nombre", null);
    
  }
  Future<void> clearTelPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("tel", null);
    
  }
  Future<void> clearTokenPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", null);
    
    }

  Future<void> clearTelPropioPreference() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString("telpropio", null);
    
    } 
  Future<void> clearScreenEvents() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('fetch_events_screen', null);
    }  
  Future<void> clearEsHoy() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('esHoy', null);
    } 
  Future<void> clearHoraDef() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('horaDef', null);
    }   
   Future<void> clearAyer() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('ayer', null);
    }         
  
  Future <Null> clearDatosLocal() async {
    await clearEmailPreference();
    await clearPasswordPreference();
    await clearRolPreference();
    await clearRolContacto();
    await clearTelPreference();
    await clearTelPropioPreference();
    await clearTokenPreference();
    
  }
  


}
