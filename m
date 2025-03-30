Return-Path: <linux-media+bounces-28990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9812EA758D5
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 09:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0D0D7A447A
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 07:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5FD158A13;
	Sun, 30 Mar 2025 07:21:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2D72AE84
	for <linux-media@vger.kernel.org>; Sun, 30 Mar 2025 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743319283; cv=none; b=hpGMasXRYzuOWfA8KG1pbFDf4ZJYfRUzde+fHl2nx4LnpwtqrCvdQOlZ9Wna+NzqaUWSUzgv+HYPJrVY7O2AwbasVauvYiQ88EFKjT4S6fCkZ6YIbFbSLBgy0npoJlrBkKLkh1ES6pB5jTVqRg1Ieaov0/S9BHXySZzcihbgcbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743319283; c=relaxed/simple;
	bh=k738eV7yzh7Xnf0l+baJdiznh7UPihVpqagJfg4C8sI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BZjQgHNbyS3mQ43kj+jniCqxzcxxGq8WrKnfOL9I/uEC7s3c75Wvvck8qaSugpuAepPDegfpTAYcLFjxJtTOhxISj4vUVBryBCyQJFXnzGTXR07mewd7AiIODL39i3k5pWmtJMkoaksDaqyDtg59px3heIygsFzXJOMMP3GYiPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d443811ed2so60632595ab.3
        for <linux-media@vger.kernel.org>; Sun, 30 Mar 2025 00:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743319281; x=1743924081;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YN1bqYUShpYXpsZIbYbai/4Pd44ShMyMX/7yLMgAtJ8=;
        b=hC4IHWikMiOkFJQogI/V4d7M84tapr193xEJ2EGGfudG58kR2f2Jjz/V5rBhekAQIb
         W+ALMrUrbQxV+cLyMAhkN2S15YVy0M6o/0W/YcUNzDCUrFvkDshTnyDMF9UUUg3esBOE
         r9UBUtSqi+NuR/MZ/cTjtZxq2DC1530XLYHuT85nMGYV7Al4kBM+pbkvug3bJwp3s6ff
         DL1t0HTDxxvRwJ8LYGRvrlQ4Q9xvMjsrTH4iXydSoBA0o0ODNfgLe3dpYep+dJyvH8B+
         qAprFmv3Qo2bTE/XNjaUp66uahmqORSLUDqn6VM+NmyKIzLMX8g0VUHL4KwK0YWfHztI
         /CHA==
X-Forwarded-Encrypted: i=1; AJvYcCWzWU2jYok6uYdwRX09aGCnYtat1zBILg+mU/Fh/oKp8g+TDzhYqh1KLoCWeLwAZW6BEUbm/TiP4zrNMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoX5mDmnHT+z72K/BUpN+YtCBD1VCjfA6U9EgsYKi49qaxyr4y
	z/CGk9NQuRpjwYnP4ySDmIfgqDJ01x8/y1iN0BWc5J7JmRkvGY8C2pEpabO9sJI242ngd05P0+o
	uSUyfMAu0GmuG/mw8TiRTrhRpUUKnT71FOhCbobMdkmRCb19wJTFED3I=
X-Google-Smtp-Source: AGHT+IFd6Jrw4KiUJzPoXOuRT6mWNDrT7YE+phTRHqkA2N1M1bOuqPCXEV/r+StS26s+KJD3H0Qi7S1UI0sl/YXMdN6mV3Jl+9gD
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:194e:b0:3cf:fe21:af8 with SMTP id
 e9e14a558f8ab-3d5e08ed0afmr54956005ab.4.1743319281188; Sun, 30 Mar 2025
 00:21:21 -0700 (PDT)
Date: Sun, 30 Mar 2025 00:21:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e8f0f1.050a0220.1547ec.0092.GAE@google.com>
Subject: [syzbot] [media?] [usb?] KASAN: slab-use-after-free Read in
 load_firmware_cb (2)
From: syzbot <syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a2392f333575 drm/panthor: Clean up FW version information ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=16b57804580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=12ccc0a681e19f95
dashboard link: https://syzkaller.appspot.com/bug?extid=db4326df1b9af04f68fc
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10011de4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15a0864c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/aa9dc8dca3f7/disk-a2392f33.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/96ca6097aca7/vmlinux-a2392f33.xz
kernel image: https://storage.googleapis.com/syzbot-assets/78dee40677fb/Image-a2392f33.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in load_firmware_cb+0xbc/0x1638 drivers/media/tuners/xc2028.c:1372
Read of size 8 at addr ffff0000dccc7318 by task kworker/0:58/6836

