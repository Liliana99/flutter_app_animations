
import 'package:cuido_de_ti_v3/common_widgets/platform_alert_dialog.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';

class PlatFormExceptionAlertDialog extends PlatformExceptionAlertDialog {

  PlatFormExceptionAlertDialog({
    @required String title, 
    @required PlatformException exception
    }):super(
      title:title,
      content:exception.message,
      defaultActionText:'Entendido'
    );

    static String _message(PlatformException exception) {
      return _erros [exception.code]??exception.message;
    }

    static Map<String,String> _erros = {
       'ERROR_WEAK_PASSWORD' :'Password debe contener Números y alguna letra en mayúsculas.', //If the password is not strong enough.
       'ERROR_INVALID_EMAIL': 'Email con formato inválido.',// - If the email address is malformed.
       'ERROR_EMAIL_ALREADY_IN_USE':'Esta cuenta de email ya esta registrado con otro usuario.',// - If the email is already in use by a different account.
       'ERROR_WRONG_PASSWORD':'Password no válido.',// - If the [password] is wrong.
       'ERROR_USER_NOT_FOUND':'Cuenta de email no ha sido encontrada o ha sido eliminada en nuestra basse de datos..!',// - If there is no user corresponding to the given [email] address, or if the user has been deleted.
       'ERROR_USER_DISABLED':'Cuenta de email esta desabilitada, contacte con nuestro servicio de atención al cliente.',// If the user has been disabled (for example, in the Firebase console)
       'ERROR_TOO_MANY_REQUESTS':'Demasiados intentos...,contacte con nuestro servicio de atención al cliente.',//If there was too many attempts to sign in as this user.
       'ERROR_OPERATION_NOT_ALLOWED':'Email y Password no existen  o no existen en nuestra base de datos, contacte con nuestro servicio de atención al cliente.',//Indicates that Email & Password accounts are not enabled.
    };
}