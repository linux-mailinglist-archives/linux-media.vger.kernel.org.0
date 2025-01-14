Return-Path: <linux-media+bounces-24737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A6EA11199
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 21:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D52B03A5660
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 20:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6051FC0F9;
	Tue, 14 Jan 2025 20:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="StlL3QnF"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC131C5D4B
	for <linux-media@vger.kernel.org>; Tue, 14 Jan 2025 20:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884879; cv=none; b=T5zJBd9HuoDXZaCRf4wmT/YGsVlDJxO+Axo+3piY/Ps+oax9CR2AlMh+gnqyfxKqTiLey32BPq87BAU5YsbFmJtbpEMEehtBUOSoC4OtA2+Fw2wlqdYVZjQY1gpYg++7mzHmY0ZS2lsP0dRlxPFnHkcLNZAe5wWO6bBAwTFlf+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884879; c=relaxed/simple;
	bh=W42L31EvvMuyWEIMkhRy+FKCYlLYCSOnO3/eEmu0ADQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p4mwmv1g02sESqnxcZVJ9J23faFX1dTzgMsfUH6z6EA2ixW3X6o6s06QnFomxZx0vlrIEmKn3PjeWZVgPvlvYsu6vorlcv7uRepTtXc03M5ZFRBprvJYWy1Jep8pVeA8CiI5uy0KlZ29tpFyHleb6VgUPgOQ3Os9/mnwmhOpBGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=StlL3QnF; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XqZWW+RIHkqcz0OrUeizKP1GJx0swN7UEzoxKfvyAeg=; b=StlL3QnFQLpdp+5c0mB3X8j8i7
	MUgTtIK9UKuLmuoFlXYhhFlApX5ZLVvB8aSPZeGh/GGCbbSGRFFaLbhYcmBzmCcDtQ4Ib1J4mi/X0
	aRU04J9chBJsFYhyrABsc/Umk2aNTOMVMocOF80dvys3nDfu8hRtPT0H+W0hO4ti2q9Uqy+ERkF4O
	Ij29G08sxYzH0Xg+DAB91+HBDZvsg9pHMdMOFxPUSzEICRkux8FYQzzp06bx53vws2/L2t2lfP4nw
	GQwt1kev2B6HmvGeFscFSw7LTiwTUQu8YNqBIlEK7U+BvrGRJai4+/uqkOsTQ7vwdu9fkZTTCNRU1
	VKoiYIyg==;
Received: from 179-125-92-253-dinamico.pombonet.net.br ([179.125.92.253] helo=quatroqueijos.lan)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tXn65-00FnDi-5i; Tue, 14 Jan 2025 21:01:09 +0100
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomasz Sikora <sikora.tomus@gmail.com>,
	hverkuil-cisco@xs4all.nl,
	kernel-dev@igalia.com,
	mchehab@kernel.org,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Subject: [PATCH] Revert "media: uvcvideo: Require entities to have a non-zero unique ID"
Date: Tue, 14 Jan 2025 17:00:45 -0300
Message-Id: <20250114200045.1401644-1-cascardo@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Z4aeK4Ct7L/9kR2H@quatroqueijos.cascardo.eti.br>
References: <Z4aeK4Ct7L/9kR2H@quatroqueijos.cascardo.eti.br>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 3dd075fe8ebbc6fcbf998f81a75b8c4b159a6195.

Tomasz has reported that his device, Generalplus Technology Inc. 808 Camera,
with ID 1b3f:2002, stopped being detected:

$ ls -l /dev/video*
zsh: no matches found: /dev/video*
[    7.230599] usb 3-2: Found multiple Units with ID 5

This particular device is non-compliant, having both the Output Terminal
and Processing Unit with ID 5. uvc_scan_fallback, though, is able to build
a chain. However, when media elements are added and uvc_mc_create_links
call uvc_entity_by_id, it will get the incorrect entity,
media_create_pad_link will WARN, and it will fail to register the entities.

In order to reinstate support for such devices in a timely fashion,
reverting the fix for these warnings is appropriate. A proper fix that
considers the existence of such non-compliant devices will be submitted in
a later development cycle.

Reported-by: Tomasz Sikora <sikora.tomus@gmail.com>
Fixes: 3dd075fe8ebb ("media: uvcvideo: Require entities to have a non-zero unique ID")
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 70 ++++++++++++------------------
 1 file changed, 27 insertions(+), 43 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b3c8411dc05c..9febd2375636 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -775,27 +775,14 @@ static const u8 uvc_media_transport_input_guid[16] =
 	UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
 static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
 
