Return-Path: <linux-media+bounces-17717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BFC96E5F5
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92A13286CD3
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 22:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33C31B5EC9;
	Thu,  5 Sep 2024 22:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OYiiE6MW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C881482E9;
	Thu,  5 Sep 2024 22:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576820; cv=none; b=gvE/+HBdJDl0W8KJTfD4ocBlimIsHr+z1OFrio6dl8uBfBYoiAQaX0kqDzmzisyMT3TDltvXDNlA+83d4MVuOS72fOC6uwu9LZ/4B/KCWFwGQFW9lE5ytSL89ytGisPBEOw/5af7jbbvpH1dI23l8wT/6qLMlkm6vtJz0rApPq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576820; c=relaxed/simple;
	bh=8C/tkDNF52pieEQGdPKerb0YP5g0XAbTP6AkTqtR3jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FAoXvgG0rd9FyliXDOg7XGUiYX0vJE0MyZQVfkqNdZFyl17Mid38QKvymV77gnSVinHVLieRT268HRzVPcG7Ilm2ODfc/1Zds01p6b7VXcaNE7z9LMw8VSnAVPxQ3yIfOVMTy3zY7DOS8lkw+DUxe8XDLY/zH76y6qH052+5LLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OYiiE6MW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7961C1BA8;
	Fri,  6 Sep 2024 00:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725576733;
	bh=8C/tkDNF52pieEQGdPKerb0YP5g0XAbTP6AkTqtR3jU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OYiiE6MWn62uN4QclQgK9A98zR++0Q5zGV8oKtEpZSLxmzXWjrCXmjPLacTZmDulH
	 qypTVlH391NMeN1pB50uKLeSLkz3dAhne0YB3+FoxSXvq8XXamzO7KRoxwVHhyowAA
	 hMl2MTzjxJzitDxCmWppw7eQiyNZhPzb+vyz3wnk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH/RFC v2 7/9] media: i2c: ar0144: Add embedded data support
Date: Fri,  6 Sep 2024 01:53:05 +0300
Message-ID: <20240905225308.11267-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
References: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AR0144 can generate embedded data. Report it as an additional
stream, with a new internal embedded data pad, and update subdev
operations accordingly. Make the embedded data generation unconditional
for now to simplify the implementation. It can be made configurable
later if desired.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Fix frame size enumeration
---
 drivers/media/i2c/ar0144.c | 147 +++++++++++++++++++++++++++++--------
 1 file changed, 118 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/ar0144.c b/drivers/media/i2c/ar0144.c
index a784d806b189..c2ef8b26a2bc 100644
--- a/drivers/media/i2c/ar0144.c
+++ b/drivers/media/i2c/ar0144.c
@@ -314,6 +314,9 @@
 #define AR0144_PIXEL_ARRAY_ACTIVE_WIDTH		1288U
 #define AR0144_PIXEL_ARRAY_ACTIVE_HEIGHT	808U
 
+/* Embedded metadata stream height */
+#define AR0144_EMBEDDED_DATA_HEIGHT		2U
+
 /*
  * Documentation indicates minimum horizontal and vertical blanking of 208
  * pixels and 27 lines respectively, which matches the default values for the
@@ -339,11 +342,13 @@
 enum ar0144_pad_ids {
 	AR0144_PAD_SOURCE = 0,
 	AR0144_PAD_IMAGE,
+	AR0144_PAD_EDATA,
 	AR0144_NUM_PADS,
 };
 
 enum ar0144_stream_ids {
 	AR0144_STREAM_IMAGE,
+	AR0144_STREAM_EDATA,
 };
 
 struct ar0144_model {
@@ -353,6 +358,7 @@ struct ar0144_model {
 struct ar0144_format_info {
 	u32 colour;
 	u32 mono;
+	u32 edata;
 	u16 bpp;
 	u16 dt;
 };
@@ -373,16 +379,19 @@ static const struct ar0144_format_info ar0144_formats[] = {
 	{
 		.colour = MEDIA_BUS_FMT_SGRBG12_1X12,
 		.mono = MEDIA_BUS_FMT_Y12_1X12,
+		.edata = MEDIA_BUS_FMT_META_12,
 		.bpp = 12,
 		.dt = MIPI_CSI2_DT_RAW12,
 	}, {
 		.colour = MEDIA_BUS_FMT_SGRBG10_1X10,
 		.mono = MEDIA_BUS_FMT_Y10_1X10,
+		.edata = MEDIA_BUS_FMT_META_10,
 		.bpp = 10,
 		.dt = MIPI_CSI2_DT_RAW10,
 	}, {
 		.colour = MEDIA_BUS_FMT_SGRBG8_1X8,
 		.mono = MEDIA_BUS_FMT_Y8_1X8,
+		.edata = MEDIA_BUS_FMT_META_8,
 		.bpp = 8,
 		.dt = MIPI_CSI2_DT_RAW8,
 	},
@@ -574,8 +583,8 @@ static int ar0144_start_streaming(struct ar0144 *sensor,
 	 * Enable generation of embedded statistics, required for the on-chip
 	 * auto-exposure. There is no downside in enabling it unconditionally.
 	 */
