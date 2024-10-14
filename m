Return-Path: <linux-media+bounces-19530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7919699BFD6
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 08:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1AF6B20FBE
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 06:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525F113F435;
	Mon, 14 Oct 2024 06:11:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FBC13D52C
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 06:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728886292; cv=none; b=VOMhitJY10XyAvhAPO95/par3Z73EGi7MyzYeChN7ylN6Hmm/sTaJ7eHSwwPyRgKqyjmcUu/7StUqF2AJiyMV2bAyxc+9yoDlrr40zgLsCmqaeBIMhk6HCBUfP7KaozgF7m6PZEZ6uKU9b4PQB0nCMwdjw80XSDNp+pAj6UgzxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728886292; c=relaxed/simple;
	bh=jXZu+jwnZtNiiZzdkWY9TNELbHfPDBDiOC4Wh3Dq5ng=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=o1BO3ZkQ5eZ+t2zIlB+vOeYC9NMXpqm2wO+roo+BcG1AObaBG9IW/3n3y3O3+mgPUuhi8tshCpXKvt1KltMzkmb9wOGnx7ZaZ+aFXc+uUxMg0AiEoFN6O2SW4Kp5Gz7j3C+Y1bSuDkheA6pOmGb600en4opz/wvRojM0rGoNM8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a3c24f3111so8838755ab.1
        for <linux-media@vger.kernel.org>; Sun, 13 Oct 2024 23:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728886289; x=1729491089;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KAwTPqEyGyOrmmEsiyfcIP87G1YgVMRbUzNYraNxtcE=;
        b=DK/8CIGGBBL5D9b2YyFgaeDOn2f4mfGWtka2ebWvsdAxDJhRxRNiEZDvAEKdfgR6Os
         MKZf5MO6HFAitCGaKHiQ7/V/kPs1/cQFBRdU576MvB7miBO9SKlS0N30oORPDzM31+5X
         iJzJH3ZTVbA8SwE2L+rj7FKzMCzDtRW9X3WCKbJYTF+76/NJZKU/Ouzqw5GNdXkxbxd8
         ndwZZIyrUa0dWTZ4zsWHDY+a+PzcSmJ567XvIYq/J02ZA4xnbrOffWjAEc/WybACFy7x
         pjkIPm0OaTF7Ij5nuBYJP3/eRCKRTpt1rUm3lLPcKiXOcdHcaHU3q3PnxPwDKGvgtS3V
         RotQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2nZzS2b0XR7XxnqJ1Phv6Ovo3yCF/v5IxtDTfR+1sq2HWxb2MFTfiacPI0XPh19/JVqz3MBmxCb/g9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsaZQovQXSGSlWbIL/23y+25+BkG0IXdypPf+uN3nxUesfTNW+
	6DTfJteQIthZAGfDcZg32WGmsCZhbzjzYUovos1eKzW8H7jz+kYqd5640ORiQqbrxTFKTAB+Szc
	J1CVeZn5aJz0gOWvxaD59MaDhmP1BzuZdlIKsQgM4m/953auPuEpsuvg=
X-Google-Smtp-Source: AGHT+IH0mtP29tXuQOKaQuuYOWiOZo16WQQxpPEYRQ3LRP5Q/DmXNkR5cFkdFLnezXI7X+7Z4kRyMNQkebR68ofGFFQQcl6nVHZC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a2e:b0:3a3:96c4:29bc with SMTP id
 e9e14a558f8ab-3a3b5f70adfmr92007305ab.11.1728886289376; Sun, 13 Oct 2024
 23:11:29 -0700 (PDT)
Date: Sun, 13 Oct 2024 23:11:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670cb611.050a0220.3e960.0055.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in __video_register_device
From: syzbot <syzbot+65e7f3352b7346273644@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9852d85ec9d4 Linux 6.12-rc1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=159d5527980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
dashboard link: https://syzkaller.appspot.com/bug?extid=65e7f3352b7346273644
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d44acbbed8bd/disk-9852d85e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8e54c80139e6/vmlinux-9852d85e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/35f22e8643ee/bzImage-9852d85e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+65e7f3352b7346273644@syzkaller.appspotmail.com

