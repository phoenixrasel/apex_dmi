import '../callbacks/callbacks.dart';
import '../services/api_service.dart';

abstract class ApiProviders implements CallBack {
  @override
  Future<dynamic> commonApiCall(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map}) async {
    ///----- updated by rasel
    ///------Adding some value to recieved map
    Map<String, dynamic> finalMap = map;
    // finalMap['version_code'] =
    //     await PackageInfo.fromPlatform().then((value) => value.buildNumber);
    // finalMap['device_id'] = Pref.readData(key: Pref.DEVICE_UNIQUE).toString();
    // finalMap['current_os'] = Platform.isAndroid ? 'android' : 'ios';
    // finalMap['app_name'] = PackageInfo.fromPlatform().then((value) => value.appName);

    // if (Pref.readData(key: Pref.SESSION) != null)
    //   finalMap['user_id'] =
    //       Pref.readData(key: Pref.SESSION)['user_id'].toString();

    /// ---- @end
    return await ApiService().request(endPoint, method, finalMap);
  }

  @override
  Future<dynamic> tokenBaseApi(
      {required String endPoint,
      required Method method,
      required Map<String, dynamic> map}) async {
    ///------ updated by rasel
    ///Adding some value in recieved map
    Map<String, dynamic> finalMap = map;
    // finalMap['version_code'] =
    //     await PackageInfo.fromPlatform().then((value) => value.buildNumber);
    // finalMap['device_id'] = Pref.readData(key: Pref.DEVICE_UNIQUE).toString();
    // finalMap['current_os'] = Platform.isAndroid ? 'android' : 'ios';
    // finalMap['app_name'] = PackageInfo.fromPlatform().then((value) => value.appName);
    // if (Pref.readData(key: Pref.SESSION) != null)
    //   finalMap['user_id'] =
    //       Pref.readData(key: Pref.SESSION)['user_id'].toString();

    ///-- @end
    return await ApiService(
            // token: Pref.readData(key: Pref.SESSION)['access_token'])
            )
        .request(endPoint, method, finalMap);
  }
}
