import 'dart:async';

import 'package:aplica04/bloc/validar.dart';
import 'package:rxdart/rxdart.dart';
 
class LoginBloc with Validar{
  //StreamController cada vez que el usuario teclee
  //pasa por StreamController
  //ANTES
  //final _emailController = StreamController<String>.broadcast();
  //final _claveController = StreamController<String>.broadcast();
  //DESPUES
  final _emailController = BehaviorSubject<String>();
  final _claveController = BehaviorSubject<String>();

  //getters: Recuperar valores
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get claveStream => _claveController.stream.transform(validarClave);

  Stream<bool> get formValidStream => CombineLatestStream.combine2(emailStream, claveStream, (e, p) => true);

  String get correo => _emailController.value;
  String get clave => _claveController.value;


  //setters: Insertar valores
  Function(String) get changeEmail => _emailController.sink.add;
  //para obtener los cambios de correo como getter
  Function(String) get changeClave => _claveController.sink.add;
  //para obtener los cambios de clave como getter

  dispose(){ //metodo de cierre de los controller
    _emailController?.close();
    _claveController?.close();
  }
  
}