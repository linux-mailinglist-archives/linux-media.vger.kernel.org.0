Return-Path: <linux-media+bounces-47523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 33649C758BD
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 18:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B482734A34A
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 17:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A505D372AA3;
	Thu, 20 Nov 2025 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h+f48USO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678936CE10;
	Thu, 20 Nov 2025 17:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658270; cv=none; b=R5xQFahbg1egJH1EyBLEYdqURDlDRlnmc0RbXlUI+or2KRzIDZYc27/4aMd0GQEZ15R8R8GtOpZgKI16P2YToaPv7RkBlZKTSF5L5jO4PgttXkrFYAPXu0bnuP8rB5aFkEUMnS4HJOJLyYTYC4xUkQRvlJWl0BZg3OXbrq9G61w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658270; c=relaxed/simple;
	bh=/QE3iIievH2JfYAOnD9AGXz516t94bu88M9zf7e76u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HDerR9PqsDUnh8H0+ZHzQT30wSk9kb7a/IWrSHSm1lkiTf8WfkSDlhiTBpHYoSwARJk5K2MGAoSQubpai3E6+TDv945pvY1RO+p55ZiFdhduOe/DsSRnE6B5MFgOEuKJzKdvJV5dKATrwd3/WNOQa7NItbf2FnFyB9uzoyTXKUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h+f48USO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3709BC19421;
	Thu, 20 Nov 2025 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1763658270; bh=/QE3iIievH2JfYAOnD9AGXz516t94bu88M9zf7e76u8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h+f48USONloultW8TGoY0RJFm6wwMXKTPK2+L4myvHc5iSG0L4vznWkLYGJ2ojYZi
	 qg1498yi73X3Im0FXlpxpUJQGLggLTIepF00nZ6t8kEA+bsno0haR7QuLlVRL5+0Lc
	 UF2uDV8kJ/wMpaDIGnNcjdHE+LxMUQK5lEqRnSPg=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC47CF9C6F;
	Thu, 20 Nov 2025 17:04:30 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Thu, 20 Nov 2025 18:04:27 +0100
Subject: [PATCH v9 7/8] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251120-ov9282-flash-strobe-v9-7-6c9e3a4301d7@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763658268; l=3724;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=/QE3iIievH2JfYAOnD9AGXz516t94bu88M9zf7e76u8=;
 b=IenrCX+qe6VwATgYXmlAB2f+uwXpAmN7+tpKaZeFDEFs4FT1PqjK8LTmMJUUnyZ+gtsU+VKaY
 +iIy981Qxu8CrtK6lYtzDUidEzugT3/DZKprz6cKv+GfHJwD86yD1IN
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
index 26296dc1d1b9..823fde579e07 100644
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
@@ -798,9 +820,36 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
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



