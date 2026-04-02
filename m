Return-Path: <linux-media+bounces-57928-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOtaHm4izmnElAYAu9opvQ
	(envelope-from <linux-media+bounces-57928-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 10:01:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DFF38593B
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 10:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D379F302F6A4
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 08:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0497396578;
	Thu,  2 Apr 2026 08:01:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E625E3947AD
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 08:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775116888; cv=none; b=ptYJ43SyUyTfkURdEix5SvaNORDjDlfjTcsNQ9s8IAK31nd7uSGvZZ7TTyEZ3d1w2ynFJvWSbO5xu6JckUCGEe7cxB7/D4SWhWMVydEiaN4BWyY/7F+pzXcpoqdiQ7dVCc8T2E22gakgYf3vnr06qiSSTFYWKrjKicctN9/wMv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775116888; c=relaxed/simple;
	bh=07GQZj2vd1F/4B4BRCKkwcY3yGxB+sdzvb10TWYH86M=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fEV0Xt7op1MHUfyRF2Q1ecP2XTbST6SokEz2YiNcc2jc/KX4K2DlMLqFaIqARTmxmZ3/AG7QUMJo2h0XCHPKXl0KRWPK6fc70yQIBTo4XkjmrzpMqVj4lJCZK9CmL3+yjH5eXtRHOB9SuiJ10clxHJacX71ScCnc6YRUcs0DUDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7d73fc43561so1691814a34.0
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 01:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775116886; x=1775721686;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P9XPTfBU+h9eku0oHJf627RHydXh8UWcygv9oVdJ8bA=;
        b=qyGpcnFUObkt+AyvfYMI4XYMHaaVWgtav6ucQgpzEi2+K3i6mPfLprpfs6Q3u7Kgn8
         8FE3ESrowRBHHSOHEFflKWVy02jpu3TD72bEggnJw0RRcMFr1cFvC538ifH4IqbLnrVQ
         6w2eRCtur04UzqQtNeRakSXe5fGhXssFLZttmazgo7mE/Hl5TDpvZywotuh+pAS9rAbZ
         wCn+v4kdH4XT/a98/oBAiZyy5muxkE736cUJPpvs9lnTogE7xihOfAlJp5GCfhVYJ9Rf
         9uucr+iLgPXkerkR3p4CvlUzZHeTWG5V4XVM1wznU8RnTsBSe1ybtZV2tpzNs6yvh8Jh
         4ixw==
X-Forwarded-Encrypted: i=1; AJvYcCWglQgTFw6ythU+2mNmhIOMBfvEBU11uR0LrjqvQ4RrPxU8nwj4iPxFO6DCH1kBQ3WMaLp9CmquaN7P4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YznFodLGcM+Wl9O1lBC/Xg3HkRF/DRoNFxc4bVKcbvbnfcsC1hM
	AdfKJhVPuGdR6BvKveNJQJc0diUYbsCNFZGggfB+8QhsDMuEodyVTGSMcfnU4N1igdNs5FPZ8Vc
	aiMIX8NiXopQGhzil+6z2pso45tgmRxNGgs36CsJiBzXukyZPJsGdRihGjK8=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c98:b0:677:48f4:3c66 with SMTP id
 006d021491bc7-67fabd33a3emr3504532eaf.67.1775116885823; Thu, 02 Apr 2026
 01:01:25 -0700 (PDT)
Date: Thu, 02 Apr 2026 01:01:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ce2255.050a0220.fcd29.0001.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in __vb2_queue_cancel
From: syzbot <syzbot+179796e91319a073bbd3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=6754c86e8d9e4c91];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57928-lists,linux-media=lfdr.de,179796e91319a073bbd3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[goo.gl:query timed out,googlegroups.com:query timed out];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	REDIRECTOR_URL(0.00)[goo.gl];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,storage.googleapis.com:url,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 13DFF38593B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    cbfffcca2bf0 Merge tag 'trace-v7.0-rc5' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=127db0d2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6754c86e8d9e4c91
dashboard link: https://syzkaller.appspot.com/bug?extid=179796e91319a073bbd3
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/348d2713062d/disk-cbfffcca.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/53af46be4a29/vmlinux-cbfffcca.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d24e241e2fca/bzImage-cbfffcca.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+179796e91319a073bbd3@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in __vb2_queue_cancel+0xd56/0xdb0 drivers/media/common/videobuf2/videobuf2-core.c:2255
Read of size 4 at addr ffff88803ad98f48 by task v4l_id/15134