CPU: 0 UID: 0 PID: 6836 Comm: kworker/0:58 Not tainted 6.14.0-rc7-syzkaller-ga2392f333575 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: events request_firmware_work_func
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0x198/0x550 mm/kasan/report.c:521
 kasan_report+0xd8/0x138 mm/kasan/report.c:634
 __asan_report_load8_noabort+0x20/0x2c mm/kasan/report_generic.c:381
 load_firmware_cb+0xbc/0x1638 drivers/media/tuners/xc2028.c:1372
 request_firmware_work_func+0x150/0x214 drivers/base/firmware_loader/main.c:1196
 process_one_work+0x810/0x1638 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x97c/0xeec kernel/workqueue.c:3400
 kthread+0x65c/0x7b0 kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862

Allocated by task 6850:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:68
 kasan_save_alloc_info+0x40/0x50 mm/kasan/generic.c:562
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xac/0xc4 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x2cc/0x428 mm/slub.c:4325
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 tuner_probe+0x108/0x1798 drivers/media/v4l2-core/tuner-core.c:636
 i2c_device_probe+0x700/0x9bc drivers/i2c/i2c-core-base.c:590
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x38c/0x8fc drivers/base/dd.c:658
 __driver_probe_device+0x194/0x374 drivers/base/dd.c:800
 driver_probe_device+0x78/0x330 drivers/base/dd.c:830
 __device_attach_driver+0x2a8/0x4f4 drivers/base/dd.c:958
 bus_for_each_drv+0x228/0x2bc drivers/base/bus.c:462
 __device_attach+0x2b4/0x434 drivers/base/dd.c:1030
 device_initial_probe+0x24/0x34 drivers/base/dd.c:1079
 bus_probe_device+0x178/0x240 drivers/base/bus.c:537
 device_add+0x728/0xa6c drivers/base/core.c:3666
 device_register+0x28/0x38 drivers/base/core.c:3748
 i2c_new_client_device+0x8d0/0xf3c drivers/i2c/i2c-core-base.c:1020
 v4l2_i2c_new_subdev_board+0xb0/0x224 drivers/media/v4l2-core/v4l2-i2c.c:80
 v4l2_i2c_new_subdev+0x144/0x1e4 drivers/media/v4l2-core/v4l2-i2c.c:135
 em28xx_v4l2_init+0x6c8/0x28d4 drivers/media/usb/em28xx/em28xx-video.c:2617
 em28xx_init_extension+0x10c/0x1b4 drivers/media/usb/em28xx/em28xx-core.c:1117
 request_module_async+0x68/0x98 drivers/media/usb/em28xx/em28xx-cards.c:3457
 process_one_work+0x810/0x1638 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x97c/0xeec kernel/workqueue.c:3400
 kthread+0x65c/0x7b0 kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862

Freed by task 6850:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:68
 kasan_save_free_info+0x54/0x6c mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x64/0x8c mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x180/0x478 mm/slub.c:4757
 tuner_remove+0x1d8/0x1f4 drivers/media/v4l2-core/tuner-core.c:789
 i2c_device_remove+0x8c/0x1dc drivers/i2c/i2c-core-base.c:631
 device_remove drivers/base/dd.c:567 [inline]
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x3e4/0x698 drivers/base/dd.c:1296
 device_release_driver+0x28/0x38 drivers/base/dd.c:1319
 bus_remove_device+0x314/0x3b4 drivers/base/bus.c:579
 device_del+0x480/0x828 drivers/base/core.c:3855
 device_unregister+0x2c/0xcc drivers/base/core.c:3896
 i2c_unregister_device+0x130/0x190 drivers/i2c/i2c-core-base.c:1069
 v4l2_i2c_subdev_unregister+0xa8/0xbc drivers/media/v4l2-core/v4l2-i2c.c:28
 v4l2_device_unregister+0x17c/0x248 drivers/media/v4l2-core/v4l2-device.c:102
 em28xx_v4l2_init+0x1300/0x28d4 drivers/media/usb/em28xx/em28xx-video.c:2898
 em28xx_init_extension+0x10c/0x1b4 drivers/media/usb/em28xx/em28xx-core.c:1117
 request_module_async+0x68/0x98 drivers/media/usb/em28xx/em28xx-cards.c:3457
 process_one_work+0x810/0x1638 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x97c/0xeec kernel/workqueue.c:3400
 kthread+0x65c/0x7b0 kernel/kthread.c:464
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862

The buggy address belongs to the object at ffff0000dccc7000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 792 bytes inside of
 freed 2048-byte region [ffff0000dccc7000, ffff0000dccc7800)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x11ccc0
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0x5ffc00000000040(head|node=0|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 05ffc00000000040 ffff0000c0002000 0000000000000000 dead000000000001
raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 05ffc00000000040 ffff0000c0002000 0000000000000000 dead000000000001
head: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
head: 05ffc00000000003 fffffdffc3733001 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff0000dccc7200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff0000dccc7280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff0000dccc7300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff0000dccc7380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff0000dccc7400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

