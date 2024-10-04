module Printable
  def print(name, text)
    puts "#{add_space(name, 20)} \t #{add_space(self.class.to_s, 20)} \t => #{text}"
  end

  private

  def add_space(name, size)
    if name.size < size
      (size - name.size).times { name += ' ' }
      name
    else
      name[0..size]
    end
  end
end