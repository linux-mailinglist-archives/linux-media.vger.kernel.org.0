Return-Path: <linux-media+bounces-31650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3801AA7CA0
	for <lists+linux-media@lfdr.de>; Sat,  3 May 2025 01:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B5F51B66164
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 23:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D342236FC;
	Fri,  2 May 2025 23:13:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F78B21FF55
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 23:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746227614; cv=none; b=g77zI3/3DPTUGscHFZht4Okk1gOBIt+2vlheA4LKfUhhf+bXSnkom2qUnEbYbrBN+SBiU6thwsa2fSWG+7B7kZRfI8NH/f9REkpWAckGvUWuQNMDRhd9QJEnSy0T91BKkdFAg9IxQIf6salPFnjscFFVfFDfQmFfmExcPT+DDcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746227614; c=relaxed/simple;
	bh=hV7kTPDHreyPAcIoriPxeZFaDDHnSicWx4ZXGMm94ms=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=cob0O4QjoKAktbqua9XTNoVHmE+5sQSQadfznqYfWFQoj3NacB7+h75eIbtpwp3p/BmEF6OAZ8O97mgOqF6FspOVibT2mCEeAEDnVZYot0+ers/lT1lE2HdAFU2GliXs3bfkf5clrdFTgYpSLEsQkEqBxXz8YF2c8h6xS6842qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d922570570so36432195ab.3
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 16:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746227611; x=1746832411;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CfzIXoXve5NhzkSCXTxc2L92iQlA2dipz3mRycw6QpU=;
        b=ovkZpswSGPAa5sjeWxRewxSIYbSTEU4BrjLf5Vq4FqGV8WG5ueMxN8HOclUvSzSz2l
         yG6h51ADvfrBhaNprYPX5XDatSBkPQ9lyUaQRD29b2vXu/KSS5V8fNhkn0xB26CZF/8X
         YCegZpRj+xM1BaxmElgtbIh1GS17jxTaSkYeRPw7pLJm1fvU2JUAy97iI24hnO/dRX8e
         tUIaBa8Jl9Gg3NACIHPFsr8as9wfzmG+ST8VWQTx1hzy8gqwdZywxQ7GA98M0N1hLGW4
         3vGCJGAjIbL3wCFszufQ1jU8E6hbFU9OXA/5+ojvM7qtF8SUkTPAwqYZ55UvhDg65b3Z
         xxgg==
X-Forwarded-Encrypted: i=1; AJvYcCVNo9GJL36ohw1o6UY24UT2XVy6Vk1uNUfJFYzlrpheE8izRYlhouytw1Yu7qG6wxoND08Oj1j+6HHCIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLAAZbD7vSwlLOPid/GwFJwQALfK99KI14PXHyfZjikTgs1SZ5
	JEiqjv4U68EXh2gs9GPigFBkc4796a91tdMdtYXnmukT5JvVr7JOgqApj1ytDao1s1uaVTfym/x
	Ql2eOE6GevwI3PPB1e9EB8qthQngOENCGDMMG/yQMBXEuxQkDvNmBRFM=
X-Google-Smtp-Source: AGHT+IH/Iv57L3y0KRGXmyxHwz806ITMwwhaF4exQZcf/I4Sc5Tx3T5HPJNi4Nkp550mnXzXMeEJshCE/E3G54j5b2LrmWX+5e5G
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:144d:b0:3d8:2178:5c79 with SMTP id
 e9e14a558f8ab-3d97c17f592mr51571725ab.7.1746227611639; Fri, 02 May 2025
 16:13:31 -0700 (PDT)
Date: Fri, 02 May 2025 16:13:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6815519b.a70a0220.254cdc.000b.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Write in as102_release (2)
From: syzbot <syzbot+47321e8fd5a4c84088db@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    588d032e9e56 usb: misc: onboard_usb_dev: Add Parade PS5511..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=162cf774580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9354c815d9df4c56
dashboard link: https://syzkaller.appspot.com/bug?extid=47321e8fd5a4c84088db
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4c5de1303e89/disk-588d032e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3eb2789cc639/vmlinux-588d032e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/184279e82598/bzImage-588d032e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+47321e8fd5a4c84088db@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
BUG: KASAN: slab-use-after-free in kref_put include/linux/kref.h:64 [inline]
BUG: KASAN: slab-use-after-free in as102_release+0x56/0x110 drivers/media/usb/as102/as102_usb_drv.c:456
Write of size 4 at addr ffff888108698150 by task syz.4.4220/22549

