import 'package:flutter_skyway/core/architecture/result.dart';
import 'package:flutter_skyway/data/api/data_source/news.ds.dart';
import 'package:flutter_skyway/domain/entities/user.dart';
import 'package:get/get.dart';

class UserRepository {
  final _dataSource = Get.find<UsersDataSource>();

  Future<Result<List<User>>> getUsers() {
    return Result.guardFuture(() => _dataSource.getUsers().then((s) => s.data));
  }
}
