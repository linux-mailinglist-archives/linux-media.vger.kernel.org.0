Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D54331BC27
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 16:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhBOPUK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 10:20:10 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:49684 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbhBOPTD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 10:19:03 -0500
Received: by mail-il1-f199.google.com with SMTP id q3so5550432ilv.16
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 07:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=G3OO12fHeu5/ZsKky77dakeCnb4d7ffwzbB89AJlTcE=;
        b=lUfOSaNK0A2uWIrS1P3hWs/RQ5Wa+Jh/Kmw+hOzpBd2CqcZfHbdTThOGJvoCmmDDY/
         5Rcb8MXQ1N6xFqCnJny6LsIqKYSQ0Ui5Q9N3EvLIryHZ02eoSUUuII/53oZ5D43hxEee
         hsI/TSuP5KsLwykPv0vPDW4kZr+MhndqEUGfAbhw6GGLA1UPS9hZbPRO2ZhX9dNuTBM5
         1LGNWHu+P2HNPy7FWHjAu4at9uHp/k6+SC2XnV0LmxFQw1iB5wwckwM9jW/VQh0ceixS
         Q7T0Wmdy7S2TsbCDcdUinw0qkLFKvXABTVxHZepeW0XoG9ZYDrizXs/ob5k4UXqdXrRq
         ojwA==
X-Gm-Message-State: AOAM530b7lRkAp5sGLWx1WcfW6hIEt3PEUedzYAtmTlbg97t/95WqhaO
        AiG3SDmRldNY8bgAwBJziPJshHhgSywxeEDLYMGTZ5UhIhR8
X-Google-Smtp-Source: ABdhPJzzqJWM+IoVdr+w0tJnO1rmZDKuYfc1BKxX9v+EyRrjqBqtctATVTL7fQ/E4fxJyBHfG8ssxOZbqDoQmtUOZ+PJ3AgNnz7C
MIME-Version: 1.0
X-Received: by 2002:a05:6602:5de:: with SMTP id w30mr12934814iox.36.1613402302024;
 Mon, 15 Feb 2021 07:18:22 -0800 (PST)
Date:   Mon, 15 Feb 2021 07:18:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000017937c05bb617f1d@google.com>
Subject: KASAN: use-after-free Read in v4l2_fh_open
From:   syzbot <syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    291009f6 Merge tag 'pm-5.11-rc8' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17260814d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a218c95bd23063a
dashboard link: https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
compiler:       Debian clang version 11.0.1-2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ec5814d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17179dd4d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in v4l2_fh_init drivers/media/v4l2-core/v4l2-fh.c:25 [inline]
BUG: KASAN: use-after-free in v4l2_fh_open+0xc7/0x430 drivers/media/v4l2-core/v4l2-fh.c:63
Read of size 8 at addr ffff8880228b88b8 by task v4l_id/18349

CPU: 1 PID: 18349 Comm: v4l_id Not tainted 5.11.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x137/0x1be lib/dump_stack.c:120
 print_address_description+0x5f/0x3a0 mm/kasan/report.c:230
 __kasan_report mm/kasan/report.c:396 [inline]
 kasan_report+0x15e/0x200 mm/kasan/report.c:413
 v4l2_fh_init drivers/media/v4l2-core/v4l2-fh.c:25 [inline]
 v4l2_fh_open+0xc7/0x430 drivers/media/v4l2-core/v4l2-fh.c:63
 em28xx_v4l2_open+0x15c/0xa60 drivers/media/usb/em28xx/em28xx-video.c:2163
 v4l2_open+0x229/0x360 drivers/media/v4l2-core/v4l2-dev.c:423
 chrdev_open+0x4a0/0x570 fs/char_dev.c:414
 do_dentry_open+0x7cb/0x1010 fs/open.c:817
 do_open fs/namei.c:3254 [inline]
 path_openat+0x2791/0x37a0 fs/namei.c:3371
 do_filp_open+0x191/0x3a0 fs/namei.c:3398
 do_sys_openat2+0xba/0x380 fs/open.c:1172
 do_sys_open fs/open.c:1188 [inline]
 __do_sys_open fs/open.c:1196 [inline]
 __se_sys_open fs/open.c:1192 [inline]
 __x64_sys_open+0x1af/0x1e0 fs/open.c:1192
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fdd62b00840
Code: 73 01 c3 48 8b 0d 68 77 20 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 83 3d 89 bb 20 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 1e f6 ff ff 48 89 04 24
RSP: 002b:00007ffe8bb255b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007ffe8bb25728 RCX: 00007fdd62b00840
RDX: 00007fdd62aecea0 RSI: 0000000000000000 RDI: 00007ffe8bb26f1c
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000002 R11: 0000000000000246 R12: 000055f8a7dee8d0
R13: 00007ffe8bb25720 R14: 0000000000000000 R15: 0000000000000000

The buggy address belongs to the page:
page:00000000b7dd9778 refcount:0 mapcount:-128 mapping:0000000000000000 index:0x0 pfn:0x228b8
flags: 0xfff00000000000()
raw: 00fff00000000000 ffffea0000580108 ffff88813fffb910 0000000000000000
raw: 0000000000000000 0000000000000002 00000000ffffff7f 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8880228b8780: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff8880228b8800: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff8880228b8880: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                        ^
 ffff8880228b8900: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff8880228b8980: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
