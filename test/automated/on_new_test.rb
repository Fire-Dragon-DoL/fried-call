require "test_helper"
require "fried/call/on_new"

class OnNewTest < Minitest::Spec
  def setup
    @klass = Class.new do
      include Fried::Call::OnNew

      def call
        123
      end
    end
  end

  it "runs #call on an instance created with #new" do
    assert @klass.() == 123
  end
end
