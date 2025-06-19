Return-Path: <linux-media+bounces-35326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1302AE04DB
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C4F31885D77
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCB9248871;
	Thu, 19 Jun 2025 11:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjJFGiFC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CEB25BEEB
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334371; cv=none; b=SnyRyY4ropY4LG49mV6OCRx3poxlBMCjSmhmWyl2/nVPVOHTT983pBOOdNeiwKW1PzX1qDYxkGMdhpKFOCIqPA2nsMJymoAcTV/P2Rs7V2t79ZcZpxXZQOGTjb50xIzyKqIGlqK+BICX+zTlZk/OsN+klGIn3FPviwgtKw31e9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334371; c=relaxed/simple;
	bh=CAQoDp6M6IHaMOlTpObYx7rIyltzHL3FNR/N66b5TJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b2BojFF7Bb0555L5hDCNVrF7as5CJ+z5MzYOf42MCf+py/TkC64B9DTbqXpmjWgMKSDRE+k4CIcAemg4e0JUmIlRSpcY3uMCTvT4UYvbkKHJqzQD5DWXE1/lYC8oUKFFh/zLeJ2bXTPEZeHjwp6f23L2YOMOMF12FRbrie+aHt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjJFGiFC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334370; x=1781870370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CAQoDp6M6IHaMOlTpObYx7rIyltzHL3FNR/N66b5TJ0=;
  b=WjJFGiFCoNxBCntTAEe+NjKlbQtDGige3Oe1Fgo7aYiVw2oehdC2zMjg
   umvAj39f8qT8C4Kl3Yx6rtM89VhkUe/+zvicjXttjKR4fa4P7chdhLUM2
   MnKEKdwwgDh9yXF82kPIC94h9t+0UrQvl/AuuOMiWg8p93LmxJ3bBNU9b
   ixMLImkFR9s6Nb6IQPRZx/EzMpxI9gHiuQSVaL8JOJD8ejEEYWsP7xQUl
   KHUCPt/yRT6Fk100mkZMz9JMZLwIHaBBL4XKRAVvL6Rwpx3GotIExplnU
   kX/j1SUE4bTcugk8w6Jae6sH7SF+k66bofGqHpxDs/JN0NPJryFI76wiD
   A==;
X-CSE-ConnectionGUID: nyGYuW4vTtm7jo0ytWWG5Q==
X-CSE-MsgGUID: UUKook9mTnyfj7HGDi8KPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386897"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386897"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:20 -0700
X-CSE-ConnectionGUID: KklBdzHgSqyHSpisP/NVyQ==
X-CSE-MsgGUID: tGLNmcETRRePXAEq/SaVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908525"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 655A7123289;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AM0-1F;
	Thu, 19 Jun 2025 14:58:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 55/64] media: i2c: imx219: Add internal image sink pad
Date: Thu, 19 Jun 2025 14:58:27 +0300
Message-Id: <20250619115836.1946016-56-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Use the newly added internal pad API to expose the internal
configuration of the sensor to userspace in a standard manner. This also
paves the way for adding support for embedded data with an additional
internal pad.

To maintain compatibility with existing userspace that may operate on
pad 0 unconditionally, keep the source pad numbered 0 and number the
internal image pad 1.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 170 +++++++++++++++++++++++++++++--------
 1 file changed, 134 insertions(+), 36 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 6c84b7a4cc64..e8ccf2c835b3 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -139,6 +139,7 @@
 #define IMX219_DEFAULT_LINK_FREQ_4LANE	364000000
 
 /* IMX219 native and active pixel array size. */
+#define IMX219_NATIVE_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
 #define IMX219_NATIVE_WIDTH		3296U
 #define IMX219_NATIVE_HEIGHT		2480U
 #define IMX219_PIXEL_ARRAY_LEFT		8U
@@ -334,9 +335,15 @@ static const struct imx219_mode supported_modes[] = {
 	},
 };
 
