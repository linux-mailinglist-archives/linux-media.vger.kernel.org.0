Return-Path: <linux-media+bounces-23972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C109F9F5F
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 09:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F151A18911D0
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 08:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C081EE7A8;
	Sat, 21 Dec 2024 08:54:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB50C1AA7A9
	for <linux-media@vger.kernel.org>; Sat, 21 Dec 2024 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734771270; cv=none; b=MHuvj944vHmgQL4kY3q6bjqRgOIHQFjIF5gjmVZtb3hOfixpKK/Zdg7ng0WQe/XolmxWypO+oMLuAhek6GUomKxB9R2lcjvY+1b01Iok+a4eaqjb7KgWuoVkHajH8hwP0Ivi670zWiw6X2a00ItYR0rOzVJ4BMbIDJdRFE2Vjvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734771270; c=relaxed/simple;
	bh=DVaMhsl93I7OU/lCslFrjHzavZsQULqiOieLEcBjbbM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RBAJyAvfmp7s45FPwCwRujJalGdZ3WsU6bZDAjGCJeNj90TNN0xLxfy06zw9k4rl9sk+kJQkZ1nrGY9qhpBeiBViuJzXrwI3FZyinhYpHFSPKRvlYm81iMpLWHQlkyR5lsIEG6IIrlYPS2x+gWG0e3YgGK3mZlyxXpArONfr6KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3a91a13f63fso24388505ab.3
        for <linux-media@vger.kernel.org>; Sat, 21 Dec 2024 00:54:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734771268; x=1735376068;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GljFrsSQD2EB1YZ4GnfU+0EAnbNCw+T8QpbEx2X0uGQ=;
        b=P8ErRhav5sX52Wjt6LwfeVzfsKILSjlW5KRaSW0UEVjYSuM+y0PJvEMz+7KldVTk1Q
         b7Ceot7/47/FUez9InapZ22xOr/1ODbM5Q5T9wNZ8F4Pxe97E75dTzbYy39zQXVBxyAs
         9EyyEMVPMS3/0Vg01cp0glGqfiEVTEVeElz+tO97VjLDVEzMw/a/cUBfXJSbJ83zyj3l
         352PVSQD5ie83JyuGz+4jX6KROzgAt840ze+EzsmkgrA8n42PeIPnxv31gyd3qySREqJ
         WxWT/7PsAvW72iX1NNcJY0Ynwm+F3c+elpqLbbT2KBiiRmNygPe5OwKC0RFnXFtsYMdh
         RGBg==
X-Forwarded-Encrypted: i=1; AJvYcCWjmbNUeNJi8bNtG0FlPUbd6K4Q+sQSUnJjqMmUmgfZfKcv1le2Vdo9kxMdjFYtOvhS5hwd1IZcthupAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRyHcsAapJIh6YN/AZMv+IYn/od4tg7wdf6/cUxUy+dSQ+9Lw4
	KVFt6wIUN5q+HVyQ2OHGVKfgTt3R66B9YHa6u62ZaxDKJcw82IDSrwYfbQdNzJiv0wdwJtB/ShF
	IApODbvk2p7j8moBofynU9bGiEs2yacgfbokNwxPig04HWvTXaffrJhU=
X-Google-Smtp-Source: AGHT+IFOQf//d26EHAPhTlZ0A5KKFpPv6kBXPETm3xK05x+TgiWSM59irMfMPj5Io2zSRGRl76vY2ZWGQyzKKtzRtC/C6GfCz2md
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:190d:b0:3a7:7ded:521b with SMTP id
 e9e14a558f8ab-3c2d514f3ffmr51441335ab.17.1734771268177; Sat, 21 Dec 2024
 00:54:28 -0800 (PST)
Date: Sat, 21 Dec 2024 00:54:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67668244.050a0220.25abdd.012a.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in dvb_device_open
From: syzbot <syzbot+1eb177ecc3943b883f0a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    59dbb9d81adf Merge tag 'xsa465+xsa466-6.13-tag' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=142942df980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c22efbd20f8da769
dashboard link: https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c5dbdd280188/disk-59dbb9d8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9a6753a4cd2e/vmlinux-59dbb9d8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/aa643efa107f/bzImage-59dbb9d8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1eb177ecc3943b883f0a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in dvb_device_open+0x36a/0x3b0 drivers/media/dvb-core/dvbdev.c:99
Read of size 8 at addr ffff888029e2a018 by task syz.7.923/10944

