Return-Path: <linux-media+bounces-48506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AB8CB1570
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 23:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EE403171657
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 22:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F8B2FB978;
	Tue,  9 Dec 2025 22:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qyBro07O"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4E92F0686;
	Tue,  9 Dec 2025 22:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320292; cv=none; b=r3BBq5E6Vm0T4cjZplnt4barFc5a4ygHyDHjZam97Z9pUdjZe45lITiPOHNecLbHwYQk+VCB9Yo6j3/j4ZYoYdh0PjAc+WKu8P7SsVKUnBzjeomHLbcRNWIAh11roOiGxWBXoTtCu1nPmOjwYjItIsT98qFzotVrnMNB8PTlAzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320292; c=relaxed/simple;
	bh=ygvVtpR0X7zyUAS2i7/ot2H6udVXFUOAiwzQzpah+74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iL/CvYUKT+e+oV50wjjmOSmHweDr0OC32an59Z+7aeLSJsSpmUys6RdbHaaVSKs1R/x159bllPthD8k8NvstB0SOrqklbjTtm9dfktzParDpJuU5dUsnbZfTfUEyX/4uc+Rz5wdJlVn4SAcldWjfB/MbDpHy64bwT2JVf3GRnn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qyBro07O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E238BC19423;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1765320291; bh=ygvVtpR0X7zyUAS2i7/ot2H6udVXFUOAiwzQzpah+74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qyBro07O1MkwlO2LlL/rCTcrIn4+6IkFP6ifYiSg03I/6opq0waBaG8jmpk5NiSr1
	 KZLrxepImOLgm8F7srFxf+Yl7rQ/YWhuzQD0PSmVeWoSfC75hsM6cFiKvGRJsoOPDn
	 Kt5/ikJ0+V97boolLLWwS2NYBCOJORHnGRgRt6sM=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DCED3B9AB;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 09 Dec 2025 23:44:40 +0100
Subject: [PATCH v10 5/8] media: i2c: ov9282: add strobe output enable v4l2
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-ov9282-flash-strobe-v10-5-0117cab82e2d@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765320290; l=2317;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=ygvVtpR0X7zyUAS2i7/ot2H6udVXFUOAiwzQzpah+74=;
 b=on0jrDyM3MHEBRW5S8YwXhXht9WNphiLjiq0nvc6skvbGxozGglTUzgL7vgDLsHDknT5N2ED0
 xwkk/nHMz/ACmXpF4Vu6BeBoPwe3+6NV75NjEwsrsnuZxb3CdgfjcRR
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add V4L2_CID_FLASH_STROBE_OE enable/disable support using the
"strobe output enable" feature of the sensor.

All values are based on the OV9281 datasheet v1.53 (january 2019) and
tested using an ov9281 VisionComponents module.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index e67cff6c30ffa..6afce803a049d 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -670,6 +670,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
 				current_val);
 }
 
+static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
+{
+	u32 current_val;
+	int ret;
+
+	ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, &current_val);
+	if (ret)
+		return ret;
+
+	if (enable)
+		current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
+	else
+		current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
+
+	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
+}
+
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -736,6 +753,9 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
 				       (ctrl->val + ov9282->cur_mode->width) >> 1);
 		break;
+	case V4L2_CID_FLASH_STROBE_OE:
+		ret = ov9282_set_ctrl_flash_strobe_oe(ov9282, ctrl->val);
+		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
@@ -1325,7 +1345,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	u32 lpfr;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
 	if (ret)
 		return ret;
 
@@ -1390,6 +1410,10 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 						OV9282_TIMING_HTS_MAX - mode->width,
 						1, hblank_min);
 
+	/* Flash/Strobe controls */
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
+			  V4L2_CID_FLASH_STROBE_OE, 0, 1, 1, 0);
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
2.47.3



