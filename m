Return-Path: <linux-media+bounces-19900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C04C69A428E
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B2FF2886F3
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F6D204F7C;
	Fri, 18 Oct 2024 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkUeoPj1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE6D2040AE;
	Fri, 18 Oct 2024 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265587; cv=none; b=H7n+niKUpNIGchIP8hUxj4o/q8pbZAOS+rp259vJ9jJ2WJBZB06tljcqfiB4H3+fJUi90e6YX0CU0zJFoGsaWpkaPhYd+ctk/VbaX7BzzBhYO99va+PLY+xto7mHgVUoXO1oz/uar2XfLjkxM3MGFXikBljPU9lEvyvW+nvXh9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265587; c=relaxed/simple;
	bh=hdR7A9anTdpsGVR+qE87CPsJJtTElYsxI+W7FBwqxY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oddbj5WhaVs78W7Ye8r98RMwuo8GwCiemI6QGQh2Qu/v0+gt5Q4kjDSjlJUqmsb2x9arEFrjOzWOlBpID8zXWmhSDMO5Ru+5MDhxoIPL9652cidgRB43RRks7LuiyJzlZNvqQNF3q2hp2uMd96khFtW1LHRKbTtygg5YQujAwhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkUeoPj1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-431616c23b5so5742485e9.0;
        Fri, 18 Oct 2024 08:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729265583; x=1729870383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HAz6tJ3wio4C9Dm7amAN6biFEU2hVTXnxPKKhlf8r8=;
        b=TkUeoPj1BABCvlTWwXn2klaDvQOYsS6p1lz3vhH0ok/7I/o+fw0nxsrDZHv+mSmcDQ
         GIR1TOAttgYiDbHm57nHaU9e5W+LWhc+5229abpF5YubtHWTYkQtQWST1FCDeLnp9wXC
         NhVzZPmVHywNWPVPQNgQE/2okmxDTojUG+Qdh+aas4Zlzq8Z/Y6ayrV/C9JyxhSbVtjh
         OoJfv4dCgSZK0keMWf2SeyJeZvYCDDupziO1GLNxIMB8Kw0HRPaXqt2xyfVTIrbehyYd
         rzWoQuuTX5ihMMdRKRruLNb5dhblgGNIWkZxsTxUQHpImFQMChdhxlpbDXa41NYicUDu
         7h+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265583; x=1729870383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HAz6tJ3wio4C9Dm7amAN6biFEU2hVTXnxPKKhlf8r8=;
        b=gXVYQGFqEWOVb1Mr0h8EgIQdtPRvoY4yihg6zoI6MuZELNvCf6B0s8wZgmfhU5Ffjr
         fKFLy3zwyeSTyf0oYRIMFJo8BUfAI7cPR+EhtDOw4CmZFTbWESc9X50ODXPeZli6vFov
         EUHXaSwlmsqQo8+rG1AV7OL+/PJBDcgtEM+G/gcPqQOvmGvLpFeoSC3qkETCLKnIwibN
         m2xODYrqxn0LSlrWlmX1+z9bcNCJpOdYP0mM0rmBYR/wWre4837wv3GNxyCrSQ0ue+0r
         ms35cayfWGw2uNgyLb1I/HnoEdO5cQ8E2Jhz1BXd5Ki9B3wYbPa+IKXEUDoiijL5/SkI
         9VdA==
X-Forwarded-Encrypted: i=1; AJvYcCUmyOSqrOKgUHjXqpM0iu41sD1aeFDxYBiO+AccZt8EZ0gdHdvFg4b9hsJaYVfpZsoBSE2QBPpF3Pi5it4keQoAZDc=@vger.kernel.org, AJvYcCXb6SdwE90CY6qOVStYbQ/O9D2wK2YwUXCMwFUn6TTILk6HWeBA0V4aVjZUxvcR3bm0m/itgwuXQotXGvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwACn9TvVz4VewTufYg3ctQPlbvqZi4O27izW3q1XlEcAmt3OgN
	RBDwCcnd90UVSYmOde8dJoZMihCTPYziXrhmc+sHv8z2JkCQisqX
