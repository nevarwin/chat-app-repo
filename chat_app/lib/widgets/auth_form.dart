import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(
    String email,
    String username,
    String password,
    bool isLogin,
  ) submitFn;

  AuthForm(this.submitFn);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  // onSaved variables
  var userEmail = '';
  var userName = '';
  var userPassword = '';
  var isLogin = true;

  final _formKey = GlobalKey<FormState>();

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    // unfocusing the keyboard
    FocusScope.of(context).unfocus();

    if (isValid) {
      // to trigger the onSaved in textforms
      _formKey.currentState!.save();

      // passing in the data to the submitFn function
      widget.submitFn(
        userEmail,
        userName,
        userPassword,
        isLogin,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Email
                  TextFormField(
                    key: const ValueKey('email'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userEmail = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),

                  // Username
                  // Username will be conditional if the user is in login mode
                  if (isLogin)
                    TextFormField(
                      // adding key for the if statement
                      key: const ValueKey('username'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return 'Username must be at least 4 characters';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userName = value!;
                      },
                      decoration: const InputDecoration(labelText: 'Username'),
                    ),

                  // Password
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'Username must be at least 7 characters';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userPassword = value!;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(height: 12),

                  // Login Button
                  RaisedButton(
                    onPressed: _trySubmit,
                    child: Text(
                      isLogin ? 'Login' : 'Signup',
                    ),
                  ),

                  // Signup Button
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                      isLogin
                          ? 'Create new account'
                          : 'Already have an account',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
