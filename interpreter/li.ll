@jump_table = private local_unnamed_addr global [5 x ptr] [ptr @lza, ptr @lzo, ptr @lu, ptr @li, ptr @lc], align 8

define internal ghccc void @lza(ptr nonnull readonly align 1 %ip, ptr nonnull align 8 %fp, ptr nonnull align 8 %sp, i64 %acc) local_unnamed_addr {
entry:
    %opcode.ptr = getelementptr inbounds i8, ptr %ip, i32 1
    %opcode = load i8, ptr %opcode.ptr, align 1
    %opcode.zext = zext i8 %opcode to i32
    %handler.ptr = getelementptr inbounds ptr, ptr @jump_table, i32 %opcode.zext
    %handler = load ptr, ptr %handler.ptr, align 8
    musttail call ghccc void %handler(ptr %opcode.ptr, ptr %fp, ptr %sp, i64 0)
    ret void
}

define internal ghccc void @lzo(ptr nonnull readonly align 1 %ip, ptr nonnull align 8 %fp, ptr nonnull align 8 %sp, i64 %acc) local_unnamed_addr {
entry:
    %opcode.ptr = getelementptr inbounds i8, ptr %ip, i32 1
    %opcode = load i8, ptr %opcode.ptr, align 1
    %opcode.zext = zext i8 %opcode to i32
    %handler.ptr = getelementptr inbounds ptr, ptr @jump_table, i32 %opcode.zext
    %handler = load ptr, ptr %handler.ptr, align 8
    musttail call ghccc void %handler(ptr %opcode.ptr, ptr %fp, ptr %sp, i64 1)
    ret void
}

define internal ghccc void @lu(ptr nonnull readonly align 1 %ip, ptr nonnull align 8 %fp, ptr nonnull align 8 %sp, i64 %acc) local_unnamed_addr {
entry:
    %imm.ptr = getelementptr inbounds i8, ptr %ip, i32 1
    %imm = load i8, ptr %imm.ptr, align 1
    %imm.zext = zext i8 %imm to i64

    %opcode.ptr = getelementptr inbounds i8, ptr %ip, i32 2
    %opcode = load i8, ptr %opcode.ptr, align 1
    %opcode.zext = zext i8 %opcode to i32
    %handler.ptr = getelementptr inbounds ptr, ptr @jump_table, i32 %opcode.zext
    %handler = load ptr, ptr %handler.ptr, align 8
    musttail call ghccc void %handler(ptr %opcode.ptr, ptr %fp, ptr %sp, i64 %imm.zext)
    ret void
}

define internal ghccc void @li(ptr nonnull readonly align 1 %ip, ptr nonnull align 8 %fp, ptr nonnull align 8 %sp, i64 %acc) local_unnamed_addr {
entry:
    %imm.ptr = getelementptr inbounds i8, ptr %ip, i32 1
    %imm = load i8, ptr %imm.ptr, align 1
    %imm.sext = sext i8 %imm to i64

    %opcode.ptr = getelementptr inbounds i8, ptr %ip, i32 2
    %opcode = load i8, ptr %opcode.ptr, align 1
    %opcode.zext = zext i8 %opcode to i32
    %handler.ptr = getelementptr inbounds ptr, ptr @jump_table, i32 %opcode.zext
    %handler = load ptr, ptr %handler.ptr, align 8
    musttail call ghccc void %handler(ptr %opcode.ptr, ptr %fp, ptr %sp, i64 %imm.sext)
    ret void
}

define internal ghccc void @lc(ptr nonnull readonly align 1 %ip, ptr nonnull align 8 %fp, ptr nonnull align 8 %sp, i64 %acc) local_unnamed_addr {
entry:
    %idx.ptr = getelementptr inbounds i8, ptr %ip, i32 1
    %idx = load i8, ptr %idx.ptr, align 1
    %idx.zext = zext i8 %idx to i32
    %pool.ptr.ptr = getelementptr inbounds i64, ptr %fp, i32 1
    %pool.ptr = load ptr, ptr %pool.ptr.ptr, align 8
    %imm.ptr = getelementptr inbounds i64, ptr %pool.ptr, i32 %idx.zext
    %imm = load i64, ptr %imm.ptr, align 8

    %opcode.ptr = getelementptr inbounds i8, ptr %ip, i32 2
    %opcode = load i8, ptr %opcode.ptr, align 1
    %opcode.zext = zext i8 %opcode to i32
    %handler.ptr = getelementptr inbounds ptr, ptr @jump_table, i32 %opcode.zext
    %handler = load ptr, ptr %handler.ptr, align 8
    musttail call ghccc void %handler(ptr %opcode.ptr, ptr %fp, ptr %sp, i64 %imm)
    ret void
}
