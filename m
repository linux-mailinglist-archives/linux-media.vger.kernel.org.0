Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CF733D21C
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 11:45:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236906AbhCPKpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 06:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236828AbhCPKoW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 06:44:22 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348CCC06174A
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 03:44:19 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id n79so34660444qke.3
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0NtJaPGvoAsEDVk5ALMYcz2EIWmWtY9ldblMbz6NFwA=;
        b=Wieq7CT45hOQzpM5IdnhdKc8a6qH2NNUYy4RVSPgypR3WcHSJ14oWcbJjAytsOvEWm
         ZCTMMDzo1KEJM/DKev554aW+CcSNHBDDD+8MreP/1ymmspm67vopRmmfsmvjuaj6p8Fn
         7cITOBvLRPkjMPDwYCbJq97qstHAwo/Q/W4d+HawYHeu29NR/UGUePycJZmsoCW+TCvL
         3w63b6cBdeL31PQbsFCXNBXEAEjWI60NVqaEpIPhtlL7JCmo2YJssxvYWgX0OQisL7vm
         QEyLqLbn0kHn+fPe1uWnGaASRT5UfD6syIDnM08Iv+Qwz4gN3zWhjmYtBVZXZtNfbxc6
         ZD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0NtJaPGvoAsEDVk5ALMYcz2EIWmWtY9ldblMbz6NFwA=;
        b=NPAv2+bMou07g4JX8OXjvIcDj7r2IR2RVfcnYkXAJHE0PkX6j9Z/ENjVGvg9AvQUBq
         2XjFJjiJUfsOELo2D6TlGzWD4Oqp2O+Tv0RrQ9dfxVXzMRxJbNIpMV+94vDfMq6nlbNg
         7kmB5XygVk+OvirvmwhZP0BKkyY0uf8EtyIMcU5fcchm6dQBRMwdiLL91PIqogKUG1iR
         d1Cg1woorgkVAjgQ5eDYoTUu2I99GiA48JrJh9NcY+k399NaI0PgTkFVCx1xWydxc2TK
         rPSUhGUM115qPmeR99qw3eFoyARoRJsl7u3yp3dNP7g5/EH46Jd5oyzLIz4rQZtckMTY
         8LZQ==
X-Gm-Message-State: AOAM531d7DTVePSnXD0wXxGqWdpf/hocLL0DKCMwrTgpECOWjwjXL63C
        qtZeZTDv5ASsgRm40mLrNGhSUNL1tTe0789w9p8fBg==
X-Google-Smtp-Source: ABdhPJz2yOxVk3Hx28k4RyOM2A/OszCYaSwhO4js2MReWCZyMBd3BGfyhKzvrQPWdAhrecfHQm8gOizvpab8bxZ6NQM=
X-Received: by 2002:a05:620a:981:: with SMTP id x1mr28415935qkx.501.1615891458057;
 Tue, 16 Mar 2021 03:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000005ace4405bda4af71@google.com>
In-Reply-To: <0000000000005ace4405bda4af71@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 16 Mar 2021 11:44:06 +0100
Message-ID: <CACT4Y+ZJvG+H0Gz9x6cA5qz9=Bf8AdjXaJrQ3GLcwMTj3gPC=Q@mail.gmail.com>
Subject: Re: [syzbot] KMSAN: uninit-value in video_usercopy (2)
To:     syzbot <syzbot+142888ffec98ab194028@syzkaller.appspotmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Alexander Potapenko <glider@google.com>,
        hverkuil-cisco@xs4all.nl,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 16, 2021 at 11:18 AM syzbot
