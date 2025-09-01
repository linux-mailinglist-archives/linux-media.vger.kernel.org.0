Return-Path: <linux-media+bounces-41454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3780DB3E8B1
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1475207A3E
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D2B350858;
	Mon,  1 Sep 2025 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R8Tw6lqG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C6034AAE1;
	Mon,  1 Sep 2025 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756739147; cv=none; b=P+YflUFG+dGwqGm0/T/JTTbyA8v7lan01/whY3TUI1VobhNi6nSXihIM2px+FWWHEAWtPScqmkP2z610UCB4H0470phhW4V186wCcS/MVrfHZEK9ClHZbl3tdnd4ibhTcqSGVX6faLFfVoFaAwVNpsxidX2hzwj/6thN2baTW9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756739147; c=relaxed/simple;
	bh=DVb2HLHwrfJtO//bc3VRsb0hyCqNgQp8x5qpbcne0Ys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDn4uSqgH/UGRNYlE9wDLJOPsXxqg6TkKV+AzLCW/aCvA2wWejXk2hcIGJA/oKwdQVfRd7LYz1NFGZl6kPXYdz+4Sg0qjYLJ192Mz66DoVOsKBtu71gVUswnmQanDT/4Om9E4Y/l7jy8fP3Z80LdBnq+sVeaTpL1ED07QwREqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R8Tw6lqG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5050C113D0;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1756739146; bh=DVb2HLHwrfJtO//bc3VRsb0hyCqNgQp8x5qpbcne0Ys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R8Tw6lqGFzNHrKVUp66+BSI+2B+ISF4CotLXzyM8JxwHe+emYHoBAkVxmErJadVyM
	 1oM92vj8RCqHaF7UpUqDWdTX94+i8SBr2jVTtxy5F8JhW9NR2IhPW3sQCqZh1bcNnL
	 YXRN32w4lDUGR6dNUa4IgS8zTMZ7KmOKLTeDWS/o=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98C9CA1000;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 01 Sep 2025 17:05:11 +0200
Subject: [PATCH v7 06/10] media: i2c: ov9282: add hardware strobe signal
 v4l2 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-ov9282-flash-strobe-v7-6-d58d5a694afc@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756739145; l=2400;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=DVb2HLHwrfJtO//bc3VRsb0hyCqNgQp8x5qpbcne0Ys=;
 b=NoIxg5UUJoAjBg1+tSFc7WCbYqpk+kD72PTLB9X7/WdlNyPPuPoJsE27JX1uokA/XflaX17H8
 XFfEGcSLdYUBjACmoyf5ePKZHjlFWUKaTIpuW7v3vGf1kLslXG8cKh2
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add V4L2_CID_FLASH_HW_STROBE_SIGNAL enable/disable support using the
"strobe output enable" feature of the sensor.

All values are based on the OV9281 datasheet v1.53 (january 2019) and
tested using an ov9281 VisionComponents module.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index f42e0d439753e74d14e3a3592029e48f49234927..ff0f69f0dc3a2d0518806b9ea65c1b520b5c55fb 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -670,6 +670,23 @@ static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
 				current_val);
 }
 
+static int ov9282_set_ctrl_flash_hw_strobe_signal(struct ov9282 *ov9282, bool enable)
+{
+	u32 current_val;
+	int ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1,
+				  &current_val);
+	if (ret)
+		return ret;
+
+	if (enable)
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
+	case V4L2_CID_FLASH_HW_STROBE_SIGNAL:
+		ret = ov9282_set_ctrl_flash_hw_strobe_signal(ov9282, ctrl->val);
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
 
@@ -1391,6 +1411,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 						OV9282_TIMING_HTS_MAX - mode->width,
 						1, hblank_min);
 
+	/* Flash/Strobe controls */
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_FLASH_HW_STROBE_SIGNAL, 0, 1, 1, 0);
+
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
 		/* Failure sets ctrl_hdlr->error, which we check afterwards anyway */

-- 
2.47.2



