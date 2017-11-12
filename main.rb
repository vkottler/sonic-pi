load 'src/melody.rb'

use_bpm 160

num_riffs = 4

define :play_melody do |m|
	i = 0
	m.notes.size.times {
		play scale(m.keys[i], m.scale)[m.notes[i].scaleInd], release: m.notes[i].duration
		sleep m.notes[i].duration
		i += 1 
	}
end

play_melody(VTK::MELODY3)
puts VTK::MELODY3.keys
for note in VTK::MELODY3.notes
	puts note.scaleInd
end

# Bass
#in_thread do
#  loop do
#    use_synth :chipbass
#    i = 0
#    num_riffs.times do
#      play_melody(BassNotes::BASSES[i], BassNotes::BASSES_T[i])
#      i += 1
#    end
#    i = 0
#    num_riffs.times do
#      play_melody(BassNotes::BASSES_ALT[i], BassNotes::BASSES_T_ALT[i])
#      i += 1
#    end
#  end
#end

# Melody
#loop do
#  use_synth :chiplead
#  i = 0
#  num_riffs.times do
#    play_melody(MelodyNotes::MELODIES[i], MelodyNotes::MELODIES_T[i])
#    i += 1
#  end
#  i = 0
#  num_riffs.times do
#    play_melody(MelodyNotes::MELODIES_ALT[i], MelodyNotes::MELODIES_T_ALT[i])
#    i += 1
#  end
#end
