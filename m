Return-Path: <linux-media+bounces-50356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE14D0E151
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 06:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9E3C30090D5
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 05:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53981221554;
	Sun, 11 Jan 2026 05:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="XqRrEOca"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B212F2147F9;
	Sun, 11 Jan 2026 05:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768109366; cv=none; b=nraAlOCn+TmYBvQSfYzmgihP/P18DkKid41lXZlDJDP8yTJot0Quh14MKbMvaE6SDNU6kIZiL0a1lgEbAc46roIPsDD9GLHJORoyirHwrjnLRH+MwFRNVM5AyI9PG/g0+rCyjl/pW58VDp/etsh1hajjAskHtcpGlYsYj0CrNWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768109366; c=relaxed/simple;
	bh=Us4ObEfgEB0ramXYIdbOidLQEzelW+Em6uNQ935uAuU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Ow5tMeJZK3TmA4tHiAE3Z2jdvBP+pYktHrd7cRgdABIXQHYUBQVElGGvLPKuErzBbe5RB8BnGBmVNQoKcpA3AVMi91LQaCr7yNIqSpCrm5wKG9t4YsVvTgT5FA0I2z8I1YFxEAiE6YZTh8CF64K0uLPBsuJssiY55O/I1HbsFcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=XqRrEOca; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768109351; bh=FIJZoRZFqGFgDLRXyZboB/L+VsC0PCugQ4Iidn54Few=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XqRrEOcaWR8dGsYdhmLUttkP7Q+UyOH92D5kMEGNlKtRyqxp6hRd/Y1hbuxbV9t7A
	 E3Gb9pcWO4wEuButzy4A53nzHppa56itZ2CJnBIDKpyt5DPLNjbugaOvdNHlBvzW32
	 T8MF/bCJjO+h5d/ls3aKy9ZpFf2SppKlKKq7q740=
Received: from lxu-ped-host.. ([114.244.57.24])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7499A036; Sun, 11 Jan 2026 13:29:09 +0800
X-QQ-mid: xmsmtpt1768109349taoyq8orx
Message-ID: <tencent_0D8C88E7C506C4D2C2064149816ECB6EDB06@qq.com>
X-QQ-XMAILINFO: NIMuNtoIESZaZPkVnoUyUkR4nSAC3lrMTK3CetMX3J7T9IgE85vKPizkmcLGcI
	 UQGaegUQE3ONwre4gT3kU2/nYl+O4NuWA/5Yu0LNpOJKdDCPq8/2WHp+hhFQ3trZAJ21ZdwAQJbg
	 YQWIEKVTCX+ydUkof4c1QLT1IpjNLK+8JXCFrLjqQZ8FqF2iYKloH4yMpJgBUUKrzcgn8tNquTUE
	 0dXV6ABZsH7R7lDmuURafpvhlv3hNDOM4KPVXFxqzxIWRIAOms235/KF2R/K1LaWm4dpuDBtPwzF
	 VavZmuJV67+ZztaXBGX1gUHm3o8Ufs2UXjl8AFnRiOygNtxIFVtXahcyGQCjQZCHQbyZuNvc49d3
	 Ix8alCa7tIlS5LTBMoMuAZKKrBDYNli78E78lRv8/DWnBKqeRiaj/EichZ15qjjTws4oZi1Mg8OO
	 IpBXeAHnA0yUq08hr3yfkJwYc5SVCdQ0Lt23QVljhR3s+GBVwWqVb+gQSsYqPbD5DvOfj4aSWDnK
	 feGx7WPIQIOrD9HpZW3EWmeJhv0/zG63QU5wdFGp5+wRpGkmi5WKRW7fz602kCaiBo2wFhHdaiyr
	 jUY95ooPW4x1EqUm2tDZN4MHzV+mJUGSclXRpCc1+o2QeF9Fb0TjvhpOksehYE/mScv8aV62MKsq
	 TAwNThnm66DlfDLhpy6MJHbJV5Kbd1UCKH9odB/SE7bpb4MJxOLKIZvWETHYiBGo3S0I9mYPlUrE
	 He+pS0n49x1npFVgsw/Msg3+tyy8D39mhWyJxUjfJTWIJBVh1ewtBOsVAUc1XD+7jEmBHreUtj+R
	 WRsuDSGP76h3eL8bJgPSVCouQ9Lw8GX4dOs+xlLT1wJxndFABJxL8PfZYweDThh37s+ZKAehnI8w
	 MXgTgTzdkT6CMoP6dN0NyRAgs9zSYDpdwzQ+y2K3s7KG6pH0NEizCxO720js21M7Vcz6o0Am6WQI
	 QllwDNCWdjklamKVX5zns49QQ/GJZrJ2ZjPrYhxSiybo0Z5a++YEi7Kcn7R4sUGaDRLuR5pu9aNB
	 eTEt0u5Q==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com
Cc: laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH 1/2] media: em28xx-video: add the unregister of video/VBI entity
Date: Sun, 11 Jan 2026 13:29:10 +0800
X-OQ-MSGID: <20260111052909.611879-3-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <69608280.050a0220.1c677c.03b0.GAE@google.com>
References: <69608280.050a0220.1c677c.03b0.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When creating a media graph, a failure occurred due to the lack of
a corresponding decoder. During the subsequent media device release
process, the video and VBI devices were not properly unregistered,
leading to a use-after-free vulnerability reported by syzbot [1].

The fix involves adding the necessary unregister operations.

[1]
BUG: KASAN: slab-use-after-free in media_device_unregister+0x141/0x430 drivers/media/mc/mc-device.c:804
Read of size 8 at addr ffff88807c114210 by task kworker/1:9/6093
Call Trace:
 media_device_unregister+0x141/0x430 drivers/media/mc/mc-device.c:804
 em28xx_unregister_media_device drivers/media/usb/em28xx/em28xx-cards.c:3511 [inline]
 em28xx_release_resources+0xac/0x240 drivers/media/usb/em28xx/em28xx-cards.c:3532
 em28xx_usb_disconnect+0x19f/0x2f0 drivers/media/usb/em28xx/em28xx-cards.c:4201
 usb_unbind_interface+0x26e/0x910 drivers/usb/core/driver.c:458
 
Allocated by task 5932:
 em28xx_v4l2_init+0x10b/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2532
 em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117
 
Freed by task 5932:
 em28xx_free_v4l2 drivers/media/usb/em28xx/em28xx-video.c:2118 [inline]
 kref_put include/linux/kref.h:65 [inline]
 em28xx_v4l2_init+0x1683/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2901
 
Reported-by: syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
Tested-by: syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 2dfa3242a7ab..45b68ebf2e9c 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -882,9 +882,12 @@ static void em28xx_v4l2_media_release(struct em28xx *dev)
 
 	for (i = 0; i < MAX_EM28XX_INPUT; i++) {
 		if (!INPUT(i)->type)
-			return;
+			break;
 		media_device_unregister_entity(&dev->input_ent[i]);
 	}
+	media_device_unregister_entity(&dev->v4l2->vdev.entity);
+	if (em28xx_vbi_supported(dev))
+		media_device_unregister_entity(&dev->v4l2->vbi_dev.entity);
 #endif
 }
 
-- 
2.43.0


