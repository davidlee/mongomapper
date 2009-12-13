require 'test_helper'
require 'models'

class TestAssociationTruthiness < Test::Unit::TestCase
  context "An empty belongs_to association" do
    setup do
      @message = Message.new
    end
    
    should 'be nil' do
      @message.room.nil?.should == true
    end
    
    should 'not be truthy' do
      (!!@message.room).should == false
    end
  end

  context "A non-empty belongs_to association" do
    setup do
      @message = Message.create!
      @room = Room.create!
      @message.room = @room
    end
    
    should 'not be nil' do
      @message.room.should == @room
      @message.instance_eval { room }.should == @room
      @message.room.nil?.should == false
    end
    
    should 'be truthy' do
      (!!@message.room).should == true
    end
  end    
end
