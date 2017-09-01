

Pod::Spec.new do |s|

  s.name         = "WaterFlow"
  s.version      = “1.1.0”
  s.author       = { "caesar" => “18192504529@163.com” }
  s.summary      = "Simple waterfall flow distribution function."
  s.homepage     = "https://github.com/KaiserFighting/waterFollow"
  s.source       = { :git => "https://github.com/KaiserFighting/waterFollow.git", :tag => s.version }
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.platform     = : ios, “8.0”
  s.requires_arc = true
  s.source_files  = "WaterFlow"
  s.public_header_files = 'WaterFlow/*.h'

  s.ios.deployment_target = "5.0"


end
