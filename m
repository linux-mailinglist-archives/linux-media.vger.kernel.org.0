Return-Path: <linux-media+bounces-57270-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLR6LEyfxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57270-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:16:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AF834689E
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF3E8303D8A8
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000F430BB8D;
	Fri, 27 Mar 2026 15:13:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f77.google.com (mail-oo1-f77.google.com [209.85.161.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17BB30DD1E
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624411; cv=none; b=rzpsRnFnFeIif72z0ECpaSBcNWxvU6FgtRqwU+gAo3eloC7DaS74a4wdAKxr58uS4jmRkB92IiuISPBu5VihVkpS76q7OecGyjlWOqdnyPrErtvxs4gz+FdI9PdutdvP/Isp9duvHzoSZc0nVTTGbL+/caz7o7AaAV8hOa6y/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624411; c=relaxed/simple;
	bh=VK4ehsteAGMIQSSdKtcTFoEx5W/jjw8vXfqg0+1LWa8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fLqLs3fvZC5zI2w7Nt/k7sT/+vSXOZgA5u2+GOOc4npQzaCcanBetjMbb3zbOv59Mzbj3E4CKzvSTALSCbBotnmcJmV81pkkbUF9LOBio0QGlUCyMDDUdW/ejO6tqQE03GYAzIhbyU3TMoT1S2Y19+eMq2cAX9amaYm2EdSKP7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f77.google.com with SMTP id 006d021491bc7-67e0f16976fso3404962eaf.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 08:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624409; x=1775229209;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hhSaiNIgDlekUwPAbq00l0DztDwmL1iI4EbYSHEI+yI=;
        b=GZKghNUjjXT8Ra9Qr9p8jBZbLiRSdeh/ojmb02qQFb06vR8dPfDmFkTUE4vdtThE3v
         fMTZcRDI4ZfgcrK5+7Z2bOQw4Mtdf04RvCyjtVdHN4o5qFoylODM0fE2uEKsFD/t5lLD
         KBCRTyrySql0iJRXIuHPl8Vw0q5cFl+pHK+m16yRIZCFbu8mDl2JMhJycNRvJoCcGBtn
         xw05+Tag9xggz/99F6k7S1hgIGf4m3OF7VmAcgzjTE3kvFGg4lcAUtU/4hbWfR2WxoKZ
         gTd21EBCpMW9prfdJHBCL2+LoQqIU82jkvNI6B+8ZPThFB2DwbRxS80Q4XzL3GUmoIl3
         tm1A==
X-Forwarded-Encrypted: i=1; AJvYcCVQpPIUu66tDl24VSJaHjLOMQ4P9DysFKDUbq89+GhB6HFS89Wivom2EWq43tNCt6fzG7Tb4SRRCA3vSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu4vLYRj21XswU2Ta/Hh/g71JmtjMmJtgOFTfQdb97GCgIgABp
	M3IB5tLjZZC0I3VNX5ewhZEVejoVoBEfPUChKQblZlYJ1Nv2iBncbcxy6ITeY5RVoHi9+YTWYo3
	RPWFTnB1SZrrL3XG+WuUK1b7B9697xXax1egcQFmv1309gQBdNkKbvGHw0kU=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:83dc:10b0:67e:1b6c:5416 with SMTP id
 006d021491bc7-67e1b6c66dfmr718112eaf.68.1774624408678; Fri, 27 Mar 2026
 08:13:28 -0700 (PDT)
Date: Fri, 27 Mar 2026 08:13:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69c69e98.a00a0220.2a1a21.0007.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in v4l2_fh_release
From: syzbot <syzbot+4a824e616e58ca2b3d25@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=6754c86e8d9e4c91];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-57270-lists,linux-media=lfdr.de,4a824e616e58ca2b3d25];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,syzkaller.appspot.com:url,storage.googleapis.com:url,appspotmail.com:email,googlegroups.com:email]
X-Rspamd-Queue-Id: 27AF834689E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    c369299895a5 Linux 7.0-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14f7aada580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6754c86e8d9e4c91
dashboard link: https://syzkaller.appspot.com/bug?extid=4a824e616e58ca2b3d25
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/958ee462927e/disk-c3692998.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/80dd7c0d3d82/vmlinux-c3692998.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b08eefde95ab/bzImage-c3692998.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4a824e616e58ca2b3d25@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:132 [inline]
BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave+0x40/0x60 kernel/locking/spinlock.c:162
Read of size 1 at addr ffff88807cf2c638 by task v4l_id/9930

