
Pod::Spec.new do |s|

  s.name         = "StitchingImage"
  s.version      = "1.0"
  s.summary      = "仿微信群组封面拼接功能"

  s.description  = <<-DESC
                   A longer description of stitchingImage in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/zhengjinghua/StitchingImage"
  s.license      = "MIT (example)"
  s.author       = { "Monkey Jin" => "jin114001251@gmail.com" }
  s.source       = { :git => "https://github.com/zhengjinghua/StitchingImage.git", :tag=>"1.0" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"



end
