Return-Path: <linux-media+bounces-14419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FBB91D20C
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 16:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBD7A28141B
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 14:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255551534E9;
	Sun, 30 Jun 2024 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NnqetC8W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5856012D1E0;
	Sun, 30 Jun 2024 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719757126; cv=none; b=F3AN0xZoYzw0fSGu2yE7+2p2UwXcXCyidR/Z25uBi5yD+T9Er3XYXryQduBH/2lHbXf4aBDmnhEJOz/Fw0AS3euqP1+MrCDmy3NcEIB8QcT1BBzOFBJypwbqnu0vrLTkNV1x1xAKVmzehvmC7MTUa4SvA4NXDxkgacz9psXKwtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719757126; c=relaxed/simple;
	bh=OVsNgtZHG6YIHAM/JCj1v+25Se97q9Bv0khgp+UcQRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcJbx/pfg6P5nMG9fed1/4K24CmfNhh9rS/u/lIs5/x+r68BNbZx1IbM00gKoYh2NHuIFmsR+BZPRJ9f86mte8p7I8i1whHwUJq5gZ0bBelL7U8QDnW749gFRF4mZattFwis73X2++laigPkIXKlWHWRQNezXCphA4IifVVMD0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NnqetC8W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-36-175-nat.elisa-mobile.fi [85.76.36.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F000A75A;
	Sun, 30 Jun 2024 16:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719757089;
	bh=OVsNgtZHG6YIHAM/JCj1v+25Se97q9Bv0khgp+UcQRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NnqetC8WkZjuczu9ahoqSrw4FWW4A/0Rxr95QEoL2pFvM3q9j6zV+E4joMpKTt48e
	 4gDV1/VSTFZOfnNRXRSdyw+eGfdgF6/1h+elwAojjDiD680bIbqZGjShcQMaQuKOMF
	 4tbfpYZO3Cew8emwaCLF+KL2/BIr+JcvykCSH428=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH/RFC v1 4/9] media: i2c: ar0144: Add internal image sink pad
Date: Sun, 30 Jun 2024 17:17:54 +0300
Message-ID: <20240630141802.15830-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
References: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the in-development internal pad API to expose the internal
configuration of the sensor to userspace in a standard manner. This also
paves the way for adding support for embedded data with an additional
internal pad.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ar0144.c | 277 ++++++++++++++++++++++++++-----------
 1 file changed, 193 insertions(+), 84 deletions(-)

diff --git a/drivers/media/i2c/ar0144.c b/drivers/media/i2c/ar0144.c
index d231459d7218..2d3ce05f85ac 100644
--- a/drivers/media/i2c/ar0144.c
+++ b/drivers/media/i2c/ar0144.c
@@ -334,6 +334,12 @@
 
 #define AR0144_NUM_SUPPLIES			3
 
+enum ar0144_pad_ids {
+	AR0144_PAD_SOURCE = 0,
+	AR0144_PAD_IMAGE,
+	AR0144_NUM_PADS,
+};
+
 struct ar0144_model {
 	bool mono;
 };
@@ -353,6 +359,10 @@ static const struct ar0144_model ar0144_model_mono = {
 	.mono = true,
 };
 
