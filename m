Return-Path: <linux-media+bounces-18036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA41C9723EB
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 22:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 757B21F240A5
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 20:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CE618A959;
	Mon,  9 Sep 2024 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="L4ZFlkhd"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CED189916
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 20:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725914786; cv=none; b=jV0akmEGTyu3v4sKdMEbm+2dtJpSttcyJ6yFRAQ3D+kMNvHh/smb1WpqD0IQv7+s9ZBBSun6vcXTWPIbQK1kzCFz6Vw2YWt9lfW/XS/YVSpAk6MiyEq8ot3a7E6Bg5iMK6NKe56TKPok5llKA0ojXA4KFJfX0znaEz1dhikyWVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725914786; c=relaxed/simple;
	bh=6dUuLzCFRNG6yaG8VSr7/4GL+U/21K7oDimyDkfmReM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l4mmh8lZcZt1vuEm4bWwANmEAhWfEU9gUQ+q/ePTPlE9/JHUF8621O6zmbdIjndK80o9L3yuA6fSsByGVJBNrXycYAJBdf3Atbbjvg8Li4N1MAQLMZumAH8QN4I6IB9e2TEXh0Bah/1ay7Une4KNoc0BHpmCc2NVD+0GPABHA8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=L4ZFlkhd; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=kczQLHt0fvm8/lsL6kBetQKlkJSfTuVLwYgdCLasVV8=; b=L4ZFlkhdE4aJgQPiHbV+oG+VTL
	FeaqRwAs6rWjNnfWkbKbZVwTJBhUTEPCGEYvnUHkigCPE/21wU2YAGHZ8EMROxxHnUeHT4qTryycR
	cDAoXgEIJM19P+LMMLjV/j7ZcdWWqKU8SnNxohZOddv5frqVMaKuYf0/NGCV8owUnciibsokL0aUh
	nF0uTPiKstRtRMI+qRyKYq+o1ddXmd2btWBwkEm7FXbAbah60i5vGmos3wgKLhbGhnq9M2m8LoNob
	XYf2hEM05tF+oP6XR68Qz2R61HudQmqz9QbRVlLMnoeDsuoh9ICTK+cjp6szvNH5jRRWonRPb3rOA
	rHlQQDNA==;
Received: from 179-125-79-204-dinamico.pombonet.net.br ([179.125.79.204] helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1snlHA-00BkAA-N4; Mon, 09 Sep 2024 22:46:21 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH 1/2] media: uvcvideo: require entities to have a unique ID
Date: Mon,  9 Sep 2024 17:46:04 -0300
Message-Id: <20240909204605.1870265-2-cascardo@igalia.com>
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

Per UVC 1.5 specification, units and terminals must have an unique ID.

So, deny allocating an entity with an ID that belongs to a unit that is
already added to the list of entities.

This also prevents some syzkaller reproducers from triggering warnings due
to a chain of entities referring to themselves. In one particular case, an
Output Unit is connected to an Input Unit, both with the same ID of 1. But
when looking up for the source ID of the Output Unit, that same entity is
found instead of the input entity, which leads to such warnings.

