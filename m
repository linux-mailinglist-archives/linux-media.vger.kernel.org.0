Return-Path: <linux-media+bounces-35328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8778FAE04F8
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124A34A070D
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E75425C803;
	Thu, 19 Jun 2025 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SluY44eC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504FF25B1FD
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334373; cv=none; b=b6XuDUCliYZgn890/bfsIXrSCM8HJyPUHPZ4i4p/eIT/Uf6RxxzXmgM0mfHeuk71FNULMdnydiB4RQcOP8rwHGzUo0KlSVyX1K2hWStG8LouKyODrKVbEf95VCuL1Pfx6k3AnZ9JEMR3FyI7ZEXwMHBYJQW6y8uuWdaReqkgmFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334373; c=relaxed/simple;
	bh=kXHK7Y74smiMVzB7hK92xp+QLuNOAJd+QyyLbCKcELk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XCSDajFRWBPxZc1LFe6xtrSm+4NuWdS9jtVpxVPj/ZfyCbA5qy/oaXzgTtIvZrNM1VBpOwun/eWGuY/ucJqO7+r0xjO50pio3n/5OaFCeV70jCL5COijN5GGJ6OTKnPAfdZbdjqbxmwKyOnxa9HvrsK6U6MZq2VSWOQc07nWabQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SluY44eC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334371; x=1781870371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kXHK7Y74smiMVzB7hK92xp+QLuNOAJd+QyyLbCKcELk=;
  b=SluY44eCm18ImWEL7ynKXnPjiu47AA2WS2Qlz7sL17q56/y6AnEHaOwF
   9zUCHwHOIljmGZvOluJGjoawzEueWfLS1ctCI6OxOat2wD5Rj/o8xZmkl
   borT7Voo3wgQxowwO54ErS8ZvhkReTdt5PG//guWWJtiA3GhNLNnqmBPO
   H8AwWhYTB5JUTY0OKEDsTk5QrH2HNeJyXszJhimoDfmaP/cJTso2nZWs4
   P3cBYhO+eDYm+DKac3/8vbsNurrzmrgPiqGGmNx+QxmA5N2LDiluI/dGi
   gA8Ozx89oDHgVW8hgChNxlnWUZcVGntZQQWDUaeT6uXPwy+snUPWTmRQ/
   g==;
X-CSE-ConnectionGUID: wyrRMMZmTOyYrjhcQjy/gQ==
X-CSE-MsgGUID: u9tNbe94SoqzPMLE2tu5vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386924"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386924"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:21 -0700
X-CSE-ConnectionGUID: bmcsj2KaRJ+MFXM7vFGebw==
X-CSE-MsgGUID: X92IU0ceRPG7NV79w6wxZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908531"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:13 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 71616123290;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AMK-1P;
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
Subject: [PATCH v10 59/64] media: i2c: imx219: Add embedded data support
Date: Thu, 19 Jun 2025 14:58:31 +0300
Message-Id: <20250619115836.1946016-60-sakari.ailus@linux.intel.com>
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

The IMX219 generates embedded data unconditionally. Report it as an
additional stream, with a new internal embedded data pad, and update
subdev operations accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 173 ++++++++++++++++++++++++++++++++-----
 1 file changed, 152 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index dc1de024de6e..8b5d7d6a5fb2 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -148,6 +148,9 @@
 #define IMX219_PIXEL_ARRAY_WIDTH	3280U
 #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
 
