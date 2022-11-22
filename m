Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A91B634A11
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 23:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235211AbiKVWdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 17:33:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235203AbiKVWdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 17:33:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1384C9DB94
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 14:33:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91CD7188E;
        Tue, 22 Nov 2022 23:33:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669156401;
        bh=nJAPMVT6tksiBrknQeM4CkpBGg2HRomukk8QT3wbUFE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AoZNnKkgmxvdrBm9BPuw7Veo7pvshRUxZ6e+AiR4OHaYPXef0qRIFSR3g51Dn2pg8
         j6ykrZMxIBmCCkRqvn5iEjVecXpfNsdcYuAf0bcUEdcLteoSkVuszL6PQbB25yCdGR
         8ZI64THZf4NKFZaRdqdc1kHPZowD4OLQaMNdAv9o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v1 11/15] media: i2c: imx290: Use V4L2 subdev active state
Date:   Wed, 23 Nov 2022 00:32:46 +0200
Message-Id: <20221122223250.21233-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the V4L2 subdev active state API to store the active format. This
simplifies the driver not only by dropping the imx290 current_format
field, but it also allows dropping the imx290 lock, replaced with the
state lock.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 139 +++++++++++++++----------------------
 1 file changed, 56 insertions(+), 83 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 848de4c90d3b..cd2154983341 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -177,12 +177,12 @@ struct imx290 {
 	struct clk *xclk;
 	struct regmap *regmap;
 	u8 nlanes;
-	u8 bpp;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
-	struct v4l2_mbus_framefmt current_format;
+
 	const struct imx290_mode *current_mode;
+	u8 bpp;
 
 	struct regulator_bulk_data supplies[IMX290_NUM_SUPPLIES];
 	struct gpio_desc *rst_gpio;
@@ -192,8 +192,6 @@ struct imx290 {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
-
-	struct mutex lock;
 };
 
 static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
@@ -524,14 +522,15 @@ static int imx290_set_black_level(struct imx290 *imx290,
 			    black_level >> (16 - imx290->bpp), err);
 }
 
