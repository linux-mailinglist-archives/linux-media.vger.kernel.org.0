Return-Path: <linux-media+bounces-67138-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wqCZLi+BT2pPiQIAu9opvQ
	(envelope-from <linux-media+bounces-67138-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 13:08:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B59A7300D8
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 13:08:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=appspotmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67138-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67138-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4D0332A18E9
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 10:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B354071C5;
	Thu,  9 Jul 2026 10:42:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC8F3C062C
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 10:42:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593745; cv=none; b=c6FLOwcpElPBKBu2qhjbtQ2dErlozCxPz4QgEv8TfHhurzdNbHypsTTyKG0yyzkSOw5ZSg+IFiHtPfkfz13D5nyTyIKc9BG3iIMUwZISWOyGvkOYruc9qmmiUoYdsrWA/4Q81Z3hUn5dS9/VNwDXxb+kgjI+QUpDodS0Uk1CpoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593745; c=relaxed/simple;
	bh=89sAFliolfnrsarvWKKrKRSkf4J2etx2MxzQZfNrCWo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ca4iv7AjJ3TiaSJj6odx2k9MIcJ+pZRZv23+5Yim68WgzUP4/ifcXVGM29Ef6xwPNcFqIVpH2Qkf1UUXUFz3UlLQv8aydV3LEiTdm8KhB43xrSt9Wg2GAHjw0caquSpPXRrf9ZKThZ3eWFZdzK+5RYFh3v/Sf0lKxR3yLaUCWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-6a344ad4390so1279396eaf.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 03:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593742; x=1784198542;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=103RlNDsVc9CqcukuQpvaht+DtG25Ju2mmeEoB+078U=;
        b=GUQSiAjs68rpR9wW/gogcBq8wnrGjgx3t/SFbe2M7joQPWnrb00kzhAza9oV+jO0D5
         T1NKzItBSOz3iKM7atekKbvbjAGcXJFxRtaa5yzJ44yws85UcU5v6ZheR3C/W7Cp1xFj
         /fy1BdRlYQ9TdOFmyFcRFN+UXwzXmtXQO6lxwCdMpqXEhpneKtsXm4mRXgyqtiHLO5Nu
         1A39OzRUDre6S9mM4wCHjlIkilbsLELXbDAFmXLuIMC5lv4Qnx11/wKIwYluKMjG2D96
         pw+KAZql9Sew6phOAcNVQijiX6TkAW2M9ygG9NF+ys62jwFqS2lFJjnA3eNVj3mKSqNL
         wrNA==
X-Forwarded-Encrypted: i=1; AFNElJ+uYvK0xjEhVIRo6EJn1vsDYFCTKcPkUGIqDa2vKUXFPXYeL8IJBCcdSXmFAlf3r2ox/O2riODhNyRqLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8MpcXlQPNHgpG/CidFDUTXkbqoPncqcwgbFNeh7c8D3MnNnBf
	jfvqZEMCdsQa0QGNTa1a9Af1oqTe9skY8xRTEdNuiNQlrCyB9GtAuddzuJzk4chUcsT0h4eSgnG
	e03mUaidIsG4CS/t/v8fUJrwbXutZbUxKglAZCCeN/w0i8sa814HXjJCIdx0=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:340d:20b0:6a3:76ad:8ec2 with SMTP id
 006d021491bc7-6a376ad8f4emr2198125eaf.3.1783593742433; Thu, 09 Jul 2026
 03:42:22 -0700 (PDT)
Date: Thu, 09 Jul 2026 03:42:22 -0700
In-Reply-To: <68d145d8.050a0220.13cd81.05b4.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a4f7b0e.c76b52dc.34afef.002c.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Write in dvb_device_put
From: syzbot <syzbot+d445a71e1c011b592c16@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, sameekshasankpal@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=48ef5c5c0f192153];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67138-lists,linux-media=lfdr.de,d445a71e1c011b592c16];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email,storage.googleapis.com:url,vger.kernel.org:from_smtp,syzkaller.appspot.com:url,syzkaller.appspotmail.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sameekshasankpal@gmail.com,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,gmail.com,googlegroups.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B59A7300D8

syzbot has found a reproducer for the following issue on:

HEAD commit:    0e35b9b6ec0f Merge tag 'mm-hotfixes-stable-2026-07-06-17-4..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16527b1e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=48ef5c5c0f192153
dashboard link: https://syzkaller.appspot.com/bug?extid=d445a71e1c011b592c16
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=131d3739580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-0e35b9b6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c14bac7bee17/vmlinux-0e35b9b6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/36bfa5293255/bzImage-0e35b9b6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d445a71e1c011b592c16@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
BUG: KASAN: slab-use-after-free in kref_put include/linux/kref.h:64 [inline]
BUG: KASAN: slab-use-after-free in dvb_device_put.part.0+0x22/0x90 drivers/media/dvb-core/dvbdev.c:629
Write of size 4 at addr ffff88802e87b210 by task syz.0.1597/11270

