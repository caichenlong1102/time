Pod::Spec.new do |s|
s.name = 'time'
s.version = '1.2.0'
s.license = 'MIT'
s.summary = 'An Animate Water view on iOS.'
s.homepage = 'https://github.com/caichenlong1102/time'
s.authors = { '蔡陈龙' => 'caichenlong1102@163.com' }
s.source = { :git => 'https://github.com/caichenlong1102/time.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '9.2'
s.source_files = 'time/*.{h,m}'
s.resources = 'time/*.{png,xib,storyboard}'
end