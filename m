Return-Path: <linux-media+bounces-27964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60163A59663
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 14:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 073D43A4981
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F4A229B1F;
	Mon, 10 Mar 2025 13:32:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83541E49F
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 13:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741613541; cv=none; b=qi+mJznn/EMByAsoS2idFAHXe8BGvVmnKfiQv4MgcHD8VYT7q4nYTBkGiRmHAUliV62DBeGKEADNpM0//zO/6bN1BSQeadIGeHPiouLBK4um9JRGq0iord9Q6hcFXRt1IpLYyyh56BqK8EmfLgnqct1ExeeQvszRIoMANU45yh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741613541; c=relaxed/simple;
	bh=MxUGtItzdHn9mOpY/sYS15j1TuaN+v05N+60iPhkelo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IOb19U9ldjDElZw1y7wPqUmqRaEcWSx88AUYOhHgZ041d6XBfL2EMHOENMy8zeW+RzUJN28JzlPGB87u+961A9+tW368HuWExAp6krMJ/a7EJ/69z3WVfcpuVAKcRU9rm2GlVGboXCXAWUsIIvshwnQXJ0debGhWf2MPcxM3EFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d2b3a2f2d4so82197985ab.0
        for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 06:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613539; x=1742218339;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MYbgyRHeKh0XqiQ7QhQ5H2YnwJA15iAWXtoBQzsrzf4=;
        b=OeBUsh/t2N437x+vBHUiAACBpSDjoe+3uFPU5TlHZsbO9vkYWXhPpoE1Bh6ladX3h6
         1Eh5hSNvNs7CjRvSZPD2aau7/lworiry36AmqJkYB1IgviDHLLwr8Y8KykFJC7QBimA1
         OhNGutaka4+sh1fWnBHYfos8Z5ZMkcWwiOqeJtFwSo3aGjUrxyodEsmr3Z5XczPcMJ3S
         vgloYu3bbru0bzI8o36Nrhc4ptvBzZSnguwtuOwYv6FM777sx5H0mQ5CB6LfLLZAEH7N
         /0ZoDCL9VZfLoTTvkc9neiar/4UiChDGjtnm+uNvgGUeorScmS9tz14nwMhLxuc1D3bH
         +DSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY2vidGlFDOKDFaDNc6urQ7fDlDdkXFBZteXMvn16iPA36l8lDscj2LGPcZVagU1ZI9h9Tf84v8Vum3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7R4bAP989XCfuydU/gTJJR6Cg7Qvk1B/iv83VtRvb17fUT8VR
	HtDK0Varl8rEqNkLjF6wcQ0lAuleh86AfYul7wBPf9HYcS+rb8trvb1qwUtgsAuGk4n57kmp+pi
	2cpOWap9uMRv2oCQCBdF5/GwknM2ZLtjflNtdTQpBtLdpIWi3hO7Fxto=
X-Google-Smtp-Source: AGHT+IHmHfUuR/BiTP5jRpcYaVKXUZbY62Rqb4KGVUm3T0/7rpOiKrlRD0FFRirPI8NXEhNGxCbIPp05yU3ji1AuoN1qxV1m0Gbu
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:168b:b0:3d4:3db1:77ae with SMTP id
 e9e14a558f8ab-3d4419f4f33mr199534665ab.18.1741613538796; Mon, 10 Mar 2025
 06:32:18 -0700 (PDT)
Date: Mon, 10 Mar 2025 06:32:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67cee9e2.050a0220.1939a6.0004.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in vidtv_mux_init
From: syzbot <syzbot+0d33ab192bd50b6c91e6@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848e07631744 Merge tag 'hid-for-linus-2025030501' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12e38a64580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bed8205d3b84ef81
dashboard link: https://syzkaller.appspot.com/bug?extid=0d33ab192bd50b6c91e6
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=138afda8580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6a6c7015dd03/disk-848e0763.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/66cbd3af2068/vmlinux-848e0763.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1c1ceeb2230c/bzImage-848e0763.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0d33ab192bd50b6c91e6@syzkaller.appspotmail.com

RBP: 00007fff4b19a7ec R08: 0000000b4b19a87f R09: 00000000000927c0
R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000003
R13: 00000000000927c0 R14: 000000000001d553 R15: 00007fff4b19a840
 </TASK>
