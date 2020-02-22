$fn = 100;
$RollerCount = 4;
$WheelDiameter = 40;
$RollerDiameter = 10;
$RollerLength = 14;
$WheelBaseThickness = 11;
$RollerShaftDiameter = 2;
$RollerBearingDiameter = 6;
$RollerBearingThickness = 3;
$RollerOffset = 14;
$RollerClearance = 1;

$WheelBaseDiameter = $WheelDiameter - 3;

//translate([0, (-$WheelDiameter + $RollerDiameter) / 2, 0])
//Wheel();
//rotate(90, [0, 0,1])
  Wheel();

 
module Wheel()
{
  WheelRollers();
  WheelBase();
}

module BaseRollerCutoutCube()
{
  rotate(-90, [1, 0, 0])
    intersection()
    {
      translate([-($RollerDiameter + $RollerClearance) / 2, -($RollerLength + $RollerClearance) / 2, -($RollerDiameter + $RollerClearance + $RollerClearance) / 2])
      {
      cube([$RollerDiameter + $RollerClearance , $RollerLength + $RollerClearance, $RollerDiameter + $RollerClearance]);
      }
      translate([-($RollerDiameter + $RollerClearance) / 2, 0, ($WheelDiameter - $RollerDiameter - $RollerClearance) / 2])
        rotate(90, [0, 1, 0])
          cylinder(d = $WheelDiameter + $RollerClearance, h = $RollerDiameter + $RollerClearance);
      
    }
}

module BaseWheelCutoutCube()
{
  for (i = [0 : $RollerCount - 1])
    rotate(360 * i / $RollerCount, [1, 0, 0])
      translate([($RollerOffset - $RollerClearance) / 2, -(-$WheelDiameter + $RollerDiameter) / 2, 0])
        BaseRollerCutoutCube();
}

module BaseWheelCutout()
{
  BaseWheelCutoutCube();
}

module WheelBase()
{
  difference()
  {
    rotate(90, [0, 1, 0])
//      cylinder(d = $WheelBaseDiameter, h = $RollerDiameter);
      cylinder(d = $WheelBaseDiameter, h = $WheelBaseThickness);
    BaseWheelCutout();
  }
}

module WheelRollers()
{
  translate([$RollerOffset / 2, 0, 0])
    WheelSet();
  rotate(360 / ($RollerCount * 2), [1, 0, 0])
    translate([-$RollerOffset / 2, 0, 0])
      WheelSet();
}

module WheelSet()
{
  for (i = [0 : $RollerCount - 1])
    rotate(360 * i / $RollerCount, [1, 0, 0])
      translate([0, -(-$WheelDiameter + $RollerDiameter) / 2, 0])
        Roller();
}

module Roller()
{
  difference()
  {
    rotate_extrude(convexity = 10, $fn = 200)
    {
      intersection()
      {
        intersection()
        {
          translate([(-$WheelDiameter + $RollerDiameter) / 2, 0, 0])
            circle (d = $WheelDiameter);
        }
        translate([0, -$RollerLength / 2, 0])
        square([$RollerDiameter, $RollerLength]);
      }
    }
    cylinder(d = $RollerShaftDiameter, h = $RollerLength + 1, center = true);
    translate([0, 0, ($RollerLength - $RollerBearingThickness + 0.01) / 2])
      cylinder(d = $RollerBearingDiameter, h = $RollerBearingThickness, center = true);
    translate([0, 0, -($RollerLength - $RollerBearingThickness + 0.01) / 2])
      cylinder(d = $RollerBearingDiameter, h = $RollerBearingThickness, center = true);
  }
}