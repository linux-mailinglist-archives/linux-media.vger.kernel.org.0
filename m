Return-Path: <linux-media+bounces-7109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C57387CA42
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 09:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F1401C21627
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 08:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E186175BD;
	Fri, 15 Mar 2024 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eo6KdCHz"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9BB1758B
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 08:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710492747; cv=none; b=m5FoZZ7jodq4C6Fjrsbk6wwOHcl7mcEVeggkoIMEcnGf/+6zzkzuadk9C5HnmZF4Aq02axsQijosSwsUNkrWkK9dIihyZcJV5Ij+YK9C/fQ3fYBhuHrIQN6iSLM0uRFy1Z8AbjpWsd4HxcdwryoILjggWwl15RyTCCIrKA/CHgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710492747; c=relaxed/simple;
	bh=bPQtPsAEdhFmI2JT5tuyADxaD0xprDdvbIyC2AWuL2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0Z58J4jWdN2rcFOPKXHPrmz5S9i+MJbLVgrZjuWNeidoos/6noJTXQRFLDFONh2vFMU/jw2+cEA8yLIk0ZwafL1mTnKG/nAQtZq791fFUzGgxuHqfPqRPXJAdMlPx6jXcotX8CDSrynRQ0kT/hBD0TrhsTe1s85tyyxVHD/KUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eo6KdCHz; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710492744;
	bh=bPQtPsAEdhFmI2JT5tuyADxaD0xprDdvbIyC2AWuL2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eo6KdCHzNKonLWyvBwO6GmP+pdeCH0Migl/Uk9hkayDVmM6x/jPRmxfQlEPihG6wz
	 LhjZdNkif3hGlM3nmK8glVxwGvzedjG17lf0OJ81tNtNFF3OD5wtcf7Uuzv7TOHy5T
	 NpDO4MlTreHWkrbXnXI1JCObWFdk1V8ovf7+ZTuRAdhVjAbaYoojry7N2zrflUoBPj
	 4ZSTC8a06YF2+dgTE7wnHScqDD96FJjqPzMr6rakcyQOv3m+ZXalo4KgMdMsi4Kphk
	 GRFVSVCTgYCVoNBfXur5btxt+qjI7aheXIsxSIh4Zy9ebmjqN5UoCefLVdoT/jmGbD
	 cNqMEg7UvXNxw==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BFE6137820FF;
	Fri, 15 Mar 2024 08:52:23 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 2/4] media: i2c: st-vgxy61: Add support for embedded data
Date: Fri, 15 Mar 2024 09:51:56 +0100
Message-ID: <20240315085158.1213159-3-julien.massot@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315085158.1213159-1-julien.massot@collabora.com>
References: <20240315085158.1213159-1-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for embedded data. This introduces two internal pads for pixel
and embedded data streams. The sensor can send ISL data at the begginning
of each frame.

The ISL data contains information related to the current frame such as:
ROI, cropping and orientation, gains, thermal sensors values,
frame counter..

The Intelligent Status Line follows the CCS embedded data format definition
regarding the tagged data but not for the registers address, therefore the
format code is MEDIA_BUS_FMT_META_8 and not MEDIA_BUS_FMT_CCS_EMBEDDED.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/i2c/st-vgxy61.c | 172 +++++++++++++++++++++++++++++++---
 1 file changed, 160 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index 733713f909cf..e8302456a8d9 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -88,11 +88,16 @@
 #define VGXY61_REG_PATGEN_SHORT_DATA_B			CCI_REG16_LE(0x0954)
 #define VGXY61_REG_PATGEN_SHORT_DATA_GB			CCI_REG16_LE(0x0956)
 #define VGXY61_REG_BYPASS_CTRL				CCI_REG8(0x0a60)
+#define VGXY61_ISL_BYPASS				BIT(3)
+#define VGXY61_ASIL_BYPASS				BIT(2)
 
 #define VGX661_WIDTH					1464
 #define VGX661_HEIGHT					1104
 #define VGX761_WIDTH					1944
 #define VGX761_HEIGHT					1204
+/* two status lines (ISL), of 256 bytes each */
+#define VGXY61_META_WIDTH				256
+#define VGXY61_META_HEIGHT				2
 #define VGX661_DEFAULT_MODE				1
 #define VGX761_DEFAULT_MODE				1
 #define VGX661_SHORT_ROT_TERM				93
@@ -112,6 +117,18 @@
 #define VGXY61_FWPATCH_REVISION_MINOR			0
 #define VGXY61_FWPATCH_REVISION_MICRO			5
 
