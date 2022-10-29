import 'package:flutter/material.dart';
import 'color_stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using Stream'),
        backgroundColor: Colors.indigo[300],
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
            stream: _bloc.outputStateStream,
            initialData: Colors.red,
            builder: (context, AsyncSnapshot<Color> snapshot) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                color: snapshot.data,
                height: 130,
                width: 130,
              );
            }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _bloc.inputEventSink.add(ColorEvent.eventRed),
            backgroundColor: Colors.red,
          ),
          SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () => _bloc.inputEventSink.add(ColorEvent.eventGreen),
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
