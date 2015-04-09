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

end