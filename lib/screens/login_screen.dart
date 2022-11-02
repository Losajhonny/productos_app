import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_form_provider.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
          const SizedBox(height: 250),

          CardContainer(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text('Login', style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 30),

                // solo en este scope puedo utilizar login form provider
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: const _LoginForm(),
                )
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Text('Crear una nueva cuenta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // la referencia al key
        key: loginForm.formKey,
        // estado de referencia

        // si pasaron todas las validaciones
        child: Column(
          children: [
            InputEmail(loginForm),
            const SizedBox(height: 30),
            InputPassword(loginForm),
            const SizedBox(height: 30),
            AcceptedButton(loginForm, context),
          ],
        ),
      ),
    );
  }

  TextFormField InputEmail(LoginFormProvider loginForm) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecorations.authInputDecoration(
          hintText: 'losajhonny@gmail.com',
          labelText: 'Correo',
          prefixIcon: Icons.alternate_email_sharp),
      onChanged: (value) => loginForm.email = value,
      validator: (value) {
        String pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

        RegExp regExp = RegExp(pattern);

        return regExp.hasMatch(value ?? '')
            ? null
            : 'El correco no tiene formato correcto';
      },
    );
  }

  TextFormField InputPassword(LoginFormProvider loginForm) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecorations.authInputDecoration(
          hintText: '*********',
          labelText: 'Contraseña',
          prefixIcon: Icons.lock_outline_sharp),
      onChanged: (value) => loginForm.password = value,
      validator: (value) {
        if (value != null && value.length >= 6) return null;
        return 'La contraseña debe ser de 6 caractreres';
      },
    );
  }

  MaterialButton AcceptedButton(
      LoginFormProvider loginForm, BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      disabledColor: Colors.grey,
      elevation: 0,
      color: Colors.deepPurple,
      onPressed: loginForm.isLoading
          ? null
          : () async {
              // quitar el teclado
              FocusScope.of(context).unfocus();

              if (!loginForm.isValidForm()) return;
              loginForm.isLoading = true;
              // Navigator.pushReplacementNamed(context, 'home');
            },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 15,
        ),
        child: Text(
          loginForm.isLoading ? 'Espere' : 'Ingresar',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
