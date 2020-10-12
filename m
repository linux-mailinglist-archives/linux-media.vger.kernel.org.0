Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6CB28B578
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 15:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730307AbgJLNF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 09:05:29 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:54107 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730262AbgJLNF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 09:05:28 -0400
Received: by mail-il1-f198.google.com with SMTP id y62so11885775ilk.20
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 06:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=weOKzOEYd6OnFmuQPwghpwImZizE+A7XLRWBwiZyCtE=;
        b=eVYUoM7+uD8zRCWWOEiqAcmKzDZm5cyLEt7oExoZAewBtHjZNU7/itOEI1gSgXLZs0
         a4QMrZPuE3mYo0VYpL5drg9GSHA++CgjsXQfnjl/Ndf6VmRz3jzJkmlbj+kx0l00GzWA
         mmQWZS8qa+aLozsfw/uPOWTesO6FPpTFhEvBHm5z99qU9MVKVGSzE3OPHZESR/rOoPEp
         tM6jYPa7uTHzV0HBIRirrJG4hTKlbiJ8zpghN0HZ7mTgdzww4WwVgvfVqFMJ0knvRO4o
         kD+M55L+YaPUo8r+Tu9uDqAfBNw4P7Abe0VMnkFWZjzA2Zupo+pbBYO9OEi3oBJ1hS3p
         nReA==
X-Gm-Message-State: AOAM531tIpjCtvcULHVGC0w70dyUmz5PTTxSXMShRudzu+jcbiFGfif1
        Gx4dHHJTJyDPM/v8jBMRs39v0MoFFI5EkDOP50fSkNfJi8fe
X-Google-Smtp-Source: ABdhPJzpCKLxmcGgUteT0I4AlfOG13qRkR+f1Rwh7GcQREsOjIOSrBicc9i1TdFoVskDaa0eUsZmnnaeD4K/FTjEVdYgo20PtNYD
MIME-Version: 1.0
X-Received: by 2002:a92:c74c:: with SMTP id y12mr19435920ilp.19.1602507925674;
 Mon, 12 Oct 2020 06:05:25 -0700 (PDT)
Date:   Mon, 12 Oct 2020 06:05:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a8e10f05b178f3f9@google.com>
Subject: KASAN: out-of-bounds Read in v4l2_fh_init
From:   syzbot <syzbot+431a2669cfb42d234b9c@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    93578a25 usb: musb: gadget: Use fallthrough pseudo-keyword
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1480f19f900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df3bb4023c36d114
dashboard link: https://syzkaller.appspot.com/bug?extid=431a2669cfb42d234b9c
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+431a2669cfb42d234b9c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: out-of-bounds in v4l2_fh_init+0x279/0x2c0 drivers/media/v4l2-core/v4l2-fh.c:25
Read of size 8 at addr ffff8881c72788c0 by task v4l_id/11388

CPU: 1 PID: 11388 Comm: v4l_id Not tainted 5.9.0-rc8-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x107/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0+0x1c/0x210 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x37/0x7c mm/kasan/report.c:530
 v4l2_fh_init+0x279/0x2c0 drivers/media/v4l2-core/v4l2-fh.c:25
 v4l2_fh_open+0x88/0xc0 drivers/media/v4l2-core/v4l2-fh.c:63
 em28xx_v4l2_open+0x11c/0x570 drivers/media/usb/em28xx/em28xx-video.c:2163
 v4l2_open+0x20f/0x3d0 drivers/media/v4l2-core/v4l2-dev.c:423
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x4b4/0x1090 fs/open.c:817
 do_open fs/namei.c:3251 [inline]
 path_openat+0x190d/0x2690 fs/namei.c:3368
 do_filp_open+0x17e/0x3c0 fs/namei.c:3395
 do_sys_openat2+0x16d/0x420 fs/open.c:1168
 do_sys_open fs/open.c:1184 [inline]
 __do_sys_open fs/open.c:1192 [inline]
 __se_sys_open fs/open.c:1188 [inline]
 __x64_sys_open+0x119/0x1c0 fs/open.c:1188
 do_syscall_64+0x2d/0x40 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fee3e895840
Code: 73 01 c3 48 8b 0d 68 77 20 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 83 3d 89 bb 20 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 1e f6 ff ff 48 89 04 24
RSP: 002b:00007ffc37239888 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007ffc372399f8 RCX: 00007fee3e895840
RDX: 00007fee3e881ea0 RSI: 0000000000000000 RDI: 00007ffc37239f22
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000002 R11: 0000000000000246 R12: 0000555d9d9f38d0
R13: 00007ffc372399f0 R14: 0000000000000000 R15: 0000000000000000

The buggy address belongs to the page:
page:00000000914a1a5b refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1c7278
flags: 0x200000000000000()
raw: 0200000000000000 dead000000000100 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881c7278780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff8881c7278800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff8881c7278880: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
                                           ^
 ffff8881c7278900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff8881c7278980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
