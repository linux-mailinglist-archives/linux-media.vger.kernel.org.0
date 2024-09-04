Return-Path: <linux-media+bounces-17627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D06196C93C
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F0721F28C47
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369C0188A1F;
	Wed,  4 Sep 2024 21:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEagMnYG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14A5186E40;
	Wed,  4 Sep 2024 21:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484074; cv=none; b=t0Mw8nHrutiT353ovHZaWH6dmFpSfH92PJ4pgGLFBMAQej4YvVBCoYNWCAKTEWzNM+Ws7aXlfGyqpqG1598gv6gwK1iz/OWAfdscYgAbq7rpzjJtyjcwkdVHY2rcLumxtz8KMQvczEEo1Vn6xYg1BvAMX/hRdFCG/eGhJgOJfJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484074; c=relaxed/simple;
	bh=Ht70IJcyQJH4Dhqjjac98yUwsL35MwaRODP3k/kTeYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y4LwBMrJe1U2W8CAgjRrVCSUt/yMFNRuxL1tnFp5UfrIV9mo87jtm5wMGYAYUZunhzz8WdKRTXjX5+U6L3RACzm+kqQgufeho4aUSiRri3v/1c4YRydrazmNhI1iwEEsmNde7eTSrXnijBtkGXJhpB+eGNUg8WS7Iv9T54/Wnu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEagMnYG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42bbe809b06so45963025e9.1;
        Wed, 04 Sep 2024 14:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484071; x=1726088871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8uiJ1o1t/FLwtZAsye5lzWDkjfsKX1SsElvPj0kYXM=;
        b=hEagMnYGr5GhEsirkwQSLmXCHOSmMvFWmivbhnHxgtkAgOLXnh7bWt8udcnj5rZS1W
         9xb7QJHWuYbk6G3GlEtw4vuqCbJCkUzVLGDQpuwN6Y7DRwsGbSJxCW6cUifX2xg+HWew
         A+xs/DfkgSNkhJtSDCfblbvuBVSsl0V7EcsBrSze3Il1tQcGg9Y2+jOSHXvch8AaNh9P
         M4Dn3GQREaT36XUFbZO6mNIe6Mdlb64fAIHVUKePUBNcoaabfEM6Baydk86UO6nX7dud
         880/ZSFtjEezs0Ph66HAudLor+/IiMnL3fn9z7B8Sv16dujSsfuLoHPujcrhf6qL+zHD
         qb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484071; x=1726088871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8uiJ1o1t/FLwtZAsye5lzWDkjfsKX1SsElvPj0kYXM=;
        b=B+Y1P0ST0sqSlQiV95WqjeLj+5qf08JGttiUDaX3ocdwc7i9LbufJ8sUtgihloBxqk
         rBTix7JZfp8yyOvZcsJFCHmWkHqllwFQK+LtNwVAWcNuIRHqw97HGYECxnkkM/P6o4T1
         OsN7PMLtmsJXlutrbLHV17tqQVv1JggpavktuWkYswkX2KoACyTNO2rzli/KnYaRwD/b
         xvJMqYi7qspfZnfJaQXnHaxEIZtGziCK0FJ7KaiVf3VhUqdvLzu6KqcAcN5ANI3MuvqF
         3dq/eca8T1+XRVBGHB+ArZve/6Olz7vMPa8dQjhx02pMuvs2E7t4w2+FNedzRSNbPu7P
         nAhA==
X-Forwarded-Encrypted: i=1; AJvYcCUcyJD74lr8Guf2xedrGInCdeO6rxmOu1WCkKpET/cgCketfqjiGXpQ5cBGVyadvu/UguFwO5epC8I0GVeMPam0rSQ=@vger.kernel.org, AJvYcCVJUMFcW8iEc6I/t6hznm71INtb5lOd1yHQOgZBxohRASzkCb089dEbEyuCEEyInDsGsjFnEEklhDuZbFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVxbLlGydM/zcJtBaIXIa06buleKJshiPSD/0OxrvRg2DOQ4kl
	XC/hDOJTI6iBhsL9xPVH+3EEk4YEePqiz8pYivPT2LaDqWQ/Ll5eEg8PxYWF
