Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 900127835C6
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 00:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbjHUWai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 18:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbjHUWag (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 18:30:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4754A127
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 15:30:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C050138B3;
        Tue, 22 Aug 2023 00:28:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692656938;
        bh=xUCeAzX3kud3dyd2g9Fr8vJQoLO7bBakB9ZE9CMRYGQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hhxy/0vQOjUPhmIkUQMtkUJpElrHKkbEYtTtZ9Dh7Ly0GxZNaxfIfnAkczVRm+7Nw
         uV15QJMcySCtiZweNXYJzhzt5uei3vhgsta3k1plxU6XzSfxEyzwX8Izb9f35jqwS6
         kQN/g7/pBa+sbScXjpIRctFFrKBbyS+SkG5GGh2c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 13/18] media: i2c: imx219: Group functions by purpose
Date:   Tue, 22 Aug 2023 01:29:56 +0300
Message-ID: <20230821223001.28480-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move functions around to group them by purpose, in order to improve
readability. No functional change is intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 649 +++++++++++++++++++------------------
 1 file changed, 332 insertions(+), 317 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 165c5e8473f7..227c227cf4ce 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -389,6 +389,10 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 	return imx219_mbus_formats[i];
 }
 
+/* -----------------------------------------------------------------------------
+ * Controls
+ */
+
 static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx219 *imx219 =
@@ -480,6 +484,308 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
 	.s_ctrl = imx219_set_ctrl,
 };
 
