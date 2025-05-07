Return-Path: <linux-media+bounces-31931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 682A1AAD916
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A4D0189327C
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9555223703;
	Wed,  7 May 2025 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="zPzu92A2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC30221D83;
	Wed,  7 May 2025 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604342; cv=none; b=A2Be+MASb327ibHpGY4e8V3pVgFRMBgFwFbsCilkzb/sy6vkqW0YyJLZmP1EPjD61JQ4Jt0AG0lF9gejxKJU2iTVoIZJM5zBpdvB6ypK42F4/w7cIte4KSI93OkC0YOkIgtBl9ikgzLe7HksKeUxffAa5TYXL/U3ROXbVRm83LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604342; c=relaxed/simple;
	bh=GwAJbtPkRHjKJSJXD8je918r9KcSpVtLEPvHlE3Ftbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sY/WVGTGLD2HCEeFEvbig8RjpL5V0fYEU4Z0Myww2YfW9Hq+pG9zF68wZT1qrjp/nMEQrEdsk6agSziiSHIsjF5Ai5wUkfV7B1KfdhMGt83SxhakOx1I/kUH/kKODQdcRZAQbQ9cpfwdSmBre01Ov0syueSo/zVZ5sT0XCrj4QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=zPzu92A2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1E88C4CEFE;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1746604341; bh=GwAJbtPkRHjKJSJXD8je918r9KcSpVtLEPvHlE3Ftbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=zPzu92A2zbQ1giPlEA/lHKJ2nrC4UZiYSiMY53Zs9XF/rT0uYC2iuuQ575o6zF8PY
	 PR1F8//XNZtwGaMmxYmsCrMutXLen4prVBLeknxvR6owoULCLoyx/gXn3Kzgn+/Cla
	 J6KOKTwbEynnMetdmeFyPyo4EHezTGjAbA1WErB0=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE55C3ABC9;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 07 May 2025 09:51:37 +0200
Subject: [PATCH v4 08/10] media: i2c: ov9282: add strobe_duration v4l2
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250507-ov9282-flash-strobe-v4-8-72b299c1b7c9@linux.dev>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
In-Reply-To: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746604340; l=3465;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=GwAJbtPkRHjKJSJXD8je918r9KcSpVtLEPvHlE3Ftbo=;
 b=YLTqVL/QOzefO13jNk2snq6EPLc1gQYk/jRaF7MdoabQc56jJxDsp3dZPGm+VYAMBmUcvksZM
 Oc0rzOjl5PsDSGR34GRO0/oFN6BzPXisC+JFSwmJxXqwTInSSJ46LPo
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
 drivers/media/i2c/ov9282.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index b6de96997426f7225a061bfdc841aa062e8d0891..0bbdf08d7cda8f72e05fdc292aa69a4c821e4e03 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -97,6 +97,10 @@
 #define OV9282_REG_MIPI_CTRL00	0x4800
 #define OV9282_GATED_CLOCK	BIT(5)
 
+/* Flash/Strobe control registers */
+#define OV9282_REG_FLASH_DURATION	0x3925
+#define OV9282_FLASH_DURATION_DEFAULT	0x0000001A
+
 /* Input clock rate */
 #define OV9282_INCLK_RATE	24000000
 
@@ -687,6 +691,25 @@ static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
 				current_val);
 }
 
+static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
+{
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
+	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION, 1, (val >> 24) & 0xff);
+	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 1, 1, (val >> 16) & 0xff);
+	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 2, 1, (val >> 8) & 0xff);
+	return ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 3, 1, val & 0xff);
+}
+
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -756,6 +779,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_FLASH_LED_MODE:
 		ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
 		break;
+	case V4L2_CID_FLASH_DURATION:
+		ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
+		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
@@ -1346,7 +1372,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	u32 lpfr;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;
 
@@ -1418,6 +1444,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 			       (1 << V4L2_FLASH_LED_MODE_TORCH),
 			       V4L2_FLASH_LED_MODE_NONE);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
+			  0, 13900, 1, 8);
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
2.47.2



