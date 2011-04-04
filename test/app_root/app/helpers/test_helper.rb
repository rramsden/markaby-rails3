module TestHelper
  def check_ivar_exists(name)
    unless instance_variables_for(self).include?(ivar_name = "@#{name}".to_sym)
      raise "#{ivar_name} does not exist"
    end
  end

  if RUBY_VERSION =~ /1.9/
    def instance_variables_for(obj)
      obj.instance_variables
    end
  else
    def instance_variables_for(obj)
      obj.instance_variables.map { |m| m.to_sym }
    end
  end

end
