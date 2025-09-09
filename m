Return-Path: <linux-media+bounces-42138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A15B507C7
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 23:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B5EF1C64F48
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 21:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC612571BC;
	Tue,  9 Sep 2025 21:10:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D616824C692
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 21:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757452233; cv=none; b=FsiM5cOEEKjjj4gPPt7ThxEnAL7CBSpWD0HXWkw5oRV3pFiKmA2FffzoRgy5j0QGmHssUY6SEz+SKoivY1eXFsgxBkn4HW04IeyrhVFtpyHxs2I8QFmYhEHbAsqQP+ja08FE77OF99SCgIoR30il1c3jtwb6MMoRbC/iyj6ePg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757452233; c=relaxed/simple;
	bh=aRuVgTY30wyPZuOBjXk9pOsfqSjVxD8wsmwoMcXgBi0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=OrnGym8eUU85dYuEZWDwPCAjZMi8Pp5gGl34X96H+NOOtL1DInRcYaXLSOXjXPgsf1/SLcFoq8he1JSCV3WyVaYBKwnMqLZ/Hub9V+a/E2T2xNpHDp1cFKOjOAsRlSCIOuETddNtnp+SrjRGi4X9nKxnw9r6HtwEjb0aHY5Kpno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-40856fed6a6so37463055ab.0
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 14:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757452230; x=1758057030;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e6o65fe4gkxrTgCz09UMwNwg9M5Ejrbds6Z1nbu+dnM=;
        b=RwdzcE4S4mw9LnVFzeqnX/O6IpD/GQ/O0wDDs3SW3RlSxdeWzCniMM0/JXm2GCbo+r
         FYzYM6hdvVAf+Rf7ShiiFwBBgssqV/Kq1y8cHdJ9ceLjWCfWx8duaKqPKo+4eG4Eqeb1
         4z1Wj9yR9uqPfNE90j6JrGWviAeayBM4tymS2umHOBQZFyBLZ9B1U+pGX97BKO1s9yw8
         6P3g0Iy4e2FLTPC8DZPaKq4bS/lVW5xUs6r4pbn9TfkX5Zz1PwDemPOscumqYE+Hc1dT
         HmKDiQIYV42VSN+/tTBoJOQnQcL5/G21Xc6bLmlAZGC7nKkJDsx7VsZWZ5PVq/l27FqU
         iHag==
X-Forwarded-Encrypted: i=1; AJvYcCXoq4q7MCt69Vl8NSLdxz/5tseqe0XtyrufemTu/2MIgRnKtmvcNIUUL/mJWJlvNVDT8Gqtya0I4St9sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmgMX6vPLutikL/ZkLr9dWD4q53b0U29gMHOsQjAbzI3uIn+xy
	scpQ61YRPOv2539dz6F2DSCX1GwLkMghJ9QDnkwSSmQnB4yHPPn1LX+MLt9gOCn3d3f+UvAQcgo
	v0oS6B9WLbcxVCLnxVtkfwSaCxBRfoIlZIu9ZCUIr+v6Tvj17LY2wkn8FF8k=
X-Google-Smtp-Source: AGHT+IHlXkGEvWvsiQ25g1PtZqd1zN1j5tjxuh5fxKgi2Yq+r0IweQg2dC58PbujVG5HAs60+TPwltjKO8s68aigAM/GBPXOAyjG
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2146:b0:3f1:54f8:5633 with SMTP id
 e9e14a558f8ab-3fd88c9f034mr215665095ab.30.1757452229939; Tue, 09 Sep 2025
 14:10:29 -0700 (PDT)
Date: Tue, 09 Sep 2025 14:10:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c097c5.050a0220.3c6139.000a.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in media_devnode_unregister
From: syzbot <syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com>
To: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    65dd046ef558 Add linux-next specific files for 20250909
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17ca4b12580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d3b38340153b83d4
dashboard link: https://syzkaller.appspot.com/bug?extid=031d0cfd7c362817963f
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f73562580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14212642580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/442c9b800ac9/disk-65dd046e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ca7d60439397/vmlinux-65dd046e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9d386003fad0/bzImage-65dd046e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com

em28xx 1-1:0.132: Closing input extension
==================================================================
BUG: KASAN: slab-use-after-free in media_devnode_unregister+0xe2/0xf0 drivers/media/mc/mc-devnode.c:284
Read of size 4 at addr ffff888077b7f4f0 by task kworker/0:3/5945

