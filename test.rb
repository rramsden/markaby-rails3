class Basic < BasicObject
  def method_missing(sym, *args, &block)
    puts sym
  end
end

object = Basic.new

case object
  when String
    puts "it works"
  else
    puts "fooey"
end
