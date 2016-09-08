# You should inherit from this class, e.g. JohnSmithsAttempt
#
# You need to define these methods for your attempt to work
# with the test harness. By default, this class uses binary
# to represent numbers. You can override #encode and #decode
# to define your own representations.
#
class SomeonesAttempt
  # This is the description of your turing machine.
  #
  # From left to right, the columns are:
  # state, read, write, move, next state
  #
  # This example is the binary incrementer example
  # we looked at in the meeting on Church's Thesis.
  #
  # It doesn't solve the problem described in the
  # README. You'll have to figure that yourself!
  def turing_machine_description
    [
      [1, 1, 1, :L, 1],
      [1, B, 1, :R, 2],
    ]
  end

  # This method encodes an input number to an input
  # for your Turing machine, e.g.
  #
  # 14 -> [1, 1, 1, 0]
  #
  # It is up to you how you represent numbers.
  def encode(input)
    unary_string = '1' * input
    characters = unary_string.chars
    characters.map(&:to_i)
  end

  # This method decodes a turing machine tape to
  # the output number, e.g.
  #
  # [1, 1, 1, 0] -> 14
  #
  # It is up to you how you represent numbers.
  def decode(final_tape)
    unary_string = final_tape.join
    unary_string.chars.count('1')
  end
end