+enum imx219_pad_ids {
+	IMX219_PAD_SOURCE = 0,
+	IMX219_PAD_IMAGE,
+	IMX219_NUM_PADS,
+};
+
 struct imx219 {
 	struct v4l2_subdev sd;
-	struct media_pad pad;
+	struct media_pad pads[IMX219_NUM_PADS];
 
 	struct regmap *regmap;
 	struct clk *xclk; /* system clock to IMX219 */
@@ -453,7 +460,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
-	format = v4l2_subdev_state_get_format(state, 0);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
 	rate_factor = imx219_get_rate_factor(state);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
@@ -675,8 +682,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	u32 bpp;
 	int ret = 0;
 
-	format = v4l2_subdev_state_get_format(state, 0);
-	crop = v4l2_subdev_state_get_crop(state, 0);
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
 	bpp = imx219_get_format_bpp(format);
 
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
@@ -805,10 +812,25 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 
-	if (code->index >= (ARRAY_SIZE(imx219_mbus_formats) / 4))
-		return -EINVAL;
+	if (code->pad == IMX219_PAD_IMAGE) {
+		/* The internal image pad is hardwired to the native format. */
+		if (code->index > 0)
+			return -EINVAL;
 
-	code->code = imx219_get_format_code(imx219, imx219_mbus_formats[code->index * 4]);
+		code->code = IMX219_NATIVE_FORMAT;
+	} else {
+		/*
+		 * On the source pad, the sensor supports multiple raw formats
+		 * with different bit depths.
+		 */
+		u32 format;
+
+		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4)
+			return -EINVAL;
+
+		format = imx219_mbus_formats[code->index * 4];
+		code->code = imx219_get_format_code(imx219, format);
+	}
 
 	return 0;
 }
@@ -818,19 +840,25 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx219 *imx219 = to_imx219(sd);
-	u32 code;
 
-	if (fse->index >= ARRAY_SIZE(supported_modes))
-		return -EINVAL;
-
-	code = imx219_get_format_code(imx219, fse->code);
-	if (fse->code != code)
-		return -EINVAL;
-
-	fse->min_width = supported_modes[fse->index].width;
-	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
-	fse->max_height = fse->min_height;
+	if (fse->pad == IMX219_PAD_IMAGE) {
+		if (fse->code != IMX219_NATIVE_FORMAT || fse->index > 0)
+			return -EINVAL;
+
+		fse->min_width = IMX219_NATIVE_WIDTH;
+		fse->max_width = IMX219_NATIVE_WIDTH;
+		fse->min_height = IMX219_NATIVE_HEIGHT;
+		fse->max_height = IMX219_NATIVE_HEIGHT;
+	} else {
+		if (fse->code != imx219_get_format_code(imx219, fse->code) ||
+		    fse->index >= ARRAY_SIZE(supported_modes))
+			return -EINVAL;
+
+		fse->min_width = supported_modes[fse->index].width;
+		fse->max_width = fse->min_width;
+		fse->min_height = supported_modes[fse->index].height;
+		fse->max_height = fse->min_height;
+	}
 
 	return 0;
 }
@@ -842,6 +870,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	struct imx219 *imx219 = to_imx219(sd);
 	const struct imx219_mode *mode;
 	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *compose;
 	struct v4l2_rect *crop;
 	u8 bin_h, bin_v;
 	u32 prev_line_len;
@@ -849,6 +878,13 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 	prev_line_len = format->width + imx219->hblank->val;
 
+	/*
+	 * The driver is mode-based, the format can be set on the source pad
+	 * only.
+	 */
+	if (fmt->pad != IMX219_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, state, fmt);
+
 	/*
 	 * Adjust the requested format to match the closest mode. The Bayer
 	 * order varies with flips.
@@ -867,21 +903,50 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 
+	/* Propagate the format through the sensor. */
+
+	/* The image pad models the pixel array, and thus has a fixed format. */
 	*format = fmt->format;
