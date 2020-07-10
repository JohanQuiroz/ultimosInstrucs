import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:aplica04/models/EmpleadoModel.dart';

class EmpleadoProvider{
  final String _url = 'http://10.0.2.2:3000/empleados';

  Future<List<EmpleadoModel>> cargarEmpleados() async{
    final List<EmpleadoModel> empls = [];
    final url = '$_url';
    final resp = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept" : "application/json"}
    );

    if(jsonDecode(resp.body) != null){
      final d = jsonDecode(resp.body);
      for(Map i in d){
        empls.add(EmpleadoModel.fromJson(i));
        print(empls);
      }
    }
    return empls;

  }

  Future<bool> crearEmpleado(EmpleadoModel empleado) async{
      Map data = {
        "id": 6,
        "nombre": empleado.nombre,
        "apellidos": empleado.apellidos,
        "email": empleado.email,
        "createAt": empleado.createAt
      };
      print(data.toString());
      final resp = await http.post(
        _url,
        body: json.encode(data),
        headers: {'Content-Type' : 'application/json'}
      );

      final decodedData = json.decode(resp.body);
      print('${decodedData}');
      var rpta = EmpleadoModel.fromJson(decodedData);
      if(rpta.id!=null)
        return true;
      else
        return false;
    }


}  
