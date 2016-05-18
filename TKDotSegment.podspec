Pod::Spec.new do |s|
  s.name         = "TKDotSegment"
  s.version      = "1.0.1"
  s.summary      = "TKDotSegment is a segment with dot animation "
  s.license      = { :type => 'MIT License', :file => 'LICENSE' } # 协议
  s.homepage     = "https://github.com/TBXark/TKDotSegment"
  s.author       = { "TBXark" => "https://github.com/TBXark" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/TBXark/TKDotSegment.git", :tag => s.version }
  s.source_files  = "TKDotSegmentControl.swift"
  s.requires_arc = true
end
