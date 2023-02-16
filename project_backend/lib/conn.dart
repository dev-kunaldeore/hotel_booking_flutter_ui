import 'package:postgres/postgres.dart';

 Future<PostgreSQLConnection> openConnection() async {
  var connection = PostgreSQLConnection("localhost", 9090, "demo_db",
      username: "postgres", password: "root");
  await connection.open();
  return connection;
}