-static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
-					       u16 id, unsigned int num_pads,
-					       unsigned int extra_size)
+static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
+		unsigned int num_pads, unsigned int extra_size)
 {
 	struct uvc_entity *entity;
 	unsigned int num_inputs;
 	unsigned int size;
 	unsigned int i;
 
-	/* Per UVC 1.1+ spec 3.7.2, the ID should be non-zero. */
-	if (id == 0) {
-		dev_err(&dev->udev->dev, "Found Unit with invalid ID 0.\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	/* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
-	if (uvc_entity_by_id(dev, id)) {
-		dev_err(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
-		return ERR_PTR(-EINVAL);
-	}
-
 	extra_size = roundup(extra_size, sizeof(*entity->pads));
 	if (num_pads)
 		num_inputs = type & UVC_TERM_OUTPUT ? num_pads : num_pads - 1;
@@ -805,7 +792,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
 	     + num_inputs;
 	entity = kzalloc(size, GFP_KERNEL);
 	if (entity == NULL)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	entity->id = id;
 	entity->type = type;
@@ -917,10 +904,10 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
 			break;
 		}
 
-		unit = uvc_alloc_new_entity(dev, UVC_VC_EXTENSION_UNIT,
-					    buffer[3], p + 1, 2 * n);
-		if (IS_ERR(unit))
-			return PTR_ERR(unit);
+		unit = uvc_alloc_entity(UVC_VC_EXTENSION_UNIT, buffer[3],
+					p + 1, 2*n);
+		if (unit == NULL)
+			return -ENOMEM;
 
 		memcpy(unit->guid, &buffer[4], 16);
 		unit->extension.bNumControls = buffer[20];
@@ -1029,10 +1016,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		term = uvc_alloc_new_entity(dev, type | UVC_TERM_INPUT,
-					    buffer[3], 1, n + p);
-		if (IS_ERR(term))
-			return PTR_ERR(term);
+		term = uvc_alloc_entity(type | UVC_TERM_INPUT, buffer[3],
+					1, n + p);
+		if (term == NULL)
+			return -ENOMEM;
 
 		if (UVC_ENTITY_TYPE(term) == UVC_ITT_CAMERA) {
 			term->camera.bControlSize = n;
@@ -1088,10 +1075,10 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return 0;
 		}
 
-		term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
-					    buffer[3], 1, 0);
-		if (IS_ERR(term))
-			return PTR_ERR(term);
+		term = uvc_alloc_entity(type | UVC_TERM_OUTPUT, buffer[3],
+					1, 0);
+		if (term == NULL)
+			return -ENOMEM;
 
 		memcpy(term->baSourceID, &buffer[7], 1);
 
@@ -1110,10 +1097,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3],
-					    p + 1, 0);
-		if (IS_ERR(unit))
-			return PTR_ERR(unit);
+		unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, 0);
+		if (unit == NULL)
+			return -ENOMEM;
 
 		memcpy(unit->baSourceID, &buffer[5], p);
 
@@ -1133,9 +1119,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3], 2, n);
-		if (IS_ERR(unit))
-			return PTR_ERR(unit);
+		unit = uvc_alloc_entity(buffer[2], buffer[3], 2, n);
+		if (unit == NULL)
+			return -ENOMEM;
 
 		memcpy(unit->baSourceID, &buffer[4], 1);
 		unit->processing.wMaxMultiplier =
@@ -1162,10 +1148,9 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		unit = uvc_alloc_new_entity(dev, buffer[2], buffer[3],
-					    p + 1, n);
-		if (IS_ERR(unit))
-			return PTR_ERR(unit);
+		unit = uvc_alloc_entity(buffer[2], buffer[3], p + 1, n);
+		if (unit == NULL)
+			return -ENOMEM;
 
 		memcpy(unit->guid, &buffer[4], 16);
 		unit->extension.bNumControls = buffer[20];
@@ -1305,10 +1290,9 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 		return dev_err_probe(&dev->udev->dev, irq,
 				     "No IRQ for privacy GPIO\n");
 
-	unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
-				    UVC_EXT_GPIO_UNIT_ID, 0, 1);
-	if (IS_ERR(unit))
-		return PTR_ERR(unit);
+	unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
+	if (!unit)
+		return -ENOMEM;
 
 	unit->gpio.gpio_privacy = gpio_privacy;
 	unit->gpio.irq = irq;
-- 
2.34.1


