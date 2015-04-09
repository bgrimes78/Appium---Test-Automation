equire 'spec_helper'
require 'PageObjects/ExamplePageObjects'


describe "Example" do

  before(:each) do
    @home = Example.new
  end

  it 'views home screen', :OS => 'iOS' do 
    @home.verifyExampleiOS
  end

  it 'views home screen', :OS => 'android' do 
    @home.verifyExampleAndroid
  end

end