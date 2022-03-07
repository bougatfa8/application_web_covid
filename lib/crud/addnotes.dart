// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Addnotes extends StatefulWidget {
  const Addnotes({Key? key}) : super(key: key);

  @override
  _AddnotesState createState() => _AddnotesState();
}

class _AddnotesState extends State<Addnotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notes'),
      ),
      body: Column(
        children: [
      Form(
          child: Column(children: [
        TextFormField(
          maxLength: 30,
          // ignore: prefer_const_constructors
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: "Title note",
            prefixIcon: const Icon(Icons.note),
          ),
        ),
        TextFormField(
          minLines: 1,
          maxLines: 3,
          maxLength: 200,
          // ignore: prefer_const_constructors
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: " Note",
            prefixIcon: const Icon(Icons.note),
          ),
        ),
        RaisedButton(
          onPressed: () {},
          textColor: Colors.white,
          child: const Text("add image for note"),
        ),
        const SizedBox(height: 20),
        RaisedButton(
          onPressed: () {},
          textColor: Colors.white,
          child: Text("add N Base",
              style: Theme.of(context).textTheme.headline6),
        )
      ]))
        ],
      ),
    );
  }
}

/*showBottom({context, Container Function(dynamic context)? builder}) {
  return showBottom(
      context: context,
      builder: (context) {
        return Container(
          child: Text("show"),
        );
      });
}*/
