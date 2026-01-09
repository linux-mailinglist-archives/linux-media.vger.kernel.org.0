Return-Path: <linux-media+bounces-50261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5CDD071D4
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 05:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E91F30118F5
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 04:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA6126B76A;
	Fri,  9 Jan 2026 04:22:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462BB500958
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 04:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767932546; cv=none; b=QFpiirR+l5mTJjvURLfqN20hgcWPCjKK45g2FddROqthezecPTQ5UEkATld5c5WvgryLcBxQxIOQwTxDDnbaAVZnMwmm7BnsTur8V55f57RFjieqhQf9KuAPNPZeW7hdJ3cZvuIlXEimjny+OAxDYwvKga5LOfosA/oZrGbAQdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767932546; c=relaxed/simple;
	bh=NZ75YZ7Tn05NgGQUp73W8cZmWpLaaohs3C7ZygAwd2Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NCjIuXDyd9kNxwphF0eImiWMS0qXbebupKQPK0Ren5UxTIF+BLF5kKUIvANdTQLf08hqnjehoZaU+FIGwQKfVEAcOuS9ZM8C1UNFPF7QFe1LcGli8LdfCFIr79A1BMPDtL/sLDV2nVwkTURG3Fo5toZosoyyFgosSqbhdFHQkb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-459df8c820eso4514365b6e.3
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 20:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767932544; x=1768537344;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHkoHnmzmaFkOhc7IWELffY1V37BKa3aswjaYPg0VhU=;
        b=Ml+pfz2Ucf1MCwj5ROE0WZrbFlG72iRHDxHn/5+CzZvdk9g9hjkbOJ79AmHlo5NJu1
         XtNxvZ8OHQR4X56FVdSX+u34MgAhPhZqJ+8IUe0g+jHnogfhrRlzmbVsL94GFcPwi9tC
         sp6DztiQsZwPz+1H/kL/0Ikn3J/EGjWfVZ3maA+WvapyLv18pxbe2Dnmx/PqV4ULEbMR
         wU+x3xbcZkj5XXKmqMSiBhbL5kcukbAjvUFrx2m4f/AjjYuA5Bye5yaQ8xYVZPI3idT0
         ypywN+y8jVcvxG0aQLd2LjvVUUvxcpq9ZmZ8j3mGZZeqJ4KNj+yEklAUUVWzCgiivmsH
         Vo/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAoeutd0gSK8tMGfsKjd65Hol6ouvLh6dtFVQZaeMXpnMLJ3QLle09FbYzNCd9utzImbicDpuPtuTcXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBAmemRYhCSC0I+gKywvsD8UZ01vkin32a1f9xZlH1WAN6dXmR
	6GtZRGVuFQ2PVelvZ+VMu+ytRQ/+/2plBNXjC7tZ99dsaOeeRHICSDwu0pjH9M2OTKzwjnOHKtb
	rjN/2oiVytEUncvxhEeImMuKcDtMYCXPRpxJVivWjoxvogAnU42jPoqxk8AM=
X-Google-Smtp-Source: AGHT+IGR4eZTOLg1To+EEAfpXuwqdU0fyjKT56Q9wXXJkDB1IKkMBZH4hccBP2CnK8FZ+eB6Bndqcin9lfoRRzIQb7n4G1IwrZKS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:17a1:b0:44d:bdeb:f577 with SMTP id
 5614622812f47-45a6be3889dmr3345600b6e.31.1767932544335; Thu, 08 Jan 2026
 20:22:24 -0800 (PST)
Date: Thu, 08 Jan 2026 20:22:24 -0800
In-Reply-To: <00000000000092be0b061eae907e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69608280.050a0220.1c677c.03b0.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in em28xx_release_resources
From: syzbot <syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com>
To: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    79b95d74470d Merge tag 'hid-for-linus-2026010801' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=112b219a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a94030c847137a18
dashboard link: https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=152b219a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13e6e922580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1a9f5da29b00/disk-79b95d74.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7c4b0c995534/vmlinux-79b95d74.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5089d6692134/bzImage-79b95d74.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com

em28xx 5-1:0.132: Closing input extension
==================================================================
BUG: KASAN: slab-use-after-free in media_device_unregister+0x141/0x430 drivers/media/mc/mc-device.c:804
Read of size 8 at addr ffff88807c114210 by task kworker/1:9/6093

CPU: 1 UID: 0 PID: 6093 Comm: kworker/1:9 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 media_device_unregister+0x141/0x430 drivers/media/mc/mc-device.c:804
 em28xx_unregister_media_device drivers/media/usb/em28xx/em28xx-cards.c:3511 [inline]
 em28xx_release_resources+0xac/0x240 drivers/media/usb/em28xx/em28xx-cards.c:3532
 em28xx_usb_disconnect+0x19f/0x2f0 drivers/media/usb/em28xx/em28xx-cards.c:4201
 usb_unbind_interface+0x26e/0x910 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:571 [inline]
 __device_release_driver drivers/base/dd.c:1282 [inline]
 device_release_driver_internal+0x4d9/0x800 drivers/base/dd.c:1305
 bus_remove_device+0x34d/0x440 drivers/base/bus.c:616
 device_del+0x511/0x8e0 drivers/base/core.c:3878
 usb_disable_device+0x3d4/0x8e0 drivers/usb/core/message.c:1418
 usb_disconnect+0x32f/0x990 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5407 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1ca9/0x4ef0 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3257 [inline]
 process_scheduled_works+0xad1/0x1770 kernel/workqueue.c:3340
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3421
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x510/0xa50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>

