Return-Path: <linux-media+bounces-18100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF6C973E30
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CB93B27774
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5151A7AFD;
	Tue, 10 Sep 2024 17:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2NQfYPU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE87C1A76AB;
	Tue, 10 Sep 2024 17:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987992; cv=none; b=dybrK+s2hEJ9MJ8bLE5uOCaYKC0GY1g1R/tQ9vR/2U7ETztf5z+izOUS8S/+RY+LEUHbOpcnz1jk1q9IyongGgVMt+eRoc68vHeZ4PNPM3HLCssV9YOEiZrFXQncksaWCs0243KVmKfWp5UGCY9ic3JsdbMMmAT1ynb+N6dviR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987992; c=relaxed/simple;
	bh=0mZPOYT9CnGT8QbkXVkiPpzfcUGKMhtdrBapuj7FMRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lYoZn0ZHV+6jUDRomx7/FJtLNw1LO9mugVj7zKH8c8Y0qhJUaKqbVWPrwdf2+QeYZtb2+qxkQtSjABLusaBLVr7giVAkEQan86UX0oUVAb9K+r6ZTvLTsqGF0oKbZetYUwfHpj/iz/aHV94K4gD4RLvnFH5NAg1eQDjj6ENhKuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2NQfYPU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so100545e9.1;
        Tue, 10 Sep 2024 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987989; x=1726592789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSR7Rx/0s8RzKLeThaIHltBgE3HzWfrXkarrelDr1Bc=;
        b=X2NQfYPUZGBRbFkpNVthIX1HXGVqjbN8GbHbAxDixqcuZR1xQtMkAMzP3xdlvnshSY
         qQ5WR+sJeZAYZdsVA2a0mJOBcTtPVHP5bd+scD4+kddUQf7No3f2UF3B6oyLHpzJjtRP
         CLeDFwW/TxaVFkL3JRhjUT7F/s035TagDVmtS8+NtIBj0+iggPGnxXfYvZBiKRk24KBa
         vQi+rdEH/urv4rzQUMRk6OP/GnSDiO5pKKzDSYSNgM03gqvu02cr7bkOIz7riNF+j5zy
         6ggD7dZe/xrojg5cGi4M1HFSbWW7wzQJCQuwdP8sOKVyXaY9tvYJdX6nK4LpqM221fzB
         AuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987989; x=1726592789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSR7Rx/0s8RzKLeThaIHltBgE3HzWfrXkarrelDr1Bc=;
        b=cWsVxxKSg/6VxOEnk7/x/aWyFORByPJznpKj3i3mNhLlZYeJd0dV54GxOcn5MJSIlh
         hG2W5kJm/xKBrTeqEvkSYzDn1oPqD+KoTRUm+MeG0jz5g2yN1vlyJKCSo9cwHxwWguIv
         xMZX1i3dX5528OofRKOOPU3hIPl1VOE56j6tU3EDZNmDa9/kt+htfHcZdiwu5rZI1+wQ
         EHHHrhVwdqTqSTXFvYp5jb0e6BXCaVmSrEXvPVY78i++RfBVTTj+aIMsSwhYSnhpbs+h
         GTjkAGlOSGls1aJ84m2RUnB0DY989FRgc0ezGFX7n7Y4onpTrNq9MzRX6Jgo8MEW9u8o
         Mb0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVT36Ql9KPjdEuWSDowd3sWUn8XC95yyZCZ0oZK+KZaSqEx9cEuFcfnUh5a8LE4VryhPf3ABdvnq78ex9Y=@vger.kernel.org, AJvYcCXo7Q0ViEkb12d3AYrqMR/UjIt4eCwtNQxZ8wWP3lxKa8UWLbO9M9nXO6MF/aZKXxJPztPA4I/feEDvsaChN+SpA7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQXIa0AguRssCGLHuzaJU+msIjVYtyIgE6qjDB0xKEDY1uAZ3n
	R5xqEIRSF0dNWFWouUnsPKfyALhEfAQjhcJ+CWPGPcP8c1AgGtFq
X-Google-Smtp-Source: AGHT+IHbcDhjz9QBvgrn6T144Ta71E9GIWxYruU5UuuDoDTZ6lcr1KbRKvN3srAV7WDbgUOQw73jbw==
X-Received: by 2002:a05:600c:1d27:b0:42c:b991:98bc with SMTP id 5b1f17b1804b1-42cbdb822bemr23372895e9.0.1725987988912;
        Tue, 10 Sep 2024 10:06:28 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de4b9sm9438925f8f.111.2024.09.10.10.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:06:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 09/11] media: i2c: ov5645: Add internal image sink pad