+enum {
+	VGXY61_PAD_SOURCE,
+	VGXY61_PAD_PIXEL,
+	VGXY61_PAD_META,
+	VGXY61_NUM_PADS,
+};
+
+enum {
+	VGXY61_STREAM_PIXEL,
+	VGXY61_STREAM_META,
+};
+
 static const u8 patch_array[] = {
 	0xbf, 0x00, 0x05, 0x20, 0x06, 0x01, 0xe0, 0xe0, 0x04, 0x80, 0xe6, 0x45,
 	0xed, 0x6f, 0xfe, 0xff, 0x14, 0x80, 0x1f, 0x84, 0x10, 0x42, 0x05, 0x7c,
@@ -382,7 +399,7 @@ struct vgxy61_dev {
 	struct i2c_client *i2c_client;
 	struct regmap *regmap;
 	struct v4l2_subdev sd;
-	struct media_pad pad;
+	struct media_pad pads[VGXY61_NUM_PADS];
 	struct regulator_bulk_data supplies[ARRAY_SIZE(vgxy61_supply_name)];
 	struct gpio_desc *reset_gpio;
 	struct clk *xclk;
@@ -655,6 +672,13 @@ static int vgxy61_get_selection(struct v4l2_subdev *sd,
 {
 	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
 
+	/*
+	 * The embedded data stream doesn't support selection rectangles,
+	 * neither on the embedded data pad nor on the source pad.
+	 */
+	if (sel->pad == VGXY61_PAD_META)
+		return -EINVAL;
+
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
 		sel->r = sensor->current_mode->crop;
@@ -676,6 +700,16 @@ static int vgxy61_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
+	if (code->pad == VGXY61_PAD_META ||
+	    (code->pad == VGXY61_PAD_SOURCE &&
+	     code->stream == VGXY61_STREAM_META)) {
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_META_8;
+		return 0;
+	}
+
 	if (code->index >= ARRAY_SIZE(vgxy61_supported_codes))
 		return -EINVAL;
 
@@ -703,6 +737,19 @@ static int vgxy61_enum_frame_size(struct v4l2_subdev *sd,
 {
 	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
 
+	if (fse->pad == VGXY61_PAD_META ||
+	    (fse->pad == VGXY61_PAD_SOURCE &&
+	     fse->stream == VGXY61_STREAM_META)) {
+		if (fse->index > 0)
+			return -EINVAL;
+
+		fse->min_width = VGXY61_META_WIDTH;
+		fse->max_width = VGXY61_META_WIDTH;
+		fse->min_height = VGXY61_META_HEIGHT;
+		fse->max_height = VGXY61_META_HEIGHT;
+		return 0;
+	}
+
 	if (fse->index >= sensor->sensor_modes_nb)
 		return -EINVAL;
 
@@ -1159,24 +1206,54 @@ static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int vgxy61_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *sd_state,
-			  struct v4l2_subdev_format *format)
+static int __vgxy61_set_fmt(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *sd_state,
+			    struct v4l2_mbus_framefmt *format,
+			    enum v4l2_subdev_format_whence which,
+			    unsigned int pad, unsigned int stream)
 {
 	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
+	struct v4l2_mbus_framefmt *src_pix_fmt, *src_meta_fmt, *pix_fmt,
+		*meta_fmt;
 	const struct vgxy61_mode_info *new_mode;
 	int ret;
 
 	if (sensor->streaming)
 		return -EBUSY;
 
-	ret = vgxy61_try_fmt_internal(sd, &format->format, &new_mode);
+	/*
+	 * Allow setting format on internal pixel pad as well as the source
+	 * pad's pixel stream (for compatibility).
+	 */
+	if ((pad == VGXY61_PAD_SOURCE && stream == VGXY61_STREAM_META) ||
+	    pad == VGXY61_PAD_META) {
+		*format = *v4l2_subdev_state_get_format(sd_state, pad, stream);
+		return 0;
+	}
+
+	pix_fmt = v4l2_subdev_state_get_format(sd_state, VGXY61_PAD_PIXEL, 0);
+	meta_fmt = v4l2_subdev_state_get_format(sd_state, VGXY61_PAD_META, 0);
+	src_pix_fmt = v4l2_subdev_state_get_format(sd_state, VGXY61_PAD_SOURCE,
+						   VGXY61_STREAM_PIXEL);
+	src_meta_fmt = v4l2_subdev_state_get_format(sd_state, VGXY61_PAD_SOURCE,
+						    VGXY61_STREAM_META);
+
+	ret = vgxy61_try_fmt_internal(sd, format, &new_mode);
 	if (ret)
 		return ret;
 
-	*v4l2_subdev_state_get_format(sd_state, format->pad) = format->format;
+	pix_fmt->width = format->width;
+	pix_fmt->height = format->height;
+	pix_fmt->code = format->code;
+	pix_fmt->field = V4L2_FIELD_NONE;
+
+	*format = *src_pix_fmt = *pix_fmt;
+	meta_fmt->code = MEDIA_BUS_FMT_META_8;
+	meta_fmt->width = VGXY61_META_WIDTH;
+	meta_fmt->height = VGXY61_META_HEIGHT;
+	*src_meta_fmt = *meta_fmt;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
 	sensor->current_mode = new_mode;
@@ -1202,16 +1279,78 @@ static int vgxy61_set_fmt(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int vgxy61_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_format *fmt)
+{
+	return __vgxy61_set_fmt(sd, sd_state, &fmt->format, fmt->which,
+				fmt->pad, fmt->stream);
+}
+
+static int vgxy61_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *desc)
+{
+	struct v4l2_subdev_state *sd_state;
+	struct v4l2_mbus_framefmt *fmt;
+
+	desc->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	desc->num_entries = 2;
+
+	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(sd_state, VGXY61_PAD_SOURCE,
+					   VGXY61_STREAM_PIXEL);
+	v4l2_subdev_unlock_state(sd_state);
+
+	desc->entry[0].stream = VGXY61_STREAM_PIXEL;
+	desc->entry[0].pixelcode = fmt->code;
+	desc->entry[0].bus.csi2.dt = get_data_type_by_code(fmt->code);
+
+	desc->entry[1].stream = VGXY61_STREAM_META;
+	desc->entry[1].pixelcode = MEDIA_BUS_FMT_META_8;
+	desc->entry[1].bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
+
+	return 0;
+}
+
 static int vgxy61_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state)
 {
 	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
 	struct v4l2_subdev_format fmt = { 0 };
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = VGXY61_PAD_PIXEL,
+			.source_pad = VGXY61_PAD_SOURCE,
+			.source_stream = VGXY61_STREAM_PIXEL,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
+		}, {
+			.sink_pad = VGXY61_PAD_META,
+			.source_pad = VGXY61_PAD_SOURCE,
+			.source_stream = VGXY61_STREAM_META,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.routes = routes,
+		.num_routes = ARRAY_SIZE(routes),
+	};
+	struct v4l2_subdev_state *active_state;
+	int ret;
+
+	ret = v4l2_subdev_set_routing(sd, sd_state, &routing);
+	if (ret)
+		return ret;
+
+	active_state = v4l2_subdev_get_locked_active_state(sd);
 
 	vgxy61_fill_framefmt(sensor, sensor->current_mode, &fmt.format,
 			     VGXY61_MEDIA_BUS_FMT_DEF);
 
-	return vgxy61_set_fmt(sd, sd_state, &fmt);
+	return __vgxy61_set_fmt(sd, sd_state, &fmt.format,
+				active_state == sd_state ?
+				V4L2_SUBDEV_FORMAT_ACTIVE :
+				V4L2_SUBDEV_FORMAT_TRY, VGXY61_PAD_PIXEL, 0);
 }
 
 static int vgxy61_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1364,6 +1503,7 @@ static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
 	.enum_mbus_code = vgxy61_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = vgxy61_set_fmt,
+	.get_frame_desc = vgxy61_get_frame_desc,
 	.get_selection = vgxy61_get_selection,
 	.enum_frame_size = vgxy61_enum_frame_size,
 };
@@ -1478,7 +1618,8 @@ static int vgxy61_configure(struct vgxy61_dev *sensor)
 	cci_write(sensor->regmap, VGXY61_REG_CLK_SYS_PLL_MULT, mult, &ret);
 	cci_write(sensor->regmap, VGXY61_REG_OIF_CTRL, sensor->oif_ctrl, &ret);
 	cci_write(sensor->regmap, VGXY61_REG_FRAME_CONTENT_CTRL, 0, &ret);
-	cci_write(sensor->regmap, VGXY61_REG_BYPASS_CTRL, 4, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_BYPASS_CTRL, VGXY61_ASIL_BYPASS,
+		  &ret);
 	if (ret)
 		return ret;
 	vgxy61_update_gpios_strobe_polarity(sensor, sensor->gpios_polarity);
@@ -1743,8 +1884,14 @@ static int vgxy61_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&sensor->sd, client, &vgxy61_subdev_ops);
 	sensor->sd.internal_ops = &vgxy61_internal_ops;
 	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			    V4L2_SUBDEV_FL_HAS_EVENTS;
-	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
+			    V4L2_SUBDEV_FL_HAS_EVENTS |
+			    V4L2_SUBDEV_FL_STREAMS;
+	sensor->pads[VGXY61_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	sensor->pads[VGXY61_PAD_PIXEL].flags =
+		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
+	sensor->pads[VGXY61_PAD_META].flags =
+		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
+
 	sensor->sd.entity.ops = &vgxy61_subdev_entity_ops;
 	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
@@ -1778,7 +1925,8 @@ static int vgxy61_probe(struct i2c_client *client)
 		goto error_power_off;
 	}
 
-	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
+	ret = media_entity_pads_init(&sensor->sd.entity,
+				     ARRAY_SIZE(sensor->pads), sensor->pads);
 	if (ret) {
 		dev_err(&client->dev, "pads init failed %d\n", ret);
 		goto error_handler_free;
-- 
2.44.0


