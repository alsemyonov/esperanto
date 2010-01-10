require 'abstract'

module Esperanto
  module Morfemiko
    class Bazo
      def self.[](id)
        object = ObjectSpace._id2ref(id)
        if object.is_a?(self)
          object
        else
          raise "#{self.class.name} #{id} not found"
        end
      end

      def self.key(name, type, options = {})
        attr_accessor(name)
      end

      def self.apartenas_por(association_id, options = {}, &extension)
        attr_accessor("#{association_id}_id")

        define_method(association_id) do
          ObjectSpace._id2ref(association_id)
        end

        define_method("#{association_id}=") do |value|
          self.send("#{association_id}_id=", value.object_id)
        end
      end

      def self.havas_multa(association_id, options = {}, &block)
        attr_accessor(association_id)
      end
    end
  end
end
