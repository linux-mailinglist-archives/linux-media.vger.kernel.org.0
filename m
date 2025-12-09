Return-Path: <linux-media+bounces-48498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF2CB1534
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 23:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8AD553027198
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 22:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0472F3C0F;
	Tue,  9 Dec 2025 22:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NGjp4Tvs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E7F2236E3;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320292; cv=none; b=ilI1h/PTYi2thZ2TFePRmCG81JlFTSOAFxkBRE62zt9LXZIlYj7lRf70oLj2jsEJZNWmC9UvU8ZcVPoquZTntPEyLfVyzWEpjmlp0FYVAiAhE+wojWZJNtqEA/bA6LUrfxJc47DR63tsD4rKn9YG7mbkve6QEMmtJc6BA+1KS+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320292; c=relaxed/simple;
	bh=UANwLOgcj9WwONW3K+0Sy55FYPHJ20LKps0TM9A7gAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=meHaqvQH5z1qA0+eOpQxTeKCjiH6vtSmXNlKjornqcBK4PBt8N34VuZQBDSpfOvCnQncF7kXZx7GuGgZQziKS0RjE22YwoZMabNH+B/X3QP40cD6Bb1ne8vYpchta7ylma/e6UrDTQTYe7BS/RpOx3LfuPOvacxka2s0waxWd9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NGjp4Tvs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FCDEC116B1;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1765320291; bh=UANwLOgcj9WwONW3K+0Sy55FYPHJ20LKps0TM9A7gAM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NGjp4TvsbcJEjq1WwMrgwzoSy4StB6d/TtBOiq/bWVaOXJEDUun/uglnLfrLbznC8
	 /k/Y7bJ6W3tAr5Mep7oV8XSytYHVcF5p/k22Fiv/r30Dabn5Tb39rxVFW6bytKYTs2
	 5WgznrQsKg//u9qXi12WnPUbVrbBozcOVNMbzKLc=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8F9D3B9A4;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 09 Dec 2025 23:44:36 +0100
Subject: [PATCH v10 1/8] media: v4l: ctrls: add a control for flash/strobe
 duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-ov9282-flash-strobe-v10-1-0117cab82e2d@linux.dev>
References: <20251209-ov9282-flash-strobe-v10-0-0117cab82e2d@linux.dev>
In-Reply-To: <20251209-ov9282-flash-strobe-v10-0-0117cab82e2d@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.15-dev-a3fc8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765320290; l=1820;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=UANwLOgcj9WwONW3K+0Sy55FYPHJ20LKps0TM9A7gAM=;
 b=90c+MeYUo+cxxo48yiJUmMrs5kCI6EIBoKt4A5H+otNxAzgIZY4S4KVO1Qyk+TB30lJOwFMKu
 dZ988WtoH1KD+Q6hPxe01+a5Jl/WrDz517Q//GjUHiKQjFvIKDEnDtz
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add a V4L2_CID_FLASH_DURATION control to set the duration of a
flash/strobe pulse. This controls the length of the flash/strobe pulse
output by device (typically a camera sensor) and connected to the flash
controller. This is different to the V4L2_CID_FLASH_TIMEOUT control,
which is implemented by the flash controller and defines a limit after
which the flash is "forcefully" turned off again.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
 include/uapi/linux/v4l2-controls.h        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index ad41f65374e23..4848423205ff7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1135,6 +1135,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_FLASH_FAULT:		return "Faults";
 	case V4L2_CID_FLASH_CHARGE:		return "Charge";
 	case V4L2_CID_FLASH_READY:		return "Ready to Strobe";
+	case V4L2_CID_FLASH_DURATION:		return "Strobe Duration";
 
 	/* JPEG encoder controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 2d30107e047ee..9830833b48a52 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1186,6 +1186,7 @@ enum v4l2_flash_strobe_source {
 
 #define V4L2_CID_FLASH_CHARGE			(V4L2_CID_FLASH_CLASS_BASE + 11)
 #define V4L2_CID_FLASH_READY			(V4L2_CID_FLASH_CLASS_BASE + 12)
+#define V4L2_CID_FLASH_DURATION			(V4L2_CID_FLASH_CLASS_BASE + 13)
 
 
 /* JPEG-class control IDs */

-- 
2.47.3