-static int imx290_write_current_format(struct imx290 *imx290)
+static int imx290_setup_format(struct imx290 *imx290,
+			       const struct v4l2_mbus_framefmt *format)
 {
 	const struct imx290_regval *regs;
 	unsigned int num_regs;
 	unsigned int bpp;
 	int ret;
 
-	switch (imx290->current_format.code) {
+	switch (format->code) {
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 		regs = imx290_10bit_settings;
 		num_regs = ARRAY_SIZE(imx290_10bit_settings);
@@ -564,12 +563,17 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx290 *imx290 = container_of(ctrl->handler,
 					     struct imx290, ctrls);
+	const struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_state *state;
 	int ret = 0;
 
 	/* V4L2 controls values will be applied only when power is already up */
 	if (!pm_runtime_get_if_in_use(imx290->dev))
 		return 0;
 
+	state = v4l2_subdev_get_locked_active_state(&imx290->sd);
+	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
+
 	switch (ctrl->id) {
 	case V4L2_CID_ANALOGUE_GAIN:
 		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
@@ -646,11 +650,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	int ret;
 
 	ret = v4l2_fwnode_device_parse(imx290->dev, &props);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	v4l2_ctrl_handler_init(&imx290->ctrls, 9);
-	imx290->ctrls.lock = &imx290->lock;
 
 	/*
 	 * The sensor has an analog gain and a digital gain, both controlled
@@ -715,11 +718,6 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 		return ret;
 	}
 
-	mutex_lock(imx290->ctrls.lock);
-	imx290_ctrl_update(imx290, &imx290->current_format,
-			   imx290->current_mode);
-	mutex_unlock(imx290->ctrls.lock);
-
 	return 0;
 }
 
@@ -728,8 +726,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
  */
 
 /* Start streaming */
-static int imx290_start_streaming(struct imx290 *imx290)
+static int imx290_start_streaming(struct imx290 *imx290,
+				  struct v4l2_subdev_state *state)
 {
+	const struct v4l2_mbus_framefmt *format;
 	int ret;
 
 	/* Set init register settings */
@@ -742,7 +742,8 @@ static int imx290_start_streaming(struct imx290 *imx290)
 	}
 
 	/* Apply the register values related to current frame format */
-	ret = imx290_write_current_format(imx290);
+	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
+	ret = imx290_setup_format(imx290, format);
 	if (ret < 0) {
 		dev_err(imx290->dev, "Could not set frame format\n");
 		return ret;
@@ -762,7 +763,7 @@ static int imx290_start_streaming(struct imx290 *imx290)
 		return ret;
 
 	/* Apply customized values from user */
-	ret = v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
+	ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
 	if (ret) {
 		dev_err(imx290->dev, "Could not sync v4l2 controls\n");
 		return ret;
@@ -791,39 +792,32 @@ static int imx290_stop_streaming(struct imx290 *imx290)
 static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx290 *imx290 = to_imx290(sd);
+	struct v4l2_subdev_state *state;
 	int ret = 0;
 
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
 	if (enable) {
 		ret = pm_runtime_resume_and_get(imx290->dev);
 		if (ret < 0)
-			goto unlock_and_return;
+			goto unlock;
 
-		ret = imx290_start_streaming(imx290);
+		ret = imx290_start_streaming(imx290, state);
 		if (ret) {
 			dev_err(imx290->dev, "Start stream failed\n");
 			pm_runtime_put(imx290->dev);
-			goto unlock_and_return;
+			goto unlock;
 		}
 	} else {
 		imx290_stop_streaming(imx290);
 		pm_runtime_put(imx290->dev);
 	}
 
-unlock_and_return:
-
+unlock:
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
-static struct v4l2_mbus_framefmt *
-imx290_get_pad_format(struct imx290 *imx290, struct v4l2_subdev_state *state,
-		      u32 which)
-{
-	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		return &imx290->current_format;
-	else
-		return v4l2_subdev_get_try_format(&imx290->sd, state, 0);
-}
-
 static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -858,23 +852,6 @@ static int imx290_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int imx290_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *sd_state,
-			  struct v4l2_subdev_format *fmt)
-{
-	struct imx290 *imx290 = to_imx290(sd);
-	struct v4l2_mbus_framefmt *framefmt;
-
-	mutex_lock(&imx290->lock);
-
-	framefmt = imx290_get_pad_format(imx290, sd_state, fmt->which);
-	fmt->format = *framefmt;
-
-	mutex_unlock(&imx290->lock);
-
-	return 0;
-}
-
 static int imx290_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *fmt)
@@ -884,8 +861,6 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *format;
 	unsigned int i;
 
-	mutex_lock(&imx290->lock);
-
 	mode = v4l2_find_nearest_size(imx290_modes_ptr(imx290),
 				      imx290_modes_num(imx290), width, height,
 				      fmt->format.width, fmt->format.height);
@@ -903,7 +878,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 	fmt->format.code = imx290_formats[i].code;
 	fmt->format.field = V4L2_FIELD_NONE;
 
-	format = imx290_get_pad_format(imx290, sd_state, fmt->which);
+	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		imx290->current_mode = mode;
@@ -914,8 +889,6 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 
 	*format = fmt->format;
 
-	mutex_unlock(&imx290->lock);
-
 	return 0;
 }
 
@@ -923,14 +896,11 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
-	struct imx290 *imx290 = to_imx290(sd);
 	struct v4l2_mbus_framefmt *format;
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP: {
-		format = imx290_get_pad_format(imx290, sd_state, sel->which);
-
-		mutex_lock(&imx290->lock);
+		format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
 
 		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
 			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2;
@@ -939,7 +909,6 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
 		sel->r.width = format->width;
 		sel->r.height = format->height;
 
-		mutex_unlock(&imx290->lock);
 		return 0;
 	}
 
@@ -968,11 +937,13 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
 static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
 				  struct v4l2_subdev_state *sd_state)
 {
-	struct v4l2_subdev_format fmt = { 0 };
-
-	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
-	fmt.format.width = 1920;
-	fmt.format.height = 1080;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.format = {
+			.width = 1920,
+			.height = 1080,
+		},
+	};
 
 	imx290_set_fmt(subdev, sd_state, &fmt);
 
@@ -987,7 +958,7 @@ static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
 	.init_cfg = imx290_entity_init_cfg,
 	.enum_mbus_code = imx290_enum_mbus_code,
 	.enum_frame_size = imx290_enum_frame_size,
-	.get_fmt = imx290_get_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx290_set_fmt,
 	.get_selection = imx290_get_selection,
 };
@@ -1004,20 +975,12 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
 static int imx290_subdev_init(struct imx290 *imx290)
 {
 	struct i2c_client *client = to_i2c_client(imx290->dev);
+	const struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_state *state;
 	int ret;
 
-	/*
-	 * Initialize the frame format. In particular, imx290->current_mode
-	 * and imx290->bpp are set to defaults: imx290_calc_pixel_rate() call
-	 * below relies on these fields.
-	 */
-	imx290_entity_init_cfg(&imx290->sd, NULL);
-
-	ret = imx290_ctrl_init(imx290);
-	if (ret < 0) {
-		dev_err(imx290->dev, "Control initialization error %d\n", ret);
-		return ret;
-	}
+	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
+	imx290->bpp = imx290_formats[0].bpp;
 
 	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
 	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
@@ -1032,6 +995,22 @@ static int imx290_subdev_init(struct imx290 *imx290)
 		return ret;
 	}
 
+	ret = imx290_ctrl_init(imx290);
+	if (ret < 0) {
+		dev_err(imx290->dev, "Control initialization error %d\n", ret);
+		media_entity_cleanup(&imx290->sd.entity);
+		return ret;
+	}
+
+	imx290->sd.state_lock = imx290->ctrls.lock;
+
+	v4l2_subdev_init_finalize(&imx290->sd);
+
+	state = v4l2_subdev_lock_and_get_active_state(&imx290->sd);
+	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
+	imx290_ctrl_update(imx290, format, imx290->current_mode);
+	v4l2_subdev_unlock_state(state);
+
 	return 0;
 }
 
@@ -1268,12 +1247,10 @@ static int imx290_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	mutex_init(&imx290->lock);
-
 	/* Initialize and register subdev. */
 	ret = imx290_subdev_init(imx290);
 	if (ret)
-		goto err_mutex;
+		return ret;
 
 	ret = v4l2_async_register_subdev(&imx290->sd);
 	if (ret < 0) {
@@ -1305,8 +1282,6 @@ static int imx290_probe(struct i2c_client *client)
 
 err_subdev:
 	imx290_subdev_cleanup(imx290);
-err_mutex:
-	mutex_destroy(&imx290->lock);
 
 	return ret;
 }
@@ -1319,8 +1294,6 @@ static void imx290_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	imx290_subdev_cleanup(imx290);
 
-	mutex_destroy(&imx290->lock);
-
 	pm_runtime_disable(imx290->dev);
 	if (!pm_runtime_status_suspended(imx290->dev))
 		imx290_power_off(imx290->dev);
-- 
Regards,

Laurent Pinchart

