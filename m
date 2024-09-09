Return-Path: <linux-media+bounces-18037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 796CD9723EC
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 22:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 394A62840AD
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 20:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F038418B469;
	Mon,  9 Sep 2024 20:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="IVF7ozqT"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7328189916
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725914790; cv=none; b=BIOFaKf9nHoVrwKhcmNzD9FbkXbpxY9rr1M4laB74jxkeeCqVCnd4f+2u6cu1BRWPnFJPYyzvJ6WuDN6QI4SaBUSsdoEIwvFZ/zQ2b4+dD436zrw8D4nkKTs8KbpWhkmbtv45D2IQVQCenz5qay/+8K6JDSstBx5Fqs3u0sn4gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725914790; c=relaxed/simple;
	bh=x8Vt+Fc966x2sFxjsehNaKnI6GC7V/cMqA0XuIhrYts=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HDvHOdnlL+RmhabYg8UHvHGEB/qOOoh2lJxmWSSXmLFZBxiJjSj7jetnu+cHaN+EB2+DrqySmJIKLkoAOLkBNTqP9LGr2sGRPKx6gaMx+LyuEipWNWfjNC/aubEEAiOUCM834PbWls/sxfvy/i0cgbEZ/Z4QLWoBMzv8YhZIbXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=IVF7ozqT; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hUMjRnKcrTLnebHMIfSdNNYnDwsB5VMV4e0FJ/HK55s=; b=IVF7ozqTA9EiDWM21Pqz+zrlTi
	6uhl3PZrvOKfZczJsGk2PPxUqeS49CXTrZA/4tsY0ZjpPL2B4MFuZe/kuL0jskPSIdHsMRSIhShJF
	Iz+R/bgx/UQUyX75WYFA+cRsQGPH9y++/v7/xAq5jt4HFLt2/7bzcy3xbdLEbhXFdoWk/tOhzs1of
	POjFkA9wAuKAtP7biS3nFZ9WssvSFSnZOAPZzNhq/UvmJBDmoWl7mBOCKCTe+qTQp8HT5fPGuxzTO
	81txyNjcQaTxnarah1pNSnUpiR8eRns54DEL4kUd8x0TAkZ6CYgdhTgXpbjblCkLnnQ1KOb+EsbwD
	X7BR28dw==;
