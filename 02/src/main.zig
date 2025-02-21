const std = @import("std");

pub fn main() !void {
    var array = [_]u8{2};
    std.debug.print("value: {} \n", .{chop(2, &array)});
}

pub fn chop(n: u8, array: []u8) bool {
    if (array.len == 0) {
        return false;
    }
    return search(n, &array);
}

pub fn search(n: u8, array: *const []u8) bool {
    const pos = array.len / 2;

    std.debug.print("value array -> {d}, value pos -> {d} \n", .{ array.*[pos], pos });

    if (n == array.*[pos]) {
        return true;
    }

    if (array.len == 1) {
        return false;
    }

    if (n > array.*[pos]) {
        return search(n, &array.*[pos..array.len]);
    } else {
        return search(n, &array.*[0..pos]);
    }
}
