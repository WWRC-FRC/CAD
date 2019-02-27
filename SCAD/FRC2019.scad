$HexToRScale        = 1.23607;
$CargoDiameter      = 13;
$BallClearance      = 2;
$HatchOuterDiameter = 19;
$HatchInnerDiameter = 6;
$HatchThickness     = 3/16;
$PlatformHeight     = 19;
$DriveWheelDiameter = 6;

$CargoColor = [0.7, 0.7, 0.7];
$HatchColor = [0.7, 0.9, 0.2, 0.5];
$SpringColor = [0.8, 0.8, 0.8, 0.7];
$BracketColor = [0.9, 0.7, 0.9, 0.9];
$LinkageColor = [0.8, 0.8, 0.8, 0.7];
$PlateColor = [0.2, 0.7, 0.3, 0.7];
$IntakeWheelColor = [.6, .2, .2];

//Main frame and bumper parameters
$BumperDepth = 3.5;
$DriveFrameSize      = [28, 28.5, 3];//left/right, front/back, top/bottom
$DriveFrameSizeInner = [$DriveFrameSize[0] - 6, $DriveFrameSize[1] - 6, $DriveFrameSize[2] + 0.05];
$BumperSize          = [$DriveFrameSize[0] + ($BumperDepth * 2), $DriveFrameSize[1] + ($BumperDepth * 2), 5];
$BumperBounds        = [$BumperSize[0], $BumperSize[1], 48];
$MaxBounds           = [$DriveFrameSize[0] + 30, $DriveFrameSize[1] + 30, 48];
$StartBounds         = [$DriveFrameSize[0], $DriveFrameSize[1], 48];
$FrontGap            = $DriveFrameSize[0] - 12;

//Lifter physical parameters and placement
$LifterSpacing        = 12;//Spacing between vertical lifter supports
$LifterSectionHeight  = 48;//Length of main lifter sections
$LifterVOffset        = 2;//Lifter vertical distance from the ground
$LifterHOffset        = 5;//Distance of back of lifter from front of robot
$LifterCarriageHeight = 9;//Height of carriage mechanism
$RearLifterSpacing    = 20;

$Clearance   = 0.013;//Extra spacing around bar
$LatchLength = 1.0;//Horizontal length of the latch
$BlockDepth  = 1.8;//Attack block depth, i.e. amount block wraps around the bar
$BlockHeight = 1.5;//Vertical height, i.e. thickness of arm wrap attach
$PinDiameter = (4/16) + 0.015;//Diameter of the pin hole
$PinOffset   = 0.5;//Pin position from the leading edge of the block

//Intake 3 parameters
$LowerPlateWidth = 3.5;
$OpeningCenters = $CargoDiameter + 1.0 + $BallClearance; //Ball, 1" gap, 1" support
$IntakeWheelDiameter = 4;                                //Diameter of the intake wheels
$UpperWheelClearance = 0.5;                              //Clearance between intake wheels and top intake horizontal support beam
$Compliance = 1;                                         //Amount that the intake wheels will compress a ball
$IntakeDepth = 2;                                        //Total distance past the center point of the ball to pull in the ball
$ArmSpacing = 5;                                         //Spacing between each of the 2 horizontal arms
$IntakeWheelOffset = $CargoDiameter + ($IntakeWheelDiameter / 2) - $Compliance;//Height from floor of the wheel mount shaft
$ArmLength = ($CargoDiameter / 2) + $IntakeDepth;        //Length of the articulating arm segments centers
$FrontRiserLength = $CargoDiameter + $IntakeWheelDiameter + $UpperWheelClearance  - $Compliance;//Height (length) of the front intake support
$LifterWheelDiameter = 2;                                //Lifter wheel diameter.
$LifterSprocketDiameter = 1.5;
$LifterWheelOffset = 0.5;
$LowerArmVOffset = 7;												             //Height of the lower arm center off the ground.Designed to align with lifter wheels

//Animation variables
$CargoSensorAngle = 10;
$LifterAngle  = 0;
$LifterHeight = 19;
$PinPosition = 0;//Pin insertion position
$RearLifterHeight = 10;
$IntakeAngle  = 10;
$LatchSupportAngle = 7;

$IntakeAngle  = 0;
$LatchSupportAngle = 31;


////////////////////////////////////////////////////////////////////
//  Current working options...
////////////////////////////////////////////////////////////////////
//IntakeV3();
RobotV4();
//StartBoundsCheck();
//translate([-11, 0, 0])
//	rotate(90, [0, 0, 1])
//		HeightTemplates();
//RearLifterV2();

//VisionTest();

////////////////////////////////////////////////////////////////////
//  3D printed parts
////////////////////////////////////////////////////////////////////
//ArmLatch();
//UltrasonicHousingPrint();

////////////////////////////////////////////////////////////////////
//  Sub-assemblies
////////////////////////////////////////////////////////////////////
//Lifter();
//LinearLifter();
//HatchGrabber();
//IntakeWheels();
//RobotBaseSimple();

////////////////////////////////////////////////////////////////////
//  Possibilities
////////////////////////////////////////////////////////////////////
//Level3LiftV1();
//Level3LiftV2();

////////////////////////////////////////////////////////////////////
//  Helpers
////////////////////////////////////////////////////////////////////
//Hatch();
//Cargo();	
//BumperChunk();
//StartBoundsCheck();
//Bolt($Length = 4, $Diameter = 1/4)
//FlatLBracket($L = 2.5, $W = 0.5);
//FlatPlate($L = 2.5, $W = 0.5);
//LBracket($L = 2.5, $W = 0.5);
//CornerBracket($L = 2.5, $W = 0.5);
//HatchHook();
//WireBox();
//Tube($W = 2, $T = 1, $L = 1, $HoleDiameter = 1/4, $Holes[], $Center = 0);
//WheelSet();
//HeightTemplates();
//VBearing();

////////////////////////////////////////////////////////////////////
//  No longer used
////////////////////////////////////////////////////////////////////
//$HookAngle = 0;
//$GripperArmAngleHatchCapture = 9;
//$GripperArmAngleCargoCapture = 0;
//$ArmAngle = 10;
//$RearLifterShortLength = 10;
//$RearLifterLongLength = 24;
//$RearLifterFulcrumPoint = 10;
//Triangle A
//$RearLifterTravelWidth = 22;
//$RearLifterTravelHeight = -0;
//$RearLifterHOffset = 12;
//$RearLifterVOffset = 4;
//$GripperPolygon1 = [[-1, 0], [-3, 3], [-3, 8], [-2, 10], [-1.3, 10.5], [0, 10], [-1, 8], [-1, 4], [1, 0], [0, -4.5], [-.5, -4.5]];
//$GripperPolygon2 = [[-1, 0], [-3, 3], [-2.4, 8.25], [-1, 8], [-1, 4], [1, 0], [0, -4.5], [-.5, -4.5]];
//$GripperThickness = 3/16;
//$GripperSpacing = 5.5;
//$WristShaftDiameter = 1.5;
//$GantryHeight = 40;
//$ExtensionLength = 38;
//$WristShaftColor = [0.5, 0.48, 0.34];
//$WristPlateColor = [0.5, 0.7, 0.6];
//$BallGuideColor = [0.5, 0.5, 0.6];
//$CylinderColor = [0.8, 0.8, 0.8, 0.9];
//CargoCapture();
//HatchCapture();
//EmptyCapture();
//CheckAll();
//Robot2();
//Robot3();
//Test();
//CheckAll();
//CheckBox();
//GantryArmSet();
//Robot1();

//Triangle functions
//Return 3rd side for side_angle_side triangle
function Triangle_SAS_S() = sqrt((pow($L1, 2)) + (pow($L2, 2)) - (2 * $L1 * $L2 * cos($A)));
//Return included angle given 3 sides
function Triangle_SSS_A() = acos((pow($A1 , 2) + pow($A2, 2) - pow($O, 2)) / (2 * $A1 * $A2));

////////////////////////////////////////////////////////////////////
//  Test
////////////////////////////////////////////////////////////////////

module VisionTest()
{
//	color("WHITE")
	Rocket();
}

