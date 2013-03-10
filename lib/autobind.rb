module Padrino
  module Autobind
    class << self
      def padrino_route_added(route, verb, path, args, options, block)
        unless route.parent.nil?
          logger.debug "Looking after parent #{route.parent} for #{verb}:#{path}. You can now use @#{route.parent}"

          route.before_filters do
            param_id = :"#{route.parent}_id" 
            if params.include? param_id
              instance_variable_set "@#{route.parent}", Object.const_get(route.parent.capitalize).find(params[param_id])
            end
          end

          route.after_filters do
            if params.include? :"#{route.parent}_id"
              remove_instance_variable "@#{route.parent}"
            end
          end
        end
      end
    end
  end
end
