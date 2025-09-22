Return-Path: <linux-media+bounces-42945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53512B91345
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 14:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4EEA18A3EDF
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 12:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA133081C1;
	Mon, 22 Sep 2025 12:49:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DB3288CA6
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758545371; cv=none; b=kya1ayKB5LGm5BPFyjGg1H9/eIz1rNIahzwBcDnJHigxKGnVKxo3vXmknjQYgmF/AkTmK7BXlj9e0v5KH5+LbuduHugl9RoWcNVefz1WfyY2uXBO67z0wWvstPiKa/L0QfQXpTXTmJG7GTfjUiRwgutRq4kCMeGVme+Bu87ryDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758545371; c=relaxed/simple;
	bh=G0y9X7TNMtVlzbZiOKf0IWGC49hjkC3FDGYjBRNKoyU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hsBl9Yrr2nTaAE1rSyb8KH/4y45zfWk3dxE+f4xtBsSbL/hubI+2HwIAuxDCoNKyYJ4DelnUWMq+biBHdWsvmxfwqkYcgK5T+s5UzejOnVrbp+R04N3E4odhQ+E6iehalMJJ7ducf4U/TDt/7s8KKVK84vPaA/mH3UlZUe/+fmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-4248adc62e0so27128605ab.2
        for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 05:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758545369; x=1759150169;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2EZgZnnONYs0RVP3NoxeQXUi9dswBt1SJz+Ube7nhw=;
        b=tZ2nYckZBHDqJRhVZ/HsqaSBdCOlUxmk88JEw0rwTEc9cupVLIuyHg5kqUBlPFtvxK
         reAM1CATGwUMzpESTTGjUD5PoEn4UBCaLSTq5dTnAPTx8EzkmmJl6yGZ2sOKfdCXPAS6
         sSEn2FY7ZkDiva6/AyQvjpaJ0GSLR3xalH22yUGElUfTmybhrsy7zusTs50pmqL5wjG1
         EISWy0yWh9KMT/uN8OHLzL5TsiBsUrhzIKbCVCitZV/1OoZ/RHvF0N3izTwt02zsf4Yw
         vbr810Jx9MvmJF/JmgPTRP4H+dl2q9zakNnvpQAfA02BATebHo1N5zDzVqr3NyuQQZvJ
         cOWw==
X-Forwarded-Encrypted: i=1; AJvYcCWOFmHtKi6G0waJyOfbOGpzr49INf/dJhfvehOHuPh2J4V13JqlrdC+HM8HNygcYT0Jo2bHlQSU6njbLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/40neDkWkg4wCN/u1YclcLj+NxZfUundLKt2D5EWSGPpccadc
	5uahY7+36pmFt9izrVwN85G3yzPI8v71BR2RTf5xP0S+1ARDHLHCY/CX7p8V70EHgwzCUj5Livw
	Hm1U0NGhLyz29+ENKMZEnCkoJUHGACUg1SfT90RNGB7oEapRrzcZMoIuxMsw=
X-Google-Smtp-Source: AGHT+IEIA65pPQvWpzBGBAMap+MKT1OdtaclxVxeI/hA4qFDds1ryLrsL2GwWDVMJP/E3qZt99cjKfB7SoP2WQ5+HSRJoMSw+ewo
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:218a:b0:424:9917:1762 with SMTP id
 e9e14a558f8ab-42499265b73mr117730095ab.30.1758545368970; Mon, 22 Sep 2025
 05:49:28 -0700 (PDT)
Date: Mon, 22 Sep 2025 05:49:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d145d8.050a0220.13cd81.05b4.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Write in dvb_device_put
From: syzbot <syzbot+d445a71e1c011b592c16@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d4b779985a6c Merge tag 'for-6.17/dm-fixes' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12bd2e42580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595e5938a1dd5b4e
dashboard link: https://syzkaller.appspot.com/bug?extid=d445a71e1c011b592c16
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9a84e163c589/disk-d4b77998.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/050f34576399/vmlinux-d4b77998.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7a561c0f3881/bzImage-d4b77998.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d445a71e1c011b592c16@syzkaller.appspotmail.com

R13: 00007fdf3abd6038 R14: 00007fdf3abd5fa0 R15: 00007ffc24915c58
 </TASK>
i2c i2c-0: dvb_frontend_start: failed to start kthread (-12)
==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
BUG: KASAN: slab-use-after-free in kref_put include/linux/kref.h:64 [inline]
BUG: KASAN: slab-use-after-free in dvb_device_put.part.0+0x22/0x90 drivers/media/dvb-core/dvbdev.c:632
Write of size 4 at addr ffff88802aae1610 by task syz.2.3292/14587

