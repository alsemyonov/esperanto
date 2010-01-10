require 'abstract'

module Esperanto
  module Morfemiko
    class AbstraktaVorto
      cattr_accessor :partoj, :finajxo_variantoj
      @@partoj = []

      def self.radiko!
        apartenas_por(:radiko, :index => true)
        include RadikoMethods
      end

      def self.finajxo!(variantoj = nil)
        self.finajxo_variantoj = variantoj
      end
    end

    module RadikoMethods
      def to_s_with_radiko
        "#{to_s_without_radiko}#{radiko.to_s}"
      end
      alias_method_chain :to_s, :radiko
    end
  end
end
