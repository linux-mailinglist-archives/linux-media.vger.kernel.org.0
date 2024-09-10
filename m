Return-Path: <linux-media+bounces-18098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02196973E2A
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 799871F26E57
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFE21A727B;
	Tue, 10 Sep 2024 17:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwXNqiJX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB0F1A4F03;
	Tue, 10 Sep 2024 17:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987989; cv=none; b=CFh56m/XldJ4ATK+DuICbfFT1DFpxNKy9NseyalxxLHs+t+LCnjBw5zCIhZcTB2nNoj3CiKnXXn6bfVUYsyQemE2h5JhnuCfNtqbUO/nw+RkUHHqw7D3YnWWjSxrzPThj6p6BJg3Ops6I6DCecKbKrb2pdG2/BriVadwgksCrio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987989; c=relaxed/simple;
	bh=Ht70IJcyQJH4Dhqjjac98yUwsL35MwaRODP3k/kTeYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b0gy32fRZXhXCHsbqcIKhvhqweeFkYIdkg+2qy93LHqG0kqSsAB7ZiDqEtVGe3tMM9DsHpHhO3Zcv1uFbIo/ktDV9VWB3Ies1SqhfcW6HRhsQNwOV8OxzZpC1OH/r1+08ByHVaTEJPzw6rKefTCHXLH9ufual4feCmxuUf3K9Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwXNqiJX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cae102702so32919715e9.0;
        Tue, 10 Sep 2024 10:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725987986; x=1726592786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8uiJ1o1t/FLwtZAsye5lzWDkjfsKX1SsElvPj0kYXM=;
        b=iwXNqiJXW3/ttAL1syJ2dBhU+MdQCNlE6mpIiViyEoZwX4Gf7UZjq5FFzYSYMYq/gd
         3OmOOOIqatrEFiFVoFMrN/62l5FAiQV2yzgdqdJhEBTjne6v2JdWTD2Irwj/EnQwNCKh
         eXiPbBRtlQNYpy7tVgcyIt/odidEk3TFZXiwxsiIlnBkbYp70AWde1oIAEwlLSEsRAKf
         FY6H+l8Meep3WEXH57Zj4G9423vi1aHvsgaIKtXO2IikzFgSIyGiIth4ZhvQG8vLNCH5
         b1Y7521cNQnGnxTys5GmhsXBadjWOUZkr1zvveSOvsnqO8mtRHgbcm1NmmobNaOqQg9a
         QHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987986; x=1726592786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8uiJ1o1t/FLwtZAsye5lzWDkjfsKX1SsElvPj0kYXM=;
        b=wLrRZZbpU+7Vo1KmBAIem3uFPa5Qm0Hqy1TVx66s+e01aLTiTzCD2oIXgP9Utfr4Og
         DSwOj56Lw+02xQ9UEV51h3fciBSmELOfOkHkCuJFl+u/xq6RJsAMywV5krg6aDaw+ncC
         09zS1dl+YgX0eKZPih60C5lhEcaGZ9PMLtauoK4Qmrf6tuqqfdlMffrRzmhDv1fCby0H
         vrHkdJ2+6DMeo7wEClehkgzjLmsCEY3YAaXoYGhHf8C39dAfZim9UYP/v3tSjczz84du
         CMs4MaHo4DzTp4URCFDGOG/X6WNBgDgtfk00NRHIr6jPXNv2mkd+5UIY86V0YwM9k657
         4kOg==
X-Forwarded-Encrypted: i=1; AJvYcCUNBIa9INr+tleLPuYTMd6/fJH8UIQX/pO69d4xuJ6idTyE8A9ajaT65NrzyxRtjjlLXqdLAWvBECZ7YrU=@vger.kernel.org, AJvYcCXbuULKOUE5LURgibE48Upd3gH98XjMutBpc2DY274IpvfaZxaNtBu5j6bsWhtGtQIAbezZHD4o+pP18NmIIDK2fzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRd6CEDfimPigB6Y3xkk4FWysvZPhfEsB8xxIiZjjB63eQ6hgE
	8xYgetgtIZC6FpnyeD6aeN+genM6reEn5Alc11KSQGQoOSIF6zXn
X-Google-Smtp-Source: AGHT+IEDInuqJcMsepKgHn0+SNH1/ulUDsHynSJ9ODSmro1CkMvbhI09v88zXoxQUZ2gXW80Vl4sAA==
X-Received: by 2002:a05:600c:1c0f:b0:428:1b0d:8657 with SMTP id 5b1f17b1804b1-42cae73e0a1mr82103645e9.22.1725987986172;
        Tue, 10 Sep 2024 10:06:26 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de4b9sm9438925f8f.111.2024.09.10.10.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:06:25 -0700 (PDT)
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
Subject: [PATCH v2 07/11] media: i2c: ov5645: Use subdev active state
Date: Tue, 10 Sep 2024 18:06:06 +0100
Message-Id: <20240910170610.226189-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