Received: from 179-125-79-204-dinamico.pombonet.net.br ([179.125.79.204] helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1snlHF-00BkAA-7I; Mon, 09 Sep 2024 22:46:25 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: [PATCH 2/2] media: uvcvideo: require entities to have a non-zero ID
Date: Mon,  9 Sep 2024 17:46:05 -0300
Message-Id: <20240909204605.1870265-3-cascardo@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909204605.1870265-1-cascardo@igalia.com>
References: <20240909204605.1870265-1-cascardo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per UVC 1.5 specification, units and terminals must have a non-zero ID.

So, deny allocating an entity with a 0 ID.

This also prevents some syzkaller reproducers from triggering warnings due
to a backward chain which is considered finished as the source ID is 0.
Later on, that entity is found, but its pads are not valid.

[   26.840968] usb 1-1: new high-speed USB device number 2 using dummy_hcd
[   27.051040] usb 1-1: Using ep0 maxpacket: 8
[   27.071823] usb 1-1: config 0 has an invalid descriptor of length 0, skipping remainder of the config
[   27.151406] usb 1-1: config 0 descriptor??
[   27.656382] usb 1-1: Found UVC 0.00 device <unnamed> (0bd3:0d55)
[   27.663246] pubrepro2 (533) used greatest stack depth: 10776 bytes left
[   27.720063] uvcvideo 1-1:0.0: Entity type for entity Output 255 was not initialized!
[   27.741991] ------------[ cut here ]------------
[   27.744566] WARNING: CPU: 0 PID: 9 at drivers/media/mc/mc-entity.c:1144 media_create_pad_link+0x2bc/0x2e0
[   27.749558] Modules linked in:
[   27.751791] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.11.0-rc7-00030-g3480e43aeccf #444
[   27.756432] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
[   27.760678] Workqueue: usb_hub_wq hub_event
[   27.762941] RIP: 0010:media_create_pad_link+0x2bc/0x2e0
[   27.765711] Code: c0 eb 10 4c 89 f7 4c 89 fe e8 20 01 00 00 b8 f4 ff ff ff 48 83 c4 30 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc 0f 0b eb e9 <0f> 0b eb 0a 0f 0b eb 06 0f 0b eb 02 0f 0b b8 ea ff ff ff eb d4 66
[   27.775169] RSP: 0018:ffffc9000004b318 EFLAGS: 00010246
[   27.779654] RAX: ffff888004e5d458 RBX: 0000000000000000 RCX: ffffffff818fccad
[   27.784120] RDX: 0000000000000a4e RSI: 0000000000000000 RDI: ffff888004b940b8
[   27.789098] RBP: 0000000000000000 R08: 0001ffffffffffff R09: 0000000000000000
[   27.793848] R10: 0000000000000014 R11: 0001888004b940b8 R12: 0000000000000003
[   27.797876] R13: ffff888004f27080 R14: ffff888004b94080 R15: 0000000000000000
[   27.804270] FS:  0000000000000000(0000) GS:ffff88803ec00000(0000) knlGS:0000000000000000
[   27.808541] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.812003] CR2: 0000578d13848018 CR3: 0000000004b40000 CR4: 0000000000750ef0
[   27.816142] PKRU: 55555554
[   27.817778] Call Trace:
[   27.819195]  <TASK>
[   27.820492]  ? __warn+0xc4/0x210
[   27.823079]  ? media_create_pad_link+0x2bc/0x2e0
[   27.826014]  ? report_bug+0x11b/0x1a0
[   27.827976]  ? handle_bug+0x3d/0x70
[   27.830074]  ? exc_invalid_op+0x1a/0x50
[   27.832903]  ? asm_exc_invalid_op+0x1a/0x20
[   27.836194]  ? media_create_pad_link+0x4d/0x2e0
[   27.840070]  ? media_create_pad_link+0x2bc/0x2e0
[   27.842879]  ? media_create_pad_link+0x4d/0x2e0
[   27.847327]  ? _raw_spin_unlock+0x1e/0x40
[   27.849827]  ? __v4l2_device_register_subdev+0x202/0x210
[   27.852753]  uvc_mc_register_entities+0x358/0x400
[   27.855335]  uvc_register_chains+0x1fd/0x290
[   27.857622]  uvc_probe+0x380e/0x3dc0
[   27.859547]  ? __lock_acquire+0x5aa/0x26e0
[   27.861876]  ? find_held_lock+0x33/0xa0
[   27.864068]  ? kernfs_activate+0x70/0x80
[   27.866231]  ? usb_match_dynamic_id+0x1b/0x70
[   27.869323]  ? find_held_lock+0x33/0xa0
[   27.871595]  ? usb_match_dynamic_id+0x55/0x70
[   27.874363]  ? lock_release+0x124/0x260
[   27.877941]  ? usb_match_one_id_intf+0xa2/0x100
[   27.881568]  usb_probe_interface+0x1ba/0x330
[   27.884095]  really_probe+0x1ba/0x4c0
[   27.887244]  __driver_probe_device+0xb2/0x180
[   27.891340]  driver_probe_device+0x5a/0x100
[   27.895146]  __device_attach_driver+0xe9/0x160
[   27.899163]  ? __pfx___device_attach_driver+0x10/0x10
[   27.902074]  bus_for_each_drv+0xa9/0x100
[   27.904215]  __device_attach+0xed/0x190
[   27.906374]  device_initial_probe+0xe/0x20
[   27.908604]  bus_probe_device+0x4d/0xd0
[   27.910876]  device_add+0x308/0x590
[   27.912874]  usb_set_configuration+0x7b6/0xaf0
[   27.915194]  usb_generic_driver_probe+0x36/0x80
[   27.917720]  usb_probe_device+0x7b/0x130
[   27.919813]  really_probe+0x1ba/0x4c0
[   27.921836]  __driver_probe_device+0xb2/0x180
[   27.924258]  driver_probe_device+0x5a/0x100
[   27.926471]  __device_attach_driver+0xe9/0x160
[   27.928865]  ? __pfx___device_attach_driver+0x10/0x10
[   27.931675]  bus_for_each_drv+0xa9/0x100
[   27.933829]  __device_attach+0xed/0x190
[   27.935994]  device_initial_probe+0xe/0x20
[   27.938287]  bus_probe_device+0x4d/0xd0
[   27.940356]  device_add+0x308/0x590
[   27.942538]  usb_new_device+0x347/0x610
[   27.944599]  hub_event+0x156b/0x1e30
[   27.946522]  ? process_scheduled_works+0x48b/0xaf0
[   27.949049]  process_scheduled_works+0x5a3/0xaf0
[   27.951579]  worker_thread+0x3cf/0x560
[   27.953644]  ? kthread+0x109/0x1b0
[   27.955506]  kthread+0x197/0x1b0
[   27.957290]  ? __pfx_worker_thread+0x10/0x10
[   27.959574]  ? __pfx_kthread+0x10/0x10
[   27.961654]  ret_from_fork+0x32/0x40
[   27.963630]  ? __pfx_kthread+0x10/0x10
[   27.965636]  ret_from_fork_asm+0x1a/0x30
[   27.967739]  </TASK>

Reported-by: syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0584f746fde3d52b4675
Reported-by: syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=dd320d114deb3f5bb79b
Fixes: a3fbc2e6bb05 ("media: mc-entity.c: use WARN_ON, validate link pads")
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index a6973b0ba676..be3e77308ecb 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -783,6 +783,10 @@ static struct uvc_entity *uvc_alloc_entity(struct uvc_device *dev, u16 type,
 	unsigned int size;
 	unsigned int i;
 
+	/* Per UVC 1.5 spec, the ID should be non-zero */
+	if (id == 0)
+		return NULL;
+
 	/* Per UVC 1.5 spec, the ID is unique */
 	if (uvc_entity_by_id(dev, id))
 		return NULL;
-- 
2.34.1


