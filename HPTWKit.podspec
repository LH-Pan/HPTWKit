Pod::Spec.new do |spec|

  spec.name         = "HPTWKit"
  spec.version      = "1.0.0"
  spec.summary      = "Program Tool"
  spec.homepage     = "https://github.com/LH-Pan/HPTWKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { 'HenryPan' => 'salt918077@gmail.com' }
  spec.source       = { :git => "https://github.com/LH-Pan/HPTWKit.git", :tag => spec.version }
  spec.ios.deployment_target = '11.0'
  spec.swift_version = '5.0'
  spec.source_files = 'Sources/HPTWKit/**/*'

end
