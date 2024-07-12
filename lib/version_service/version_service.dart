import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version_check/api_service/api_service.dart';
import 'package:version_check/version_service/model/version_model.dart';
import 'package:version_check/version_service/view/version_change.dart';

class VersionService extends GetxService {
  final _apiService = Get.find<ApiService>();
  Timer? timer;
  late final String currentVersion;
  VersionModel? versionModel;
  @override
  Future<void> onInit() async {
    final packageInfo = await PackageInfo.fromPlatform();
    print("VersionService.onInit()");
    print(packageInfo.version);
    currentVersion = packageInfo.version;
    versionChecker();
    super.onInit();
  }

  void versionChecker() {
    print("VersionService.versionChecker()");
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      print("checking new version");
      _apiService
          .request("/", HttpMethod.GET, showLoader: false)
          .then((response) {
        versionModel = VersionModel.fromJson(jsonDecode(response.body));
        print(versionModel!.version);
        checkForNewVersion();
      });
    });
  }

  void checkForNewVersion() {
    print("VersionService.checkForNewVersion()");
    if (versionModel?.version != currentVersion) {
      print("Stoping Timer");
      _showUpdateDialog(versionModel!.version);
      timer!.cancel();
    }
  }

  void _showUpdateDialog(String newVersion) {
    Get.dialog(const VersionChange());
  }
}
