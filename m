Return-Path: <linux-media+bounces-17629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFE896C942
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D7401F27453
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C8E1527BB;
	Wed,  4 Sep 2024 21:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liuYzK5m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B25188A2C;
	Wed,  4 Sep 2024 21:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484077; cv=none; b=ZvWH1j5IOB1e+34E0z7F/8Rzane759jbM4LHzk5+XDVWHBSq/WKxpcqRfuz3/VE4dwr1Rz26dAGaAcz9w4kVZz3hYqBDMHWc72/Ac3qTT2FxHvAQyiHZ/wLeFxu1rV5DIttFX0AXo3kUeLAWGTgl/oY9HFZ5YcMpADmItBjVUgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484077; c=relaxed/simple;
	bh=apy/83bf7I4kNRjoOT7IzBaFlyBQwcddIcj61s/vSOk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ksp4+gisodqP5AYIChqE0ldMS3DkWa8Bre4grbNkkZ0cvXMxTm749s7yTbzEn5KvnhZADrPgEAO0UZMgeQ4NYdBQBtCcUj0HS/52AqRg/Zv9t1EDKWyFP5YT8S8Pnju4ST5Ar0Liya+24VyJ+GCEi0i5uasiYN2XfAfFhow4QZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liuYzK5m; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42bb81e795bso57365495e9.1;
        Wed, 04 Sep 2024 14:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484074; x=1726088874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOjJvonRGcQ+cw3Caitccalck6hyNMNmMbmy0DeHlz0=;
        b=liuYzK5mAdhVd5kX6MpA5zss6gYpAMvwpd7VRwGDWb4NKT6r2yT4xL4yEEWsU7Cium
         3v7+a28Gf+nqgk9USkHe2x1Hosba9cfDOh7LnQc07YIPMdh57qU24qVMRgQXL+ekavkx
         ZrTKay6PQO/nFH8ZRaQpHCImpajpIcCcEJPkpWgr2Emyd4WL1aTDUIwzPLte7xUKzbvz
         X9TeNqmbmV1s3hFMElCe/ZqlRSwqwd/jy7dczvSFEp3vVOwh3FXDkitKFV+ACTTYqiWg
         Ko6Sv0t3d7MR9uT/N6+tI4lzBx0TIU+jBbyNB0WShTuLBQycwFaCdZWGPLhuuvox0PNf
         AFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484074; x=1726088874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOjJvonRGcQ+cw3Caitccalck6hyNMNmMbmy0DeHlz0=;
        b=HeLSb1T9jHiabUi2UBbAYIWKB9tqijbOQqqHKJZ87OWaNzmPKpZmLWb8JzS3ZXf6HF
         YSCaP+qHF7IhkGBLWcLGOEl/kUJ1WSSMHa4grN55a6wDwSL+JlBV+y4awu/gEnLArTqd
         sVOUDFsurJHOx/Mysw+6GQoyBfAcDbfn0xxRDrGzrBQpInqzCWQUApP0y762OZAEjmsa
         x8LljYE7eqYNdB/ZlLh6COd6oQdoCb+ZQsvI7dZfOxfHGWO8IHpVS+TKVW+g7dS1yL6x
         eZgujCz76vV7HYgjHCWwIMuCbWp6e5VaRgVLaHJL3/By5KmdAljSzUkyHBaJ+C+zUjHD
         upNA==
X-Forwarded-Encrypted: i=1; AJvYcCVwXT8fvOeOOK2d0j0zYc6njzn144gjDpSpC19dWVdJ57iERmeQ4Yql8QM4Mcm2xFVq+RGRvZBrRShXYdWwxxIdC4A=@vger.kernel.org, AJvYcCWo9zdJAPJekn9CnkLDhCHeoM/w0D8SJH1Ocu7vj7Q5WP6AlqkHbcGIyislyppuaHo9GFwM/uPHQ6IuRS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCUvoyNJwaC9Ah9b8hLmZ3dyXiFLoFost8x1+rpMUiSbBJSISH
	e0L9QWg3B+lKiPoAGtNFA6/FoxjAm/rxI31a2mjZeDqmrb8HxQ0SNUHcospu
X-Google-Smtp-Source: AGHT+IH97t1XBKFiU1zdF2evTW8Pdo2F9taSRES/a0mu/hIDdp0cpPpzDpvb6YqT5ng0+pLMF2l48A==
X-Received: by 2002:a05:600c:138e:b0:428:c0a:27ea with SMTP id 5b1f17b1804b1-42bbb205ac6mr134731205e9.12.1725484073747;
        Wed, 04 Sep 2024 14:07:53 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 09/12] media: i2c: ov5645: Add internal image sink pad
Date: Wed,  4 Sep 2024 22:07:16 +0100
Message-Id: <20240904210719.52466-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/media/i2c/ov5645.c | 100 +++++++++++++++++++++++++++----------
 1 file changed, 75 insertions(+), 25 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index dc93514608ee..e5ec09f44bec 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -60,6 +60,10 @@
 #define OV5645_SDE_SAT_U		0x5583
 #define OV5645_SDE_SAT_V		0x5584
 
+#define OV5645_NATIVE_FORMAT	MEDIA_BUS_FMT_UYVY8_1X16
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
@@ -838,13 +848,23 @@ static int ov5645_enum_frame_size(struct v4l2_subdev *subdev,
 	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
 		return -EINVAL;
 
-	if (fse->index >= ARRAY_SIZE(ov5645_mode_info_data))
-		return -EINVAL;
-
-	fse->min_width = ov5645_mode_info_data[fse->index].width;
-	fse->max_width = ov5645_mode_info_data[fse->index].width;
-	fse->min_height = ov5645_mode_info_data[fse->index].height;
-	fse->max_height = ov5645_mode_info_data[fse->index].height;
+	if (fse->pad == OV5645_PAD_IMAGE) {
+		if (fse->index > 0)
+			return -EINVAL;
+
+		fse->min_width = OV5645_NATIVE_WIDTH;
+		fse->max_width = OV5645_NATIVE_WIDTH;
+		fse->min_height = OV5645_NATIVE_HEIGHT;
+		fse->max_height = OV5645_NATIVE_HEIGHT;
+	} else {
+		if (fse->index >= ARRAY_SIZE(ov5645_mode_info_data))
+			return -EINVAL;
+
+		fse->min_width = ov5645_mode_info_data[fse->index].width;
+		fse->max_width = ov5645_mode_info_data[fse->index].width;
+		fse->min_height = ov5645_mode_info_data[fse->index].height;
+		fse->max_height = ov5645_mode_info_data[fse->index].height;
+	}
 
 	return 0;
 }
@@ -855,18 +875,55 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
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
@@ -882,14 +939,6 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
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
@@ -899,9 +948,9 @@ static int ov5645_init_state(struct v4l2_subdev *subdev,
 {
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
-		.pad = 0,
+		.pad = OV5645_PAD_SOURCE,
 		.format = {
-			.code = MEDIA_BUS_FMT_UYVY8_1X16,
+			.code = OV5645_NATIVE_FORMAT,
 			.width = ov5645_mode_info_data[1].width,
 			.height = ov5645_mode_info_data[1].height,
 		},
@@ -919,7 +968,7 @@ static int ov5645_get_selection(struct v4l2_subdev *sd,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
+	sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
 	return 0;
 }
 
@@ -1123,11 +1172,12 @@ static int ov5645_probe(struct i2c_client *client)
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


