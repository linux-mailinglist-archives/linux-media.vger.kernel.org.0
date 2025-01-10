Return-Path: <linux-media+bounces-24618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E0A09258
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 14:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1BCE18816AB
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 13:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943D720E6E4;
	Fri, 10 Jan 2025 13:44:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DC520E321
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 13:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516668; cv=none; b=WonsMJsiRmGe5jBBhjdq/Zrxab/8djp7NF6ERPh6bem9MOlaPX2lcczJcxw/xWR9bdp9v0ZvYHpVp3LUGRIRbIwWWgK7oHPHi9xu/90o6Ak6bdUrTLesPhh+zxI4HMPcU1k0Mk+XNmhbVb1bbbo3CwVipFsWnJX6C2k14slCEVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516668; c=relaxed/simple;
	bh=ua/zRXZyy2j1KWMtwzgMYn30YomGq8bXiZjcEBr+Gsk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gYHPoN3BHHKZqFEsHKF9F73o4cigUu/+DgLzNy+mn0Run+a4WtjodueG3NDxv8Di1bKK6oRMfbC8IV3SE0U4ekasXWA9YzeQElsioccc7BpjdOU1yKWwfoGLmNTVYmEik0b+aMJ97IktWEVI2egBDJduQlUhJCAerusQ882lYz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3a81684bac0so33427745ab.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 05:44:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736516665; x=1737121465;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RFcp1hEosRKTTqtqEOo69oecJR2ucbqHU5jkIr1zeQ=;
        b=akOUe61yyoBSqyGOaLeyCXAXmRJLtPtayp8YFVQqRWOpEklqRfNo2lRa3OpsG3XNTP
         Qkc+1gl3kHips6OVuHQu7HHPMMiAoi1e52IjnOs8yxA16U+jYZp1BAm27nlLEmC2KlrS
         3TPpZ5xa114F95W3rrVVE7EuaEp0mvsaGUuYuwQIEDkbQzhc2+PZ4MQmphusqo7ci6JU
         AM5Tzy66k9S7sm+ARwGz25MzJ3w8OzPsZOsgeizwA5eN18rnmaWPx3N8sAR6iMcHicjf
         uIEodjvKjz4WGzvocjS1goyXw28EK/WSnuiKFciqKS7wAI+s4e6IPJgs5uKdQYu3VMis
         FGDw==
X-Forwarded-Encrypted: i=1; AJvYcCUu/J28arkFfGWNqROAOiNrATyEKJjxtHEOJZtp7f0Z0LnfLVopSyPViMO7R87wEao195St+OFEhEPySQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPi+nRMnS/ZBGEykASR2bmbKEerbweD/xrlY6TphK9yyR9gWGD
	aTg6vcbVyTzsmEnDv17sm8aqviehEDZODjGKE0X9ZDxrDIKAzpEnCVTqu0I9L4AfJg+32OiTU7E
	farBiP0JuvprVnXhCfHGzwTjv91Se0v93GrB9gFSzcrYTLNy6nK+znU8=
X-Google-Smtp-Source: AGHT+IHSTbM5rKmMmSiYZgKE0xbfqBKxA33IHSMcGke8BS92j1OmvD1HcS++8Xa/0ZrqJrlsbPiKIAA95OA2SkIlz7uCnJQGOIl1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f8a:b0:3cb:f2e6:5590 with SMTP id
 e9e14a558f8ab-3ce3a7abde0mr93534425ab.0.1736516665248; Fri, 10 Jan 2025
 05:44:25 -0800 (PST)
Date: Fri, 10 Jan 2025 05:44:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67812439.050a0220.216c54.0010.GAE@google.com>
Subject: [syzbot] [media?] KASAN: use-after-free Read in em28xx_v4l2_open
From: syzbot <syzbot+f49137d13c521670729e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f1a2241778d9 usb: typec: ucsi: Implement ChromeOS UCSI dri..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=17424edf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e27867f71e8bc406
dashboard link: https://syzkaller.appspot.com/bug?extid=f49137d13c521670729e
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/637d8b06e4f6/disk-f1a22417.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c3511b47d743/vmlinux-f1a22417.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d923c98af39e/bzImage-f1a22417.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f49137d13c521670729e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __mutex_waiter_is_first kernel/locking/mutex.c:172 [inline]
BUG: KASAN: use-after-free in __mutex_lock_common kernel/locking/mutex.c:667 [inline]
BUG: KASAN: use-after-free in __mutex_lock+0x96b/0xa60 kernel/locking/mutex.c:735
Read of size 8 at addr ffff888123869b30 by task v4l_id/28455

