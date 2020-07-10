import 'package:aplica04/bloc/provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          aperturaFondo(context),
          loginForm(context)
        ],
      ),
    );
  }

  Widget loginForm(BuildContext context){
    final bloc = Provider.of(context); // Ahora puede ser ubicado

    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 220,
            )
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 5),
                  spreadRadius: 3.0
                ),
              ]
            ),
            child: Column(
              children: <Widget>[
                Text('Ingreso'),
                SizedBox(height: 50,),
                objetoCorreo(bloc),
                SizedBox(height: 20,),
                objetoClave(bloc),
                SizedBox(height: 20,),
                objetoBoton(bloc)
              ],
            ),
          ),
          Text('¿Olvidó la contraseña?'),
          SizedBox(height: 100,)
        ],
      ),
    );
  }

  Widget objetoCorreo(LoginBloc bloc){
    TextEditingController gestorText = TextEditingController()..text = 'johanqgr@gmail.com';
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        ////////////////////////////////////////////////////////////
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: gestorText,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.alternate_email,
                color: Colors.deepPurple,
              ),
              hintText: 'correo@correo.com',
              labelText: 'Correo',
              //counterText: snapshot.data //capta datos y mostramos en el contador de textos
              errorText: snapshot.error
            ),
            onChanged: bloc.changeEmail, //es para captar cambios
          ),
        );
        ////////////////////////////////////////////////////////////
      }
    );
  }

  Widget objetoClave(LoginBloc bloc){
    TextEditingController gestorClave = TextEditingController()..text = '12345678';
    return StreamBuilder(
      stream: bloc.claveStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        ////////////////////////////////////////////////////////////
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(      
            controller: gestorClave,
            obscureText: true,  
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock_outline,
                color: Colors.deepPurple,
              ),          
              labelText: 'Contraseña',
              errorText: snapshot.error
            ),
            onChanged: bloc.changeClave,
          ),
          
        );
        ////////////////////////////////////////////////////////////
      }
    );
    
  }

  Widget objetoBoton(LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: Text('Ingresar',
              style: TextStyle(fontSize: 15),
            )
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          elevation: 1,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? ()=> _login(bloc, context)  : null,
        );
      },
    );        
  }

  _login(LoginBloc bloc, BuildContext context){
    print(bloc.correo);
    print(bloc.clave);
    Navigator.pushReplacementNamed(context, 'home');
  }


  Widget aperturaFondo(BuildContext context){
    final size = MediaQuery.of(context).size;
    final fondo01 = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [            
            Colors.green[300],
            Colors.green
          ]
        )
      ),
    );

    final adorno = Container(
      width: 80, height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );


    return Stack(
      children: <Widget>[
        fondo01,
        Positioned(top: 90, left: 30, child: adorno,),
        Positioned(top: -40, left: -10, child: adorno,),
        Positioned(left: 150, bottom: 30, child: adorno,),
        Positioned(left: 150, top: 30, child: adorno,),
        Positioned(right: 5, top: 100, child: adorno,),
        Container(
          padding: EdgeInsets.only(top: 80),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin, color: Colors.white, size: 100,),
              SizedBox(height: 10, width: double.infinity,),
              Text('Aplicacion Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),

      ],
    );

  }


}