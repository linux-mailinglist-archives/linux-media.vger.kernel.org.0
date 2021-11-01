Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1149744119C
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhKAAOI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbhKAAOH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:07 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB79C061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:34 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id b12so21334662wrh.4
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=esHTjxcAIpT5/NpHLc1ZVkLS0+NllgitPYn2F2gHVFg=;
        b=IB0VhCX1qVVKYyk+Asa6dcl+O4LTRKba/0lO/LI7wuu8/Xd6ufTG1ZIMgHl5gEjd//
         eYP4e8AAWPjZ1EVR1ZLp/wKgIFhYcbnJxnckB6T8DJ2qN9AKCci3cyQRz/f5dW3G2kuH
         SZTtOiwxy86ztMtsqv9iy1dhNMD4CGs/lkdGWSnHUb1tmR9uWg7Yjhb4rsi7d9/Lq2n7
         N9boNbRTA56zRBa5y5PLAOZnOFL3hLykHlE8i9hEamus6/8uKdVMVVM5ADXL10bQeysQ
         /F+mRmsSh1UWuVCjfLbmqxoZe5MOMiHttrup83TfD7fIu5QLkYA1dEVFxXZITa+BZY/n
         ZtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=esHTjxcAIpT5/NpHLc1ZVkLS0+NllgitPYn2F2gHVFg=;
        b=oKxYLhRShh/RKviYDDmJ3qnrsg2cqklpdiMOC6zTymYxHd5Ye7buEwZRJMnJcYtmlZ
         l6xnZU0j14B4bC0bu/IDj+a+RTw/HNWatkecMogbamgi1B2hmcn0xiNqnpXpotf1mXRe
         YfN5IH7E94ID+/McOukmwLn+SfZic3JMYlNMMVGTGL1gffZFxx91ba5rsCSmy+59DFmM
         wSpPw5bUFjVcMf8HVkT5x3q1q8SrEt9UZSqZwhhoFq+7grYNMw/t8cAW+9CKt84qQ4Fr
         5KljBdZDDE7tKrJN2AjoucPs2L89cHjoXCBO3YYmSuYIJwcHglj6p07co1tih1Zqj3JW
         BlVQ==
X-Gm-Message-State: AOAM532/kIhSrpTN68Kis5I33O+vmrY7Hra/uw0nPhusZLzEhhEG3YWI
        yKu91z0UbL3O0kfWpVy7Y08=
X-Google-Smtp-Source: ABdhPJzP9BW106Nuzw+ZCHJ5ETA5IjL4tFttw9eT4ob4ngnSVgnizp4YwWoIj/zdbp45D8YybCKKsw==
X-Received: by 2002:adf:f904:: with SMTP id b4mr33798525wrr.403.1635725493543;
        Sun, 31 Oct 2021 17:11:33 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:33 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 09/16] media: i2c: Update HTS values in ov8865
Date:   Mon,  1 Nov 2021 00:11:12 +0000
Message-Id: <20211101001119.46056-10-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
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
interval based on the current mode and the vblank and hblank settings.

The implementation of the .enum_frame_interval() callback is no longer
suitable since the possible frame rate is now a continuous range depending
on the vblank control setting, so remove that callback entirely.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 65 +++++++-------------------------------
 1 file changed, 11 insertions(+), 54 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 4b18cc80f985..1b8674152750 100644
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

