class Item
  attr_accessor :children, :name

  def initialize(name)
    @name = name
    @children = []
  end
end

tree = Item.new("Language")

ruby = Item.new("Ruby")
ruby.children << Item.new("Best Practices")
tree.children << ruby

js = Item.new("Javascript")
js.children << Item.new("Best Practices")
tree.children << js

puts tree.name
tree.children.each do |item|
  puts item.name
  if item.children.any?
    item.children.each do |child|
      puts "--#{child.name}"
    end
  end
end