+/* Embedded metadata stream height */
+#define IMX219_EMBEDDED_DATA_HEIGHT	2U
+
 /* Mode : resolution and related config&values */
 struct imx219_mode {
 	/* Frame width */
@@ -339,11 +342,13 @@ static const struct imx219_mode supported_modes[] = {
 enum imx219_pad_ids {
 	IMX219_PAD_SOURCE = 0,
 	IMX219_PAD_IMAGE,
+	IMX219_PAD_EDATA,
 	IMX219_NUM_PADS,
 };
 
 enum imx219_stream_ids {
 	IMX219_STREAM_IMAGE,
+	IMX219_STREAM_EDATA,
 };
 
 struct imx219 {
@@ -697,6 +702,19 @@ static unsigned int imx219_format_bpp(u32 code)
 	}
 }
 
+/* Return the embedded data format corresponding to an image format. */
+static u32 imx219_format_edata(u32 code)
+{
+	switch (imx219_format_bpp(code)) {
+	case 8:
+		return MEDIA_BUS_FMT_META_8;
+
+	case 10:
+	default:
+		return MEDIA_BUS_FMT_META_10;
+	}
+}
+
 static int imx219_set_framefmt(struct imx219 *imx219,
 			       struct v4l2_subdev_state *state)
 {
@@ -758,6 +776,13 @@ static int imx219_enable_streams(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	int ret;
 
+	/*
+	 * The image stream controls sensor streaming, as embedded data isn't
+	 * controllable independently.
+	 */
+	if (!(streams_mask & BIT(IMX219_STREAM_IMAGE)))
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&client->dev);
 	if (ret < 0)
 		return ret;
@@ -816,6 +841,13 @@ static int imx219_disable_streams(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	int ret;
 
+	/*
+	 * The image stream controls sensor streaming, as embedded data isn't
+	 * controllable independently.
+	 */
+	if (!(streams_mask & BIT(IMX219_STREAM_IMAGE)))
+		return 0;
+
 	/* set stream off register */
 	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
 			IMX219_MODE_STANDBY, NULL);
@@ -837,17 +869,33 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 
-	if (code->pad == IMX219_PAD_IMAGE) {
+	switch (code->pad) {
+	case IMX219_PAD_IMAGE:
 		/* The internal image pad is hardwired to the native format. */
 		if (code->index > 0)
 			return -EINVAL;
 
 		code->code = IMX219_NATIVE_FORMAT;
-	} else {
-		/*
-		 * On the source pad, the sensor supports multiple raw formats
-		 * with different bit depths.
-		 */
+		return 0;
+
+	case IMX219_PAD_EDATA:
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_META_8;
+		return 0;
+
+	case IMX219_PAD_SOURCE:
+	default:
+		break;
+	}
+
+	/*
+	 * On the source pad, the sensor supports multiple image raw formats
+	 * with different bit depths. The embedded data format bit depth
+	 * follows the image stream.
+	 */
+	if (code->stream == IMX219_STREAM_IMAGE) {
 		u32 format;
 
 		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4)
@@ -855,6 +903,15 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 
 		format = imx219_mbus_formats[code->index * 4];
 		code->code = imx219_get_format_code(imx219, format);
+	} else {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+						   IMX219_STREAM_EDATA);
+		code->code = fmt->code;
 	}
 
 	return 0;
@@ -866,7 +923,8 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 
-	if (fse->pad == IMX219_PAD_IMAGE) {
+	switch (fse->pad) {
+	case IMX219_PAD_IMAGE:
 		if (fse->code != IMX219_NATIVE_FORMAT || fse->index > 0)
 			return -EINVAL;
 
@@ -874,7 +932,24 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 		fse->max_width = IMX219_NATIVE_WIDTH;
 		fse->min_height = IMX219_NATIVE_HEIGHT;
 		fse->max_height = IMX219_NATIVE_HEIGHT;
-	} else {
+		return 0;
+
+	case IMX219_PAD_EDATA:
+		if (fse->code != MEDIA_BUS_FMT_META_8 || fse->index > 0)
+			return -EINVAL;
+
+		fse->min_width = IMX219_NATIVE_WIDTH;
+		fse->max_width = IMX219_NATIVE_WIDTH;
+		fse->min_height = IMX219_EMBEDDED_DATA_HEIGHT;
+		fse->max_height = IMX219_EMBEDDED_DATA_HEIGHT;
+		return 0;
+
+	case IMX219_PAD_SOURCE:
+	default:
+		break;
+	}
+
+	if (fse->stream == IMX219_STREAM_IMAGE) {
 		if (fse->code != imx219_get_format_code(imx219, fse->code) ||
 		    fse->index >= ARRAY_SIZE(supported_modes))
 			return -EINVAL;
@@ -883,6 +958,21 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 		fse->max_width = fse->min_width;
 		fse->min_height = supported_modes[fse->index].height;
 		fse->max_height = fse->min_height;
+	} else {
+		struct v4l2_mbus_framefmt *fmt;
+
+		fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+						   IMX219_STREAM_EDATA);
+		if (fse->code != fmt->code)
+			return -EINVAL;
+
+		if (fse->index > 0)
+			return -EINVAL;
+
+		fse->min_width = fmt->width;
+		fse->max_width = fmt->width;
+		fse->min_height = IMX219_EMBEDDED_DATA_HEIGHT;
+		fse->max_height = IMX219_EMBEDDED_DATA_HEIGHT;
 	}
 
 	return 0;
@@ -894,6 +984,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 {
 	struct imx219 *imx219 = to_imx219(sd);
 	const struct imx219_mode *mode;
+	struct v4l2_mbus_framefmt *ed_format;
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *compose;
 	struct v4l2_rect *crop;
@@ -905,9 +996,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 
 	/*
 	 * The driver is mode-based, the format can be set on the source pad
-	 * only.
+	 * only, and only for the image streeam.
 	 */
-	if (fmt->pad != IMX219_PAD_SOURCE)
+	if (fmt->pad != IMX219_PAD_SOURCE || fmt->stream != IMX219_STREAM_IMAGE)
 		return v4l2_subdev_get_fmt(sd, state, fmt);
 
 	/*
@@ -974,6 +1065,20 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 					      IMX219_STREAM_IMAGE);
 	*format = fmt->format;
 
+	/*
+	 * Finally, update the formats on the sink and source sides of the
+	 * embedded data stream.
+	 */
+	ed_format = v4l2_subdev_state_get_format(state, IMX219_PAD_EDATA);
+	ed_format->code = imx219_format_edata(format->code);
+	ed_format->width = format->width;
+	ed_format->height = IMX219_EMBEDDED_DATA_HEIGHT;
+	ed_format->field = V4L2_FIELD_NONE;
+
+	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					      IMX219_STREAM_EDATA);
+	*format = *ed_format;
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		int exposure_max;
 		int exposure_def;
@@ -1033,6 +1138,13 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 {
 	struct v4l2_rect *compose;
 
+	/*
+	 * The embedded data stream doesn't support selection rectangles,
+	 * neither on the embedded data pad nor on the source pad.
+	 */
+	if (sel->pad == IMX219_PAD_EDATA || sel->stream != 0)
+		return -EINVAL;
+
 	switch (sel->target) {
 	case V4L2_SEL_TGT_NATIVE_SIZE:
 		if (sel->pad != IMX219_PAD_IMAGE)
@@ -1085,35 +1197,41 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
-	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
-	u32 code;
+	u32 img_code;
+	u32 ed_code;
 
 	if (pad != IMX219_PAD_SOURCE)
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
-					   IMX219_STREAM_IMAGE);
-	code = fmt->code;
+	img_code = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+						IMX219_STREAM_IMAGE)->code;
+	ed_code = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
+					       IMX219_STREAM_EDATA)->code;
 	v4l2_subdev_unlock_state(state);
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
-	fd->num_entries = 1;
+	fd->num_entries = 2;
 