+/*
+ * Keep the entries sorted by descending bit depth. The top entry is used as
+ * the default media bus code, as well as the native code for the image pad.
+ */
 static const struct ar0144_format_info ar0144_formats[] = {
 	{
 		.colour = MEDIA_BUS_FMT_SGRBG12_1X12,
@@ -389,7 +399,7 @@ struct ar0144 {
 	u32 valid_formats;
 
 	struct v4l2_subdev sd;
-	struct media_pad pad;
+	struct media_pad pads[AR0144_NUM_PADS];
 
 	const struct ar0144_model *model;
 
@@ -511,12 +521,14 @@ static int ar0144_start_streaming(struct ar0144 *sensor,
 	const struct v4l2_mbus_framefmt *format;
 	const struct ar0144_format_info *info;
 	const struct v4l2_rect *crop;
+	const struct v4l2_rect *compose;
 	unsigned int bin_x, bin_y;
 	int ret = 0;
 	u16 val;
 
-	format = v4l2_subdev_state_get_format(state, 0);
-	crop = v4l2_subdev_state_get_crop(state, 0);
+	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	crop = v4l2_subdev_state_get_crop(state, AR0144_PAD_IMAGE);
+	compose = v4l2_subdev_state_get_compose(state, AR0144_PAD_IMAGE);
 	info = ar0144_format_info(sensor, format->code, true);
 
 	ret = ar0144_configure_pll(sensor);
@@ -539,8 +551,8 @@ static int ar0144_start_streaming(struct ar0144 *sensor,
 	cci_write(sensor->regmap, AR0144_Y_ADDR_END,
 		  crop->top + crop->height - 1, &ret);
 
-	bin_x = crop->width / format->width;
-	bin_y = crop->height / format->height;
+	bin_x = crop->width / compose->width;
+	bin_y = crop->height / compose->height;
 
 	cci_write(sensor->regmap, AR0144_X_ODD_INC, (bin_x << 1) - 1, &ret);
 	cci_write(sensor->regmap, AR0144_Y_ODD_INC, (bin_y << 1) - 1, &ret);
@@ -811,7 +823,7 @@ static void ar0144_update_blanking(struct ar0144 *sensor,
 	unsigned int min;
 	unsigned int max;
 
-	crop = v4l2_subdev_state_get_crop(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, AR0144_PAD_IMAGE);
 
 	/*
 	 * Horizontally, the line length (in pixel clocks), programmed in the
@@ -861,9 +873,9 @@ static int ar0144_s_ctrl(struct v4l2_ctrl *ctrl)
 	 * configuration.
 	 */
 	state = v4l2_subdev_get_locked_active_state(&sensor->sd);
-	format = v4l2_subdev_state_get_format(state, 0);
+	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
 	info = ar0144_format_info(sensor, format->code, true);
-	crop = v4l2_subdev_state_get_crop(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, AR0144_PAD_IMAGE);
 
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
@@ -1090,24 +1102,44 @@ static int ar0144_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct ar0144 *sensor = to_ar0144(sd);
-	unsigned int index = 0;
-	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(ar0144_formats); ++i) {
-		const struct ar0144_format_info *info = &ar0144_formats[i];
+	switch (code->pad) {
+	case AR0144_PAD_IMAGE: {
+		const struct ar0144_format_info *info;
 
-		if (!(sensor->valid_formats & BIT(i)))
-			continue;
+		/* The internal image pad is hardwired to the native format. */
+		if (code->index > 0)
+			return -EINVAL;
 
-		if (code->index == index) {
-			code->code = ar0144_format_code(sensor, info);
-			return 0;
-		}
-
-		index++;
+		info = &ar0144_formats[0];
+		code->code = ar0144_format_code(sensor, info);
+		return 0;
 	}
 
-	return -EINVAL;
+	case AR0144_PAD_SOURCE: {
+		unsigned int index = 0;
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(ar0144_formats); ++i) {
+			const struct ar0144_format_info *info = &ar0144_formats[i];
+
+			if (!(sensor->valid_formats & BIT(i)))
+				continue;
+
+			if (code->index == index) {
+				code->code = ar0144_format_code(sensor, info);
+				return 0;
+			}
+
+			index++;
+		}
+
+		return -EINVAL;
+	}
+
+	default:
+		return -EINVAL;
+	}
 }
 
 static int ar0144_enum_frame_size(struct v4l2_subdev *sd,
@@ -1116,26 +1148,35 @@ static int ar0144_enum_frame_size(struct v4l2_subdev *sd,
 {
 	struct ar0144 *sensor = to_ar0144(sd);
 	const struct ar0144_format_info *info;
-	const struct v4l2_rect *crop;
+	const struct v4l2_mbus_framefmt *fmt;
 
-	info = ar0144_format_info(sensor, fse->code, false);
-	if (!info)
+	if (fse->index > 0)
 		return -EINVAL;
 
-	/*
-	 * Enumerate binning/skipping. Supported factors are powers of two from
-	 * /1 to /16.
-	 */
+	switch (fse->pad) {
+	case AR0144_PAD_IMAGE:
+		if (fse->code != ar0144_format_code(sensor, &ar0144_formats[0]))
+			return -EINVAL;
 
-	if (fse->index >= 5)
+		fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_IMAGE);
+		break;
+
+	case AR0144_PAD_SOURCE:
+		info = ar0144_format_info(sensor, fse->code, false);
+		if (!info)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+		break;
+
+	default:
 		return -EINVAL;
+	}
 
-	crop = v4l2_subdev_state_get_crop(state, fse->pad);
-
-	fse->min_width = crop->width / (1 << fse->index);
-	fse->max_width = fse->min_width;
-	fse->min_height = crop->height / (1 << fse->index);
-	fse->max_height = fse->min_height;
+	fse->min_width = fmt->width;
+	fse->max_width = fmt->width;
+	fse->min_height = fmt->height;
+	fse->max_height = fmt->height;
 
 	return 0;
 }
@@ -1147,31 +1188,22 @@ static int ar0144_set_fmt(struct v4l2_subdev *sd,
 	struct ar0144 *sensor = to_ar0144(sd);
 	const struct ar0144_format_info *info;
 	struct v4l2_mbus_framefmt *fmt;
-	const struct v4l2_rect *crop;
-	unsigned int bin_x, bin_y;
 
 	if (v4l2_subdev_is_streaming(sd) &&
 	    format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EBUSY;
 
-	fmt = v4l2_subdev_state_get_format(state, format->pad);
-	crop = v4l2_subdev_state_get_crop(state, format->pad);
-
-	info = ar0144_format_info(sensor, format->format.code, true);
-	fmt->code = ar0144_format_code(sensor, info);
+	/* The format can only be set on the source pad. */
+	if (format->pad != AR0144_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, state, format);
 
 	/*
-	 * The output size results from the binning/skipping applied to the
-	 * crop rectangle. The x/y increments must be powers of 2. Clamp the
-	 * width/height first, to avoid both divisions by 0 and the undefined
-	 * behaviour of roundup_pow_of_two(0).
+	 * Only the media bus code can be updated on the source pad, dimensions
+	 * are set by the compose on the image pad rectangle.
 	 */
-	fmt->width = clamp(format->format.width, 1U, crop->width);
-	fmt->height = clamp(format->format.height, 1U, crop->height);
-	bin_x = clamp(roundup_pow_of_two(crop->width / fmt->width), 1, 16);
-	bin_y = clamp(roundup_pow_of_two(crop->height / fmt->height), 1, 16);
-	fmt->width = crop->width / bin_x;
-	fmt->height = crop->height / bin_y;
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	info = ar0144_format_info(sensor, format->format.code, true);
+	fmt->code = ar0144_format_code(sensor, info);
 
 	format->format = *fmt;
 
@@ -1188,11 +1220,14 @@ static int ar0144_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
-	switch (sel->target) {
-	case V4L2_SEL_TGT_CROP:
-		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
-		break;
+	/*
+	 * The sensor doesn't support output crop, selection rectangles are
+	 * supported on the internal image pad only.
+	 */
+	if (sel->pad != AR0144_PAD_IMAGE)
+		return -EINVAL;
 
+	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 		sel->r.left = (AR0144_PIXEL_ARRAY_ACTIVE_WIDTH - AR0144_DEF_WIDTH) / 2;
 		sel->r.top = (AR0144_PIXEL_ARRAY_ACTIVE_HEIGHT - AR0144_DEF_HEIGHT) / 2;
@@ -1207,6 +1242,14 @@ static int ar0144_get_selection(struct v4l2_subdev *sd,
 		sel->r.height = AR0144_PIXEL_ARRAY_ACTIVE_HEIGHT;
 		break;
 
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(state, AR0144_PAD_IMAGE);
+		break;
+
+	case V4L2_SEL_TGT_COMPOSE:
+		sel->r = *v4l2_subdev_state_get_compose(state, AR0144_PAD_IMAGE);
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -1219,31 +1262,72 @@ static int ar0144_set_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_selection *sel)
 {
 	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_rect *compose;
 	struct v4l2_rect *crop;
+	unsigned int bin_x, bin_y;
+
+	/*
+	 * The sensor doesn't support output crop, selection rectangles are
+	 * supported on the internal image pad only.
+	 */
+	if (sel->pad != AR0144_PAD_IMAGE)
+		return -EINVAL;
 
 	if (v4l2_subdev_is_streaming(sd) &&
 	    sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EBUSY;
 
-	if (sel->target != V4L2_SEL_TGT_CROP)
+	crop = v4l2_subdev_state_get_crop(state, AR0144_PAD_IMAGE);
+	compose = v4l2_subdev_state_get_compose(state, AR0144_PAD_IMAGE);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		crop->left = min_t(unsigned int, ALIGN(sel->r.left, 2),
+				   AR0144_PIXEL_ARRAY_ACTIVE_WIDTH -
+				   AR0144_MIN_WIDTH);
+		crop->top = min_t(unsigned int, ALIGN(sel->r.top, 2),
+				  AR0144_PIXEL_ARRAY_ACTIVE_HEIGHT -
+				  AR0144_MIN_HEIGHT);
+		crop->width = clamp(sel->r.width, AR0144_MIN_WIDTH,
+				    AR0144_PIXEL_ARRAY_ACTIVE_WIDTH -
+				    crop->left);
+		crop->height = clamp(sel->r.height, AR0144_MIN_HEIGHT,
+				     AR0144_PIXEL_ARRAY_ACTIVE_HEIGHT -
+				     crop->top);
+
+		sel->r = *crop;
+
+		compose->width = crop->width;
+		compose->height = crop->height;
+		break;
+
+	case V4L2_SEL_TGT_COMPOSE:
+		/*
+		 * The output size results from the binning/skipping applied to
+		 * the crop rectangle. The x/y increments must be powers of 2.
+		 * Clamp the width/height first, to avoid both divisions by 0
+		 * and the undefined behaviour of roundup_pow_of_two(0).
+		 */
+		compose->width = clamp(sel->r.width, 1U, crop->width);
+		compose->height = clamp(sel->r.height, 1U, crop->height);
+		bin_x = clamp(roundup_pow_of_two(crop->width / compose->width),
+			      1, 16);
+		bin_y = clamp(roundup_pow_of_two(crop->height / compose->height),
+			      1, 16);
+		compose->width = crop->width / bin_x;
+		compose->height = crop->height / bin_y;
+
+		sel->r = *compose;
+		break;
+
+	default:
 		return -EINVAL;
+	}
 
-	crop = v4l2_subdev_state_get_crop(state, 0);
-	fmt = v4l2_subdev_state_get_format(state, 0);
-
-	crop->left = min_t(unsigned int, ALIGN(sel->r.left, 2),
-			   AR0144_PIXEL_ARRAY_ACTIVE_WIDTH - AR0144_MIN_WIDTH);
-	crop->top = min_t(unsigned int, ALIGN(sel->r.top, 2),
-			AR0144_PIXEL_ARRAY_ACTIVE_HEIGHT - AR0144_MIN_HEIGHT);
-	crop->width = clamp(sel->r.width, AR0144_MIN_WIDTH,
-			    AR0144_PIXEL_ARRAY_ACTIVE_WIDTH - crop->left);
-	crop->height = clamp(sel->r.height, AR0144_MIN_HEIGHT,
-			     AR0144_PIXEL_ARRAY_ACTIVE_HEIGHT - crop->top);
-
-	sel->r = *crop;
-
-	fmt->width = crop->width;
-	fmt->height = crop->height;
+	/* Propagate the compose rectangle to the output format. */
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
+	fmt->width = compose->width;
+	fmt->height = compose->height;
 
 	return 0;
 }
@@ -1257,8 +1341,11 @@ static int ar0144_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	struct v4l2_subdev_state *state;
 	u32 code;
 
+	if (pad != AR0144_PAD_SOURCE)
+		return -EINVAL;
+
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	fmt = v4l2_subdev_state_get_format(state, 0);
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
 	code = fmt->code;
 	v4l2_subdev_unlock_state(state);
 
@@ -1338,10 +1425,35 @@ static int ar0144_entity_init_state(struct v4l2_subdev *sd,
 	struct ar0144 *sensor = to_ar0144(sd);
 	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_rect *crop;
+	struct v4l2_rect *compose;
+
+	info = &ar0144_formats[0];
+
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_IMAGE);
+	fmt->width = AR0144_PIXEL_ARRAY_ACTIVE_WIDTH;
+	fmt->height = AR0144_PIXEL_ARRAY_ACTIVE_HEIGHT;
+	fmt->code = ar0144_format_code(sensor, info);
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+
+	crop = v4l2_subdev_state_get_crop(state, AR0144_PAD_IMAGE);
+	crop->left = 4;
+	crop->top = 4;
+	crop->width = AR0144_DEF_WIDTH;
+	crop->height = AR0144_DEF_HEIGHT;
+
+	compose = v4l2_subdev_state_get_compose(state, AR0144_PAD_IMAGE);
+	compose->left = 0;
+	compose->top = 0;
+	compose->width = AR0144_DEF_WIDTH;
+	compose->height = AR0144_DEF_HEIGHT;
 
 	info = ar0144_format_info(sensor, 0, true);
 
-	fmt = v4l2_subdev_state_get_format(state, 0);
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
 	fmt->width = AR0144_DEF_WIDTH;
 	fmt->height = AR0144_DEF_HEIGHT;
 	fmt->code = ar0144_format_code(sensor, info);
@@ -1351,12 +1463,6 @@ static int ar0144_entity_init_state(struct v4l2_subdev *sd,
 	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
 
-	crop = v4l2_subdev_state_get_crop(state, 0);
-	crop->left = 4;
-	crop->top = 4;
-	crop->width = AR0144_DEF_WIDTH;
-	crop->height = AR0144_DEF_HEIGHT;
-
 	return 0;
 }
 
@@ -1401,9 +1507,12 @@ static int ar0144_init_subdev(struct ar0144 *sensor)
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	sd->entity.ops = &ar0144_entity_ops;
 
-	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
+	sensor->pads[AR0144_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	sensor->pads[AR0144_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK
+					     | MEDIA_PAD_FL_INTERNAL;
 
-	ret = media_entity_pads_init(&sd->entity, 1, &sensor->pad);
+	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(sensor->pads),
+				     sensor->pads);
 	if (ret)
 		return ret;
 
@@ -1421,7 +1530,7 @@ static int ar0144_init_subdev(struct ar0144 *sensor)
 	 * rate) and blanking controls.
 	 */
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	format = v4l2_subdev_state_get_format(state, 0);
+	format = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE);
 	info = ar0144_format_info(sensor, format->code, true);
 
 	ar0144_update_link_freqs(sensor, info);
-- 
Regards,

Laurent Pinchart


