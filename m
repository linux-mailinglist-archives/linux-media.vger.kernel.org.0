Return-Path: <linux-media+bounces-27428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C4AA4CEE9
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 23:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0F8D189269A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 22:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC8723C8C0;
	Mon,  3 Mar 2025 22:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uorGpzqi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803CE23A9BA;
	Mon,  3 Mar 2025 22:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741042744; cv=none; b=gHYY4L/SB0Cl6/g2B47c/Bqkj+aZHo+HWGYlXBw5jGii2X4QYRqthq91eRWHDnSJj/nNP3SRSwBKCTi2zOKsKhMfUpHBjw+JCkezQyWbhvcMiuSsnIjO6iYRey48gG0DdlG+wztAp0oI2uXcNGcNH8upg4ZwulyQ3Qh8k8FL+6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741042744; c=relaxed/simple;
	bh=ynf1rL1Z7qhjQlA4BOwr3bmt/GjH86WcpFJlKbCIiM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FkKDQdeSc+ray5/nZPEEIcVzU/xNbLwog2dAEke9jwZcuIrCBTuel4ii2HaX4wGLA5HgTSPMrYDUqPW36fh8MRYbxaAG+V+fB7Q2DJkASW9syKtTE2B/+tdxDCMzvnuI4VfJJcUqvV1VbxeQ83H+G2sgnp2p8wtIIwsm2BvefjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uorGpzqi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D09E7C4CEEC;
	Mon,  3 Mar 2025 22:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1741042743; bh=ynf1rL1Z7qhjQlA4BOwr3bmt/GjH86WcpFJlKbCIiM8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uorGpzqiFinOi9rHV5hHv29VN/UfHep+DuttZ5ouZDYPWqT59/6REOyxTdW79+Xx4
	 ClJnXnlfDxb7MoKM1oTMbtrzvycZELlkKtRG1DN60oKTDq3sxokUcOk3pw9PpayeI8
	 Kk9jb5cV0nX5yUpEnQwnqCXezLl7p49g9l3o5E3E=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF17EC282C6;
	Mon,  3 Mar 2025 22:59:03 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 03 Mar 2025 23:58:58 +0100
Subject: [PATCH 2/3] media: i2c: ov9282: add led_mode v4l2 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-ov9282-flash-strobe-v1-2-0fd57a1564ba@linux.dev>
References: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
In-Reply-To: <20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741042742; l=3064;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=ynf1rL1Z7qhjQlA4BOwr3bmt/GjH86WcpFJlKbCIiM8=;
 b=PjiFIB/iECjcZdDzTZSyCqUFxMc/SIfwtkPj0A54hSgIe71p1U8gKUV9jb03YpY1v2clbP6WZ
 FvnzHodHwOGARn6/4KIfqkaFXJt88GM98susWYSb9ObIohdCWUWfdnZ
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add V4L2_CID_FLASH_LED_MODE support using the "strobe output enable"
feature of the sensor. This implements following modes:

 - V4L2_FLASH_LED_MODE_NONE, which disables the strobe output
 - V4L2_FLASH_LED_MODE_FLASH, which enables the strobe output

All values are based on the OV9281 datasheet v1.53 (january 2019) and
tested using an ov9281 VisionComponents module.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index f42e0d439753e74d14e3a3592029e48f49234927..c98ba466e9aea29baff0b13578d760bf69c958c5 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -192,6 +192,7 @@ struct ov9282_mode {
  * @exp_ctrl: Pointer to exposure control
  * @again_ctrl: Pointer to analog gain control
  * @pixel_rate: Pointer to pixel rate control
+ * @flash_led_mode: Pointer to flash led mode control
  * @vblank: Vertical blanking in lines
  * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
  * @cur_mode: Pointer to current selected sensor mode
@@ -214,6 +215,7 @@ struct ov9282 {
 		struct v4l2_ctrl *again_ctrl;
 	};
 	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *flash_led_mode;
 	u32 vblank;
 	bool noncontinuous_clock;
 	const struct ov9282_mode *cur_mode;
@@ -670,6 +672,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
 				current_val);
 }
 
+static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
+{
+	u32 current_val;
+	int ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
+				  &current_val);
+	if (ret)
+		return ret;
+
+	if (mode == V4L2_FLASH_LED_MODE_FLASH)
+		current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
+	else
+		current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
+
+	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
+				current_val);
+}
+
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -736,6 +755,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
 				       (ctrl->val + ov9282->cur_mode->width) >> 1);
 		break;
+	case V4L2_CID_FLASH_LED_MODE:
+		ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
+		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
@@ -1391,6 +1413,13 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 						OV9282_TIMING_HTS_MAX - mode->width,
 						1, hblank_min);
 
+	/* Flash/Strobe controls */
+	ov9282->flash_led_mode = v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
+							V4L2_CID_FLASH_LED_MODE,
+							V4L2_FLASH_LED_MODE_TORCH,
+							(1 << V4L2_FLASH_LED_MODE_TORCH),
+							V4L2_FLASH_LED_MODE_NONE);
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
2.47.2