+static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
+{
+	return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
+}
+
+/* Initialize control handlers */
+static int imx219_init_controls(struct imx219 *imx219)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
+	const struct imx219_mode *mode = &supported_modes[0];
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	struct v4l2_fwnode_device_properties props;
+	int exposure_max, exposure_def, hblank;
+	int i, ret;
+
+	ctrl_hdlr = &imx219->ctrl_handler;
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
+	if (ret)
+		return ret;
+
+	/* By default, PIXEL_RATE is read only */
+	imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE,
+					       imx219_get_pixel_rate(imx219),
+					       imx219_get_pixel_rate(imx219), 1,
+					       imx219_get_pixel_rate(imx219));
+
+	imx219->link_freq =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       ARRAY_SIZE(imx219_link_freq_menu) - 1, 0,
+				       (imx219->lanes == 2) ? imx219_link_freq_menu :
+				       imx219_link_freq_4lane_menu);
+	if (imx219->link_freq)
+		imx219->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	/* Initial vblank/hblank/exposure parameters based on current mode */
+	imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
+					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
+					   IMX219_VTS_MAX - mode->height, 1,
+					   mode->vts_def - mode->height);
+	hblank = IMX219_PPL_DEFAULT - mode->width;
+	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank, hblank,
+					   1, hblank);
+	if (imx219->hblank)
+		imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	exposure_max = mode->vts_def - 4;
+	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
+		exposure_max : IMX219_EXPOSURE_DEFAULT;
+	imx219->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     IMX219_EXPOSURE_MIN, exposure_max,
+					     IMX219_EXPOSURE_STEP,
+					     exposure_def);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  IMX219_ANA_GAIN_MIN, IMX219_ANA_GAIN_MAX,
+			  IMX219_ANA_GAIN_STEP, IMX219_ANA_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  IMX219_DGTL_GAIN_MIN, IMX219_DGTL_GAIN_MAX,
+			  IMX219_DGTL_GAIN_STEP, IMX219_DGTL_GAIN_DEFAULT);
+
+	imx219->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (imx219->hflip)
+		imx219->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	imx219->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (imx219->vflip)
+		imx219->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx219_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(imx219_test_pattern_menu) - 1,
+				     0, 0, imx219_test_pattern_menu);
+	for (i = 0; i < 4; i++) {
+		/*
+		 * The assumption is that
+		 * V4L2_CID_TEST_PATTERN_GREENR == V4L2_CID_TEST_PATTERN_RED + 1
+		 * V4L2_CID_TEST_PATTERN_BLUE   == V4L2_CID_TEST_PATTERN_RED + 2
+		 * V4L2_CID_TEST_PATTERN_GREENB == V4L2_CID_TEST_PATTERN_RED + 3
+		 */
+		v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
+				  V4L2_CID_TEST_PATTERN_RED + i,
+				  IMX219_TESTP_COLOUR_MIN,
+				  IMX219_TESTP_COLOUR_MAX,
+				  IMX219_TESTP_COLOUR_STEP,
+				  IMX219_TESTP_COLOUR_MAX);
+		/* The "Solid color" pattern is white by default */
+	}
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		dev_err(&client->dev, "%s control init failed (%d)\n",
+			__func__, ret);
+		goto error;
+	}
+
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx219_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
+	imx219->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+error:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static void imx219_free_controls(struct imx219 *imx219)
+{
+	v4l2_ctrl_handler_free(imx219->sd.ctrl_handler);
+}
+
+/* -----------------------------------------------------------------------------
+ * Subdev operations
+ */
+
+static int imx219_set_framefmt(struct imx219 *imx219,
+			       const struct v4l2_mbus_framefmt *format,
+			       const struct v4l2_rect *crop)
+{
+	unsigned int bpp;
+	u16 bin_mode;
+	int ret = 0;
+
+	switch (format->code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		bpp = 8;
+		break;
+
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	default:
+		bpp = 10;
+		break;
+	}
+
+	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
+		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
+	cci_write(imx219->regmap, IMX219_REG_X_ADD_END_A,
+		  crop->left - IMX219_PIXEL_ARRAY_LEFT + crop->width - 1, &ret);
+	cci_write(imx219->regmap, IMX219_REG_Y_ADD_STA_A,
+		  crop->top - IMX219_PIXEL_ARRAY_TOP, &ret);
+	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
+		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
+
+	if (format->width == crop->width && format->height == crop->height)
+		bin_mode = IMX219_BINNING_NONE;
+	else if (bpp == 8)
+		bin_mode = IMX219_BINNING_2X2_ANALOG;
+	else
+		bin_mode = IMX219_BINNING_2X2;
+
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE, bin_mode, &ret);
+
+	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
+		  format->width, &ret);
+	cci_write(imx219->regmap, IMX219_REG_Y_OUTPUT_SIZE,
+		  format->height, &ret);
+
+	cci_write(imx219->regmap, IMX219_REG_TP_WINDOW_WIDTH,
+		  format->width, &ret);
+	cci_write(imx219->regmap, IMX219_REG_TP_WINDOW_HEIGHT,
+		  format->height, &ret);
+
+	cci_write(imx219->regmap, IMX219_REG_CSI_DATA_FORMAT_A,
+		  (bpp << 8) | bpp, &ret);
+	cci_write(imx219->regmap, IMX219_REG_OPPXCK_DIV, bpp, &ret);
+
+	return ret;
+}
+
+static int imx219_configure_lanes(struct imx219 *imx219)
+{
+	return cci_write(imx219->regmap, IMX219_REG_CSI_LANE_MODE,
+			 imx219->lanes == 2 ? IMX219_CSI_2_LANE_MODE :
+			 IMX219_CSI_4_LANE_MODE, NULL);
+};
+
+static int imx219_start_streaming(struct imx219 *imx219,
+				  struct v4l2_subdev_state *state)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
+	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_rect *crop;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Send all registers that are common to all modes */
+	ret = cci_multi_reg_write(imx219->regmap, imx219_common_regs,
+				  ARRAY_SIZE(imx219_common_regs), NULL);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to send mfg header\n", __func__);
+		goto err_rpm_put;
+	}
+
+	/* Configure two or four Lane mode */
+	ret = imx219_configure_lanes(imx219);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to configure lanes\n", __func__);
+		goto err_rpm_put;
+	}
+
+	/* Apply format and crop settings. */
+	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
+	crop = v4l2_subdev_get_pad_crop(&imx219->sd, state, 0);
+	ret = imx219_set_framefmt(imx219, format, crop);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set frame format: %d\n",
+			__func__, ret);
+		goto err_rpm_put;
+	}
+
+	/* Apply customized values from user */
+	ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
+	if (ret)
+		goto err_rpm_put;
+
+	/* set stream on register */
+	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
+			IMX219_MODE_STREAMING, NULL);
+	if (ret)
+		goto err_rpm_put;
+
+	/* vflip and hflip cannot change during streaming */
+	__v4l2_ctrl_grab(imx219->vflip, true);
+	__v4l2_ctrl_grab(imx219->hflip, true);
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(&client->dev);
+	return ret;
+}
+
+static void imx219_stop_streaming(struct imx219 *imx219)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
+	int ret;
+
+	/* set stream off register */
+	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
+			IMX219_MODE_STANDBY, NULL);
+	if (ret)
+		dev_err(&client->dev, "%s failed to set stream\n", __func__);
+
+	__v4l2_ctrl_grab(imx219->vflip, false);
+	__v4l2_ctrl_grab(imx219->hflip, false);
+
+	pm_runtime_put(&client->dev);
+}
+
+static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct imx219 *imx219 = to_imx219(sd);
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	if (imx219->streaming == enable)
+		goto unlock;
+
+	if (enable) {
+		/*
+		 * Apply default & customized values
+		 * and then start streaming.
+		 */
+		ret = imx219_start_streaming(imx219, state);
+		if (ret)
+			goto unlock;
+	} else {
+		imx219_stop_streaming(imx219);
+	}
+
+	imx219->streaming = enable;
+
+unlock:
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
 static void imx219_update_pad_format(struct imx219 *imx219,
 				     const struct imx219_mode *mode,
 				     struct v4l2_mbus_framefmt *fmt, u32 code)
