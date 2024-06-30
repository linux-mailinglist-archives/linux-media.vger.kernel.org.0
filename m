Return-Path: <linux-media+bounces-14422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EDC91D212
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 16:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83F8EB2106D
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 14:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FD715383C;
	Sun, 30 Jun 2024 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Oij+VyF6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F08515381C;
	Sun, 30 Jun 2024 14:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719757132; cv=none; b=IZdOKzTlz5rRqZqPaey8RxJSo0tUvqsIVaO5uQw029wMPFiuBn/q94QjpPupFBfB2mdM27vJYKf+oDVSfUZ/pIK+W0TXcC++c8KQuAT2AWk/DocaTYc+88o/2HmiEfJAIwFMuNz/bRxUbr+OjQYGYnrNeRUJS/pD4oP/PAlexPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719757132; c=relaxed/simple;
	bh=hKM6wH6363BR2mJ74mCc+lr+UnxLN3Xs6opBR2zCYsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPySXmsLgjdaV6URoRfBHBr7lxZu5brcc7KO0f+Uwe70pYz6aJE7Bz99j7cC5z//m/eDiIbltBSM/y9IMU5yGFvCMpb8IG7Fb3a6FeAg2dQJ2P+sDWg9KETE65DfHPkwKvMN8S+wjQdM//R1y0awoOORGNVx0C3QT8Q9LnRg+fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Oij+VyF6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-36-175-nat.elisa-mobile.fi [85.76.36.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A81227E1;
	Sun, 30 Jun 2024 16:18:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719757098;
	bh=hKM6wH6363BR2mJ74mCc+lr+UnxLN3Xs6opBR2zCYsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oij+VyF6mxuYek8x1N/Wtc1pIPMCQRyrgRC0q99Bu0y2tbUUxq9M7l1nbvDG/Qjic
	 8fGwbhIICFtNAkNW7PoXNRKz2mipYoqPVYHq1byNfnL7aIlPDQFQ0cXfTQc51YcB8c
	 r139mRigGctiYRc5pShh24Inw3uo977c7qJLg/04=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH/RFC v1 7/9] media: i2c: ar0144: Add embedded data support
Date: Sun, 30 Jun 2024 17:17:57 +0300
Message-ID: <20240630141802.15830-8-laurent.pinchart@ideasonboard.com>
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

The AR0144 can generate embedded data. Report it as an additional
stream, with a new internal embedded data pad, and update subdev
operations accordingly. Make the embedded data generation unconditional
for now to simplify the implementation. It can be made configurable
later if desired.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ar0144.c | 148 +++++++++++++++++++++++++++++--------
 1 file changed, 119 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/ar0144.c b/drivers/media/i2c/ar0144.c
index 84915d682b79..782a09a66ba6 100644
--- a/drivers/media/i2c/ar0144.c
+++ b/drivers/media/i2c/ar0144.c
@@ -312,6 +312,9 @@
 #define AR0144_PIXEL_ARRAY_ACTIVE_WIDTH		1288U
 #define AR0144_PIXEL_ARRAY_ACTIVE_HEIGHT	808U
 
+/* Embedded metadata stream height */
+#define AR0144_EMBEDDED_DATA_HEIGHT		2U
+
 /*
  * Documentation indicates minimum horizontal and vertical blanking of 208
  * pixels and 27 lines respectively, which matches the default values for the
@@ -337,11 +340,13 @@
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
@@ -351,6 +356,7 @@ struct ar0144_model {
 struct ar0144_format_info {
 	u32 colour;
 	u32 mono;
+	u32 edata;
 	u16 bpp;
 	u16 dt;
 };
@@ -371,16 +377,19 @@ static const struct ar0144_format_info ar0144_formats[] = {
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
@@ -566,8 +575,8 @@ static int ar0144_start_streaming(struct ar0144 *sensor,
 	 * Enable generation of embedded statistics, required for the on-chip
 	 * auto-exposure. There is no downside in enabling it unconditionally.
 	 */
-	cci_write(sensor->regmap, AR0144_SMIA_TEST, AR0144_STATS_EN | 0x1802,
-		  &ret);
+	cci_write(sensor->regmap, AR0144_SMIA_TEST, AR0144_EMBEDDED_DATA |
+		  AR0144_STATS_EN | 0x1802, &ret);
 
 	if (ret)
 		return ret;
@@ -1122,7 +1131,25 @@ static int ar0144_enum_mbus_code(struct v4l2_subdev *sd,
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
 
@@ -1141,11 +1168,18 @@ static int ar0144_enum_mbus_code(struct v4l2_subdev *sd,
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
@@ -1159,25 +1193,22 @@ static int ar0144_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index > 0)
 		return -EINVAL;
 
-	switch (fse->pad) {
-	case AR0144_PAD_IMAGE:
-		if (fse->code != ar0144_format_code(sensor, &ar0144_formats[0]))
-			return -EINVAL;
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					   fse->stream);
 
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
@@ -1216,6 +1247,11 @@ static int ar0144_set_fmt(struct v4l2_subdev *sd,
 
 	format->format = *fmt;
 
+	/* Update the format on the source side of the embedded data stream. */
+	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_SOURCE,
+					   AR0144_STREAM_EDATA);
+	fmt->code = info->edata;
+
 	if (format->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return 0;
 
@@ -1339,6 +1375,14 @@ static int ar0144_set_selection(struct v4l2_subdev *sd,
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
 
@@ -1347,29 +1391,35 @@ static int ar0144_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
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
 
@@ -1401,6 +1451,13 @@ static int ar0144_enable_streams(struct v4l2_subdev *sd,
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
@@ -1422,6 +1479,13 @@ static int ar0144_disable_streams(struct v4l2_subdev *sd,
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
@@ -1440,6 +1504,13 @@ static int ar0144_entity_init_state(struct v4l2_subdev *sd,
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
@@ -1458,6 +1529,7 @@ static int ar0144_entity_init_state(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
+	/* Image pad. */
 	info = &ar0144_formats[0];
 
 	fmt = v4l2_subdev_state_get_format(state, AR0144_PAD_IMAGE);
@@ -1482,6 +1554,14 @@ static int ar0144_entity_init_state(struct v4l2_subdev *sd,
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
@@ -1495,6 +1575,14 @@ static int ar0144_entity_init_state(struct v4l2_subdev *sd,
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
 
@@ -1543,6 +1631,8 @@ static int ar0144_init_subdev(struct ar0144 *sensor)
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


