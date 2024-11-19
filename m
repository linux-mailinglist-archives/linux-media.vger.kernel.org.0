Return-Path: <linux-media+bounces-21600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7479D2E20
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 19:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC34281C6F
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 18:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB22F1D1514;
	Tue, 19 Nov 2024 18:42:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70DF14D70B
	for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 18:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732041749; cv=none; b=l9Sai3erdLhNLMXbdUMWVNN3jUrp75Rfi7xRHGQX/TWfDzjUTkudJAIFzeYCVEsSUCaYd5QZknaDA8tC2R9If54pJzMDt4S6QlJ8j5Glq4Xgk8dAA9RIliEwEvCSrfBkkQBvXQ/6XcslPLESaKrn28NBdGhAT9bOATWZRO7xD8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732041749; c=relaxed/simple;
	bh=XRTs5BOAv4w+h4DasqdtdmozWSI4HapZ0cFjGPmeqfU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=XtzsrAGFd+MYOQr+7bWzQjqzW1UC8vQXP8/yNxbHqoON9K9Qx39yww1+09y7xn1TPMuA5Y7q3ogqH/PNmFrGrOpJePThWdJilDbZf4vheKlwzhEeCDVSNB/IgdnkHFH+obwB6fYTiZQBnZboInb1TSnXnnmrnER5wiVr7SlmuM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-83abb2b6d42so446851939f.3
        for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 10:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732041747; x=1732646547;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTw0G2VtH8wbqGuCNxEUCcW6CbhboEFLFGhaVeXbM1o=;
        b=ZGRWfUuy8Mr0HZN3oax1j5ENVheaZSxliFTNqPyn1EXNOL0T8n/6lNovMMAIRG2Vk3
         uWu0ksjlpwEmsLA49q8q/a5ILxEGlozcek8sUsX9cAzhfwSDSZqsUAhdSsbS7v8zZCy8
         e7PnsEHl4w81o+z5pwGywtDmghpT+AwDfWDNjH4T0FZlGTMvlSCqvnQL9htWD6gBBvOy
         31qkDXCAKGcrJLbSctVpKFgTb7cjI0GPFYMF8Vg83yXTHR+ptbIy3v7dmrh01Kn87ygc
         +8yaREzaaakNq+TAo5M7LhN6utSXWvvYQ/1k+iIMDUUrOy4PgZliPOwJMqZnnI0qLMGW
         syYw==
X-Forwarded-Encrypted: i=1; AJvYcCWSwiCKgXUPeKa6BQvtPW0YM6uHzB5QXoaes8Wlu210936fAVS/4wwFk96zrokbj3oXGN1XfC6Rz/prqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6mFbxxn2hthiPRVLcWn+QF2H/cKtfbmHfM5vkOQjbL5iT+jnR
	PP980JWLvLRksoEEADZ67aEXivF6Lc93e8cxBX9tRpvReU+bRsGwYTkGNK0Rn1kLfAkQHOtJjf5
	9fmnlYeTsp4IFvqQICtiuE3PaFYD9A/JritAUTAn5SGyZ2IvB3QqxyQA=
X-Google-Smtp-Source: AGHT+IEzleSJpcNcqlkE8SCG0HV91qdOud4V5VgPd2vGX1O1A33jP2pLYHgovAfVIsG+zSW2yj/wDVAc95/x6b+mp3acDxEMkM8e
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1ca3:b0:3a7:1e1b:5d31 with SMTP id
 e9e14a558f8ab-3a747f23235mr189434765ab.0.1732041745364; Tue, 19 Nov 2024
 10:42:25 -0800 (PST)
Date: Tue, 19 Nov 2024 10:42:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673cdc11.050a0220.102984.0000.GAE@google.com>
Subject: [syzbot] [media?] [usb?] KASAN: slab-use-after-free Read in v4l2_release
From: syzbot <syzbot+6b52c2b24e341804a58c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cfaaa7d010d1 Merge tag 'net-6.12-rc8' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1365b1a7980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=327b6119dd928cbc
dashboard link: https://syzkaller.appspot.com/bug?extid=6b52c2b24e341804a58c
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12d7dcc0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11176b5f980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/165690e61317/disk-cfaaa7d0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f9a0f36bc43c/vmlinux-cfaaa7d0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6e15e2011b02/bzImage-cfaaa7d0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6b52c2b24e341804a58c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in v4l2_release+0x3e2/0x460 drivers/media/v4l2-core/v4l2-dev.c:453
Read of size 8 at addr ffff8880502e80c8 by task v4l_id/7854

