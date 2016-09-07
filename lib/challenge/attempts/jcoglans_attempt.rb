# This machine computes ceil(log(n + 1, 2)), using 15 rules, 5 states and 3
# non-blank symbols.
#
# Say we begin with input 14, or 1110 in binary. The tape then looks like this:
#
#      1  1  1 [0]
#
# The function ceil(log(n + 1, 2)) is the number of digits in the binary
# representation of n, so the machine needs to count the digits in the input.
# It will search for each digit in the input and each time it finds one, it
# will increment a counter somewhere else on the tape.
#
# The first step (state 1) is to initialise the counter. We place this to the
# left of the input, because it will grow to the left. State 1 involves
# scanning to the left until we hit a blank:
#
#         1  1  1 [0]
#         1  1 [1] 0
#         1 [1] 1  0
#        [1] 1  1  0
#     [ ] 1  1  1  0
#
# When we hit a blank in state 1, we write a 0 for the counter, then move right
# and enter state 2.
#
#      0 [1] 1  1  0
#
# In state 2, we scan right until we find a non-marker symbol. If we see a 0 or
# 1, we replace it with a marker, move left and enter state 3. (Machine state
# is listed on the right.)
#
#      0 [1] 1  1  0      |   2
#     [0] -  1  1  0      |   3
#
# State 3 is the incrementor. When we see a marker, we just move left. When we
# see a 0 or blank, we replace it with 1 and we move to state 4. If we see a 1,
# we write a 0 and keep moving left to carry the addition. On our example this
# is brief:
#
#     [0] -  1  1  0      |   3
#      1 [-] 1  1  0      |   4
#
# The purpose of state 4 is to move rightwards again through the counter until
# we find the markers. On all symbols it moves right, but on markers it moves
# to state 2. From there it can search for the next digit and increment the
# counter again.
#
# Following this process once more around the loop, we see the following
# sequence of tape and machine states:
#
#         1 [-] 1  1  0     |   4
#         1  - [1] 1  0     |   2
#         1 [-] -  1  0     |   3
#        [1] -  -  1  0     |   3
#     [ ] 0  -  -  1  0     |   3
#      1 [0] -  -  1  0     |   4
#      1  0 [-] -  1  0     |   4
#      1  0  - [-] 1  0     |   2
#
# After a two more turns around this loop, we end up with this on the tape:
#
#      1  0  0  - [-] -  -
#
# All the digits have been counted, and state 2 will begin scanning right
# again. But now, it will hit a blank before any digits.
#
#      1  0  0  -  -  -  - [ ]
#
# This switches the machine to the final state (5). This state just replaces
# markers with blanks and moves left, and halts on all other symbols.
#
#      1  0  0  -  -  - [-]
#      1  0  0  -  - [-]
#      1  0  0  - [-]
#      1  0  0 [-]
#      1  0 [0]
#
# Now the machine halts, with the result value and no markers left on the tape.

class JcoglansAttempt < SomeonesAttempt
  def turing_machine_description
    _ = :-

    [
      [ 1, 0, 0, :L, 1 ],
      [ 1, 1, 1, :L, 1 ],
      [ 1, B, 0, :R, 2 ],

      [ 2, _, _, :R, 2 ],
      [ 2, 0, _, :L, 3 ],
      [ 2, 1, _, :L, 3 ],
      [ 2, B, B, :L, 5 ],

      [ 3, _, _, :L, 3 ],
      [ 3, 0, 1, :R, 4 ],
      [ 3, 1, 0, :L, 3 ],
      [ 3, B, 1, :R, 4 ],

      [ 4, 0, 0, :R, 4 ],
      [ 4, 1, 1, :R, 4 ],
      [ 4, _, _, :R, 2 ],

      [ 5, _, B, :L, 5 ]
    ]
  end
end
