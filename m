Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06DCE6987DE
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 23:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjBOWa0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 17:30:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjBOWaZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 17:30:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EECF15545
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 14:30:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88EC646D;
        Wed, 15 Feb 2023 23:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676500222;
        bh=QIHXfAezOHxkFoR8CfB8/2iaRtSt/QO2+RQCj+biJBg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PqB4gSYdtJ0Upmoce1JL+L64kH4t2Q3DWbttH58R30PtdojvSYDhDZXvRLRQIEw3a
         VcmvRRguiIpl84g7AEXB/IkoF/W1Me/bvhMtT9nUZWGS5dMtuQXv8I6MAnRjQu1vwR
         cY1arJL+W5YX5a6ElpVUHeoi2cxYkEZNGMhEJ3XU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 09/15] media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
Date:   Thu, 16 Feb 2023 00:29:57 +0200
Message-Id: <20230215223003.30170-10-laurent.pinchart@ideasonboard.com>
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

The driver exposed V4L2_CID_HBLANK as a read only control to allow
for exposure calculations and determination of the frame rate.

Convert to a read/write control so that the frame rate can be
controlled.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 26194c2b04c4..f82fb05b6695 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -47,6 +47,7 @@
 #define IMX290_GAIN					IMX290_REG_8BIT(0x3014)
 #define IMX290_VMAX					IMX290_REG_24BIT(0x3018)
 #define IMX290_HMAX					IMX290_REG_16BIT(0x301c)
+#define IMX290_HMAX_MAX					0xffff
 #define IMX290_SHS1					IMX290_REG_24BIT(0x3020)
 #define IMX290_WINWV_OB					IMX290_REG_8BIT(0x303a)
 #define IMX290_WINPV					IMX290_REG_16BIT(0x303c)
@@ -183,7 +184,7 @@ struct imx290_regval {
 struct imx290_mode {
 	u32 width;
 	u32 height;
-	u32 hmax;
+	u32 hmax_min;
 	u8 link_freq_index;
 
 	const struct imx290_regval *data;
@@ -426,7 +427,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
-		.hmax = 2200,
+		.hmax_min = 2200,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -434,7 +435,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.hmax = 3300,
+		.hmax_min = 3300,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -445,7 +446,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
-		.hmax = 2200,
+		.hmax_min = 2200,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -453,7 +454,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.hmax = 3300,
+		.hmax_min = 3300,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -707,6 +708,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		break;
 
+	case V4L2_CID_HBLANK:
+		ret = imx290_write(imx290, IMX290_HMAX,
+				   ctrl->val + imx290->current_mode->width,
+				   NULL);
+		break;
+
 	default:
 		ret = -EINVAL;
 		break;
@@ -737,12 +744,14 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 			       const struct v4l2_mbus_framefmt *format,
 			       const struct imx290_mode *mode)
 {
-	unsigned int hblank = mode->hmax - mode->width;
+	unsigned int hblank_min = mode->hmax_min - mode->width;
+	unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
 	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
 
-	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
+	__v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max, 1,
+				 hblank_min);
 	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
 }
 
@@ -799,10 +808,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
 				     0, 0, imx290_test_pattern_menu);
 
+	/*
+	 * Actual range will be set from imx290_ctrl_update later in the probe.
+	 */
 	imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 					   V4L2_CID_HBLANK, 1, 1, 1, 1);
-	if (imx290->hblank)
-		imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 					   V4L2_CID_VBLANK, 1, 1, 1, 1);
@@ -871,11 +881,6 @@ static int imx290_start_streaming(struct imx290 *imx290,
 		return ret;
 	}
 
-	ret = imx290_write(imx290, IMX290_HMAX, imx290->current_mode->hmax,
-			   NULL);
-	if (ret)
-		return ret;
-
 	/* Apply customized values from user */
 	ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
 	if (ret) {
-- 
Regards,

Laurent Pinchart