module UltrasonicHousingPrint()
{
	scale(25.4)
	{
	rotate(180, [0, 1, 0])
		UltrasonicSensorMountFront();

	translate([0, 1.3, -.58])
	rotate(180, [1, 0, 0])
	UltrasonicSensorMountBackPlate();
	}
}

module UltrasonicSensorMountBackPlate()
{
  translate([0, -0.05, 0])
    difference()
    {
      translate([0, 0.02, 0])
      cube([2.1 + 0.2, 1.16 + 0.1, .2], center = true);
      translate([0, -0.05, -0.1])
        cube([2.1 + 0.01, 1.2 + 0.03, .2], center = true);
      translate([0, -0.27, 0])
        cube([0.6, .25, .5], center = true);
    }
    translate([0, -0.78, 0.05])
      cube([2.1 + 0.2, 0.24, .1], center = true);
}

module UltrasonicSensorMountFront()
{
  difference()
  {
    //Main block
    translate([0, -0.1, (.68 / 2)])
      cube([2.1, 1.2, .68], center = true);
    //Cut out the sensor
    translate([0, 0, 0.07])
      UltrasonicSensor();
  }
  difference()
  {
    //Mounting base
    translate([0, -0.8, (.68 / 2)])
      cube([4, .2, .68], center = true);
    //Mounting holes
    translate([1.5, -.5, (.68 / 2)])
      rotate(90, [1, 0, 0])
        cylinder(d = 1/4, h = 1, $fn = 40, center = true);
    translate([-1.5, -.5, (.68 / 2)])
      rotate(90, [1, 0, 0])
        cylinder(d = 1/4, h = 1, $fn = 40, center = true);
  }
}

module UltrasonicSensor()
{
  //PCB
  cube([1.95, .88, 0.15], center = true);
  //Transducer 1
  translate([1.02 / 2, 0, 0.145 / 2])
  {
    cylinder (d = .63 + 0.017, h = .49, $fn = 50);
    //Openings
    cylinder (d = 0.56, h = 1, $fn = 50);
  }
  //Transducer 2
  translate([-1.02 / 2, 0, 0.145 / 2])
  {
    cylinder (d = .63 + 0.017, h = .49, $fn = 50);
    //Openings
    cylinder (d = 0.56, h = 1, $fn = 50);
  }
  //Cyrstal
  translate([0, (.88 - .255) / 2, (0.15 / 2) + (0.15 / 2)])
    cube([0.55, .255, .15], center = true);
  //Connector
  translate([0, -(.88 - .255) / 2, (0.15 / 2) + (0.15 / 2)])
    cube([0.55, .255, .15], center = true);
}

module RearLifterSide()
{
	//Slider rail, fixed
	translate([-1, -1/8, 0])
		cube([2, , 24]);
	//Slider rail, moving inner
	translate([-1, -2/8, -$RearLifterHeight / 2])
		cube([2, (1/8) - 0.05, 24]);
	//Slider rail, moving outer
	translate([-1, -3/8, -$RearLifterHeight])
		cube([2, (1/8) - 0.05, 24]);
	//Supports
	//Vertical
	translate([0, 0.5, 2])
		Tube($L = 23, $W = 1);
	//Base
	translate([-2, 0.5, 1])
		rotate(90, [0, 1, 0])
			Tube($L = 6, $W = 2);
	//Cable guide
	translate([1.5, 1.3, 1])
		rotate(90, [1, 0, 0])
		{
			Bolt($Length = 2.5  , $Diameter = 3/8);
			translate([0, 0, 1.3])
				Bolt($Length = 0  , $Diameter = 3/8);
			translate([0, 0, 1.6])
				Bolt($Length = 0  , $Diameter = 3/8);
			translate([0, 0, 1.9])
			VBearing();
		}
}

module RearLifterV2()
{
	//Sides
	translate([0, $RearLifterSpacing / 2, 0])
		RearLifterSide();
	mirror([0, 1, 0])
		translate([0, $RearLifterSpacing / 2, 0])
			RearLifterSide();
	//Actuator shaft
	translate([3, -0.5, 1])
		rotate(90, [1, 0, 0])
			HexShaft($D = 0.5, $L = $RearLifterSpacing + 3, $Center = true);
	//Lower support
	translate([3, 0, 2.5])
		rotate(90, [1, 0,0])
			Tube($W = 2, $L = $RearLifterSpacing + 2, $Center = 1);
	//Upper support
	translate([0, 0, 25.5])
		rotate(90, [1, 0,0])
			Tube($W = 1, $L = $RearLifterSpacing + 2, $Center = 1);
	//Motor
	translate([3, -($RearLifterSpacing / 2) - 1, 4.25])
		rotate(-90, [1, 0, 0])
		{
			cylinder(d = 2.5, h = 4, $fn = 50);
			translate([0, 0, -1])
				cylinder(d = 3/8, h = 5, $fn = 50);
		}
}

module VBearing($ID = 3/8, $OD = 1.2, $T = 3/8)
{
	difference()
	{
		union()
		{
			color("SILVER")
			{
				translate([0, 0, 0 * ($T / 4)])
					cylinder(d1 = $OD - .3, d2 = $OD, h = $T / 4, $fn = 50);
				translate([0, 0, 1 * ($T / 4)])
					cylinder(d2 = $OD - .3, d1 = $OD, h = $T / 4, $fn = 50);
				translate([0, 0, 2 * ($T / 4)])
					cylinder(d1 = $OD - .3, d2 = $OD, h = $T / 4, $fn = 50);
				translate([0, 0, 3 * ($T / 4)])
					cylinder(d2 = $OD - .3, d1 = $OD, h = $T / 4, $fn = 50);
			}
			color("BLACK")
				translate([0, 0, -0.01])
					cylinder(d = $ID + 0.2, h = $T + 0.02, $fn = 50);
		}
		translate([0, 0, -0.02])
			cylinder(d = $ID, h = $T + 0.04, $fn = 50);
	
	}
}

module BumperChunk()
{
	$FrameWidth = $DriveFrameSize[0];
	translate([-3.6 - 6, -10 - ($FrameWidth / 2) + 6, 0])
		cube([3.6, 10, 5]);
}


function LifterArmOffset() = [-((cos($IntakeAngle)) * ($ArmLength)) + 0.5, 0, ((sin($IntakeAngle)) * ($ArmLength))];

module StartBoundsCheck()
{
	translate([0, $StartBounds[0] / 2, 0])
		color([0.2, 0.5, 0.7, 0.5])
			rotate(-90, [0, 0, 1])
				cube($StartBounds);
}

module RobotV4()
{
	{
		rotate(90, [0, 0, 1])
			translate([0, -($DriveFrameSize[1] / 2), 0])
				RobotBaseSimple();
    //Main intake lifter
		translate([$LifterHOffset, 0, $LifterVOffset])
			rotate($LifterAngle, [0, 1, 0])
				Lifter();
    //Platform rear lifter
    translate([26, 0, 4.5])
      rotate(180, [0, 0, 1])
        RearLifterV2();
	}
}

module ArmLatch()
{
  ArmLatchCap();
  ArmLatchBody();
}

module ArmLatchCap()
{
	translate([-$LatchLength / 2, 0, -$BlockHeight / 2])
	{
		//Latch pin cap
			translate([0, 1.1 + $PinPosition, 0])
			difference()
			{
				//Main cap body
				cube([$LatchLength, 0.3, $BlockHeight]);
				//Pin hex head capture
				translate([$LatchLength / 2, 0.15, $BlockHeight / 2])
					rotate(90, [1, 0, 0])
						cylinder(d = 0.64 + 0.05, h = 1/4, $fn = 6);
				//'spring' guides
				translate([$LatchLength / 2, 0.25, 0])
					rotate(50, [1, 0, 0])
						cube([.3, 1, .3], center = true);
				translate([$LatchLength / 2, 0.25, $BlockHeight])
					rotate(-50, [1, 0, 0])
						cube([.3, 1, .3], center = true);
			}
    }
}