CPU: 0 UID: 0 PID: 5945 Comm: kworker/0:3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 media_devnode_unregister+0xe2/0xf0 drivers/media/mc/mc-devnode.c:284
 media_device_unregister+0x37c/0x400 drivers/media/mc/mc-device.c:828
 em28xx_unregister_media_device drivers/media/usb/em28xx/em28xx-cards.c:3511 [inline]
 em28xx_release_resources+0xac/0x240 drivers/media/usb/em28xx/em28xx-cards.c:3532
 em28xx_usb_disconnect+0x19f/0x2f0 drivers/media/usb/em28xx/em28xx-cards.c:4201
 usb_unbind_interface+0x26e/0x910 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:571 [inline]
 __device_release_driver drivers/base/dd.c:1274 [inline]
 device_release_driver_internal+0x4d6/0x800 drivers/base/dd.c:1297
 bus_remove_device+0x34d/0x410 drivers/base/bus.c:579
 device_del+0x511/0x8e0 drivers/base/core.c:3878
 usb_disable_device+0x3e9/0x8a0 drivers/usb/core/message.c:1418
 usb_disconnect+0x330/0x950 drivers/usb/core/hub.c:2344
 hub_port_connect drivers/usb/core/hub.c:5406 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5870 [inline]
 hub_event+0x1cf5/0x4a20 drivers/usb/core/hub.c:5952
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x47c/0x820 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5945:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:397 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:414
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x3d5/0x6f0 mm/slub.c:5397
 kmalloc_noprof include/linux/slab.h:956 [inline]
 kzalloc_noprof include/linux/slab.h:1090 [inline]
 __media_device_register+0x58/0x280 drivers/media/mc/mc-device.c:720
 em28xx_usb_probe+0x1764/0x2a20 drivers/media/usb/em28xx/em28xx-cards.c:4153
 usb_probe_interface+0x665/0xc30 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c1/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9e0 drivers/base/dd.c:659
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
 ret_from_fork+0x47c/0x820 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5945:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 __kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:587
 kasan_save_free_info mm/kasan/kasan.h:406 [inline]
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5b/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2484 [inline]
 slab_free mm/slub.c:6121 [inline]
 kfree+0x199/0x6d0 mm/slub.c:6329
 media_devnode_release+0x61/0xa0 drivers/media/mc/mc-devnode.c:57
 device_release+0x9c/0x1c0 drivers/base/core.c:-1
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x228/0x480 lib/kobject.c:737
 media_devnode_unregister+0x6d/0xf0 drivers/media/mc/mc-devnode.c:281
 media_device_unregister+0x37c/0x400 drivers/media/mc/mc-device.c:828
 em28xx_unregister_media_device drivers/media/usb/em28xx/em28xx-cards.c:3511 [inline]
 em28xx_release_resources+0xac/0x240 drivers/media/usb/em28xx/em28xx-cards.c:3532
 em28xx_usb_disconnect+0x19f/0x2f0 drivers/media/usb/em28xx/em28xx-cards.c:4201
 usb_unbind_interface+0x26e/0x910 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:571 [inline]
 __device_release_driver drivers/base/dd.c:1274 [inline]
 device_release_driver_internal+0x4d6/0x800 drivers/base/dd.c:1297
 bus_remove_device+0x34d/0x410 drivers/base/bus.c:579
 device_del+0x511/0x8e0 drivers/base/core.c:3878
 usb_disable_device+0x3e9/0x8a0 drivers/usb/core/message.c:1418
 usb_disconnect+0x330/0x950 drivers/usb/core/hub.c:2344
 hub_port_connect drivers/usb/core/hub.c:5406 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5870 [inline]
 hub_event+0x1cf5/0x4a20 drivers/usb/core/hub.c:5952
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x47c/0x820 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888077b7f000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 1264 bytes inside of
 freed 2048-byte region [ffff888077b7f000, ffff888077b7f800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x77b78
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801a842000 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801a842000 dead000000000122 0000000000000000
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0001dede01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 6020, tgid 6020 (kworker/0:4), ts 107508329196, free_ts 106053601945
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1850
 prep_new_page mm/page_alloc.c:1858 [inline]
 get_page_from_freelist+0x21e4/0x22c0 mm/page_alloc.c:3863
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5153
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2416
 alloc_slab_page mm/slub.c:2996 [inline]
 allocate_slab+0x8a/0x330 mm/slub.c:3164
 new_slab mm/slub.c:3218 [inline]
 ___slab_alloc+0xbd1/0x13f0 mm/slub.c:4420
 __slab_alloc+0x55/0xa0 mm/slub.c:4511
 __slab_alloc_node mm/slub.c:4586 [inline]
 slab_alloc_node mm/slub.c:4996 [inline]
 __do_kmalloc_node mm/slub.c:5365 [inline]
 __kmalloc_node_track_caller_noprof+0x5c7/0x800 mm/slub.c:5385
 kmalloc_reserve+0x136/0x290 net/core/skbuff.c:600
 __alloc_skb+0x142/0x2d0 net/core/skbuff.c:669
 alloc_skb include/linux/skbuff.h:1377 [inline]
 mld_newpack+0x13c/0xc40 net/ipv6/mcast.c:1775
 add_grhead+0x5a/0x2a0 net/ipv6/mcast.c:1886
 add_grec+0x1452/0x1740 net/ipv6/mcast.c:2025
 mld_send_initial_cr+0x288/0x550 net/ipv6/mcast.c:2268
 mld_dad_work+0x46/0x490 net/ipv6/mcast.c:2294
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
page last free pid 13 tgid 13 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1394 [inline]
 __free_frozen_pages+0xbc4/0xd30 mm/page_alloc.c:2900
 discard_slab mm/slub.c:3262 [inline]
 __put_partials+0x146/0x170 mm/slub.c:3727
 put_cpu_partial+0x17c/0x250 mm/slub.c:3802
 __slab_free+0x2b9/0x390 mm/slub.c:5555
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:349
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4710 [inline]
 slab_alloc_node mm/slub.c:5008 [inline]
 kmem_cache_alloc_node_noprof+0x433/0x710 mm/slub.c:5060
 __alloc_skb+0x112/0x2d0 net/core/skbuff.c:659
 alloc_skb include/linux/skbuff.h:1377 [inline]
 nlmsg_new include/net/netlink.h:1055 [inline]
 rtmsg_ifinfo_build_skb+0x84/0x260 net/core/rtnetlink.c:4392
 unregister_netdevice_many_notify+0x1556/0x1ff0 net/core/dev.c:12218
 ops_exit_rtnl_list net/core/net_namespace.c:186 [inline]
 ops_undo_list+0x3dc/0x990 net/core/net_namespace.c:247
 cleanup_net+0x4c5/0x800 net/core/net_namespace.c:682
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463

Memory state around the buggy address:
 ffff888077b7f380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888077b7f400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888077b7f480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                             ^
 ffff888077b7f500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888077b7f580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


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