CPU: 1 UID: 0 PID: 7854 Comm: v4l_id Not tainted 6.12.0-rc7-syzkaller-00125-gcfaaa7d010d1 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/30/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:488
 kasan_report+0xd9/0x110 mm/kasan/report.c:601
 v4l2_release+0x3e2/0x460 drivers/media/v4l2-core/v4l2-dev.c:453
 __fput+0x3f6/0xb60 fs/file_table.c:431
 __fput_sync+0x45/0x50 fs/file_table.c:516
 __do_sys_close fs/open.c:1567 [inline]
 __se_sys_close fs/open.c:1552 [inline]
 __x64_sys_close+0x86/0x100 fs/open.c:1552
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb945b170a8
Code: 48 8b 05 83 9d 0d 00 64 c7 00 16 00 00 00 83 c8 ff 48 83 c4 20 5b c3 64 8b 04 25 18 00 00 00 85 c0 75 20 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 76 5b 48 8b 15 51 9d 0d 00 f7 d8 64 89 02 48 83
RSP: 002b:00007ffce37bdcf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 00007fb945ecdce0 RCX: 00007fb945b170a8
RDX: 0000000000000001 RSI: 000055f495dc60e7 RDI: 0000000000000003
RBP: 0000000000000003 R08: 0000000000000006 R09: 0000000000000000
R10: 000055f495dc60e1 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffce37bdef0 R14: 000055f495dbf670 R15: 00007fb945fb3a80
 </TASK>

Allocated by task 6058:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:878 [inline]
 kzalloc_noprof include/linux/slab.h:1014 [inline]
 hackrf_probe+0xd1/0x1cf0 drivers/media/usb/hackrf/hackrf.c:1353
 usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3672
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
 device_add+0x114b/0x1a70 drivers/base/core.c:3672
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2d9a/0x4e10 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 6058:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:579
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:230 [inline]
 slab_free_hook mm/slub.c:2342 [inline]
 slab_free mm/slub.c:4579 [inline]
 kfree+0x14f/0x4b0 mm/slub.c:4727
 hackrf_probe+0x4c9/0x1cf0 drivers/media/usb/hackrf/hackrf.c:1525
 usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3672
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
 device_add+0x114b/0x1a70 drivers/base/core.c:3672
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2d9a/0x4e10 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

The buggy address belongs to the object at ffff8880502e8000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 200 bytes inside of
 freed 8192-byte region [ffff8880502e8000, ffff8880502ea000)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x502e8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b042280 dead000000000100 dead000000000122
raw: 0000000000000000 0000000080020002 00000001f5000000 0000000000000000
head: 00fff00000000040 ffff88801b042280 dead000000000100 dead000000000122
head: 0000000000000000 0000000080020002 00000001f5000000 0000000000000000
head: 00fff00000000003 ffffea000140ba01 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5204, tgid 5204 (S10udev), ts 13144656310, free_ts 10453105280
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1556
 prep_new_page mm/page_alloc.c:1564 [inline]
 get_page_from_freelist+0xfce/0x2f80 mm/page_alloc.c:3474
 __alloc_pages_noprof+0x223/0x25a0 mm/page_alloc.c:4750
 alloc_pages_mpol_noprof+0x2c9/0x610 mm/mempolicy.c:2265
 alloc_slab_page mm/slub.c:2412 [inline]
 allocate_slab mm/slub.c:2578 [inline]
 new_slab+0x2c9/0x410 mm/slub.c:2631
 ___slab_alloc+0xdac/0x1880 mm/slub.c:3818
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3908
 __slab_alloc_node mm/slub.c:3961 [inline]
 slab_alloc_node mm/slub.c:4122 [inline]
 __kmalloc_cache_noprof+0x2b4/0x300 mm/slub.c:4290
 kmalloc_noprof include/linux/slab.h:878 [inline]
 kzalloc_noprof include/linux/slab.h:1014 [inline]
 tomoyo_print_bprm security/tomoyo/audit.c:26 [inline]
 tomoyo_init_log+0xcb3/0x2170 security/tomoyo/audit.c:264
 tomoyo_supervisor+0x30c/0xea0 security/tomoyo/common.c:2089
 tomoyo_audit_env_log security/tomoyo/environ.c:36 [inline]
 tomoyo_env_perm+0x193/0x210 security/tomoyo/environ.c:63
 tomoyo_environ security/tomoyo/domain.c:672 [inline]
 tomoyo_find_next_domain+0xe8e/0x2070 security/tomoyo/domain.c:881
 tomoyo_bprm_check_security security/tomoyo/tomoyo.c:102 [inline]
 tomoyo_bprm_check_security+0x12b/0x1d0 security/tomoyo/tomoyo.c:92
 security_bprm_check+0x1b9/0x1e0 security/security.c:1297
 search_binary_handler fs/exec.c:1740 [inline]
 exec_binprm fs/exec.c:1794 [inline]
 bprm_execve fs/exec.c:1845 [inline]
 bprm_execve+0x642/0x1960 fs/exec.c:1821
 do_execveat_common.isra.0+0x4f1/0x630 fs/exec.c:1952
page last free pid 1 tgid 1 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_page+0x661/0x1080 mm/page_alloc.c:2657
 free_contig_range+0x133/0x3f0 mm/page_alloc.c:6765
 destroy_args+0xa87/0xe60 mm/debug_vm_pgtable.c:1017
 debug_vm_pgtable+0x168e/0x31a0 mm/debug_vm_pgtable.c:1397
 do_one_initcall+0x128/0x700 init/main.c:1269
 do_initcall_level init/main.c:1331 [inline]
 do_initcalls init/main.c:1347 [inline]
 do_basic_setup init/main.c:1366 [inline]
 kernel_init_freeable+0x5c7/0x900 init/main.c:1580
 kernel_init+0x1c/0x2b0 init/main.c:1469
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Memory state around the buggy address:
 ffff8880502e7f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880502e8000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8880502e8080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff8880502e8100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880502e8180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

