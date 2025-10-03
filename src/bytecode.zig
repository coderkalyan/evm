pub const Tag = enum(u8) {
    /// Load an immediate zero into the accumulator.
    lza,
    /// Load an immediate one into the accumulator.
    loa,
    /// Load a zero-extended 8-bit immediate into the accumulator.
    lu,
    /// Load a sign-extended 8-bit immediate into the accumulator.
    li,
};
