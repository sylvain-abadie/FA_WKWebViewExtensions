Pod::Spec.new do |s|
  s.name             = 'FA_WKWebViewExtensions'
  s.version          = '1.0.0'
  s.summary          = 'Several WKWebview Extensions'

  s.description      = <<-DESC
  These extensions allow to programmatically open the keyboard when focusing on an HTML element and to remove any acessory view associated to the WKWebView.
  DESC

  s.homepage         = 'https://github.com/sylvain-abadie/FA_WKWebViewExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sylvain Abadie' => 'sylvain.abadie@frontapp.com' }
  s.source           = { :git => 'https://github.com/sylvain-abadie/FA_WKWebViewExtensions.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'FA_WKWebViewExtensions/Classes/**/*'

  s.public_header_files = 'FA_WKWebViewExtensions/Classes/**/*.h'
  s.frameworks = 'WebKit'
end
