/**
 * on_arc.scad
 *
 * Use this module to place a child object along an arc, rotated at the correct angle
 * to maintain association with the arc's focal point.
 *
 * This OpenSCAD library is part of the [dotscad](https://github.com/dotscad/dotscad)
 * project.
 *
 * @copyright  Chris Petersen, 2013
 * @license    http://creativecommons.org/licenses/LGPL/2.1/
 * @license    http://creativecommons.org/licenses/by-sa/3.0/
 *
 * @see        http://www.thingiverse.com/thing:118648
 * @source     https://github.com/dotscad/dotscad/blob/master/on_arc.scad
 *
 * @param float radius Radius of the arc
 * @param float angle  Angle along the arc to place the child object
 */
module on_arc(radius, angle) {
    x = radius - radius * cos(angle);
    y = radius * sin(angle);
    translate([x,y,0])
        rotate([0,0,-angle])
            child(0);
}

/*
 * When this file is opened directly in OpenSCAD, the following code will render an
 * example of the functions it provides.  This example will *not* render if this module
 * is imported into your own project via the `use` statement.
 */
on_arc_example();
module on_arc_example() {
    union() {
        for(a = [0 : 30 : 260]) {
            on_arc(10, a) cube([3,1,2]);
        }
    }
}