-	fd->entry[0].pixelcode = code;
+	fd->entry[0].pixelcode = img_code;
 	fd->entry[0].stream = IMX219_STREAM_IMAGE;
 	fd->entry[0].bus.csi2.vc = 0;
-	fd->entry[0].bus.csi2.dt = imx219_format_bpp(code) == 8 ?
+	fd->entry[0].bus.csi2.dt = imx219_format_bpp(img_code) == 8 ?
 		MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
 
+	fd->entry[1].pixelcode = ed_code;
+	fd->entry[1].stream = IMX219_STREAM_EDATA;
+	fd->entry[1].bus.csi2.vc = 0;
+	fd->entry[1].bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
+
 	return 0;
 }
 
 static int imx219_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
-	struct v4l2_subdev_route routes[1] = {
+	struct v4l2_subdev_route routes[] = {
 		{
 			.sink_pad = IMX219_PAD_IMAGE,
 			.sink_stream = 0,
@@ -1121,6 +1239,13 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 			.source_stream = IMX219_STREAM_IMAGE,
 			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
 				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
+		}, {
+			.sink_pad = IMX219_PAD_EDATA,
+			.sink_stream = 0,
+			.source_pad = IMX219_PAD_SOURCE,
+			.source_stream = IMX219_STREAM_EDATA,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
 		},
 	};
 	struct v4l2_subdev_krouting routing = {
@@ -1144,6 +1269,10 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
+	/*
+	 * Set the image stream format on the source pad. This will be
+	 * propagated to all formats and selection rectangles internally.
+	 */
 	imx219_set_pad_format(sd, state, &fmt);
 
 	return 0;
@@ -1415,12 +1544,14 @@ static int imx219_probe(struct i2c_client *client)
 	/*
 	 * Initialize the pads. To preserve backward compatibility with
 	 * userspace that used the sensor before the introduction of the
-	 * internal image pad, the external source pad is numbered 0 and the
-	 * internal image pad numbered 1.
+	 * internal pads, the external source pad is numbered 0 and the internal
+	 * image and embedded data pads numbered 1 and 2 respectively.
 	 */
 	imx219->pads[IMX219_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 	imx219->pads[IMX219_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK
 					     | MEDIA_PAD_FL_INTERNAL;
+	imx219->pads[IMX219_PAD_EDATA].flags = MEDIA_PAD_FL_SINK
+					     | MEDIA_PAD_FL_INTERNAL;
 
 	ret = media_entity_pads_init(&imx219->sd.entity,
 				     ARRAY_SIZE(imx219->pads), imx219->pads);
-- 
2.39.5


