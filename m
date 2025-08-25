Return-Path: <linux-media+bounces-40993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C82B33BF5
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AA5F3B6396
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9462E1744;
	Mon, 25 Aug 2025 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsLgjGTB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C182E1737
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115525; cv=none; b=Gf8zd4nVdPIV2t7cgjSLA1LxZSLPY0KjB/bi6BcRY4nrhAjtvZ12UlaaIUNZgJvT4MKp7wjy4ADiEo5esNr6yQhv8uDTq4E9ibRBZ2pJCcfOAW7hxnblAEdt7wmb7to80XqbzYO9vgvQdyc1u73emRQcTvKwZ+YbsyD4TumryyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115525; c=relaxed/simple;
	bh=iMu+824XX8KnCte/f7zH5LbRdDXR9yBsiYoEASrFvYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBIg7Di4BH9iqJG5bH+2tuKcXj/ZjEUm+jaSCF+rBm7mqPCnre+r/dzt/xOsGOe1ewWgKLU6vDCgUoGl7YNcwWjH5cfjSMZ7pQOqVV4yDVQfZagS1YEx9RRv6v4EkqZBVm7Ec26ZL+RQ3/JnDazuA5gF2ifCJb2+ERBLUEiy3o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsLgjGTB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115524; x=1787651524;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iMu+824XX8KnCte/f7zH5LbRdDXR9yBsiYoEASrFvYs=;
  b=GsLgjGTBnOuwOrcm9fK1odB3029NDaNEYlCQ6bHfnXaMcIEbznMPrZxm
   h9IHaapF/sN5xwg6ZI1/tqrRYlG5LS2PKRRL4jkBoTnyqPA87FIC1jVpJ
   GUDBVoPhQMQw5gaTUkXtjsQ20U6KvACd6fO27+kt8fL7JjknAFg0HU3/1
   LkXej5jFOu0VMod/uJM8EO3OhoFgVIo5BkCb9hRyK4fnSLmCECnOp1hWJ
   oj3W85g8MmGCKhUvIx3P/fev22KcuUn/5Q3J5Gkr/SVOEQs3285x5Qbs9
   T+KGcH8juby0bYJ9nh/549nIxbwJffZKxvwSZhBuQteFZUXJuQN8sGq7o
   g==;
X-CSE-ConnectionGUID: YtIUUAxtT+WRdyzn2fIReQ==
X-CSE-MsgGUID: +iJiE78gRSiSPjkN+HC4Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032512"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032512"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:55 -0700
X-CSE-ConnectionGUID: 0RcxdB3vRS2wfojyDXlzWA==
X-CSE-MsgGUID: eArHKFQOSdOXXEGFQVKFvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431159"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:47 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4F8B412200F;
	Mon, 25 Aug 2025 12:51:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr3-00000005aiC-1CJC;
	Mon, 25 Aug 2025 12:51:09 +0300
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
Subject: [PATCH v11 62/66] media: i2c: imx219: Add embedded data support
Date: Mon, 25 Aug 2025 12:51:03 +0300
Message-ID: <20250825095107.1332313-63-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
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
 drivers/media/i2c/imx219.c | 174 ++++++++++++++++++++++++++++++++-----
 1 file changed, 153 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 8ed1febc7b21..d2d64a1644a9 100644
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
@@ -1122,6 +1240,14 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
 				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
 				 V4L2_SUBDEV_ROUTE_FL_STATIC,
+		}, {
+			.sink_pad = IMX219_PAD_EDATA,
+			.sink_stream = 0,
+			.source_pad = IMX219_PAD_SOURCE,
+			.source_stream = IMX219_STREAM_EDATA,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+				 V4L2_SUBDEV_ROUTE_FL_STATIC,
 		},
 	};
 	struct v4l2_subdev_krouting routing = {
@@ -1145,6 +1271,10 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
+	/*
+	 * Set the image stream format on the source pad. This will be
+	 * propagated to all formats and selection rectangles internally.
+	 */
 	imx219_set_pad_format(sd, state, &fmt);
 
 	return 0;
@@ -1420,12 +1550,14 @@ static int imx219_probe(struct i2c_client *client)
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
2.47.2


