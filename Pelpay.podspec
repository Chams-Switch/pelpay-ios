Pod::Spec.new do |s|
    s.name             = 'Pelpay'
    s.version          = '0.1.0'
    s.summary          = 'This library will help you accept card and alternative payments in your iOS.'
  
    s.homepage         = 'git@github.com:Chams-Switch/pelpay-ios'
    s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
    s.author           = { 'Pelpay' => 'david3ti@gmail.com' }
    s.source           = { :git => 'git@github.com:Chams-Switch/pelpay-ios.git', :tag => s.version.to_s }
  
    s.ios.deployment_target = '9.0'
    s.swift_version = '5.0'
  
    s.source_files = 'Sources/Pelpay/**/*'
  end