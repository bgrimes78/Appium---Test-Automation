require 'rubygems'
require 'rspec'
require 'yaml'
require 'appium_lib'
require 'selenium/webdriver'

include RSpec::Matchers

# Load config file
ConfigFile = YAML.load_file('config.yml')

if (ConfigFile["ios"])

  def desired_caps
    {
      caps: {
        deviceName: "iPhone",
        udid: "add udid here",
        platformName: "iOS",
        platformVersion: "8.2",
        
        #Comment out bundleID or app depending on how you are testing

        # Bundle ID needed when running on CI (Jenkins) as app will already be installed by fruitstrap
        bundleId: "com.app.myapp",
        
        # App is for local testing outside of CI as appium will install the app on its own
        app: "path to ipa or app"
      }
    }
  end

else 
  if (ConfigFile["android"])
    
    def desired_caps
      {
        caps: {
          deviceName: "device name can be found in Eclipse DDMS view when connected",
          platformName: "Android",
          platformVersion: "enter OS version on device here",

          #Comment out bundleID or app depending on how you are testing
          
          # App is for local testing outside of CI as appium will install the app on its own
          app: "//users/brandongrimes/downloads/app-debug-1.0.0.151.apk", 
          
          # App Package and Activity are needed when running on CI (Jenkins) as app will already be installed by fruitstrap
          appPackage: "com.app.myapp",
          appActivity: "com.app.myapp.activity"
        }
      }
    end

  end
end

RSpec.configure do |config|

  server_url = "http://127.0.0.1:4723/wd/hub"
  AppiumDriver = Appium::Driver.new(desired_caps)
  Appium.promote_appium_methods Object

  config.before(:each) do    
    @AppiumDriver.start_driver
  end

  config.after(:each) do
    @AppiumDriver.driver_quit
  end

end