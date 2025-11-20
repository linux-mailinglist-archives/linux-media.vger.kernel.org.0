Return-Path: <linux-media+bounces-47521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36496C7589C
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 18:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 6C54E2C2E5
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 17:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7424372AD9;
	Thu, 20 Nov 2025 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="utzYGQLe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966A536CE09;
	Thu, 20 Nov 2025 17:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658270; cv=none; b=PEqF7VPoQtQ/D6AP/SGJ95MXNC/REcMpFn+5xhz0sjZaWQMIUK4G0WMKY81J2fyb3QhdfcPppzXo0jZSHf2egg1NvY344VK5vCQBEgbbB0/gvbcUhfia3fUXeIAyztHoQkzGybd8vqXL+vT30yz8nuerzBg+1BDeexPLBVvqM+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658270; c=relaxed/simple;
	bh=cMhXmygdZf3b3AgzDH9NcbI8NnOSqpVAq9jj95gyvyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEI6nKT5z+BYcclEZRQ5MkxVpnnFHE6vGO8nWfX6QAu093XDvqzfduCQ1dUKpHtSGGpnTe6m7v+uwyPkVnQFPgsTzpDpEYloHyAuGAvCDGJFl+fRhgMZmolBLEW5yPYMPcBdIhVNOjl9lU/tGzqdsQ8wRh7JJJ7HTa9uW2MGWbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=utzYGQLe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44188C4AF0B;
	Thu, 20 Nov 2025 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1763658270; bh=cMhXmygdZf3b3AgzDH9NcbI8NnOSqpVAq9jj95gyvyo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=utzYGQLeeTgpbxZyUm7zv7MNN29MeJaYaecc/9gOeixWGdpTR90Ba0BbGE/2gVwhI
	 0Xj1+4L9H7parTn4K15Xop8No5e4mzjTCJhTotdGjncgTKQSIIKibY3sLzqm1zwi1u
	 eb63XyavldhAPSBA8Idjk2HJZqS5FlxnOsrRx6sc=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C07CCF9C72;
	Thu, 20 Nov 2025 17:04:30 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Thu, 20 Nov 2025 18:04:28 +0100
Subject: [PATCH v9 8/8] media: i2c: ov9282: dynamic flash_duration maximum
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251120-ov9282-flash-strobe-v9-8-6c9e3a4301d7@linux.dev>
References: <20251120-ov9282-flash-strobe-v9-0-6c9e3a4301d7@linux.dev>
In-Reply-To: <20251120-ov9282-flash-strobe-v9-0-6c9e3a4301d7@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.15-dev-a3fc8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763658268; l=3530;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=cMhXmygdZf3b3AgzDH9NcbI8NnOSqpVAq9jj95gyvyo=;
 b=ASi/PHKnG/Uq4cD9JkIM5gYB9bcvH64WBXzx+H7fM6dd/c0Xrqrcfk16qCQ7bNOTmJq/v5TPL
 ZKqbcb0WsejDQ5ehs/7qaDCpXNz/FPJqbvwPMo6O93bNrG1hPUTyTLH
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
index 823fde579e07..33404630cc0c 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -199,6 +199,7 @@ struct ov9282_mode {
  * @exp_ctrl: Pointer to exposure control
  * @again_ctrl: Pointer to analog gain control
  * @pixel_rate: Pointer to pixel rate control
+ * @flash_duration: Pointer to flash duration control
  * @vblank: Vertical blanking in lines
  * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
  * @cur_mode: Pointer to current selected sensor mode
@@ -221,6 +222,7 @@ struct ov9282 {
 		struct v4l2_ctrl *again_ctrl;
 	};
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *flash_duration;
 	u32 vblank;
 	bool noncontinuous_clock;
 	const struct ov9282_mode *cur_mode;
@@ -612,6 +614,15 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
 					mode->vblank_max, 1, mode->vblank);
 }
 
+static u32 ov9282_exposure_to_us(struct ov9282 *ov9282, u32 exposure)
+{
+	/* calculate exposure time in µs */
+	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
+	u32 trow_us = frame_width / (ov9282->pixel_rate->val / 1000000UL);
+
+	return exposure * trow_us;
+}
+
 /**
  * ov9282_update_exp_gain() - Set updated exposure and gain
  * @ov9282: pointer to ov9282 device
@@ -623,9 +634,10 @@ static int ov9282_update_controls(struct ov9282 *ov9282,
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
@@ -636,6 +648,12 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 		goto error_release_group_hold;
 
 	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
+	if (ret)
+		goto error_release_group_hold;
+
+	ret = __v4l2_ctrl_modify_range(ov9282->flash_duration,
+				       0, exposure_us, 1,
+				       OV9282_STROBE_FRAME_SPAN_DEFAULT);
 
 error_release_group_hold:
 	ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
@@ -1423,6 +1441,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	const struct ov9282_mode *mode = ov9282->cur_mode;
 	struct v4l2_fwnode_device_properties props;
 	u32 hblank_min;
+	u32 exposure_us;
 	u32 lpfr;
 	int ret;
 
@@ -1495,8 +1514,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
 			  V4L2_CID_FLASH_STROBE_OE, 0, 1, 1, 0);
 
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
-			  0, 13900, 1, 8);
+	exposure_us = ov9282_exposure_to_us(ov9282, OV9282_EXPOSURE_DEFAULT);
+	ov9282->flash_duration = v4l2_ctrl_new_std(ctrl_hdlr,
+						   &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
+						   0, exposure_us,
+						   1, OV9282_STROBE_FRAME_SPAN_DEFAULT);
 
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {

-- 
2.47.3



