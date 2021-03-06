import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_skyway/data/api/api.services.dart';
import 'package:flutter_skyway/data/api/output/users.output.dart';
import 'package:flutter_skyway/domain/entities/user.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';

part 'news.ds.g.dart';

@RestApi(baseUrl: "https://dummyapi.io/data/v1")
abstract class UsersDataSource {
  factory UsersDataSource() => _UsersDataSource(Get.find<AppDio>());

  @GET("/user")
  @Headers(<String, String>{
    "app-id" : "620c7a743041d2c8fd2136e9"
  })
  Future<GetUsersOutput> getUsers();
}