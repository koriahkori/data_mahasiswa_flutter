import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerNIM;
  TextEditingController controllerNama;
  TextEditingController controllerJenisKelamin;
  TextEditingController controllerJurusan;
  TextEditingController controllerAlamat;

  void editData() {
    var url = "http://192.168.0.102/api_mahasiswa/edit.php";

    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      "nim": controllerNIM.text,
      "nama": controllerNama.text,
      "jenis_kelamin": controllerJenisKelamin.text,
      "jurusan": controllerJurusan.text,
      "alamat": controllerAlamat.text,
    });
  }

  @override
  void initState() {
    controllerNIM =
        new TextEditingController(text: widget.list[widget.index]['nim']);
    controllerNama =
        new TextEditingController(text: widget.list[widget.index]['nama']);
    controllerJenisKelamin = new TextEditingController(
        text: widget.list[widget.index]['jenis_kelamin']);
    controllerJurusan =
        new TextEditingController(text: widget.list[widget.index]['jurusan']);
    controllerAlamat =
        new TextEditingController(text: widget.list[widget.index]['alamat']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNIM,
                  decoration:
                      new InputDecoration(hintText: "NIM", labelText: "NIM"),
                ),
                new TextField(
                  controller: controllerNama,
                  decoration:
                      new InputDecoration(hintText: "Nama", labelText: "Nama"),
                ),
                new TextField(
                  controller: controllerJenisKelamin,
                  decoration: new InputDecoration(
                      hintText: "Jenis Kelamin", labelText: "Jenis Kelamin"),
                ),
                new TextField(
                  controller: controllerJurusan,
                  decoration: new InputDecoration(
                      hintText: "Jurusan", labelText: "Jurusan"),
                ),
                new TextField(
                  controller: controllerAlamat,
                  decoration: new InputDecoration(
                      hintText: "Alamat", labelText: "Alamat"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Edit"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.pushReplacementNamed(context, '/Home');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
