Return-Path: <linux-media+bounces-25317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8AA1DB50
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 18:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC79C1886E15
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2025 17:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F331B189912;
	Mon, 27 Jan 2025 17:31:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64641291E;
	Mon, 27 Jan 2025 17:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737999094; cv=none; b=pbsxeSFJ3sjTyzpr9+UpMQMHmts6co5IVNbuoq2fQwDFEFYS6nmEQJGAZK+ckfvc4DMsSioC8XwwjkwNekaXjZhuSeTOzAozYN4i1OvJnb1g9i68crzFlD57xK6mskZZRRzazZhs1XoJzW7vPXt8OjcOgOc9q/1QZ+TEHx5AS38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737999094; c=relaxed/simple;
	bh=8Zk7gr+iCaPZlO5/zuPieuUboL75dgmGIA0TgZfyAb0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ErRy54A8LGKb/wOt7O87aA2Q9QuEdORn+mlKRWsVqJxr1Bb9keOvhprWOs5pd5SaWdr7D56qJ5eNi6fRdjr3vEPmeFSvtrExtxG9Djun5nYi9f9oxBem2dlzezTFtu9ypEdJDKNYWe/spwrJBwIMoLuwlO3psK2wGbKzc4sLZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 27 Jan
 2025 20:31:21 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 27 Jan
 2025 20:31:21 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<linux-media@vger.kernel.org>,
	<syzbot+6b52c2b24e341804a58c@syzkaller.appspotmail.com>,
	<syzkaller-bugs@googlegroups.com>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] media: usb: hackrf: fix device unregister order in hackrf_probe()
Date: Mon, 27 Jan 2025 09:31:12 -0800
Message-ID: <20250127173112.446048-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Syzkaller reports [1] a slab-use-after-free error identified by KASAN
sanitizer and most likely caused by the wrong order of device
unregister steps once a call to video_register_device() fails.

Fix aforementioned flaw by first freeing control and reference handlers and
only then dealing with dev->v4l2_dev() via v4l2_device_unregister().

[1] Syzkaller (partial) report:
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
...

Allocated by task 6058:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:878 [inline]
 kzalloc_noprof include/linux/slab.h:1014 [inline]
 hackrf_probe+0xd1/0x1cf0 drivers/media/usb/hackrf/hackrf.c:1353
 usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
...

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
...

Reported-and-tested-by: syzbot+6b52c2b24e341804a58c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6b52c2b24e341804a58c
Fixes: 8bc4a9ed8504 ("[media] hackrf: add support for transmitter")
Cc: stable@vger.kernel.org
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
P.S. since my setup failed to reliably test both the repro and the
patch locally, I had to rely exclusively on syzbot capabilities. At
the moment this patch is being sent, syzkaller seems to be acting
out though...

 drivers/media/usb/hackrf/hackrf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index 0b50de8775a3..bc910b35f605 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -1513,12 +1513,12 @@ static int hackrf_probe(struct usb_interface *intf,
 	return 0;
 err_video_unregister_device_rx:
 	video_unregister_device(&dev->rx_vdev);
-err_v4l2_device_unregister:
-	v4l2_device_unregister(&dev->v4l2_dev);
 err_v4l2_ctrl_handler_free_tx:
 	v4l2_ctrl_handler_free(&dev->tx_ctrl_handler);
 err_v4l2_ctrl_handler_free_rx:
 	v4l2_ctrl_handler_free(&dev->rx_ctrl_handler);
+err_v4l2_device_unregister:
+	v4l2_device_unregister(&dev->v4l2_dev);
 err_kfree:
 	kfree(dev);
 err:

