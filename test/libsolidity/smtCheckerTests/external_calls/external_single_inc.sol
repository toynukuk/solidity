pragma experimental SMTChecker;

abstract contract D {
	function d() external virtual;
}

contract C {
	uint x;
	uint y;
	D d;

	function inc() public {
		if (y == 1)
			x = 1;
		if (x == 0)
			y = 1;
	}

	function f() public {
		uint oldX = x;
		d.d();
		assert(oldX == x);
	}
}
// ----
// Warning 6328: (256-273): CHC: Assertion violation happens here.\nCounterexample:\nx = 1, y = 1, d = 0\n\n\n\nTransaction trace:\nconstructor()\nState: x = 0, y = 0, d = 0\ninc()\nState: x = 0, y = 1, d = 0\nf()
