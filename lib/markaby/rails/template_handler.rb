module Markaby
  module Rails
    class TemplateHandler
      def self.call(template)
        <<-CODE
        output = Markaby::Builder.new(assigns.merge(local_assigns), self);
        output.copy_instance_variables_from(self, [:@helpers, :@assigns]);
        output.instance_eval(#{template.source.dump});
        output.to_s;
        CODE
      end
    end
  end
end
