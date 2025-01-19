Return-Path: <linux-media+bounces-24899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDCCA16020
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 04:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D1353A699D
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 03:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8441A42AB4;
	Sun, 19 Jan 2025 03:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="xkvbqTpa"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857ED2C9D;
	Sun, 19 Jan 2025 03:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737258821; cv=none; b=tTNeJyFnqDnJKMJDrZcrouByF56NKWZhtRsXpv7UiDVN1/1BYUrNESWCwZS6fovyu/vqI2fGQfMmzYIJJhHZXa7qYEI3dFaeyISBg8b5/FLQxNs2tHC7HQYT5/tZMSOA1+/8KDoVkMHUWVDCExATmHswLs6glCBsOI2jSspd/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737258821; c=relaxed/simple;
	bh=/6r3+lP93r4R5DLqAh1SdUBku/KykWHPzxO2/S62TdU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=j/X5MLwh3x8biBRg+rQVecC3JiR5onbfjtk4rz90IO0SLV5IFRLUel1FNXEoV8w9y1+4TThHqfFZAFi4GU4quFlKhNcVN24MuBFpH16b+KWaDR/yowp8W5NseXYTvKCyBHx1jkSrwXRW/ZMpFJzYopCx8VMzm8egQtT3oI1aEtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=xkvbqTpa; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1737258511; bh=7Oi23ZwQwn/1pF4hPYinuDN3qqB+5LZQ6XbjGD6JMbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xkvbqTpaMSJ/Np+fElgtQVtwqjRpYWUDpHib2SbCu0UyZKJJbUDMefCjMrzv2D6Mj
	 i1nC1l2XNnTfj5ZGij21nfo99zfdGw4STZFVh1S4YmeJj3iWWa1TtRFL9G5n9nRv6I
	 R64nOc1a5Os0Dbyddq7LG9qFk/rYByygVIP11dlM=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id A8906E43; Sun, 19 Jan 2025 11:42:09 +0800
X-QQ-mid: xmsmtpt1737258129tx6kjhphc
Message-ID: <tencent_741B182568BA97BBA133319E461B544B2C08@qq.com>
X-QQ-XMAILINFO: M4rXzlpNAA0NiQ50A9OOeW7WnlKzuz3H2tH1RW566od5zoX0x5Lexh1c15LHqB
	 B6ZsYr00EC5dOOpbwXnsC5TpBvP08Uc4heyZZqXdSAa4rQV7XXdG0LyN73oYk5pKz0tMcEhrn9VB
	 eDIllRRO/LIT/YhgQFjDk/uqFJPcMVr0lSx3gTIQ5tgv0W3w+fy4+bKTJY8CYJyRuklZBH+2bFUo
	 lkw7G9j6EGElCJtWPBwV4M2w6jcxKX/And49DpoEPS8hYl3zhBy0pXejcJVsTlPcS2ps8odZbza5
	 ioqKnaeOVl3Iycq3HzwCFITtkq+G2q2In6K1ChgKBikBQdt5GSi0m8J6MKY07c+fD/JC0X1ZvdjY
	 7V3nfJCrFaTbRxlxhytwjlvRQB+nbFf5N+MqvHZgYe29Zqp79aXbgY0/6gla8VJLLYZFzhedQIcH
	 T4N8DA7SZa3xTLT8K3Js9JKpos5nmpmn8xKmqlm0ONL0Ov7yLoZwlE5sMM+mIC7QHiawflNCRCaP
	 ZMsDta48CZh2YAESU2J5x+Zw5n2hxtRpDz1xhSwSXSyW4ppml849ly0hh2O8zel5x939nuq6nTMC
	 +8RGfyu0cxaolxNFXwRe+A0MfrCbItEWgk7+IeY6h3bnvV0WshcK1QA2OwSzXmQXvpYtXMPnkkDR
	 miTQnyHgqAXJ+0d8A2DQJ1fqqxc5BR1vwUXn0CVRm79ujrBUbc0kriSJvEw6Df8BtSxmPfTBsoE2
	 AfAhnQsi7cJI1yfgwYYscpDb2xMwNsyaDVjjZQUkKhxDxVsKjup19YTO+SbRzQlz3rdGnnExuqRa
	 cSplUFMKzAxw0spINPRQrsrRZfReLl61dT2/T8b5h0uy3bTe4d53I5isJB8dkf2YGX5k31Ac4n/F
	 hYyHvpJmOlKuFeNER82TOlgDwBXwTImreCv/L2QUg9UJ7FltF3SDfLlCLB1ChFqA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+1eb177ecc3943b883f0a@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: dvbdev: keep dvb device ref balanced in dvb generic release and open
Date: Sun, 19 Jan 2025 11:42:09 +0800
X-OQ-MSGID: <20250119034209.935527-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <678c0605.050a0220.303755.0031.GAE@google.com>
References: <678c0605.050a0220.303755.0031.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot report a slab-use-after-free Read in dvb_device_open. [1]

The dvb device have been putted by dvb_generic_release() in dvb_frontend_open()
and have been freed in dvb_device_open() by dvb_device_put().

[1]
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

Reported-by: syzbot+1eb177ecc3943b883f0a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1eb177ecc3943b883f0a
Tested-by: syzbot+1eb177ecc3943b883f0a@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/media/dvb-core/dvb_frontend.c | 1 +
 drivers/media/dvb-core/dvbdev.c       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index a05aa271a1ba..738b63255e5c 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2873,6 +2873,7 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 
 	if (adapter->mfe_shared)
 		mutex_unlock(&adapter->mfe_lock);
+	dvb_generic_release(inode, file);
 	return ret;
 
 err3:
diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 9df7c213716a..d17f08adf443 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -148,6 +148,7 @@ int dvb_generic_open(struct inode *inode, struct file *file)
 	}
 
 	dvbdev->users--;
+	dvb_device_get(dvbdev);
 	return 0;
 }
 EXPORT_SYMBOL(dvb_generic_open);
-- 
2.47.0


