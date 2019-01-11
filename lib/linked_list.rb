require 'pry'
require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end

   def prepend(value)
     @head = Node.new(value, @head)
   end

   def each
     node = @head

     while !node.nil?
      yield(node)
      node = node.next
     end
   end


   def [](index)
     if index == 0
       return @head
     else
       node = @head
       index.times do
         unless node.nil?
           node = node.next
         else
           return nil
         end
       end
       return node
     end
   end

   def insert(index, data)
     if index == 0
       self.prepend(data)
     else
       prev_node = @head
       (index - 1).times do
         prev_node = prev_node.next
       end

       following_node = prev_node.next
       new_node = Node.new(data, following_node)
       prev_node.next = new_node
     end
   end

   def remove(index)
     if index == 0
       @head = @head.next
     else
       prev_node = @head
       (index - 1).times do
         prev_node = prev_node.next
       end
       node_to_delete = prev_node.next
       following_node = node_to_delete.next
       prev_node.next = following_node

     end
   end

   def to_s
     array = []
     node = @head

     while !node.nil?
       array << node.info
       node = node.next
     end

     values = array.join(", ") || ""
     return "LinkedList(#{values})"
   end
end
