Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A239413C8EF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 17:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbgAOQPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 11:15:13 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:41595 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgAOQPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 11:15:13 -0500
Received: by mail-il1-f199.google.com with SMTP id k9so13551763ili.8
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2020 08:15:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=0Cf6ZphCZYNLk3aMASlUpbTauK9EgyI+kH/XKXJeTh8=;
        b=P/3BpXI12pVVmCdjeKoSGWnd3Kk42hJ2H62uODpM4x2ghZ8eaJ5piAgcK5N7atFNE8
         1WeMvOm0dRaz8hsVVmJ7oyBuRa+XqA0oy1MQ9I0T6Kn9BNfv6QafE5DrZjMb3Z7kw7CA
         YrWIaf+mdPlo+hT2kp1uBgFe0kdBFy7xYr7AwD7P/YCQ43d6sGDeFzyZZ+8hUY0b/cRC
         yLXt0pOYztX8gkPVPO/GasFm4ippyRqTiGQ2PyYdaoJcpZ6xEWhM9gp3NYd3p3Kdh5IB
         3Ky9RfbDb+7v8ovrm+2QTu5bQ1KseCUI0fCdHLCBRhgLPXUTD5zf61xLhs4L0spK0Vjr
         fOHQ==
X-Gm-Message-State: APjAAAVssDVkDF8j/U2fwBeWh7UpQiQzXfNwK4yNym46ZxbY4Lco9Syy
        XVbU+itrLjNAXabdD6eecMfsFRCcCP8OnbfH9qNMTeo+lfxT
X-Google-Smtp-Source: APXvYqwfRsBBbJBifQ7RCfcxQmK6ZLIT8rJpubcScU624bYMWwroDHBbnv0d4FhB+q1u791/Q3siJ2cps49pYQN5i0SrbL5a7ymR
MIME-Version: 1.0
X-Received: by 2002:a6b:8ecd:: with SMTP id q196mr22125597iod.136.1579104912850;
 Wed, 15 Jan 2020 08:15:12 -0800 (PST)
Date:   Wed, 15 Jan 2020 08:15:12 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000064c69e059c3003f6@google.com>
Subject: WARNING in schedule_bh
From:   syzbot <syzbot+bfc0855888f853dca7ad@syzkaller.appspotmail.com>
To:     axboe@kernel.dk, dri-devel@lists.freedesktop.org,
        efremov@linux.com, linaro-mm-sig@lists.linaro.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, sumit.semwal@linaro.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    95e20af9 Merge tag 'nfs-for-5.5-2' of git://git.linux-nfs...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17648c21e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d9290aeb7e6cf1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=bfc0855888f853dca7ad
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
userspace arch: i386

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+bfc0855888f853dca7ad@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 3 PID: 12339 at drivers/block/floppy.c:985  
schedule_bh+0x67/0x70 drivers/block/floppy.c:985
Kernel panic - not syncing: panic_on_warn set ...
CPU: 3 PID: 12339 Comm: syz-executor.1 Not tainted 5.5.0-rc6-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS  
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x197/0x210 lib/dump_stack.c:118
  panic+0x2e3/0x75c kernel/panic.c:221
  __warn.cold+0x2f/0x3e kernel/panic.c:582
  report_bug+0x289/0x300 lib/bug.c:195
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  fixup_bug arch/x86/kernel/traps.c:169 [inline]
  do_error_trap+0x11b/0x200 arch/x86/kernel/traps.c:267
  do_invalid_op+0x37/0x50 arch/x86/kernel/traps.c:286
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
RIP: 0010:schedule_bh+0x67/0x70 drivers/block/floppy.c:985
Code: fd 48 8b 35 8b 82 ab 07 48 c7 c2 c0 80 00 8a bf 40 00 00 00 4c 89 25  
98 7d ab 07 e8 93 51 e3 fc 5b 41 5c 5d c3 e8 09 4a 0b fd <0f> 0b eb ce 0f  
1f 44 00 00 55 48 89 e5 e8 f7 49 0b fd 48 c7 c7 10
RSP: 0018:ffffc900075774b0 EFLAGS: 00010212
RAX: 0000000000040000 RBX: 0000000000000001 RCX: ffffc900039f0000
RDX: 00000000000086ed RSI: ffffffff8469ab77 RDI: 0000000000000007
RBP: ffffc900075774c0 R08: ffff888028b50d40 R09: fffffbfff1401019
R10: fffffbfff1401018 R11: ffffffff8a0080c7 R12: ffffffff846a94a0
R13: ffffffff846a94a0 R14: 0000000000000001 R15: 0000000000000001
  wait_til_done+0x88/0x370 drivers/block/floppy.c:1977
  poll_drive+0xd5/0xf0 drivers/block/floppy.c:2939
  floppy_check_events+0x39f/0x440 drivers/block/floppy.c:4107
  disk_check_events+0x13b/0x5c0 block/genhd.c:1859
  disk_clear_events+0x143/0x318 block/genhd.c:1819
  check_disk_change+0x79/0x140 fs/block_dev.c:1488
  floppy_open+0x6ba/0xae0 drivers/block/floppy.c:4067
  __blkdev_get+0x34f/0x1650 fs/block_dev.c:1604
  blkdev_get+0x47/0x2c0 fs/block_dev.c:1736
  blkdev_open+0x205/0x290 fs/block_dev.c:1875
  do_dentry_open+0x4e6/0x1380 fs/open.c:797
  vfs_open+0xa0/0xd0 fs/open.c:914
  do_last fs/namei.c:3420 [inline]
  path_openat+0x10df/0x4500 fs/namei.c:3537
  do_filp_open+0x1a1/0x280 fs/namei.c:3567
  do_sys_open+0x3fe/0x5d0 fs/open.c:1097
  __do_compat_sys_open fs/open.c:1134 [inline]
  __se_compat_sys_open fs/open.c:1132 [inline]
  __ia32_compat_sys_open+0x79/0xb0 fs/open.c:1132
  do_syscall_32_irqs_on arch/x86/entry/common.c:337 [inline]
  do_fast_syscall_32+0x27b/0xe16 arch/x86/entry/common.c:408
  entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139
RIP: 0023:0xf7fa9a39
Code: 00 00 00 89 d3 5b 5e 5f 5d c3 b8 80 96 98 00 eb c4 8b 04 24 c3 8b 1c  
24 c3 8b 34 24 c3 8b 3c 24 c3 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90  
90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000f5da4c04 EFLAGS: 00000293 ORIG_RAX: 0000000000000005
RAX: ffffffffffffffda RBX: 00000000f5da4cc0 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000066666667 RDI: 00000000f5da4cc0
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
Kernel Offset: disabled


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
