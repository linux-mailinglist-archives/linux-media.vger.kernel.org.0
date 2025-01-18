Return-Path: <linux-media+bounces-24891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD83A15EA8
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 20:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660B53A7A4E
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 19:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FAA1B0416;
	Sat, 18 Jan 2025 19:50:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55EA35968
	for <linux-media@vger.kernel.org>; Sat, 18 Jan 2025 19:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737229832; cv=none; b=lVA87YvQzd3qqf4P3U3tFH8TggTgCnnlTAFDFuPAWEvFhcC9gPRD0xHJ59zVB7x/izIomGJmTZHBsJO1nuZ/ExegcPyOC7jfJ9g/Ybw3mBxzEFzztGKGKu4WHbXRy5Ym74uos0OrayHjTiC7TzbwAW9/DdgTAJhFhUR/KgYSVlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737229832; c=relaxed/simple;
	bh=Sl4vn9f4P5V29wFY21pGI0ihP6JMHBmt5JLlRQXlpeY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SWJ9n6r5jLIhzu4UQ3xX3JTkHij3uXTT/948BNS8Ntkh1iI02N4zppT0uzmkUGC8ZYuLQ5Ln3zooS78py44gb8zm5tGEyNFVCvhKR3V0U7X2C9esV8ALOS1DnG0DcQkAOBDSSKsAF/HZdcdDBC1quAVgtnjYrGznJLGqRNFPdQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ac98b49e4dso24422985ab.1
        for <linux-media@vger.kernel.org>; Sat, 18 Jan 2025 11:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737229830; x=1737834630;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kl7jiSqB0VL6kIAJobfR1F8iawa5A19arTDWfexfD+c=;
        b=pYeHe/QSkcUl+IKdQFIGas+RirSSbhA5VQUQMfIkwMkVdLErEOuKe/DTwz0gEZLvhu
         VKPOkXl08eeU6cNU7AinJKD5EcJ+80R/4UohGzUzdTYl6fCoioqys81LL8dMh4fg/RTe
         w8aZAj8comZZB592sJN7GdrCbF1aroErE0dp5prbZ4MVzvE6//gaX1KGmPSrMw1GAeF5
         TBtZoXF6kp4uaz7U0XDxShAUSdal9JAGuffuNXU1movjYIMVujS2huepdCTDTjpxeXEF
         6hGuqnGS5tVXGmcI72Q8rIpKIsm4r2WfVuoQIlOZrP95InW1dE8FdO8fp4m7Wpp0PJn0
         sLZA==
X-Forwarded-Encrypted: i=1; AJvYcCW/e/NT4QDtj/y+D4JpriAcdzngViFn0G9nAHR7nxlEOgo5Rpp7+trKXUPFcjS/frK9PtUwQx3jH/Wb1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGdtiH4bkGy2MFNRlvv/sPeoHiVO/qPttT1cCeyfM5+1BAtpqT
	5jEi0crjb2zHPeTO5yS8GpzubpDaix6Zd/E7NR8YPfsrFC99UEVkxhRvZwGi+5nFkwiT6T6AlKo
	Vzef3w4KOyg0AfdNG+83qd9T8JbsThulr3RVx4eunXlkofyNE5C/JRDM=
X-Google-Smtp-Source: AGHT+IFRjZHd4R4YczMT93LjUVDig7e7CskBUgtGxxZsZKO68FbeEwI64C8aOhIT9QjecVyz/X0etjgcEAB1ed28AqCj1OmvXUUp
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b09:b0:3a7:8cdd:c0d2 with SMTP id
 e9e14a558f8ab-3cf7425822amr41774535ab.0.1737229829944; Sat, 18 Jan 2025
 11:50:29 -0800 (PST)
Date: Sat, 18 Jan 2025 11:50:29 -0800
In-Reply-To: <67668244.050a0220.25abdd.012a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <678c0605.050a0220.303755.0031.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in dvb_device_open
From: syzbot <syzbot+1eb177ecc3943b883f0a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    595523945be0 Merge tag 'devicetree-fixes-for-6.13-2' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17237a18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f5e182416a4b418f
dashboard link: https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=144891f8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12183fc4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1051770fb50b/disk-59552394.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/390a709a05b7/vmlinux-59552394.xz
kernel image: https://storage.googleapis.com/syzbot-assets/72a0a455bf23/bzImage-59552394.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1eb177ecc3943b883f0a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in dvb_device_open+0x36a/0x3b0 drivers/media/dvb-core/dvbdev.c:99
Read of size 8 at addr ffff8881476baa18 by task syz-executor353/9116

CPU: 1 UID: 0 PID: 9116 Comm: syz-executor353 Not tainted 6.13.0-rc7-syzkaller-00189-g595523945be0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 dvb_device_open+0x36a/0x3b0 drivers/media/dvb-core/dvbdev.c:99
 chrdev_open+0x237/0x6a0 fs/char_dev.c:414
 do_dentry_open+0xf59/0x1ea0 fs/open.c:945
 vfs_open+0x82/0x3f0 fs/open.c:1075
 do_open fs/namei.c:3828 [inline]
 path_openat+0x1e6a/0x2d60 fs/namei.c:3987
 do_filp_open+0x20c/0x470 fs/namei.c:4014
 do_sys_openat2+0x17a/0x1e0 fs/open.c:1402
 do_sys_open fs/open.c:1417 [inline]
 __do_sys_openat fs/open.c:1433 [inline]
 __se_sys_openat fs/open.c:1428 [inline]
 __x64_sys_openat+0x175/0x210 fs/open.c:1428
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbafad2db29
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff3ae8be88 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fbafad2db29
RDX: 0000000000000001 RSI: 0000000020000000 RDI: ffffffffffffff9c
RBP: 00000000000f4240 R08: 0000000000008000 R09: 0000000000008000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000015edd
R13: 00007fff3ae8beac R14: 00007fff3ae8bec0 R15: 00007fff3ae8beb0
 </TASK>

