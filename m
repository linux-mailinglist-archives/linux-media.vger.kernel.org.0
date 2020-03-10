Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0D217FBFD
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731647AbgCJNRt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:17:49 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:48830 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731440AbgCJNRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:17:41 -0400
X-IronPort-AV: E=Sophos;i="5.70,537,1574089200"; 
   d="scan'208";a="41284254"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Mar 2020 22:17:40 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 542CB4290414;
        Tue, 10 Mar 2020 22:17:38 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/3] media: i2c: imx219: Add support for RAW8 bit bayer format
Date:   Tue, 10 Mar 2020 13:17:08 +0000
Message-Id: <1583846229-6799-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583846229-6799-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1583846229-6799-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

IMX219 sensor is capable for RAW8/RAW10 modes. This commit adds support
for RAW8 bayer format.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 148 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 116 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 16010ca..3207487 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -168,15 +168,12 @@ static const struct imx219_reg mode_3280x2464_regs[] = {
 	{0x0171, 0x01},
 	{0x0174, 0x00},
 	{0x0175, 0x00},
-	{0x018c, 0x0a},
-	{0x018d, 0x0a},
 	{0x0301, 0x05},
 	{0x0303, 0x01},
 	{0x0304, 0x03},
 	{0x0305, 0x03},
 	{0x0306, 0x00},
 	{0x0307, 0x39},
-	{0x0309, 0x0a},
 	{0x030b, 0x01},
 	{0x030c, 0x00},
 	{0x030d, 0x72},
@@ -230,15 +227,12 @@ static const struct imx219_reg mode_1920_1080_regs[] = {
 	{0x0171, 0x01},
 	{0x0174, 0x00},
 	{0x0175, 0x00},
-	{0x018c, 0x0a},
-	{0x018d, 0x0a},
 	{0x0301, 0x05},
 	{0x0303, 0x01},
 	{0x0304, 0x03},
 	{0x0305, 0x03},
 	{0x0306, 0x00},
 	{0x0307, 0x39},
-	{0x0309, 0x0a},
 	{0x030b, 0x01},
 	{0x030c, 0x00},
 	{0x030d, 0x72},
@@ -290,15 +284,12 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
 	{0x0171, 0x01},
 	{0x0174, 0x01},
 	{0x0175, 0x01},
-	{0x018c, 0x0a},
-	{0x018d, 0x0a},
 	{0x0301, 0x05},
 	{0x0303, 0x01},
 	{0x0304, 0x03},
 	{0x0305, 0x03},
 	{0x0306, 0x00},
 	{0x0307, 0x39},
-	{0x0309, 0x0a},
 	{0x030b, 0x01},
 	{0x030c, 0x00},
 	{0x030d, 0x72},
@@ -322,6 +313,18 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
 	{0x0163, 0x78},
 };
 
+static const struct imx219_reg raw8_framefmt_regs[] = {
+	{0x018c, 0x08},
+	{0x018d, 0x08},
+	{0x0309, 0x08},
+};
+
+static const struct imx219_reg raw10_framefmt_regs[] = {
+	{0x018c, 0x0a},
+	{0x018d, 0x0a},
+	{0x0309, 0x0a},
+};
+
 static const char * const imx219_test_pattern_menu[] = {
 	"Disabled",
 	"Color Bars",
@@ -349,6 +352,27 @@ static const char * const imx219_supply_name[] = {
 #define IMX219_NUM_SUPPLIES ARRAY_SIZE(imx219_supply_name)
 
 /*
+ * The supported formats.
+ * This table MUST contain 4 entries per format, to cover the various flip
+ * combinations in the order
+ * - no flip
+ * - h flip
+ * - v flip
+ * - h&v flips
+ */
+static const u32 codes[] = {
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+
+	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	MEDIA_BUS_FMT_SGBRG8_1X8,
+	MEDIA_BUS_FMT_SBGGR8_1X8,
+};
+
+/*
  * Initialisation delay between XCLR low->high and the moment when the sensor
  * can start capture (i.e. can leave software stanby) must be not less than:
  *   t4 + max(t5, t6 + <time to initialize the sensor register over I2C>)
@@ -413,6 +437,8 @@ struct imx219 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
+	struct v4l2_mbus_framefmt fmt;
+
 	struct clk *xclk; /* system clock to IMX219 */
 	u32 xclk_freq;
 
@@ -519,19 +545,40 @@ static int imx219_write_regs(struct imx219 *imx219,
 }
 
 /* Get bayer order based on flip setting. */
-static u32 imx219_get_format_code(struct imx219 *imx219)
+static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 {
-	/*
-	 * Only one bayer order is supported.
-	 * It depends on the flip settings.
-	 */
-	static const u32 codes[2][2] = {
-		{ MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SGRBG10_1X10, },
-		{ MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SBGGR10_1X10, },
-	};
+	unsigned int i;
 
 	lockdep_assert_held(&imx219->mutex);
-	return codes[imx219->vflip->val][imx219->hflip->val];
+
+	for (i = 0; i < ARRAY_SIZE(codes); i++)
+		if (codes[i] == code)
+			break;
+
+	if (i >= ARRAY_SIZE(codes))
+		i = 0;
+
+	i = (i & ~3) | (imx219->vflip->val ? 2 : 0) |
+	    (imx219->hflip->val ? 1 : 0);
+
+	return codes[i];
+}
+
+static void imx219_set_default_format(struct imx219 *imx219)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = &imx219->fmt;
+	fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
+							  fmt->colorspace,
+							  fmt->ycbcr_enc);
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+	fmt->width = supported_modes[0].width;
+	fmt->height = supported_modes[0].height;
+	fmt->field = V4L2_FIELD_NONE;
 }
 
 static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
@@ -545,7 +592,8 @@ static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	/* Initialize try_fmt */
 	try_fmt->width = supported_modes[0].width;
 	try_fmt->height = supported_modes[0].height;
-	try_fmt->code = imx219_get_format_code(imx219);
+	try_fmt->code = imx219_get_format_code(imx219,
+					       MEDIA_BUS_FMT_SRGGB10_1X10);
 	try_fmt->field = V4L2_FIELD_NONE;
 
 	mutex_unlock(&imx219->mutex);
@@ -648,14 +696,10 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 
-	/*
-	 * Only one bayer order is supported (though it depends on the flip
-	 * settings)
-	 */
-	if (code->index > 0)
+	if (code->index >= (ARRAY_SIZE(codes) / 4))
 		return -EINVAL;
 
-	code->code = imx219_get_format_code(imx219);
+	code->code = imx219_get_format_code(imx219, codes[code->index * 4]);
 
 	return 0;
 }
