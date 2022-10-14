platform :ios, '14.0'

source 'https://cdn.cocoapods.org/'

project 'TheMovieDatabase', 'Dev' => :debug, 'Prod' => :release

def common_pods
  pod 'R.swift'
  pod 'Alamofire'
  pod 'Sourcery'
end

def test_pods
  pod 'Nimble', '9.2.0'
  pod 'Quick', '4.0.0'
end

target 'TheMovieDatabase' do
  use_frameworks!
  common_pods
end

target 'UnitTests' do
  use_frameworks!
  common_pods
  test_pods
  pod 'SnapshotTesting'
end

target 'UITests' do
  use_frameworks!
  common_pods
  test_pods
end