==================================================================
BUG: KASAN: slab-use-after-free in vidtv_mux_pid_ctx_init drivers/media/test-drivers/vidtv/vidtv_mux.c:78 [inline]
BUG: KASAN: slab-use-after-free in vidtv_mux_init+0xac2/0xbe0 drivers/media/test-drivers/vidtv/vidtv_mux.c:524
Read of size 8 at addr ffff88802fa42acc by task syz.2.37/6059

CPU: 0 UID: 0 PID: 6059 Comm: syz.2.37 Not tainted 6.14.0-rc5-syzkaller-00039-g848e07631744 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xc3/0x670 mm/kasan/report.c:521
 kasan_report+0xd9/0x110 mm/kasan/report.c:634
 vidtv_mux_pid_ctx_init drivers/media/test-drivers/vidtv/vidtv_mux.c:78 [inline]
 vidtv_mux_init+0xac2/0xbe0 drivers/media/test-drivers/vidtv/vidtv_mux.c:524
 vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
 vidtv_start_feed+0x334/0x4c0 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
 dmx_section_feed_start_filtering+0x3a5/0x660 drivers/media/dvb-core/dvb_demux.c:973
 dvb_dmxdev_feed_start drivers/media/dvb-core/dmxdev.c:508 [inline]
 dvb_dmxdev_feed_restart.isra.0+0x457/0x530 drivers/media/dvb-core/dmxdev.c:537
 dvb_dmxdev_filter_stop+0x2b4/0x3a0 drivers/media/dvb-core/dmxdev.c:564
 dvb_dmxdev_filter_free drivers/media/dvb-core/dmxdev.c:840 [inline]
 dvb_demux_release+0x92/0x550 drivers/media/dvb-core/dmxdev.c:1246
 __fput+0x3ff/0xb70 fs/file_table.c:464
 task_work_run+0x14e/0x250 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xad8/0x2d70 kernel/exit.c:938
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1087
 __do_sys_exit_group kernel/exit.c:1098 [inline]
 __se_sys_exit_group kernel/exit.c:1096 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1096
 x64_sys_call+0x151f/0x1720 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f871d58d169
Code: Unable to access opcode bytes at 0x7f871d58d13f.
RSP: 002b:00007fff4b19a788 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f871d58d169
RDX: 0000000000000064 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 00007fff4b19a7ec R08: 0000000b4b19a87f R09: 00000000000927c0
R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000003
R13: 00000000000927c0 R14: 000000000001d553 R15: 00007fff4b19a840
 </TASK>

