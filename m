Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0F496987E3
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 23:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjBOWaf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 17:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjBOWae (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 17:30:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D71252B2
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 14:30:33 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57A44465;
        Wed, 15 Feb 2023 23:30:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676500232;
        bh=JzNVNefyKAQPfT5PlbhuMavNYm4YoIjhFI+Fxa/JZWw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L0ton/u9OX993DhO2H+5IBXzpVtVUw2sL4D5UmTPTLbZvlboYP0H9G75N7GEznSFu
         ZcLIVGGCJH+gCwmAFAu4vWvHKXE5EQPh12QwDoAwEQJHDWnMwU8sGhszG1G/CvxZFP
         sL8Xo3awsLnt5U+RNP6EAb8KxcHCHQCxSJDa2LdY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 14/15] media: i2c: imx290: Add support for H & V Flips
Date:   Thu, 16 Feb 2023 00:30:02 +0200
Message-Id: <20230215223003.30170-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
References: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The sensor supports H & V flips, so add the relevant hooks for
V4L2_CID_HFLIP and V4L2_CID_VFLIP to configure them.

Note that the Bayer order is maintained as the readout area
shifts by 1 pixel in the appropriate direction (note the
comment about the top margin being 8 pixels whilst the bottom
margin is 9). The V4L2_SEL_TGT_CROP region is therefore
adjusted appropriately.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 51 ++++++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 14a6ec4e398d..ec380bb7533f 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -208,6 +208,7 @@ struct imx290_mode {
 	u32 hmax_min;
 	u32 vmax_min;
 	u8 link_freq_index;
+	u8 ctrl_07;
 
 	const struct imx290_regval *data;
 	u32 data_size;
@@ -248,6 +249,10 @@ struct imx290 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *exposure;
+	struct {
+		struct v4l2_ctrl *hflip;
+		struct v4l2_ctrl *vflip;
+	};
 };
 
 static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
@@ -325,7 +330,6 @@ static const struct imx290_regval xclk_regs[][IMX290_NUM_CLK_REGS] = {
 
 static const struct imx290_regval imx290_1080p_settings[] = {
 	/* mode settings */
-	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
 	{ IMX290_WINWV_OB, 12 },
 	{ IMX290_OPB_SIZE_V, 10 },
 	{ IMX290_X_OUT_SIZE, 1920 },
@@ -334,7 +338,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
 
 static const struct imx290_regval imx290_720p_settings[] = {
 	/* mode settings */
-	{ IMX290_CTRL_07, IMX290_WINMODE_720P },
 	{ IMX290_WINWV_OB, 6 },
 	{ IMX290_OPB_SIZE_V, 4 },
 	{ IMX290_X_OUT_SIZE, 1280 },
@@ -494,6 +497,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 		.hmax_min = 2200,
 		.vmax_min = 1125,
 		.link_freq_index = FREQ_INDEX_1080P,
+		.ctrl_07 = IMX290_WINMODE_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
 		.clk_cfg = imx290_1080p_clock_config,
@@ -504,6 +508,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 		.hmax_min = 3300,
 		.vmax_min = 750,
 		.link_freq_index = FREQ_INDEX_720P,
+		.ctrl_07 = IMX290_WINMODE_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
 		.clk_cfg = imx290_720p_clock_config,
@@ -517,6 +522,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 		.hmax_min = 2200,
 		.vmax_min = 1125,
 		.link_freq_index = FREQ_INDEX_1080P,
+		.ctrl_07 = IMX290_WINMODE_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
 		.clk_cfg = imx290_1080p_clock_config,
@@ -527,6 +533,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 		.hmax_min = 3300,
 		.vmax_min = 750,
 		.link_freq_index = FREQ_INDEX_720P,
+		.ctrl_07 = IMX290_WINMODE_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
 		.clk_cfg = imx290_720p_clock_config,
@@ -835,6 +842,20 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 				   NULL);
 		break;
 
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+	{
+		u32 reg;
+
+		reg = imx290->current_mode->ctrl_07;
+		if (imx290->hflip->val)
+			reg |= IMX290_HREVERSE;
+		if (imx290->vflip->val)
+			reg |= IMX290_VREVERSE;
+		ret = imx290_write(imx290, IMX290_CTRL_07, reg, NULL);
+		break;
+	}
+
 	default:
 		ret = -EINVAL;
 		break;
@@ -887,7 +908,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	if (ret < 0)
 		return ret;
 
-	v4l2_ctrl_handler_init(&imx290->ctrls, 9);
+	v4l2_ctrl_handler_init(&imx290->ctrls, 11);
 
 	/*
 	 * The sensor has an analog gain and a digital gain, both controlled
@@ -944,6 +965,12 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 					   V4L2_CID_VBLANK, 1, 1, 1, 1);
 
+	imx290->hflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	imx290->vflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_cluster(2, &imx290->hflip);
+
 	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
 					&props);
 
@@ -1065,6 +1092,13 @@ static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put_autosuspend(imx290->dev);
 	}
 
+	/*
+	 * vflip and hflip should not be changed during streaming as the sensor
+	 * will produce an invalid frame.
+	 */
+	__v4l2_ctrl_grab(imx290->vflip, enable);
+	__v4l2_ctrl_grab(imx290->hflip, enable);
+
 unlock:
 	v4l2_subdev_unlock_state(state);
 	return ret;
@@ -1147,16 +1181,23 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
+	struct imx290 *imx290 = to_imx290(sd);
 	struct v4l2_mbus_framefmt *format;
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP: {
 		format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
 
+		/*
+		 * The sensor moves the readout by 1 pixel based on flips to
+		 * keep the Bayer order the same.
+		 */
 		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
-			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2;
+			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2
+			   + imx290->vflip->val;
 		sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
-			    + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2;
+			    + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2
+			    + imx290->hflip->val;
 		sel->r.width = format->width;
 		sel->r.height = format->height;
 
-- 
Regards,

Laurent Pinchart

