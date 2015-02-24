module RailsUiHarness
  class Harness < Object
    def method_missing(methId, *arguments)
      str = methId.id2name
      if str.include?("=")
        val = arguments[0]
        instance_variable_set("@#{str.sub('=', '')}", val) 
      else
        instance_variable_get("@#{str}") || "#[#{str}]"
      end
    end
  end
end