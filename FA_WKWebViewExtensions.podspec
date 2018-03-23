#
# Be sure to run `pod lib lint FA_WKWebViewExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FA_WKWebViewExtensions'
  s.version          = '1.0.0'
  s.summary          = 'Several WKWebview Extensions'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  These extensions allow to programmatically open the keyboard when focusing on an element and to remove any acessory view associated to the WKWebView.
  DESC

  s.homepage         = 'https://github.com/sylvain-abadie/FA_WKWebViewExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sylvain Abadie' => 'sylvain.abadie@frontapp.com' }
  s.source           = { :git => 'https://github.com/sylvain-abadie/FA_WKWebViewExtensions', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'FA_WKWebViewExtensions/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FA_WKWebViewExtensions' => ['FA_WKWebViewExtensions/Assets/*.png']
  # }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
