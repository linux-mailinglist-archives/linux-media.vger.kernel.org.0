Return-Path: <linux-media+bounces-578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 508317F09F1
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 01:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DDF9280C77
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 00:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36A381D;
	Mon, 20 Nov 2023 00:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f208.google.com (mail-pl1-f208.google.com [209.85.214.208])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069F6E0
	for <linux-media@vger.kernel.org>; Sun, 19 Nov 2023 16:09:26 -0800 (PST)
Received: by mail-pl1-f208.google.com with SMTP id d9443c01a7336-1cc41aed6a5so48132085ad.0
        for <linux-media@vger.kernel.org>; Sun, 19 Nov 2023 16:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700438965; x=1701043765;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bm9eGPc0RwqPbRbgp3iTFtDeXXeqtjeXeTQl0nd1FoI=;
        b=F7IDaaihcUggKcaMhf+PQgybt/Y0JOvqri4sqs81NdzwdwBLY73JHI4NYUrGvdvI4M
         yH8wOkJOkjqCE/P+DezBkPUzunbq5hkwe2SECiIuyn48bJBe1GBFfXGOKCqK9Mcw1kFH
         LSZZF0decDHjdnLqwGrludQiR4KyWYkjtrx3lF8RwM4iW2V/zrssykBsxOga5RYcsvqT
         iBPPX7eimU+An43zPSb/M/kWtbcvc2TxsFEKFL9N/gi6LpS3kQhWv7ND3vXwSSk/LE8A
         H1Kw5o3L2FZ6oY0XLckRAcy6M4hKQ6qmonxdZUj892KsqRFNLTBLK/DYaP0wRKWzNZ7D
         bsLQ==
X-Gm-Message-State: AOJu0YyqBqkRw/puzbYmHlBloiincxhaT0xL0SJBvbxJqC9gI8+NSFWp
	GHhf38Z5g/vjEfyFNgaklujc8AAZsSmPvQQk/VuXAveSHVno
X-Google-Smtp-Source: AGHT+IE+tfsFbkR7yz8cn8gaIyXCEYM3FadsbSsqz2LGgiXDKBu6dN0M+i8azKecC/7TiH14onfmFR9HmffSM7xYWD7i5/LM1Qca
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a17:902:7792:b0:1cc:4327:8bbc with SMTP id
 o18-20020a170902779200b001cc43278bbcmr1559454pll.10.1700438965521; Sun, 19
 Nov 2023 16:09:25 -0800 (PST)
Date: Sun, 19 Nov 2023 16:09:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000809328060a8a4c1c@google.com>
Subject: [syzbot] [staging?] [usb?] memory leak in _r8712_init_xmit_priv (2)
From: syzbot <syzbot+83763e624cfec6b462cb@syzkaller.appspotmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c42d9eeef8e5 Merge tag 'hardening-v6.7-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13bff22f680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e71d284dd6560ca8
dashboard link: https://syzkaller.appspot.com/bug?extid=83763e624cfec6b462cb
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1564223f680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17a7c024e80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/026cc0fc446f/disk-c42d9eee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c4b4d6d092c1/vmlinux-c42d9eee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1865f885e9d6/bzImage-c42d9eee.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+83763e624cfec6b462cb@syzkaller.appspotmail.com

executing program
BUG: memory leak
unreferenced object 0xffff888107a5c000 (size 4096):
  comm "kworker/1:0", pid 22, jiffies 4294943134 (age 18.720s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff816337cd>] kmemleak_alloc_recursive include/linux/kmemleak.h:42 [inline]
    [<ffffffff816337cd>] slab_post_alloc_hook mm/slab.h:766 [inline]
    [<ffffffff816337cd>] slab_alloc_node mm/slub.c:3478 [inline]
    [<ffffffff816337cd>] __kmem_cache_alloc_node+0x2dd/0x3f0 mm/slub.c:3517
    [<ffffffff8157e625>] kmalloc_trace+0x25/0x90 mm/slab_common.c:1098
    [<ffffffff83cee442>] kmalloc include/linux/slab.h:600 [inline]
    [<ffffffff83cee442>] _r8712_init_xmit_priv+0x2b2/0x6e0 drivers/staging/rtl8712/rtl871x_xmit.c:130
    [<ffffffff83ce9033>] r8712_init_drv_sw+0xc3/0x290 drivers/staging/rtl8712/os_intfs.c:311
    [<ffffffff83ce7ce6>] r871xu_drv_init+0x1c6/0x920 drivers/staging/rtl8712/usb_intf.c:386
    [<ffffffff832d0f0b>] usb_probe_interface+0x16b/0x3a0 drivers/usb/core/driver.c:396
    [<ffffffff82c3bb06>] call_driver_probe drivers/base/dd.c:579 [inline]
    [<ffffffff82c3bb06>] really_probe+0x126/0x440 drivers/base/dd.c:658
    [<ffffffff82c3bee3>] __driver_probe_device+0xc3/0x190 drivers/base/dd.c:800
    [<ffffffff82c3bfda>] driver_probe_device+0x2a/0x120 drivers/base/dd.c:830
    [<ffffffff82c3c1d4>] __device_attach_driver+0x104/0x160 drivers/base/dd.c:958
    [<ffffffff82c38f5d>] bus_for_each_drv+0xcd/0x120 drivers/base/bus.c:457
    [<ffffffff82c3c6fa>] __device_attach+0xfa/0x290 drivers/base/dd.c:1030
    [<ffffffff82c3a6ca>] bus_probe_device+0xca/0xd0 drivers/base/bus.c:532
    [<ffffffff82c36b7e>] device_add+0x9be/0xc90 drivers/base/core.c:3625
    [<ffffffff832cdfd7>] usb_set_configuration+0x967/0xc70 drivers/usb/core/message.c:2207
    [<ffffffff832e0cac>] usb_generic_driver_probe+0x9c/0xf0 drivers/usb/core/generic.c:238

