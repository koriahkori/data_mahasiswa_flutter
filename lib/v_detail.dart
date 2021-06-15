import 'package:data_mahasiswa/v_edit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailData extends StatefulWidget {
  List list;

  int index;

  DetailData({this.index, this.list});

  @override
  _DetailDataState createState() => new _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  void deleteData() {
    var url = "http://192.168.0.102/api_mahasiswa/delete.php";

    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Apakah akan menghapus data ${widget.list[widget.index]['nama']} ?"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Batal", style: new TextStyle(color: Colors.black)),
          color: Colors.grey,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        new RaisedButton(
          child: new Text(
            "Ya",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.blue,
          onPressed: () {
            deleteData();

            Navigator.pushReplacementNamed(context, '/Home');
          },
        ),
      ],
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar:
            new AppBar(title: new Text("${widget.list[widget.index]['nama']}")),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ListView(
            children: [
              Text(
                "NIM : ${widget.list[widget.index]['nim']}",
                style: new TextStyle(fontSize: 20.0),
              ),
              Text(
                "Nama : ${widget.list[widget.index]['nama']}",
                style: new TextStyle(fontSize: 20.0),
              ),
              Text(
                "Jenis Kelamin : ${widget.list[widget.index]['jenis_kelamin']}",
                style: new TextStyle(fontSize: 20.0),
              ),
              Text(
                "Jurusan : ${widget.list[widget.index]['jurusan']}",
                style: new TextStyle(fontSize: 20.0),
              ),
              Text(
                "Alamat : ${widget.list[widget.index]['alamat']}",
                style: new TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                width: 50,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text("EDIT"),
                    color: Colors.blue,
                    onPressed: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new EditData(
                        list: widget.list,
                        index: widget.index,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  new RaisedButton(
                    child: new Text("HAPUS"),
                    color: Colors.grey,
                    onPressed: () => confirm(),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
