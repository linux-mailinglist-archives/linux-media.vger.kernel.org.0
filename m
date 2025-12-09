Return-Path: <linux-media+bounces-48505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38475CB1573
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 23:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71FE531749C2
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 22:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B601B2FBDE6;
	Tue,  9 Dec 2025 22:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u5uJ7N8p"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4772F0678;
	Tue,  9 Dec 2025 22:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320292; cv=none; b=RMdrjYpbFn36sPE62epur0f5QxYQABvM8os8d1In8+AL45h116uvgZ7JXqJOwClxCAkN6mFOnNHzQ3eHz3vl4D+bffje0GVKKaxsCVa5v3Uw3cLURwoK5exjWrqwgIUJ6czsK2QXF7ruJjQry9KhuIw0zUPgfOpRoqd3uw9Oqfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320292; c=relaxed/simple;
	bh=jWwqpd7yB+Zf99f0iolQPDAOHTF2P4bty1r/d+o0QaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6RM/iK+nXTUATxfnHDFnKoXBPoXZ0BDqL3vdsvMTqQto/WG42LixRnhy3y+gIjiClKQDDrfuff+CvjLboeabbGIIPw/dlttnMPBs6TzmOilAYN3HRwfKWC7Yllil8Ay6sEh5mXhWAquBgHJjmGKDDySzSBXVFh1B0YyQMQRtDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u5uJ7N8p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1369DC113D0;
	Tue,  9 Dec 2025 22:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1765320292; bh=jWwqpd7yB+Zf99f0iolQPDAOHTF2P4bty1r/d+o0QaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u5uJ7N8pq7tnI2tHxVWCltfibx0HK7uvOtMwgenZIjtII3keh9hr8PQ1QnGyxGY/6
	 CTMGrqfz9CzGJLUGrk6+JEVmy/ZfPlfXj5cnIKlp4Mned8pwcGsdX9+xhwz6kGP5/Q
	 7q8sJ23rHUG3cUOyR8tPjj/veIyRD2GxXd0ZlAtY=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFB5D3B9AA;
	Tue,  9 Dec 2025 22:44:52 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 09 Dec 2025 23:44:42 +0100
Subject: [PATCH v10 7/8] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251209-ov9282-flash-strobe-v10-7-0117cab82e2d@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765320290; l=3726;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=jWwqpd7yB+Zf99f0iolQPDAOHTF2P4bty1r/d+o0QaA=;
 b=VsOIi3v+zyiG1c2HOH/rzXYv3TZg74kMGWq0MbE67LiYgAyt0HdSAId+8w2YyLRS+R1vHBUk/
 dTIOD/a0Y0VA+ZSvW0o8mv8C7K9aiDU0WzLdDVoJCf5mhRX0rwIFALg
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

As the granularity of the hardware supported values is lower than the
control value, implement a try_ctrl() function for
V4L2_CID_FLASH_DURATION. This function calculates the nearest possible
µs strobe duration for the given value and returns it back to the
caller.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/i2c/ov9282.c | 55 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 790d421157e54..4c25b3e11afc0 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -128,6 +129,8 @@
 #define OV9282_REG_MIN		0x00
 #define OV9282_REG_MAX		0xfffff
 
+#define OV9282_STROBE_SPAN_FACTOR	192
+
 static const char * const ov9282_supply_names[] = {
 	"avdd",		/* Analog power */
 	"dovdd",	/* Digital I/O power */
@@ -691,9 +694,8 @@ static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
 	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
 }
 
-static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
+static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
 {
-	int ret;
 	/*
 	 * Calculate "strobe_frame_span" increments from a given value (µs).
 	 * This is quite tricky as "The step width of shift and span is
@@ -703,7 +705,27 @@ static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
 	 * The formula below is interpolated from different modes/framerates
 	 * and should work quite well for most settings.
 	 */
-	u32 val = value * 192 / (ov9282->cur_mode->width + ov9282->hblank_ctrl->val);
+	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
+
+	return value * OV9282_STROBE_SPAN_FACTOR / frame_width;
+}
+
+static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
+{
+	/*
+	 * Calculate back to microseconds from "strobe_frame_span" increments.
+	 * As the calculation in ov9282_us_to_flash_duration uses an integer
+	 * divison round up here.
+	 */
+	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
+
+	return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
+}
+
+static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
+{
+	int ret;
+	u32 val = ov9282_us_to_flash_duration(ov9282, value);
 
 	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN, 1,
 			       (val >> 24) & 0xff);
@@ -807,9 +829,36 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
+static int ov9282_try_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov9282 *ov9282 =
+		container_of_const(ctrl->handler, struct ov9282, ctrl_handler);
+
+	if (ctrl->id == V4L2_CID_FLASH_DURATION) {
+		u32 us = ctrl->val;
+		u32 fd = ov9282_us_to_flash_duration(ov9282, us);
+
+		/* get nearest strobe_duration value */
+		u32 us0 = ov9282_flash_duration_to_us(ov9282, fd);
+		u32 us1 = ov9282_flash_duration_to_us(ov9282, fd + 1);
+
+		if (abs(us1 - us) < abs(us - us0))
+			ctrl->val = us1;
+		else
+			ctrl->val = us0;
+
+		if (us != ctrl->val)
+			dev_dbg(ov9282->dev, "using next valid strobe_duration %u instead of %u\n",
+				ctrl->val, us);
+	}
+
+	return 0;
+}
+
 /* V4l2 subdevice control ops*/
 static const struct v4l2_ctrl_ops ov9282_ctrl_ops = {
 	.s_ctrl = ov9282_set_ctrl,
+	.try_ctrl = ov9282_try_ctrl,
 };
 
 /**

-- 
2.47.3



