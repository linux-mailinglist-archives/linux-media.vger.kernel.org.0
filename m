Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBDB866ACF7
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 18:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjANRSN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 12:18:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbjANRSK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 12:18:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A080AB752
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 09:18:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E070E68;
        Sat, 14 Jan 2023 18:18:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673716688;
        bh=fZcgwZ2+qwVm9Gp2ryh7Yc5kNZDjqv2s154Hvv51GPU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QS3MtMm06Xdzm+rj/HUY3JGxlfZZyMXR1Yr8zfbOqdiRmSUu94iauW5T3lnpcJMXy
         sWycTB0h7LZfYe/Jr84OsPPn9iK+qN4aeWHTz8lnUd559pFn6DQgeolysgdkuM0zRH
         gtgb5G1BO+X3LT/bxb7o1hnKUTEuWFDN6TID+BSM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 05/17] media: i2c: imx290: Pass format and mode to imx290_calc_pixel_rate()
Date:   Sat, 14 Jan 2023 19:17:50 +0200
Message-Id: <20230114171802.13878-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com>
 <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
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

Avoid accessing the imx290 current_format and current_mode fields in
imx290_calc_pixel_rate() to prepare for the removal of those fields.
Among the two callers of the function, imx290_ctrl_update() has an
explicit mode pointer already, and we can also give it a format pointer.
Use those explicitly.

While at it, inline the imx290_get_link_freq() function in
imx290_calc_pixel_rate() as it is only called there.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Drop format argument from imx290_calc_pixel_rate()
---
 drivers/media/i2c/imx290.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 4ad6eab4f2e2..8f141df74e2f 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -547,21 +547,15 @@ static int imx290_write_current_format(struct imx290 *imx290)
 	return 0;
 }
 
-static s64 imx290_get_link_freq(struct imx290 *imx290)
+static u64 imx290_calc_pixel_rate(struct imx290 *imx290,
+				  const struct v4l2_mbus_framefmt *format,
+				  const struct imx290_mode *mode)
 {
-	u8 index = imx290->current_mode->link_freq_index;
-
-	return *(imx290_link_freqs_ptr(imx290) + index);
-}
-
-static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
-{
-	s64 link_freq = imx290_get_link_freq(imx290);
-	u8 nlanes = imx290->nlanes;
+	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode->link_freq_index];
 	u64 pixel_rate;
 
 	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = link_freq * 2 * nlanes;
+	pixel_rate = link_freq * 2 * imx290->nlanes;
 	do_div(pixel_rate, imx290->bpp);
 	return pixel_rate;
 }
@@ -635,6 +629,7 @@ static const char * const imx290_test_pattern_menu[] = {
 };
 
 static void imx290_ctrl_update(struct imx290 *imx290,
+			       const struct v4l2_mbus_framefmt *format,
 			       const struct imx290_mode *mode)
 {
 	unsigned int hblank = mode->hmax - mode->width;
@@ -649,7 +644,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
 	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
-				 imx290_calc_pixel_rate(imx290));
+				 imx290_calc_pixel_rate(imx290, format, mode));
 
 	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
 	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
@@ -659,6 +654,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 {
 	struct v4l2_fwnode_device_properties props;
 	unsigned int blank;
+	u64 pixel_rate;
 	int ret;
 
 	ret = v4l2_fwnode_device_parse(imx290->dev, &props);
@@ -696,10 +692,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	if (imx290->link_freq)
 		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	pixel_rate = imx290_calc_pixel_rate(imx290, &imx290->current_format,
+					    imx290->current_mode);
 	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 					       V4L2_CID_PIXEL_RATE,
-					       1, INT_MAX, 1,
-					       imx290_calc_pixel_rate(imx290));
+					       1, INT_MAX, 1, pixel_rate);
 
 	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
@@ -920,7 +917,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 		imx290->current_mode = mode;
 		imx290->bpp = imx290_formats[i].bpp;
 
-		imx290_ctrl_update(imx290, mode);
+		imx290_ctrl_update(imx290, &fmt->format, mode);
 	}
 
 	*format = fmt->format;
-- 
Regards,

Laurent Pinchart

