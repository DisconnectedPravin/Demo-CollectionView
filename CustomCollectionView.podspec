Pod::Spec.new do |s|
  s.name             = 'CustomCollectionView'
  s.version          = '0.1.0'
  s.summary          = ‘Initial private Pod to show demo of collectionView.’

  s.description      = <<-DESC
This is initial repo to showcase the creating the private Pod
                       DESC

  s.homepage         = 'https://github.com/DisconnectedPravin/Demo-CollectionView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { ‘Pravin Domalwar’ => ‘pravin.iosdev@gmail.com’ }
  s.source           = { :git => 'https://github.com/DisconnectedPravin/Demo-CollectionView.git', :tag => s.version.to_s }

  s.ios.deployment_target = ‘9.0’
  s.source_files = 'Source/*'

end