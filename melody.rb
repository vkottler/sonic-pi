module VTK; end

include VTK

# Note metadata, add 'release' etc. in future
class Note

	def initialize(scaleInd, duration)
		@scaleInd = scaleInd
		@duration = duration
	end

	attr_accessor :scaleInd
	attr_accessor :duration
end

# Melody data, ideally an immutable set of note indices where key
# and scale mutate to produce different sounds
class Melody

	# Resolve scale index by moving an octave up or down in key,
	# this is required because SonicPi chooses to use "rings"
	# when indexing scales. Highly inconvenient for melodies that
	# begin and end in different octave numbers
	def initialize_keys()
		@keys = []
		restore_original_notes()
		for note in @notes do
			if note.scaleInd == nil
				@keys.push(@key)
			elsif note.scaleInd < 0
				numOctavesDown = (-note.scaleInd / 7.0).ceil
				@keys.push(@key - 12 * numOctavesDown)
				note.scaleInd = 8 - ((-note.scaleInd) % 8) - numOctavesDown
			elsif note.scaleInd >= 7
				numOctavesUp = (note.scaleInd / 8.0).ceil
				@keys.push(@key + 12 * numOctavesUp)
				note.scaleInd = note.scaleInd % 7
			else
				@keys.push(@key)
			end
		end
	end

	# Initialization manipulates scale indices, if these need to be
	# update we need to restore them to re-calculate indices
	def restore_original_notes()
		@notes = []
		for note in @original_notes do
			@notes.push(note)
		end
	end

	def initialize(key, scale, notes)
		@key = key
		@scale = scale
		@original_notes = []
		@notes = notes

		if not notes.kind_of?(Array) then
			raise "Indexes and durations must be provided as a list."
		end

		for note in notes do

			# Enforce typing
			if not note.kind_of?(Note) then
				raise "'note' in 'notes' was not of class Note."
			end

			# Preserve original note indices
			@original_notes.push(note)
		end
		
		initialize_keys()
	end

	attr_accessor :notes
	attr_accessor :scale
	attr_accessor :key
	attr_accessor :keys
end

MELODY1 = Melody.new(
	:C4, :minor,
	[
		Note.new(nil, 4.5),
		Note.new(0, 0.5),
		Note.new(2, 1.0),
		Note.new(3, 0.5),
		Note.new(2, 0.5),
		Note.new(1, 2.0)
	]
)

module MelodyNotes
  MELODY1 = [nil, :C4, :Eb4, :F4, :Eb4, :D4]
  MELODY_T1 = [4.5, 0.5, 1.0, 0.5, 0.5, 2.0]
  MELODY1_ALT = [nil, :F4, :Eb4, :D4]
  MELODY_T1_ALT = [6.0, 0.5, 0.5, 2.0]
  
  MELODY2 = [nil, :C4, :Eb4, :F4, :Bb4, :Ab4, :G4, :F4]
  MELODY_T2 = [3.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2.0]
  MELODY2_ALT = [nil, :Bb4, :Ab4, :G4, :F4]
  MELODY_T2_ALT = [5.0, 0.5, 0.5, 0.5, 2.0]
  
  MELODY3 = [nil, :G3, :C4, :Eb4, :C4, :Eb4, :G4, :F4]
  MELODY_T3 = [0.5, 3.5, 0.25, 0.25, 0.5, 0.5, 0.5, 2.0]
  MELODY3_ALT = [nil, :G3, :Eb4, :C4]
  MELODY_T3_ALT = [4.5, 1.0, 0.5, 2.0]
  
  MELODY4 = [nil, :A3, :C4, :Eb4, :G4, :F4, :Eb4, :C4]
  MELODY_T4 = [3.0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5]
  
  MELODIES = [MELODY1, MELODY2, MELODY3, MELODY4]
  MELODIES_T = [MELODY_T1, MELODY_T2, MELODY_T3, MELODY_T4]
  
  MELODIES_ALT = [MELODY1_ALT, MELODY2_ALT, MELODY3_ALT, MELODY4]
  MELODIES_T_ALT = [MELODY_T1_ALT, MELODY_T2_ALT, MELODY_T3_ALT, MELODY_T4]
end

module BassNotes
  BASS1 = [:C3, :Eb3, :G3, :G3, nil]
  BASS_T1 = [1.0, 1.0, 1.5, 3.5, 1.0]
  BASS1_ALT = [:C3, :Eb3, :G3, :G3, :G3, :F3, nil]
  BASS_T1_ALT = [1.0, 1.0, 1.5, 1.0, 0.5, 2.5, 0.5]
  
  BASS2 = [:Bb2, :D3, :G3, :F3]
  BASS_T2 = [1.0, 1.0, 3.0, 3.0]
  BASS2_ALT = [:Bb2, :D3, :G3, :G3, :G3, :F3]
  BASS_T2_ALT = [1.0, 1.0, 1.5, 1.0, 0.5, 3.0]
  
  BASS3 = [:G2, :C3, :Eb3, :F3]
  BASS_T3 = [1.0, 1.0, 3.0, 3.0]
  BASS3_ALT = [:G2, :C3, :Eb3, :Eb3, :Eb3, :F3]
  BASS_T3_ALT = [1.0, 1.0, 1.5, 1.0, 0.5, 3.0]
  
  BASS4 = [:F2, :C3, :F3, :G3]
  BASS_T4 = [1.0, 1.0, 1.5, 4.5]
  BASS4_ALT = [:F2, :C3, :F3, :F3, :G3, :G3, :G3, :G3]
  BASS_T4_ALT = [1.0, 1.0, 0.5, 1.0, 1.5, 2.0, 0.5, 0.5]
  
  BASSES = [BASS1, BASS2, BASS3, BASS4]
  BASSES_T = [BASS_T1, BASS_T2, BASS_T3, BASS_T4]
  
  BASSES_ALT = [BASS1_ALT, BASS2_ALT, BASS3_ALT, BASS4_ALT]
  BASSES_T_ALT = [BASS_T1_ALT, BASS_T2_ALT, BASS_T3_ALT, BASS_T4_ALT]
end
