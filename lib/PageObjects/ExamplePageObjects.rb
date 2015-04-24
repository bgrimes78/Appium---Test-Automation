require 'spec_helper'

class Example

	def verifyExampleiOS
		ele_index('UIAImage', 1)
		ele_index('UIAButton', 1)
		button_exact(Example_Button)
	end

	def verifyExampleAndroid
		complex_find_exact('android.widget.TextView', Example_Text)
		complex_find_exact('android.widget.Button', Example_Button)
	end
	
	#SWIPE on IOS
	
	def swiperightiOS(a, b, c, d, e)
		swipe(:start_x => a, :start_y => b, :end_x => c, :end_y => d, :duration => e).perform
	end

	def swipeleftiOS(a, b, c, d, e)
		swipe(:start_x => a, :start_y => b, :end_x => c, :end_y => d, :duration => e).perform
	end
	
	def swipepages
		swiperightiOS(10, 100, 100, 100, 500)
		#verify the screen
		swipeleftiOS(100, 100, 10, 100, 500)
		#verify the screen
	end

end
