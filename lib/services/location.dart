import 'package:geolocator/geolocator.dart';

Future<bool> getLocation() async {
  LocationPermission getPrevPermission = await Geolocator.checkPermission();
  if(
      getPrevPermission == LocationPermission.denied ||
      getPrevPermission == LocationPermission.deniedForever ||
      getPrevPermission == LocationPermission.unableToDetermine
  ) {
    LocationPermission permissionReq = await Geolocator.requestPermission();
    if(
    permissionReq == LocationPermission.denied ||
        permissionReq == LocationPermission.deniedForever ||
        permissionReq == LocationPermission.unableToDetermine
    ) {
      return false;
    }
    return true;
  }
  return true;
}