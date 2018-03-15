library example.body.json;

import 'dart:async';
import 'package:jaguar/jaguar.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';

import '../../common/models/book/book.dart';

final book = new Book.make('0', 'Book1', ['Author1', 'Author2']);

@Api(path: '/api/book')
class BooksApi {
  @Post()
  Response<String> addBook(Context ctx) {
    // Encode Map to JSON
    return Response.json(book.toMap());
  }
}

Future<Null> main(List<String> args) async {
  Jaguar jaguar = new Jaguar(port: 10000);
  jaguar.addApi(reflect(new BooksApi()));

  await jaguar.serve();
}
