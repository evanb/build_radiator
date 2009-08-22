require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Bamboo do

  it "should raise an exception with invalid credentials" do

    lambda {
      Bamboo.new.login("foo", "somenunlikelypassword")
    }.should raise_error("authentication failed")

  end

  it "should create a new authenticated session with valid credentials" do

    bamboo = Bamboo.new
    bamboo.login("evanb", "Pa$$w0rd6")

    bamboo.authentication_token.should_not be_nil
    
  end

  
end