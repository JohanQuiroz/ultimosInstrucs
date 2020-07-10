import 'package:aplica04/models/EmpleadoModel.dart';
import 'package:aplica04/providers/EmpleadoProvider.dart';
import 'package:aplica04/utils/dateTimePicker.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

class EmpleadoPage extends StatefulWidget {
  @override
  
  _EmpleadoPageState createState() => _EmpleadoPageState();
}


class _EmpleadoPageState extends State<EmpleadoPage> {

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final empleadoProvider = new EmpleadoProvider();
  EmpleadoModel empleado =  new EmpleadoModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Empleado'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), 
          onPressed: (){
            Navigator.pop(context);
          }
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearApellidos(),
                _crearCorreo(),
                _crearCalendario(),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
      
    );
  }

  Widget _crearNombre(){
    return TextFormField(
      initialValue: empleado.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombres'),
      onSaved: (value) => empleado.nombre = value,
      validator: (value) {
        if(value.length < 3)
          return 'Ingrese el nombre del empleado';
        else
          return null;
      },
    );
  }

  Widget _crearApellidos(){
    return TextFormField(
      initialValue: empleado.apellidos,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellidos'),
      onSaved: (value) => empleado.apellidos = value,
      validator: (value) {
        if(value.length < 3)
          return 'Ingrese los apellidos del empleado';
        else
          return null;
      },
    );
  }

  Widget _crearCorreo(){
    return TextFormField(
      initialValue: empleado.email,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Correo'),
      onSaved: (value) => empleado.email = value,
      validator: (value) {
        if(value.length < 3)
          return 'Ingrese el correo del empleado';
        else
          return null;
      },
    );
  }

  Widget _crearCalendario(){
    final format = DateFormat('yyyy-MM-dd');
    return Column(
      children: <Widget>[
        DateTimeField(
          decoration: InputDecoration(labelText: 'Fecha'),
          format: format,
          onSaved: (value) => empleado.createAt = formatDate(value, [yyyy, '-', mm, '-', dd]).toString(),
          onShowPicker: (context, currentValue){
            return showDatePicker(
              context: context,               
              firstDate: DateTime(1900) , 
              initialDate: currentValue ?? DateTime.now(), 
              lastDate: DateTime(2100)
            );
          }
        )
      ],
    );
  }

  Widget _crearBoton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save), 
      onPressed: _submit,             
    );
  }


  void _submit() async{
    if(!formKey.currentState.validate()) return;
    formKey.currentState.save();

    if(empleado.id == null){
      empleadoProvider.crearEmpleado(empleado).then((rpta){
        print('RPTA: ${rpta}');
      });      
    }
    else{

    }
    setState(() {
      
    });
    Navigator.pushReplacementNamed(context, 'home');
  }

}