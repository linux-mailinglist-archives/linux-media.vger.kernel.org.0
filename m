Return-Path: <linux-media+bounces-19897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A289A4284
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E054E1C20FA9
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5CA20408E;
	Fri, 18 Oct 2024 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQFOhOYD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6C62038B7;
	Fri, 18 Oct 2024 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265584; cv=none; b=m9mg3tMmvqyzjR/sUHTxINQTGdy7e+DItbFgU2OhU1iBYO8YPFOxQLPurj7iVGqz2O5rmTBXWlEmkMNuOfv7+jMV/iQqL6O1Pj4yugEzTrcomBQADP4SmQKTc1akTkDaLcHrsbp+z70GcNlMR7XqdQnvUG1HzG3F5CLZqbtI0uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265584; c=relaxed/simple;
	bh=fLlMaAmLB5Cptdhjx9tpypHlokSDAYHI2RFfpK5Fwm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lH+eO8mdrj6L/b67lOzm7+XCEraoI4HwNTgXPeOL470Mk/lZJ/rDK03KwYwC7VUzZNRTKjXo/4SMTl/ZxnGHaYiyD20SqDj8PYzX2C3XCzxCV4j8qIyfY+M9nrh0gafIVqDFdZRD+U7ROV35feZQV0H/f+7q6LpJvIeJD9nStxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQFOhOYD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315baec69eso17882935e9.2;
        Fri, 18 Oct 2024 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729265580; x=1729870380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHTopufciGDt7pi7yqI/BXDV62m/Ypu2lG8rAz8HBNE=;
        b=TQFOhOYDmK7lz4c3Nz+GeIJjWCGj1caJJgZ/wvHWMOBBeWxSgfyuNi2JfNRdzornOq
         PoVGUGeallopsfUIF9rtF5JdqBExwCYG9M4rUZlf2hvfBr+BPjWw1rO5JJNeybO9kz4O
         ywlQzMtgOQLvB7XuZdt6j8XIc2z2nyhXAnCVz25gvG7h4wj8ugc9DgQED/Ndx9OQaa0h
         OhQGJXB1RVEwb3WXNyRiagsKHhXZd/a4O5za11zPixQ4wRcB4XMGC+IHHi6l8sjDGYcc
         Q9IKWFSDCWBVt4ZilzetpWyCyIZPcq9WywGgnhHdrTW6lLEFw/2Ri0Ns0i7DTKLC23cY
         PRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265580; x=1729870380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHTopufciGDt7pi7yqI/BXDV62m/Ypu2lG8rAz8HBNE=;
        b=WBoCOh22MSinWeTVeZeu+ioEb6jexv0YIxt7Bvs5dE2Ir38+pUc5wTTs/53QIb0JQf
         5269NH7KLiMJ1QhasYOfUe2/ti4M2Ocq3B1GghxWyF6DThiAW5EGVwVTeOuhmck1yHN5
         y2OhcFWUehnqIm9JYhCo2H8AHXjd3f8FmaKKT+1xwGoMiGIwt8MgpYpzP9GxJDimtqkJ
         BWvo7+XcdMv9/6Y0B/jQZEiI71T5jehmd+MVEp9gkRsLrwmCJI+f37e7Nh3T7t8DnPhV
         R8GUScWR0ygiCzVZdizuEFOvyR6Wem05I5pGXjHEMn5HvyYr1m+XOj9luAvRrNHReVpY
         7xRw==
X-Forwarded-Encrypted: i=1; AJvYcCV/03sTwFLjWSufqJVXCMWzw+dKqbeTchM+hdpWvz+/Sh2mhmmK794ynoTOWFo+iIWtrU9BnKnm/1wSrcU=@vger.kernel.org, AJvYcCV6nqrMqtU7NJschJjupDk3/UQFMeDIpQLCu3r8FDQI+nz3ybK0+dMUMB3e5Ha8IbvIPb+KYRWvOkluE/AkKlaH/RE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYUp4c6L3jwRb5U4HXqkV6sCJMFrGWhn4BjJa2Fsy/ytDdEik5
	ZOc1TtZnL0Ap8hwe49L8SLfW1IBcM0OZkG1OyMpnc57iuTGr0522OSm34w==
X-Google-Smtp-Source: AGHT+IEntrVpEX+DEyHRuhWdLE1rScmTfZ07C9fNEM2AHWVxUPfxzxwGFIOgRMJTmE/4oDoFMN9AZw==
X-Received: by 2002:a05:600c:4e12:b0:431:5f8c:ccbd with SMTP id 5b1f17b1804b1-43161634be1mr17624755e9.4.1729265579735;
        Fri, 18 Oct 2024 08:32:59 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067e7b9sm30615595e9.6.2024.10.18.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:32:59 -0700 (PDT)
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
Subject: [PATCH v3 06/10] media: i2c: ov5645: Use subdev active state
Date: Fri, 18 Oct 2024 16:32:26 +0100
Message-ID: <20241018153230.235647-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Port the ov5645 sensor driver to use the subdev active state.

Move all the format configuration to the subdevice state and simplify
the format handling, locking and initialization.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov5645.c | 108 +++++++++++++------------------------
 1 file changed, 38 insertions(+), 70 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a7d380692673..357298dab9b4 100644
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
@@ -1222,12 +1183,17 @@ static int ov5645_probe(struct i2c_client *client)
 		goto power_down;
 	}
 
+	ov5645->sd.state_lock = ov5645->ctrls.lock;
+	ret = v4l2_subdev_init_finalize(&ov5645->sd);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "subdev init error\n");
+		goto power_down;
+	}
+
 	pm_runtime_set_active(dev);
 	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
 
-	ov5645_init_state(&ov5645->sd, NULL);
-
 	ret = v4l2_async_register_subdev_sensor(&ov5645->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "could not register v4l2 device\n");
@@ -1244,6 +1210,7 @@ static int ov5645_probe(struct i2c_client *client)
 err_pm_runtime:
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
+	v4l2_subdev_cleanup(&ov5645->sd);
 power_down:
 	ov5645_set_power_off(dev);
 free_entity:
@@ -1260,6 +1227,7 @@ static void ov5645_remove(struct i2c_client *client)
 	struct ov5645 *ov5645 = to_ov5645(sd);
 
 	v4l2_async_unregister_subdev(&ov5645->sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&ov5645->sd.entity);
 	v4l2_ctrl_handler_free(&ov5645->ctrls);
 	pm_runtime_disable(ov5645->dev);
-- 
2.43.0