module ArmLatchBody()
{
	translate([-$LatchLength / 2, 0, -$BlockHeight / 2])
	{
		difference()
		{
			//Main block
			translate([0, -($BlockDepth - 1), 0])
				cube([$LatchLength, $BlockDepth, $BlockHeight]);
			//Channel guide
			translate([-0.005, -2, ($BlockHeight / 2) - ((1 + $Clearance) / 2)])
				cube([$LatchLength + .2, 2, 1 + $Clearance]);
			//Chamfers
			//cube
			//Pin hole
			translate([$PinOffset, -0.005, 1.5/2])
				rotate(-90, [1, 0, 0])
					cylinder(d = $PinDiameter, h = 2, $fn = 50);
		}
/*		translate([$PinOffset, $PinPosition + 1.25, $BlockHeight/2])
			rotate(90, [1, 0, 0])
			{
				//Craft a machined pin
				Bolt($Length = 3.5  , $Diameter = 4/16);
				Bolt($Length = 2.0, $Diameter = 3/8);
			}
*/
		}
}

module Bolt($Length = 4, $Diameter = 1/4)
{
	color($SpringColor)
	{
		cylinder(d = $Diameter, h = $Length, $fn = 40);
		cylinder(d = $Diameter + (3/8), h = 1/4, $fn = 6);	
	}
}

module Lifter()
{
	LinearLifterOuter();//Outer fixed section
	translate([0, 0, ($LifterHeight / 2) - $LifterVOffset + 2])
		LinearLifterInner();
	translate([0, 0, $LifterHeight - $LifterVOffset])
	{
		translate([0, 0, 3])
			LinearLifterCarriage();
		translate([-4, 0, 0])
			IntakeV3();
	}
}

module LinearLifterCarriage()
{
	//Move so back corner is the rotation/refereence point
	translate([-1, 0, 1])
	{
		//Sides
		translate([0, ($LifterSpacing / 2) - 2.2, 0])
			Tube($L = $LifterCarriageHeight);
		translate([0, -($LifterSpacing / 2) + 2.2, 0])
			Tube($L = $LifterCarriageHeight);
		//Top
		translate([0, 0, $LifterCarriageHeight - 0.5 - 1])
			rotate(90, [1, 0, 0])
				translate([0, 0, -($LifterSpacing - 5.4)/ 2])
					Tube($L = $LifterSpacing - 5.4);
		//Bottom
		translate([0, 0, -0.5 + 1])
			rotate(90, [1, 0, 0])
				translate([0, 1, -($LifterSpacing - 5.4)/ 2])
					Tube($L = $LifterSpacing - 5.4);
	}
}


module LinearLifterInner()
{
	//Move so back corner is the rotation/refereence point
	translate([-1, 0, 1])
	{
		//Sides
		translate([0, ($LifterSpacing / 2) - 1.1, 0])
			Tube($L = $LifterSectionHeight);
		translate([0, -($LifterSpacing / 2) + 1.1, 0])
			Tube($L = $LifterSectionHeight);
		//Top
		translate([0, 0, $LifterSectionHeight - 0.5])
			rotate(90, [1, 0, 0])
				translate([0, 0, -($LifterSpacing - 3.2)/ 2])
					Tube($L = $LifterSpacing - 3.2);
		//Bottom
		translate([0, 0, -0.5])
			rotate(90, [1, 0, 0])
				translate([0, 1, -($LifterSpacing - 3.2)/ 2])
					Tube($L = $LifterSpacing - 3.2);
	}
}

module LinearLifterOuter()
{
	//Move so back corner is the rotation/refereence point
	translate([-1, 0, 1])
	{
		//Sides
		translate([0, ($LifterSpacing / 2), 0])
			Tube($L = $LifterSectionHeight);
		translate([0, -($LifterSpacing / 2), 0])
			Tube($L = $LifterSectionHeight);
//		//Top
//		translate([0, 0, $LifterSectionHeight - 0.5])
//			rotate(90, [1, 0, 0])
//				translate([0, 0, -($LifterSpacing - 1)/ 2])
//					Tube($L = $LifterSpacing - 1);
		//Bottom
		translate([0, 0, -0.5])
			rotate(90, [1, 0, 0])
				translate([0, 0, -($DriveFrameSize[0] - 1)/ 2])
					Tube($L = $DriveFrameSize[0] - 1);
	}
}

module IntakeV3()
{		
	//Side segments
	translate([0, $OpeningCenters / 2 , 0])
		Intake3Side();	
	mirror([0, 1, 0])
		translate([0, $OpeningCenters / 2 , 0])
			Intake3Side();	
	
	//Intake wheels and grabber
	translate(LifterArmOffset() + [0, 0, $IntakeWheelOffset])
	{
		IntakeWheels($OpeningCenters, $IntakeWheelDiameter);
		translate([0, 0, ($IntakeWheelDiameter / 2) + $UpperWheelClearance])
			HatchGrabber();
	}
	
	//Lower plate 
	color($PlateColor)
		translate(LifterArmOffset() + [-1, -($OpeningCenters + 1) / 2, -3/16])
			LowerPlate();

	echo ("Lower plate ", $LowerPlateWidth, $OpeningCenters + 1);

	//Back plate
	color($PlateColor)
		translate([0.5, -($OpeningCenters + 1)/ 2, $LowerArmVOffset - 0.5 - 2])
			cube([3/16, $OpeningCenters + 1, $ArmSpacing + 1 + 2]);
	echo ("Back plate ", $OpeningCenters + 1, $ArmSpacing + 1);

	IntakeV3SupportBrackets();

	//Lift attach spacers
	translate([1 + (3/16), 0, $LowerArmVOffset - 0.5 - 2])
	{
		Tube($L = $ArmSpacing + 1 + 2, $W = 1);
		translate([0, 3, 0])
			Tube($L = $ArmSpacing + 1 + 2, $W = 1);
		translate([0, -3, 0])
			Tube($L = $ArmSpacing + 1 + 2, $W = 1);
	}
	
	//Ball sensor flap
	translate([0.5, -1.5, $LowerArmVOffset + $ArmSpacing + 0.5])
		rotate(180 + $CargoSensorAngle, [0, 1, 0])
		{
			//Main back plate
			cube([(3/16), 3, $ArmSpacing + 1 + 2]);
			//Capture guide & sensor flag
			translate([0, ((2.5) / 2) - 1, $ArmSpacing + 1 + 2 + (3/16)])
				rotate(-90, [0, 1, 0])
					LBracket($L = 2.5, $W = 0.5);
		}
	//Flap 'springs'
	translate([0.5-(sin($CargoSensorAngle) * ($ArmSpacing + 1 + 2)), -1.5, $LowerArmVOffset - 0.5 - 2 + ((1 - cos($CargoSensorAngle)) * ($ArmSpacing + 1 + 2))])
		color("BLACK")
			rotate(-10, [0,0, 1])
				rotate(75, [1, 0, 0])
					cylinder(d = 1/6, h = 7.5, $fn = 20);
	mirror([0, 1, 0])
	translate([0.5-(sin($CargoSensorAngle) * ($ArmSpacing + 1 + 2)), -1.5, $LowerArmVOffset - 0.5 - 2 + ((1 - cos($CargoSensorAngle)) * ($ArmSpacing + 1 + 2))])
		color("BLACK")
			rotate(-10, [0,0, 1])
				rotate(75, [1, 0, 0])
					cylinder(d = 1/6, h = 7.5, $fn = 20);
	
}

module LowerPlate()
{
	difference()
	{
		cube([$LowerPlateWidth, $OpeningCenters + 1, 3/16]);
		translate([2, 0, -0.05])
			rotate(-25, [0, 0, 1])
				cube([10, 10, 1]);
		translate([2, $OpeningCenters + 1, -0.05])
			rotate(-90+25, [0, 0, 1])
				cube([10, 10, 1]);
	}
}

module LatchLockArm()
{
	difference()
	{
		cube([11.0, 3/16, 1]);
		translate([10.05, 0, -0.5])
		{
			translate([-0.1, -0.1, -0.6])
				rotate(-35, [0, 1, 0])
					cube([1, 1, 1]);
			rotate(20, [0, 1, 0])
				rotate(90, [1, 0, 0])
					hull()
					{
						cylinder(d = 0.28, h = 1, $fn = 20, center = true);
						translate([0, 1, 0])
							cylinder(d = 0.28, h = 1, $fn = 20, center = true);
					}
			translate([0.2, 0, 0.945])
				rotate(90, [1, 0, 0])
					hull()
					{
						cylinder(d = 0.28, h = 1, $fn = 20, center = true);
						translate([0.1, 0, 0])
							cylinder(d = 0.28, h = 1, $fn = 20, center = true);
					}
		}
	}
}

