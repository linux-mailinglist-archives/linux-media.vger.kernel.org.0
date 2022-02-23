Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 914BC4C1618
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 16:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241890AbiBWPES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 10:04:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241883AbiBWPER (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 10:04:17 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962E790CC4
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 07:03:49 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 4CCA5E000D;
        Wed, 23 Feb 2022 15:03:44 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v4 26/27] media: ov5640: Split DVP and CSI-2 formats
Date:   Wed, 23 Feb 2022 15:56:02 +0100
Message-Id: <20220223145603.121603-27-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220223145603.121603-1-jacopo@jmondi.org>
References: <20220223145603.121603-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The format enumeration list is shared between CSI-2 and DVP modes.
This lead to the enumeration of unsupported format variants in both
modes.

Separate the list of DVP and CSI-2 formats and create helpers to access
the correct one.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 125 ++++++++++++++++++++++++++-----------
 1 file changed, 88 insertions(+), 37 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 683f5795132f..2e86171f587d 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -188,11 +188,13 @@ enum ov5640_format_mux {
 	OV5640_FMT_MUX_RAW_CIP,
 };
 
-static const struct ov5640_pixfmt {
+struct ov5640_pixfmt {
 	u32 code;
 	u32 colorspace;
 	u8 bpp;
-} ov5640_formats[] = {
+};
+
+static const struct ov5640_pixfmt ov5640_dvp_formats[] = {
 	{
 		.code = MEDIA_BUS_FMT_JPEG_1X8,
 		.colorspace = V4L2_COLORSPACE_JPEG,
@@ -202,23 +204,48 @@ static const struct ov5640_pixfmt {
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.bpp = 16,
 	}, {
-		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.code = MEDIA_BUS_FMT_YUYV8_2X8,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.bpp = 16,
 	}, {
-		.code = MEDIA_BUS_FMT_YUYV8_2X8,
+		.code = MEDIA_BUS_FMT_RGB565_2X8_LE,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.bpp = 16,
 	}, {
-		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.code = MEDIA_BUS_FMT_RGB565_2X8_BE,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.bpp = 16,
 	}, {
-		.code = MEDIA_BUS_FMT_RGB565_2X8_LE,
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 8
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
 		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 8,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 8,
+	},
+	{ /* sentinel */ }
+};
+
+static const struct ov5640_pixfmt ov5640_csi2_formats[] = {
+	{
+		.code = MEDIA_BUS_FMT_JPEG_1X8,
+		.colorspace = V4L2_COLORSPACE_JPEG,
 		.bpp = 16,
 	}, {
-		.code = MEDIA_BUS_FMT_RGB565_2X8_BE,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.bpp = 16,
 	}, {
@@ -246,20 +273,9 @@ static const struct ov5640_pixfmt {
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.bpp = 8,
 	},
+	{ /* sentinel */ }
 };
 
-static u32 ov5640_code_to_bpp(u32 code)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(ov5640_formats); ++i) {
-		if (ov5640_formats[i].code == code)
-			return ov5640_formats[i].bpp;
-	}
-
-	return 0;
-}
-
 /*
  * FIXME: remove this when a subdev API becomes available
  * to set the MIPI CSI-2 virtual channel.
@@ -408,6 +424,32 @@ static inline bool ov5640_is_csi2(const struct ov5640_dev *sensor)
 	return sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY;
 }
 
+static inline const struct ov5640_pixfmt *ov5640_formats(struct ov5640_dev *sensor)
+{
+	return ov5640_is_csi2(sensor) ? ov5640_csi2_formats : ov5640_dvp_formats;
+}
+
+static const struct ov5640_pixfmt *ov5640_code_to_pixfmt(struct ov5640_dev *sensor,
+							 u32 code)
+{
+	const struct ov5640_pixfmt *formats = ov5640_formats(sensor);
+	unsigned int i;
+
+	for (i = 0; formats[i].code; ++i) {
+		if (formats[i].code == code)
+			return &formats[i];
+	}
+
+	return &formats[0];
+}
+
+static u32 ov5640_code_to_bpp(struct ov5640_dev *sensor, u32 code)
+{
+	const struct ov5640_pixfmt *format = ov5640_code_to_pixfmt(sensor, code);
+
+	return format->bpp;
+}
+
 /*
  * FIXME: all of these register tables are likely filled with
  * entries that set the register to their power-on default values,
@@ -1390,7 +1432,7 @@ static int ov5640_set_mipi_pclk(struct ov5640_dev *sensor)
 	 * (0x01=0.5ns).
 	 */
 	sample_rate = ov5640_pixel_rates[sensor->current_mode->pixel_rate]
-		    * (ov5640_code_to_bpp(fmt->code) / 8);
+		    * (ov5640_code_to_bpp(sensor, fmt->code) / 8);
 	pclk_period = 2000000000U / sample_rate;
 
 	/* Program the clock tree registers. */
@@ -1455,7 +1497,7 @@ static int ov5640_set_dvp_pclk(struct ov5640_dev *sensor)
 	int ret;
 
 	rate = ov5640_calc_pixel_rate(sensor);
-	rate *= ov5640_code_to_bpp(sensor->fmt.code);
+	rate *= ov5640_code_to_bpp(sensor, sensor->fmt.code);
 	rate /= sensor->ep.bus.parallel.bus_width;
 
 	ov5640_calc_pclk(sensor, rate, &prediv, &mult, &sysdiv, &pll_rdiv,
@@ -2689,15 +2731,18 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 				   enum ov5640_frame_rate fr,
 				   const struct ov5640_mode_info **new_mode)
 {
-	unsigned int bpp = ov5640_code_to_bpp(fmt->code);
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 	const struct ov5640_mode_info *mode;
-	int i;
+	const struct ov5640_pixfmt *pixfmt;
+	unsigned int bpp;
 
 	mode = ov5640_find_mode(sensor, fr, fmt->width, fmt->height, true);
 	if (!mode)
 		return -EINVAL;
 
+	pixfmt = ov5640_code_to_pixfmt(sensor, fmt->code);
+	bpp = pixfmt->bpp;
+
 	/*
 	 * Adjust mode according to bpp:
 	 * - 8bpp modes work for resolution >= 1280x720
@@ -2714,14 +2759,8 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 	if (new_mode)
 		*new_mode = mode;
 
-	for (i = 0; i < ARRAY_SIZE(ov5640_formats); i++)
-		if (ov5640_formats[i].code == fmt->code)
-			break;
-	if (i >= ARRAY_SIZE(ov5640_formats))
-		i = 0;
-
-	fmt->code = ov5640_formats[i].code;
-	fmt->colorspace = ov5640_formats[i].colorspace;
+	fmt->code = pixfmt->code;
+	fmt->colorspace = pixfmt->colorspace;
 	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
 	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
@@ -2763,7 +2802,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	 * progressively slow it down if it exceeds 1GHz.
 	 */
 	num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
-	bpp = ov5640_code_to_bpp(fmt->code);
+	bpp = ov5640_code_to_bpp(sensor, fmt->code);
 	do {
 		pixel_rate = ov5640_pixel_rates[pixel_rate_id];
 		link_freq = pixel_rate * bpp / (2 * num_lanes);
@@ -3461,7 +3500,8 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
-	u32 bpp = ov5640_code_to_bpp(fse->code);
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	u32 bpp = ov5640_code_to_bpp(sensor, fse->code);
 	unsigned int index = fse->index;
 
 	if (fse->pad != 0)
@@ -3588,12 +3628,23 @@ static int ov5640_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->pad != 0)
-		return -EINVAL;
-	if (code->index >= ARRAY_SIZE(ov5640_formats))
+	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	const struct ov5640_pixfmt *formats;
+	unsigned int num_formats;
+
+	if (ov5640_is_csi2(sensor)) {
+		formats = ov5640_csi2_formats;
+		num_formats = ARRAY_SIZE(ov5640_csi2_formats) - 1;
+	} else {
+		formats = ov5640_dvp_formats;
+		num_formats = ARRAY_SIZE(ov5640_dvp_formats) - 1;
+	}
+
+	if (code->index >= num_formats)
 		return -EINVAL;
 
-	code->code = ov5640_formats[code->index].code;
+	code->code = formats[code->index].code;
+
 	return 0;
 }
 
-- 
2.35.0

