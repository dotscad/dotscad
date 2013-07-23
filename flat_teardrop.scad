/**
 * flat_teardrop.scad
 *
 * A simple intersection method to implement a flat or truncated teardrop.
 *
 * The 45 degree slope of the sides of a teardrop shape are easier for most printers to
 * produce than a normal circular hole, but the pointy tip of teardrop module in
 * [MCAD](https://github.com/SolidCode/MCAD) is unnecessary.  By expanding on the
 * teardrop module in MCAD, this module produces a the best printable shape while
 * diverging as little as possible from the desired shape of a circular hole.
 *
 * This openSCAD library is part of the [dotscad](https://github.com/dotscad/dotscad)
 * project.
 *
 * @copyright  Chris Petersen, 2013
 * @license    http://creativecommons.org/licenses/LGPL/2.1/
 * @license    http://creativecommons.org/licenses/by-sa/3.0/
 *
 * @see        http://www.thingiverse.com/thing:122032
 * @source     https://github.com/dotscad/dotscad/blob/master/flat_teardrop.scad
 *
 * @param float radius Radius of the teardrop cylinder
 * @param float length Length of the teardrop
 * @param float angle  Angle of the teardrop.
 */
use <MCAD/teardrop.scad>;
module flat_teardrop(radius, length, angle) {
    intersection() {
        rotate([0, angle, 0]) {
            cube(size=[radius * 2, radius * 2, length], center=true);
        }
        teardrop(radius, length, angle);
    }
}

/*
 * When this file is opened directly in OpenSCAD, the following code will render an
 * example of the functions it provides.  This example will *not* render if this module
 * is imported into your own project via the `use` statement.
 */
flat_teardrop_example();
module flat_teardrop_example($fn=50) {
    rotate([0,0,90]) flat_teardrop(5, 10, 90);
}