CPU: 0 UID: 0 PID: 9930 Comm: v4l_id Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xba/0x230 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 __kasan_check_byte+0x2a/0x40 mm/kasan/common.c:574
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire+0x79/0x2e0 kernel/locking/lockdep.c:5842
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:132 [inline]
 _raw_spin_lock_irqsave+0x40/0x60 kernel/locking/spinlock.c:162
 v4l2_fh_del drivers/media/v4l2-core/v4l2-fh.c:74 [inline]
 v4l2_fh_release+0x78/0x290 drivers/media/v4l2-core/v4l2-fh.c:99
 v4l2_release+0x250/0x370 drivers/media/v4l2-core/v4l2-dev.c:471
 __fput+0x44f/0xa70 fs/file_table.c:469
 fput_close_sync+0x11f/0x240 fs/file_table.c:574
 __do_sys_close fs/open.c:1509 [inline]
 __se_sys_close fs/open.c:1494 [inline]
 __x64_sys_close+0x7e/0x110 fs/open.c:1494
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f43cd8a7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007fff1cfbd880 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 00007f43ce03d880 RCX: 00007f43cd8a7407
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007f43ce03d6e8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
R13: 00007fff1cfbdab0 R14: 00007f43ce1a4000 R15: 000055602b2034d8
 </TASK>