module Intake3Side()
{
	//Latch catch
	translate(LifterArmOffset() + [-0.5, 1.5, $LowerArmVOffset])
		rotate(-$LatchSupportAngle, [0, 1, 0])
			translate([-0.5, 0, -0.5])
				LatchLockArm();
	//Back support
	translate([0, 0, $LowerArmVOffset - 0.5])
		Tube($W = 1, $L = $ArmSpacing + 1, $Holes = [[0.5, 0], [$ArmSpacing + 0.5, 0]]);

	//Upper support arm
	translate([0, 1, $LowerArmVOffset + $ArmSpacing])
		rotate(-90 + $IntakeAngle, [0, 1,0])
		{
			translate([0, 0, -0.5])
				Tube($W = 1,$L = $ArmLength + 1, $Holes = [[0.5, 0], [$ArmLength + 0.5, 0], [$ArmLength - 0.5, 0]]);
//			//Arm pin locks
//			translate([0, 0.5, $ArmLength - 1])
//				rotate(90, [0, 1, 0])
//					ArmLatch();
		}

	//Lower support arm
	translate([0, 1, $LowerArmVOffset])
		rotate(-90 + $IntakeAngle, [0, 1,0])
		{
			translate([0, 0, -0.5])
			{
				Tube($W = 1,$L = $ArmLength + 1, $Holes = [[0.5, 0], [$ArmLength + 0.5, 0], [$ArmLength - 0.5, 0]]);
			}
//			//Arm pin locks
//			translate([0, 0.5, $ArmLength - 1])
//				rotate(90, [0, 1, 0])
//					ArmLatch();
		}

	//Front support
	translate(LifterArmOffset())
	{
		//Main support
		Tube($L = $FrontRiserLength, $Holes = [[$LowerArmVOffset, -0.5], [$LowerArmVOffset, +0.5], [$ArmSpacing + $LowerArmVOffset, -0.5], [$ArmSpacing + $LowerArmVOffset, +0.5], [$IntakeWheelOffset, 0], [$LifterWheelOffset, -0.5]]);
		translate([-0.5, 1, $LifterWheelOffset])
		{
			rotate(90, [1, 0, 0])
			{
				//Lifter wheel
			color($IntakeWheelColor)
				difference()
				{
					cylinder(d = $LifterWheelDiameter, h = 1, $fn = 40, center = true);
					cylinder(d = 3/8, h = 1.01, $fn = 40, center = true);
				}
				color($LinkageColor)
				translate([0, 0, -0.7])
					cylinder(d = $LifterSprocketDiameter, h = 3/16, $fn = 40, center = true);
			}
		}
	}	
}

module IntakeV3SupportBrackets()
{
	//Back
	translate(LifterArmOffset())
	{
		translate([1, (-($OpeningCenters - 1) / 2) - .7, $IntakeWheelOffset + 3.3])
			rotate(-90, [1, 0, 0])
				FlatLBracket();
		mirror([0, 1, 0])
			translate([1, (-($OpeningCenters - 1) / 2) - .7, $IntakeWheelOffset + 3.3])
				rotate(-90, [1, 0, 0])
					FlatLBracket();
	
		//Front
		translate([-1 - (3/16), (-($OpeningCenters - 1) / 2) - .7, $IntakeWheelOffset + 3.3])
			rotate(-90, [1, 0, 0])
				FlatLBracket();
		mirror([0, 1, 0])
			translate([-1 - (3/16), (-($OpeningCenters - 1) / 2) - .7, $IntakeWheelOffset + 3.3])
				rotate(-90, [1, 0, 0])
					FlatLBracket();

		//Face bar supports
		translate([-2, 3, $IntakeWheelOffset + 3.5 + (3/16)])
			rotate(90, [0, 1, 0])
				FlatPlate();
		mirror([0, 1, 0])
			translate([-2, 3, $IntakeWheelOffset + 3.5 + (3/16)])
				rotate(90, [0, 1, 0])
					FlatPlate();

	//Bottom plate supports
	translate([0, -($OpeningCenters - 1) / 2, 0])
		rotate(-90, [0, 0, 1])
			LBracket();
	mirror([0, 1, 0])
		translate([0, -($OpeningCenters - 1) / 2, 0])
			rotate(-90, [0, 0, 1])
				LBracket();
	}
			
}

module FlatLBracket($L = 2.5, $W = 0.5)
{
	color($BracketColor)
	{
		cube([3/16, $W, $L]);
		cube([3/16, $L, $W]);
	}
}

module FlatPlate($L = 2.5, $W = 0.5)
{
	color($BracketColor)
	{
		cube([3/16, $W, $L]);
	}
}

module LBracket($L = 2.5, $W = 0.5)
{
	translate([-3/16, 0, 0])
		color($BracketColor)
		{
			cube([3/16, $W, $L]);
			translate([3/16, 0, 0])
				rotate(-90, [0, 1, 0])
					cube([3/16, $W, $L]);
		}
}

module CornerBracket($L = 2.5, $W = 0.5)
{
	translate([-3/16, 0, 0])
		color($BracketColor)
		{
			cube([3/16, $W, $L]);
			translate([3/16, 0, 0])
				rotate(-90, [0, 1, 0])
					cube([3/16, $W, $L]);
			translate([-$L, 0, 0])
			difference()
			{
				translate([3/16, 0, 3/16])
					cube([$L - (3/16), 3/16, $L - (3/16)]);
				translate([0, -0.02, 0])
					rotate(-45, [0, 1, 0])
						cube([$L * 1.5, 4/16, $L * 1.5]);

			}
		}
}

module HatchHook()
{ 
	color([.8, .8, .9])
	translate([-2 - (1/8) - (1/4) - (3/16), 0, 1])
	{
		rotate(-$HookAngle, [0, 1, 0])
		{
			cube([1/8, 1/2, 1.58]);
			translate([0, 0, 1.5])
				rotate(-20, [0, 1, 0])
					cube([1/8, 1/2, 1.5]);
			cube([3, 1/2, 1/8]);
		}
	}
}

module HatchGrabber()
{
	//Top mount
	translate([0, ($OpeningCenters + 1) / 2, 0.5])
		rotate(90, [1, 0, 0])
			Tube($L = $OpeningCenters + 1);
	//Top facing
	translate([-1.5 - (3/16), ($OpeningCenters + 1) / 2, .5])
		rotate(90, [0, 1, 0])
			rotate(90, [1, 0, 0])
				Tube($L = $OpeningCenters + 1, $W = 1);
	//Intake motor
	translate([0, -4, 2])
		rotate(90, [1, 0, 0])
			cylinder(d = 2, h = 4, $fn = 30);
	//Hatch Hook
	HatchHook();
}

module HexShaft($D = 0.5, $L = 5, $Center = false)
{
	color($LinkageColor)
		cylinder(d = $D * $HexToRScale, h = $L, $fn = 6, center = $Center);
}

module IntakeWheels()
{
	rotate(90, [1, 0, 0])
	{
		color($LinkageColor)
		{
			//Hex shaft
			cylinder(d = 1/2, h = $OpeningCenters + 4, $fn = 6, center = true);
			//Sprockets
			//Intake drive sprocket
			translate([0, 0, ($OpeningCenters / 2) + 1])
				cylinder(d = 2, h = 3/16, $fn = 40, center = true);
			//Wheel 1 drive sprocket
			translate([0, 0, ($OpeningCenters / 2) + 1.7])
				cylinder(d = 2, h = 3/16, $fn = 40, center = true);
			//Wheel 2 drive sprocket
			translate([0, 0, -($OpeningCenters / 2) - 1.7])
				cylinder(d = 2, h = 3/16, $fn = 40, center = true);
		}
		//Wheels
		color($IntakeWheelColor)
		{
			cylinder(d = $IntakeWheelDiameter, h = 1, $fn = 40, center = true);
			translate([0, 0, 2.5])
				cylinder(d = $IntakeWheelDiameter, h = 1, $fn = 40, center = true);
			translate([0, 0, -2.5])
				cylinder(d = $IntakeWheelDiameter, h = 1, $fn = 40, center = true);
			translate([0, 0, 5])
				cylinder(d = $IntakeWheelDiameter, h = 1, $fn = 40, center = true);
			translate([0, 0, -5])
				cylinder(d = $IntakeWheelDiameter, h = 1, $fn = 40, center = true);
		}
	}
}