@@ -604,66 +910,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int imx219_set_framefmt(struct imx219 *imx219,
-			       const struct v4l2_mbus_framefmt *format,
-			       const struct v4l2_rect *crop)
-{
-	unsigned int bpp;
-	u16 bin_mode;
-	int ret = 0;
-
-	switch (format->code) {
-	case MEDIA_BUS_FMT_SRGGB8_1X8:
-	case MEDIA_BUS_FMT_SGRBG8_1X8:
-	case MEDIA_BUS_FMT_SGBRG8_1X8:
-	case MEDIA_BUS_FMT_SBGGR8_1X8:
-		bpp = 8;
-		break;
-
-	case MEDIA_BUS_FMT_SRGGB10_1X10:
-	case MEDIA_BUS_FMT_SGRBG10_1X10:
-	case MEDIA_BUS_FMT_SGBRG10_1X10:
-	case MEDIA_BUS_FMT_SBGGR10_1X10:
-	default:
-		bpp = 10;
-		break;
-	}
-
-	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
-		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
-	cci_write(imx219->regmap, IMX219_REG_X_ADD_END_A,
-		  crop->left - IMX219_PIXEL_ARRAY_LEFT + crop->width - 1, &ret);
-	cci_write(imx219->regmap, IMX219_REG_Y_ADD_STA_A,
-		  crop->top - IMX219_PIXEL_ARRAY_TOP, &ret);
-	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
-		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
-
-	if (format->width == crop->width && format->height == crop->height)
-		bin_mode = IMX219_BINNING_NONE;
-	else if (bpp == 8)
-		bin_mode = IMX219_BINNING_2X2_ANALOG;
-	else
-		bin_mode = IMX219_BINNING_2X2;
-
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE, bin_mode, &ret);
-
-	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
-		  format->width, &ret);
-	cci_write(imx219->regmap, IMX219_REG_Y_OUTPUT_SIZE,
-		  format->height, &ret);
-
-	cci_write(imx219->regmap, IMX219_REG_TP_WINDOW_WIDTH,
-		  format->width, &ret);
-	cci_write(imx219->regmap, IMX219_REG_TP_WINDOW_HEIGHT,
-		  format->height, &ret);
-
-	cci_write(imx219->regmap, IMX219_REG_CSI_DATA_FORMAT_A,
-		  (bpp << 8) | bpp, &ret);
-	cci_write(imx219->regmap, IMX219_REG_OPPXCK_DIV, bpp, &ret);
-
-	return ret;
-}
-
 static int imx219_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
@@ -695,120 +941,35 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
-static int imx219_configure_lanes(struct imx219 *imx219)
-{
-	return cci_write(imx219->regmap, IMX219_REG_CSI_LANE_MODE,
-			 imx219->lanes == 2 ? IMX219_CSI_2_LANE_MODE :
-			 IMX219_CSI_4_LANE_MODE, NULL);
+static const struct v4l2_subdev_core_ops imx219_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
-static int imx219_start_streaming(struct imx219 *imx219,
-				  struct v4l2_subdev_state *state)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
-	const struct v4l2_mbus_framefmt *format;
-	const struct v4l2_rect *crop;
-	int ret;
+static const struct v4l2_subdev_video_ops imx219_video_ops = {
+	.s_stream = imx219_set_stream,
+};
 
-	ret = pm_runtime_resume_and_get(&client->dev);
-	if (ret < 0)
-		return ret;
+static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
+	.init_cfg = imx219_init_cfg,
+	.enum_mbus_code = imx219_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = imx219_set_pad_format,
+	.get_selection = imx219_get_selection,
+	.enum_frame_size = imx219_enum_frame_size,
+};
 
