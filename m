Return-Path: <linux-media+bounces-47522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6BC758C0
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 18:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8EF2C34A9C4
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 17:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A690C372ABC;
	Thu, 20 Nov 2025 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Opi25cHh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692E36CE15;
	Thu, 20 Nov 2025 17:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658270; cv=none; b=gZaBtzmHyjAKfsKwDutGKMyGOL+iISHBT30hZMb9FFsk1lE4OGtSxYnXWnupzMVtEso0OsTFibTsde6Y3tQxdR2Pzce3mgUughKRhOhuUKEVeL0sk255lYybhTVmZdj2mMI/8LgOGMX+fqVVJNDxaXg9XpCZ/VlhG0Se/jDp89M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658270; c=relaxed/simple;
	bh=WdjWzcmOaYcxgKjt3rSXqMILwpTVd4F8Ojpz58xzqvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0PUmY03d0+9uyuD7lOy6NDnVYhBra6Pkjp3MiKz1VEF4E1W3ZakL4Eor7QCBmcBEsTZvgycbcLpOleXkXwW6vXWHQ695BvDnqxY6KkekZ8pEyYZnJTX0Rs9auuYLzySoU/t9Z4kReRTi23kTuZnMwFvu/2/Z1PMc+4XGnfN2GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Opi25cHh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AA4BC2BC87;
	Thu, 20 Nov 2025 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1763658270; bh=WdjWzcmOaYcxgKjt3rSXqMILwpTVd4F8Ojpz58xzqvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Opi25cHhU79MFNH8epaxsRcN626Wl6SJ9RqCbkbK4mD8zwJK4gyFHUOVoh/EGgeef
	 OTHjy651ObpBX8gcGGI51FVu0iHSd+PEjfnSsEhpmKypFiJ6AAMWSFV9V25qDZ3lBe
	 wtw1BfZADpSWt496Jifwy2h37AE07+n/cjeTcjPM=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2032DCF9C73;
	Thu, 20 Nov 2025 17:04:30 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Thu, 20 Nov 2025 18:04:26 +0100
Subject: [PATCH v9 6/8] media: i2c: ov9282: add strobe_duration v4l2
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251120-ov9282-flash-strobe-v9-6-6c9e3a4301d7@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763658268; l=3587;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=WdjWzcmOaYcxgKjt3rSXqMILwpTVd4F8Ojpz58xzqvY=;
 b=fJ7DsoCKK4+iWnkhg7xR5umGFPSdfeqlAh9xrCBtfRzw0pXlyX2YBlOpPI21Wx340MlDo8y1I
 EKBKJlMdYikDttE10++J5GXXmRf4aZHRzuNO2qTGl3dkVvWAJQoe2ek
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add V4L2_CID_FLASH_DURATION support using the "strobe_frame_span"
feature of the sensor. This is implemented by transforming the given µs
value by an interpolated formula to a "span step width" value and
writing it to register PWM_CTRL_25, PWM_CTRL_26, PWM_CTRL_27,
PWM_CTRL_28 (0x3925, 0x3926, 0x3927, 0x3928).

The maximum control value is set to the period of the current default
framerate.

All register values are based on the OV9281 datasheet v1.53 (jan 2019)
and tested using an ov9281 VisionComponents module.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 6afce803a049..26296dc1d1b9 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -97,6 +97,10 @@
 #define OV9282_REG_MIPI_CTRL00	0x4800
 #define OV9282_GATED_CLOCK	BIT(5)
 
+/* Flash/Strobe control registers */
+#define OV9282_REG_STROBE_FRAME_SPAN		0x3925
+#define OV9282_STROBE_FRAME_SPAN_DEFAULT	0x0000001a
+
 /* Input clock rate */
 #define OV9282_INCLK_RATE	24000000
 
@@ -687,6 +691,31 @@ static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
 	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
 }
 
+static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
+{
+	int ret;
+	/*
+	 * Calculate "strobe_frame_span" increments from a given value (µs).
+	 * This is quite tricky as "The step width of shift and span is
+	 * programmable under system clock domain.", but it's not documented
+	 * how to program this step width (at least in the datasheet available
+	 * to the author at time of writing).
+	 * The formula below is interpolated from different modes/framerates
+	 * and should work quite well for most settings.
+	 */
+	u32 val = value * 192 / (ov9282->cur_mode->width + ov9282->hblank_ctrl->val);
+
+	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN, 1,
+			       (val >> 24) & 0xff);
+	ret |= ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 1, 1,
+				(val >> 16) & 0xff);
+	ret |= ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 2, 1,
+				(val >> 8) & 0xff);
+	ret |= ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 3, 1,
+				val & 0xff);
+	return ret;
+}
+
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -756,6 +785,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_FLASH_STROBE_OE:
 		ret = ov9282_set_ctrl_flash_strobe_oe(ov9282, ctrl->val);
 		break;
+	case V4L2_CID_FLASH_DURATION:
+		ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
+		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
@@ -1345,7 +1377,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	u32 lpfr;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -1414,6 +1446,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
 			  V4L2_CID_FLASH_STROBE_OE, 0, 1, 1, 0);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
+			  0, 13900, 1, 8);
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
2.47.3