-	cci_write(sensor->regmap, AR0144_SMIA_TEST, AR0144_STATS_EN | 0x1802,
-		  &ret);
+	cci_write(sensor->regmap, AR0144_SMIA_TEST, AR0144_EMBEDDED_DATA |
+		  AR0144_STATS_EN | 0x1802, &ret);
 
 	if (ret)
 		goto error;
@@ -1136,7 +1145,25 @@ static int ar0144_enum_mbus_code(struct v4l2_subdev *sd,
 		return 0;
 	}
 
-	case AR0144_PAD_SOURCE: {
+	case AR0144_PAD_EDATA: {
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_CCS_EMBEDDED;
+		return 0;
+	}
+
+	case AR0144_PAD_SOURCE:
+	default:
+		break;
+	}
+
+	/*
+	 * On the source pad, the sensor supports multiple image raw formats
+	 * with different bit depths. The embedded data format bit depth
+	 * follows the image stream.
+	 */
+	if (code->stream == AR0144_STREAM_IMAGE) {
 		unsigned int index = 0;
 		unsigned int i;
 
@@ -1155,11 +1182,18 @@ static int ar0144_enum_mbus_code(struct v4l2_subdev *sd,
 		}
 
 		return -EINVAL;
+	} else {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+						   AR0144_STREAM_EDATA);
+		code->code = fmt->code;
 	}
 
-	default:
-		return -EINVAL;
-	}
+	return 0;
 }
 
 static int ar0144_enum_frame_size(struct v4l2_subdev *sd,
@@ -1173,25 +1207,21 @@ static int ar0144_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index > 0)
 		return -EINVAL;
 
-	switch (fse->pad) {
-	case AR0144_PAD_IMAGE:
-		if (fse->code != ar0144_format_code(sensor, &ar0144_formats[0]))
-			return -EINVAL;
+	fmt = v4l2_subdev_state_get_format(state, fse->pad, fse->stream);
 
-		fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_IMAGE);
-		break;
-
-	case AR0144_PAD_SOURCE:
+	/*
+	 * Verify the media bus code. On the source image stream multiple
+	 * options are supported, while on all other streams the requested code
+	 * must match the current format.
+	 */
+	if (fse->pad == AR0144_PAD_SOURCE &&
+	    fse->stream == AR0144_STREAM_IMAGE) {
 		info = ar0144_format_info(sensor, fse->code, false);
 		if (!info)
 			return -EINVAL;
-
-		fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
-						   AR0144_STREAM_IMAGE);
-		break;
-
-	default:
-		return -EINVAL;
+	} else {
+		if (fse->code != fmt->code)
+			return -EINVAL;
 	}
 
 	fse->min_width = fmt->width;
@@ -1230,6 +1260,11 @@ static int ar0144_set_fmt(struct v4l2_subdev *sd,
 
 	format->format = *fmt;
 
+	/* Update the format on the source side of the embedded data stream. */
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					   AR0144_STREAM_EDATA);
+	fmt->code = info->edata;
+
 	if (format->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return 0;
 
@@ -1353,6 +1388,14 @@ static int ar0144_set_selection(struct v4l2_subdev *sd,
 	fmt->width = compose->width;
 	fmt->height = compose->height;
 
+	/* Update the embedded data stream width. */
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_EDATA);
+	fmt->width = compose->width;
+
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					   AR0144_STREAM_EDATA);
+	fmt->width = compose->width;
+
 	return 0;
 }
 
@@ -1361,29 +1404,35 @@ static int ar0144_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 {
 	struct ar0144 *sensor = to_ar0144(sd);
 	const struct ar0144_format_info *info;
-	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
-	u32 code;
+	u32 img_code;
+	u32 ed_code;
 
 	if (pad != AR0144_PAD_SOURCE)
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
-					   AR0144_STREAM_IMAGE);
-	code = fmt->code;
+	img_code = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+						AR0144_STREAM_IMAGE)->code;
+	ed_code = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					       AR0144_STREAM_EDATA)->code;
 	v4l2_subdev_unlock_state(state);
 
