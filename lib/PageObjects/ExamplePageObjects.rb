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
		swiperightiOS(300, 200, 10, 200, 500)
		#verify the screen
		swipeleftiOS(10, 200, 300, 200, 500)
		#verify the screen
	end
	
	# Iterate through items on iOS, i.e. 20 buttons that all need to be clicked and un-clicked
	
	def tapItems

		#need to add scrolling to be able to find all items

		n = 1
		item_displayed = true
		
		#this include n in the string
		item = '//UIAApplication[1]/UIAWindow[1]/UIACollectionView[1]/UIACollectionCell[' + n.to_s + ']'
		
		begin
			find_element(:xpath, item).click
			n += 1
			item = '//UIAApplication[1]/UIAWindow[1]/UIACollectionView[1]/UIACollectionCell[' + n.to_s + ']'
			item_displayed = find_element(:xpath, item).displayed?
		rescue
			item_displayed = false
		end while item_displayed == true
	end

end