CPU: 1 UID: 0 PID: 10944 Comm: syz.7.923 Not tainted 6.13.0-rc3-syzkaller-00026-g59dbb9d81adf #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/25/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 dvb_device_open+0x36a/0x3b0 drivers/media/dvb-core/dvbdev.c:99
 chrdev_open+0x237/0x6a0 fs/char_dev.c:414
 do_dentry_open+0xf59/0x1ea0 fs/open.c:945
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
RIP: 0033:0x7f6f1f385d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6f2011a038 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f6f1f576160 RCX: 00007f6f1f385d29
RDX: 0000000000040002 RSI: 0000000020000000 RDI: ffffffffffffff9c
RBP: 00007f6f1f401a20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f6f1f576160 R15: 00007ffccac03e88
 </TASK>

Allocated by task 1:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 dvb_register_device+0x1e2/0x2380 drivers/media/dvb-core/dvbdev.c:475
 dvb_register_frontend+0x5a7/0x880 drivers/media/dvb-core/dvb_frontend.c:3051
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:430 [inline]
 vidtv_bridge_probe+0x45e/0xa90 drivers/media/test-drivers/vidtv/vidtv_bridge.c:502
 platform_probe+0xff/0x1f0 drivers/base/platform.c:1404
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __driver_attach+0x283/0x580 drivers/base/dd.c:1216
 bus_for_each_dev+0x13c/0x1d0 drivers/base/bus.c:370
 bus_add_driver+0x2e9/0x690 drivers/base/bus.c:675
 driver_register+0x15c/0x4b0 drivers/base/driver.c:246
 vidtv_bridge_init+0x45/0x80 drivers/media/test-drivers/vidtv/vidtv_bridge.c:592
 do_one_initcall+0x128/0x630 init/main.c:1266
 do_initcall_level init/main.c:1328 [inline]
 do_initcalls init/main.c:1344 [inline]
 do_basic_setup init/main.c:1363 [inline]
 kernel_init_freeable+0x58f/0x8b0 init/main.c:1577
 kernel_init+0x1c/0x2b0 init/main.c:1466
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 10936:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:582
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4613 [inline]
 kfree+0x14f/0x4b0 mm/slub.c:4761
 dvb_free_device drivers/media/dvb-core/dvbdev.c:619 [inline]
 kref_put include/linux/kref.h:65 [inline]
 dvb_device_put.part.0+0x60/0x90 drivers/media/dvb-core/dvbdev.c:632
 dvb_device_put drivers/media/dvb-core/dvbdev.c:631 [inline]
 dvb_device_open+0x2a4/0x3b0 drivers/media/dvb-core/dvbdev.c:113
 chrdev_open+0x237/0x6a0 fs/char_dev.c:414
 do_dentry_open+0xf59/0x1ea0 fs/open.c:945
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

The buggy address belongs to the object at ffff888029e2a000
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 24 bytes inside of
 freed 256-byte region [ffff888029e2a000, ffff888029e2a100)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x29e2a
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801ac41b40 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000100010 00000001f5000000 0000000000000000
head: 00fff00000000040 ffff88801ac41b40 dead000000000122 0000000000000000
head: 0000000000000000 0000000000100010 00000001f5000000 0000000000000000
head: 00fff00000000001 ffffea0000a78a81 ffffffffffffffff 0000000000000000
head: 0000000000000002 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 13838120121, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1556
 prep_new_page mm/page_alloc.c:1564 [inline]
 get_page_from_freelist+0xfce/0x2f80 mm/page_alloc.c:3474
 __alloc_pages_noprof+0x223/0x25b0 mm/page_alloc.c:4751
 alloc_pages_mpol_noprof+0x2c9/0x610 mm/mempolicy.c:2269
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab mm/slub.c:2589 [inline]
 new_slab+0x2c9/0x410 mm/slub.c:2642
 ___slab_alloc+0xce2/0x1650 mm/slub.c:3830
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3920
 __slab_alloc_node mm/slub.c:3995 [inline]
 slab_alloc_node mm/slub.c:4156 [inline]
 __kmalloc_cache_noprof+0xf6/0x420 mm/slub.c:4324
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 dvb_register_device+0x1e2/0x2380 drivers/media/dvb-core/dvbdev.c:475
 dvb_register_frontend+0x5a7/0x880 drivers/media/dvb-core/dvb_frontend.c:3051
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:430 [inline]
 vidtv_bridge_probe+0x45e/0xa90 drivers/media/test-drivers/vidtv/vidtv_bridge.c:502
 platform_probe+0xff/0x1f0 drivers/base/platform.c:1404
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __driver_attach+0x283/0x580 drivers/base/dd.c:1216
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888029e29f00: fb fb fb fb fb fc fc fc fc fc fc fc fc fc fc fc
 ffff888029e29f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888029e2a000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff888029e2a080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888029e2a100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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

