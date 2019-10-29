Pod::Spec.new do |s|

  s.name         = "BGFoundation"
  s.version      = "0.1.11"
  s.summary      = "Bigo iOS 基础库"
  s.homepage     = "https://gerrit.bigo.sg/#/admin/projects/BigoFoundation"
  s.author       = 'Bigo Inc.'
  s.source       = { :git => "http://gerrit.bigo.sg:8088/BigoFoundation", :tag => s.version }
  s.license      = 'Copyright © 2018 Bigo Inc. All rights reserved.'

  pch_BGF = <<-EOS
#ifndef BGF_DUMMY_CLASS
#define BGF_DUMMY_CLASS(_name_) \
@interface BGF_DUMMY_CLASS_ ## _name_ : NSObject @end \
@implementation BGF_DUMMY_CLASS_ ## _name_ @end
#endif
EOS

  s.prefix_header_contents = pch_BGF
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  
  s.source_files = 'README.md', 'CHANGELOG.md', 'BGFoundation.podspec'
  s.default_subspec = 'Core'

  ## subspecs

  s.subspec 'Core' do |ss|
    ss.source_files = 'BGFoundation/BGFoundation.h'
    ss.public_header_files = 'BGFoundation/BGFoundation.h'
    ss.dependency 'BGFoundation/Extension'
    ss.dependency 'BGFoundation/Utility'
  end

  s.subspec 'Extension' do |ss|
    ss.source_files = 'BGFoundation/Extension/**/*.{h,m}',
    ss.public_header_files = '*.h'
    ss.subspec 'GTMBase64' do |sss|
      sss.source_files = 'BGFoundation/ThirdParty/Unmodified/GTMBase64/*.{h,m}'
      sss.private_header_files = 'BGFoundation/ThirdParty/Unmodified/GTMBase64/*.{h,m}'
    end
  end

  s.subspec 'Utility' do |ss|
    ss.source_files = 'BGFoundation/Utility/*.{h,m}', 'BGFoundation/Utility/**/*.{h,m}'
    ss.public_header_files = '*.h'
    ss.subspec 'ImageHelper' do |sss|
      sss.source_files = 'BGFoundation/ThirdParty/Modified/ImageHelper/*.{h,m}'
    end
  end

end
