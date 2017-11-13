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

melody_keys = [
	:C4, :G3, :D4, :A3,
	:E4, :B3, :Gb4, :Db4,
	:Ab3, :Eb4, :Bb3, :F4
]

# Bass
in_thread do
	loop do
		use_synth :chipbass

		# Play through bass keys
		for bkey in bass_keys do
			puts "Using key (bass) #{bkey}"
			for riff in BASS_RIFFS do
				riff.key = bkey
				play_melody(riff)
			end
		end

		# Play through melody keys
		for mkey in melody_keys do
			puts "Using key (bass) #{mkey}"
			for riff in BASS_RIFFS do
				riff.key = mkey
				play_melody(riff)
			end
		end
	end
end

# Melody
loop do
	use_synth :chiplead
	
	# Play through melody keys
	for mkey in melody_keys do
		puts "Using key (meldoy) #{mkey}"
		for riff in MELODY_RIFFS do
			riff.key = mkey
			play_melody(riff)
		end
	end

	# Play through bass keys
	for bkey in bass_keys do
		puts "Using key (meldoy) #{bkey}"
		for riff in MELODY_RIFFS do
			riff.key = bkey
			play_melody(riff)
		end
	end
end

# Percussion
#in_thread do
#	loop do
#		sleep 32
#		j = 0
#		while j < 8 do
#			sample :bd_haus, cutoff: 70, amp: 2.0
#			sleep 4
#			j += 1
#		end
#		j = 0
#		while j < 16 do
#			sample :bd_haus, cutoff: 70, amp: 2.0
#			sleep 2
#			j += 1
#		end
#		j = 0
#		while j < 8 do
#			sample :bd_haus, cutoff: 70, amp: 2.0
#			sleep 4
#			j += 1
#		end
#	end
#end