module WireBox()
{
	$OutlineSize = 0.05;
	difference()
	{
		cube([$W, $T, $L], center = true);
		cube([$W - $OutlineSize, $T - $OutlineSize, $L + 0.1], center = true);
		cube([$W + 0.1,          $T - $OutlineSize, $L - $OutlineSize], center = true);
		cube([$W - $OutlineSize, $T + 0.1         , $L - $OutlineSize], center = true);
	}
}

module Tube($W = 2, $T = 1, $HoleDiameter = 1/4, $Center = 0)
{
	echo ($W,$T, $L, $Holes);

	translate([0, 0, -$Center * ($L / 2)])
	{
		color("BLACK")
			translate([0, 0, $L / 2])
				WireBox($W = $W + 0.01, $T = $T + 0.01, $L = $L + 0.01);
		
		color([0.7, 0.7, 0.7])
			difference()
			{
				translate([-$W/2, -$T/2, 0])
					cube([$W, $T, $L]);
				translate([0.1-$W/2, 0.1-$T/2, -0.05])
					cube([$W - 0.2, $T - 0.2, $L + 0.1]);
				for($HoleCoord=$Holes)
				{
					translate([$HoleCoord[1], 0, $HoleCoord[0]])
						rotate(90, [1, 0, 0])
	#						cylinder(d = $HoleDiameter, h = $T + 2.1, $fn = 20, center = true);
				}
			}
		}
}

module GrappleArm()
{
	translate([0, $GrappleYOffset, $GrappleZOffset])
	{
		rotate($GrappleAngle, [1, 0, 0])
		{
			TubeCenter($Length = $GrappleLongReach, $Hole1 = 1, $Hole2 = 1);
			translate([0, $GrappleLongReach, 0])
			{
				rotate(-90, [1, 0, 0])
					TubeCenter($Length = $GrappleShortReach, $Hole1 = 1, $Hole2 = 1);
				translate([0, 0, -$GrappleShortReach])
					rotate(90, [0, 1, 0])
					difference()
					{
						cylinder(d = $GrappleWheelDiameter, h = 1, $fn = 40, center = true);
						cylinder(d = 3/16, h = 1, $fn = 40, center = true);
					}
			}
		}
	}
}

module GrappleReachIndicators()
{
	//Add indicator for height of touch wheel
	if ($GrappleTotalHeight >= 0)
	{
		color([0.6, 0.2, 0.7, 0.3])
			translate([-0.5, -0.5 + 20, 0])
				cube([1, 1, $GrappleTotalHeight]);
	}
	else
	{
		color([0.9, 0.2, 0.3, 0.7])
			translate([-0.5, -0.5 + 20, 0])
				rotate(180, [1, 0, 0])
				cube([1, 1, -$GrappleTotalHeight]);
	}

	//Add indicator for wheel touch horizontal margin
	if ($HClearance >= 0)
	{
		color([0.2, 0.7, 0.2, 0.3])
			translate([-0.5, 20, $PlatformHeight])
				cube([1, $HClearance, 1]);
	}
	else
	{
		color([0.9, 0.2, 0.3, 0.7])
			translate([-0.5, 20, $PlatformHeight])
				rotate(180, [0, 0, 1])
					cube([1, -$HClearance, 1]);
	}
}

module RearLifter()
{
	$RearLifterTravelLength = sqrt(pow($RearLifterTravelWidth, 2) + pow($RearLifterTravelHeight, 2));

	$RearLifterTravelPosition = ($t - .65) * $RearLifterTravelLength * 1.6 ;
//	$RearLifterTravelPosition = 0;

	$RemainingTravel = $RearLifterTravelLength - $RearLifterTravelPosition;


	translate([0, $RearLifterHOffset, $RearLifterVOffset])
	{
		//Calculate TravelPosition anchor point
		//Triangle A
		//Calculate angle of travel 'ramp'
		$AAlpha = Triangle_SSS_A($A1 = $RearLifterTravelLength, $A2 = $RearLifterTravelWidth, $O = $RearLifterTravelHeight);
		//Calculate final angle (other angle is 90)
		$ABeta = 90 - $AAlpha;
		$ADelta = 90;
		//Now find distance from TP to level fulcrum (Triangle B)
		$RearLifterTravelSupportLength = Triangle_SAS_S($L1 = $RemainingTravel, $L2 = $RearLifterTravelHeight, $A = $ABeta);
		//Calculate remaining triangle B angles
		$BBeta  = $ABeta;
		$BAlpha = Triangle_SSS_A($A1 = $RemainingTravel, $A2 = $RearLifterTravelSupportLength, $O = $RearLifterTravelHeight);
		$BDelta = 180 - $BBeta - $BAlpha;
		//Now calculate triangle C parameters (only angles remain now)
		$CAlpha = Triangle_SSS_A($A1 = $RearLifterTravelSupportLength, $A2 = $RearLifterFulcrumPoint, $O = $RearLifterShortLength);
		$CBeta  = Triangle_SSS_A($A1 = $RearLifterShortLength, $A2 = $RearLifterTravelSupportLength, $O = $RearLifterFulcrumPoint);
		$CDelta = 180 - $CAlpha - $CBeta;

		//Calculate coordinates of travel fulcrum point (TP)
		$TPY = -$RearLifterTravelPosition * cos($AAlpha);
		$TPZ = $RearLifterTravelPosition * sin($AAlpha);

		//Render the linkages
		//Long pusher
		$PusherAngle = $BAlpha- $AAlpha + $CAlpha;
		translate([0, $TPY, $TPZ])
			rotate($PusherAngle + 180, [1, 0, 0])
				TubeCenter($Length = $RearLifterLongLength, $Hole1 = 1, $Hole2 = 1);
		//Short fulcrum pusher
		$LinkageAngle = $BDelta + $CBeta - 90;
		translate([0, -$RearLifterTravelWidth, 0])
			rotate(-$LinkageAngle, [1, 0, 0])
				TubeCenter($Length = $RearLifterShortLength, $Hole1 = 1, $Hole2 = 1);			
		//Render traval rail
		translate([0, 0, 1])
			rotate(180 - $AAlpha, [1, 0, 0])
				TubeCenter($Length = $RearLifterTravelLength);
	}	
}

module Level3LiftV2()
{
	$GrappleLongReach = 23;
	$GrappleShortReach = 7;
	$GrappleYOffset = 3;
	$GrappleZOffset = 8;
	$GrappleWheelDiameter = 4;
		
	//Animate the grapple angle
	
	$Animating = 1;
	$GrappleAngle = ($Animating == 1) ? (($t > 0.5) ? 90 - (($t - 0.5) * 180) : $t * 180) : 53;
	
	$LongHeight  = ($GrappleLongReach) * sin($GrappleAngle);
	$LongHReach  = ($GrappleLongReach) * cos($GrappleAngle);
	$ShortHeight = $GrappleShortReach * cos($GrappleAngle);
	$ShortReach  = $GrappleShortReach * sin($GrappleAngle);
	$GrappleReachHeight = $LongHeight - $ShortHeight - ($GrappleWheelDiameter / 2);
	$GrappleTotalHeight = $GrappleReachHeight + $GrappleZOffset;
	
	$VClearance = $GrappleTotalHeight - $PlatformHeight;
	$HClearance = $LongHReach + $ShortReach - ($BumperSize[0] / 2) + $GrappleYOffset;
	
	echo ("Long reach = ", $LongHReach);
	echo ("Short reach = ", $ShortReach);
	echo ("Wheel vertical clearance = ", $VClearance);
	echo ("Wheel horizontal clearance = ", $HClearance);

	GrappleReachIndicators();
	
