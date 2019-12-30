import 'dart:async';import 'package:dio/dio.dart';import 'package:flutter/foundation.dart';import 'package:state_management_app/model/allpost_model.dart';import 'worker/worker.dart';class GetAllPost implements Task<Future<List<AllPost>>> {  final Dio dio;  GetAllPost({@required this.dio});  @override  Future<List<AllPost>> execute() {    return _doExecute();  }  Future<List<AllPost>> _doExecute() async {    var completer = Completer<List<AllPost>>();    try {      Response response = await dio.get(          'https://jsonplaceholder.typicode.com/posts');      print(' DATAAAAAAAAAA ${response.data.toString()}');      List<AllPost> todoModel = List<AllPost>.from((response.data).map((x) => AllPost.fromJson(x)));      print('GetAllPost is DONE result=$todoModel');      completer.complete(todoModel);    } catch (e) {      print('GetAllPost error: $e');      completer.completeError(e);    }    return completer.future;  }}