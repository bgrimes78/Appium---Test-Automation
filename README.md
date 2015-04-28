# Appium---Test-Automation

Setup and Configuration

Environment - MacOSX

	Homebrew - http://brew.sh/

		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	RVM / Ruby - https://rvm.io/rvm/install

		\curl -sSL https://get.rvm.io | bash -s stable --ruby
		source /etc/profile
		rvm use --default

	Ruby Gems

		Bundler - https://rubygems.org/gems/bundler

			gem install bundler

		Appium - https://rubygems.org/gems/appium_lib

			gem install appium_lib

	Node / Appium - http://blog.teamtreehouse.com/install-node-js-npm-mac

		brew install node
		npm install -g appium
		npm install wd

	Appium GUI - http://appium.io/

	iOS Device Configuration

		Enable UI Automation in Settings - Developer

	iOS Apps

		Compile the IPA using an 'IOS Developer' certificate and associated development provisioning profile
			You will have to use the Debug IPA, not the Release

		FruitStrap - http://www.stewgleadow.com/blog/2011/11/05/installing-ios-apps-on-the-device-from-the-command-line/

			git clone git://github.com/ghughes/fruitstrap.git
			cd fruitstrap
			make fruitstrap

		Install on device
			fruitstrap -i udid -b path_to_ipa


Ruby iOS Command List: https://github.com/appium/ruby_lib/blob/master/docs/ios_docs.md

Jenkins - http://jenkins-ci.org/

	Configure System

		Global properties - Environment variables - List of key-value pairs
			name = PATH
			value = /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

		Copy/Paste the following in /Users/Shared/Jenkins/Home

			Android SDK folder
				this makes adb available in the shell

			.APK
				manually paste it there or have it placed there at end of build process

		Project Setup

			New Item
				Name it
				Check 'Freestype project'
			Configure
				Build
					Execute Shell
						Enter the commands you need to run your scripts

							iOS Example:

							fruitstrap -i udid -b path_to_ipa
							cd path to 'spec' folder of scripts
							rspec --tag OS:iOS

								*See Examples for RSpec tag usage


							Android Example:

							/Users/Shared/Jenkins/Home/eclipse/android-sdk-macosx/platform-tools/adb start-server
							/Users/Shared/Jenkins/Home/eclipse/android-sdk-macosx/platform-tools/adb install /Users/Shared/Jenkins/Home/app.apk 
							cd path to 'spec' folder of scripts
							rspec --tag OS:android

								*See Examples for RSpec tag usage

	Android Device Configuration

		USB Debugging Enabled in Settings - Developer Options

	Android Apps

		Install on device
			/Users/Shared/Jenkins/Home/eclipse/android-sdk-macosx/platform-tools/adb start-server
			/Users/Shared/Jenkins/Home/eclipse/android-sdk-macosx/platform-tools/adb install /Users/Shared/Jenkins/Home/app.apk 


Selenium Grid

	http://docs.seleniumhq.org/docs/07_selenium_grid.jsp
	
	https://github.com/appium/appium/blob/master/docs/en/advanced-concepts/grid.md
