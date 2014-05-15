require 'spec_helper'

describe TimeTeller do

  it "should initialize with empty args" do
    expect {
      TimeTeller.new
    }.to_not raise_error
  end

end
