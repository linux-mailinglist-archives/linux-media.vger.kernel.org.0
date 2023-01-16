Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8FD66C2F2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbjAPO4j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:56:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbjAPO4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:56:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6270D1F5C7
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:45:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E439DD82;
        Mon, 16 Jan 2023 15:45:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880311;
        bh=pWQQuI9lj05NMacRoJ4GxngeMxgk0Qd0m5eV12h+N5g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SH9XqPWUg2VVeYz4Zyb14e9WSm+gQlaU4Uiyb/s8A2RlFegmlNad+OkLkXTC7SznD
         8O7kY67/Nt0SLKvhxAIDAk3z+UXz8aPOcJgvuqYOsCPDDbdiIaNu+q0tFCtSCe2eGF
         TkzhViBNAKf66zbaJpI7kLuIPgV8xCl9WbxTivko=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 12/17] media: i2c: imx290: Rename, extend and expand usage of imx290_pixfmt
Date:   Mon, 16 Jan 2023 16:44:49 +0200
Message-Id: <20230116144454.1012-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
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

The imx290_pixfmt structure contains information about formats,
currently limited to the bpp value. Extend it with the register settings
for each format, and rename it to imx290_format_info to make its purpose
clearer. Add a function named imx290_format_info() to look up format
info for a media bus code, and use it through the code. This allows
dropping the imx290 bpp field as the value is now looked up dynamically.

The error handling in imx290_setup_format() can also be dropped, as the
format is guaranteed by imx290_set_fmt() to be valid.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes since v2:

- Pass format to imx290_ctrl_update()
---
 drivers/media/i2c/imx290.c | 94 +++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 74b9a7110709..7356279822e8 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -182,7 +182,6 @@ struct imx290 {
 	struct media_pad pad;
 
 	const struct imx290_mode *current_mode;
-	u8 bpp;
 
 	struct regulator_bulk_data supplies[IMX290_NUM_SUPPLIES];
 	struct gpio_desc *rst_gpio;
@@ -414,16 +413,41 @@ static inline int imx290_modes_num(const struct imx290 *imx290)
 		return ARRAY_SIZE(imx290_modes_4lanes);
 }
 
-struct imx290_pixfmt {
+struct imx290_format_info {
 	u32 code;
 	u8 bpp;
+	const struct imx290_regval *regs;
+	unsigned int num_regs;
 };
 
-static const struct imx290_pixfmt imx290_formats[] = {
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
-	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
+static const struct imx290_format_info imx290_formats[] = {
+	{
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.bpp = 10,
+		.regs = imx290_10bit_settings,
+		.num_regs = ARRAY_SIZE(imx290_10bit_settings),
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.bpp = 12,
+		.regs = imx290_12bit_settings,
+		.num_regs = ARRAY_SIZE(imx290_12bit_settings),
+	}
 };
 
+static const struct imx290_format_info *imx290_format_info(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx290_formats); ++i) {
+		const struct imx290_format_info *info = &imx290_formats[i];
+
+		if (info->code == code)
+			return info;
+	}
+
+	return NULL;
+}
+
 /* -----------------------------------------------------------------------------
  * Register access
  */