@@ -669,7 +713,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
-	if (fse->code != imx219_get_format_code(imx219))
+	if (fse->code != imx219_get_format_code(imx219, imx219->fmt.code))
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
@@ -696,9 +740,7 @@ static void imx219_update_pad_format(struct imx219 *imx219,
 {
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
-	fmt->format.code = imx219_get_format_code(imx219);
 	fmt->format.field = V4L2_FIELD_NONE;
-
 	imx219_reset_colorspace(&fmt->format);
 }
 
@@ -710,10 +752,12 @@ static int __imx219_get_pad_format(struct imx219 *imx219,
 		struct v4l2_mbus_framefmt *try_fmt =
 			v4l2_subdev_get_try_format(&imx219->sd, cfg, fmt->pad);
 		/* update the code which could change due to vflip or hflip: */
-		try_fmt->code = imx219_get_format_code(imx219);
+		try_fmt->code = imx219_get_format_code(imx219, try_fmt->code);
 		fmt->format = *try_fmt;
 	} else {
 		imx219_update_pad_format(imx219, imx219->mode, fmt);
+		fmt->format.code = imx219_get_format_code(imx219,
+							  imx219->fmt.code);
 	}
 
 	return 0;
@@ -741,11 +785,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx219_mode *mode;
 	struct v4l2_mbus_framefmt *framefmt;
 	int exposure_max, exposure_def, hblank;
+	unsigned int i;
 
 	mutex_lock(&imx219->mutex);
 
+	for (i = 0; i < ARRAY_SIZE(codes); i++)
+		if (codes[i] == fmt->format.code)
+			break;
+	if (i >= ARRAY_SIZE(codes))
+		i = 0;
+
 	/* Bayer order varies with flips */
-	fmt->format.code = imx219_get_format_code(imx219);
+	fmt->format.code = imx219_get_format_code(imx219, codes[i]);
 
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
@@ -755,7 +806,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		framefmt = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
 		*framefmt = fmt->format;
-	} else if (imx219->mode != mode) {
+	} else if (imx219->mode != mode ||
+		   imx219->fmt.code != fmt->format.code) {
+		imx219->fmt = fmt->format;
 		imx219->mode = mode;
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
@@ -786,6 +839,27 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx219_set_framefmt(struct imx219 *imx219)
+{
+	switch (imx219->fmt.code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		return imx219_write_regs(imx219, raw8_framefmt_regs,
+					ARRAY_SIZE(raw8_framefmt_regs));
+
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+		return imx219_write_regs(imx219, raw10_framefmt_regs,
+					ARRAY_SIZE(raw10_framefmt_regs));
+	}
+
+	return -EINVAL;
+}
+
 static int imx219_start_streaming(struct imx219 *imx219)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
@@ -800,6 +874,13 @@ static int imx219_start_streaming(struct imx219 *imx219)
 		return ret;
 	}
 
+	ret = imx219_set_framefmt(imx219);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set frame format: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	/* Apply customized values from user */
 	ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
 	if (ret)
@@ -1253,6 +1334,9 @@ static int imx219_probe(struct i2c_client *client)
 	/* Initialize source pad */
 	imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
 
+	/* Initialize default format */
+	imx219_set_default_format(imx219);
+
 	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
 	if (ret) {
 		dev_err(dev, "failed to init entity pads: %d\n", ret);
-- 
2.7.4

