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
        # For iPhone Simulator, device name is 'iPhone #', for testing on device, just type 'iPhone'
        deviceName: "iPhone",
        
        # UDID only needed for testing on device
        udid: "add udid here",
        
        platformName: "iOS",
        
        # The OS version only matters when you are testing on Simulator and is dictated by the version of XCode you have installed, which always defaults to the latest version of iOS
        platformVersion: "8.2",
        
        # Comment out bundleID or app depending on how you are testing

        # Bundle ID needed when running on CI (Jenkins) as app will already be installed by fruitstrap.  Bundle ID can be left in for testing on device.
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
          
          # App Package and Activity are needed when running on CI (Jenkins) as app will already be installed via ADB
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