CPU: 0 UID: 0 PID: 15134 Comm: v4l_id Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xba/0x230 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 __vb2_queue_cancel+0xd56/0xdb0 drivers/media/common/videobuf2/videobuf2-core.c:2255
 vb2_core_queue_release+0x2f/0x150 drivers/media/common/videobuf2/videobuf2-core.c:2677
 vb2_queue_release drivers/media/common/videobuf2/videobuf2-v4l2.c:956 [inline]
 _vb2_fop_release drivers/media/common/videobuf2/videobuf2-v4l2.c:1159 [inline]
 vb2_fop_release+0x16e/0x200 drivers/media/common/videobuf2/videobuf2-v4l2.c:1173
 v4l2_release+0x250/0x370 drivers/media/v4l2-core/v4l2-dev.c:471
 __fput+0x44f/0xa70 fs/file_table.c:469
 fput_close_sync+0x11f/0x240 fs/file_table.c:574
 __do_sys_close fs/open.c:1509 [inline]
 __se_sys_close fs/open.c:1494 [inline]
 __x64_sys_close+0x7e/0x110 fs/open.c:1494
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4ccaca7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffc33054410 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 00007f4ccb48a880 RCX: 00007f4ccaca7407
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 00007f4ccb48a6e8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000013
R13: 00007ffc33054640 R14: 00007f4ccb5f1000 R15: 0000563beee3a4d8
 </TASK>

Allocated by task 5826:
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

Freed by task 5826:
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

The buggy address belongs to the object at ffff88803ad98000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 3912 bytes inside of
 freed 8192-byte region [ffff88803ad98000, ffff88803ad9a000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3ad98
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88813fea6280 dead000000000122 0000000000000000
raw: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88813fea6280 dead000000000122 0000000000000000
head: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000003 ffffea0000eb6601 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 15002, tgid 15001 (syz.1.15875), ts 869736062981, free_ts 868896913803
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
 __do_kmalloc_node mm/slub.c:5259 [inline]
 __kmalloc_noprof+0x474/0x760 mm/slub.c:5272
 kmalloc_noprof include/linux/slab.h:954 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 ops_init+0x7b/0x5c0 net/core/net_namespace.c:127
 setup_net+0x118/0x340 net/core/net_namespace.c:446
 copy_net_ns+0x50e/0x730 net/core/net_namespace.c:581
 create_new_namespaces+0x3e7/0x6a0 kernel/nsproxy.c:130
 unshare_nsproxy_namespaces+0x11a/0x160 kernel/nsproxy.c:226
 ksys_unshare+0x51d/0x930 kernel/fork.c:3173
 __do_sys_unshare kernel/fork.c:3244 [inline]
 __se_sys_unshare kernel/fork.c:3242 [inline]
 __x64_sys_unshare+0x38/0x50 kernel/fork.c:3242
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 14961 tgid 14961 stack trace:
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
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 tomoyo_encode2 security/tomoyo/realpath.c:45 [inline]
 tomoyo_encode+0x28b/0x550 security/tomoyo/realpath.c:80
 tomoyo_path_perm+0x318/0x560 security/tomoyo/file.c:836
 tomoyo_path_symlink+0xab/0xf0 security/tomoyo/tomoyo.c:212
 security_path_symlink+0x16f/0x360 security/security.c:1477
 filename_symlinkat+0x134/0x410 fs/namei.c:5638
 __do_sys_symlinkat fs/namei.c:5660 [inline]
 __se_sys_symlinkat+0x4e/0x2b0 fs/namei.c:5655
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88803ad98e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803ad98e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88803ad98f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff88803ad98f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803ad99000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

