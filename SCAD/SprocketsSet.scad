use <sprockets.scad>
// sprocket(size, teeth, bore, hub_diameter, hub_height, guideangle);
//
//   size:          ANSI Roller Chain Standard Sizes, default 25, or motorcycle sizes,
//                  or 1 for bike w/derailleur or 2 for bike w/o derailleur
//   teeth:         Number of teeth on the sprocket, default 9
//   bore:          Bore diameter, inches (Chain sizes seem to favor inches), default 5/16
//   hub_diameter:  Hub diameter, inches, default 0
//   hub_height:    Hub height TOTAL, default 0.
//   guideangle:    Guide angle on teeth point to help enter chain clean

$HexInnerToOuterFactor = 1.154626;
$ChainClearance = (1/32) * 25.4;
$GuideDepth     = (1/8) * 25.4;
$ChainSize = 25;
$SprocketTeethCount = 16;
$ChainGuideAngle = 25;
$HexBore = 0.52 * 25.4;

$GuideInnerDiameter = (($SprocketTeethCount * 0.25) / 3.141) * 25.4;
$GuideOuterDiameter = $GuideInnerDiameter + ((3/8) * 25.4);

echo ("Outer diameter (mm)  = ", $GuideOuterDiameter);
echo ("Outer diameter (inch)= ", $GuideOuterDiameter / 25.4);


PrintSet();
//  HexSprocket($ChainSize, $SprocketTeethCount, 0, 0, 0, $ChainGuideAngle);
//ChainGuide();

module PrintSet()
{
  HexSprocket($ChainSize, $SprocketTeethCount, 0, 0, 0, $ChainGuideAngle);
  translate([-$GuideOuterDiameter + 5, 0, 0])
    HexSprocket($ChainSize, $SprocketTeethCount, 0, 0, 0, $ChainGuideAngle);
  translate([$GuideOuterDiameter + 5, 0, 0])
    ChainGuide();
  translate([$GuideOuterDiameter + 5, $GuideOuterDiameter + 5, 0])
    ChainGuide();
  translate([0, $GuideOuterDiameter + 5, 0])
    Spacer($Depth = 0.25 * 25.4, $Diameter = $GuideOuterDiameter, $Bore = $HexBore);
}

module ChainGuide()
{
  difference()
  {
    union()
    {
      cylinder(d2 = $GuideInnerDiameter, d1 = $GuideOuterDiameter, h = $GuideDepth, $fn = 150);
      translate([0, 0, $GuideDepth])
      cylinder(d = $GuideInnerDiameter  - 8, h = $ChainClearance, $fn = 150);
    }
    HexShaft($Bore = $HexBore, h = $ChainClearance + $GuideDepth);
  }
}

module HexShaft($Bore = 13, $Length = 30)
{
  cylinder(d = $Bore * $HexInnerToOuterFactor, h = $Length * 25.4, $fn = 6);
}

module HexSprocket()
{
  scalefactor = 1.0;
  scale([scalefactor, scalefactor, 1])
  difference()
  {
    union()
    {
      translate([0, 0, (0.25 / 2) * 25.4])
      sprocket($ChainSize, $SprocketTeethCount, 0, 0, 0, $ChainGuideAngle);
      cylinder(d = $GuideInnerDiameter - 7, h = ((0.11 + 0.25) * 25.4), $fn = $SprocketTeethCount * 2);
    }
    HexShaft($Bore = $HexBore, $Length = .5);
  }
}

module Spacer($Depth = 0.25 * 25.4, $Diameter = 1.5 * 25.4, $Bore = 0.5 * 25.4)
{
  difference()
  {
    cylinder(d = $Diameter, h = $Depth, $fn = 150);
    HexShaft($Bore = $HexBore, $Length = $Depth);
  }
}