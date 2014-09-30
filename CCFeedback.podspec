#
# Be sure to run `pod lib lint CCFeedback.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "CCFeedback"
  s.version          = "0.1.3"
  s.summary          = "Library for sending feedback from iOS app to server"
# s.description      = <<-DESC
#                      An optional longer description of CCFeedback
#
#                      * Markdown format.
#                      * Don't worry about the indent, we strip it!
#                      DESC
  s.homepage         = "https://github.com/chrischares/CCFeedback"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "ChrisChares" => "chris@eunoia.cc" }
  s.source           = { :git => "https://github.com/chrischares/CCFeedback.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/chrischares'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.resources = 'Pod/Assets/*.{xib}'

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'CCFeedback' => ['Pod/Assets/*.png']
  }
  s.dependency 'MBProgressHUD', '~> 0.9'
  s.dependency 'ChameleonFramework', '~> 1.1.1'
  s.dependency 'FontAwesomeKit', '~> 2.1.8'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
