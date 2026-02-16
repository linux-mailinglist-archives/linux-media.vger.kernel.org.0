Return-Path: <linux-media+bounces-52849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OMEOr/kkmndzgEAu9opvQ
	(envelope-from <linux-media+bounces-52849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:34:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1B7141FC5
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C5FC3015739
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9182DEA80;
	Mon, 16 Feb 2026 09:34:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89932D2495
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771234477; cv=none; b=qU3Mhu4/nYk3TWEFAQU+Kx/6Goa0QQXCdNiciENFKqCFLselzi4ZtItK372V0BLK5xRmLtmMlRX3xO8B0nOVwookQIjsxfM6fmgQNLlFs4EqUw7R67sIlM5Cyl7ypCcCXctGox/FMa0AAKixRxZ1RQuk6WD3VMyT4Gs/qgq4sXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771234477; c=relaxed/simple;
	bh=is7XHcm+pFf7lcMZnIi906vDeM6F5g671ozZAInD2z4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eZzRFQ18SVS3wnueVIyQbttV4rns50FtXL/9FWEY3vrH3CXZ44RSDXlg4kwiT+JI1tMlX0mR8xvGarzt10vHiZw8NrqdiXY8rhCNnoXRIZl8ER7MEWEJ+BKq9x/1xClQ7jou/8hBQa/MHxodlFHldblYD/HBL0jeAt/fjuV43Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6798921eff7so5139755eaf.1
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 01:34:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771234474; x=1771839274;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkpyExsNCoAXucEqMytd/sJLyaryNa40v1l4nWQJnEI=;
        b=RiEFmlLW+264eq6Pzbp0HXtC2eF0aqpLusypXtCf+e0HQjhl6oq7diaReO7FoiVltt
         WznE77WH+OBYsz8KHOaZEFOcREAqVJWeYt/9qBvrbrF4g0NgyimEq7mLyzVZOMZDSCva
         siJ3mavebxhzaQe+ZlfGOY4OcI991/9dUCFdkJxxnCxyvx+alrkRTfNjDZaDa6Bl58c8
         fF7rqm6uUIvGcZYAZVnJX36rIQfFwxmmB5VDSQExvEwMnHHp4WX7W1016ge0Qcq52Peq
         wEb181UuRAOqWHklwrfE7C6zZwG4muy3rlbG0KbYmid0VwEjkleDush/u5O5+UESqb/A
         s1Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUEziMRyw0rQW0dM//V5W8dg/JgEdTrEauMuXIkWHQ/UhH8V5D+AIqoE25PYp779XQMZJsycPp7gOODuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzeiirinBUEoMCEu56Hay4Kq71PE65aYQav3J5mqiO5phhjgt9
	OIf2iff0NDFnEfwxF0Rwd00ypHVgypiXjWTzOieIPpMoDcFlkcbvgsojR5Gz2vlK1V3E9fOm7qV
	q06eGoeqw7fIU0KnvAjs+iPIjB2tHoqnvL6pcJBfFmexhvkm0CWObBnAvMX8=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:824:b0:672:7d05:8225 with SMTP id
 006d021491bc7-6785c22ac0amr3702669eaf.74.1771234474726; Mon, 16 Feb 2026
 01:34:34 -0800 (PST)
Date: Mon, 16 Feb 2026 01:34:34 -0800
In-Reply-To: <69906bdc.a70a0220.3c8f9c.0095.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6992e4aa.a70a0220.2c38d7.00e9.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in
 dvb_frontend_release (3)
From: syzbot <syzbot+ae466a728017ec940b41@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=6428d17febdfb14e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52849-lists,linux-media=lfdr.de,ae466a728017ec940b41];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,storage.googleapis.com:url,appspotmail.com:email]
X-Rspamd-Queue-Id: 4E1B7141FC5
X-Rspamd-Action: no action

syzbot has found a reproducer for the following issue on:

HEAD commit:    c22e26bd0906 Merge tag 'landlock-7.0-rc1' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16bcf6e6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6428d17febdfb14e
dashboard link: https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15ce3652580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1121515a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b33c549157ca/disk-c22e26bd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/34c7ded19553/vmlinux-c22e26bd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/66faec2158ed/bzImage-c22e26bd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ae466a728017ec940b41@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in dvb_frontend_release+0x410/0x4e0 drivers/media/dvb-core/dvb_frontend.c:2916
Read of size 4 at addr ffff88802b75b83c by task syz.0.18/5958

