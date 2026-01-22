Return-Path: <linux-media+bounces-51325-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKuUCIXncWkONAAAu9opvQ
	(envelope-from <linux-media+bounces-51325-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:01:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 540A463B3C
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7EE3F5E654B
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC23547DD57;
	Thu, 22 Jan 2026 08:53:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5602A3EFD0F
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072014; cv=none; b=So5ZccVgUDtonvJfiq60DSQFekVu3E7/vG0dNnTdy1fq7l+F6UFiGBG/8jJWaUa9e/OTTy0Y7j3aDZvOK0QUmSBMrMHBVK1Ry4GXxE3reYM7meZrx5ZwPZWhLlTKUvC5lV82IeRuDBu3jR9SgZOY90n4PEj4plt/oXYfgzwt0Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072014; c=relaxed/simple;
	bh=UTDZk7ZvLY5cFz80JynOFk++a558mvAGF+m1Y0bIDpw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZSJh/gcFAqF0p5VTs4RWTxGiDSsa3Z0AQU4CxQ8lv5x49KRIw7JSrCmY6q+xlQ2o7zPVm0Z1E+bKtwyUcTCElefSjMah8AL7BfZo6HRwXWTJooP7DSC/YL+KujTaMYbyKCSgtdKIUpjs477U73RTWUZso+Fhs/GWzGvkSNUJ+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-662c78da1c4so116562eaf.1
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 00:53:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769072011; x=1769676811;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PCEPG624hjG44ajr4KRdg/TDTcq4sVGy6ScMHuZ3R+4=;
        b=QZHvZx+7rViU8oewP5D/kqVMJGzL5Gt9FkdjHwzni8yFrkwJFad2pERAouRT62DVHL
         wUROfKm6sfZIaXebLWb6VA67rL/xnv23mcTrsrOyiltdacxgZXkmLRTZjqXJSCRJUST7
         b75qDJ6GiQUe1C3qVGnbgLgP1Dj6eidY3a5CD1p4JWa3oV9pE3O4bz5ETFa/l7ZEce9N
         UU9h2w/4VQfqScn3R8mmPaaNuGe2bf+mM5HEvrtzxG/1SFOVSyQj5pc/Ih9ciWixIJq9
         psJKAnShyaoTYx7blWvHAP+1glXX+GE66RJdWcSlWt9cxIV0iaNW4yK6gAr4h+TYFMqA
         WmWA==
X-Forwarded-Encrypted: i=1; AJvYcCWmvAN69rXNivRvuzGhZ2E72zgyFpPcu++SPXSxwhe9l6bmpJ+jhcquM8uyA8z13EOtK0aJpnHKYKm2aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiWMaUjxcCT+AlzXqn89rVV1Mjsa3N1IUbzWmay7lFWzDubTyG
	7CITHR2TqkRq+F0idrmQcDQtdSivtjhkKXAmRD7XJhQhozOFIhM7TAgnM+ASB5RwMm6ZemNaQaQ
	QB7FDfhYoUYNVvHEcY/+qEMKzv2X7/+81Xz17EwF/faW7ZZqsCDvaGoZNJKg=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1629:b0:662:c7bf:e0e0 with SMTP id
 006d021491bc7-662c7bfe2eemr176762eaf.2.1769072011288; Thu, 22 Jan 2026
 00:53:31 -0800 (PST)
Date: Thu, 22 Jan 2026 00:53:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6971e58b.a00a0220.3ad28e.9c56.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in em28xx_unregister_media_device
From: syzbot <syzbot+07b93bb3189febcab189@syzkaller.appspotmail.com>
To: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : No valid SPF, No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-51325-lists,linux-media=lfdr.de,07b93bb3189febcab189];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	R_DKIM_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,storage.googleapis.com:url,goo.gl:url,googlegroups.com:email]
X-Rspamd-Queue-Id: 540A463B3C
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    5ac87cd859ec Merge 6.19-rc6 usb-next
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=140e73fa580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0
dashboard link: https://syzkaller.appspot.com/bug?extid=07b93bb3189febcab189
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b927a84e0088/disk-5ac87cd8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b8131bd9dbee/vmlinux-5ac87cd8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/24fc40a81925/bzImage-5ac87cd8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+07b93bb3189febcab189@syzkaller.appspotmail.com

em28xx 8-1:0.132: Closing input extension
==================================================================
BUG: KASAN: slab-use-after-free in media_device_unregister drivers/media/mc/mc-device.c:804 [inline]
BUG: KASAN: slab-use-after-free in media_device_unregister+0x565/0x5e0 drivers/media/mc/mc-device.c:782
Read of size 8 at addr ffff88813572c210 by task kworker/1:6/5730

CPU: 1 UID: 0 PID: 5730 Comm: kworker/1:6 Not tainted syzkaller #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x156/0x4c9 mm/kasan/report.c:482
 kasan_report+0xdf/0x1a0 mm/kasan/report.c:595
 media_device_unregister drivers/media/mc/mc-device.c:804 [inline]
 media_device_unregister+0x565/0x5e0 drivers/media/mc/mc-device.c:782
 em28xx_unregister_media_device+0x4e/0xe0 drivers/media/usb/em28xx/em28xx-cards.c:3511
 em28xx_release_resources+0x79/0x1b0 drivers/media/usb/em28xx/em28xx-cards.c:3532
 em28xx_usb_disconnect.cold+0x17d/0x253 drivers/media/usb/em28xx/em28xx-cards.c:4201
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:571 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:563
 __device_release_driver drivers/base/dd.c:1282 [inline]
 device_release_driver_internal+0x42e/0x600 drivers/base/dd.c:1305
 bus_remove_device+0x22f/0x440 drivers/base/bus.c:616
 device_del+0x376/0x9b0 drivers/base/core.c:3878
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5407 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1d0c/0x4af0 drivers/usb/core/hub.c:5953
 process_one_work+0x9c2/0x1840 kernel/workqueue.c:3257
 process_scheduled_works kernel/workqueue.c:3340 [inline]
 worker_thread+0x5da/0xe40 kernel/workqueue.c:3421
 kthread+0x3b3/0x730 kernel/kthread.c:463
 ret_from_fork+0x6c3/0xa20 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>

