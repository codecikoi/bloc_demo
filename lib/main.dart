import 'package:bloc_demo/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ColorBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Using flutter_bloc'),
        backgroundColor: Colors.indigo[300],
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: currentColor,
            height: 130,
            width: 130,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => bloc.add(RedColorEvent()),
            backgroundColor: Colors.red,
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () => bloc.add(GreenColorEvent()),
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
