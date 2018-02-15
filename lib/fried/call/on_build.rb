require "fried/core"

module Fried::Call
  module OnBuild
    def self.included(klass)
      klass.instance_eval do
        class << self
          extend Forwardable

          # @!method call
            # Runs the {#call} method on an instance initialized with {#build}
          def_delegator :build, :call
        end
      end
    end

    def call
      raise NotImplementedError, "Call object must implement #call"
    end
  end
end
