import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';

import '../ui/input_decorations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(

            // agrega un scrooll si sus hijos sobrepasa a los bordes
            // tambíen se puede usar un list view
            child: SingleChildScrollView(
      child: Column(
        children: [
          //
          SizedBox(height: 250),

          CardContainer(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 30,
                ),
                _LoginForm()
              ],
            ),
          ),

          SizedBox(height: 50),
          Text(
            'Crear una nueva cuenta',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        // TODO: mantener la referencia al key
        // estado de referencia
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'losajhonny@gmail.com',
                  labelText: 'Correo',
                  prefixIcon: Icons.alternate_email_sharp),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*********',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline_sharp),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
                child: Text(
                  'Ingresar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                // TODO: LOGIN FORM
              },
            ),
          ],
        ),
      ),
    );
  }
}