CPU: 0 UID: 0 PID: 22549 Comm: syz.4.4220 Not tainted 6.15.0-rc4-syzkaller-00104-g588d032e9e56 #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xc3/0x670 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0xef/0x1a0 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
 __refcount_sub_and_test include/linux/refcount.h:389 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 kref_put include/linux/kref.h:64 [inline]
 as102_release+0x56/0x110 drivers/media/usb/as102/as102_usb_drv.c:456
 __fput+0x3ff/0xb70 fs/file_table.c:465
 task_work_run+0x14d/0x240 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xafb/0x2c30 kernel/exit.c:953
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1102
 get_signal+0x2673/0x26d0 kernel/signal.c:3034
 arch_do_signal_or_restart+0x8f/0x7d0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x147/0x260 kernel/entry/common.c:218
 do_syscall_64+0xda/0x260 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4a74c3e969
Code: Unable to access opcode bytes at 0x7f4a74c3e93f.
RSP: 002b:00007f4a732860e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
RAX: 0000000000000000 RBX: 00007f4a74e66088 RCX: 00007f4a74c3e969
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007f4a74e66088
RBP: 00007f4a74e66080 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f4a74e6608c
R13: 0000000000000000 R14: 00007ffc75a3f3a0 R15: 00007ffc75a3f488
 </TASK>

Allocated by task 11896:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 as102_usb_probe+0x54/0xb00 drivers/media/usb/as102/as102_usb_drv.c:348
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_set_configuration+0x1187/0x1e20 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_new_device+0xd07/0x1a20 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5535 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
 port_event drivers/usb/core/hub.c:5835 [inline]
 hub_event+0x2f85/0x5030 drivers/usb/core/hub.c:5917
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 11896:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2398 [inline]
 slab_free mm/slub.c:4656 [inline]
 kfree+0x286/0x470 mm/slub.c:4855
 as102_usb_probe+0x697/0xb00 drivers/media/usb/as102/as102_usb_drv.c:410
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_set_configuration+0x1187/0x1e20 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_new_device+0xd07/0x1a20 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5535 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
 port_event drivers/usb/core/hub.c:5835 [inline]
 hub_event+0x2f85/0x5030 drivers/usb/core/hub.c:5917
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888108698000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 336 bytes inside of
 freed 4096-byte region [ffff888108698000, ffff888108699000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x108698
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x200000000000040(head|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000040 ffff888100042140 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 0200000000000040 ffff888100042140 dead000000000122 0000000000000000
head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
head: 0200000000000003 ffffea000421a601 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 11896, tgid 11896 (kworker/0:8), ts 2923796737966, free_ts 2922585023685
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0xfec/0x2d90 mm/page_alloc.c:3688
 __alloc_frozen_pages_noprof+0x25c/0x2160 mm/page_alloc.c:4970
 alloc_pages_mpol+0xe4/0x410 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2468 [inline]
 allocate_slab mm/slub.c:2632 [inline]
 new_slab+0x244/0x340 mm/slub.c:2686
 ___slab_alloc+0xda5/0x1940 mm/slub.c:3872
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3962
 __slab_alloc_node mm/slub.c:4037 [inline]
 slab_alloc_node mm/slub.c:4198 [inline]
 __kmalloc_cache_noprof+0x209/0x3c0 mm/slub.c:4367
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 as102_usb_probe+0x54/0xb00 drivers/media/usb/as102/as102_usb_drv.c:348
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
page last free pid 5535 tgid 5535 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1262 [inline]
 __free_frozen_pages+0x66c/0xe70 mm/page_alloc.c:2725
 discard_slab mm/slub.c:2730 [inline]
 __put_partials+0x16d/0x1c0 mm/slub.c:3199
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x4e/0x70 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4161 [inline]
 slab_alloc_node mm/slub.c:4210 [inline]
 kmem_cache_alloc_noprof+0x14f/0x3b0 mm/slub.c:4217
 getname_flags.part.0+0x4c/0x550 fs/namei.c:146
 getname_flags+0x93/0xf0 include/linux/audit.h:322
 getname include/linux/fs.h:2852 [inline]
 do_sys_openat2+0xb8/0x1d0 fs/open.c:1423
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_openat fs/open.c:1460 [inline]
 __se_sys_openat fs/open.c:1455 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1455
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888108698000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888108698080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888108698100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                 ^
 ffff888108698180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888108698200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

