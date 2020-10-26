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
        raise NotImplementedError, "USEFUL_MESSAGE_HERE"
      end

      def subscribe(channel, message_callback, success_callback = nil)
        raise NotImplementedError, "USEFUL_MESSAGE_HERE"
      end

      def unsubscribe(channel, message_callback)
        raise NotImplementedError, "USEFUL_MESSAGE_HERE"
      end

      def shutdown
        raise NotImplementedError, "USEFUL_MESSAGE_HERE"
      end

      def identifier
        @server.config.cable[:id] ||= "ActionCable-PID-#{$$}"
      end
    end
  end
end
