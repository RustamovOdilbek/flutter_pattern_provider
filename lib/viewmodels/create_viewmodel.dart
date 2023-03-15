
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:patterns_provider/model/post_model.dart';

import '../service/http_service.dart';
import '../service/log_service.dart';

class CreateViewModel extends ChangeNotifier{
  bool isLoading = false;

  Future createPost(String title, String body, BuildContext context)async{

    var post = Post(1, title, body, 1001);

    isLoading = true;
    notifyListeners();

    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {
      LogService.i(response.toString()),
      Navigator.pop(context)
    });
  }

}