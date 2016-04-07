Pod::Spec.new do |spec|
  spec.name             = "SwiftExceptionCatcher"
  spec.module_name      = 'SwiftExceptionCatcher'
  spec.version          = "1.0"
  spec.summary          = "Catch NSException with Swift"
  spec.homepage         = "https://github.com/RedRoma/SwiftExceptionCatcher"
  spec.license          = "Code is Licensed under Apache 2.0"
  spec.author           = { "SirWellington" => "wellington@redroma.tech" }
  spec.source           =
  {
       :git => "https://github.com/RedRoma/SwiftExceptionCatcher.git",
       :branch => "develop"
  }
  spec.source_files = "SwiftExceptionCatcher/SwiftExceptionCatcher/*.{h,m,swift}"
  # spec.resources = 'Pod/Assets/*'

  spec.platform     = :ios, '8.0', :osx, '10.8'
  spec.requires_arc = false
end