Allocated by task 5932:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3e2/0x700 mm/slub.c:5776
 kmalloc_noprof include/linux/slab.h:957 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 em28xx_v4l2_init+0x10b/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2532
 em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117
 process_one_work kernel/workqueue.c:3257 [inline]
 process_scheduled_works+0xad1/0x1770 kernel/workqueue.c:3340
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3421
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x510/0xa50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

Freed by task 5932:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2540 [inline]
 slab_free mm/slub.c:6670 [inline]
 kfree+0x1c0/0x660 mm/slub.c:6878
 em28xx_free_v4l2 drivers/media/usb/em28xx/em28xx-video.c:2118 [inline]
 kref_put include/linux/kref.h:65 [inline]
 em28xx_v4l2_init+0x1683/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2901
 em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117
 process_one_work kernel/workqueue.c:3257 [inline]
 process_scheduled_works+0xad1/0x1770 kernel/workqueue.c:3340
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3421
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x510/0xa50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

The buggy address belongs to the object at ffff88807c114000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 528 bytes inside of
 freed 8192-byte region [ffff88807c114000, ffff88807c116000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7c110
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
ksm flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88813ffa7280 ffffea00007dc800 0000000000000003
raw: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88813ffa7280 ffffea00007dc800 0000000000000003
head: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0001f04401 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5959, tgid 5959 (syz-executor), ts 109562656564, free_ts 109528923164
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x234/0x290 mm/page_alloc.c:1857
 prep_new_page mm/page_alloc.c:1865 [inline]
 get_page_from_freelist+0x24e0/0x2580 mm/page_alloc.c:3915
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5210
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2486
 alloc_slab_page mm/slub.c:3075 [inline]
 allocate_slab+0x86/0x3b0 mm/slub.c:3248
 new_slab mm/slub.c:3302 [inline]
 ___slab_alloc+0xe53/0x1820 mm/slub.c:4656
 __slab_alloc+0x65/0x100 mm/slub.c:4779
 __slab_alloc_node mm/slub.c:4855 [inline]
 slab_alloc_node mm/slub.c:5251 [inline]
 __kmalloc_cache_noprof+0x41e/0x700 mm/slub.c:5771
 kmalloc_noprof include/linux/slab.h:957 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 macvlan_port_create drivers/net/macvlan.c:1246 [inline]
 macvlan_common_newlink+0x5a3/0x1980 drivers/net/macvlan.c:1484
 macvtap_newlink+0x13c/0x1b0 drivers/net/macvtap.c:108
 rtnl_newlink_create+0x310/0xb00 net/core/rtnetlink.c:3840
 __rtnl_newlink net/core/rtnetlink.c:3957 [inline]
 rtnl_newlink+0x16e7/0x1c90 net/core/rtnetlink.c:4072
 rtnetlink_rcv_msg+0x7cf/0xb70 net/core/rtnetlink.c:6958
 netlink_rcv_skb+0x208/0x470 net/netlink/af_netlink.c:2550
 netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
 netlink_unicast+0x82f/0x9e0 net/netlink/af_netlink.c:1344
 netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1894
page last free pid 5959 tgid 5959 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0xbc8/0xd30 mm/page_alloc.c:2943
 discard_slab mm/slub.c:3346 [inline]
 __put_partials+0x146/0x170 mm/slub.c:3886
 __slab_free+0x294/0x320 mm/slub.c:5952
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4953 [inline]
 slab_alloc_node mm/slub.c:5263 [inline]
 kmem_cache_alloc_node_noprof+0x43c/0x720 mm/slub.c:5315
 __alloc_skb+0x1dc/0x3a0 net/core/skbuff.c:679
 alloc_skb include/linux/skbuff.h:1383 [inline]
 nlmsg_new include/net/netlink.h:1055 [inline]
 netlink_ack+0x146/0xa50 net/netlink/af_netlink.c:2487
 netlink_rcv_skb+0x28c/0x470 net/netlink/af_netlink.c:2556
 netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
 netlink_unicast+0x82f/0x9e0 net/netlink/af_netlink.c:1344
 netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1894
 sock_sendmsg_nosec net/socket.c:727 [inline]
 __sock_sendmsg+0x21c/0x270 net/socket.c:742
 __sys_sendto+0x3bd/0x520 net/socket.c:2206
 __do_sys_sendto net/socket.c:2213 [inline]
 __se_sys_sendto net/socket.c:2209 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2209
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94

Memory state around the buggy address:
 ffff88807c114100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807c114180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88807c114200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff88807c114280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807c114300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