+	format->code = IMX219_NATIVE_FORMAT;
+	format->width = IMX219_NATIVE_WIDTH;
+	format->height = IMX219_NATIVE_HEIGHT;
 
 	/*
 	 * Use binning to maximize the crop rectangle size, and centre it in the
 	 * sensor.
 	 */
-	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
-	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
+	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / fmt->format.width, 2U);
+	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / fmt->format.height, 2U);
 
-	crop = v4l2_subdev_state_get_crop(state, 0);
-	crop->width = format->width * bin_h;
-	crop->height = format->height * bin_v;
+	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
+	crop->width = fmt->format.width * bin_h;
+	crop->height = fmt->format.height * bin_v;
 	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
 	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
 
+	/*
+	 * The compose rectangle models binning, its size is the sensor output
+	 * size.
+	 */
+	compose = v4l2_subdev_state_get_compose(state, IMX219_PAD_IMAGE);
+	compose->left = 0;
+	compose->top = 0;
+	compose->width = fmt->format.width;
+	compose->height = fmt->format.height;
+
+	/*
+	 * No mode use digital crop, the source pad crop rectangle size and
+	 * format are thus identical to the image pad compose rectangle.
+	 */
+	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_SOURCE);
+	crop->left = 0;
+	crop->top = 0;
+	crop->width = fmt->format.width;
+	crop->height = fmt->format.height;
+
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
+	*format = fmt->format;
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		int exposure_max;
 		int exposure_def;
@@ -939,12 +1004,13 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
-	switch (sel->target) {
-	case V4L2_SEL_TGT_CROP:
-		sel->r = *v4l2_subdev_state_get_crop(state, 0);
-		return 0;
+	struct v4l2_rect *compose;
 
+	switch (sel->target) {
 	case V4L2_SEL_TGT_NATIVE_SIZE:
+		if (sel->pad != IMX219_PAD_IMAGE)
+			return -EINVAL;
+
 		sel->r.top = 0;
 		sel->r.left = 0;
 		sel->r.width = IMX219_NATIVE_WIDTH;
@@ -954,11 +1020,35 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
-		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
-		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
-		sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
+		switch (sel->pad) {
+		case IMX219_PAD_IMAGE:
+			sel->r.top = IMX219_PIXEL_ARRAY_TOP;
+			sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
+			sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
+			sel->r.height = IMX219_PIXEL_ARRAY_HEIGHT;
+			return 0;
+
+		case IMX219_PAD_SOURCE:
+			compose = v4l2_subdev_state_get_compose(state,
+								IMX219_PAD_IMAGE);
+			sel->r.top = 0;
+			sel->r.left = 0;
+			sel->r.width = compose->width;
+			sel->r.height = compose->height;
+			return 0;
+		}
+
+		break;
+
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
+		return 0;
+
+	case V4L2_SEL_TGT_COMPOSE:
+		if (sel->pad != IMX219_PAD_IMAGE)
+			return -EINVAL;
 
+		sel->r = *v4l2_subdev_state_get_compose(state, sel->pad);
 		return 0;
 	}
 
@@ -970,7 +1060,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 {
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
-		.pad = 0,
+		.pad = IMX219_PAD_SOURCE,
 		.format = {
 			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
 			.width = supported_modes[0].width,
@@ -1244,10 +1334,18 @@ static int imx219_probe(struct i2c_client *client)
 	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-	/* Initialize source pad */
-	imx219->pad.flags = MEDIA_PAD_FL_SOURCE;
+	/*
+	 * Initialize the pads. To preserve backward compatibility with
+	 * userspace that used the sensor before the introduction of the
+	 * internal image pad, the external source pad is numbered 0 and the
+	 * internal image pad numbered 1.
+	 */
+	imx219->pads[IMX219_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	imx219->pads[IMX219_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK
+					     | MEDIA_PAD_FL_INTERNAL;
 
-	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
+	ret = media_entity_pads_init(&imx219->sd.entity,
+				     ARRAY_SIZE(imx219->pads), imx219->pads);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to init entity pads\n");
 		goto error_handler_free;
-- 
2.39.5


