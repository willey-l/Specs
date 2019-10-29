Pod::Spec.new do |s|

  s.name         = "BGFoundation"
  s.version      = "0.1.0"
  s.summary      = "Bigo iOS 基础库"
  s.description  = <<-DESC
提供业务无关的基础库，包括Extension, Utility等，在整个库依赖设计中的最下层。
                   DESC
  s.homepage     = "https://gerrit.bigo.sg/#/admin/projects/BigoFoundation"
  s.author       = 'Bigo Inc.'
  s.source       = { :git => "http://gerrit.bigo.sg:8088/BigoFoundation", :tag => '0.1.0'}
  s.requires_arc = true
  s.license      = 'Copyright © 2018 Bigo Inc. All rights reserved.'
  s.public_header_files = 'BGFoundation/BGFoundation.h'
  s.source_files = 'BGFoundation/BGFoundation.h'


  pch_BGF = <<-EOS
#ifndef BGF_DUMMY_CLASS
#define BGF_DUMMY_CLASS(_name_) \
@interface BGF_DUMMY_CLASS_ ## _name_ : NSObject @end \
@implementation BGF_DUMMY_CLASS_ ## _name_ @end
#endif
EOS

  s.prefix_header_contents = pch_BGF
  s.ios.deployment_target = '8.0'

  s.default_subspec = 'Extension', 'Utility'

  s.subspec 'Extension' do |ss|
    ss.source_files = 'BGFoundation/Extension/**/*.{h,m}', 'BGFoundation/ThirdParty/**/*.{h,m}'
    ss.public_header_files = 'BGFoundation/**/*.h'
  end

  s.subspec 'Utility' do |ss|
    ss.source_files = 'BGFoundation/Utility/*.{h,m}', 'BGFoundation/Utility/**/*.{h,m}'
    ss.public_header_files = 'BGFoundation/Utility/*.h'
  end
end
