Return-Path: <linux-media+bounces-27427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C13D1A4CEE8
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 23:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D9EE3AB76F
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 22:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDBE23C8AC;
	Mon,  3 Mar 2025 22:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X9Xwto2l"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6123959B;
	Mon,  3 Mar 2025 22:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042744; cv=none; b=C7AR5kzVL3wd6bBr3BUS+TRdnnsyV9jAyLkG+FzSUQKDahdM0ZCA9bUZr55pLwsqpnbxaVlhHtVyu8OvdvLoDkUUyPqLCPvHykY7G4QXbBm2CrkZ2hRQ9jhgTjFamBzUjmB3SlnttFRNREAFeCYkHntRQmb25OKNbugHfrKnqb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042744; c=relaxed/simple;
	bh=2qBIlc61Bz0jLXzWYXDw1jJCbwLUdYBGjPC1XgOpVUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hObh992n5hRjUkJBRK8c8N19cQl3QVWhKp5r29GRnuCz+cGDcJuyBIxoX/gDWklHrzKh0pL0PfDVbH+MX1pG68D72XSKIblk0QqaeORk9e2Eq8cXNaWhHiGjiYQkvbGIawnWur6YrgtAQwZCdLC++9nSRh1kiBG/LvDXIPFnEH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X9Xwto2l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D999BC4CEEB;
	Mon,  3 Mar 2025 22:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1741042743; bh=2qBIlc61Bz0jLXzWYXDw1jJCbwLUdYBGjPC1XgOpVUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X9Xwto2leAXjKRjdW1eoxgRqC843CRbjMbyf7JsGQGz95it15ExlPNDfaAR6dSgMJ
	 njxquyAcTPb0x1hyPQTK/gg5ADz+b0+ZvfT103I2Doy3iXgiefRjrDTHpWnudgSQzD
	 Gz5DVCnhqe6QgvMQGAPtAOYjPkGev6FtKauqSlKA=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC34C282D6;
	Mon,  3 Mar 2025 22:59:03 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 03 Mar 2025 23:58:59 +0100
Subject: [PATCH 3/3] media: i2c: ov9282: add strobe_timeout v4l2 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-ov9282-flash-strobe-v1-3-0fd57a1564ba@linux.dev>
References: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
In-Reply-To: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741042742; l=3993;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=2qBIlc61Bz0jLXzWYXDw1jJCbwLUdYBGjPC1XgOpVUc=;
 b=j8FXv3/aOnxHqzyRM0RPHz9QmI2mC4+6onIZX4C0TQL+YMCjlVdVkVd7gWomBgJaN13tzgcCR
 ZvKCC3Ef+JzDTPOoYFUQPDkRcYMuEzTLCuyo4z4BlJvom4QFXhRCxMl
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add V4L2_CID_FLASH_TIMEOUT support using the "strobe_frame_span"
feature of the sensor. This is implemented by transforming the given µs
value by an interpolated formula to a "span step width" value and
writing it to register PWM_CTRL_25, PWM_CTRL_26, PWM_CTRL_27,
PWM_CTRL_28 (0x3925, 0x3926, 0x3927, 0x3928).

The maximum control value is set to the period of the current framerate.
This must be changed to a dynamic range as soon as this driver
implements the set_frame_interval() pad operation.

All register values are based on the OV9281 datasheet v1.53 (jan 2019)
and tested using an ov9281 VisionComponents module.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c98ba466e9aea29baff0b13578d760bf69c958c5..f7dfe8987e524b73af7e16e12567e96627b4f89a 100644
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
 
@@ -193,6 +197,7 @@ struct ov9282_mode {
  * @again_ctrl: Pointer to analog gain control
  * @pixel_rate: Pointer to pixel rate control
  * @flash_led_mode: Pointer to flash led mode control
+ * @flash_timeout: Pointer to flash timeout control
  * @vblank: Vertical blanking in lines
  * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
  * @cur_mode: Pointer to current selected sensor mode
@@ -216,6 +221,7 @@ struct ov9282 {
 	};
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *flash_led_mode;
+	struct v4l2_ctrl *flash_timeout;
 	u32 vblank;
 	bool noncontinuous_clock;
 	const struct ov9282_mode *cur_mode;
@@ -689,6 +695,24 @@ static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
 				current_val);
 }
 
+static int ov9282_set_ctrl_flash_timeout(struct ov9282 *ov9282, int value)
+{
+	/* Calculate "strobe_frame_span" increments from a given value (µs).
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
@@ -758,6 +782,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_FLASH_LED_MODE:
 		ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
 		break;
+	case V4L2_CID_FLASH_TIMEOUT:
+		ret = ov9282_set_ctrl_flash_timeout(ov9282, ctrl->val);
+		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
@@ -1420,6 +1447,10 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 							(1 << V4L2_FLASH_LED_MODE_TORCH),
 							V4L2_FLASH_LED_MODE_NONE);
 
+	ov9282->flash_timeout = v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
+						  V4L2_CID_FLASH_TIMEOUT,
+						  0, 13900, 1, 8);
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
2.47.2