	$RobotHeight = ($VClearance > 0) ? 0 : -$VClearance;
	
	
	translate([0, 0, $RobotHeight])
	{
	RearLifter();
		GrappleArm();
			
		//Add robot base for height indicator
		translate([0, 0, 3])
			translate([0, - (cos($FrontAngle) * ($FrontLeverLength - 1)), - cos($FrontAngle + 90) * ($FrontLeverLength - 1)])
				rotate($UpperPlateAngle, [1, 0, 0])
					translate([0, $PlateOffset, 1])
						RobotBaseSimple();
	}
		
		
	//Platform marker
	color([0.2, 0.8, 0.4, 0.5])
	translate([0, 45, $PlatformHeight / 2])
		cube([80, 50, $PlatformHeight], center = true);
}

module Test()
{
	$GripperType = 2;
	DoCapture($Item = 0, $Rotation = 0, $ItemOffset = 6.8);
	translate([25, 0, 0])
		DoCapture($Item = 1, $Rotation = 0, $ItemOffset = 9.5);
	translate([50, 0, 0])
		DoCapture($Item = -1, $Rotation = 0);
}

module CheckAll()
{
	Robot2();

	//Reach check
	translate([0, 15 + 30, 0])
	  Rocket();

	CheckBox($Bounds = $StartBounds);
	CheckBox($Bounds = $BumperBounds);
	CheckBox($Bounds = $MaxBounds);
}


module Robot3()
{
	$ArmAngle = 23;
  //Wheel base
  translate([-15, -15, 0])
    cube([30, 30, $BaseHeight]);
  //Intake
//	translate([0, -3.5, -3])
    translate([0, -1, 19])
      DoCapture($Item = 0, $Rotation = 0, $ItemOffset = 9.5);

	Level3Lift();

	CheckBox($Bounds = $BumperSize);
}

module CheckBox()
{
	color([0.5, 0, 0.2, 0.2])
		translate([0, 0, $Bounds[2] / 2])
		  cube([$Bounds[0], $Bounds[1], $Bounds[2]], center = true);
}

module TubeCenter()
{
	TubeX($Length = $Length + 1);
}

module TubeX()
{
	difference()
	{
		translate([-0.5, -0.5, -0.5])
			cube([1, $Length, 1]);
		if ($Hole1 == 1)
		{
			rotate(90, [0, 1, 0])
				cylinder(d = 1/8, h = 2, center = true, $fn = 20);
		}
		if ($Hole2 == 1)
		{
			rotate(90, [0, 1, 0])
				translate([0, $Length - 1])
					cylinder(d = 1/8, h = 2, center = true, $fn = 20);
		}
	}
}

module LifterPlate()
{
	$PlateLength = $LeverSpacing + 1;
	translate([0, 0.5, -1.0])
	{
		//BasePlate
		translate([0, -$PlateLength / 2, -1.5/16])
			cube([12, $PlateLength, 3/16], center = true);
		//Front lever support
		translate([0, -0.5, 0.5])
			rotate(90, [1, 0, 0])
				TubeX($Length = 1.5, $Hole2 = 1);
		//Rear lever support
		translate([0, -0.5 - $LeverSpacing, 0.5])
			rotate(90, [1, 0, 0])
				TubeX($Length = 1.5, $Hole2 = 1);
	}
}


module WheelSet()
{
	color("white")
	rotate(90, [0, 1, 0])
	{
		translate([0, -11, 0])
			cylinder(d = $DriveWheelDiameter, h = 1, $fn = 40, center = true);
		cylinder(d = $DriveWheelDiameter, h = 1, $fn = 40, center = true);
		translate([0, 11, 0])
			cylinder(d = $DriveWheelDiameter, h = 1, $fn = 40, center = true);
	}
}

module RobotBaseSimple()
{
    translate([0, 0, $DriveWheelDiameter / 2])
	difference()
	{
		union()
		{
			color([0.7, 0.2, 0.6, 0.5])
			difference()
			{
				cube($DriveFrameSize, center = true);
				cube($DriveFrameSizeInner, center = true);
			}
            translate([0, 0, 2])
 			color([0.3, 0.1, 0.5, 0.5])
            difference()
            {
				cube($BumperSize, center = true);
				cube($BumperSize - [2 * $BumperDepth, 2 * $BumperDepth, -1], center = true);
            }
			translate([13, 0, 0])
				WheelSet();
			translate([-13, 0, 0])
				WheelSet();
		}
		translate([0, 10, 0])
			cube([$FrontGap, 20, 30], center = true);
	}
}


module Level3LiftV1()
{
	//Set 1
	$RearLeverLength = 18;
	$FrontLeverLength = 19.5;
	$LowerLeverSpacing = 9;
	$PlateOffset = 5;

	//Set 2
	$RearLeverLength = 21.5;
	$FrontLeverLength = 22;
	$LowerLeverSpacing = 7;
	$PlateOffset = 7;


	//$FrontAngle = 50;
	$FrontAngle = ($t * 90);

	$UpperLeverSpacing = $LowerLeverSpacing + $RearLeverLength - $FrontLeverLength;
	
	//Calculate length between front upper and read lower mount points
	$CrossLength = sqrt(($LowerLeverSpacing * $LowerLeverSpacing) + ($FrontLeverLength * $FrontLeverLength) - (2 * $LowerLeverSpacing * $FrontLeverLength * cos($FrontAngle)));
	//Now calculate the lower front angle of the cross length
	$LowerAngle = acos((($LowerLeverSpacing * $LowerLeverSpacing) + ($CrossLength * $CrossLength) - ($FrontLeverLength * $FrontLeverLength)) / (2 * $CrossLength * $LowerLeverSpacing));
	//Now calculate the other angle segment of the rear lever to floor angle
	$LowerAngle2 = acos((($CrossLength * $CrossLength) + ($RearLeverLength * $RearLeverLength) - ($UpperLeverSpacing * $UpperLeverSpacing)) / (2 * $CrossLength * $RearLeverLength));
	$RearAngle = $LowerAngle + $LowerAngle2;
	//Now also calculate the upper plate angle
	$UpperLinkAngle = acos((($CrossLength * $CrossLength) + ($UpperLeverSpacing * $UpperLeverSpacing) - ($RearLeverLength * $RearLeverLength)) / (2 * $CrossLength * $UpperLeverSpacing));
	$UpperPlateAngle = $LowerAngle - $UpperLinkAngle; 

	echo ("Upper lever spacing = ", $UpperLeverSpacing);
	echo ("Cross length        = ", $CrossLength);
	echo ("Lower angle         = ", $LowerAngle);
	echo ("Lower angle2        = ", $LowerAngle2);
	echo ("RearAngle           = ", $RearAngle);
	echo ("UpperLinkAngle      = ", $UpperLinkAngle);
	echo ("UpperPlateAngle     = ", $UpperPlateAngle);

	translate([0, 0, 1.0])
	{
		//Lower lifter plate
		LifterPlate($LeverSpacing = $LowerLeverSpacing);
		//COG extention
		translate([0, -10, -1 - 1.5/16])
			cube([12, 20, 3/16], center = true);
		//Front lever
			rotate(180 - $FrontAngle, [1, 0, 0])
				TubeX($Length = $FrontLeverLength, $Hole1 = 1, $Hole2 = 1);
		//Rear lever
		translate([0, -$LowerLeverSpacing, 0])
			rotate($RearAngle, [1, 0, 0])
				TubeX($Length = $RearLeverLength, $Hole1 = 1, $Hole2 = 1);
		//Upper Plate
		translate([0, - (cos($FrontAngle) * ($FrontLeverLength - 1)), - cos($FrontAngle + 90) * ($FrontLeverLength - 1)])
			rotate($UpperPlateAngle, [1, 0, 0])
				mirror([0, 0, 1])
					LifterPlate($LeverSpacing = $UpperLeverSpacing);
		//Add robot base for height indicator
		translate([0, - (cos($FrontAngle) * ($FrontLeverLength - 1)), - cos($FrontAngle + 90) * ($FrontLeverLength - 1)])
			rotate($UpperPlateAngle, [1, 0, 0])
				translate([0, $PlateOffset, 1])
					RobotBaseSimple();
				}
	//Platform marker
	color([0.2, 0.8, 0.4, 0.5])
	translate([0, 45, 10])
		cube([80, 50, 20], center = true);
}

