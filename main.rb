load 'melody.rb'

use_bpm 160

num_riffs = 4

define :play_melody do |m, t|
  i = 0
  m.size.times { play m[i], release: t[i]; sleep t[i]; i += 1 }
end

# Bass
in_thread do
  loop do
    use_synth :chipbass
    i = 0
    num_riffs.times do
      play_melody(BassNotes::BASSES[i], BassNotes::BASSES_T[i])
      i += 1
    end
    i = 0
    num_riffs.times do
      play_melody(BassNotes::BASSES_ALT[i], BassNotes::BASSES_T_ALT[i])
      i += 1
    end
  end
end

# Melody
loop do
  use_synth :chiplead
  i = 0
  num_riffs.times do
    play_melody(MelodyNotes::MELODIES[i], MelodyNotes::MELODIES_T[i])
    i += 1
  end
  i = 0
  num_riffs.times do
    play_melody(MelodyNotes::MELODIES_ALT[i], MelodyNotes::MELODIES_T_ALT[i])
    i += 1
  end
end