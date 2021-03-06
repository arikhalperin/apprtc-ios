Pod::Spec.new do |s|
  s.name               = "WebRTC"
  s.version            = "1.0.3"
  s.summary            = "iOS video chat based on WebRTC"
  s.homepage           = "https://github.com/ISBX/apprtc-ios"
  s.author             = "ISBX"
  s.license            = { :type => "BSD", :file => "LICENSE" }
  s.platform           = :ios, "7.0"
  s.source             = { :git => 'https://github.com/arikhalperin/apprtc-ios.git', :tag => 'v1.5' }
  s.source_files       = "Lib/*/*.*"
  s.header_mappings_dir = "Lib/WebRTC"
  s.preserve_paths     = "WebRTC","Lib/libWebRTC.a"
  s.vendored_libraries = 'Lib/libWebRTC.a'
  s.requires_arc       = true
  s.frameworks         = "QuartzCore", "OpenGLES", "CoreGraphics", "CoreVideo", "CoreMedia", "CoreAudio", "AVFoundation", "AudioToolbox", "GLKit", "CFNetwork", "Security",'AVFoundation', 'AudioToolbox', 'CoreGraphics', 'CoreMedia', 'GLKit', 'UIKit', 'VideoToolbox'
  s.libraries          = "sqlite3", "stdc++.6", "icucore", "c++"
  s.dependency "SocketRocket"
end