@@ -516,40 +540,31 @@ static int imx290_set_data_lanes(struct imx290 *imx290)
 }
 
 static int imx290_set_black_level(struct imx290 *imx290,
+				  const struct v4l2_mbus_framefmt *format,
 				  unsigned int black_level, int *err)
 {
+	unsigned int bpp = imx290_format_info(format->code)->bpp;
+
 	return imx290_write(imx290, IMX290_BLKLEVEL,
-			    black_level >> (16 - imx290->bpp), err);
+			    black_level >> (16 - bpp), err);
 }
 
 static int imx290_setup_format(struct imx290 *imx290,
 			       const struct v4l2_mbus_framefmt *format)
 {
-	const struct imx290_regval *regs;
-	unsigned int num_regs;
+	const struct imx290_format_info *info;
 	int ret;
 
-	switch (format->code) {
-	case MEDIA_BUS_FMT_SRGGB10_1X10:
-		regs = imx290_10bit_settings;
-		num_regs = ARRAY_SIZE(imx290_10bit_settings);
-		break;
-	case MEDIA_BUS_FMT_SRGGB12_1X12:
-		regs = imx290_12bit_settings;
-		num_regs = ARRAY_SIZE(imx290_12bit_settings);
-		break;
-	default:
-		dev_err(imx290->dev, "Unknown pixel format\n");
-		return -EINVAL;
-	}
+	info = imx290_format_info(format->code);
 
-	ret = imx290_set_register_array(imx290, regs, num_regs);
+	ret = imx290_set_register_array(imx290, info->regs, info->num_regs);
 	if (ret < 0) {
 		dev_err(imx290->dev, "Could not set format registers\n");
 		return ret;
 	}
 
-	return imx290_set_black_level(imx290, IMX290_BLACK_LEVEL_DEFAULT, &ret);
+	return imx290_set_black_level(imx290, format,
+				      IMX290_BLACK_LEVEL_DEFAULT, &ret);
 }
 
 /* ----------------------------------------------------------------------------
@@ -592,7 +607,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	case V4L2_CID_TEST_PATTERN:
 		if (ctrl->val) {
-			imx290_set_black_level(imx290, 0, &ret);
+			imx290_set_black_level(imx290, format, 0, &ret);
 			usleep_range(10000, 11000);
 			imx290_write(imx290, IMX290_PGCTRL,
 				     (u8)(IMX290_PGCTRL_REGEN |
@@ -601,8 +616,8 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		} else {
 			imx290_write(imx290, IMX290_PGCTRL, 0x00, &ret);
 			usleep_range(10000, 11000);
-			imx290_set_black_level(imx290, IMX290_BLACK_LEVEL_DEFAULT,
-					       &ret);
+			imx290_set_black_level(imx290, format,
+					       IMX290_BLACK_LEVEL_DEFAULT, &ret);
 		}
 		break;
 
@@ -632,6 +647,7 @@ static const char * const imx290_test_pattern_menu[] = {
 };
 
 static void imx290_ctrl_update(struct imx290 *imx290,
+			       const struct v4l2_mbus_framefmt *format,
 			       const struct imx290_mode *mode)
 {
 	unsigned int hblank = mode->hmax - mode->width;
@@ -641,7 +657,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 
 	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
 	pixel_rate = link_freq * 2 * imx290->nlanes;
-	do_div(pixel_rate, imx290->bpp);
+	do_div(pixel_rate, imx290_format_info(format->code)->bpp);
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
 	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, pixel_rate);
@@ -843,8 +859,7 @@ static int imx290_enum_frame_size(struct v4l2_subdev *sd,
 	const struct imx290 *imx290 = to_imx290(sd);
 	const struct imx290_mode *imx290_modes = imx290_modes_ptr(imx290);
 
-	if ((fse->code != imx290_formats[0].code) &&
-	    (fse->code != imx290_formats[1].code))
+	if (!imx290_format_info(fse->code))
 		return -EINVAL;
 
 	if (fse->index >= imx290_modes_num(imx290))
@@ -865,7 +880,6 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 	struct imx290 *imx290 = to_imx290(sd);
 	const struct imx290_mode *mode;
 	struct v4l2_mbus_framefmt *format;
-	unsigned int i;
 
 	mode = v4l2_find_nearest_size(imx290_modes_ptr(imx290),
 				      imx290_modes_num(imx290), width, height,
@@ -874,23 +888,17 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
 
-	for (i = 0; i < ARRAY_SIZE(imx290_formats); i++)
-		if (imx290_formats[i].code == fmt->format.code)
-			break;
+	if (!imx290_format_info(fmt->format.code))
+		fmt->format.code = imx290_formats[0].code;
 
-	if (i >= ARRAY_SIZE(imx290_formats))
-		i = 0;
-
-	fmt->format.code = imx290_formats[i].code;
 	fmt->format.field = V4L2_FIELD_NONE;
 
 	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		imx290->current_mode = mode;
-		imx290->bpp = imx290_formats[i].bpp;
 
-		imx290_ctrl_update(imx290, mode);
+		imx290_ctrl_update(imx290, &fmt->format, mode);
 	}
 
 	*format = fmt->format;
@@ -981,10 +989,11 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
 static int imx290_subdev_init(struct imx290 *imx290)
 {
 	struct i2c_client *client = to_i2c_client(imx290->dev);
+	const struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_state *state;
 	int ret;
 
 	imx290->current_mode = &imx290_modes_ptr(imx290)[0];
-	imx290->bpp = imx290_formats[0].bpp;
 
 	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
 	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
@@ -1013,7 +1022,10 @@ static int imx290_subdev_init(struct imx290 *imx290)
 		goto err_ctrls;
 	}
 
-	imx290_ctrl_update(imx290, imx290->current_mode);
+	state = v4l2_subdev_lock_and_get_active_state(&imx290->sd);
+	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
+	imx290_ctrl_update(imx290, format, imx290->current_mode);
+	v4l2_subdev_unlock_state(state);
 
 	return 0;
 
-- 
Regards,

Laurent Pinchart