-	/* Send all registers that are common to all modes */
-	ret = cci_multi_reg_write(imx219->regmap, imx219_common_regs,
-				  ARRAY_SIZE(imx219_common_regs), NULL);
-	if (ret) {
-		dev_err(&client->dev, "%s failed to send mfg header\n", __func__);
-		goto err_rpm_put;
-	}
+static const struct v4l2_subdev_ops imx219_subdev_ops = {
+	.core = &imx219_core_ops,
+	.video = &imx219_video_ops,
+	.pad = &imx219_pad_ops,
+};
 
-	/* Configure two or four Lane mode */
-	ret = imx219_configure_lanes(imx219);
-	if (ret) {
-		dev_err(&client->dev, "%s failed to configure lanes\n", __func__);
-		goto err_rpm_put;
-	}
 
-	/* Apply format and crop settings. */
-	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
-	crop = v4l2_subdev_get_pad_crop(&imx219->sd, state, 0);
-	ret = imx219_set_framefmt(imx219, format, crop);
-	if (ret) {
-		dev_err(&client->dev, "%s failed to set frame format: %d\n",
-			__func__, ret);
-		goto err_rpm_put;
-	}
+/* -----------------------------------------------------------------------------
+ * Power management
+ */
 
-	/* Apply customized values from user */
-	ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
-	if (ret)
-		goto err_rpm_put;
-
-	/* set stream on register */
-	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
-			IMX219_MODE_STREAMING, NULL);
-	if (ret)
-		goto err_rpm_put;
-
-	/* vflip and hflip cannot change during streaming */
-	__v4l2_ctrl_grab(imx219->vflip, true);
-	__v4l2_ctrl_grab(imx219->hflip, true);
-
-	return 0;
-
-err_rpm_put:
-	pm_runtime_put(&client->dev);
-	return ret;
-}
-
-static void imx219_stop_streaming(struct imx219 *imx219)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
-	int ret;
-
-	/* set stream off register */
-	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
-			IMX219_MODE_STANDBY, NULL);
-	if (ret)
-		dev_err(&client->dev, "%s failed to set stream\n", __func__);
-
-	__v4l2_ctrl_grab(imx219->vflip, false);
-	__v4l2_ctrl_grab(imx219->hflip, false);
-
-	pm_runtime_put(&client->dev);
-}
-
-static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct imx219 *imx219 = to_imx219(sd);
-	struct v4l2_subdev_state *state;
-	int ret = 0;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (imx219->streaming == enable)
-		goto unlock;
-
-	if (enable) {
-		/*
-		 * Apply default & customized values
-		 * and then start streaming.
-		 */
-		ret = imx219_start_streaming(imx219, state);
-		if (ret)
-			goto unlock;
-	} else {
-		imx219_stop_streaming(imx219);
-	}
-
-	imx219->streaming = enable;
-
-unlock:
-	v4l2_subdev_unlock_state(state);
-	return ret;
-}
-
-/* Power/clock management functions */
 static int imx219_power_on(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -889,6 +1050,10 @@ static int __maybe_unused imx219_resume(struct device *dev)
 	return ret;
 }
 
+/* -----------------------------------------------------------------------------
+ * Probe & remove
+ */
+
 static int imx219_get_regulators(struct imx219 *imx219)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
@@ -925,156 +1090,6 @@ static int imx219_identify_module(struct imx219 *imx219)
 	return 0;
 }
 
