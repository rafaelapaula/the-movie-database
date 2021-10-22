current_dir = $(shell pwd)

setup:
	sudo gem install bundler
	brew update
	brew upgrade
	brew install mint
	brew link mint
	mint bootstrap
	bundle install
	make configure_project

configure_project:
	make generate_files
	mint run xcodegen generate
	bundle exec pod install

unit_tests:
	bundle exec fastlane unit_tests

ui_tests:
	bundle exec fastlane ui_tests

clear_derived_data:
	rm -rf ~/Library/Developer/Xcode/DerivedData

generate_files:
	mkdir -p Generated
	touch Generated/R.generated.swift
	touch Generated/AutoMockable.generated.swift

setup_templates:
	mkdir -p ~/Library/Developer/Xcode/Templates
	rm -f ~/Library/Developer/Xcode/Templates/TheMovieDatabase
	ln -s "$(current_dir)/Templates" ~/Library/Developer/Xcode/Templates/TheMovieDatabase

setup_sourcery:
	./Pods/Sourcery/bin/sourcery --sources App --templates Templates --output Generated
