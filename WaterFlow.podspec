

Pod::Spec.new do |s|

  s.name         = "WaterFlow"
  s.version      = "0.0.1"
  s.summary      = "A short description of WaterFlow."
  s.homepage     = "http://github.com/KaiserFighting/WaterFlow"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "caesar" => “18192504529@163.com” }
  s.platform     = :ios, “8.0”
  s.ios.deployment_target = "5.0"
  s.source       = { :git => "http://github.com/KaiserFighting/WaterFlow.git"}
  s.source_files  = "WaterFlow", "WaterFlow/*.{h}"
  s.public_header_files = "WaterFlow/*.h"
  s.requires_arc = true


end
