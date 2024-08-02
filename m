Return-Path: <linux-media+bounces-15721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69523945926
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 09:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2511C286CED
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 07:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81A11BF301;
	Fri,  2 Aug 2024 07:49:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C269C4D8CC
	for <linux-media@vger.kernel.org>; Fri,  2 Aug 2024 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722584961; cv=none; b=SdABIH4MTGiWpbVxgnH0krg3Xc0w5hRVbUT7scPfI8IzcAnmC18qeobR/dNfy90dxzeHrBvQj4W7RlPkXO5FCzcZD8tvRbNqyl/UC1eaN7Km5lWiygUzPTTWcMCsmB7BZuTJTrpHZ45l8yAbEiXQiEK+5X9Zdp15WdDZAEbeorw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722584961; c=relaxed/simple;
	bh=UU0F1/EUltQpjH9awVRXpjLqsO2sRafg/dITiDBAiLI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HkzWFeJ0YAftx3+nD9llqMYSYzSDVsaSS3cfdQP4djjYrGh8HHD0w8MjQ8grbX9HhsgZMAn/aaka6vFPUMSuqSj2+Rv/1XcoMMgixVXW5W978AlOtJmduEJuo5eNy4PizTjMydF+MF97igfUVTJOfTns5bmSySOTSZuG5GoId2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-81f8edd731cso1113545239f.0
        for <linux-media@vger.kernel.org>; Fri, 02 Aug 2024 00:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722584959; x=1723189759;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92lXj3Vb44eyllG2vHCIL/SyzrpHYEhu/JLd1zyyRqg=;
        b=ahR5GW9Xcbx5+DC0OjMBPSaAzyIc9uQTdIxA5am1iNkAhXfUWfG3C0mHIAGSDfB4jX
         dBwiKeMXCGd0mO5WgCx3IgP8HPbMPeB1Rs2soCseWrdUSyJRiKAMsF94cSuU9M7fX2pb
         yENEtEsLlemzK44YtGpjqT/Ao1WUBkZXYmAtFU0XaiMmrgI/fb5wcpc4Cylajkd9aF8U
         zRGJbOTMABVF3Xv1CcfAH57tHnIxX8OLhlOrZdYIH8QPTbqAgPblkjbI9G3nn+hBzfsV
         i0vaGIwxgTfdb+kv+OXSdLgry0cCGxmEhr50AZQX9L+TRahSYiQl36H34FUatIxc7dBA
         E58A==
X-Forwarded-Encrypted: i=1; AJvYcCXk6ZsRjjl7bKojJRCW3lZnWDXax2dBmBeese9uAbafZ9SfHTTzY2FpkCnG/ctK2ONhN3E43vj1T6vngag6gZ7HOLBaB+4v5RIN0k4=
X-Gm-Message-State: AOJu0Yw05i7O7CEUD5nOTwezdieltPdROQTCoM7m6/xmIDLMs5DdFgcw
	5Dkn3obyOCJ9VSRFktL9dI7HCGh80Ca6CNFro9W7KPXvLOhnyJqE+0fnnvKWgWn7BaEhdCYn9uh
	Rbe4xNShD52arjztHiPZA/IIEvGdWe55ddDEZ5mXa5jNy76pQuGsLhVI=
X-Google-Smtp-Source: AGHT+IH0QgN5RY5nLV9RAozx2i4g4uqe5aSF7gVidnVwTVgPlxr5BF5mxvri5IR5TIiVU3++JsJcIEDaYkFQ5tLoHSpW4sxRjzbP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8717:b0:4c0:838e:9fd1 with SMTP id
 8926c6da1cb9f-4c8d56b0085mr102646173.5.1722584958937; Fri, 02 Aug 2024
 00:49:18 -0700 (PDT)
Date: Fri, 02 Aug 2024 00:49:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000092be0b061eae907e@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in em28xx_release_resources
From: syzbot <syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6342649c33d2 Merge tag 'block-6.11-20240726' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=159feda1980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5efb917b1462a973
dashboard link: https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f7155d1516ca/disk-6342649c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f724a979b927/vmlinux-6342649c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/480121fc37f0/bzImage-6342649c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com

em28xx 5-1:0.0: Closing input extension
==================================================================
BUG: KASAN: slab-use-after-free in media_device_unregister+0x154/0x470
Read of size 8 at addr ffff888058df4210 by task kworker/0:1/9