CPU: 0 UID: 0 PID: 11270 Comm: syz.0.1597 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:186 [inline]
 kasan_check_range+0x10f/0x1e0 mm/kasan/generic.c:200
 instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
 atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
 __refcount_sub_and_test include/linux/refcount.h:389 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 kref_put include/linux/kref.h:64 [inline]
 dvb_device_put.part.0+0x22/0x90 drivers/media/dvb-core/dvbdev.c:629
 dvb_device_put drivers/media/dvb-core/dvbdev.c:628 [inline]
 dvb_device_open+0x2ba/0x3b0 drivers/media/dvb-core/dvbdev.c:113
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6ab/0x14d0 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2873/0x4280 fs/namei.c:4863
 do_file_open+0x20e/0x430 fs/namei.c:4892
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f40c6b5e68e
Code: 08 0f 85 a5 a8 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
RSP: 002b:00007f40c61dcb28 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f40c61dd6c0 RCX: 00007f40c6b5e68e
RDX: 0000000000000002 RSI: 00007f40c61dcc00 RDI: ffffffffffffff9c
RBP: 00007f40c61dcc00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: cccccccccccccccd
R13: 00007f40c6e26128 R14: 00007f40c6e26090 R15: 00007ffd8a94f4f8
 </TASK>

Allocated by task 1:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2e5/0x6c0 mm/slub.c:5515
 _kmalloc_noprof include/linux/slab.h:969 [inline]
 _kzalloc_noprof include/linux/slab.h:1290 [inline]
 dvb_register_device+0x1d6/0x1e20 drivers/media/dvb-core/dvbdev.c:472
 dvb_register_frontend+0x552/0x820 drivers/media/dvb-core/dvb_frontend.c:3051
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:438 [inline]
 vidtv_bridge_probe+0x44b/0xa30 drivers/media/test-drivers/vidtv/vidtv_bridge.c:510
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __driver_attach+0x21f/0x5b0 drivers/base/dd.c:1292
 bus_for_each_dev+0x13e/0x1d0 drivers/base/bus.c:383
 bus_add_driver+0x305/0x5b0 drivers/base/bus.c:763
 driver_register+0x1e2/0x360 drivers/base/driver.c:174
 vidtv_bridge_init+0x52/0x80 drivers/media/test-drivers/vidtv/vidtv_bridge.c:602
 do_one_initcall+0x11d/0x700 init/main.c:1347
 do_initcall_level init/main.c:1409 [inline]
 do_initcalls init/main.c:1425 [inline]
 do_basic_setup init/main.c:1445 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1658
 kernel_init+0x1f/0x1e0 init/main.c:1548
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 11273:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2705 [inline]
 slab_free mm/slub.c:6405 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6720
 dvb_free_device drivers/media/dvb-core/dvbdev.c:616 [inline]
 kref_put include/linux/kref.h:65 [inline]
 dvb_device_put.part.0+0x57/0x90 drivers/media/dvb-core/dvbdev.c:629
 dvb_device_put drivers/media/dvb-core/dvbdev.c:628 [inline]
 dvb_device_open+0x2ba/0x3b0 drivers/media/dvb-core/dvbdev.c:113
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6ab/0x14d0 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2873/0x4280 fs/namei.c:4863
 do_file_open+0x20e/0x430 fs/namei.c:4892
 do_sys_openat2+0x10f/0x1e0 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802e87b200
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 16 bytes inside of
 freed 256-byte region [ffff88802e87b200, ffff88802e87b300)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88802e87aa00 pfn:0x2e87a
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000240(workingset|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000240 ffff88801bc42b40 ffffea0000e95890 ffffea0000f47190
raw: ffff88802e87aa00 000000080010000e 00000000f5000000 0000000000000000
head: 00fff00000000240 ffff88801bc42b40 ffffea0000e95890 ffffea0000f47190
head: ffff88802e87aa00 000000080010000e 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffffffffffff81 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 37, tgid 37 (kdevtmpfs), ts 20172119905, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf48/0x3530 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3294 [inline]
 allocate_slab mm/slub.c:3408 [inline]
 new_slab+0xa2/0x650 mm/slub.c:3454
 refill_objects+0xe3/0x410 mm/slub.c:7338
 refill_sheaf mm/slub.c:2832 [inline]
 __pcs_replace_empty_main+0x376/0x680 mm/slub.c:4703
 alloc_from_pcs mm/slub.c:4801 [inline]
 slab_alloc_node mm/slub.c:4933 [inline]
 __do_kmalloc_node mm/slub.c:5361 [inline]
 __kmalloc_noprof+0x66d/0x820 mm/slub.c:5387
 _kmalloc_noprof include/linux/slab.h:973 [inline]
 _kmalloc_array_noprof include/linux/slab.h:1189 [inline]
 security_inode_init_security+0x113/0x370 security/security.c:1347
 shmem_mknod+0x2ce/0x480 mm/shmem.c:3804
 vfs_mknod+0x3a5/0x7f0 fs/namei.c:5135
 handle_create drivers/base/devtmpfs.c:232 [inline]
 handle drivers/base/devtmpfs.c:384 [inline]
 devtmpfs_work_loop+0x48d/0xae4 drivers/base/devtmpfs.c:399
 devtmpfsd+0x3f/0x50 drivers/base/devtmpfs.c:441
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802e87b100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802e87b180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88802e87b200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff88802e87b280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802e87b300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

