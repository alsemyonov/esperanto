require 'abstract'

module Esperanto
  module Morfemiko
    class Vorto
      cattr_accessor :partoj
      @@partoj = []

      def self.radiko!
        include RadikoMethods
        partoj.unshift {:radiko => /.+/}
        not_implemented
      end

      def self.radikoj!
        include RadikojMethods
        partoj.unshift {:radikoj => /.+/}
        not_implemented
      end

      def self.finajxo!(variants = nil)
        partoj << {:finajxo => /#{variants}$/}
      end
    end

    module RadikoMethods
      def to_s_with_radiko
        "#{to_s_without_radiko}#{radiko.to_s}"
      end
      alias_method_chain :to_s, :radiko
    end

    module RadikojMethods
      def to_s_with_radikoj
        radikos.sort do |some, another|
          radiko_ids.rindex(some) <=> radiko_ids.rindex(another)
        end.map do |radiko|
          radiko.to_s
        end
      end
      alias_method_chain :to_s, :radikoj
    end
  end
end