module Rocket()
{
	color([1.0, 1.0, 1.0])
	{
		RocketSideCargo();
		translate([15 + (cos(61) * 15), -sin(61) * 15, 0])
			rotate(-61, [0, 0,01])
				RocketSideHatch();
		mirror([1, 0, 0])
		translate([15 + (cos(61) * 15), -sin(61) * 15, 0])
			rotate(-61, [0, 0,01])
				RocketSideHatch();
	}
	//Floor
	color([102/256, 102/256, 102/256])
		cube([200, 200, 0.01], center = true);
	color([1.0, 1.0, 1.0])
		cube([2, 18, 0.02]);
}

module RocketSideCargo()
{
	//Cargo ports
	difference()
	{
		translate([-15, -0.5, 0])
			cube([30, 1, 110]);
		translate([0, 0, 27.5])
			rotate(90, [1, 0, 0])
				cylinder(d = 16, h = 1.1, $fn = 30, center = true);
		translate([0, 0, 27.5 + 28])
			rotate(90, [1, 0, 0])
				cylinder(d = 16, h = 1.1, $fn = 30, center = true);
		translate([0, 0, 27.5 + 28 + 28])
			rotate(90, [1, 0, 0])
				cylinder(d = 16, h = 1.1, $fn = 30, center = true);
	}
	color([1.0, 1.0, 1.0])
		cube([2, 18, 0.02]);
}

module HatchOpening()
{
	cylinder(d = $HatchOuterDiameter, h = 1.1, $fn = 30, center = true);
	cube([8, 25, 1.1], center = true);
}

module RocketSideHatch()
{
  //Hatch openings
	difference()
	{
		translate([-15, -0.5, 0])
			cube([30, 1, 110]);
    translate([0, 0, 19])
      rotate(90, [1, 0, 0])
        HatchOpening();
    translate([0, 0, 47])
      rotate(90, [1, 0, 0])
        HatchOpening();
    translate([0, 0, 75])
      rotate(90, [1, 0, 0])
        HatchOpening();
  }
	color([1.0, 1.0, 1.0])
		cube([2, 18, 0.02]);
}


module GantryArmSet()
{
  //Upper set
  translate([-0.5, 0.2, 1.8])
    rotate($Angle, [1, 0, 0])
      translate([-0.5, -0.5, -0.5])
        cube([1, 1, $ExtensionLength]);
  //Lower set
  translate([-0.5, -0.2, -1.8])
    rotate($Angle, [1, 0, 0])
      translate([-0.5, -0.5, -0.5])
        cube([1, 1, $ExtensionLength]);
  //Actuation sprocket
  translate([-1 - (3/16), 0, -1.8])
    rotate(90, [0, 1, 0])
      cylinder(d = 10, h = 3/16, $fn = 50, center = true);
}

module Robot2()
{
	$ArmAngle = 23;
  //Wheel base
  translate([-15, -15, 0])
    cube([30, 30, $BaseHeight]);
//  //Support gantry
//  translate([0, -9, ($GantryHeight / 2) + $BaseHeight])
//		cube([6, 1, $GantryHeight], center = true);
  //Parallel beams
  translate([-3 - 0.5 - (3/16), -9, 43])
    GantryArmSet($Angle = $ArmAngle - 180);
  mirror([1, 0, 0])
    translate([-3 - 0.5 - (3/16), -9, 43])
    GantryArmSet($Angle = $ArmAngle - 180);
  //Capture wrist
	translate([0, -3.5, -3])
  translate([0, sin($ArmAngle) * ($ExtensionLength - 1), ($ExtensionLength - 1) - sin($ArmAngle + 90) * ($ExtensionLength - 1)])
    translate([0, -1, 19])
      DoCapture($Item = 0, $Rotation = 0, $ItemOffset = 9.5);

}

module Robot1()
{
  //Wheel base
  translate([-15, -15, 0])
    cube([30, 30, $BaseHeight]);
  //Support gantry
  translate([0, -9, ($GantryHeight / 2) + $BaseHeight])
    rotate(-10, [1, 0, 0])
      cube([6, 1, $GantryHeight], center = true);
  //Parallel beams
  translate([-3 - 0.5 - (3/16), -6, 44])
    GantryArmSet($Angle = $ArmAngle - 180);
  mirror([1, 0, 0])
    translate([-3 - 0.5 - (3/16), -6, 44])
    GantryArmSet($Angle = $ArmAngle - 180);
  //Capture wrist
  translate([0, sin($ArmAngle) * ($ExtensionLength - 1), ($ExtensionLength - 1) - sin($ArmAngle + 90) * ($ExtensionLength - 1)])
    translate([0, -1, 19])
      DoCapture($Item = 0, $Rotation = 90);
}

module DoCapture()
{
		echo ("Rotation = ", $Rotation);
	  if ($Item == 0)
   	 CargoCapture();
	  else if ($Item == 1)
   	 HatchCapture();
	  else
   	 EmptyCapture();
}

module Cargo()
{
  color($CargoColor)
    sphere(d = $CargoDiameter, $fn = 90);
}

module Hatch()
{
  rotate(90, [1, 0, 0])
    color($HatchColor)
      difference()
      {
        cylinder(d = $HatchOuterDiameter, h = $HatchThickness, $fn = 50, center = true);
        cylinder(d = $HatchInnerDiameter, h = $HatchThickness + 0.01, $fn = 50, center = true);
      }
}

module GripperBlock1()
{
  rotate(-22, [0, 0, 1])
  difference()
    {
      cube([1, 2, 3], center = true);
      translate([0.5, 0.2, 0])
        scale([2.0, 1.0, 1.0])
          rotate(45, [0, 0, 1])
            cube([.5, .5, 3.1], center = true);
    }
}

module GripperBlock2()
{
	translate([-0.5, -1, 0])
		rotate(-9, [0, 0, 1])
		{
			difference()
			{
				cube([2, 1, 3], center = true);
				translate([0, 0, -0.75])
					rotate(90, [1, 0, 0])
						cylinder(d2 = 0.5, d1 = 1, h = 1.1, $fn = 20, center = true);
			}
			color($CylinderColor)
			{
				//Cylinder
				translate([0, -4, -0.75])
					rotate(90, [1, 0, 0])
					cylinder(d = 1.5, h = 6, $fn = 20, center = true);
				//Shaft
				translate([0, -1, -0.75])
					rotate(90, [1, 0, 0])
					cylinder(d = 1/4, h = 6, $fn = 20, center = true);
			}
		}
}

module GripperSegment1()
{
  linear_extrude(height = $GripperThickness)
    GripperSegment12D();
  translate([-.9, 10.2, 0])
    GripperBlock1();
}

module GripperSegment2()
{
  linear_extrude(height = $GripperThickness)
    GripperSegment22D();
  translate([-.9, 10.2, 0])
    GripperBlock2();
}

module GripperSegment12D()
{
  difference()
  {
    //Main arm shape
    translate([0, 1, 0])
      polygon($GripperPolygon1);
    //Mount hole
    circle(d = 3/8, $fn = 30);
    //Hatch grip cutout
    translate([0, 10, 0])
      rotate(35, [0, 0, 1])
        circle(d = 2, $fn = 3, center = true);
  }
}

module GripperSegment22D()
{
  difference()
  {
    //Main arm shape
    translate([0, 1, 0])
      polygon($GripperPolygon2);
    //Mount hole
    circle(d = 3/8, $fn = 30);
  }
}

module Gripper()
{
	if ($GripperType == 1)
	{
  translate([0, -0.5, 0])
    Wrist();
  
  translate([-$GripperSpacing, 0, 0])
    rotate($GripperArmAngle, [0, 0, 1])
      GripperSegment1();

  translate([$GripperSpacing, 0, 0])
    rotate(-$GripperArmAngle, [0, 0, 1])
      mirror([1, 0, 0])
        GripperSegment1();
	}
	else
	{
		translate([0, -0.5, 0])
			Wrist2();

		translate([-$GripperSpacing, 0, 0])
			rotate($GripperArmAngle, [0, 0, 1])
				GripperSegment2();

		translate([$GripperSpacing, 0, 0])
			rotate(-$GripperArmAngle, [0, 0, 1])
				mirror([1, 0, 0])
					GripperSegment2();
	}
}

