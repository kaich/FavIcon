Pod::Spec.new do |s|
  s.name             = 'FavIcon'
  s.version          = '3.0.6'
  s.summary          = 'A library for downloading website icons'
  s.homepage         = 'https://github.com/leonbreedt/FavIcon'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.author           = { 'Leon Breedt' => 'leon@sector42.io' }

  s.source           = {
    :git => "https://github.com/leonbreedt/FavIcon.git",
    :tag => "#{s.version}"
  }

  s.source_files     = 'Sources/**/*.swift'
  s.preserve_paths   = 'Sources/Modules/*', 'Support/*.sh'

  s.ios.deployment_target     = "12.0" # 建议稍微调高以适配新版 Xcode
  s.osx.deployment_target     = "10.13"
  s.tvos.deployment_target    = "12.0"
  s.watchos.deployment_target = "4.0"

  s.requires_arc     = true

  # 核心修复：针对 Xcode 16 的环境配置
  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '5.0',
    'SWIFT_WHOLE_MODULE_OPTIMIZATION' => 'YES',
    # 必须指向 SDK 内部的 libxml2
    'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2',
    # 允许在 Module 中引用非模块化头文件（解决 Xcode 16 报错的关键）
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    # 确保自定义 Module Map 能被找到
    'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/Sources/Modules',
    # Xcode 16 额外需要的配置
    'CLANG_ENABLE_MODULES' => 'YES',
    'DEFINES_MODULE' => 'YES'
  }

  s.xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2',
    'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/Sources/Modules',
    # 确保链接器能找到 libxml2
    'OTHER_LDFLAGS' => '-lxml2'
  }

  # 显式链接系统库
  s.libraries = 'xml2'

end
