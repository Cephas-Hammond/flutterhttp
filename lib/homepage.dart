import 'package:flutter/material.dart';
import 'package:httprequest/books.dart';
import 'package:httprequest/login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final TextEditingController _controller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  // Future<Book>? _futureBook;
  Future<Login>? _futureLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child:
            (_futureLogin == null) ? buildInput() : buildLoginFutureBuilder(),
      ),
    );
  }

  // Column buildColumn() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       TextField(
  //         controller: _controller,
  //         decoration: const InputDecoration(hintText: 'Enter Title'),
  //       ),
  //       ElevatedButton(
  //         onPressed: () {
  //           setState(() {
  //             _futureBook = createBook(_controller.text);
  //           });
  //         },
  //         child: const Text('Create Data'),
  //       ),
  //     ],
  //   );
  // }

  // FutureBuilder<Book> buildFutureBuilder() {
  //   return FutureBuilder<Book>(
  //     future: _futureBook,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return Column(
  //           children: [
  //             Text(snapshot.data!.title),
  //           ],
  //         );
  //       } else if (snapshot.hasError) {
  //         return Text('${snapshot.error}');
  //       }

  //       return const CircularProgressIndicator();
  //     },
  //   );
  // }

  FutureBuilder<Login> buildLoginFutureBuilder() {
    return FutureBuilder<Login>(
      future: _futureLogin,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Column(
                  children: [
                    const Text('Success'),
                    Text(
                      snapshot.data!.success.toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20.0),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Column(
                  children: [
                    const Text('Status'),
                    Text(
                      snapshot.data!.status.toString(),
                      style: const TextStyle(
                          fontSize: 20, color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20.0),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Column(
                  children: [
                    const Text('Message'),
                    Text(
                      snapshot.data!.message.toString(),
                      style: const TextStyle(
                          fontSize: 20, color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  Column buildInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _emailcontroller,
          decoration: const InputDecoration(hintText: 'Enter email'),
        ),
        TextField(
          controller: _passwordcontroller,
          decoration: const InputDecoration(hintText: 'Enter password'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureLogin = login(_emailcontroller.text.toString(),
                  _passwordcontroller.text.toString());
            });
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
