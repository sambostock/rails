# frozen_string_literal: true

module ActiveRecord
  class DatabaseConfigurations
    # ActiveRecord::Base.configurations will return either a HashConfig or
    # UrlConfig respectively. It will never return a DatabaseConfig object,
    # as this is the parent class for the types of database configuration objects.
    class DatabaseConfig # :nodoc:
      attr_reader :env_name, :name

      attr_accessor :owner_name

      def initialize(env_name, name)
        @env_name = env_name
        @name = name
      end

      def spec_name
        @name
      end
      deprecate spec_name: "please use name instead"

      def config
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def adapter_method
        "#{adapter}_connection"
      end

      def host
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def database
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def _database=(database)
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def adapter
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def pool
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def checkout_timeout
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def reaping_frequency
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def idle_timeout
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def replica?
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def migrations_paths
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end

      def for_current_env?
        env_name == ActiveRecord::ConnectionHandling::DEFAULT_ENV.call
      end

      def schema_cache_path
        raise NotImplementedError, "#{self.class} must implement ##{__method__}"
      end
    end
  end
end