X-Google-Smtp-Source: AGHT+IEZS+UfmS3KPR+czSjHyVOuYwvsavbrVZc1vnhF2nnFXsx2e4lTetlRGuvsmV1PL1vuTZaNog==
X-Received: by 2002:a05:600c:a07:b0:427:abed:3602 with SMTP id 5b1f17b1804b1-42bb27a9e95mr155931335e9.24.1725484071106;
        Wed, 04 Sep 2024 14:07:51 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:50 -0700 (PDT)
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
Subject: [RFC PATCH 07/12] media: i2c: ov5645: Use subdev active state
Date: Wed,  4 Sep 2024 22:07:14 +0100
Message-Id: <20240904210719.52466-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Port the ov5645 sensor driver to use the subdev active state.

Move all the format configuration to the subdevice state and simplify
the format handling, locking and initialization.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 109 +++++++++++++------------------------
 1 file changed, 39 insertions(+), 70 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 25c60afcc0ec..9497ec737cb7 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -89,7 +89,6 @@ struct ov5645 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_fwnode_endpoint ep;
-	struct v4l2_mbus_framefmt fmt;
 	struct v4l2_rect crop;
 	struct clk *xclk;
 
@@ -850,49 +849,6 @@ static int ov5645_enum_frame_size(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static struct v4l2_mbus_framefmt *
-__ov5645_get_pad_format(struct ov5645 *ov5645,
-			struct v4l2_subdev_state *sd_state,
-			unsigned int pad,
-			enum v4l2_subdev_format_whence which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_state_get_format(sd_state, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &ov5645->fmt;
-	default:
-		return NULL;
-	}
-}
-
-static int ov5645_get_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state,
-			     struct v4l2_subdev_format *format)
-{
-	struct ov5645 *ov5645 = to_ov5645(sd);
-
-	format->format = *__ov5645_get_pad_format(ov5645, sd_state,
-						  format->pad,
-						  format->which);
-	return 0;
-}
-
-static struct v4l2_rect *
-__ov5645_get_pad_crop(struct ov5645 *ov5645,
-		      struct v4l2_subdev_state *sd_state,
-		      unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_state_get_crop(sd_state, pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &ov5645->crop;
-	default:
-		return NULL;
-	}
-}
-
 static int ov5645_set_format(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *format)
@@ -903,33 +859,30 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 	const struct ov5645_mode_info *new_mode;
 	int ret;
 
-	__crop = __ov5645_get_pad_crop(ov5645, sd_state, format->pad,
-				       format->which);
-
+	__crop = v4l2_subdev_state_get_crop(sd_state, 0);
 	new_mode = v4l2_find_nearest_size(ov5645_mode_info_data,
-			       ARRAY_SIZE(ov5645_mode_info_data),
-			       width, height,
-			       format->format.width, format->format.height);
+					  ARRAY_SIZE(ov5645_mode_info_data),
+					  width, height, format->format.width,
+					  format->format.height);
 
 	__crop->width = new_mode->width;
 	__crop->height = new_mode->height;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		ret = v4l2_ctrl_s_ctrl_int64(ov5645->pixel_clock,
-					     new_mode->pixel_clock);
+		ret = __v4l2_ctrl_s_ctrl_int64(ov5645->pixel_clock,
+					       new_mode->pixel_clock);
 		if (ret < 0)
 			return ret;
 
-		ret = v4l2_ctrl_s_ctrl(ov5645->link_freq,
-				       new_mode->link_freq);
+		ret = __v4l2_ctrl_s_ctrl(ov5645->link_freq,
+					 new_mode->link_freq);
 		if (ret < 0)
 			return ret;
 
 		ov5645->current_mode = new_mode;
 	}
 
-	__format = __ov5645_get_pad_format(ov5645, sd_state, format->pad,
-					   format->which);
+	__format = v4l2_subdev_state_get_format(sd_state, 0);
 	__format->width = __crop->width;
 	__format->height = __crop->height;
 	__format->code = MEDIA_BUS_FMT_UYVY8_1X16;
