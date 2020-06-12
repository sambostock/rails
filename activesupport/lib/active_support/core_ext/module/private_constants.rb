# frozen_string_literal: true

class Module
  private
    # Mark all constants defined within the block as private
    #
    #   module M
    #     private_constants do
    #       Foo = 123
    #       Bar = 456
    #     end
    #
    #     # instead of
    #
    #     Foo = 123
    #     Bar = 456
    #     private_constants :Foo, :Bar
    #   end
    #
    # Note that constants explicitly defined in another namespace will not be privatized
    #
    #   module Other
    #   end
    #
    #   module M
    #     private_constants do
    #       Other::Foo = 123
    #       Bar = 456
    #     end
    #   end
    #
    #   Other::Foo # => 123
    #   M::Bar     # => NameError
    def private_constants
      before = constants(false)
      yield
      private_constant(*constants(false) - before)
    end
end
