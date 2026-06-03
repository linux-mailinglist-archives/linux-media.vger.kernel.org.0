Return-Path: <linux-media+bounces-63470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RO3oHgJ5H2oamQAAu9opvQ
	(envelope-from <linux-media+bounces-63470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 02:44:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5CA6333D5
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 02:44:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63470-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63470-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=appspotmail.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F356E302A6DC
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 00:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C946925B085;
	Wed,  3 Jun 2026 00:44:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f80.google.com (mail-oa1-f80.google.com [209.85.160.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26E623EAB3
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 00:44:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780447475; cv=none; b=Sqn2zFXmNJYX2tBgIyeLLuPWdpZeg0OhzeIPsUr2ybZiY06kFXP7jJFEKBijqIV60GV6GGPuchfGW+rTLnG0FfSnMGmAuvuW3sidTHzhApg69XUSzle7VIOmQB7b6IcrOPrqIJDwzH1oYiFi/bLNqQxx4tZpyq2INSWASREJs0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780447475; c=relaxed/simple;
	bh=NoTFlUNwHoXry0wi6ymOt8YN0bAJf+RyN3HR+h9xwTw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=X9L53ieHxbVFANfKu7IFHWP/Rw7DO0+f8tWc8sN6dBnhuUZsNVGCTTqeTsKTOcdSG0f70Zm5MyHnPr9S16NTAnDdoITchoEqmqmLSNsAz2X2l9Sc4xZWsjjYK5siWVG5VeBXOPHEDmGyjv++nG/iEgzC4nNTovoRLtLAuOZfRgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.80
Received: by mail-oa1-f80.google.com with SMTP id 586e51a60fabf-43d171066e5so4446162fac.3
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 17:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780447473; x=1781052273;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Qj0iL7pa+JJxOlR8LLmY+bPL4AEZo1Ix8/Wpjeiijs=;
        b=Ig3T1NfLT8AKIhkXwqu9PW1by1wqDrk/QX1LD6tfEo0f+0O/7mIPpIh1fMLXcX7GO2
         P9OFjuw4Ofninj4e1jBIPgJsGt65WzCgpyP0OmfkK8lgV+rVws84ewz1r0z2ajzlwkiC
         uFgHavDPXLpuOSEw2QajMjGsxqmgLn54YiJSri35l/kjB9w03n0iY9nDO1HV0EAp9BHU
         /S4YYCM1efWR05RQCMXjGV76cJkntB8WfJyWqGTgqpgbYra3xzMOCSnHOFL6DAT30QtP
         PUxDfKYY3XT7ae2+gbht1cnQE5v3GJV8NNM8nF1eXT9ig4t4TH2nsvihlB51xMiWVBQK
         jb2A==
X-Forwarded-Encrypted: i=1; AFNElJ93FAS8nJMNTiEqLeh2SF84n9AazbN4cNxxL0B41BGAtkkZK6jYIbhvl0t5xil8GaM8wBz5YSO+ZCBukA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+e62xrRNprN6984POXigu7/B7EFxdUZJwfnkLIwIY762HsnWj
	BIoDl1/M5H5h8UFl0/52DNsej2gVrJP6P6oR85QH31JBKeijXxMTgUrSn9Ogx/qlWlYRULcMsHC
	S8WdS4Mo5Fms0qyxjwDiM9BLIhXKWFjj6px9ht9p8aDbParOtv+n9LKcNzRw=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:569a:b0:699:b198:c278 with SMTP id
 006d021491bc7-69e47ea0885mr657851eaf.13.1780447472995; Tue, 02 Jun 2026
 17:44:32 -0700 (PDT)
Date: Tue, 02 Jun 2026 17:44:32 -0700
In-Reply-To: <6971e58b.a00a0220.3ad28e.9c56.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1f78f0.278b5b03.2bcf39.0044.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in em28xx_unregister_media_device
From: syzbot <syzbot+07b93bb3189febcab189@syzkaller.appspotmail.com>
To: hverkuil@kernel.org, kernel-dev@igalia.com, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	mfo@igalia.com, sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=8118209836970b54];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63470-lists,linux-media=lfdr.de,07b93bb3189febcab189];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:kernel-dev@igalia.com,m:laurent.pinchart@ideasonboard.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-usb@vger.kernel.org,m:mchehab@kernel.org,m:mfo@igalia.com,m:sakari.ailus@linux.intel.com,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF5CA6333D5

syzbot has found a reproducer for the following issue on:

HEAD commit:    ba3e43a9e601 Merge tag 'soc-fixes-7.1-2' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14e40f2e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8118209836970b54
dashboard link: https://syzkaller.appspot.com/bug?extid=07b93bb3189febcab189
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11d79f2e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15a19a86580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-ba3e43a9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/12db9228338c/vmlinux-ba3e43a9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c8dfb3210b18/bzImage-ba3e43a9.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+07b93bb3189febcab189@syzkaller.appspotmail.com

em28xx 5-1:0.132: Closing input extension
==================================================================
BUG: KASAN: slab-use-after-free in media_device_unregister drivers/media/mc/mc-device.c:833 [inline]
BUG: KASAN: slab-use-after-free in media_device_unregister+0x59d/0x610 drivers/media/mc/mc-device.c:811
Read of size 8 at addr ffff888031920210 by task kworker/3:1/39

CPU: 3 UID: 0 PID: 39 Comm: kworker/3:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1d0 mm/kasan/report.c:595
 media_device_unregister drivers/media/mc/mc-device.c:833 [inline]
 media_device_unregister+0x59d/0x610 drivers/media/mc/mc-device.c:811
 em28xx_unregister_media_device+0x4e/0xe0 drivers/media/usb/em28xx/em28xx-cards.c:3714
 em28xx_release_resources+0x79/0x1b0 drivers/media/usb/em28xx/em28xx-cards.c:3735
 em28xx_usb_disconnect.cold+0x17d/0x253 drivers/media/usb/em28xx/em28xx-cards.c:4427
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:621 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:613
 __device_release_driver drivers/base/dd.c:1352 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1375
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:657
 device_del+0x376/0x9b0 drivers/base/core.c:3895
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5407 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1d0c/0x4af0 drivers/usb/core/hub.c:5953
 process_one_work+0xa0e/0x1980 kernel/workqueue.c:3314
 process_scheduled_works kernel/workqueue.c:3397 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3478
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 6029:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 em28xx_v4l2_init.cold+0x94/0x3a40 drivers/media/usb/em28xx/em28xx-video.c:2707
 em28xx_init_extension+0x13a/0x200 drivers/media/usb/em28xx/em28xx-core.c:1248
 request_module_async+0x61/0x80 drivers/media/usb/em28xx/em28xx-cards.c:3660
 process_one_work+0xa0e/0x1980 kernel/workqueue.c:3314
 process_scheduled_works kernel/workqueue.c:3397 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3478
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 6029:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2689 [inline]
 slab_free mm/slub.c:6251 [inline]
 kfree+0x223/0x6c0 mm/slub.c:6566
 kref_put.isra.0+0x53/0x75 include/linux/kref.h:65
 em28xx_v4l2_init.cold+0x280/0x3a40 drivers/media/usb/em28xx/em28xx-video.c:3078
 em28xx_init_extension+0x13a/0x200 drivers/media/usb/em28xx/em28xx-core.c:1248
 request_module_async+0x61/0x80 drivers/media/usb/em28xx/em28xx-cards.c:3660
 process_one_work+0xa0e/0x1980 kernel/workqueue.c:3314
 process_scheduled_works kernel/workqueue.c:3397 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3478
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888031920000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 528 bytes inside of
 freed 8192-byte region [ffff888031920000, ffff888031922000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x31920
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b843180 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b843180 dead000000000100 dead000000000122
head: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd28c0(GFP_NOWAIT|__GFP_IO|__GFP_FS|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5825, tgid 5825 (syz-executor), ts 84598166672, free_ts 20468208603
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1853
 prep_new_page mm/page_alloc.c:1861 [inline]
 get_page_from_freelist+0x11a6/0x3410 mm/page_alloc.c:3941
 __alloc_frozen_pages_noprof+0x27c/0x2bc0 mm/page_alloc.c:5221
 alloc_slab_page mm/slub.c:3278 [inline]
 allocate_slab mm/slub.c:3467 [inline]
 new_slab+0xa6/0x6c0 mm/slub.c:3525
 refill_objects+0x277/0x420 mm/slub.c:7272
 refill_sheaf mm/slub.c:2816 [inline]
 __pcs_replace_empty_main+0x375/0x650 mm/slub.c:4652
 alloc_from_pcs mm/slub.c:4750 [inline]
 slab_alloc_node mm/slub.c:4884 [inline]
 __do_kmalloc_node mm/slub.c:5295 [inline]
 __kvmalloc_node_noprof+0x7da/0xa00 mm/slub.c:6833
 kvmalloc_array_node_noprof include/linux/slab.h:1216 [inline]
 __ptr_ring_init_queue_alloc_noprof include/linux/ptr_ring.h:481 [inline]
 ptr_ring_init_noprof include/linux/ptr_ring.h:499 [inline]
 wg_packet_queue_init+0x9a/0x360 drivers/net/wireguard/queueing.c:32
 wg_newlink+0x2fa/0x7a0 drivers/net/wireguard/device.c:352
 rtnl_newlink_create net/core/rtnetlink.c:3864 [inline]
 __rtnl_newlink net/core/rtnetlink.c:3995 [inline]
 rtnl_newlink+0x1499/0x2380 net/core/rtnetlink.c:4110
 rtnetlink_rcv_msg+0x95e/0xe90 net/core/rtnetlink.c:6997
 netlink_rcv_skb+0x159/0x420 net/netlink/af_netlink.c:2555
 netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
 netlink_unicast+0x585/0x850 net/netlink/af_netlink.c:1344
 netlink_sendmsg+0x8b0/0xda0 net/netlink/af_netlink.c:1899
 sock_sendmsg_nosec net/socket.c:787 [inline]
 __sock_sendmsg net/socket.c:802 [inline]
 __sys_sendto+0x468/0x4b0 net/socket.c:2265
 __do_sys_sendto net/socket.c:2272 [inline]
 __se_sys_sendto net/socket.c:2268 [inline]
 __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2268
page last free pid 53 tgid 53 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1397 [inline]
 __free_frozen_pages+0x794/0x10a0 mm/page_alloc.c:2938
 vfree mm/vmalloc.c:3472 [inline]
 vfree+0x15f/0x8d0 mm/vmalloc.c:3436
 delayed_vfree_work+0x56/0x80 mm/vmalloc.c:3392
 process_one_work+0xa0e/0x1980 kernel/workqueue.c:3314
 process_scheduled_works kernel/workqueue.c:3397 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3478
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888031920100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888031920180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888031920200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff888031920280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888031920300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

