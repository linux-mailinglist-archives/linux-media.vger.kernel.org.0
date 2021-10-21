Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 201BA436CEE
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbhJUVqW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbhJUVqV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:21 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B5AC061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:05 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id p21so961412wmq.1
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wMW/murp3nNoMigJuEdrF8lzU6nIsdKWf9OT7JgAy/U=;
        b=JRaTyB8oKXifciAGtdPMNZ5wV+QKNcS+hLK2fvfmO41IXUbIFNkguEVureEidaOkxL
         rZG+FfrGbCZ/EMFZPSp53AXgOApITAVpwDVZEBACI9hbkfoETx5EmqLY/7YZGxVBl54Q
         jcjmQ73Tfwc5RJfsSx3Tf9IZx7Rzp/SLuwYdb8TBg9hONTXvHDiOi2VWQ/8UXwANcVNt
         WCIUt59wOeRnlFZ3ba0D+PfvK6Vi+pN9WAl4gjWkqFpv4SSZMjdlZfxHuhn/S8+oEhT4
         E9Qan1cffsu5JP1nOMYdLoI3zSTvpl9QgWX0sE32McMZn0V257vKUsdI9sqQfpRS0r3I
         M2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wMW/murp3nNoMigJuEdrF8lzU6nIsdKWf9OT7JgAy/U=;
        b=RF6dF35xLXzNsRF1oiJu1fFMRHHDxGZYxqMkXk1nyMrnhIQYy4o01sH90kHactN69a
         6n1AsFHwjBBWQMoy1wEkvR2G+WEtrX5xm2QjjVFBGPRXAcd6R/ssvki3PeU26//EFNgK
         0Y72BVDA3NlCz88zpGm0XF7asveQF7J1NsV5qZpDq0VvjBMFni64LUOu7VZbSOM3F+RM
         RpykgiWhJ4qBbkxyqq3FXB+KIGWg1L0NyGbnyPKtSi9YfYNlk/XMX/lmnbxudwyCT5AK
         Fkc6xMDZEWSDlxj9P8oo+xwUm/3jPmjsCQBBwG7iKibCI6iHGu04d6tIyVJTDT8IX9Ol
         RjqA==
X-Gm-Message-State: AOAM5314jXqbSE9U9aYaQsSJ1ZaVh7Uqt1NWRl3KuA7SL/rbMkq60b9D
        aKpElk+J0FdZs78EiounoaOwhoZAYX8=
X-Google-Smtp-Source: ABdhPJyF2yBXM53gavak69XhmrzPVlhijJJvL0+BYKqaItzjrcq+WtDTOXWTfdfEI4a3UFNEJWrOqA==
X-Received: by 2002:a05:600c:35d0:: with SMTP id r16mr23751586wmq.97.1634852643600;
        Thu, 21 Oct 2021 14:44:03 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:44:03 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 09/16] media: i2c: Update HTS values in ov8865
Date:   Thu, 21 Oct 2021 22:43:24 +0100
Message-Id: <20211021214331.1188787-10-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The HTS values for some of the modes in the ov8865 driver are a bit
unusual, coming in lower than the output_size_x is set to. It seems
like they might be calculated to fit the desired framerate into a
configuration with just two data lanes. To bring this more in line
with expected behaviour, raise the HTS values above the output_size_x.

The corollary of that change is that the hardcoded frame intervals
against the modes no longer make sense, so remove those entirely.
Update the .g/s_frame_interval() callbacks to calculate the frame
interval based on the current mode and the vblank and hblank settings
plus the number of data lanes detected from firmware.

