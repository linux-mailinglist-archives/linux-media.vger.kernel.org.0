Return-Path: <linux-media+bounces-37849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 222B4B07130
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 11:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 565D116FE7D
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 09:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72452F2730;
	Wed, 16 Jul 2025 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FnlcVqaj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B812F0C40;
	Wed, 16 Jul 2025 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656849; cv=none; b=nmphx3vGV7gAyFuvTw2kEKIjj6ayxtnbTMai64LwTCHQHCgEDoeSs8fX4K4cfHj+jlMAPMDcPzqug9C9kW4v2khQHJ9CCYg3OFrzL4oLmJH4OVaVnZmQyhdfRWDdD8WfsQiAaQlQqu+6K7iUMRc5Is0bJsXNtt0RlreBH4Ti40w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656849; c=relaxed/simple;
	bh=I5haGetjk5CR5fMUuZoz3rwX2PVyWVsn8Vb9i7Affcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bgXXL6By1bVZHudevf8uedPBzU7peLicJX2Kq31RA1AlFv6Nrs27iHKjKl0jtgsXoawI9heO6TojIwd2y49gVHAVt+hgD3qWV8V0E0O+FpwDUq8/7Vb1SdJ0hJ1dpgUU5ZbmlU0zvg4rshcDeOPU1CYXB44zyHQ7GCu+1NDErTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FnlcVqaj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B0F6C4CEF9;
	Wed, 16 Jul 2025 09:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1752656849; bh=I5haGetjk5CR5fMUuZoz3rwX2PVyWVsn8Vb9i7Affcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FnlcVqajhbuAD3G6jgcUACAEXfKn4/lUKua0aAPT4nQrPcaqRe1488aQByWg91sKq
	 SNZDMwRVR4zitQNWIpvfjhJBbVggObd2A7gPASoG+WBiQ7OlfiS3RXx5yc202g6P8Z
	 rRQhFQhVuQ+e0O63c+clEMLdfHahpWV6UV8+yft4=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153D2C83F22;
	Wed, 16 Jul 2025 09:07:29 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 16 Jul 2025 11:07:01 +0200
Subject: [PATCH v6 11/11] media: i2c: ov9282: dynamic flash_duration
 maximum
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250716-ov9282-flash-strobe-v6-11-934f12aeff33@linux.dev>
References: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
In-Reply-To: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752656846; l=3617;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=I5haGetjk5CR5fMUuZoz3rwX2PVyWVsn8Vb9i7Affcg=;
 b=VB1tzvKw7r+KAkKWuxzY3h7EKOJfEH0R4/CayW98olpyAwCNKSdi8lRLtPjbL1FnDnYtAmLN5
 Y4gOIfsP120CCzm+SHFgBvZ7SgQLQiywUYomdPDt7oPY4iQyooczujA
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

This patch sets the current exposure time as maximum for the
flash_duration control. As Flash/Strobes which are longer than the
exposure time have no effect.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index b104ae77f00e9e7777342e48b7bf3caa6d297f69..3253d9f271cb3caef6d85837ebec4f5beb466a4d 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -198,6 +198,7 @@ struct ov9282_mode {
  * @exp_ctrl: Pointer to exposure control
  * @again_ctrl: Pointer to analog gain control
  * @pixel_rate: Pointer to pixel rate control
+ * @flash_duration: Pointer to flash duration control
  * @vblank: Vertical blanking in lines
  * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
  * @cur_mode: Pointer to current selected sensor mode
@@ -220,6 +221,7 @@ struct ov9282 {
 		struct v4l2_ctrl *again_ctrl;
 	};
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *flash_duration;
 	u32 vblank;
 	bool noncontinuous_clock;
 	const struct ov9282_mode *cur_mode;
@@ -611,6 +613,15 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
 					mode->vblank_max, 1, mode->vblank);
 }
 
+static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
+{
+	/* calculate exposure time in µs */
+	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
+	u32 trow_us = (frame_width * 1000000UL) / ov9282->pixel_rate->val;
+
+	return exposure * trow_us;
+}
+
 /**
  * ov9282_update_exp_gain() - Set updated exposure and gain
  * @ov9282: pointer to ov9282 device
@@ -622,9 +633,10 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
 static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 {
 	int ret;
+	u32 exposure_us = ov9282_exposure_to_us(ov9282, exposure);
 
-	dev_dbg(ov9282->dev, "Set exp %u, analog gain %u",
-		exposure, gain);
+	dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
+		exposure, exposure_us, gain);
 
 	ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
 	if (ret)
@@ -635,6 +647,12 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 		goto error_release_group_hold;
 
 	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
+	if (ret)
+		goto error_release_group_hold;
+
+	ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
+				       0, exposure_us, 1,
+				       OV9282_FLASH_DURATION_DEFAULT);
 
 error_release_group_hold:
 	ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
@@ -1420,6 +1438,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *ctrl;
 	u32 hblank_min;
+	u32 exposure_us;
 	u32 lpfr;
 	int ret;
 
@@ -1491,8 +1510,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	/* Flash/Strobe controls */
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
 
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
-			  0, 13900, 1, 8);
+	exposure_us = ov9282_exposure_to_us(ov9282, OV9282_EXPOSURE_DEFAULT);
+	ov9282->flash_duration = v4l2_ctrl_new_std(ctrl_hdlr,
+						   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
+						   0, exposure_us,
+						   1, OV9282_FLASH_DURATION_DEFAULT);
 
 	ctrl = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
 				      V4L2_CID_FLASH_STROBE_SOURCE,

-- 
2.47.2