X-Google-Smtp-Source: AGHT+IEk5ZGzlrnfV2b3Z3AHzslcXY6wt5b9nCIaVX6eOSMvdZbdOUUr5pLh0mQSSmke2+CWtBfO6g==
X-Received: by 2002:a05:600c:1c95:b0:42c:ae4e:a96c with SMTP id 5b1f17b1804b1-4316168f5dbmr20772865e9.16.1729265582941;
        Fri, 18 Oct 2024 08:33:02 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067e7b9sm30615595e9.6.2024.10.18.08.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:33:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 09/10] media: i2c: ov5645: Add internal image sink pad
Date: Fri, 18 Oct 2024 16:32:29 +0100
Message-ID: <20241018153230.235647-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use the newly added internal pad API to expose the internal
configuration of the sensor to userspace in a standard manner.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 115 +++++++++++++++++++++++++++----------
 1 file changed, 84 insertions(+), 31 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index e3706b6b5621..a3353992594b 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -61,6 +61,10 @@
 #define OV5645_SDE_SAT_U		0x5583
 #define OV5645_SDE_SAT_V		0x5584
 
+#define OV5645_NATIVE_FORMAT	MEDIA_BUS_FMT_SBGGR8_1X8
+#define OV5645_NATIVE_WIDTH	2592
+#define OV5645_NATIVE_HEIGHT	1944
+
 /* regulator supplies */
 static const char * const ov5645_supply_name[] = {
 	"vdddo", /* Digital I/O (1.8V) supply */
@@ -70,6 +74,12 @@ static const char * const ov5645_supply_name[] = {
 
 #define OV5645_NUM_SUPPLIES ARRAY_SIZE(ov5645_supply_name)
 
+enum ov5645_pad_ids {
+	OV5645_PAD_SOURCE,
+	OV5645_PAD_IMAGE,
+	OV5645_NUM_PADS,
+};
+
 struct reg_value {
 	u16 reg;
 	u8 val;
@@ -88,7 +98,7 @@ struct ov5645 {
 	struct i2c_client *i2c_client;
 	struct device *dev;
 	struct v4l2_subdev sd;
-	struct media_pad pad;
+	struct media_pad pads[OV5645_NUM_PADS];
 	struct v4l2_fwnode_endpoint ep;
 	struct v4l2_rect crop;
 	struct clk *xclk;
@@ -850,7 +860,10 @@ static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
+	if (code->pad == OV5645_PAD_IMAGE)
+		code->code = OV5645_NATIVE_FORMAT;
+	else
+		code->code = MEDIA_BUS_FMT_UYVY8_1X16;
 
 	return 0;
 }
@@ -859,16 +872,24 @@ static int ov5645_enum_frame_size(struct v4l2_subdev *subdev,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
-		return -EINVAL;
-
-	if (fse->index >= ARRAY_SIZE(ov5645_mode_info_data))
-		return -EINVAL;
-
-	fse->min_width = ov5645_mode_info_data[fse->index].width;
-	fse->max_width = ov5645_mode_info_data[fse->index].width;
-	fse->min_height = ov5645_mode_info_data[fse->index].height;
-	fse->max_height = ov5645_mode_info_data[fse->index].height;
+	if (fse->pad == OV5645_PAD_IMAGE) {
+		if (fse->code != OV5645_NATIVE_FORMAT || fse->index > 0)
+			return -EINVAL;
+
+		fse->min_width = OV5645_NATIVE_WIDTH;
+		fse->max_width = OV5645_NATIVE_WIDTH;
+		fse->min_height = OV5645_NATIVE_HEIGHT;
+		fse->max_height = OV5645_NATIVE_HEIGHT;
+	} else {
+		if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16 ||
+		    fse->index >= ARRAY_SIZE(ov5645_mode_info_data))
+			return -EINVAL;
+
+		fse->min_width = ov5645_mode_info_data[fse->index].width;
+		fse->max_width = ov5645_mode_info_data[fse->index].width;
+		fse->min_height = ov5645_mode_info_data[fse->index].height;
+		fse->max_height = ov5645_mode_info_data[fse->index].height;
+	}
 
 	return 0;
 }
@@ -877,20 +898,57 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
 {
-	struct ov5645 *ov5645 = to_ov5645(sd);
-	struct v4l2_mbus_framefmt *__format;
-	struct v4l2_rect *__crop;
 	const struct ov5645_mode_info *new_mode;
+	struct ov5645 *ov5645 = to_ov5645(sd);
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_rect *compose;
+	struct v4l2_rect *crop;
 	int ret;
 
-	__crop = v4l2_subdev_state_get_crop(sd_state, 0);
+	if (format->pad != OV5645_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, format);
+
 	new_mode = v4l2_find_nearest_size(ov5645_mode_info_data,
 					  ARRAY_SIZE(ov5645_mode_info_data),
 					  width, height, format->format.width,
 					  format->format.height);
-
-	__crop->width = new_mode->width;
-	__crop->height = new_mode->height;
+	format->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
+	format->format.width = new_mode->width;
+	format->format.height = new_mode->height;
+	format->format.field = V4L2_FIELD_NONE;
+	format->format.colorspace = V4L2_COLORSPACE_SRGB;
+	format->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	format->format.quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	format->format.xfer_func = V4L2_XFER_FUNC_SRGB;
+
+	fmt = v4l2_subdev_state_get_format(sd_state, OV5645_PAD_IMAGE);
+	*fmt = format->format;
+	fmt->code = OV5645_NATIVE_FORMAT;
+	fmt->width = OV5645_NATIVE_WIDTH;
+	fmt->height = OV5645_NATIVE_HEIGHT;
+
+	crop = v4l2_subdev_state_get_crop(sd_state, OV5645_PAD_IMAGE);
+	crop->width = format->format.width;
+	crop->height = format->format.height;
+
+	/*
+	 * The compose rectangle models binning, its size is the sensor output
+	 * size.
+	 */
+	compose = v4l2_subdev_state_get_compose(sd_state, OV5645_PAD_IMAGE);
+	compose->left = 0;
+	compose->top = 0;
+	compose->width = format->format.width;
+	compose->height = format->format.height;
+
+	crop = v4l2_subdev_state_get_crop(sd_state, OV5645_PAD_SOURCE);
+	crop->left = 0;
+	crop->top = 0;
+	crop->width = format->format.width;
+	crop->height = format->format.height;
+
+	fmt = v4l2_subdev_state_get_format(sd_state, OV5645_PAD_SOURCE);
+	*fmt = format->format;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		ret = __v4l2_ctrl_s_ctrl_int64(ov5645->pixel_clock,
@@ -906,14 +964,6 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 		ov5645->current_mode = new_mode;
 	}
 
-	__format = v4l2_subdev_state_get_format(sd_state, 0);
-	__format->width = __crop->width;
-	__format->height = __crop->height;
-	__format->code = MEDIA_BUS_FMT_UYVY8_1X16;
-	__format->field = V4L2_FIELD_NONE;
-	__format->colorspace = V4L2_COLORSPACE_SRGB;
-
-	format->format = *__format;
 
 	return 0;
 }
@@ -923,7 +973,7 @@ static int ov5645_init_state(struct v4l2_subdev *subdev,
 {
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
-		.pad = 0,
+		.pad = OV5645_PAD_SOURCE,
 		.format = {
 			.code = MEDIA_BUS_FMT_UYVY8_1X16,
 			.width = ov5645_mode_info_data[1].width,
@@ -943,7 +993,7 @@ static int ov5645_get_selection(struct v4l2_subdev *sd,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
+	sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
 	return 0;
 }
 
@@ -1157,11 +1207,14 @@ static int ov5645_probe(struct i2c_client *client)
 	ov5645->sd.internal_ops = &ov5645_internal_ops;
 	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			    V4L2_SUBDEV_FL_HAS_EVENTS;
-	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ov5645->pads[OV5645_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ov5645->pads[OV5645_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK |
+					       MEDIA_PAD_FL_INTERNAL;
 	ov5645->sd.dev = dev;
 	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-	ret = media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pad);
+	ret = media_entity_pads_init(&ov5645->sd.entity,
+				     ARRAY_SIZE(ov5645->pads), ov5645->pads);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "could not register media entity\n");
 		goto free_ctrl;
-- 
2.43.0


