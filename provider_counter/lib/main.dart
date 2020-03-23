import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/api_client.dart';
import 'package:provider_counter/counter_notifier.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterNotifier()),
        Provider(create: (_) => ApiClient()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("MyHomePage was rebuilt!");
    final CounterNotifier counterNotifier =
        Provider.of<CounterNotifier>(context, listen: false);
    final ApiClient apiClient = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("${apiClient.getNames()}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterNotifier>(
              builder: (_, CounterNotifier value, __) {
                return Text(
                  '${value.counter}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final int currentCounter = counterNotifier.counter + 1;
          counterNotifier.updateCounter(currentCounter);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