pwc: recv_control_msg error -71 req 04 val 1100
pwc: recv_control_msg error -71 req 04 val 1200
==================================================================
BUG: KASAN: slab-use-after-free in get_index drivers/media/v4l2-core/v4l2-dev.c:512 [inline]
BUG: KASAN: slab-use-after-free in __video_register_device+0x4a2d/0x5aa0 drivers/media/v4l2-core/v4l2-dev.c:1028
Read of size 8 at addr ffff88811258c720 by task kworker/1:4/4947

CPU: 1 UID: 0 PID: 4947 Comm: kworker/1:4 Not tainted 6.12.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:488
 kasan_report+0xd9/0x110 mm/kasan/report.c:601
 get_index drivers/media/v4l2-core/v4l2-dev.c:512 [inline]
 __video_register_device+0x4a2d/0x5aa0 drivers/media/v4l2-core/v4l2-dev.c:1028
 video_register_device include/media/v4l2-dev.h:383 [inline]
 usb_pwc_probe+0xc69/0x1d40 drivers/media/usb/pwc/pwc-if.c:1123
 usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3675
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:254
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:294
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3675
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2e58/0x4f40 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 2511:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:878 [inline]
 kzalloc_noprof include/linux/slab.h:1014 [inline]
 em28xx_v4l2_init+0x114/0x4050 drivers/media/usb/em28xx/em28xx-video.c:2534
 em28xx_init_extension+0x137/0x200 drivers/media/usb/em28xx/em28xx-core.c:1117
 request_module_async+0x61/0x70 drivers/media/usb/em28xx/em28xx-cards.c:3457
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 2511:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:579
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:230 [inline]
 slab_free_hook mm/slub.c:2343 [inline]
 slab_free mm/slub.c:4580 [inline]
 kfree+0x130/0x480 mm/slub.c:4728
 em28xx_free_v4l2 drivers/media/usb/em28xx/em28xx-video.c:2120 [inline]
 kref_put include/linux/kref.h:65 [inline]
 em28xx_v4l2_init+0x22a4/0x4050 drivers/media/usb/em28xx/em28xx-video.c:2903
 em28xx_init_extension+0x137/0x200 drivers/media/usb/em28xx/em28xx-core.c:1117
 request_module_async+0x61/0x70 drivers/media/usb/em28xx/em28xx-cards.c:3457
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

The buggy address belongs to the object at ffff88811258c000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 1824 bytes inside of
 freed 8192-byte region [ffff88811258c000, ffff88811258e000)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x112588
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x200000000000040(head|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000040 ffff888100042280 ffffea0004856c00 dead000000000004
raw: 0000000000000000 0000000080020002 00000001f5000000 0000000000000000
head: 0200000000000040 ffff888100042280 ffffea0004856c00 dead000000000004
head: 0000000000000000 0000000080020002 00000001f5000000 0000000000000000
head: 0200000000000003 ffffea0004496201 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 4999, tgid 4999 (kworker/1:5), ts 478011086957, free_ts 477789466413
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1537
 prep_new_page mm/page_alloc.c:1545 [inline]
 get_page_from_freelist+0xd5c/0x2630 mm/page_alloc.c:3457
 __alloc_pages_noprof+0x221/0x22a0 mm/page_alloc.c:4733
 alloc_pages_mpol_noprof+0xeb/0x400 mm/mempolicy.c:2265
 alloc_slab_page mm/slub.c:2413 [inline]
 allocate_slab mm/slub.c:2579 [inline]
 new_slab+0x2ba/0x3f0 mm/slub.c:2632
 ___slab_alloc+0xd45/0x1760 mm/slub.c:3819
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3909
 __slab_alloc_node mm/slub.c:3962 [inline]
 slab_alloc_node mm/slub.c:4123 [inline]
 __do_kmalloc_node mm/slub.c:4264 [inline]
 __kmalloc_noprof+0x325/0x3c0 mm/slub.c:4277
 kmalloc_noprof include/linux/slab.h:882 [inline]
 kzalloc_noprof include/linux/slab.h:1014 [inline]
 usb_get_configuration+0x122/0x5e50 drivers/usb/core/config.c:894
 usb_enumerate_device drivers/usb/core/hub.c:2483 [inline]
 usb_new_device+0x1189/0x1a10 drivers/usb/core/hub.c:2621


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

