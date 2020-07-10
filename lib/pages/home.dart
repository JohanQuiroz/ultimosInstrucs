import 'package:aplica04/bloc/provider.dart';
import 'package:aplica04/models/EmpleadoModel.dart';
import 'package:aplica04/providers/EmpleadoProvider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final empleadoProvider = new EmpleadoProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _crearListado(),
      floatingActionButton: _cargarInterfazEmpleado(context) ,
    );
    
  }

  _cargarInterfazEmpleado(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'empleado'),
    );
  }

  Widget _crearListado(){
    return FutureBuilder(
      future: empleadoProvider.cargarEmpleados(),
      builder: (BuildContext context, AsyncSnapshot<List<EmpleadoModel>> snapshot){
        if(snapshot.hasData){
          final empleados = snapshot.data;
          return ListView.builder(
            itemCount: empleados.length,
            itemBuilder: (context, i) => _crearItem(context, empleados[i]),
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, EmpleadoModel empleado){
    return Dismissible(      
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ), 
      onDismissed: ( x ){        
      },
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('${empleado.apellidos} - ${empleado.nombre}'),
              subtitle: Text(empleado.id.toString()),
              onTap: () => Navigator.pushNamed(context, 'empleado', arguments: empleado),
            )
          ],
        ),
      )
    );
  }

}