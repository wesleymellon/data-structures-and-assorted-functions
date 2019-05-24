class BinaryTree
  attr_accessor :root

  def initialize(root=nil)
    @root = root
  end

  def build_tree(arr)
    @root = Node.new(arr[0]) unless arr.empty?
    arr[1..-1].each do |element|
      current_node = @root
      is_spot_found = false
      until is_spot_found
        if element < current_node.value && !current_node.left_child.nil?
          puts "#{element} is less than #{current_node.value} and not empty!"
          current_node = current_node.left_child
        elsif element < current_node.value && current_node.left_child.nil?
          puts "#{element} is less than #{current_node.value} and empty!"
          current_node.left_child = Node.new(element)
          is_spot_found = true
        elsif element >= current_node.value && !current_node.right_child.nil?
          puts "#{element} is greater than #{current_node.value} and not empty!"
          current_node = current_node.right_child
        else
          current_node.right_child = Node.new(element)
          puts "#{element} is greater than #{current_node.value} and empty!"
          is_spot_found = true
        end
      end
    end
  end

  # def display_tree
  #   node_queue = [@root]
  #   current_node = @root
  #   while node_queue.length < 8
  #     node_queue << current_node.left_child
  #     node_queue << current_node.right_child
  #     current_node = 
  # end

  def breadth_first_search(target)
    node_queue = [@root]
    until node_queue.empty?
      current_node = node_queue.shift
      puts "current_node: #{current_node.value}"
      if current_node.value == target
        return current_node
      else
        node_queue << current_node.left_child unless current_node.left_child.nil?
        node_queue << current_node.right_child unless current_node.right_child.nil?
      end
    end

    nil
  end
end


class Node
  attr_accessor :parent_node, :left_child, :right_child, :value

  def initialize(value=nil)
    @value = value
    @parent_node = nil
    @left_child = nil
    @right_child = nil
  end

end

tree = BinaryTree.new
tree.build_tree([4,1,2,0,5,8,6])
puts tree.breadth_first_search(6)