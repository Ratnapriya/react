Pod::Spec.new do |spec|
  spec.name = 'GLog'
  spec.version = '0.3.4'
  spec.license = { :type => 'Google', :file => 'COPYING' }
  spec.homepage = 'https://github.com/google/glog'
  spec.summary = 'Google logging module'
  spec.authors = 'Google'

  spec.prepare_command = File.read("scripts/ios-configure-glog.sh")
  spec.source = { :git => 'https://github.com/google/glog.git',
                  :tag => "v#{spec.version}" }
  spec.module_name = 'glog'
  spec.header_dir = 'glog'
  spec.source_files = 'Glog/src/glog/*.h',
                      'Glog/src/demangle.cc',
                      'Glog/src/logging.cc',
                      'Glog/src/raw_logging.cc',
                      'Glog/src/signalhandler.cc',
                      'Glog/src/symbolize.cc',
                      'Glog/src/utilities.cc',
                      'Glog/src/vlog_is_on.cc'
  # workaround for https://github.com/facebook/react-native/issues/14326
  spec.preserve_paths = 'src/*.h',
                        'src/base/*.h'
  spec.exclude_files       = "src/windows/**/*"
  spec.libraries           = "stdc++"
  spec.pod_target_xcconfig = { "USE_HEADERMAP" => "NO",
                               "HEADER_SEARCH_PATHS" => "$(PODS_TARGET_SRCROOT)/src" }

  # Pinning to the same version as React.podspec.
  spec.platforms = { :ios => "8.0", :tvos => "9.2" }

end
