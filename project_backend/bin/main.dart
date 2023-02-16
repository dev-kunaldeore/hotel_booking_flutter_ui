import 'dart:math';

import 'package:alfred/alfred.dart';
import 'package:postgres/postgres.dart';
import 'package:project_backend/conn.dart';
import 'package:project_backend/routes/user_route.dart';

void main() async {
  final app = Alfred();
  
PostgreSQLConnection connection = await openConnection();
  // app.get('/example', (req, res) => 'Hello world');
  loginRoutes(app,connection);
  await app.listen();
}