BUG: memory leak
unreferenced object 0xffff888107a59000 (size 4096):
  comm "kworker/1:0", pid 22, jiffies 4294943134 (age 18.720s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff816337cd>] kmemleak_alloc_recursive include/linux/kmemleak.h:42 [inline]
    [<ffffffff816337cd>] slab_post_alloc_hook mm/slab.h:766 [inline]
    [<ffffffff816337cd>] slab_alloc_node mm/slub.c:3478 [inline]
    [<ffffffff816337cd>] __kmem_cache_alloc_node+0x2dd/0x3f0 mm/slub.c:3517
    [<ffffffff8157e625>] kmalloc_trace+0x25/0x90 mm/slab_common.c:1098
    [<ffffffff83cee442>] kmalloc include/linux/slab.h:600 [inline]
    [<ffffffff83cee442>] _r8712_init_xmit_priv+0x2b2/0x6e0 drivers/staging/rtl8712/rtl871x_xmit.c:130
    [<ffffffff83ce9033>] r8712_init_drv_sw+0xc3/0x290 drivers/staging/rtl8712/os_intfs.c:311
    [<ffffffff83ce7ce6>] r871xu_drv_init+0x1c6/0x920 drivers/staging/rtl8712/usb_intf.c:386
    [<ffffffff832d0f0b>] usb_probe_interface+0x16b/0x3a0 drivers/usb/core/driver.c:396
    [<ffffffff82c3bb06>] call_driver_probe drivers/base/dd.c:579 [inline]
    [<ffffffff82c3bb06>] really_probe+0x126/0x440 drivers/base/dd.c:658
    [<ffffffff82c3bee3>] __driver_probe_device+0xc3/0x190 drivers/base/dd.c:800
    [<ffffffff82c3bfda>] driver_probe_device+0x2a/0x120 drivers/base/dd.c:830
    [<ffffffff82c3c1d4>] __device_attach_driver+0x104/0x160 drivers/base/dd.c:958
    [<ffffffff82c38f5d>] bus_for_each_drv+0xcd/0x120 drivers/base/bus.c:457
    [<ffffffff82c3c6fa>] __device_attach+0xfa/0x290 drivers/base/dd.c:1030
    [<ffffffff82c3a6ca>] bus_probe_device+0xca/0xd0 drivers/base/bus.c:532
    [<ffffffff82c36b7e>] device_add+0x9be/0xc90 drivers/base/core.c:3625
    [<ffffffff832cdfd7>] usb_set_configuration+0x967/0xc70 drivers/usb/core/message.c:2207
    [<ffffffff832e0cac>] usb_generic_driver_probe+0x9c/0xf0 drivers/usb/core/generic.c:238

BUG: memory leak
unreferenced object 0xffff888108475000 (size 4096):
  comm "kworker/1:0", pid 22, jiffies 4294943134 (age 18.720s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff816337cd>] kmemleak_alloc_recursive include/linux/kmemleak.h:42 [inline]
    [<ffffffff816337cd>] slab_post_alloc_hook mm/slab.h:766 [inline]
    [<ffffffff816337cd>] slab_alloc_node mm/slub.c:3478 [inline]
    [<ffffffff816337cd>] __kmem_cache_alloc_node+0x2dd/0x3f0 mm/slub.c:3517
    [<ffffffff8157e625>] kmalloc_trace+0x25/0x90 mm/slab_common.c:1098
    [<ffffffff83cee442>] kmalloc include/linux/slab.h:600 [inline]
    [<ffffffff83cee442>] _r8712_init_xmit_priv+0x2b2/0x6e0 drivers/staging/rtl8712/rtl871x_xmit.c:130
    [<ffffffff83ce9033>] r8712_init_drv_sw+0xc3/0x290 drivers/staging/rtl8712/os_intfs.c:311
    [<ffffffff83ce7ce6>] r871xu_drv_init+0x1c6/0x920 drivers/staging/rtl8712/usb_intf.c:386
    [<ffffffff832d0f0b>] usb_probe_interface+0x16b/0x3a0 drivers/usb/core/driver.c:396
    [<ffffffff82c3bb06>] call_driver_probe drivers/base/dd.c:579 [inline]
    [<ffffffff82c3bb06>] really_probe+0x126/0x440 drivers/base/dd.c:658
    [<ffffffff82c3bee3>] __driver_probe_device+0xc3/0x190 drivers/base/dd.c:800
    [<ffffffff82c3bfda>] driver_probe_device+0x2a/0x120 drivers/base/dd.c:830
    [<ffffffff82c3c1d4>] __device_attach_driver+0x104/0x160 drivers/base/dd.c:958
    [<ffffffff82c38f5d>] bus_for_each_drv+0xcd/0x120 drivers/base/bus.c:457
    [<ffffffff82c3c6fa>] __device_attach+0xfa/0x290 drivers/base/dd.c:1030
    [<ffffffff82c3a6ca>] bus_probe_device+0xca/0xd0 drivers/base/bus.c:532
    [<ffffffff82c36b7e>] device_add+0x9be/0xc90 drivers/base/core.c:3625
    [<ffffffff832cdfd7>] usb_set_configuration+0x967/0xc70 drivers/usb/core/message.c:2207
    [<ffffffff832e0cac>] usb_generic_driver_probe+0x9c/0xf0 drivers/usb/core/generic.c:238



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

