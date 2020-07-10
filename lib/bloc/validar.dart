import 'dart:async';

class Validar{
  final validarClave = StreamTransformer<String, String>.fromHandlers(
    handleData: (clave, sink){
      if(clave.length >= 8)
        sink.add(clave);
      else
        sink.addError('Se permite de 8 caracteres a más.');
    }
  );

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(email))
        sink.addError('Correo no valido');
      else
        sink.add(email);
    }
  );

}