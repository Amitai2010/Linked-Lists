require_relative 'node'

class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    value_append = Node.new(value)

    if @head.nil?
      @head = value_append
    else
      @tail.next_node = value_append
    end
    @tail = value_append
  end

  def prepend(value)
    value_append = Node.new(value)

    if @head.nil?
      @tail = value_append
    else
      value_append.next_node = @head
    end
    @head = value_append
  end

  def size
    size = 0
    return 0 if @head.nil?

    point = @head
    until point.nil?
      size += 1
      point = point.next_node
    end
    size
  end

  def at(index)
    return false if @head.nil?

    count = 0
    point = @head
    until point.nil?
      return point if index == count

      count += 1
      point = point.next_node
    end
  end

  def pop
    return if @head.nil?

    if @head == @tail
      @head = nil
      @tail = nil
      return
    end
    point = @head
    until point == @tail
      if point.next_node == @tail
        point.next_node = nil
        @tail = point
        return
      end
      point = point.next_node
    end
  end

  def contains?(value)
    return false if @head.nil?

    point = @head
    until point.nil?
      return true if point.value == value

      point = point.next_node
    end
    false
  end

  def find(value)
    return false if @head.nil?

    count = 0
    point = @head
    until point.nil?
      return count if point.value == value

      point = point.next_node
      count += 1
    end
    nil
  end

  def to_s
    return 'nil' if @head.nil?

    point = @head
    values = []

    while point
      values << point.value.to_s
      point = point.next_node
    end

    values.join(' -> ') + ' -> nil'
  end
end