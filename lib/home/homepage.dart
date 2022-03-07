import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

// ignore: camel_case_types
class liste_verte extends StatefulWidget {
  const liste_verte({Key? key}) : super(key: key);

  @override
  _liste_verteState createState() => _liste_verteState();
}

class posts {
  String name_age;
  String fever;
  String cough;
  String chills;
  String heart_breath;
  String covid_test;

  posts(this.name_age, this.fever, this.cough, this.chills, this.heart_breath,
      this.covid_test);
}

// ignore: camel_case_types
class _liste_verteState extends State<liste_verte> {
  List<posts> data = [];

  Future showAllPost() async {
    var url = 'http://192.168.0.5/get.php';

    http.Response response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body.toString()) as List<dynamic>;
    for (var element in data) {
      return this.data.add(posts(
          element['name_age'] as String,
          element['fever'] as String,
          element['cough'] as String,
          element['chills'] as String,
          element['heart_breath'] as String,
          element['covid_test'] as String));
    }
    print(this.data[0].covid_test);
    return this.data;
  }

  @override
  void initState() {
    showAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Welcome Doctor'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => liste_verteState()));
          },
          icon: const Icon(Icons.square_foot_rounded),
          label: const Text("see statistics "),
        ),
        body: FutureBuilder(
            future: showAllPost(),
            builder: (context, AsyncSnapshot snapshot) {
              return Container(
                  child: ListView.builder(
                      itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Text(
                            ' nameage:${this.data[0].name_age} \n fever :${this.data[0].fever} /n cough:${this.data[0].cough} \n chills :${this.data[0].chills} /n heart_brath:${this.data[0].heart_breath} \n covid_test :${this.data[0].covid_test}');
                      }));
            }));
  }
}

// ignore: non_constant_identifier_names
liste_verteState() {}
/*class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class Item {
  String id;
  String nameage;
  String symptomes;
  Item(this.id, this.nameage, this.symptomes);
}


class _HomepageState extends State<Homepage> {
  List<Item> data = [];

  Future getData() async {
    var url = "http://192.168.43.243/doctor/get.php";
    var result = await http.get(Uri.parse(url));
    setState(() {
      var jsonItems = jsonDecode(result.body.toString()) as List<dynamic>;
      jsonItems.forEach((item) {
        var data2 = data;
        data2.add(Item(item['id'] as String, item['nameage'] as String,
            item['symptomes'] as String));
        print(this.data.toString());
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
   Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            "../images/st.png",
            fit: BoxFit.fill,
            height: 80,
            width: 80,
          ),
        ),
        Expanded(
          flex: 2,
          child: ListTile(
            title: Text("nameage"),
            subtitle: Text("${this.data[0].nameage}"),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
        )
      ],
    ));
  }

  /*List notes = [
    {"note": "Lorem 1syw syw", '../images': "st.png"},
    {"note": "Lorem 2syw syw", 'images': "st.png"},
    {"note": "Lorem 3syw syw", "../images": "st.png"},
    {"note": "Lorem 4syw syw", 'images': "st.png"},
  ];*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Doctor'),
      ),

      /*floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("addnotes");
          },
        ),
        // ignore: avoid_unnecessary_containers
        body: 
        Container(
          child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, i) {
                return Dismissible(
                    key: Key("$i"),
                    child: ListNotes(
                      notes: notes[i],
                    ));
              }),
        )*/
    );
  }

  /*@override
  void initState() {
    getData();
  }*/

/*class ListNotes extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final notes;
  // ignore: use_key_in_widget_constructors
  const ListNotes({this.notes});
  @override*/
  /*Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            "../images/st.png",
            fit: BoxFit.fill,
            height: 80,
            width: 80,
          ),
        ),
        Expanded(
          flex: 2,
          child: ListTile(
            title: const Text("Nom User"),
            subtitle: Text("${this.data[0].nameage}"),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
        )
      ],
    ));
  }
}*/

  /* return Future.sync(()  {
     var url = 'http://doctorconsultation.000webhostapp.com/get.php';
    // ignore: unused_local_variable
    http.Response response = await http.get(Uri.parse(url);
    var data = jsonDecode(response.body);
    print(data.toString());
  );*/

}*/