@@ -944,11 +897,15 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 static int ov5645_init_state(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_state *sd_state)
 {
-	struct v4l2_subdev_format fmt = { 0 };
-
-	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
-	fmt.format.width = 1920;
-	fmt.format.height = 1080;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = 0,
+		.format = {
+			.code = MEDIA_BUS_FMT_UYVY8_1X16,
+			.width = ov5645_mode_info_data[1].width,
+			.height = ov5645_mode_info_data[1].height,
+		},
+	};
 
 	ov5645_set_format(subdev, sd_state, &fmt);
 
@@ -959,25 +916,27 @@ static int ov5645_get_selection(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_selection *sel)
 {
-	struct ov5645 *ov5645 = to_ov5645(sd);
-
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	sel->r = *__ov5645_get_pad_crop(ov5645, sd_state, sel->pad,
-					sel->which);
+	sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
 	return 0;
 }
 
 static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
 {
 	struct ov5645 *ov5645 = to_ov5645(subdev);
+	struct v4l2_subdev_state *state;
 	int ret;
 
+	state = v4l2_subdev_lock_and_get_active_state(&ov5645->sd);
+
 	if (enable) {
 		ret = pm_runtime_resume_and_get(ov5645->dev);
-		if (ret < 0)
+		if (ret < 0) {
+			v4l2_subdev_unlock_state(state);
 			return ret;
+		}
 
 		ret = ov5645_set_register_array(ov5645,
 					ov5645->current_mode->data,
@@ -988,7 +947,7 @@ static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
 				ov5645->current_mode->height);
 			goto err_rpm_put;
 		}
-		ret = v4l2_ctrl_handler_setup(&ov5645->ctrls);
+		ret = __v4l2_ctrl_handler_setup(&ov5645->ctrls);
 		if (ret < 0) {
 			dev_err(ov5645->dev, "could not sync v4l2 controls\n");
 			goto err_rpm_put;
@@ -1013,6 +972,7 @@ static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
 		goto stream_off_rpm_put;
 	}
 
+	v4l2_subdev_unlock_state(state);
 	return 0;
 
 err_rpm_put:
@@ -1022,6 +982,7 @@ static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
 stream_off_rpm_put:
 	pm_runtime_mark_last_busy(ov5645->dev);
 	pm_runtime_put_autosuspend(ov5645->dev);
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -1032,7 +993,7 @@ static const struct v4l2_subdev_video_ops ov5645_video_ops = {
 static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
 	.enum_mbus_code = ov5645_enum_mbus_code,
 	.enum_frame_size = ov5645_enum_frame_size,
-	.get_fmt = ov5645_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ov5645_set_format,
 	.get_selection = ov5645_get_selection,
 };
@@ -1213,12 +1174,17 @@ static int ov5645_probe(struct i2c_client *client)
 		goto power_down;
 	}
 
-	ov5645_init_state(&ov5645->sd, NULL);
+	ov5645->sd.state_lock = ov5645->ctrls.lock;
+	ret = v4l2_subdev_init_finalize(&ov5645->sd);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "subdev init error\n");
+		goto power_down;
+	}
 
 	ret = v4l2_async_register_subdev_sensor(&ov5645->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "could not register v4l2 device\n");
-		goto power_down;
+		goto error_subdev_cleanup;
 	}
 
 	pm_runtime_set_active(dev);
@@ -1231,6 +1197,8 @@ static int ov5645_probe(struct i2c_client *client)
 
 	return 0;
 
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&ov5645->sd);
 power_down:
 	ov5645_set_power_off(dev);
 free_entity:
@@ -1247,6 +1215,7 @@ static void ov5645_remove(struct i2c_client *client)
 	struct ov5645 *ov5645 = to_ov5645(sd);
 
 	v4l2_async_unregister_subdev(&ov5645->sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&ov5645->sd.entity);
 	v4l2_ctrl_handler_free(&ov5645->ctrls);
 	pm_runtime_disable(ov5645->dev);
-- 
2.34.1