-	info = ar0144_format_info(sensor, code, true);
+	info = ar0144_format_info(sensor, img_code, true);
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
-	fd->num_entries = 1;
+	fd->num_entries = 2;
 
-	fd->entry[0].pixelcode = code;
+	fd->entry[0].pixelcode = img_code;
 	fd->entry[0].stream = AR0144_STREAM_IMAGE;
 	fd->entry[0].bus.csi2.vc = 0;
 	fd->entry[0].bus.csi2.dt = info->dt;
 
+	fd->entry[1].pixelcode = ed_code;
+	fd->entry[1].stream = AR0144_STREAM_EDATA;
+	fd->entry[1].bus.csi2.vc = 0;
+	fd->entry[1].bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
+
 	return 0;
 }
 
@@ -1415,6 +1464,13 @@ static int ar0144_enable_streams(struct v4l2_subdev *sd,
 	struct ar0144 *sensor = to_ar0144(sd);
 	int ret;
 
+	/*
+	 * The image stream controls sensor streaming, as embedded data isn't
+	 * controllable independently.
+	 */
+	if (!(streams_mask & BIT(AR0144_STREAM_IMAGE)))
+		return 0;
+
 	ret = pm_runtime_resume_and_get(sensor->dev);
 	if (ret < 0)
 		return ret;
@@ -1436,6 +1492,13 @@ static int ar0144_disable_streams(struct v4l2_subdev *sd,
 {
 	struct ar0144 *sensor = to_ar0144(sd);
 
+	/*
+	 * The image stream controls sensor streaming, as embedded data isn't
+	 * controllable independently.
+	 */
+	if (!(streams_mask & BIT(AR0144_STREAM_IMAGE)))
+		return 0;
+
 	ar0144_stop_streaming(sensor);
 	pm_runtime_mark_last_busy(sensor->dev);
 	pm_runtime_put_autosuspend(sensor->dev);
@@ -1454,6 +1517,13 @@ static int ar0144_entity_init_state(struct v4l2_subdev *sd,
 			.source_stream = AR0144_STREAM_IMAGE,
 			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
 				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
+		}, {
+			.sink_pad = AR0144_PAD_EDATA,
+			.sink_stream = 0,
+			.source_pad = AR0144_PAD_SOURCE,
+			.source_stream = AR0144_STREAM_EDATA,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
 		},
 	};
 	struct v4l2_subdev_krouting routing = {
@@ -1472,6 +1542,7 @@ static int ar0144_entity_init_state(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
+	/* Image pad. */
 	info = &ar0144_formats[0];
 
 	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_IMAGE);
@@ -1496,6 +1567,14 @@ static int ar0144_entity_init_state(struct v4l2_subdev *sd,
 	compose->width = AR0144_DEF_WIDTH;
 	compose->height = AR0144_DEF_HEIGHT;
 
+	/* Embedded data pad. */
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_EDATA);
+	fmt->width = AR0144_DEF_WIDTH;
+	fmt->height = AR0144_EMBEDDED_DATA_HEIGHT;
+	fmt->code = MEDIA_BUS_FMT_CCS_EMBEDDED;
+	fmt->field = V4L2_FIELD_NONE;
+
+	/* Source pad, image stream. */
 	info = ar0144_format_info(sensor, 0, true);
 
 	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
@@ -1509,6 +1588,14 @@ static int ar0144_entity_init_state(struct v4l2_subdev *sd,
 	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
 
+	/* Source pad, embedded data stream. */
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					   AR0144_STREAM_EDATA);
+	fmt->width = AR0144_DEF_WIDTH;
+	fmt->height = AR0144_EMBEDDED_DATA_HEIGHT;
+	fmt->code = info->edata;
+	fmt->field = V4L2_FIELD_NONE;
+
 	return 0;
 }
 
@@ -1557,6 +1644,8 @@ static int ar0144_init_subdev(struct ar0144 *sensor)
 	sensor->pads[AR0144_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 	sensor->pads[AR0144_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK
 					     | MEDIA_PAD_FL_INTERNAL;
+	sensor->pads[AR0144_PAD_EDATA].flags = MEDIA_PAD_FL_SINK
+					     | MEDIA_PAD_FL_INTERNAL;
 
 	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(sensor->pads),
 				     sensor->pads);
-- 
Regards,

Laurent Pinchart


