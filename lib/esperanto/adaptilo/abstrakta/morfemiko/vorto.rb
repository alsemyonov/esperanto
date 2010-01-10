require 'esperanto/morfemiko/abstrakta_vorto'

module Esperanto
  module Morfemiko
    class Vorto < AbstraktaVorto
      def self.radiko!
        super
        attr_accessor :radiko
      end

      def self.finajxo!(variants = nil)
        super
        attr_accessor :finajxo
      end
    end
  end
end