[   20.650953] usb 1-1: new high-speed USB device number 2 using dummy_hcd
[   20.830206] usb 1-1: Using ep0 maxpacket: 8
[   20.833501] usb 1-1: config 0 descriptor??
[   21.038518] usb 1-1: string descriptor 0 read error: -71
[   21.038893] usb 1-1: Found UVC 0.00 device <unnamed> (2833:0201)
[   21.039299] uvcvideo 1-1:0.0: Entity type for entity Output 1 was not initialized!
[   21.041583] uvcvideo 1-1:0.0: Entity type for entity Input 1 was not initialized!
[   21.042218] ------------[ cut here ]------------
[   21.042536] WARNING: CPU: 0 PID: 9 at drivers/media/mc/mc-entity.c:1147 media_create_pad_link+0x2c4/0x2e0
[   21.043195] Modules linked in:
[   21.043535] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.11.0-rc7-00030-g3480e43aeccf #444
[   21.044101] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
[   21.044639] Workqueue: usb_hub_wq hub_event
[   21.045100] RIP: 0010:media_create_pad_link+0x2c4/0x2e0
[   21.045508] Code: fe e8 20 01 00 00 b8 f4 ff ff ff 48 83 c4 30 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc 0f 0b eb e9 0f 0b eb 0a 0f 0b eb 06 <0f> 0b eb 02 0f 0b b8 ea ff ff ff eb d4 66 2e 0f 1f 84 00 00 00 00
[   21.046801] RSP: 0018:ffffc9000004b318 EFLAGS: 00010246
[   21.047227] RAX: ffff888004e5d458 RBX: 0000000000000000 RCX: ffffffff818fccf1
[   21.047719] RDX: 000000000000007b RSI: 0000000000000000 RDI: ffff888004313290
[   21.048241] RBP: ffff888004313290 R08: 0001ffffffffffff R09: 0000000000000000
[   21.048701] R10: 0000000000000013 R11: 0001888004313290 R12: 0000000000000003
[   21.049138] R13: ffff888004313080 R14: ffff888004313080 R15: 0000000000000000
[   21.049648] FS:  0000000000000000(0000) GS:ffff88803ec00000(0000) knlGS:0000000000000000
[   21.050271] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   21.050688] CR2: 0000592cc27635b0 CR3: 000000000431c000 CR4: 0000000000750ef0
[   21.051136] PKRU: 55555554
[   21.051331] Call Trace:
[   21.051480]  <TASK>
[   21.051611]  ? __warn+0xc4/0x210
[   21.051861]  ? media_create_pad_link+0x2c4/0x2e0
[   21.052252]  ? report_bug+0x11b/0x1a0
[   21.052540]  ? trace_hardirqs_on+0x31/0x40
[   21.052901]  ? handle_bug+0x3d/0x70
[   21.053197]  ? exc_invalid_op+0x1a/0x50
[   21.053511]  ? asm_exc_invalid_op+0x1a/0x20
[   21.053924]  ? media_create_pad_link+0x91/0x2e0
[   21.054364]  ? media_create_pad_link+0x2c4/0x2e0
[   21.054834]  ? media_create_pad_link+0x91/0x2e0
[   21.055131]  ? _raw_spin_unlock+0x1e/0x40
[   21.055441]  ? __v4l2_device_register_subdev+0x202/0x210
[   21.055837]  uvc_mc_register_entities+0x358/0x400
[   21.056144]  uvc_register_chains+0x1fd/0x290
[   21.056413]  uvc_probe+0x380e/0x3dc0
[   21.056676]  ? __lock_acquire+0x5aa/0x26e0
[   21.056946]  ? find_held_lock+0x33/0xa0
[   21.057196]  ? kernfs_activate+0x70/0x80
[   21.057533]  ? usb_match_dynamic_id+0x1b/0x70
[   21.057811]  ? find_held_lock+0x33/0xa0
[   21.058047]  ? usb_match_dynamic_id+0x55/0x70
[   21.058330]  ? lock_release+0x124/0x260
[   21.058657]  ? usb_match_one_id_intf+0xa2/0x100
[   21.058997]  usb_probe_interface+0x1ba/0x330
[   21.059399]  really_probe+0x1ba/0x4c0
[   21.059662]  __driver_probe_device+0xb2/0x180
[   21.059944]  driver_probe_device+0x5a/0x100
[   21.060170]  __device_attach_driver+0xe9/0x160
[   21.060427]  ? __pfx___device_attach_driver+0x10/0x10
[   21.060872]  bus_for_each_drv+0xa9/0x100
[   21.061312]  __device_attach+0xed/0x190
[   21.061812]  device_initial_probe+0xe/0x20
[   21.062229]  bus_probe_device+0x4d/0xd0
[   21.062590]  device_add+0x308/0x590
[   21.062912]  usb_set_configuration+0x7b6/0xaf0
[   21.063403]  usb_generic_driver_probe+0x36/0x80
[   21.063714]  usb_probe_device+0x7b/0x130
[   21.063936]  really_probe+0x1ba/0x4c0
[   21.064111]  __driver_probe_device+0xb2/0x180
[   21.064577]  driver_probe_device+0x5a/0x100
[   21.065019]  __device_attach_driver+0xe9/0x160
[   21.065403]  ? __pfx___device_attach_driver+0x10/0x10
[   21.065820]  bus_for_each_drv+0xa9/0x100
[   21.066094]  __device_attach+0xed/0x190
[   21.066535]  device_initial_probe+0xe/0x20
[   21.066992]  bus_probe_device+0x4d/0xd0
[   21.067250]  device_add+0x308/0x590
[   21.067501]  usb_new_device+0x347/0x610
[   21.067817]  hub_event+0x156b/0x1e30
[   21.068060]  ? process_scheduled_works+0x48b/0xaf0
[   21.068337]  process_scheduled_works+0x5a3/0xaf0
[   21.068668]  worker_thread+0x3cf/0x560
[   21.068932]  ? kthread+0x109/0x1b0
[   21.069133]  kthread+0x197/0x1b0
[   21.069343]  ? __pfx_worker_thread+0x10/0x10
[   21.069598]  ? __pfx_kthread+0x10/0x10
[   21.069908]  ret_from_fork+0x32/0x40
[   21.070169]  ? __pfx_kthread+0x10/0x10
[   21.070424]  ret_from_fork_asm+0x1a/0x30
[   21.070737]  </TASK>

