const std = @import("std");

pub fn main() !void {
    var array = [_]u8{ 1, 2, 3, 4 };
    std.debug.print("value: {} \n", .{chop(0, &array)});
}

pub fn chop(n: u8, array: []u8) bool {
    return search(n, &array);
}

pub fn search(n: u8, array: *const []u8) bool {
    var start: usize = 0;
    var finish = array.*.len;
    var pos: usize = (finish - start / 2) - 1;

    while (finish - start != 1) {
        if (array.*[pos] == n) {
            return true;
        } else if (array.*[pos] > n) {
            finish = pos;
        } else {
            start = pos;
        }

        pos = (finish - start / 2) - 1;
    }

    if (array.*[pos] == n) {
        return true;
    }

    return false;
}