CPU: 0 UID: 0 PID: 28455 Comm: v4l_id Not tainted 6.13.0-rc4-syzkaller-00080-gf1a2241778d9 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 __mutex_waiter_is_first kernel/locking/mutex.c:172 [inline]
 __mutex_lock_common kernel/locking/mutex.c:667 [inline]
 __mutex_lock+0x96b/0xa60 kernel/locking/mutex.c:735
 em28xx_v4l2_open+0x22c/0x7e0 drivers/media/usb/em28xx/em28xx-video.c:2150
 v4l2_open+0x222/0x490 drivers/media/v4l2-core/v4l2-dev.c:429
 chrdev_open+0x237/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x6cb/0x1390 fs/open.c:945
 vfs_open+0x82/0x3f0 fs/open.c:1075
 do_open fs/namei.c:3828 [inline]
 path_openat+0x1e6a/0x2d60 fs/namei.c:3987
 do_filp_open+0x20c/0x470 fs/namei.c:4014
 do_sys_openat2+0x17a/0x1e0 fs/open.c:1402
 do_sys_open fs/open.c:1417 [inline]
 __do_sys_openat fs/open.c:1433 [inline]
 __se_sys_openat fs/open.c:1428 [inline]
 __x64_sys_openat+0x175/0x210 fs/open.c:1428
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9e668f39a4
Code: 24 20 48 8d 44 24 30 48 89 44 24 28 64 8b 04 25 18 00 00 00 85 c0 75 2c 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 76 60 48 8b 15 55 a4 0d 00 f7 d8 64 89 02 48 83
RSP: 002b:00007ffc1b3c97a0 EFLAGS: 00000246
 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007ffc1b3c99b8 RCX: 00007f9e668f39a4
RDX: 0000000000000000 RSI: 00007ffc1b3caf22 RDI: 00000000ffffff9c
RBP: 00007ffc1b3caf22 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc1b3c99d0 R14: 000055a2b40c3670 R15: 00007f9e66d42a80
 </TASK>

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888100000004 pfn:0x123869
flags: 0x200000000000000(node=0|zone=2)
raw: 0200000000000000 0000000000000000 ffffffffffffffff 0000000000000000
raw: ffff888100000004 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed
page last allocated via order 2, migratetype Unmovable, gfp_mask 0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), pid 9, tgid 9 (kworker/0:1), ts 2999230831583, free_ts 3004034271205
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1558
 prep_new_page mm/page_alloc.c:1566 [inline]
 get_page_from_freelist+0xe76/0x2b90 mm/page_alloc.c:3476
 __alloc_pages_noprof+0x21c/0x22a0 mm/page_alloc.c:4753
 __alloc_pages_node_noprof include/linux/gfp.h:269 [inline]
 alloc_pages_node_noprof include/linux/gfp.h:296 [inline]
 ___kmalloc_large_node+0x84/0x1b0 mm/slub.c:4243
 __kmalloc_large_noprof+0x1c/0x70 mm/slub.c:4260
 kmalloc_noprof include/linux/slab.h:898 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 em28xx_usb_probe+0x1db/0x3720 drivers/media/usb/em28xx/em28xx-cards.c:3908
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
page last free pid 9 tgid 9 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_page+0x661/0xe40 mm/page_alloc.c:2659
 __folio_put+0x1e8/0x2d0 mm/swap.c:112
 em28xx_free_device drivers/media/usb/em28xx/em28xx-cards.c:3566 [inline]
 kref_put include/linux/kref.h:65 [inline]
 em28xx_usb_disconnect+0x3a5/0x610 drivers/media/usb/em28xx/em28xx-cards.c:4207
 usb_unbind_interface+0x1e2/0x960 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:561
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:576
 device_del+0x396/0x9f0 drivers/base/core.c:3854
 usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2304
 hub_port_connect drivers/usb/core/hub.c:5361 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Memory state around the buggy address:
 ffff888123869a00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888123869a80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff888123869b00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                     ^
 ffff888123869b80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888123869c00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

