#
# Generated file, do not edit.
#

Pod::Spec.new do |s|
  s.name             = 'FlutterPluginRegistrant'
  s.version          = '0.0.1'
  s.summary          = 'Registers plugins with your flutter app'
  s.description      = <<-DESC
Depends on all your plugins, and provides a function to register them.
                       DESC
  s.homepage         = 'https://flutter.dev'
  s.license          = { :type => 'BSD' }
  s.author           = { 'Flutter Dev Team' => 'flutter-dev@googlegroups.com' }
  s.ios.deployment_target = '9.0'
  s.source_files =  "Classes", "Classes/**/*.{h,m}"
  s.source           = { :path => '.' }
  s.public_header_files = './Classes/**/*.h'
  s.static_framework    = true
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.dependency 'Flutter'
  s.dependency 'cloud_firestore'
  s.dependency 'cloud_functions'
  s.dependency 'firebase_admob'
  s.dependency 'firebase_analytics'
  s.dependency 'firebase_auth'
  s.dependency 'firebase_core'
  s.dependency 'firebase_crashlytics'
  s.dependency 'firebase_database'
  s.dependency 'firebase_dynamic_links'
  s.dependency 'firebase_in_app_messaging'
  s.dependency 'firebase_messaging'
  s.dependency 'firebase_performance'
  s.dependency 'firebase_remote_config'
  s.dependency 'firebase_storage'
  s.dependency 'flutter_js'
  s.dependency 'shared_preferences'
end
