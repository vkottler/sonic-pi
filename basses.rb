BASS1 = Melody.new(
	STARTING_B_KEY, STARTING_SCALE, [
		Note.new(0, 1.0),
		Note.new(2, 1.0),
		Note.new(4, 1.5),
		Note.new(4, 3.5),
		Note.new(nil, 1.0)
	]
)

BASS2 = Melody.new(
	STARTING_B_KEY, STARTING_SCALE, [
		Note.new(-1, 1.0),
		Note.new(1, 1.0),
		Note.new(4, 3.0),
		Note.new(3, 3.0)
	]
)

BASS3 = Melody.new(
	STARTING_B_KEY, STARTING_SCALE, [
		Note.new(-3, 1.0),
		Note.new(0, 1.0),
		Note.new(2, 3.0),
		Note.new(3, 3.0)
	]
)

BASS4 = Melody.new(
	STARTING_B_KEY, STARTING_SCALE, [
		Note.new(-4, 1.0),
		Note.new(0, 1.0),
		Note.new(3, 1.5),
		Note.new(4, 4.5)
	]
)

BASS1_ALT = Melody.new(
	STARTING_B_KEY, STARTING_SCALE, [
		Note.new(0, 1.0),
		Note.new(2, 1.0),
		Note.new(4, 1.5),
		Note.new(4, 1.0),
		Note.new(4, 0.5),
		Note.new(3, 2.5),
		Note.new(nil, 0.5)
	]
)

BASS2_ALT = Melody.new(
	STARTING_B_KEY, STARTING_SCALE, [
	 	Note.new(-1, 1.0),
		Note.new(1, 1.0),
		Note.new(4, 1.5),
		Note.new(4, 1.0),
		Note.new(4, 0.5),
		Note.new(3, 3.0)
	]
)

BASS3_ALT = Melody.new(
	STARTING_B_KEY, STARTING_SCALE, [
		Note.new(-3, 1.0),
		Note.new(0, 1.0),
		Note.new(2, 1.5),
		Note.new(2, 1.0),
		Note.new(2, 0.5),
		Note.new(3, 3.0)
	]
)

BASS4_ALT = Melody.new(
	STARTING_B_KEY, STARTING_SCALE, [
		Note.new(-4, 1.0),
		Note.new(0, 1.0),
		Note.new(3, 0.5),
		Note.new(3, 1.0),
		Note.new(4, 1.5), 
		Note.new(4, 2.0),
		Note.new(4, 0.5),
		Note.new(4, 0.5)
	]
)

BASS_RIFFS = [
	BASS1, BASS2, BASS3, BASS4,
	BASS1_ALT, BASS2_ALT, BASS3_ALT, BASS4_ALT,
	BASS1_ALT, BASS2_ALT, BASS3_ALT, BASS4_ALT,
	BASS1, BASS2, BASS3, BASS4,
]