Allocated by task 1:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 dvb_register_device+0x1e2/0x2380 drivers/media/dvb-core/dvbdev.c:475
 dvb_register_frontend+0x5a7/0x880 drivers/media/dvb-core/dvb_frontend.c:3051
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:430 [inline]
 vidtv_bridge_probe+0x45e/0xa90 drivers/media/test-drivers/vidtv/vidtv_bridge.c:502
 platform_probe+0xff/0x1f0 drivers/base/platform.c:1404
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __driver_attach+0x283/0x580 drivers/base/dd.c:1216
 bus_for_each_dev+0x13c/0x1d0 drivers/base/bus.c:370
 bus_add_driver+0x2e9/0x690 drivers/base/bus.c:675
 driver_register+0x15c/0x4b0 drivers/base/driver.c:246
 vidtv_bridge_init+0x45/0x80 drivers/media/test-drivers/vidtv/vidtv_bridge.c:592
 do_one_initcall+0x128/0x630 init/main.c:1266
 do_initcall_level init/main.c:1328 [inline]
 do_initcalls init/main.c:1344 [inline]
 do_basic_setup init/main.c:1363 [inline]
 kernel_init_freeable+0x58f/0x8b0 init/main.c:1577
 kernel_init+0x1c/0x2b0 init/main.c:1466
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 9110:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:582
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4613 [inline]
 kfree+0x14f/0x4b0 mm/slub.c:4761
 dvb_free_device drivers/media/dvb-core/dvbdev.c:619 [inline]
 kref_put include/linux/kref.h:65 [inline]
 dvb_device_put.part.0+0x60/0x90 drivers/media/dvb-core/dvbdev.c:632
 dvb_device_put drivers/media/dvb-core/dvbdev.c:631 [inline]
 dvb_device_open+0x2a4/0x3b0 drivers/media/dvb-core/dvbdev.c:113
 chrdev_open+0x237/0x6a0 fs/char_dev.c:414
 do_dentry_open+0xf59/0x1ea0 fs/open.c:945
 vfs_open+0x82/0x3f0 fs/open.c:1075
 do_open fs/namei.c:3828 [inline]
 path_openat+0x1e6a/0x2d60 fs/namei.c:3987
 do_filp_open+0x20c/0x470 fs/namei.c:4014
 do_sys_openat2+0x17a/0x1e0 fs/open.c:1402
 do_sys_open fs/open.c:1417 [inline]
 __do_sys_openat fs/open.c:1433 [inline]
 __se_sys_openat fs/open.c:1428 [inline]
 __x64_sys_openat+0x175/0x210 fs/open.c:1428
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff8881476baa00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 24 bytes inside of
 freed 256-byte region [ffff8881476baa00, ffff8881476bab00)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1476ba
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x57ff00000000040(head|node=1|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 057ff00000000040 ffff88801ac41b40 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000100010 00000001f5000000 0000000000000000
head: 057ff00000000040 ffff88801ac41b40 dead000000000122 0000000000000000
head: 0000000000000000 0000000000100010 00000001f5000000 0000000000000000
head: 057ff00000000001 ffffea00051dae81 ffffffffffffffff 0000000000000000
head: 0000000000000002 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 21808544918, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1558
 prep_new_page mm/page_alloc.c:1566 [inline]
 get_page_from_freelist+0xfce/0x2f80 mm/page_alloc.c:3476
 __alloc_pages_noprof+0x223/0x25b0 mm/page_alloc.c:4753
 alloc_pages_mpol_noprof+0x2c8/0x620 mm/mempolicy.c:2269
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab mm/slub.c:2589 [inline]
 new_slab+0x2c9/0x410 mm/slub.c:2642
 ___slab_alloc+0xce2/0x1650 mm/slub.c:3830
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3920
 __slab_alloc_node mm/slub.c:3995 [inline]
 slab_alloc_node mm/slub.c:4156 [inline]
 __kmalloc_cache_noprof+0xf6/0x420 mm/slub.c:4324
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 bus_add_driver+0x92/0x690 drivers/base/bus.c:659
 driver_register+0x15c/0x4b0 drivers/base/driver.c:246
 usb_register_driver+0x216/0x4d0 drivers/usb/core/driver.c:1078
 do_one_initcall+0x128/0x630 init/main.c:1266
 do_initcall_level init/main.c:1328 [inline]
 do_initcalls init/main.c:1344 [inline]
 do_basic_setup init/main.c:1363 [inline]
 kernel_init_freeable+0x58f/0x8b0 init/main.c:1577
 kernel_init+0x1c/0x2b0 init/main.c:1466
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
page_owner free stack trace missing

Memory state around the buggy address:
 ffff8881476ba900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8881476ba980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8881476baa00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff8881476baa80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881476bab00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

