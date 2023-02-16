import 'dart:convert';
import 'package:alfred/alfred.dart';
import 'package:postgres/postgres.dart';
import '../conn.dart';
import '../controller/login.dart';

//signup user
void loginRoutes(Alfred app, PostgreSQLConnection connection) {
  app.post('/test', ((req, res) {
    res.send(jsonEncode({
      'status': 'ok',
    }));
  }));
  app.post('/signup', (req, res) async {
    var body = await req.bodyAsJsonMap;
    var username = body['username'];
    var email = body['email'];
    var password = body['password'];
    // check email is exsist or not
    List<Map> checkEmail = await connection.mappedResultsQuery(
      "SELECT * FROM users WHERE email=@email ",
      substitutionValues: <String, dynamic>{'email': email},
    );
    if (checkEmail.isNotEmpty && checkEmail[0]['users']['email'] == email) {
      res.send(jsonEncode({
        'status': 'Not Ok',
        'message': 'Email is already exsit',
      }));
    } else {
      var query = await connection.query(
          "INSERT INTO users (username,email,password,status) VALUES (@username, @email, @password,'Active') ",
          substitutionValues: <String, dynamic>{
            'username': username,
            'email': email,
            'password': password,
          });
      var result = await login(status: 'Ok', message: 'user created');
      res.send(jsonEncode(result));
    }
  });
  //delete data of a perticular id
  app.delete('/delete/:id:int', ((req, res) async {
    var id = req.params['id'];
    List<Map> results = await connection.mappedResultsQuery(
        "SELECT * FROM users WHERE id=@id",
        substitutionValues: <String, dynamic>{'id': id});

    if (results.isNotEmpty && results[0]['users']['id'] == id) {
      await connection.query("DELETE FROM users WHERE id=@id",
          substitutionValues: <String, dynamic>{'id': id});
      res.send(jsonEncode({
        'status': 'ok',
        'mesage': 'user deleted',
      }));
    } else {
      res.send(jsonEncode({
        'status': 'Not ok',
        'message': 'Id not found',
      }));
    }
  }));
  //get all data
  app.get('/getdata', ((req, res) async {
    List<Map> results = await connection
        .mappedResultsQuery("SELECT username,email,status FROM users ");
    // print(results[0][0]);
    res.send(jsonEncode(results));
  }));
//get the data of a perticular user
  app.get('/getuserdata/:id:int', ((req, res) async {
    var id = req.params['id'];

    //chech id present or not in a database
    List<Map> query = await connection.mappedResultsQuery(
        "SELECT * FROM users WHERE id=@id",
        substitutionValues: <String, dynamic>{
          'id': id,
        });
    // print(query[0]['users']['id']);

    if (query.isNotEmpty && query[0]['users']['id'] == id) {
      //get data
      List<Map> userdata = await connection.mappedResultsQuery(
          "SELECT * FROM users WHERE id=@id",
          substitutionValues: <String, dynamic>{
            'id': id,
          });

      if (userdata.isNotEmpty) {
        res.send(jsonEncode(userdata));
      } else {
        res.send(jsonEncode({
          'error': 'error',
        }));
      }
    } else {
      res.send(jsonEncode({'status': 'ok', 'message': 'id not found'}));
    }
  }));
  //delte all data
  app.delete('/deletedata', ((req, res) async {
    var results = await connection.query("DELETE FROM USERS");
    res.send(jsonEncode({
      "status": "ok",
    }));
  }));
  //authenticate user
  app.post('/login', ((req, res) async {
    var body = await req.bodyAsJsonMap;
    var email = body['email'];
    var password = body['password'];
    if (email != "" && password != "") {
      List<Map> query = await connection.mappedResultsQuery(
          "SELECT * FROM users WHERE email=@email AND password=@password ",
          substitutionValues: <String, dynamic>{
            'email': email,
            'password': password
          });
      if (query.isNotEmpty) {
        res.send(jsonEncode({
          'status': 'ok',
          'message': 'found',
        }));
      } else {
        res.send(jsonEncode({
          'status': 'not ok',
          'message': 'not found',
        }));
      }
    } else {
      res.send(jsonEncode({
        'status': 'not ok',
        'message': 'data is empty',
      }));
    }
  }));
}
