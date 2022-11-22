Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CED6D634A14
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 23:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235177AbiKVWdT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 17:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235195AbiKVWdS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 17:33:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655F59DBA6
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 14:33:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3EFD182C;
        Tue, 22 Nov 2022 23:33:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669156395;
        bh=4Juaak0okIgCZ3NdCLHP/wrX4OzZV6APJbVhMxmQ/eU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gs5VHFZ0YRpY32J1pmNSootW1L2DewJXjn47Fd8oIm/alM35wOhCtgLGZuMXr85rt
         cOdbWkSAHXR0MmhWewH1svmhmkEbn1XeayBFWd0uRlL0q5gl/DhVEHXZP9nUsSKStR
         ARa3KPaN25eKDBteG/PWVNcYXlHPfKKkAzJT8tgA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v1 06/15] media: i2c: imx290: Compute pixel rate and blanking in one place
Date:   Wed, 23 Nov 2022 00:32:41 +0200
Message-Id: <20221122223250.21233-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
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

The hblank, vblank, pixel rate and link frequency values and limits are
currently computed when creating controls, in imx290_ctrl_init(), and
updated in imx290_ctrl_update(). This duplicates the logic in different
places. Simplify the code by setting the control values and limits to
hardcoded values when creating the controls, and call
imx290_ctrl_update() to then update them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 46 +++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index a676ce93f96e..135ed55592a1 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -547,19 +547,6 @@ static int imx290_write_current_format(struct imx290 *imx290)
 	return 0;
 }
 
-static u64 imx290_calc_pixel_rate(struct imx290 *imx290,
-				  const struct v4l2_mbus_framefmt *format,
-				  const struct imx290_mode *mode)
-{
-	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode->link_freq_index];
-	u64 pixel_rate;
-
-	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = link_freq * 2 * imx290->nlanes;
-	do_div(pixel_rate, imx290->bpp);
-	return pixel_rate;
-}
-
 /* ----------------------------------------------------------------------------
  * Controls
  */
@@ -634,10 +621,15 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 {
 	unsigned int hblank = mode->hmax - mode->width;
 	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
+	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode->link_freq_index];
+	u64 pixel_rate;
+
+	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
+	pixel_rate = link_freq * 2 * imx290->nlanes;
+	do_div(pixel_rate, imx290->bpp);
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
-	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
-				 imx290_calc_pixel_rate(imx290, format, mode));
+	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, pixel_rate);
 
 	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
 	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
@@ -646,8 +638,6 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 static int imx290_ctrl_init(struct imx290 *imx290)
 {
 	struct v4l2_fwnode_device_properties props;
-	unsigned int blank;
-	u64 pixel_rate;
 	int ret;
 
 	ret = v4l2_fwnode_device_parse(imx290->dev, &props);
@@ -677,6 +667,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
 			  IMX290_VMAX_DEFAULT - 2);
 
+	/*
+	 * Set the link frequency, pixel rate, horizontal blanking and vertical
+	 * blanking it hardcoded values, they will be updated by
+	 * imx290_ctrl_update().
+	 */
 	imx290->link_freq =
 		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
 				       V4L2_CID_LINK_FREQ,
@@ -685,28 +680,22 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	if (imx290->link_freq)
 		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate = imx290_calc_pixel_rate(imx290, &imx290->current_format,
-					    imx290->current_mode);
 	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 					       V4L2_CID_PIXEL_RATE,
-					       1, INT_MAX, 1, pixel_rate);
+					       1, INT_MAX, 1, 1);
 
 	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
 				     0, 0, imx290_test_pattern_menu);
 
-	blank = imx290->current_mode->hmax - imx290->current_mode->width;
 	imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-					   V4L2_CID_HBLANK, blank, blank, 1,
-					   blank);
+					   V4L2_CID_HBLANK, 1, 1, 1, 1);
 	if (imx290->hblank)
 		imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	blank = IMX290_VMAX_DEFAULT - imx290->current_mode->height;
 	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-					   V4L2_CID_VBLANK, blank, blank, 1,
-					   blank);
+					   V4L2_CID_VBLANK, 1, 1, 1, 1);
 	if (imx290->vblank)
 		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
@@ -721,6 +710,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 		return ret;
 	}
 
+	mutex_lock(imx290->ctrls.lock);
+	imx290_ctrl_update(imx290, &imx290->current_format,
+			   imx290->current_mode);
+	mutex_unlock(imx290->ctrls.lock);
+
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

