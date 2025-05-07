Return-Path: <linux-media+bounces-31930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4D9AAD911
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFE207B2959
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53BA2236FC;
	Wed,  7 May 2025 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RWJwmAyH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803DD221D88;
	Wed,  7 May 2025 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604342; cv=none; b=PsmZPOr+ypWuQ6qvhw6p9bd3OeGtlsTGUePh77XtzVs5Q+YiiCowCOkCzqECzmCbLewkWm8wGDitRqVfscEhy7MzJM+Gvshek34N5sp9g9irLahbo3C1CZ9FHPUcH38XnFwzJ95ujNWOvhbSjvBljSeuzWw/T1/hQ4uKZ/aVoqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604342; c=relaxed/simple;
	bh=vj4AZ2VwKF/zDloCshyajTedmued0DDmjMCD6CM2Ep8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDDHuzoFmuSBXjEEIcOD+x/qquBh3i5WRdncvpicnRgKiRwdH7zQ+DSXIFHknZtIF0966wY4GimfSALr3giSeO8H0s08Dji/XFJVhdz4ht/ViVxVaO2pyACO7CeaEZCJn19ia/VZKTz8pSdT87pzyJVuIXZYCjhmO7SBUZutlaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RWJwmAyH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D81D6C4CEF9;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1746604341; bh=vj4AZ2VwKF/zDloCshyajTedmued0DDmjMCD6CM2Ep8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RWJwmAyHSypXEoWtaUIf+ITOOZaMNGAjSSW8czKmr527r1PaUB0vlWz7FVgvcr5q/
	 erep/EcEzOYvqFhzQXU99haEzejVptUGjpFnG9BCKyRxqlfFnNcAXOJkASKtPy8tZ8
	 /cLFlWR5wZUBJTfjXChIuIwdJWxI7aWYqiMnmCqY=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BF4C3ABC0;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 07 May 2025 09:51:36 +0200
Subject: [PATCH v4 07/10] media: i2c: ov9282: add led_mode v4l2 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-ov9282-flash-strobe-v4-7-72b299c1b7c9@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746604340; l=2663;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=vj4AZ2VwKF/zDloCshyajTedmued0DDmjMCD6CM2Ep8=;
 b=tfNHFWJ8FRso9WuMaIOv3IfWaC05MnFKIpbuE4ZpjAaOTDPPx1INoUgTPoq6cDgHZNkmZAMck
 PLCcl5XCqQqBv2YXrZf+j0PSdq/THm3/pAnJmtgONVZFUdHA6+qg8bq
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
 drivers/media/i2c/ov9282.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index f42e0d439753e74d14e3a3592029e48f49234927..b6de96997426f7225a061bfdc841aa062e8d0891 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -670,6 +670,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
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
@@ -736,6 +753,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
 				       (ctrl->val + ov9282->cur_mode->width) >> 1);
 		break;
+	case V4L2_CID_FLASH_LED_MODE:
+		ret = ov9282_set_ctrl_flash_led_mode(ov9282, ctrl->val);
+		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
@@ -1326,7 +1346,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	u32 lpfr;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
 	if (ret)
 		return ret;
 
@@ -1391,6 +1411,13 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 						OV9282_TIMING_HTS_MAX - mode->width,
 						1, hblank_min);
 
+	/* Flash/Strobe controls */
+	v4l2_ctrl_new_std_menu(ctrl_hdlr, &ov9282_ctrl_ops,
+			       V4L2_CID_FLASH_LED_MODE,
+			       V4L2_FLASH_LED_MODE_TORCH,
+			       (1 << V4L2_FLASH_LED_MODE_TORCH),
+			       V4L2_FLASH_LED_MODE_NONE);
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
2.47.2



