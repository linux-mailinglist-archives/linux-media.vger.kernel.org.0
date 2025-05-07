Return-Path: <linux-media+bounces-31927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AF2AAD90B
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F91E50464E
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04642236F0;
	Wed,  7 May 2025 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ShMWxKV9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D370221708;
	Wed,  7 May 2025 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604342; cv=none; b=FRkGtFsGBYgRVn1Gv9rzr2nrIbkdTBXMGNadamLxlNdVQN0IO+tzbltJbHL6huL91y74TKfvPirpcCltQ37u+8aStqYXFW2B+E7CZ4K7hZXxceTd0NRrSVhKaCgTBFurSN4BteQ1jy4xebS6JSM9U7hvxWe3qRvVRTqQHUEoifQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604342; c=relaxed/simple;
	bh=u2k9w+GukQmHB16zuirE+3M5ybc3Bh0/CkI9yc+9KRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvlDi515/sokttxdzO3oE2oeSAG9w1wE+1C+ubEf5ihYex43L6U240aEu3ALXd1EqXo4vsbe4wOWJu3WLWYjzrrvdwZm6caXYikoFR4yIdHdmRVxxciQQ12KAq7LovCZbvoD/py5JJadTTvYva3mHe5lzdwcdPL38cR9sjdeYAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ShMWxKV9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03B2DC116B1;
	Wed,  7 May 2025 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1746604342; bh=u2k9w+GukQmHB16zuirE+3M5ybc3Bh0/CkI9yc+9KRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ShMWxKV9AI5rOpsPspKoLO+DUIOItMSYj2ecYzesT3PwYi0AS+roJRtrxp1Gi6Jjq
	 hY3Oe871ZK91Iy7R4hNtZ+f9UZ1jpQjjvO6Rm+PpNV3HRinNLGM/k2sNg8dShec8DB
	 isc/Ax7x49IWLNGQg6E3npyQSxysh8FIb5hOZRMY=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25D3C3ABC0;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 07 May 2025 09:51:39 +0200
Subject: [PATCH v4 10/10] media: i2c: ov9282: implement try_ctrl for
 strobe_duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250507-ov9282-flash-strobe-v4-10-72b299c1b7c9@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746604340; l=3563;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=u2k9w+GukQmHB16zuirE+3M5ybc3Bh0/CkI9yc+9KRw=;
 b=N5Qmr+jFg9FjDlbZPon+ZQts18zYI0WCVHVozEDdHbQTS+N8S4mLLpcHEynAYMyRxvZCfOkkx
 sv0W2fUIVQdDc7j/UkTO8T9vZ5WoKZGXuomklIuDUEcAj9TxglnjqqO
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
 drivers/media/i2c/ov9282.c | 56 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 09d522d5977ec6fb82028ddb6015f05c9328191d..f75882dcb73bea0e00e2cb37ffc19ec3c3a8b126 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -128,6 +128,8 @@
 #define OV9282_REG_MIN		0x00
 #define OV9282_REG_MAX		0xfffff
 
+#define OV9282_STROBE_SPAN_FACTOR	192
+
 static const char * const ov9282_supply_names[] = {
 	"avdd",		/* Analog power */
 	"dovdd",	/* Digital I/O power */
@@ -691,7 +693,7 @@ static int ov9282_set_ctrl_flash_led_mode(struct ov9282 *ov9282, int mode)
 				current_val);
 }
 
-static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
+static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
 {
 	/*
 	 * Calculate "strobe_frame_span" increments from a given value (µs).
@@ -702,7 +704,31 @@ static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
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
+	 * As the calculation in ov9282_us_to_flash_duration uses an integer
+	 * divison calculate in ns here to get more precision. Then check if
+	 * we need to compensate that divison by incrementing the µs result.
+	 */
+	u32 frame_width = ov9282->cur_mode->width + ov9282->hblank_ctrl->val;
+	u64 ns = value * 1000 * frame_width / OV9282_STROBE_SPAN_FACTOR;
+	u32 us = ns / 1000;
+	u32 remainder = ns % 1000;
+
+	if (remainder > 0)
+		us++;
+	return us;
+}
+
+static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, int value)
+{
+	u32 val = ov9282_us_to_flash_duration(ov9282, value);
 
 	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION, 1, (val >> 24) & 0xff);
 	ov9282_write_reg(ov9282, OV9282_REG_FLASH_DURATION + 1, 1, (val >> 16) & 0xff);
@@ -792,9 +818,35 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
+static int ov9282_try_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov9282 *ov9282 =
+		container_of(ctrl->handler, struct ov9282, ctrl_handler);
+
+	if (ctrl->id == V4L2_CID_FLASH_DURATION) {
+		u32 fd = ov9282_us_to_flash_duration(ov9282, ctrl->val);
+		u32 us = ctrl->val;
+		u32 us0 = ov9282_flash_duration_to_us(ov9282, fd);
+		u32 us1 = ov9282_flash_duration_to_us(ov9282, (fd + 1));
+
+		if ((us1 - us) < (us - us0))
+			ctrl->val = us1;
+		else
+			ctrl->val = us0;
+
+		if (us != ctrl->val) {
+			dev_dbg(ov9282->dev, "using next valid strobe_duration %u instead of %u\n",
+				ctrl->val, us);
+		}
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
2.47.2