-static const struct v4l2_subdev_core_ops imx219_core_ops = {
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
-};
-
-static const struct v4l2_subdev_video_ops imx219_video_ops = {
-	.s_stream = imx219_set_stream,
-};
-
-static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
-	.init_cfg = imx219_init_cfg,
-	.enum_mbus_code = imx219_enum_mbus_code,
-	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = imx219_set_pad_format,
-	.get_selection = imx219_get_selection,
-	.enum_frame_size = imx219_enum_frame_size,
-};
-
-static const struct v4l2_subdev_ops imx219_subdev_ops = {
-	.core = &imx219_core_ops,
-	.video = &imx219_video_ops,
-	.pad = &imx219_pad_ops,
-};
-
-
-static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
-{
-	return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
-}
-
-/* Initialize control handlers */
-static int imx219_init_controls(struct imx219 *imx219)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
-	const struct imx219_mode *mode = &supported_modes[0];
-	struct v4l2_ctrl_handler *ctrl_hdlr;
-	struct v4l2_fwnode_device_properties props;
-	int exposure_max, exposure_def, hblank;
-	int i, ret;
-
-	ctrl_hdlr = &imx219->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
-	if (ret)
-		return ret;
-
-	/* By default, PIXEL_RATE is read only */
-	imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
-					       V4L2_CID_PIXEL_RATE,
-					       imx219_get_pixel_rate(imx219),
-					       imx219_get_pixel_rate(imx219), 1,
-					       imx219_get_pixel_rate(imx219));
-
-	imx219->link_freq =
-		v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
-				       V4L2_CID_LINK_FREQ,
-				       ARRAY_SIZE(imx219_link_freq_menu) - 1, 0,
-				       (imx219->lanes == 2) ? imx219_link_freq_menu :
-				       imx219_link_freq_4lane_menu);
-	if (imx219->link_freq)
-		imx219->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
-	/* Initial vblank/hblank/exposure parameters based on current mode */
-	imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
-					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
-					   IMX219_VTS_MAX - mode->height, 1,
-					   mode->vts_def - mode->height);
-	hblank = IMX219_PPL_DEFAULT - mode->width;
-	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
-					   V4L2_CID_HBLANK, hblank, hblank,
-					   1, hblank);
-	if (imx219->hblank)
-		imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	exposure_max = mode->vts_def - 4;
-	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
-		exposure_max : IMX219_EXPOSURE_DEFAULT;
-	imx219->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
-					     V4L2_CID_EXPOSURE,
-					     IMX219_EXPOSURE_MIN, exposure_max,
-					     IMX219_EXPOSURE_STEP,
-					     exposure_def);
-
-	v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
-			  IMX219_ANA_GAIN_MIN, IMX219_ANA_GAIN_MAX,
-			  IMX219_ANA_GAIN_STEP, IMX219_ANA_GAIN_DEFAULT);
-
-	v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
-			  IMX219_DGTL_GAIN_MIN, IMX219_DGTL_GAIN_MAX,
-			  IMX219_DGTL_GAIN_STEP, IMX219_DGTL_GAIN_DEFAULT);
-
-	imx219->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
-					  V4L2_CID_HFLIP, 0, 1, 1, 0);
-	if (imx219->hflip)
-		imx219->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
-
-	imx219->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
-					  V4L2_CID_VFLIP, 0, 1, 1, 0);
-	if (imx219->vflip)
-		imx219->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
-
-	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx219_ctrl_ops,
-				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(imx219_test_pattern_menu) - 1,
-				     0, 0, imx219_test_pattern_menu);
-	for (i = 0; i < 4; i++) {
-		/*
-		 * The assumption is that
-		 * V4L2_CID_TEST_PATTERN_GREENR == V4L2_CID_TEST_PATTERN_RED + 1
-		 * V4L2_CID_TEST_PATTERN_BLUE   == V4L2_CID_TEST_PATTERN_RED + 2
-		 * V4L2_CID_TEST_PATTERN_GREENB == V4L2_CID_TEST_PATTERN_RED + 3
-		 */
-		v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
-				  V4L2_CID_TEST_PATTERN_RED + i,
-				  IMX219_TESTP_COLOUR_MIN,
-				  IMX219_TESTP_COLOUR_MAX,
-				  IMX219_TESTP_COLOUR_STEP,
-				  IMX219_TESTP_COLOUR_MAX);
-		/* The "Solid color" pattern is white by default */
-	}
-
-	if (ctrl_hdlr->error) {
-		ret = ctrl_hdlr->error;
-		dev_err(&client->dev, "%s control init failed (%d)\n",
-			__func__, ret);
-		goto error;
-	}
-
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
-	if (ret)
-		goto error;
-
-	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx219_ctrl_ops,
-					      &props);
-	if (ret)
-		goto error;
-
-	imx219->sd.ctrl_handler = ctrl_hdlr;
-
-	return 0;
-
-error:
-	v4l2_ctrl_handler_free(ctrl_hdlr);
-
-	return ret;
-}
-
-static void imx219_free_controls(struct imx219 *imx219)
-{
-	v4l2_ctrl_handler_free(imx219->sd.ctrl_handler);
-}
-
 static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 {
 	struct fwnode_handle *endpoint;
-- 
Regards,

Laurent Pinchart