Allocated by task 6059:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 vidtv_psi_pat_table_init+0x46/0x2c0 drivers/media/test-drivers/vidtv/vidtv_psi.c:970
 vidtv_channel_si_init+0x67/0x1a90 drivers/media/test-drivers/vidtv/vidtv_channel.c:423
 vidtv_mux_init+0x526/0xbe0 drivers/media/test-drivers/vidtv/vidtv_mux.c:519
 vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
 vidtv_start_feed+0x334/0x4c0 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
 dmx_section_feed_start_filtering+0x3a5/0x660 drivers/media/dvb-core/dvb_demux.c:973
 dvb_dmxdev_feed_start drivers/media/dvb-core/dmxdev.c:508 [inline]
 dvb_dmxdev_feed_restart.isra.0+0x457/0x530 drivers/media/dvb-core/dmxdev.c:537
 dvb_dmxdev_filter_stop+0x2b4/0x3a0 drivers/media/dvb-core/dmxdev.c:564
 dvb_dmxdev_filter_free drivers/media/dvb-core/dmxdev.c:840 [inline]
 dvb_demux_release+0x92/0x550 drivers/media/dvb-core/dmxdev.c:1246
 __fput+0x3ff/0xb70 fs/file_table.c:464
 task_work_run+0x14e/0x250 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xad8/0x2d70 kernel/exit.c:938
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1087
 __do_sys_exit_group kernel/exit.c:1098 [inline]
 __se_sys_exit_group kernel/exit.c:1096 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1096
 x64_sys_call+0x151f/0x1720 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6059:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x2c4/0x4d0 mm/slub.c:4757
 vidtv_channel_si_init+0x34a/0x1a90 drivers/media/test-drivers/vidtv/vidtv_channel.c:499
 vidtv_mux_init+0x526/0xbe0 drivers/media/test-drivers/vidtv/vidtv_mux.c:519
 vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
 vidtv_start_feed+0x334/0x4c0 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
 dmx_section_feed_start_filtering+0x3a5/0x660 drivers/media/dvb-core/dvb_demux.c:973
 dvb_dmxdev_feed_start drivers/media/dvb-core/dmxdev.c:508 [inline]
 dvb_dmxdev_feed_restart.isra.0+0x457/0x530 drivers/media/dvb-core/dmxdev.c:537
 dvb_dmxdev_filter_stop+0x2b4/0x3a0 drivers/media/dvb-core/dmxdev.c:564
 dvb_dmxdev_filter_free drivers/media/dvb-core/dmxdev.c:840 [inline]
 dvb_demux_release+0x92/0x550 drivers/media/dvb-core/dmxdev.c:1246
 __fput+0x3ff/0xb70 fs/file_table.c:464
 task_work_run+0x14e/0x250 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xad8/0x2d70 kernel/exit.c:938
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1087
 __do_sys_exit_group kernel/exit.c:1098 [inline]
 __se_sys_exit_group kernel/exit.c:1096 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1096
 x64_sys_call+0x151f/0x1720 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802fa42ac0
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 12 bytes inside of
 freed 32-byte region [ffff88802fa42ac0, ffff88802fa42ae0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2fa42
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801b041780 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000400040 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 5963, tgid 5963 (syz-executor), ts 120407289997, free_ts 120403969520
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0xfce/0x2f80 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x221/0x2470 mm/page_alloc.c:4739
 alloc_pages_mpol+0x1fc/0x540 mm/mempolicy.c:2270
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab mm/slub.c:2587 [inline]
 new_slab+0x23d/0x330 mm/slub.c:2640
 ___slab_alloc+0xc5d/0x1720 mm/slub.c:3826
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3916
 __slab_alloc_node mm/slub.c:3991 [inline]
 slab_alloc_node mm/slub.c:4152 [inline]
 __kmalloc_cache_noprof+0xfa/0x410 mm/slub.c:4320
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 ref_tracker_alloc+0x17c/0x5b0 lib/ref_tracker.c:203
 __netdev_tracker_alloc include/linux/netdevice.h:4282 [inline]
 netdev_tracker_alloc include/linux/netdevice.h:4294 [inline]
 netdev_get_by_index+0x7c/0xb0 net/core/dev.c:990
 fib6_nh_init+0x792/0x1da0 net/ipv6/route.c:3548
 ip6_route_info_create+0x1073/0x1910 net/ipv6/route.c:3814
 ip6_route_add+0x26/0x1c0 net/ipv6/route.c:3858
 addrconf_add_mroute+0x1de/0x350 net/ipv6/addrconf.c:2549
 addrconf_add_dev+0x14e/0x1c0 net/ipv6/addrconf.c:2567
 addrconf_dev_config net/ipv6/addrconf.c:3475 [inline]
 addrconf_init_auto_addrs+0x380/0x820 net/ipv6/addrconf.c:3563
page last free pid 6059 tgid 6059 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_frozen_pages+0x6db/0xfb0 mm/page_alloc.c:2660
 tlb_batch_list_free mm/mmu_gather.c:159 [inline]
 tlb_finish_mmu+0x237/0x7b0 mm/mmu_gather.c:491
 exit_mmap+0x40e/0xba0 mm/mmap.c:1297
 __mmput+0x12a/0x410 kernel/fork.c:1356
 mmput+0x62/0x70 kernel/fork.c:1378
 exit_mm kernel/exit.c:570 [inline]
 do_exit+0x9ba/0x2d70 kernel/exit.c:925
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1087
 __do_sys_exit_group kernel/exit.c:1098 [inline]
 __se_sys_exit_group kernel/exit.c:1096 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1096
 x64_sys_call+0x151f/0x1720 arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88802fa42980: 00 00 00 05 fc fc fc fc 00 00 05 fc fc fc fc fc
 ffff88802fa42a00: 00 00 02 fc fc fc fc fc 00 00 00 00 fc fc fc fc
>ffff88802fa42a80: 00 00 00 04 fc fc fc fc fa fb fb fb fc fc fc fc
                                              ^
 ffff88802fa42b00: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
 ffff88802fa42b80: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
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