CPU: 1 UID: 0 PID: 5958 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xba/0x230 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 dvb_frontend_release+0x410/0x4e0 drivers/media/dvb-core/dvb_frontend.c:2916
 __fput+0x45e/0xa80 fs/file_table.c:469
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 get_signal+0x11c3/0x1310 kernel/signal.c:2807
 arch_do_signal_or_restart+0xbc/0x830 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:64 [inline]
 exit_to_user_mode_loop+0x86/0x480 kernel/entry/common.c:98
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:325 [inline]
 do_syscall_64+0x32d/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc97690bf79
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffed13b68c8 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007ffed13b69b0 RCX: 00007fc97690bf79
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00000000000195a3 R08: 0000000000000001 R09: 0000000000000000
R10: 0000001b2d420000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fc976b85fac R14: 00007fc976b85fa8 R15: 00007fc976b85fa0
 </TASK>

Allocated by task 1:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3a6/0x690 mm/slub.c:5297
 kmalloc_noprof include/linux/slab.h:962 [inline]
 kzalloc_noprof include/linux/slab.h:1204 [inline]
 dvb_register_device+0x2fd/0x2210 drivers/media/dvb-core/dvbdev.c:475
 dvb_register_frontend+0x665/0x970 drivers/media/dvb-core/dvb_frontend.c:3051
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:436 [inline]
 vidtv_bridge_probe+0x9aa/0xf80 drivers/media/test-drivers/vidtv/vidtv_bridge.c:508
 platform_probe+0xf9/0x190 drivers/base/platform.c:1446
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:661
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:803
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:833
 __driver_attach+0x349/0x640 drivers/base/dd.c:1227
 bus_for_each_dev+0x23e/0x2c0 drivers/base/bus.c:383
 bus_add_driver+0x348/0x670 drivers/base/bus.c:715
 driver_register+0x23a/0x320 drivers/base/driver.c:249
 vidtv_bridge_init+0x28/0x50 drivers/media/test-drivers/vidtv/vidtv_bridge.c:598
 do_one_initcall+0x250/0x840 init/main.c:1378
 do_initcall_level+0x104/0x190 init/main.c:1440
 do_initcalls+0x59/0xa0 init/main.c:1456
 kernel_init_freeable+0x2a6/0x3d0 init/main.c:1688
 kernel_init+0x1d/0x1d0 init/main.c:1578
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5958:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2670 [inline]
 slab_free mm/slub.c:6082 [inline]
 kfree+0x1c1/0x690 mm/slub.c:6399
 dvb_free_device drivers/media/dvb-core/dvbdev.c:619 [inline]
 kref_put include/linux/kref.h:65 [inline]
 dvb_device_put drivers/media/dvb-core/dvbdev.c:632 [inline]
 dvb_generic_release+0x123/0x1c0 drivers/media/dvb-core/dvbdev.c:169
 dvb_frontend_release+0x138/0x4e0 drivers/media/dvb-core/dvb_frontend.c:2914
 __fput+0x45e/0xa80 fs/file_table.c:469
 task_work_run+0x1d9/0x270 kernel/task_work.c:233
 get_signal+0x11c3/0x1310 kernel/signal.c:2807
 arch_do_signal_or_restart+0xbc/0x830 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:64 [inline]
 exit_to_user_mode_loop+0x86/0x480 kernel/entry/common.c:98
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:325 [inline]
 do_syscall_64+0x32d/0xf80 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802b75b800
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 60 bytes inside of
 freed 512-byte region [ffff88802b75b800, ffff88802b75ba00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2b758
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813fe0dc80 dead000000000100 dead000000000122
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813fe0dc80 dead000000000100 dead000000000122
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 0080000000000002 ffffea0000add601 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 2, tgid 2 (kthreadd), ts 14639760172, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x228/0x280 mm/page_alloc.c:1884
 prep_new_page mm/page_alloc.c:1892 [inline]
 get_page_from_freelist+0x28bb/0x2950 mm/page_alloc.c:3950
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5245
 alloc_slab_page mm/slub.c:3238 [inline]
 allocate_slab+0x77/0x660 mm/slub.c:3411
 new_slab mm/slub.c:3469 [inline]
 refill_objects+0x334/0x3c0 mm/slub.c:7091
 refill_sheaf mm/slub.c:2787 [inline]
 __pcs_replace_empty_main+0x328/0x5f0 mm/slub.c:4536
 alloc_from_pcs mm/slub.c:4639 [inline]
 slab_alloc_node mm/slub.c:4773 [inline]
 __kmalloc_cache_noprof+0x44e/0x690 mm/slub.c:5292
 kmalloc_noprof include/linux/slab.h:962 [inline]
 kzalloc_noprof include/linux/slab.h:1204 [inline]
 set_kthread_struct+0xbb/0x340 kernel/kthread.c:125
 copy_process+0x128c/0x3d00 kernel/fork.c:2152
 kernel_clone+0x249/0x7f0 kernel/fork.c:2654
 kernel_thread+0x13f/0x1b0 kernel/fork.c:2715
 create_kthread kernel/kthread.c:490 [inline]
 kthreadd+0x4ec/0x6e0 kernel/kthread.c:849
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802b75b700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802b75b780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88802b75b800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                        ^
 ffff88802b75b880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802b75b900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

