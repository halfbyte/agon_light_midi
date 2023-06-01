# Quick and dirty script to build a table of integer frequencies
# based on the official MIDI tuning standard.
# (c) Jan Krutisch
# LICENSE: MIT, see LICENSE file

# calculate frequencies
freqs = (0..127).map do |note|
  (2**((note.to_f - 69.0) / 12.0) * 440.0).round
end
puts "midi_frequencies:"

# output them in 32 rows of 4 columns
32.times do |row|
  row_out = 4.times.map do |col|
    freqs[row * 4 + col]
  end.join(", ")
  comment_out = 4.times.map do |col|
    row * 4 + col
  end.join(", ")
  puts "\t.dw #{row_out}; #{comment_out}"
end
