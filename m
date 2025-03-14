Return-Path: <linux-media+bounces-28188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7618A60C28
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 09:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46CF63B7663
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 08:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217411EA7F7;
	Fri, 14 Mar 2025 08:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="n3tUD1yT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5051D86C6;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942205; cv=none; b=KIte9kEwnOF7cRtSGBboQCRnjZ7xH4EpifHm2kwriTwZFdqXsmdkDMC5UiaSshbqPuqQ5ac9AEJV33yiY22MWC/jM/dqKi2QwHAzwJxxm3863j4aKqAYmKPDduxA79Hvse02lBVsXEiqv1H60L8HzJZHFQKV+vEt4psK7aYbhOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942205; c=relaxed/simple;
	bh=oKJQ5VQHM2+qB3rpr3DelVSUTCUoAL8/eslJyAU327k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gq27mMrt7Fw831b/jpcX6K45hMVithUB5Jp2RM07eZgm3Fy1gIIWKqDTLab/cFCv8J9b9o5uEIIwFN0pEfxhoWaMSbM43b7hjD8/7lBPEFr8MyC9GltL5U7xYgWNx68TmyfAMvZ8OapXAIrfD6g//nNoZRbQUhATtTa6AOlk/G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=n3tUD1yT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 704B2C4CEFB;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1741942205; bh=oKJQ5VQHM2+qB3rpr3DelVSUTCUoAL8/eslJyAU327k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n3tUD1yTJlA34hDF0izudeDHU6Iz9Abf7QyVBJYtdS8ovsjNd3M5awEZkcSotGZly
	 HssR1TLlTspD27EGcSD9WDljXbXNzNTqoNLJ0eADvZRdORPxSFcz2yxtQqWdUbB0xd
	 HCKx6VTEOPs43+YSoJ57wWUTOihT/JF95kY6mgzc=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679F1C28B2F;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Fri, 14 Mar 2025 09:50:00 +0100
Subject: [PATCH v2 6/8] media: i2c: ov9282: add led_mode v4l2 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-ov9282-flash-strobe-v2-6-14d7a281342d@linux.dev>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
In-Reply-To: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741942203; l=2413;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=oKJQ5VQHM2+qB3rpr3DelVSUTCUoAL8/eslJyAU327k=;
 b=qE9sn41pFd6jSVN+OVl8ug3yNScB3kECOuSZte7+tdCE8+RwjKnIARoxCvY69mCltfTDal3v0
 78F8xm0ylNKC8YYr/pBDyKDP0NaK6uarxkrZ8zFDyIbQw/1Fsv+cUNb
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
 drivers/media/i2c/ov9282.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index f42e0d439753e74d14e3a3592029e48f49234927..35edbe1e0efb61a0e03da0ed817c4c4ec0ae9c35 100644
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



