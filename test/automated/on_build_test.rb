require "test_helper"
require "fried/call/on_build"

class OnBuildTest < Minitest::Spec
  def setup
    @klass = Class.new do
      include Fried::Call::OnBuild

      def self.build
        new
      end

      def call
        123
      end
    end
  end

  it "runs #call on an instance created with #build" do
    assert @klass.() == 123
  end
end
