# frozen_string_literal: true

module ActionCable
  module SubscriptionAdapter
    class Base
      attr_reader :logger, :server

      def initialize(server)
        @server = server
        @logger = @server.logger
      end

      def broadcast(channel, payload)
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def subscribe(channel, message_callback, success_callback = nil)
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def unsubscribe(channel, message_callback)
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def shutdown
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def identifier
        @server.config.cable[:id] ||= "ActionCable-PID-#{$$}"
      end
    end
  end
end
