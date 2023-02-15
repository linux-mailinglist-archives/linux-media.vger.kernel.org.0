Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 695BA6987DB
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 23:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjBOWaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 17:30:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjBOWaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 17:30:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3790415545
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 14:30:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9747478;
        Wed, 15 Feb 2023 23:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676500217;
        bh=T0YSimg5smRhWKBzp2aYmt0xKy/nuFnfwJKpTYgqxuQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RNCoD1mF4kYFLQi7O5XJMhf8e/qswEAzdhbUJ8a/tHU3zSFoydF7VcLL4la93+RJz
         p8x0xuF+lrn27zD2/kfAnUPQ4u4EQvFeyTsQy01Dw43OYSC6OYDH7vnpVAYNlTOXQ6
         v4Tg4XO1Is9d1fyaBWF4D6qo5cPCj5x+r8xzGdH8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 06/15] media: i2c: imx290: Fix the pixel rate at 148.5Mpix/s
Date:   Thu, 16 Feb 2023 00:29:54 +0200
Message-Id: <20230215223003.30170-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
References: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The datasheet lists the link frequency changes between
1080p and 720p modes. This is correct that the link frequency
changes as measured on an oscilloscope.

Link frequency is not necessarily the same as pixel rate.

The datasheet gives standard configurations for 1080p and 720p
modes at a number of frame rates.
Looking at the 1080p mode it gives:
HMAX = 0x898 = 2200
VMAX = 0x465 = 1125
2200 * 1125 * 60fps = 148.5MPix/s

Looking at the 720p mode it gives:
HMAX = 0xce4 = 3300
VMAX = 0x2ee = 750
3300 * 750 * 60fps = 148.5Mpix/s

This driver currently scales the pixel rate proportionally to the
link frequency, however the above shows that this is not the
correct thing to do, and currently all frame rate and exposure
calculations give incorrect results.

Correctly report the pixel rate as being 148.5MPix/s under any
mode.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 0a77391ece9b..c0b37afd2fbe 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -107,6 +107,8 @@
 
 #define IMX290_VMAX_DEFAULT				1125
 
+#define IMX290_PIXEL_RATE				148500000
+
 /*
  * The IMX290 pixel array is organized as follows:
  *
@@ -205,7 +207,6 @@ struct imx290 {
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *link_freq;
-	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 };
@@ -669,15 +670,8 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 {
 	unsigned int hblank = mode->hmax - mode->width;
 	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
-	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode->link_freq_index];
-	u64 pixel_rate;
-
-	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = link_freq * 2 * imx290->nlanes;
-	do_div(pixel_rate, imx290_format_info(imx290, format->code)->bpp);
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
-	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, pixel_rate);
 
 	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
 	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
@@ -727,9 +721,9 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	if (imx290->link_freq)
 		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-					       V4L2_CID_PIXEL_RATE,
-					       1, INT_MAX, 1, 1);
+	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  IMX290_PIXEL_RATE, IMX290_PIXEL_RATE, 1,
+			  IMX290_PIXEL_RATE);
 
 	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-- 
Regards,

Laurent Pinchart