Allocated by task 11958:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:415
 kmalloc_noprof include/linux/slab.h:957 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 em28xx_v4l2_init.cold+0x94/0x3503 drivers/media/usb/em28xx/em28xx-video.c:2532
 em28xx_init_extension+0x13a/0x200 drivers/media/usb/em28xx/em28xx-core.c:1117
 request_module_async+0x61/0x80 drivers/media/usb/em28xx/em28xx-cards.c:3457
 process_one_work+0x9c2/0x1840 kernel/workqueue.c:3257
 process_scheduled_works kernel/workqueue.c:3340 [inline]
 worker_thread+0x5da/0xe40 kernel/workqueue.c:3421
 kthread+0x3b3/0x730 kernel/kthread.c:463
 ret_from_fork+0x6c3/0xa20 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

Freed by task 11958:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x43/0x70 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2540 [inline]
 slab_free mm/slub.c:6670 [inline]
 kfree+0x1ad/0x630 mm/slub.c:6878
 kref_put.isra.0+0x56/0x90 include/linux/kref.h:65
 em28xx_v4l2_init.cold+0x280/0x3503 drivers/media/usb/em28xx/em28xx-video.c:2901
 em28xx_init_extension+0x13a/0x200 drivers/media/usb/em28xx/em28xx-core.c:1117
 request_module_async+0x61/0x80 drivers/media/usb/em28xx/em28xx-cards.c:3457
 process_one_work+0x9c2/0x1840 kernel/workqueue.c:3257
 process_scheduled_works kernel/workqueue.c:3340 [inline]
 worker_thread+0x5da/0xe40 kernel/workqueue.c:3421
 kthread+0x3b3/0x730 kernel/kthread.c:463
 ret_from_fork+0x6c3/0xa20 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

The buggy address belongs to the object at ffff88813572c000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 528 bytes inside of
 freed 8192-byte region [ffff88813572c000, ffff88813572e000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x135728
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x200000000000040(head|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000040 ffff888100042280 ffffea00046dc600 dead000000000002
raw: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
head: 0200000000000040 ffff888100042280 ffffea00046dc600 dead000000000002
head: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
head: 0200000000000003 ffffea0004d5ca01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1122, tgid 1122 (kworker/1:2), ts 1154723928347, free_ts 1154474178179
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1e1/0x250 mm/page_alloc.c:1884
 prep_new_page mm/page_alloc.c:1892 [inline]
 get_page_from_freelist+0xd57/0x3b20 mm/page_alloc.c:3945
 __alloc_frozen_pages_noprof+0x269/0x2230 mm/page_alloc.c:5240
 alloc_pages_mpol+0xe8/0x410 mm/mempolicy.c:2486
 alloc_slab_page mm/slub.c:3075 [inline]
 allocate_slab mm/slub.c:3248 [inline]
 new_slab+0x2c4/0x440 mm/slub.c:3302
 ___slab_alloc+0xda3/0x1ca0 mm/slub.c:4656
 __slab_alloc.isra.0+0x63/0x110 mm/slub.c:4779
 __slab_alloc_node mm/slub.c:4855 [inline]
 slab_alloc_node mm/slub.c:5251 [inline]
 __do_kmalloc_node mm/slub.c:5656 [inline]
 __kmalloc_noprof+0x5c3/0x990 mm/slub.c:5669
 kmalloc_noprof include/linux/slab.h:961 [inline]
 hcd_buffer_alloc+0x1f5/0x290 drivers/usb/core/buffer.c:134
 usb_alloc_coherent+0x5f/0xa0 drivers/usb/core/usb.c:1010
 hdpvr_alloc_buffers+0x12e/0x650 drivers/media/usb/hdpvr/hdpvr-video.c:162
 hdpvr_probe.cold+0x929/0x12fe drivers/media/usb/hdpvr/hdpvr-core.c:350
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:581 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:659
 __driver_probe_device+0x1de/0x400 drivers/base/dd.c:801
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:831
page last free pid 2860 tgid 2860 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1433 [inline]
 __free_frozen_pages+0x7d1/0x1010 mm/page_alloc.c:2973
 discard_slab mm/slub.c:3346 [inline]
 __put_partials+0x127/0x160 mm/slub.c:3886
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xe0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x4e/0x70 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4953 [inline]
 slab_alloc_node mm/slub.c:5263 [inline]
 kmem_cache_alloc_node_noprof+0x292/0x7d0 mm/slub.c:5315
 __alloc_skb+0x156/0x410 net/core/skbuff.c:679
 alloc_skb include/linux/skbuff.h:1383 [inline]
 netlink_alloc_large_skb+0x69/0x150 net/netlink/af_netlink.c:1184
 netlink_sendmsg+0x680/0xda0 net/netlink/af_netlink.c:1869
 sock_sendmsg_nosec net/socket.c:727 [inline]
 __sock_sendmsg net/socket.c:742 [inline]
 ____sys_sendmsg+0xa54/0xc30 net/socket.c:2592
 ___sys_sendmsg+0x190/0x1e0 net/socket.c:2646
 __sys_sendmsg+0x170/0x220 net/socket.c:2678
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x570 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88813572c100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88813572c180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88813572c200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff88813572c280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88813572c300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

