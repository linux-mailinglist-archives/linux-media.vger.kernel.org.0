Return-Path: <linux-media+bounces-41453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B038BB3E8B3
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F254207D83
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E20350D41;
	Mon,  1 Sep 2025 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="khzMcds9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491C034A326;
	Mon,  1 Sep 2025 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756739147; cv=none; b=vBdJ31MnKG1kIdPMmtspPXlX0XMHGwAl31BdvvzyhN5dxw2E7+upjIf7Y0A5RkmeWu+CEvW3O71uwnbK1n12e89aH11sSxzU2+hsG/AoclsoegZKbquNYxCcHJL8h3pU/yRP3DDrkJK5W9tjwfvDx7eCuWI82v9zByfqTpkQTy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756739147; c=relaxed/simple;
	bh=zHiadu/PJkoFNn6YwHGG0Az+tad6OHewe3uLyIg6GGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZwG4DbbHS4ziSZFLt38heOMoOl9U/c1VHSV6jzfDILsR41xlPOm9t38h10XV8zHJWfzU2hYz4+xzkr/V0QYZ4wEvPHRomjtrVRD0y0ZuFyQgpVMjSLKRi7Z3McM+/m2ay1ORDCwKi4/4BCGFGG/Wu046qpNhyVHlJob1wF55SOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=khzMcds9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD33CC16AAE;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1756739146; bh=zHiadu/PJkoFNn6YwHGG0Az+tad6OHewe3uLyIg6GGY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=khzMcds9EocvGOBRIBhpjv5/Uhq+CAd+NQ40WU0JsK2E93mREuF1pGomJLoP2JtWK
	 5X3mRNsQRZG+PC1KCdXSmlZ1LSnHmkkITnbmRSsCtAeqlpi99uhfs3nqGDbeo5U6nW
	 pUfAKF5B8pZpOHuaWH7Q7+fyafgo3BujSJ3eOvzQ=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AA9CA0FFF;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 01 Sep 2025 17:05:12 +0200
Subject: [PATCH v7 07/10] media: i2c: ov9282: add strobe_duration v4l2
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250901-ov9282-flash-strobe-v7-7-d58d5a694afc@linux.dev>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
In-Reply-To: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756739145; l=3529;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=zHiadu/PJkoFNn6YwHGG0Az+tad6OHewe3uLyIg6GGY=;
 b=16+arFAFs6tUt862WUqqdOIz7Bp3nAPy/UtsL5FYgvbkTSbwZzg8uWu9c/E/s8JDG9xzMczYM
 8QWVBn19fdZCG6Uo4nFG1QD2PPA46RHFlk7XEJiwIbCq4xnO9acYGn4
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
index ff0f69f0dc3a2d0518806b9ea65c1b520b5c55fb..c405e3411daf37cf98d5af3535702f8321394af5 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -97,6 +97,10 @@
 #define OV9282_REG_MIPI_CTRL00	0x4800
 #define OV9282_GATED_CLOCK	BIT(5)
 
+/* Flash/Strobe control registers */
+#define OV9282_REG_FLASH_DURATION	0x3925
+#define OV9282_FLASH_DURATION_DEFAULT	0x0000001a
+
 /* Input clock rate */
 #define OV9282_INCLK_RATE	24000000
 
@@ -687,6 +691,25 @@ static int ov9282_set_ctrl_flash_hw_strobe_signal(struct ov9282 *ov9282, bool en
 				current_val);
 }
 
+static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
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
 	case V4L2_CID_FLASH_HW_STROBE_SIGNAL:
 		ret = ov9282_set_ctrl_flash_hw_strobe_signal(ov9282, ctrl->val);
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
 
@@ -1414,6 +1440,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	/* Flash/Strobe controls */
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_DURATION,
+			  0, 13900, 1, 8);
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
2.47.2



