module Padrino
  module Autobind
    class << self
      def padrino_route_added(route, verb, path, args, options, block)
        unless route.parent.nil?
          logger.debug "Looking after parent #{route.parent} for #{verb}:#{path}. You can now use #{Array(route.parent).map {|r| '@' + r.to_s}.join(', ')}"

          route.before_filters do
            (route.parent.is_a?(Array) ? route.parent : [route.parent]).each do |parent|
              param_id = :"#{parent}_id" 
              if params.include? param_id
                instance_variable_set "@#{parent}", Object.const_get(parent.capitalize).find(params[param_id])
              end
            end
          end

          route.after_filters do
            (route.parent.is_a?(Array) ? route.parent : [route.parent]).each do |parent|
              remove_instance_variable("@#{parent}") if params.include? :"#{parent}_id"
            end
          end
        end
      end
    end
  end
end
