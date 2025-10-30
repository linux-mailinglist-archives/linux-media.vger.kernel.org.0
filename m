Return-Path: <linux-media+bounces-46019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AC9C20E20
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 16:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2F7694E1FE3
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 15:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC6532BF46;
	Thu, 30 Oct 2025 15:19:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA21157A72
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 15:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761837581; cv=none; b=TDrtSXnS2IiJNGCt0ryYr9XTuRMcfHjoZllCIFolo23iPfohrW/l0oRgp+YF4BvkfbQpa1LoCSotTWlbTM+FLU/M1gjavF943ppSgl545OtGwR7gtoQUd30EkxhRtGXRRJ9tvTl6YpDE2EuDTvCAxAB9fLBwaecWCR8HkdaSB+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761837581; c=relaxed/simple;
	bh=A6UARfO1sbEfbN+KJyVKP/lq5Gj1unPZxsjzJeAM5jw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BWLzvbzTfx7STBo6lMAP5wwTntYM9ubI+tba6o36lVcKWQVey7mTNKgSfAloU/2bm9IWSDKKjyAPlAF26oo+AZ1CiXKwJrWW+vQFeL71l9Q8V1pp7Xy31AJ4ej4pq7N89RAgB77PTlKVuGw1H/jSi5QKDKoXLv01PQKtFyNSb14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-431d3a4db56so38985945ab.1
        for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 08:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761837579; x=1762442379;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/BiZLMNZLvaqyEgfJZG4obb8VXySUrbT17vethb7Rw=;
        b=i2N4yFMQ2zEhYkchXr2xZLnfG4fjp8kgwVx3Aq3L/POOEaLkAJRhPR49WMfTqEeH5T
         fUhXu7r/9DoIFgeH8tTUqgyjvzYIY328m8Ics/jfEAElAxu4A/PW/Ei7u7JOo0972qm4
         ddANQiPxrhLbsaQ75IVb53TNhnikNFE0LTMkNqtwCbgXZwBq0W4AaSaMHPnMViBJZlnr
         srQ4ZHh7SMFJaQzi8qe/4H0ta3Idw4G4prUMjG+/5F1cmDPFLeTmExpoAbObupkIB65A
         KVmCxz4+7jRwfVxDPTacrtkyTpqwJIHlBiWKstpVmUXFDRflrUdck1B9+x3wIM9P3eL8
         rqAA==
X-Forwarded-Encrypted: i=1; AJvYcCU/on9AyLlrZu0p14IXTjHd9GA3qeYZpry/wgiMoIeBYNbjqHDgden4qd3XxUBh4A30mYEWlI/ZeTsxHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxGQ6hD8WmgZhKmkt5xgrFjTPPDEHl0Vnzf4PT5M9aY89b9utx
	YuzkV9QcDErTCtih4pYQDvxlyQfNPD/zpppnVF+9bUnTkCJa2wq8VLPO1LKCiaXT+0YemsNGxwd
	jpm60tfLq4BwhaVHaDM3CBdjuUcWhtOPQiqXmHJeonH4MTiqoaSmi6LYjGIw=
X-Google-Smtp-Source: AGHT+IG0v/3cHbVbXeoIzkYaq+/9aD4MDb9P3mPI5Ts9d4qp2Z18KVz+NPTKZ4ObQCYIpOjgiJfMcF40eqjbMkOWWC4LRAcmXDFE
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1aab:b0:432:fc0b:f3b9 with SMTP id
 e9e14a558f8ab-4330d1b77bcmr1135985ab.21.1761837578988; Thu, 30 Oct 2025
 08:19:38 -0700 (PDT)
Date: Thu, 30 Oct 2025 08:19:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6903820a.a70a0220.5b2ed.0047.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in vb2_fop_release
From: syzbot <syzbot+c1d7d93187451574fbcf@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    566771afc7a8 Merge tag 'v6.18-rc2-smb-server-fixes' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=141a4be2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd5b960ad8a33100
dashboard link: https://syzkaller.appspot.com/bug?extid=c1d7d93187451574fbcf
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1e5772421b7d/disk-566771af.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/059e09138c67/vmlinux-566771af.xz
kernel image: https://storage.googleapis.com/syzbot-assets/36ceff746919/bzImage-566771af.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c1d7d93187451574fbcf@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in _vb2_fop_release drivers/media/common/videobuf2/videobuf2-v4l2.c:1153 [inline]
BUG: KASAN: slab-use-after-free in vb2_fop_release+0xf0/0x200 drivers/media/common/videobuf2/videobuf2-v4l2.c:1168
Read of size 8 at addr ffff8880847e0568 by task v4l_id/5228

CPU: 0 UID: 0 PID: 5228 Comm: v4l_id Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 _vb2_fop_release drivers/media/common/videobuf2/videobuf2-v4l2.c:1153 [inline]
 vb2_fop_release+0xf0/0x200 drivers/media/common/videobuf2/videobuf2-v4l2.c:1168
 v4l2_release+0x250/0x370 drivers/media/v4l2-core/v4l2-dev.c:471
 __fput+0x44c/0xa70 fs/file_table.c:468
 fput_close_sync+0x119/0x200 fs/file_table.c:573
 __do_sys_close fs/open.c:1589 [inline]
 __se_sys_close fs/open.c:1574 [inline]
 __x64_sys_close+0x7f/0x110 fs/open.c:1574
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f604b4a7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffd8e53f520 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 00007f604bbd2880 RCX: 00007f604b4a7407
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007f604bbd26e8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
R13: 00007ffd8e53f750 R14: 00007f604bd39000 R15: 00005594dcc7e4d8
 </TASK>

