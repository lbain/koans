require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    array << 333
    assert_equal [1, 2, 333], array
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1]
    # use array[start position, number of elements] to pick certain element
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20]
    # if the number of elements you ask for is more than the number in the array,
    # ruby only gives you to the end of the array
    assert_equal [], array[4,0]
    # if the starting position you ask for is the LAST in the array,
    # ruby gives you an empty array back
    assert_equal [], array[4,100]
    assert_equal nil, array[5,0]
    # if the starting position you ask for is NOT IN the array,
    # ruby gives you nil back
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    # Ranges are not automatically arrays
    assert_equal [1,2,3,4,5], (1..5).to_a
    assert_equal [1,2,3,4], (1...5).to_a
    # Ranges can be exclusive
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2]
    assert_equal [:peanut, :butter], array[0...2]
    assert_equal [:and, :jelly], array[2..-1]
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal [1,2,:last], array

    popped_value = array.pop
    assert_equal :last, popped_value
    assert_equal [1,2], array
    # popping changes the original array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)

    assert_equal [:first, 1, 2], array
    # unshift pushes an element to the beginning of an array

    shifted_value = array.shift
    assert_equal :first, shifted_value
    # shift works like pop, but from the beginning of the arary
    assert_equal [1,2], array
    # just like pop, shift changes the original array
  end

end