CPU: 1 UID: 0 PID: 14587 Comm: syz.2.3292 Tainted: G     U              syzkaller #0 PREEMPT(full) 
Tainted: [U]=USER
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/18/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcd/0x630 mm/kasan/report.c:482
 kasan_report+0xe0/0x110 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x100/0x1b0 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
 __refcount_sub_and_test include/linux/refcount.h:389 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 kref_put include/linux/kref.h:64 [inline]
 dvb_device_put.part.0+0x22/0x90 drivers/media/dvb-core/dvbdev.c:632
 dvb_device_put drivers/media/dvb-core/dvbdev.c:631 [inline]
 dvb_device_open+0x2a4/0x3b0 drivers/media/dvb-core/dvbdev.c:113
 chrdev_open+0x234/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x982/0x1530 fs/open.c:965
 vfs_open+0x82/0x3f0 fs/open.c:1095
 do_open fs/namei.c:3887 [inline]
 path_openat+0x1de4/0x2cb0 fs/namei.c:4046
 do_filp_open+0x20b/0x470 fs/namei.c:4073
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1435
 do_sys_open fs/open.c:1450 [inline]
 __do_sys_openat fs/open.c:1466 [inline]
 __se_sys_openat fs/open.c:1461 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1461
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fdf3a98eba9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fdf3b8e0038 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fdf3abd5fa0 RCX: 00007fdf3a98eba9
RDX: 0000000000000001 RSI: 0000200000000000 RDI: ffffffffffffff9c
RBP: 00007fdf3aa11e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fdf3abd6038 R14: 00007fdf3abd5fa0 R15: 00007ffc24915c58
 </TASK>

Allocated by task 1:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:388 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:405
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 dvb_register_device+0x1e4/0x2370 drivers/media/dvb-core/dvbdev.c:475
 dvb_register_frontend+0x5a6/0x880 drivers/media/dvb-core/dvb_frontend.c:3051
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:436 [inline]
 vidtv_bridge_probe+0x459/0xa90 drivers/media/test-drivers/vidtv/vidtv_bridge.c:508
 platform_probe+0x103/0x1d0 drivers/base/platform.c:1405
 call_driver_probe drivers/base/dd.c:581 [inline]
 really_probe+0x241/0xa90 drivers/base/dd.c:659
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:801
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:831
 __driver_attach+0x283/0x580 drivers/base/dd.c:1217
 bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:370
 bus_add_driver+0x2e9/0x690 drivers/base/bus.c:678
 driver_register+0x15c/0x4b0 drivers/base/driver.c:249
 vidtv_bridge_init+0x45/0x80 drivers/media/test-drivers/vidtv/vidtv_bridge.c:598
 do_one_initcall+0x120/0x6e0 init/main.c:1269
 do_initcall_level init/main.c:1331 [inline]
 do_initcalls init/main.c:1347 [inline]
 do_basic_setup init/main.c:1366 [inline]
 kernel_init_freeable+0x5c2/0x910 init/main.c:1579
 kernel_init+0x1c/0x2b0 init/main.c:1469
 ret_from_fork+0x56d/0x730 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 14593:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:243 [inline]
 __kasan_slab_free+0x60/0x70 mm/kasan/common.c:275
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2422 [inline]
 slab_free mm/slub.c:4695 [inline]
 kfree+0x2b4/0x4d0 mm/slub.c:4894
 dvb_free_device drivers/media/dvb-core/dvbdev.c:619 [inline]
 kref_put include/linux/kref.h:65 [inline]
 dvb_device_put.part.0+0x60/0x90 drivers/media/dvb-core/dvbdev.c:632
 dvb_device_put drivers/media/dvb-core/dvbdev.c:631 [inline]
 dvb_device_open+0x2a4/0x3b0 drivers/media/dvb-core/dvbdev.c:113
 chrdev_open+0x234/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x982/0x1530 fs/open.c:965
 vfs_open+0x82/0x3f0 fs/open.c:1095
 do_open fs/namei.c:3887 [inline]
 path_openat+0x1de4/0x2cb0 fs/namei.c:4046
 do_filp_open+0x20b/0x470 fs/namei.c:4073
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1435
 do_sys_open fs/open.c:1450 [inline]
 __do_sys_openat fs/open.c:1466 [inline]
 __se_sys_openat fs/open.c:1461 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1461
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802aae1600
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 16 bytes inside of
 freed 256-byte region [ffff88802aae1600, ffff88802aae1700)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2aae0
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b841b40 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b841b40 dead000000000122 0000000000000000
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffea0000aab801 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 19212219133, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1c0/0x230 mm/page_alloc.c:1851
 prep_new_page mm/page_alloc.c:1859 [inline]
 get_page_from_freelist+0x132b/0x38e0 mm/page_alloc.c:3858
 __alloc_frozen_pages_noprof+0x261/0x23f0 mm/page_alloc.c:5148
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:2492 [inline]
 allocate_slab mm/slub.c:2660 [inline]
 new_slab+0x247/0x330 mm/slub.c:2714
 ___slab_alloc+0xcf2/0x1750 mm/slub.c:3901
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3992
 __slab_alloc_node mm/slub.c:4067 [inline]
 slab_alloc_node mm/slub.c:4228 [inline]
 __kmalloc_cache_noprof+0xfb/0x3e0 mm/slub.c:4402
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 bus_add_driver+0x92/0x690 drivers/base/bus.c:662
 driver_register+0x15c/0x4b0 drivers/base/driver.c:249
 usb_register_driver+0x216/0x4d0 drivers/usb/core/driver.c:1078
 do_one_initcall+0x120/0x6e0 init/main.c:1269
 do_initcall_level init/main.c:1331 [inline]
 do_initcalls init/main.c:1347 [inline]
 do_basic_setup init/main.c:1366 [inline]
 kernel_init_freeable+0x5c2/0x910 init/main.c:1579
 kernel_init+0x1c/0x2b0 init/main.c:1469
 ret_from_fork+0x56d/0x730 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802aae1500: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802aae1580: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88802aae1600: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff88802aae1680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802aae1700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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