Fixes: a3fbc2e6bb05 ("media: mc-entity.c: use WARN_ON, validate link pads")
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index f0febdc08c2d..a6973b0ba676 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -775,14 +775,18 @@ static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
 
-static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
-		unsigned int num_pads, unsigned int extra_size)
+static struct uvc_entity *uvc_alloc_entity(struct uvc_device *dev, u16 type,
+		u16 id, unsigned int num_pads, unsigned int extra_size)
 {
 	struct uvc_entity *entity;
 	unsigned int num_inputs;
 	unsigned int size;
 	unsigned int i;
 
+	/* Per UVC 1.5 spec, the ID is unique */
+	if (uvc_entity_by_id(dev, id))
+		return NULL;
+
 	extra_size = roundup(extra_size, sizeof(*entity->pads));
 	if (num_pads)
 		num_inputs = type & UVC_TERM_OUTPUT ? num_pads : num_pads - 1;
@@ -904,7 +908,7 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
 			break;
 		}
 
-		unit = uvc_alloc_entity(UVC_VC_EXTENSION_UNIT, buffer[3],
+		unit = uvc_alloc_entity(dev, UVC_VC_EXTENSION_UNIT, buffer[3],
 					p + 1, 2*n);
 		if (unit == NULL)
 			return -ENOMEM;
@@ -1016,7 +1020,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		term = uvc_alloc_entity(type | UVC_TERM_INPUT, buffer[3],
+		term = uvc_alloc_entity(dev, type | UVC_TERM_INPUT, buffer[3],
 					1, n + p);
 		if (term == NULL)
 			return -ENOMEM;
@@ -1075,7 +1079,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return 0;
 		}
 
-		term = uvc_alloc_entity(type | UVC_TERM_OUTPUT, buffer[3],
+		term = uvc_alloc_entity(dev, type | UVC_TERM_OUTPUT, buffer[3],
 					1, 0);
 		if (term == NULL)
 			return -ENOMEM;
@@ -1097,7 +1101,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, 0);
+		unit = uvc_alloc_entity(dev, buffer[2], buffer[3], p + 1, 0);
 		if (unit == NULL)
 			return -ENOMEM;
 
@@ -1119,7 +1123,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		unit = uvc_alloc_entity(buffer[2], buffer[3], 2, n);
+		unit = uvc_alloc_entity(dev, buffer[2], buffer[3], 2, n);
 		if (unit == NULL)
 			return -ENOMEM;
 
@@ -1148,7 +1152,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, n);
+		unit = uvc_alloc_entity(dev, buffer[2], buffer[3], p + 1, n);
 		if (unit == NULL)
 			return -ENOMEM;
 
@@ -1290,7 +1294,8 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 		return dev_err_probe(&dev->udev->dev, irq,
 				     "No IRQ for privacy GPIO\n");
 
-	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
+	unit = uvc_alloc_entity(dev, UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID,
+				0, 1);
 	if (!unit)
 		return -ENOMEM;
 
-- 
2.34.1