CPU: 0 UID: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.10.0-syzkaller-12881-g6342649c33d2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:119
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:488
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 media_device_unregister+0x154/0x470
 em28xx_unregister_media_device drivers/media/usb/em28xx/em28xx-cards.c:3511 [inline]
 em28xx_release_resources+0xa7/0x230 drivers/media/usb/em28xx/em28xx-cards.c:3532
 em28xx_usb_disconnect+0x1cc/0x530 drivers/media/usb/em28xx/em28xx-cards.c:4201
 usb_unbind_interface+0x25e/0x940 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:568 [inline]
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x503/0x7c0 drivers/base/dd.c:1295
 bus_remove_device+0x34f/0x420 drivers/base/bus.c:574
 device_del+0x57a/0x9b0 drivers/base/core.c:3868
 usb_disable_device+0x3bf/0x850 drivers/usb/core/message.c:1418
 usb_disconnect+0x340/0x950 drivers/usb/core/hub.c:2304
 hub_port_connect drivers/usb/core/hub.c:5361 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x1eb9/0x5150 drivers/usb/core/hub.c:5903
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd40 kernel/workqueue.c:3390
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 31851:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:370 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:387
 kasan_kmalloc include/linux/kasan.h:211 [inline]
 __kmalloc_cache_noprof+0x19c/0x2c0 mm/slub.c:4189
 kmalloc_noprof include/linux/slab.h:681 [inline]
 kzalloc_noprof include/linux/slab.h:807 [inline]
 em28xx_v4l2_init+0xfd/0x2f40 drivers/media/usb/em28xx/em28xx-video.c:2534
 em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd40 kernel/workqueue.c:3390
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 31851:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:579
 poison_slab_object+0xe0/0x150 mm/kasan/common.c:240
 __kasan_slab_free+0x37/0x60 mm/kasan/common.c:256
 kasan_slab_free include/linux/kasan.h:184 [inline]
 slab_free_hook mm/slub.c:2252 [inline]
 slab_free mm/slub.c:4473 [inline]
 kfree+0x149/0x360 mm/slub.c:4594
 em28xx_free_v4l2 drivers/media/usb/em28xx/em28xx-video.c:2120 [inline]
 kref_put include/linux/kref.h:65 [inline]
 em28xx_v4l2_init+0x16d7/0x2f40 drivers/media/usb/em28xx/em28xx-video.c:2903
 em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd40 kernel/workqueue.c:3390
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

The buggy address belongs to the object at ffff888058df4000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 528 bytes inside of
 freed 8192-byte region [ffff888058df4000, ffff888058df6000)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x58df0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xfdffffff(slab)
raw: 00fff00000000040 ffff888015842280 dead000000000122 0000000000000000
raw: 0000000000000000 0000000080020002 00000001fdffffff 0000000000000000
head: 00fff00000000040 ffff888015842280 dead000000000122 0000000000000000
head: 0000000000000000 0000000080020002 00000001fdffffff 0000000000000000
head: 00fff00000000003 ffffea0001637c01 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x152820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_HARDWALL), pid 3922, tgid 3922 (kworker/u8:8), ts 2368883364470, free_ts 2368880799693
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f3/0x230 mm/page_alloc.c:1493
 prep_new_page mm/page_alloc.c:1501 [inline]
 get_page_from_freelist+0x2e4c/0x2f10 mm/page_alloc.c:3442
 __alloc_pages_noprof+0x256/0x6c0 mm/page_alloc.c:4700
 __alloc_pages_node_noprof include/linux/gfp.h:269 [inline]
 alloc_pages_node_noprof include/linux/gfp.h:296 [inline]
 alloc_slab_page+0x5f/0x120 mm/slub.c:2321
 allocate_slab+0x5a/0x2f0 mm/slub.c:2484
 new_slab mm/slub.c:2537 [inline]
 ___slab_alloc+0xcd1/0x14b0 mm/slub.c:3723
 __slab_alloc+0x58/0xa0 mm/slub.c:3813
 __slab_alloc_node mm/slub.c:3866 [inline]
 slab_alloc_node mm/slub.c:4025 [inline]
 __do_kmalloc_node mm/slub.c:4157 [inline]
 __kmalloc_noprof+0x25a/0x400 mm/slub.c:4170
 kmalloc_noprof include/linux/slab.h:685 [inline]
 n_hdlc_tty_receive+0x1ce/0x4e0 drivers/tty/n_hdlc.c:393
 tty_ldisc_receive_buf+0x11f/0x170 drivers/tty/tty_buffer.c:391
 tty_port_default_receive_buf+0x6d/0xa0 drivers/tty/tty_port.c:37
 receive_buf drivers/tty/tty_buffer.c:445 [inline]
 flush_to_ldisc+0x328/0x860 drivers/tty/tty_buffer.c:495
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd40 kernel/workqueue.c:3390
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
page last free pid 13102 tgid 13102 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1094 [inline]
 free_unref_page+0xd22/0xea0 mm/page_alloc.c:2612
 discard_slab mm/slub.c:2583 [inline]
 __put_partials+0xeb/0x130 mm/slub.c:3051
 put_cpu_partial+0x17c/0x250 mm/slub.c:3126
 __slab_free+0x2ea/0x3d0 mm/slub.c:4343
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x9e/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x14f/0x170 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x23/0x80 mm/kasan/common.c:322
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slub.c:3988 [inline]
 slab_alloc_node mm/slub.c:4037 [inline]
 kmem_cache_alloc_noprof+0x135/0x2a0 mm/slub.c:4044
 anon_vma_chain_alloc mm/rmap.c:142 [inline]
 __anon_vma_prepare+0xc4/0x4a0 mm/rmap.c:195
 vmf_anon_prepare mm/memory.c:3289 [inline]
 do_anonymous_page mm/memory.c:4551 [inline]
 do_pte_missing mm/memory.c:3945 [inline]
 handle_pte_fault+0x5788/0x6eb0 mm/memory.c:5522
 __handle_mm_fault mm/memory.c:5665 [inline]
 handle_mm_fault+0x1029/0x1980 mm/memory.c:5833
 do_user_addr_fault arch/x86/mm/fault.c:1338 [inline]
 handle_page_fault arch/x86/mm/fault.c:1481 [inline]
 exc_page_fault+0x459/0x8c0 arch/x86/mm/fault.c:1539
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623

Memory state around the buggy address:
 ffff888058df4100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888058df4180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888058df4200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff888058df4280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888058df4300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

