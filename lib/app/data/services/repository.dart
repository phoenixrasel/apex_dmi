import '../apis/api_endpoint.dart';
import '../providers/api_provider.dart';
import 'api_service.dart';

class Repository extends ApiProviders {
  /**
   * Request company list repository as => [requestCompanyList]
   * Submit company list repository as => [submitCompanyList]
   */
  Future<dynamic> requestCompanyList() async => await commonApiCall(
      endPoint: ApiEP.COMPANY_EP,
      method: Method.GET,
      map: {}).then((value) => value);

  Future<dynamic> submitCompanyList(
          {required Map<String, dynamic> body}) async =>
      await commonApiCall(
              endPoint: ApiEP.COMPANY_EP, method: Method.POST, map: body)
          .then((value) => value);
}
