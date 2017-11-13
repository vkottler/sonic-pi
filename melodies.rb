MELODY1 = Melody.new(
	STARTING_M_KEY, STARTING_SCALE, [
		Note.new(nil, 4.5),
		Note.new(0, 0.5),
		Note.new(2, 1.0),
		Note.new(3, 0.5),
		Note.new(2, 0.5),
		Note.new(1, 2.0)
	]
)

MELODY2 = Melody.new(
	STARTING_M_KEY, STARTING_SCALE, [
		Note.new(nil, 3.5),
		Note.new(0, 0.5),
		Note.new(2, 0.5),
		Note.new(3, 0.5),
		Note.new(6, 0.5),
		Note.new(5, 0.5),
		Note.new(4, 0.5),
		Note.new(3, 2.0)
	]
)

MELODY3 = Melody.new(
	STARTING_M_KEY, STARTING_SCALE, [
		Note.new(nil, 0.5),
		Note.new(-3, 3.5),
		Note.new(0, 0.25),
		Note.new(2, 0.25),
		Note.new(0, 0.5),
		Note.new(2, 0.5),
		Note.new(4, 0.5),
		Note.new(3, 2.0)
	]
)

MELODY4 = Melody.new(
	STARTING_M_KEY, STARTING_SCALE, [
		Note.new(nil, 3.0),
		Note.new(-2, 0.5, 1), # Ab -> A!
		Note.new(0, 0.5),
		Note.new(2, 0.5),
		Note.new(4, 0.5),
		Note.new(3, 0.5),
		Note.new(2, 0.5),
		Note.new(0, 0.5)
	]
)

MELODY1_ALT = Melody.new(
	STARTING_M_KEY, STARTING_SCALE, [
		Note.new(nil, 6.0),
		Note.new(3, 0.5),
		Note.new(2, 0.5),
		Note.new(1, 2.0)
	]
)

MELODY2_ALT = Melody.new(
	STARTING_M_KEY, STARTING_SCALE, [
		Note.new(nil, 5.0),
		Note.new(6, 0.5),
		Note.new(5, 0.5),
		Note.new(4, 0.5),
		Note.new(3, 2.0)
	]
)

MELODY3_ALT = Melody.new(
	STARTING_M_KEY, STARTING_SCALE, [
		Note.new(nil, 4.5),
		Note.new(-3, 1.0),
		Note.new(2, 0.5),
		Note.new(0, 2.0)
	]
)

MELODY4_ALT = Melody.new(
	STARTING_M_KEY, STARTING_SCALE, [
		Note.new(nil, 3.0),
		Note.new(-1, 0.75),
		Note.new(0, 0.25),
		Note.new(1, 0.25),
		Note.new(2, 0.25),
		Note.new(3, 0.5),
		Note.new(2, 0.25),
		Note.new(3, 0.25),
		Note.new(4, 1.0)
	]
)

MELODY_RIFFS = [
	MELODY1, MELODY2, MELODY3, MELODY4,
	MELODY1_ALT, MELODY2_ALT, MELODY3_ALT, MELODY4_ALT,
	MELODY1, MELODY2, MELODY3, MELODY4,
	MELODY1_ALT, MELODY2_ALT, MELODY3_ALT, MELODY4_ALT
]