The implementation of the .enum_frame_interval() callback is no longer
suitable since the possible frame rate is now a continuous range depending
on the vblank control setting, so remove that callback entirely.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- Patch introduced

 drivers/media/i2c/ov8865.c | 65 +++++++-------------------------------
 1 file changed, 11 insertions(+), 54 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 3945883a2ed7..dccbc23afd2f 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -659,8 +659,6 @@ struct ov8865_mode {
 	unsigned int blc_anchor_right_start;
 	unsigned int blc_anchor_right_end;
 
-	struct v4l2_fract frame_interval;
-
 	bool pll2_binning;
 
 	const struct ov8865_register_value *register_values;
@@ -964,7 +962,7 @@ static const struct ov8865_mode ov8865_modes[] = {
 	{
 		/* Horizontal */
 		.output_size_x			= 3264,
-		.hts				= 1944,
+		.hts				= 3888,
 
 		/* Vertical */
 		.output_size_y			= 2448,
@@ -1003,9 +1001,6 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.blc_anchor_right_start		= 1984,
 		.blc_anchor_right_end		= 2239,
 
-		/* Frame Interval */
-		.frame_interval			= { 1, 30 },
-
 		/* PLL */
 		.pll2_binning			= false,
 
@@ -1018,11 +1013,11 @@ static const struct ov8865_mode ov8865_modes[] = {
 	{
 		/* Horizontal */
 		.output_size_x			= 3264,
-		.hts				= 2582,
+		.hts				= 3888,
 
 		/* Vertical */
 		.output_size_y			= 1836,
-		.vts				= 2002,
+		.vts				= 2470,
 
 		.size_auto			= true,
 		.size_auto_boundary_x		= 8,
@@ -1057,9 +1052,6 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.blc_anchor_right_start		= 1984,
 		.blc_anchor_right_end		= 2239,
 
-		/* Frame Interval */
-		.frame_interval			= { 1, 30 },
-
 		/* PLL */
 		.pll2_binning			= false,
 
@@ -1115,9 +1107,6 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.blc_anchor_right_start		= 992,
 		.blc_anchor_right_end		= 1119,
 
-		/* Frame Interval */
-		.frame_interval			= { 1, 30 },
-
 		/* PLL */
 		.pll2_binning			= true,
 
@@ -1179,9 +1168,6 @@ static const struct ov8865_mode ov8865_modes[] = {
 		.blc_anchor_right_start		= 992,
 		.blc_anchor_right_end		= 1119,
 
-		/* Frame Interval */
-		.frame_interval			= { 1, 90 },
-
 		/* PLL */
 		.pll2_binning			= true,
 
@@ -2628,11 +2614,18 @@ static int ov8865_g_frame_interval(struct v4l2_subdev *subdev,
 {
 	struct ov8865_sensor *sensor = ov8865_subdev_sensor(subdev);
 	const struct ov8865_mode *mode;
+	unsigned int framesize;
+	unsigned int fps;
 
 	mutex_lock(&sensor->mutex);
 
 	mode = sensor->state.mode;
-	interval->interval = mode->frame_interval;
+	framesize = mode->hts * (mode->output_size_y +
+				 sensor->ctrls.vblank->val);
+	fps = DIV_ROUND_CLOSEST(sensor->ctrls.pixel_rate->val, framesize);
+
+	interval->interval.numerator = 1;
+	interval->interval.denominator = fps;
 
 	mutex_unlock(&sensor->mutex);
 
@@ -2777,41 +2770,6 @@ static int ov8865_enum_frame_size(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int ov8865_enum_frame_interval(struct v4l2_subdev *subdev,
-				      struct v4l2_subdev_state *sd_state,
-				      struct v4l2_subdev_frame_interval_enum *interval_enum)
-{
-	const struct ov8865_mode *mode = NULL;
-	unsigned int mode_index;
-	unsigned int interval_index;
-
-	if (interval_enum->index > 0)
-		return -EINVAL;
-	/*
-	 * Multiple modes with the same dimensions may have different frame
-	 * intervals, so look up each relevant mode.
-	 */
-	for (mode_index = 0, interval_index = 0;
-	     mode_index < ARRAY_SIZE(ov8865_modes); mode_index++) {
-		mode = &ov8865_modes[mode_index];
-
-		if (mode->output_size_x == interval_enum->width &&
-		    mode->output_size_y == interval_enum->height) {
-			if (interval_index == interval_enum->index)
-				break;
-
-			interval_index++;
-		}
-	}
-
-	if (mode_index == ARRAY_SIZE(ov8865_modes))
-		return -EINVAL;
-
-	interval_enum->interval = mode->frame_interval;
-
-	return 0;
-}
-
 static void
 __ov8865_get_pad_crop(struct ov8865_sensor *sensor,
 		      struct v4l2_subdev_state *state, unsigned int pad,
@@ -2870,7 +2828,6 @@ static const struct v4l2_subdev_pad_ops ov8865_subdev_pad_ops = {
 	.get_fmt		= ov8865_get_fmt,
 	.set_fmt		= ov8865_set_fmt,
 	.enum_frame_size	= ov8865_enum_frame_size,
-	.enum_frame_interval	= ov8865_enum_frame_interval,
 	.get_selection		= ov8865_get_selection,
 	.set_selection		= ov8865_get_selection,
 };
-- 
2.25.1