<syzbot+142888ffec98ab194028@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    29ad81a1 arch/x86: add missing include to sparsemem.h
> git tree:       https://github.com/google/kmsan.git master
> console output: https://syzkaller.appspot.com/x/log.txt?x=102502dcd00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8b976581f6bd1e7d
> dashboard link: https://syzkaller.appspot.com/bug?extid=142888ffec98ab194028
> compiler:       Debian clang version 11.0.1-2
> userspace arch: i386
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+142888ffec98ab194028@syzkaller.appspotmail.com
>
> =====================================================
> BUG: KMSAN: uninit-value in check_array_args drivers/media/v4l2-core/v4l2-ioctl.c:3041 [inline]
> BUG: KMSAN: uninit-value in video_usercopy+0x1631/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3315
> CPU: 0 PID: 19595 Comm: syz-executor.4 Not tainted 5.11.0-rc7-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x21c/0x280 lib/dump_stack.c:120
>  kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
>  __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
>  check_array_args drivers/media/v4l2-core/v4l2-ioctl.c:3041 [inline]
>  video_usercopy+0x1631/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3315
>  video_ioctl2+0x9f/0xb0 drivers/media/v4l2-core/v4l2-ioctl.c:3391
>  v4l2_ioctl+0x255/0x290 drivers/media/v4l2-core/v4l2-dev.c:360
>  v4l2_compat_ioctl32+0x2c6/0x370 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1248
>  __do_compat_sys_ioctl fs/ioctl.c:842 [inline]
>  __se_compat_sys_ioctl+0x53d/0x1100 fs/ioctl.c:793
>  __ia32_compat_sys_ioctl+0x4a/0x70 fs/ioctl.c:793
>  do_syscall_32_irqs_on arch/x86/entry/common.c:79 [inline]
>  __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:141
>  do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:166
>  do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:209
>  entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
> RIP: 0023:0xf7fec549
> Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> RSP: 002b:00000000f55e65fc EFLAGS: 00000296 ORIG_RAX: 0000000000000036
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000c050565d
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>
> Local variable ----sbuf@video_usercopy created at:
>  video_usercopy+0xaa/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3285
>  video_usercopy+0xaa/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3285
> =====================================================
> =====================================================
> BUG: KMSAN: uninit-value in check_fmt+0x864/0x1070 drivers/media/v4l2-core/v4l2-ioctl.c:963
> CPU: 0 PID: 19595 Comm: syz-executor.4 Tainted: G    B             5.11.0-rc7-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x21c/0x280 lib/dump_stack.c:120
>  kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
>  __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
>  check_fmt+0x864/0x1070 drivers/media/v4l2-core/v4l2-ioctl.c:963
>  v4l_prepare_buf+0xbf/0x1d0 drivers/media/v4l2-core/v4l2-ioctl.c:2107
>  __video_do_ioctl+0x15cd/0x1d20 drivers/media/v4l2-core/v4l2-ioctl.c:2993
>  video_usercopy+0x2313/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3345
>  video_ioctl2+0x9f/0xb0 drivers/media/v4l2-core/v4l2-ioctl.c:3391
>  v4l2_ioctl+0x255/0x290 drivers/media/v4l2-core/v4l2-dev.c:360
>  v4l2_compat_ioctl32+0x2c6/0x370 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1248
>  __do_compat_sys_ioctl fs/ioctl.c:842 [inline]
>  __se_compat_sys_ioctl+0x53d/0x1100 fs/ioctl.c:793
>  __ia32_compat_sys_ioctl+0x4a/0x70 fs/ioctl.c:793
>  do_syscall_32_irqs_on arch/x86/entry/common.c:79 [inline]
>  __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:141
>  do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:166
>  do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:209
>  entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
> RIP: 0023:0xf7fec549
> Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> RSP: 002b:00000000f55e65fc EFLAGS: 00000296 ORIG_RAX: 0000000000000036
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000c050565d
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>
> Local variable ----sbuf@video_usercopy created at:
>  video_usercopy+0xaa/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3285
>  video_usercopy+0xaa/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3285
> =====================================================

I did not get to the very bottom of this, but I looked at this a bit.
It seems to be related to some unfortunate interaction of compat
syscall and CONFIG_COMPAT_32BIT_TIME. It seems that in this case
nothing at all is copied from userspace because cmd gets messed up or
something. Perhaps VIDIOC_QUERYBUF is translated into
VIDIOC_QUERYBUF_TIME32 instead of VIDIOC_QUERYBUF32_TIME32 and then
this gets into compat syscall path and v4l2_compat_get_user does not
recognize the command, copies nothing but returns 0.


> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/0000000000005ace4405bda4af71%40google.com.
