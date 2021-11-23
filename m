Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 445244598D9
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbhKWAEI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbhKWADs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:48 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7C3C06175F
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:36 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so1134979wmd.1
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rDhiDTRaE38BiqhE35BpdDHZOA4cnDvmczVi9KFTNAw=;
        b=P4KYf1J15IoNmhLXLtTjqNGUPU3DyyEDHqiZewF46ETIpDZhiOVl55cAfpzYMm+LiL
         /pVqRbhysgTb/Jz6lhw/+O7yeE/6M+c2974i3XCYiRWugLsZadoC/iu9W/QRvvHFUCic
         LV2fdpySmVCJMige7Sb4NclqtK3yBTV4yN/wWdBLOYXp93Djy7yB1SvquTPofpznhnos
         5f6cKhj2Mchj/x53Nd3VIOqMx3R0Sf6fg1DWCcKknooejmNxRX/sdwoEQkt99gsBgPAL
         HEow8KvwG9QTk+zaBKIkvPGk8UgWFJfs61+tpaXoMLAh9PyQdB397SQfPjMFJBpz1VcE
         g6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rDhiDTRaE38BiqhE35BpdDHZOA4cnDvmczVi9KFTNAw=;
        b=vpMKK0FrH1CmLOgM6o+92iWEBHhKhWqG20xQMi+CApiCT9AHEMsxJtkRjxO0eJ23ec
         XaMDK6hyJjeovnsUOIPrFZf5MLTfIAcXU+O2Zl0UZmE1rF/bS99IV7vGTD9BvyvMVUIJ
         4BIGkOEYgEhEUkyJiVJcLsSzka0KzmaE8mS62Ws+IBx1+apMkAuK7k5SfzPMCjovcYUB
         xsKu4KfhUfCubyi3nsbHkgpRaYJ3sRftEYCVJzXVa8oo+U+LusqslqmdQ0sf2UHAuN6v
         IMSaZ+SmslAmpTtR7kSby/rHE/pDz9j+81Xb+vrbI59+SZjStPTy4vRQR5w75Ow223Ix
         8PsQ==
X-Gm-Message-State: AOAM532HqG+fbMwwShBZvu7BBCIRjUw0JB+UPXuiHBHo1YwUP23343At
        yLWY7sfz5RsR8SWEtCXq0EwnrASzLyQ=
X-Google-Smtp-Source: ABdhPJx3df6sNiJfCymjnVJiij52rSiMAZUtbGFwtk1iI/jmxJ5JVEZP/e1dS42BtxwXaOdi2PEY8g==
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr36045802wmg.51.1637625634826;
        Mon, 22 Nov 2021 16:00:34 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:34 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 11/17] media: i2c: Update HTS values in ov8865
Date:   Tue, 23 Nov 2021 00:00:11 +0000
Message-Id: <20211123000017.43187-12-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
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
Changes in v5: 

	- None

 drivers/media/i2c/ov8865.c | 65 +++++++-------------------------------
 1 file changed, 11 insertions(+), 54 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index f1ee0e425adf..f4a899e463de 100644
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

