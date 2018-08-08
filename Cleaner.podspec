Pod::Spec.new do |s|
  s.name = 'Cleaner'
  s.version = '0.1.0'
  s.summary = 'This library is useful to clean the directories where the app save content'
  s.description = 'The main reason why this project was created, was for simulate the feature that Android devices use to have for cleaning the User Data & Cache. Doind this you can save space in your device and also leave the app as it was when the user install for the very first time (like an uninstall&install)'

  s.homepage = 'https://github.com/fjtrujy/ios-cleaner'
  # s.screenshots = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Francisco Javier Trujillo Mata' => 'fjtrujy@gmail.com' }
  s.source = { :git => 'https://github.com/fjtrujy/ios-cleaner.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/fjtrujy'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Cleaner/*'
  
end