module BallGuide()
{
  translate([0, 0, -2.5])
    rotate(-130,[1, 0, 0])
      translate([-1.5, 0, 0])
        cube([3, 1/8, 6]);
  translate([0, 4.5, -6.32])
    rotate(-100,[1, 0, 0])
      translate([-1.5, 0, 0])
        cube([3, 1/8, 4]);
}

module Wrist()
{
  //Rotation shaft
  color($WristShaftColor)
  {
    translate([0, -3.0, 0])
      rotate(90, [1, 0, 0])
        cylinder(d = $WristShaftDiameter, h = 3.7, $fn = 20);
  }
  //Rotation attach plate
  color($WristPlateColor)
  {
    translate([0, 0, -.5])
      cube([6, 3/16, 4.2], center = true);
    //Gripper extension plate
    translate([0, 0, -1.1])
      cube([($GripperSpacing * 2) + 2, 3/16, 2], center = true);
    //Gripper mount plates
    translate([-$GripperSpacing, 1.2 / 2, -.2])
      cube([2, 1.2, 3/16], center = true);
    translate([$GripperSpacing, 1.2 / 2, -.2])
      cube([2, 1.2, 3/16], center = true);
  }
  //Ball guides
  color($BallGuideColor)
  {
    BallGuide();
    rotate(70, [0, 1, 0])
      BallGuide();
    rotate(-70, [0, 1, 0])
      BallGuide();
  }
  //Springs
  color($SpringColor)
  {
    translate([-2.5, 0, .5])
      rotate(50, [0, 0, 1])
        rotate(-90, [1, 0, 0])
          cylinder(d = .3, h = 7, $fn = 40);
    translate([2.5, 0, .5])
      rotate(-50, [0, 0, 1])
        rotate(-90, [1, 0, 0])
          cylinder(d = .3, h = 7, $fn = 40);
  }
  WristMount();
}

module WristMount()
{
  $MountHeight = 2;
  translate([0, -1.6, 0])
  {
    //Actuator passthrough
    difference()
    {
      cube([4, 3, $MountHeight], center = true);
      cube([4.05, 3 - (3/16), $MountHeight - (3/16)], center = true);
    }
  }
  //Actuator
  translate([0, -1.5, 0])
  {
    //Linkage plate
    cylinder(d = 2, h = 3/16, $fn = 20);
    //Motor shaft
    cylinder(d = 4/16, h = 2.2, $fn = 20, center = true);
    //Motor
    translate([0, 0, 1])
      cylinder(d = 1.5, h = 4, $fn = 20);
  }
  //Actuator linkages
  color($LinkageColor)
  {
    //Left
    translate([-5.8 + ($GripperArmAngle / 20), -2.8, 3/16])//VERY approximateadjustments for linkage!!
      rotate(8  - ($GripperArmAngle / 15), [0, 0, 1])
        translate([0, -1/8, 0])
          cube([5.3, 1/4, 3/16]);
    //Right
    translate([5.8 - ($GripperArmAngle / 20), -2.8, 3/16])//VERY approximateadjustments for linkage!!
      rotate(180 - 15 - ($GripperArmAngle / 2.5), [0, 0, 1])
        translate([0, -1/8, 0])
        cube([5.3, 1/4, 3/16]);
  }
}

module WristFixture()
{
	if ($GripperType == 1)
	{
		WristFixture1();
	}
	else
	{
		WristFixture2();
	}
}

module WristFixture1()
{
  translate([0, -5.2, 0])
  {
    difference()
    {
      cube([6, 3, 4], center = true);
      translate([0, -2, 0])
        rotate(-90, [1, 0, 0])
          cylinder(d = 1.5 + 0.05, h = 4, $fn = 20);
    }
    //Drive motor
    translate([-1.5, -1.6, -2.8])
      rotate(-90, [1, 0, 0])
        cylinder(d = 1.5, h = 4, $fn = 20);
    //Motor Sprocket
    translate([-1.5, -2.15, -2.8])
      rotate(-90, [1, 0, 0])
        cylinder(d = 1, h = 3/16, $fn = 7);
    //Motor shaft
    translate([-1.5, -2.15, -2.8])
      rotate(-90, [1, 0, 0])
        cylinder(d = 3/16, h = 1, $fn = 30);
    //Wrist Sprocket
    translate([0, -2.15, 0])
      rotate(-90, [1, 0, 0])
        cylinder(d = 4, h = 3/16, $fn = 20);
  }
  //Lifter extension plates
  translate([-3, -4.7, -5.5])
    cube([3/16, 3, 15], center = true);
  translate([3, -4.7, -5.5])
    cube([3/16, 3, 15], center = true);
}

module WristFixture2()
{
  //Lifter extension plates
  translate([-3, -3.4, -7.1])
		difference()
		{
			cube([3/16, 5.6, 12], center = true);
			translate([0, 4.1, 0])
				rotate(-20, [1, 0, 0])
					cube([3.1/16, 5.6, 16], center = true);
		}
  translate([3, -3.4, -7.1])
		difference()
		{
			cube([3/16, 5.6, 12], center = true);
			translate([0, 4.1, 0])
				rotate(-20, [1, 0, 0])
					cube([3.1/16, 5.6, 16], center = true);
		}
}

module Wrist2()
{
  //Rotation attach plate
  color($WristPlateColor)
  {
		//Main back plate
    translate([0, 0, -.9])
      cube([6, 3/16, 3.4], center = true);
    //Gripper extension plate
    translate([0, 0, -1.1])
      cube([($GripperSpacing * 2) + 2, 3/16, 2], center = true);
    //Gripper mount plates
    translate([-$GripperSpacing, 1.2 / 2, -.2])
      cube([2, 1.2, 3/16], center = true);
    translate([$GripperSpacing, 1.2 / 2, -.2])
      cube([2, 1.2, 3/16], center = true);
		//Servo mount plate
    translate([-0.0, -2.9, -1.2])
      cube([6, 5.6, 3/16], center = true);
  }
	//Large servo
	translate([-0, -2.4, -1.9])
	{
		color("black")
//		cube([2.5, 1.25, 2.2], center = true);
			cube([2, 3.9, 3.1], center = true);
		color("white")
			translate([0, 1, 2])
				cylinder(d = 2, h = .1, $fn = 30, center = true);
	}
	//Servo linkages
	color("gray")
	{
		translate([-5.8, -2.8, 3.1/16])
			rotate(7, [0, 0, 1])
				cube([5.5, .3, 3/16]);
		translate([5.9, -2.6, 3.1/16])
			rotate(180 - 16, [0, 0, 1])
				cube([5.5, .3, 3/16]);
	}
	
  //Ball guides
  color($BallGuideColor)
  {
    BallGuide();
    rotate(70, [0, 1, 0])
      BallGuide();
    rotate(-70, [0, 1, 0])
      BallGuide();
  }
  //Springs
  color($SpringColor)
  {
    translate([-2.5, 0, .5])
      rotate(50, [0, 0, 1])
        rotate(-90, [1, 0, 0])
          cylinder(d = .3, h = 7, $fn = 40);
    translate([2.5, 0, .5])
      rotate(-50, [0, 0, 1])
        rotate(-90, [1, 0, 0])
          cylinder(d = .3, h = 7, $fn = 40);
  }
}

module HatchCapture()
{
  rotate($Rotation, [0, 1, 0])
  {
    translate([0, $ItemOffset, 0])
      Hatch();
    $GripperArmAngle = $GripperArmAngleHatchCapture;
    Gripper();
  }
  WristFixture();
}

module CargoCapture()
{
  translate([0, $ItemOffset, 0])
    Cargo();
  $GripperArmAngle = $GripperArmAngleCargoCapture;
  rotate($Rotation, [0, 1, 0])
		Gripper();
  WristFixture();
}

module EmptyCapture()
{
  $GripperArmAngle = 0;
  rotate($Rotation, [0, 1, 0])
		Gripper();
  WristFixture();
}

