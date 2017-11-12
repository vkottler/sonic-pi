module VTK; end

include VTK

STARTING_M_KEY = :C4
STARTING_B_KEY = :C3
STARTING_SCALE = :minor

# Note metadata, add 'release' etc. in future
class Note

	def initialize(scaleInd, duration, mod=0)
		@scaleInd = scaleInd
		@duration = duration
		@mod = mod
	end

	attr_accessor :scaleInd
	attr_accessor :duration
	attr_accessor :mod
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

		# Make a new list of new notes
		for note in @original_notes do
			@notes.push(
				Note.new(note.scaleInd, note.duration, note.mod)
			)
		end
	end

	def initialize(key, scale_name, notes)
		@key = key
		@scale_name = scale_name
		@original_notes = notes
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
		end
		
		restore_original_notes()
		initialize_keys()
	end

	def key=(value)
		@key = value
		initialize_keys()
	end

	def key
		@key
	end

	attr_accessor :notes
	attr_accessor :scale_name
	attr_reader :keys
end
