platform :ios, '14.0'

source 'https://cdn.cocoapods.org/'

project 'TheMovieDatabase', 'Dev' => :debug, 'Prod' => :release

def common_pods
  pod 'R.swift', '5.4.0'
  pod 'Alamofire', '5.4.3'
  pod 'Sourcery', '1.4.2'
  pod 'SwiftLint', '0.43.1'
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
  pod 'SnapshotTesting', '~> 1.9.0'
end

target 'UITests' do
  use_frameworks!
  common_pods
  test_pods
end
