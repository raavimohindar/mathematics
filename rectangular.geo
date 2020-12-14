// WR-90 0.9 Inches [22.86 mm] x 0.4 Inches [10.16 mm]
// Recommended Frequency Band: 8.20 to 12.40 GHz

//a		        = 22.86e-3;
//b		        = 10.16e-3;
//f	            = 12.4e9;

// WR-75 0.75 Inches [19.05 mm] x 0.375 Inches [9.525 mm]
// Recommended Frequency Band: 10.00 to 15 GHz
// a			= 19.05e-3;
// b			= 9.525e-3;
// f            = 15.0e9;

// WR-62 0.622 Inches [15.7988 mm] x 0.311 Inches [7.8994 mm]
// Recommended Frequency Band: 12.40 to 18 GHz

a	                	= 15.7988e-3;
b        	        	= 7.8994e-3;
f                   	= 15.0e9;

c		        		= 299792458;
lambda		        	= (c/f);
h		        		= lambda/12;

x                       = 0;
y                       = 0;
z1                      = 1.0e-3;
z2						= 2.0e-3;


aperture                = 1.0e-3;

Point(1)                = {x,   y,                 z1, h};
Point(2)                = {x+a, y,                 z1, h};
Point(3)                = {x+a, y+b,               z1, h};
Point(4)                = {x,   y+b,               z1, h};

Point(5)                = {x-aperture, y-aperture, z2, h};
Point(6)                = {a+aperture, y-aperture, z2, h};
Point(7)                = {a+aperture, b+aperture, z2, h};
Point(8)                = {x-aperture, b+aperture, z2, h};

Point(9)                = {x,   y,                 z2, h};
Point(10)               = {x+a, y,                 z2, h};
Point(11)               = {x+a, y+b,               z2, h};
Point(12)               = {x,   y+b,               z2, h};

Line(1)                 = {1, 2};
Line(2)                 = {2, 3};
Line(3)                 = {3, 4};
Line(4)                 = {4, 1};

Line(5)                 = {5, 6};
Line(6)                 = {6, 7};
Line(7)                 = {7, 8};
Line(8)                 = {8, 5};

Line(9)                 = {9,  10};
Line(10)                = {10, 11};
Line(11)                = {11, 12};
Line(12)                = {12,  9};

Line(13)                = {1,  9};
Line(14)                = {2, 10};
Line(15)                = {3, 11};
Line(16)                = {4, 12};

Line(17)                = {5,  9};
Line(18)                = {6, 10};
Line(19)                = {7, 11};
Line(20)                = {8, 12};


Extrude {0, 0, -2*z2} {Point{5}; Line{5}; Point{6}; Line{6}; Point{7}; Line{7}; Point{8}; Line{8};}


Curve Loop(1)           	= {3, 16, -11, -15};
Plane Surface(1)       		= {1};

Curve Loop(2)           	= {2, 15, -10, -14};
Plane Surface(2)       		= {2};

Curve Loop(3)           	= {1, 14, -9, -13};
Plane Surface(3)       		= {3};

Curve Loop(4)           	= {16, 12, -13, -4};
Plane Surface(4)       		= {4};

Curve Loop(5)            	= {3, 4, 1, 2};
Plane Surface(5)       		= {5};

Curve Loop(6)            	= {7, 20, -11, -19};
Plane Surface(6)       		= {6};

Curve Loop(7)            	= {6, 19, -10, -18};
Plane Surface(7)       		= {7};

Curve Loop(8)            	= {8, 17, -12, -20};
Plane Surface(8)       		= {8};

Curve Loop(9)            	= {17, 9, -18, -5};
Plane Surface(9)       		= {9};

Curve Loop(10)            	= {30, 34, 22, 26};
Plane Surface(10)       	= {10};

Physical Surface("port") 		= {5};
Physical Surface("waveguide") 	= {1, 2, 3, 4, 6, 7, 8, 9, 25, 29, 33, 37, 10};