Date: Tue, 10 Sep 2024 18:06:08 +0100
Message-Id: <20240910170610.226189-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/media/i2c/ov5645.c | 107 +++++++++++++++++++++++++++----------
 1 file changed, 79 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index dc93514608ee..255c6395a268 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -60,6 +60,10 @@
 #define OV5645_SDE_SAT_U		0x5583
 #define OV5645_SDE_SAT_V		0x5584
 
+#define OV5645_NATIVE_FORMAT	MEDIA_BUS_FMT_SBGGR8_1X8
+#define OV5645_NATIVE_WIDTH	2592
+#define OV5645_NATIVE_HEIGHT	1944
+
 /* regulator supplies */
 static const char * const ov5645_supply_name[] = {
 	"vdddo", /* Digital I/O (1.8V) supply */
@@ -69,6 +73,12 @@ static const char * const ov5645_supply_name[] = {
 
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
@@ -87,7 +97,7 @@ struct ov5645 {
 	struct i2c_client *i2c_client;
 	struct device *dev;
 	struct v4l2_subdev sd;
-	struct media_pad pad;
+	struct media_pad pads[OV5645_NUM_PADS];
 	struct v4l2_fwnode_endpoint ep;
 	struct v4l2_rect crop;
 	struct clk *xclk;
@@ -826,7 +836,10 @@ static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
+	if (code->pad == OV5645_PAD_IMAGE)
+		code->code = OV5645_NATIVE_FORMAT;
+	else
+		code->code = MEDIA_BUS_FMT_UYVY8_1X16;
 
 	return 0;
 }
@@ -835,16 +848,24 @@ static int ov5645_enum_frame_size(struct v4l2_subdev *subdev,
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
@@ -855,18 +876,55 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 {
 	struct ov5645 *ov5645 = to_ov5645(sd);
 	struct v4l2_mbus_framefmt *__format;
+	struct v4l2_rect *compose;
 	struct v4l2_rect *__crop;
 	const struct ov5645_mode_info *new_mode;
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
+	format->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	format->format.quantization = V4L2_QUANTIZATION_DEFAULT;
+	format->format.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	__format = v4l2_subdev_state_get_format(sd_state, OV5645_PAD_IMAGE);
+	*__format = format->format;
+	__format->code = OV5645_NATIVE_FORMAT;
+	__format->width = OV5645_NATIVE_WIDTH;
+	__format->height = OV5645_NATIVE_HEIGHT;
+
+	__crop = v4l2_subdev_state_get_crop(sd_state, OV5645_PAD_IMAGE);
+	__crop->width = format->format.width;
+	__crop->height = format->format.height;
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
+	__crop = v4l2_subdev_state_get_crop(sd_state, OV5645_PAD_SOURCE);
+	__crop->left = 0;
+	__crop->top = 0;
+	__crop->width = format->format.width;
+	__crop->height = format->format.height;
+
+	__format = v4l2_subdev_state_get_format(sd_state, OV5645_PAD_SOURCE);
+	*__format = format->format;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		ret = __v4l2_ctrl_s_ctrl_int64(ov5645->pixel_clock,
@@ -882,14 +940,6 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
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
@@ -899,7 +949,7 @@ static int ov5645_init_state(struct v4l2_subdev *subdev,
 {
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
-		.pad = 0,
+		.pad = OV5645_PAD_SOURCE,
 		.format = {
 			.code = MEDIA_BUS_FMT_UYVY8_1X16,
 			.width = ov5645_mode_info_data[1].width,
@@ -919,7 +969,7 @@ static int ov5645_get_selection(struct v4l2_subdev *sd,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
+	sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
 	return 0;
 }
 
@@ -1123,11 +1173,12 @@ static int ov5645_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
 	ov5645->sd.internal_ops = &ov5645_internal_ops;
 	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
-	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ov5645->pads[OV5645_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ov5645->pads[OV5645_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
 	ov5645->sd.dev = dev;
 	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-	ret = media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pad);
+	ret = media_entity_pads_init(&ov5645->sd.entity, ARRAY_SIZE(ov5645->pads), ov5645->pads);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "could not register media entity\n");
 		goto free_ctrl;
-- 
2.34.1


