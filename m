Return-Path: <linux-media+bounces-52808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLuiD+JrkGmoZQEAu9opvQ
	(envelope-from <linux-media+bounces-52808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 13:34:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D4313BE11
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 13:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 677A53001BDC
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 12:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9192025742F;
	Sat, 14 Feb 2026 12:34:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C121C39FD4
	for <linux-media@vger.kernel.org>; Sat, 14 Feb 2026 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072479; cv=none; b=Uj421URIB7k7FAI7HUorHGOfB7jAiMlzTy0885PbzqvJRs38+TgsXCYWFiFi10qWgFE3DAzuo5YJYjCuTEDiogygijmu0edvUUTV1lBVOaCOGv7kSsU6HHQmbaTIesMoj/QhPw8yrM9Uhmkn3Up0pIO5gleSksrQxsq0XDdsZNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072479; c=relaxed/simple;
	bh=xyLrAvtanZpObwQKtbjOgEMFwDpJIcXy9mad8do9ArY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZgPc31ExKdOUefxHw5OVE7VhyrGfbTQfv6AbbiTgAjQoEvkGsJufB5dq+6nFtTzAR/sP6cmoav+YgzYJKi2l2kEnhA6qoUJAiAIVFtfash1urh/NjGoKILFuizyEsYsYFqttskO42r3aq736a3UdWCoxYKnN6aE4tqT8z83L0s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-676de68a609so8079717eaf.0
        for <linux-media@vger.kernel.org>; Sat, 14 Feb 2026 04:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072477; x=1771677277;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KkDmilLTgTo5qGKxEQwUQTHjk2IlH79R+ZBXOZXFFxY=;
        b=Mu8C0GjQgiji/iW1msr+FypVAy0RmRF8Oln8KwOBMdHE3Y3V9RiI7nmHm1AdPpAVmS
         DLNwp6U+hM0H690/Upl1W8ALZ5o08BVkuiJ4/c+v1dF84vanNKEGkm9cXPszUJiTSYMC
         BSq++fy/WfOrPAzOMJJ8Qr1tX2heOzQTbLzqkq6+2h60TTJwrAKjoxwI+h6yF7nYSRiB
         dK9LwB+yB9yEyU3RFWAY10ABdsy0N51L5wayG10iSOEhg9JnB9nU+zRMLVCtyE+mGonI
         nYi1IUpAT8Wdf93dnnZ2JsayrlQ3ti0ZQX6mqe0M9AE7pGnpMXCNVYkVWHtTdEjuUHY5
         f0eA==
X-Forwarded-Encrypted: i=1; AJvYcCUC06xmh8xonv0zZMfIKUxNaXT3LnYUIhekfGrYSkTG4mDPV5AAeLXJDJGbgVV51W/XPK/LbSct7KkjMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz84RnKCyC7oq28fxwYWH0/GQTALmXT4jEXHL7p2j0SlLD8KLbE
	knJAmOTC1alja81SDP0HgEJaIZlwPxzKRTzyC5v0AuAVr2T6FdCZflF5NkLnRKt7NPT5jZsjxk1
	GgymTyVX6IaTSSRl1Zyj8oUpMpOYRDkqEZxNU2oYQ+0u62otAmv5lbSgMal8=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81c2:b0:662:faec:7d54 with SMTP id
 006d021491bc7-67767484474mr2163465eaf.25.1771072476722; Sat, 14 Feb 2026
 04:34:36 -0800 (PST)
Date: Sat, 14 Feb 2026 04:34:36 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69906bdc.a70a0220.3c8f9c.0095.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in
 dvb_frontend_release (3)
From: syzbot <syzbot+ae466a728017ec940b41@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=6d9e410399043c26];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-52808-lists,linux-media=lfdr.de,ae466a728017ec940b41];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,appspotmail.com:email,googlegroups.com:email,goo.gl:url,storage.googleapis.com:url]
X-Rspamd-Queue-Id: 94D4313BE11
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    cd7a5651db26 alpha: add missing address argument in call t..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1103415a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d9e410399043c26
dashboard link: https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6546859ef2b7/disk-cd7a5651.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f2e4c96e79f7/vmlinux-cd7a5651.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7e21013889c0/bzImage-cd7a5651.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ae466a728017ec940b41@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in dvb_frontend_release+0x40a/0x4d0 drivers/media/dvb-core/dvb_frontend.c:2916
Read of size 4 at addr ffff88802b33a43c by task syz.0.10208/29088

CPU: 1 UID: 0 PID: 29088 Comm: syz.0.10208 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xba/0x230 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 dvb_frontend_release+0x40a/0x4d0 drivers/media/dvb-core/dvb_frontend.c:2916
 __fput+0x44f/0xa70 fs/file_table.c:469
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x69b/0x2310 kernel/exit.c:971
 do_group_exit+0x21b/0x2d0 kernel/exit.c:1112
 get_signal+0x1284/0x1330 kernel/signal.c:3034
 arch_do_signal_or_restart+0xbc/0x830 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:64 [inline]
 exit_to_user_mode_loop+0x86/0x480 kernel/entry/common.c:98
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:325 [inline]
 do_syscall_64+0x32d/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0a9c79bc0b
