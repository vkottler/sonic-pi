load 'src/melody.rb'
load 'src/melodies.rb'
load 'src/basses.rb'

use_bpm 160

num_riffs = 4

define :play_melody do |m|
	i = 0
	m.notes.size.times {
		play scale(m.keys[i], m.scale_name)[m.notes[i].scaleInd] +
			m.notes[i].mod, release: m.notes[i].duration
		sleep m.notes[i].duration
		i += 1 
	}
end

# circle of fifths
bass_keys = [
	:C3, :G2, :D3, :A2,
	:E3, :B2, :Gb3, :Db3,
	:Ab2, :Eb3, :Bb2, :F3
]

# Bass
in_thread do
	loop do
		for bkey in bass_keys do
			use_synth :chipbass
			puts "Using key #{bkey}"
			for riff in BASS_RIFFS do
				riff.key = bkey
				play_melody(riff)
			end
		end
	end
end

# circle of fifths
melody_keys = [
	:C4, :G3, :D4, :A3,
	:E4, :B3, :Gb4, :Db4,
	:Ab3, :Eb4, :Bb3, :F4
]

# Melody
loop do
	for mkey in melody_keys do
		use_synth :chiplead
		puts "Using key #{mkey}"
		for riff in MELODY_RIFFS do
			riff.key = mkey
			play_melody(riff)
		end
	end
end
