// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_renaming_method_parameters, unnecessary_import, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: appModule(), child: appWidget()));
}


class appModule extends Module {
  @override
  void binds(injection) {}

  @override
  void routes(routes) {
    routes.child("/", child: (_) => HomePage());
    routes.child("/segunda_pagina", child: (_) => SecondPage());
  }
}

class appWidget extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp.router(
      title: "Flutter Modular",
      routerConfig: Modular.routerConfig,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Navigator to 'dream'"),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Modular.to.navigate('/'),
          child: Text('Back to Home'),
        ),
      ),
    );
  }
}
