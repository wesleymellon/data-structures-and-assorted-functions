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
          current_node = current_node.left_child
        elsif element < current_node.value && current_node.left_child.nil?
          current_node.left_child = Node.new(element)
          is_spot_found = true
        elsif element >= current_node.value && !current_node.right_child.nil?
          current_node = current_node.right_child
        else
          current_node.right_child = Node.new(element)
          is_spot_found = true
        end
      end
    end
  end

  def breadth_first_search(target)
    node_queue = [@root]
    until node_queue.empty?
      current_node = node_queue.shift
      if current_node.value == target
        return current_node
      else
        node_queue << current_node.left_child unless current_node.left_child.nil?
        node_queue << current_node.right_child unless current_node.right_child.nil?
      end
    end

    nil
  end

  def depth_first_search(target)
    node_stack = [@root]
    until node_stack.empty?
      current_node = node_stack.pop
      if current_node.value == target
        return current_node
      else
        node_stack << current_node.left_child unless current_node.left_child.nil?
        node_stack << current_node.right_child unless current_node.right_child.nil?
      end
    end

    nil
  end

  def dfs_rec(target, current_node=@root)
    if current_node.nil?
      return
    elsif current_node.value == target
      return current_node
    elsif target < current_node.value
      dfs_rec(target, current_node.left_child)
    else
      dfs_rec(target, current_node.right_child)
    end
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






