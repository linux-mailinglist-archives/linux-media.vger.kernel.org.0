Return-Path: <linux-media+bounces-63322-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPK3JJToHWp0fwkAu9opvQ
	(envelope-from <linux-media+bounces-63322-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:16:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A799624F98
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0138230297A5
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 20:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1073EFD09;
	Mon,  1 Jun 2026 20:15:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f80.google.com (mail-oa1-f80.google.com [209.85.160.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560AC346ADC
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 20:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780344934; cv=none; b=plwGMyzk0beVVyJsfhCiXEYIvnRD+bzIaiNASQTa49bromT3BagkbwwXr588ehFiBELbm65C8ETHxjxa7InejC/u4m/Z2rAF1VeZogS4ujb5mPHIyU80lnETgfS3i6tbqkTCuD+zf6a+0LhF/DqhbCjI1m7dvrwfW3p04XcqzAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780344934; c=relaxed/simple;
	bh=+g254+7Qgx5n0xq8L9o1RNi399Qkf1w8zvUZZsEy6s8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=OMkQ7WYQVXYkMWhmG8l5+ZGg5mrU04Tb98mjb8Ujnt9oLQ5Jb/vvU4jhxK7eAN2mYolL9EzqTWVTOprKuDd5dUobsOmJMDfpNy0rGRiqbJ0w5hqWtJbkorqavncEOyX+V9ZlWh1dEoZJFFkdOU1or+ckJm137uaD9HyzHO/5tNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f80.google.com with SMTP id 586e51a60fabf-43cce4dad3aso1473838fac.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 13:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780344932; x=1780949732;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbgNU9wV917JpgLW/r9KQyAbvW8yrBt6zmKcheEeKv0=;
        b=CA5TUJlT97XMNt9t4KPK0ukW4AUu+yDWA7DtydRdJajPnK/1PkK9InEQOXV8ZdSy/a
         DdyXruEh6h71oEUgWL0h4h3JDDm+pVXBZDFeUM5KQv9bc2DYIXWxLd0RrTP5BjGLS5aP
         OzowIUEiJUNlrtqDOHH0KF7SOJVvYaMjlTKcGL9YJVEcrW9rcOiA/vLN9i7hqzqQhFB0
         Cdswz8a4sdN91VqK0sGye6ZMl+E1RUGrhor7kJ2FxWhO8wyqX/JKSUcaiM/40MFkY+sk
         oAfbOheQ6JuyzNCyEXcz58zipD2ruHQFwFzD1Agy7bEDWXQ9r3j9VB0W5j+t8pVASGcH
         vo3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ki64QyFChdFJJpxdoOow4SXM4gOF42zKQufC44MTP39TpiY7Y0j1e2ep8xT6Y6iMx9gmAzOLw5iiMIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQvp22TtBBTurplmS1Ihn1vcw99nBB2ug7IpEGbyix3pfcHgL/
	szjlJO+VXO4R8sCFolBKg0OvV7DmAUr9r1+KpVUojzTdcT4fg6Tyvlhw6ZyoOnILYuGaPU8hV0q
	7x47g3kkmQK6Bpr0VefS+NkCr5yQjOCan+cC6U4Fu10YXVzUWw5bI0mnHmx4=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:edc7:0:b0:69d:96c5:4e58 with SMTP id
 006d021491bc7-69e1059eea5mr6241565eaf.28.1780344932373; Mon, 01 Jun 2026
 13:15:32 -0700 (PDT)
Date: Mon, 01 Jun 2026 13:15:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1de864.278b5b03.2bcf39.003b.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in em28xx_v4l2_open
From: syzbot <syzbot+39ff299961a7c07f00f0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=4caf64b1ee83dac0];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63322-lists,linux-media=lfdr.de,39ff299961a7c07f00f0];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 0A799624F98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    6916d5703ddf Merge tag 'drm-fixes-2026-05-16' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14c53a73980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4caf64b1ee83dac0
dashboard link: https://syzkaller.appspot.com/bug?extid=39ff299961a7c07f00f0
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9b209d2c169e/disk-6916d570.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/260ba2c4b438/vmlinux-6916d570.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f62bb45b9b7e/bzImage-6916d570.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+39ff299961a7c07f00f0@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in dev_get_drvdata include/linux/device.h:927 [inline]
BUG: KASAN: slab-use-after-free in video_get_drvdata include/media/v4l2-dev.h:491 [inline]
BUG: KASAN: slab-use-after-free in video_drvdata include/media/v4l2-dev.h:523 [inline]
BUG: KASAN: slab-use-after-free in em28xx_v4l2_open+0x57/0xa20 drivers/media/usb/em28xx/em28xx-video.c:2297
Read of size 8 at addr ffff8880655d8330 by task v4l_id/11714

CPU: 0 UID: 0 PID: 11714 Comm: v4l_id Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 dev_get_drvdata include/linux/device.h:927 [inline]
 video_get_drvdata include/media/v4l2-dev.h:491 [inline]
 video_drvdata include/media/v4l2-dev.h:523 [inline]
 em28xx_v4l2_open+0x57/0xa20 drivers/media/usb/em28xx/em28xx-video.c:2297
 v4l2_open+0x1bf/0x3a0 drivers/media/v4l2-core/v4l2-dev.c:433
 chrdev_open+0x4cd/0x5e0 fs/char_dev.c:411
 do_dentry_open+0x785/0x14e0 fs/open.c:947
 vfs_open+0x3b/0x340 fs/open.c:1079
 do_open fs/namei.c:4699 [inline]
 path_openat+0x2e08/0x3860 fs/namei.c:4858
 do_file_open+0x23e/0x4a0 fs/namei.c:4887
 do_sys_openat2+0x113/0x200 fs/open.c:1364
 do_sys_open fs/open.c:1370 [inline]
 __do_sys_openat fs/open.c:1386 [inline]
 __se_sys_openat fs/open.c:1381 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1381
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f23334a7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffc786a3720 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f2333bc1880 RCX: 00007f23334a7407
RDX: 0000000000000000 RSI: 00007ffc786a4f1a RDI: ffffffffffffff9c
RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000000
R13: 00007ffc786a3970 R14: 00007f2333d28000 R15: 000055bf73e474d8
 </TASK>

Allocated by task 24475:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x31c/0x660 mm/slub.c:5419
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 em28xx_v4l2_init+0x10b/0x2eb0 drivers/media/usb/em28xx/em28xx-video.c:2707
 em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1248
 process_one_work kernel/workqueue.c:3314 [inline]
 process_scheduled_works+0xb5d/0x1860 kernel/workqueue.c:3397
 worker_thread+0xa53/0xfc0 kernel/workqueue.c:3478
 kthread+0x389/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 24475:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2689 [inline]
 slab_free mm/slub.c:6250 [inline]
 kfree+0x1c5/0x640 mm/slub.c:6565
 em28xx_free_v4l2 drivers/media/usb/em28xx/em28xx-video.c:2287 [inline]
 kref_put include/linux/kref.h:65 [inline]
 em28xx_v4l2_init+0x1685/0x2eb0 drivers/media/usb/em28xx/em28xx-video.c:3078
 em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1248
 process_one_work kernel/workqueue.c:3314 [inline]
 process_scheduled_works+0xb5d/0x1860 kernel/workqueue.c:3397
 worker_thread+0xa53/0xfc0 kernel/workqueue.c:3478
 kthread+0x389/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880655d8000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 816 bytes inside of
 freed 8192-byte region [ffff8880655d8000, ffff8880655da000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880655dc000 pfn:0x655d8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88813fe1b280 ffffea0001ddbc10 ffff88813fe19ac8
raw: ffff8880655dc000 0000000800020001 00000000f5000000 0000000000000000
head: 00fff00000000240 ffff88813fe1b280 ffffea0001ddbc10 ffff88813fe19ac8
head: ffff8880655dc000 0000000800020001 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 24475, tgid 24475 (kworker/0:1), ts 2367631693947, free_ts 2367608772413
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x231/0x280 mm/page_alloc.c:1858
 prep_new_page mm/page_alloc.c:1866 [inline]
 get_page_from_freelist+0x24ba/0x2540 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5226
 alloc_slab_page mm/slub.c:3278 [inline]
 allocate_slab+0x77/0x660 mm/slub.c:3467
 new_slab mm/slub.c:3525 [inline]
 refill_objects+0x339/0x3d0 mm/slub.c:7271
 refill_sheaf mm/slub.c:2816 [inline]
 __pcs_replace_empty_main+0x321/0x720 mm/slub.c:4651
 alloc_from_pcs mm/slub.c:4749 [inline]
 slab_alloc_node mm/slub.c:4883 [inline]
 __kmalloc_cache_noprof+0x392/0x660 mm/slub.c:5414
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 em28xx_v4l2_init+0x10b/0x2eb0 drivers/media/usb/em28xx/em28xx-video.c:2707
 em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1248
 process_one_work kernel/workqueue.c:3314 [inline]
 process_scheduled_works+0xb5d/0x1860 kernel/workqueue.c:3397
 worker_thread+0xa53/0xfc0 kernel/workqueue.c:3478
 kthread+0x389/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page last free pid 19335 tgid 19335 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1402 [inline]
 __free_frozen_pages+0xbc7/0xd30 mm/page_alloc.c:2943
 __slab_free+0x274/0x2c0 mm/slub.c:5612
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4569 [inline]
 slab_alloc_node mm/slub.c:4898 [inline]
 __kmalloc_cache_noprof+0x2ba/0x660 mm/slub.c:5414
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 vidtv_s302m_access_unit_init drivers/media/test-drivers/vidtv/vidtv_s302m.c:151 [inline]
 vidtv_s302m_alloc_au drivers/media/test-drivers/vidtv/vidtv_s302m.c:198 [inline]
 vidtv_s302m_encode+0x367/0x1880 drivers/media/test-drivers/vidtv/vidtv_s302m.c:408
 vidtv_mux_poll_encoders drivers/media/test-drivers/vidtv/vidtv_mux.c:333 [inline]
 vidtv_mux_tick+0x1358/0x24e0 drivers/media/test-drivers/vidtv/vidtv_mux.c:410
 process_one_work kernel/workqueue.c:3314 [inline]
 process_scheduled_works+0xb5d/0x1860 kernel/workqueue.c:3397
 worker_thread+0xa53/0xfc0 kernel/workqueue.c:3478
 kthread+0x389/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff8880655d8200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880655d8280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880655d8300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                     ^
 ffff8880655d8380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880655d8400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