Allocated by task 981:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:400 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:417
 kasan_kmalloc include/linux/kasan.h:262 [inline]
 __kmalloc_cache_noprof+0x3d5/0x6f0 mm/slub.c:5763
 kmalloc_noprof include/linux/slab.h:957 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 hackrf_probe+0xda/0x1360 drivers/media/usb/hackrf/hackrf.c:1351
 usb_probe_interface+0x668/0xc30 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_new_device+0xa39/0x16f0 drivers/usb/core/hub.c:2694
 hub_port_connect drivers/usb/core/hub.c:5566 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5870 [inline]
 hub_event+0x2958/0x4a20 drivers/usb/core/hub.c:5952
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 981:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 __kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:587
 kasan_save_free_info mm/kasan/kasan.h:406 [inline]
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2539 [inline]
 slab_free mm/slub.c:6630 [inline]
 kfree+0x19a/0x6d0 mm/slub.c:6837
 hackrf_probe+0xd98/0x1360 drivers/media/usb/hackrf/hackrf.c:1523
 usb_probe_interface+0x668/0xc30 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_new_device+0xa39/0x16f0 drivers/usb/core/hub.c:2694
 hub_port_connect drivers/usb/core/hub.c:5566 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5870 [inline]
 hub_event+0x2958/0x4a20 drivers/usb/core/hub.c:5952
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880847e0000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 1384 bytes inside of
 freed 8192-byte region [ffff8880847e0000, ffff8880847e2000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x847e0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801a027280 ffffea0001ebba00 dead000000000002
raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801a027280 ffffea0001ebba00 dead000000000002
head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea000211f801 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2820(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 24871, tgid 24865 (syz.2.4939), ts 1334001311229, free_ts 1333945083131
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1850
 prep_new_page mm/page_alloc.c:1858 [inline]
 get_page_from_freelist+0x2365/0x2440 mm/page_alloc.c:3884
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5183
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:3055 [inline]
 allocate_slab+0x96/0x350 mm/slub.c:3228
 new_slab mm/slub.c:3282 [inline]
 ___slab_alloc+0xe94/0x18a0 mm/slub.c:4651
 __slab_alloc+0x65/0x100 mm/slub.c:4770
 __slab_alloc_node mm/slub.c:4846 [inline]
 slab_alloc_node mm/slub.c:5268 [inline]
 __do_kmalloc_node mm/slub.c:5641 [inline]
 __kmalloc_node_track_caller_noprof+0x5c7/0x800 mm/slub.c:5751
 kmalloc_reserve+0x136/0x290 net/core/skbuff.c:601
 __alloc_skb+0x142/0x2d0 net/core/skbuff.c:670
 alloc_skb include/linux/skbuff.h:1383 [inline]
 sctp_packet_transmit+0x2cc/0x2bb0 net/sctp/output.c:598
 sctp_outq_flush_transports net/sctp/outqueue.c:1173 [inline]
 sctp_outq_flush+0xecb/0x3140 net/sctp/outqueue.c:1221
 sctp_cmd_interpreter net/sctp/sm_sideeffect.c:-1 [inline]
 sctp_side_effects net/sctp/sm_sideeffect.c:1204 [inline]
 sctp_do_sm+0x5332/0x5a20 net/sctp/sm_sideeffect.c:1175
 sctp_assoc_bh_rcv+0x3f2/0x630 net/sctp/associola.c:1034
 sctp_backlog_rcv+0x167/0x3f0 net/sctp/input.c:331
 sk_backlog_rcv include/net/sock.h:1158 [inline]
 __release_sock+0x297/0x3a0 net/core/sock.c:3180
page last free pid 15803 tgid 15803 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1394 [inline]
 __free_frozen_pages+0xbc4/0xd30 mm/page_alloc.c:2906
 discard_slab mm/slub.c:3326 [inline]
 __put_partials+0x146/0x170 mm/slub.c:3872
 put_cpu_partial+0x1f2/0x2e0 mm/slub.c:3947
 __slab_free+0x2b9/0x390 mm/slub.c:5921
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:352
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4970 [inline]
 slab_alloc_node mm/slub.c:5280 [inline]
 kmem_cache_alloc_noprof+0x367/0x6e0 mm/slub.c:5287
 vm_area_dup+0x2b/0x680 mm/vma_init.c:123
 dup_mmap+0x903/0x1b10 mm/mmap.c:1780
 dup_mm kernel/fork.c:1489 [inline]
 copy_mm+0x13c/0x4b0 kernel/fork.c:1541
 copy_process+0x1706/0x3c00 kernel/fork.c:2181
 kernel_clone+0x21e/0x840 kernel/fork.c:2609
 __do_sys_clone kernel/fork.c:2750 [inline]
 __se_sys_clone kernel/fork.c:2734 [inline]
 __x64_sys_clone+0x18b/0x1e0 kernel/fork.c:2734
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff8880847e0400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880847e0480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880847e0500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                          ^
 ffff8880847e0580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880847e0600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

