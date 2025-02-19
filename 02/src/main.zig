const std = @import("std");

pub fn main() !void {
    var array = [_]u8{ 1, 2, 3 };
    std.debug.print("value: {} \n", .{chop(9, &array)});
}

pub fn chop(n: u8, array: []u8) bool {
    return search(n, 0, array.len, &array);
}

pub fn search(n: u8, start: usize, finish: usize, array: *const []u8) bool {
    if (start > finish) {
        return false;
    }

    var value: usize = undefined;

    if (finish / (start + 1) == 0) {
        value = (finish / (start + 1));
    } else {
        value = (finish / (start + 1)) - 1;
    }

    if (n == array.*[(value)]) {
        return true;
    } else if (start == finish or start == array.len) {
        return false;
    }

    if (array.*[((finish / (start + 1)) - 1)] > n) {
        return search(n, finish / (start + 1), finish, array);
    } else {
        return search(n, start, finish / (start + 1), array);
    }
}