Allocated by task 29:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x31c/0x660 mm/slub.c:5380
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 hackrf_probe+0xe6/0x13a0 drivers/media/usb/hackrf/hackrf.c:1351
 usb_probe_interface+0x668/0xc90 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:721
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:863
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:893
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:1021
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c5/0x450 drivers/base/dd.c:1093
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1148
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:613
 device_add+0x7b6/0xb70 drivers/base/core.c:3691
 usb_set_configuration+0x1a87/0x2110 drivers/usb/core/message.c:2266
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x3b0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:721
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:863
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:893
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:1021
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c5/0x450 drivers/base/dd.c:1093
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1148
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:613
 device_add+0x7b6/0xb70 drivers/base/core.c:3691
 usb_new_device+0xa08/0x16f0 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2a1c/0x4f30 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3276 [inline]
 process_scheduled_works+0xb6e/0x18c0 kernel/workqueue.c:3359
 worker_thread+0xa53/0xfc0 kernel/workqueue.c:3440
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 29:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2685 [inline]
 slab_free mm/slub.c:6165 [inline]
 kfree+0x1c1/0x630 mm/slub.c:6483
 hackrf_probe+0xdb4/0x13a0 drivers/media/usb/hackrf/hackrf.c:1523
 usb_probe_interface+0x668/0xc90 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:721
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:863
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:893
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:1021
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c5/0x450 drivers/base/dd.c:1093
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1148
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:613
 device_add+0x7b6/0xb70 drivers/base/core.c:3691
 usb_set_configuration+0x1a87/0x2110 drivers/usb/core/message.c:2266
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x3b0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:721
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:863
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:893
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:1021
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c5/0x450 drivers/base/dd.c:1093
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1148
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:613
 device_add+0x7b6/0xb70 drivers/base/core.c:3691
 usb_new_device+0xa08/0x16f0 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2a1c/0x4f30 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3276 [inline]
 process_scheduled_works+0xb6e/0x18c0 kernel/workqueue.c:3359
 worker_thread+0xa53/0xfc0 kernel/workqueue.c:3440
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88807cf2c000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 1592 bytes inside of
 freed 8192-byte region [ffff88807cf2c000, ffff88807cf2e000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7cf28
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88813fea6280 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88813fea6280 dead000000000100 dead000000000122
head: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0001f3ca01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5476, tgid 5476 (run-parts), ts 46677467596, free_ts 46572395863
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x231/0x280 mm/page_alloc.c:1889
 prep_new_page mm/page_alloc.c:1897 [inline]
 get_page_from_freelist+0x24dc/0x2580 mm/page_alloc.c:3962
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5250
 alloc_slab_page mm/slub.c:3292 [inline]
 allocate_slab+0x77/0x660 mm/slub.c:3481
 new_slab mm/slub.c:3539 [inline]
 refill_objects+0x331/0x3c0 mm/slub.c:7175
 refill_sheaf mm/slub.c:2812 [inline]
 __pcs_replace_empty_main+0x2e6/0x730 mm/slub.c:4615
 alloc_from_pcs mm/slub.c:4717 [inline]
 slab_alloc_node mm/slub.c:4851 [inline]
 __kmalloc_cache_noprof+0x392/0x660 mm/slub.c:5375
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 tomoyo_print_bprm security/tomoyo/audit.c:26 [inline]
 tomoyo_init_log+0x112e/0x1fb0 security/tomoyo/audit.c:264
 tomoyo_supervisor+0x353/0x1570 security/tomoyo/common.c:2232
 tomoyo_audit_env_log security/tomoyo/environ.c:37 [inline]
 tomoyo_env_perm+0x151/0x1f0 security/tomoyo/environ.c:64
 tomoyo_environ security/tomoyo/domain.c:673 [inline]
 tomoyo_find_next_domain+0x15cb/0x1aa0 security/tomoyo/domain.c:889
 tomoyo_bprm_check_security+0x11b/0x180 security/tomoyo/tomoyo.c:102
 security_bprm_check+0x85/0x240 security/security.c:794
 search_binary_handler fs/exec.c:1654 [inline]
 exec_binprm fs/exec.c:1696 [inline]
 bprm_execve+0x896/0x1460 fs/exec.c:1748
 do_execveat_common+0x50d/0x690 fs/exec.c:1846
 __do_sys_execve fs/exec.c:1930 [inline]
 __se_sys_execve fs/exec.c:1924 [inline]
 __x64_sys_execve+0x97/0xc0 fs/exec.c:1924
page last free pid 5474 tgid 5474 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1433 [inline]
 __free_frozen_pages+0xc2b/0xdb0 mm/page_alloc.c:2978
 __slab_free+0x263/0x2b0 mm/slub.c:5573
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4538 [inline]
 slab_alloc_node mm/slub.c:4866 [inline]
 __do_kmalloc_node mm/slub.c:5259 [inline]
 __kmalloc_noprof+0x316/0x760 mm/slub.c:5272
 kmalloc_noprof include/linux/slab.h:954 [inline]
 tomoyo_add_entry security/tomoyo/common.c:2166 [inline]
 tomoyo_supervisor+0xc22/0x1570 security/tomoyo/common.c:2238
 tomoyo_audit_env_log security/tomoyo/environ.c:37 [inline]
 tomoyo_env_perm+0x151/0x1f0 security/tomoyo/environ.c:64
 tomoyo_environ security/tomoyo/domain.c:673 [inline]
 tomoyo_find_next_domain+0x15cb/0x1aa0 security/tomoyo/domain.c:889
 tomoyo_bprm_check_security+0x11b/0x180 security/tomoyo/tomoyo.c:102
 security_bprm_check+0x85/0x240 security/security.c:794
 search_binary_handler fs/exec.c:1654 [inline]
 exec_binprm fs/exec.c:1696 [inline]
 bprm_execve+0x896/0x1460 fs/exec.c:1748
 do_execveat_common+0x50d/0x690 fs/exec.c:1846
 __do_sys_execve fs/exec.c:1930 [inline]
 __se_sys_execve fs/exec.c:1924 [inline]
 __x64_sys_execve+0x97/0xc0 fs/exec.c:1924
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88807cf2c500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807cf2c580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88807cf2c600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                        ^
 ffff88807cf2c680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807cf2c700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

