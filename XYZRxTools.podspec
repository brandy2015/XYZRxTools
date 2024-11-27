Pod::Spec.new do |s|
  s.name         = "XYZRxTools"
  s.version      = "1.1.1"
  s.summary      = "持续升级"
  s.description  = "简洁调用一些方法"
  s.homepage     = "https://github.com/brandy2015/XYZRxTools"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Brandy" => "zhangqianbrandy2012@gmail.com" }
  s.swift_version = "5.0"
  s.ios.deployment_target = "15.0"
  s.platform     = :ios, "15.0"
  s.source       = { :git => "https://github.com/brandy2015/XYZRxTools.git", :tag => "1.1.1" }
  #s.source_files = "XYZRxTools/Source/*"
  
  s.source_files = "XYZRxTools/Source/**/*.{swift}"


  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'RxDataSources'
  s.dependency 'XYZColor'
  s.dependency 'MJRefresh'
end