Code: Unable to access opcode bytes at 0x7f0a9c79bbe1.
RSP: 002b:00007f0a9d607f00 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: fffffffffffffffc RBX: 0000000000000006 RCX: 00007f0a9c79bc0b
RDX: 00007f0a9d608fd0 RSI: 0000000080085502 RDI: 0000000000000006
RBP: 00007f0a9d608fd0 R08: 0000000000000001 R09: 00000000ffffffff
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000080085502
R13: 0000000800000000 R14: 0000000000000000 R15: 00007f0a9c85076a
 </TASK>

Allocated by task 1:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x31c/0x660 mm/slub.c:5297
 kmalloc_noprof include/linux/slab.h:962 [inline]
 kzalloc_noprof include/linux/slab.h:1204 [inline]
 dvb_register_device+0x2fd/0x2210 drivers/media/dvb-core/dvbdev.c:475
 dvb_register_frontend+0x649/0x950 drivers/media/dvb-core/dvb_frontend.c:3051
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:436 [inline]
 vidtv_bridge_probe+0x9aa/0xf80 drivers/media/test-drivers/vidtv/vidtv_bridge.c:508
 platform_probe+0xf9/0x190 drivers/base/platform.c:1446
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:661
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:803
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:833
 __driver_attach+0x3e7/0x710 drivers/base/dd.c:1227
 bus_for_each_dev+0x23b/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x345/0x670 drivers/base/bus.c:715
 driver_register+0x23a/0x320 drivers/base/driver.c:249
 vidtv_bridge_init+0x28/0x50 drivers/media/test-drivers/vidtv/vidtv_bridge.c:598
 do_one_initcall+0x250/0x840 init/main.c:1382
 do_initcall_level+0x104/0x190 init/main.c:1444
 do_initcalls+0x59/0xa0 init/main.c:1460
 kernel_init_freeable+0x2a6/0x3e0 init/main.c:1692
 kernel_init+0x1d/0x1d0 init/main.c:1582
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 29088:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2670 [inline]
 slab_free mm/slub.c:6082 [inline]
 kfree+0x1c1/0x610 mm/slub.c:6399
 dvb_free_device drivers/media/dvb-core/dvbdev.c:619 [inline]
 kref_put include/linux/kref.h:65 [inline]
 dvb_device_put drivers/media/dvb-core/dvbdev.c:632 [inline]
 dvb_generic_release+0x11d/0x1b0 drivers/media/dvb-core/dvbdev.c:169
 dvb_frontend_release+0x132/0x4d0 drivers/media/dvb-core/dvb_frontend.c:2914
 __fput+0x44f/0xa70 fs/file_table.c:469
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x69b/0x2310 kernel/exit.c:971
 do_group_exit+0x21b/0x2d0 kernel/exit.c:1112
 get_signal+0x1284/0x1330 kernel/signal.c:3034
 arch_do_signal_or_restart+0xbc/0x830 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:64 [inline]
 exit_to_user_mode_loop+0x86/0x480 kernel/entry/common.c:98
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:325 [inline]
 do_syscall_64+0x32d/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802b33a400
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 60 bytes inside of
 freed 256-byte region [ffff88802b33a400, ffff88802b33a500)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2b33a
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88813fe9db40 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88813fe9db40 dead000000000122 0000000000000000
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffea0000acce81 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 13065394638, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x231/0x280 mm/page_alloc.c:1883
 prep_new_page mm/page_alloc.c:1891 [inline]
 get_page_from_freelist+0x24dc/0x2580 mm/page_alloc.c:3956
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5244
 alloc_slab_page mm/slub.c:3238 [inline]
 allocate_slab+0x77/0x660 mm/slub.c:3411
 new_slab mm/slub.c:3469 [inline]
 refill_objects+0x331/0x3c0 mm/slub.c:7091
 refill_sheaf mm/slub.c:2787 [inline]
 __pcs_replace_empty_main+0x2b9/0x620 mm/slub.c:4536
 alloc_from_pcs mm/slub.c:4639 [inline]
 slab_alloc_node mm/slub.c:4773 [inline]
 __kmalloc_cache_noprof+0x392/0x660 mm/slub.c:5292
 kmalloc_noprof include/linux/slab.h:962 [inline]
 kzalloc_noprof include/linux/slab.h:1204 [inline]
 bus_add_driver+0x162/0x670 drivers/base/bus.c:699
 driver_register+0x23a/0x320 drivers/base/driver.c:249
 usb_register_driver+0x1e4/0x390 drivers/usb/core/driver.c:1078
 do_one_initcall+0x250/0x840 init/main.c:1382
 do_initcall_level+0x104/0x190 init/main.c:1444
 do_initcalls+0x59/0xa0 init/main.c:1460
 kernel_init_freeable+0x2a6/0x3e0 init/main.c:1692
 kernel_init+0x1d/0x1d0 init/main.c:1582
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802b33a300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802b33a380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88802b33a400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                        ^
 ffff88802b33a480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802b33a500: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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

