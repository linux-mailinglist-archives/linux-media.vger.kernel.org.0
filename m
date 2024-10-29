Return-Path: <linux-media+bounces-20535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 050199B4F2A
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 17:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 840A51F23C8D
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 16:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0435F1990A8;
	Tue, 29 Oct 2024 16:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRIB5Wp3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4B196C7C;
	Tue, 29 Oct 2024 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730218875; cv=none; b=qIy86tnKzXwddAqJauAiekbmBVI5bE6Aa4LUIM9Y49MOP+G2/72w7fVEZ8EqpRaaleFWKw7Dc/WWPPh4owJUqLKmd8xm9Z+IwVJvyHPVOIzaUjfX9Op7/6lOuTly20x1iN+hk/48Mr+uX+IX8jku6tb8uIpLK7u7VZDCT3C1Xv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730218875; c=relaxed/simple;
	bh=hLjy6zAmLNGkHyAnN52pUcE40rdG/NyvpWTGIuvI/WY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CnsLSpGH26oxdspi5yNmokYJIcmyRxfgpXzGOeqbswKhvvdzezhrhxvHW2C8LFdpAWAS1dQzQJ8xa6HZK2EFElLLlK8r7i68qSaaroVTOBrSg21/4b3FYrlgvScWinm9R6AV81Znc6boASdKInK92fzYanwj+tJo3HnpvRYpqMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRIB5Wp3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so53948585e9.1;
        Tue, 29 Oct 2024 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730218870; x=1730823670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E9RmhqMTqzi/Ked7hGQ+5N4rvxfm/Rck8IaMTKWakEI=;
        b=nRIB5Wp3r1qvIfq06UzdsS2jQVXT8jiCLXr2GPYW9EutDwR2h2wCa/wJTX29glxdVh
         CrHNDUVP6i7CQMc1Hk8UU4bdsF8Ww8V4wqWx67u1t74vvLfO0M1p7ZZueagXFI+1Q7ZG
         Cct/dZX6KoaU2Y5nQRDgBKInppCFq16lySBUWw4UI4Cn0kObyLfqeygoxb7BHXB28Xdh
         6O9OastY3UoIoTSmbDUDpqn6VyV7eQhK0TC0zL8VVZOcwwQkx/5uVb4yV1qDn4l3cyNa
         X4mfxval3Eckoo798dCHQM199sicDhrVgHYpNLslhx/T38usJu8oTqsw7oaUoMLxlRJg
         RQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730218870; x=1730823670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9RmhqMTqzi/Ked7hGQ+5N4rvxfm/Rck8IaMTKWakEI=;
        b=Y6plfrPlqegCm4R88TMZy+UhuTOlagzg/SqF1K6rG1VIswbVQlwzX0w3GnUkHEHZjY
         Z6jj30Gf4odtGck2L7xwgzlsC2SIjPwTrSOsmvLvTDvLDBF7426onBIFyKyXVcaf7gIu
         P6wuXaj69v/Hq0XwKxgMLE2Ccm/WH6NwgwudNIh8MwMxyHRTgHh8kOX3VIsXYCjerm+b
         VSeWw3kgnOz2F9AsVnbNll+kZENvQMFeJ/XFJfkbLGS6KoxOUWsie+mm3+SP8O8u0u9S
         7u2XS+4RM8JEuT5L8e0thpWbzaw6lpJXK7OZ+lQia34y0RHdsh9WWG8ShrW+j7pVxQgF
         DDYg==
X-Forwarded-Encrypted: i=1; AJvYcCUm2XCX07pM0AIzM/qvD6uO0vkIbuLqrtVXP2OV3DKEv5D7PrcwhKjcT3MbOuKSyB3nZuWb2jbN4SlTSMQ=@vger.kernel.org, AJvYcCWvoaNnMYKt+0qo1v5NGbaP9YLQmiyqwaccnNpq9v8hw7F5OnoIMc71jtCadf3KKObrKf77B9xmio+O008=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9CTPKnzHyYpZZf8jKYysCWTUbPZHvbKPHPxfEBtW9X45pYq1E
	xOJdrjFAT7VpK1eKaN3dapOxfzp0glvVCHPYZLAuj7k0C0hIJdJ8
X-Google-Smtp-Source: AGHT+IG+YTOuN28TRhBwJXIVTBpYl1k1hpSa15Dwx//2gp3lAHsOxUi+o3aEVvfBQnnLFeh340gdCA==
X-Received: by 2002:a05:600c:1c03:b0:431:51a9:e956 with SMTP id 5b1f17b1804b1-431bb9775c8mr3142005e9.1.1730218869612;
        Tue, 29 Oct 2024 09:21:09 -0700 (PDT)
Received: from tom-desktop.station (net-188-217-53-167.cust.vodafonedsl.it. [188.217.53.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193572932sm152468385e9.1.2024.10.29.09.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 09:21:09 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sebastian Reichel <sre@kernel.org>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Julien Massot <julien.massot@collabora.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] media: v4l2-subdev: Drop HAS_EVENTS and event handlers
Date: Tue, 29 Oct 2024 17:21:05 +0100
Message-Id: <20241029162106.3005800-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_subdev_init_finalize() already sets the HAS_EVENTS flag if a
control handler is set, and subdev_do_ioctl() uses
v4l2_ctrl_subdev_subscribe_event() and v4l2_event_subdev_unsubscribe()
as defaults if the subdev doesn't have .(un)subscribe.
Let's drop the HAS_EVENTS flag and event handlers.

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c |  5 +----
 drivers/media/i2c/ds90ub953.c   |  5 +----
 drivers/media/i2c/ds90ub960.c   |  5 +----
 drivers/media/i2c/gc0308.c      |  4 ----
 drivers/media/i2c/gc05a2.c      | 10 +---------
 drivers/media/i2c/gc08a3.c      | 10 +---------
 drivers/media/i2c/gc2145.c      | 10 +---------
 drivers/media/i2c/imx219.c      | 10 +---------
 drivers/media/i2c/imx283.c      | 10 +---------
 drivers/media/i2c/imx290.c      | 10 +---------
 drivers/media/i2c/max96714.c    |  6 +-----
 drivers/media/i2c/max96717.c    |  6 +-----
 drivers/media/i2c/ov01a10.c     |  6 +-----
 drivers/media/i2c/ov64a40.c     | 10 +---------
 drivers/media/i2c/ov8858.c      |  9 +--------
 drivers/media/i2c/thp7312.c     |  5 +----
 16 files changed, 15 insertions(+), 106 deletions(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index 5c294e4ad20c..5b66bfac195a 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -16,7 +16,6 @@
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -2265,8 +2264,6 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 
 static const struct v4l2_subdev_core_ops alvium_core_ops = {
 	.log_status = alvium_log_status,
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_video_ops alvium_video_ops = {
@@ -2314,7 +2311,7 @@ static int alvium_subdev_init(struct alvium_dev *alvium)
 	v4l2_i2c_subdev_init(sd, client, &alvium_subdev_ops);
 
 	sd->internal_ops = &alvium_internal_ops;
-	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	alvium->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 16f88db14981..8b028a84f5bc 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -24,7 +24,6 @@
 
 #include <media/i2c/ds90ub9xx.h>
 #include <media/v4l2-ctrls.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
@@ -717,8 +716,6 @@ static const struct v4l2_subdev_pad_ops ub953_pad_ops = {
 
 static const struct v4l2_subdev_core_ops ub953_subdev_core_ops = {
 	.log_status = ub953_log_status,
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_ops ub953_subdev_ops = {
@@ -1246,7 +1243,7 @@ static int ub953_subdev_init(struct ub953_data *priv)
 	priv->sd.internal_ops = &ub953_internal_ops;
 
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
+			  V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &ub953_entity_ops;
 
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 58424d8f72af..33f362a00875 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -48,7 +48,6 @@
 #include <media/i2c/ds90ub9xx.h>
 #include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -3085,8 +3084,6 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 
 static const struct v4l2_subdev_core_ops ub960_subdev_core_ops = {
 	.log_status = ub960_log_status,
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_internal_ops ub960_internal_ops = {
@@ -3667,7 +3664,7 @@ static int ub960_create_subdev(struct ub960_data *priv)
 	}
 
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
+			  V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &ub960_entity_ops;
 
diff --git a/drivers/media/i2c/gc0308.c b/drivers/media/i2c/gc0308.c
index fa754a8a39a6..069f42785b3c 100644
--- a/drivers/media/i2c/gc0308.c
+++ b/drivers/media/i2c/gc0308.c
@@ -18,7 +18,6 @@
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -987,8 +986,6 @@ static const struct v4l2_ctrl_ops gc0308_ctrl_ops = {
 
 static const struct v4l2_subdev_core_ops gc0308_core_ops = {
 	.log_status = v4l2_ctrl_subdev_log_status,
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	.g_register	= gc0308_g_register,
 	.s_register	= gc0308_s_register,
@@ -1338,7 +1335,6 @@ static int gc0308_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&gc0308->sd, client, &gc0308_subdev_ops);
 	gc0308->sd.internal_ops = &gc0308_internal_ops;
 	gc0308->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	gc0308->sd.flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
 
 	ret = gc0308_init_controls(gc0308);
 	if (ret)
diff --git a/drivers/media/i2c/gc05a2.c b/drivers/media/i2c/gc05a2.c
index 0413c557e594..3f7f3d5abeeb 100644
--- a/drivers/media/i2c/gc05a2.c
+++ b/drivers/media/i2c/gc05a2.c
@@ -24,7 +24,6 @@
 
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -1059,13 +1058,7 @@ static const struct v4l2_subdev_pad_ops gc05a2_subdev_pad_ops = {
 	.get_selection = gc05a2_get_selection,
 };
 
-static const struct v4l2_subdev_core_ops gc05a2_core_ops = {
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
-};
-
 static const struct v4l2_subdev_ops gc05a2_subdev_ops = {
-	.core = &gc05a2_core_ops,
 	.video = &gc05a2_video_ops,
 	.pad = &gc05a2_subdev_pad_ops,
 };
@@ -1271,8 +1264,7 @@ static int gc05a2_probe(struct i2c_client *client)
 		return dev_err_probe(dev, ret,
 				     "failed to init controls\n");
 
-	gc05a2->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			    V4L2_SUBDEV_FL_HAS_EVENTS;
+	gc05a2->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	gc05a2->pad.flags = MEDIA_PAD_FL_SOURCE;
 	gc05a2->sd.dev = &client->dev;
 	gc05a2->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
diff --git a/drivers/media/i2c/gc08a3.c b/drivers/media/i2c/gc08a3.c
index 84de5cff958d..938709a677b6 100644
--- a/drivers/media/i2c/gc08a3.c
+++ b/drivers/media/i2c/gc08a3.c
@@ -24,7 +24,6 @@
 
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -1001,13 +1000,7 @@ static const struct v4l2_subdev_pad_ops gc08a3_subdev_pad_ops = {
 	.get_selection = gc08a3_get_selection,
 };
 
-static const struct v4l2_subdev_core_ops gc08a3_core_ops = {
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
-};
-
 static const struct v4l2_subdev_ops gc08a3_subdev_ops = {
-	.core = &gc08a3_core_ops,
 	.video = &gc08a3_video_ops,
 	.pad = &gc08a3_subdev_pad_ops,
 };
@@ -1247,8 +1240,7 @@ static int gc08a3_probe(struct i2c_client *client)
 		goto err_power_off;
 	}
 
-	gc08a3->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			    V4L2_SUBDEV_FL_HAS_EVENTS;
+	gc08a3->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	gc08a3->pad.flags = MEDIA_PAD_FL_SOURCE;
 	gc08a3->sd.dev = &client->dev;
 	gc08a3->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
index 667bb756d056..03d78fbe8634 100644
--- a/drivers/media/i2c/gc2145.c
+++ b/drivers/media/i2c/gc2145.c
@@ -21,7 +21,6 @@
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mediabus.h>
 
@@ -1123,11 +1122,6 @@ static const u8 test_pattern_val[] = {
 	GC2145_TEST_UNIFORM | GC2145_TEST_BLACK,
 };
 
-static const struct v4l2_subdev_core_ops gc2145_core_ops = {
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
-};
-
 static const struct v4l2_subdev_video_ops gc2145_video_ops = {
 	.s_stream = gc2145_set_stream,
 };
@@ -1141,7 +1135,6 @@ static const struct v4l2_subdev_pad_ops gc2145_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops gc2145_subdev_ops = {
-	.core = &gc2145_core_ops,
 	.video = &gc2145_video_ops,
 	.pad = &gc2145_pad_ops,
 };
@@ -1407,8 +1400,7 @@ static int gc2145_probe(struct i2c_client *client)
 		goto error_power_off;
 
 	/* Initialize subdev */
-	gc2145->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			    V4L2_SUBDEV_FL_HAS_EVENTS;
+	gc2145->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	gc2145->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	/* Initialize source pad */
diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e78a80b2bb2e..2d54cea113e1 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -26,7 +26,6 @@
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mediabus.h>
 
@@ -922,11 +921,6 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static const struct v4l2_subdev_core_ops imx219_core_ops = {
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
-};
-
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
 	.s_stream = imx219_set_stream,
 };
@@ -940,7 +934,6 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
-	.core = &imx219_core_ops,
 	.video = &imx219_video_ops,
 	.pad = &imx219_pad_ops,
 };
@@ -1166,8 +1159,7 @@ static int imx219_probe(struct i2c_client *client)
 		goto error_power_off;
 
 	/* Initialize subdev */
-	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			    V4L2_SUBDEV_FL_HAS_EVENTS;
+	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	/* Initialize source pad */
diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 94276f4f2d83..f676faf4b301 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -32,7 +32,6 @@
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mediabus.h>
 
@@ -1284,11 +1283,6 @@ static int imx283_get_selection(struct v4l2_subdev *sd,
 	}
 }
 
-static const struct v4l2_subdev_core_ops imx283_core_ops = {
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
-};
-
 static const struct v4l2_subdev_video_ops imx283_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
@@ -1308,7 +1302,6 @@ static const struct v4l2_subdev_internal_ops imx283_internal_ops = {
 };
 
 static const struct v4l2_subdev_ops imx283_subdev_ops = {
-	.core = &imx283_core_ops,
 	.video = &imx283_video_ops,
 	.pad = &imx283_pad_ops,
 };
@@ -1548,8 +1541,7 @@ static int imx283_probe(struct i2c_client *client)
 		goto error_pm;
 
 	/* Initialize subdev */
-	imx283->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			    V4L2_SUBDEV_FL_HAS_EVENTS;
+	imx283->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	imx283->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	imx283->sd.internal_ops = &imx283_internal_ops;
 
diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 49a5bf9c17da..ee698c99001d 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -24,7 +24,6 @@
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -1210,11 +1209,6 @@ static int imx290_entity_init_state(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static const struct v4l2_subdev_core_ops imx290_core_ops = {
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
-};
-
 static const struct v4l2_subdev_video_ops imx290_video_ops = {
 	.s_stream = imx290_set_stream,
 };
@@ -1228,7 +1222,6 @@ static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops imx290_subdev_ops = {
-	.core = &imx290_core_ops,
 	.video = &imx290_video_ops,
 	.pad = &imx290_pad_ops,
 };
@@ -1262,8 +1255,7 @@ static int imx290_subdev_init(struct imx290 *imx290)
 	pm_runtime_put_autosuspend(imx290->dev);
 
 	imx290->sd.internal_ops = &imx290_internal_ops;
-	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			    V4L2_SUBDEV_FL_HAS_EVENTS;
+	imx290->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	imx290->sd.entity.ops = &imx290_subdev_entity_ops;
 	imx290->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index 2257b6b807ea..159753b13777 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -17,7 +17,6 @@
 
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -489,8 +488,6 @@ static int max96714_log_status(struct v4l2_subdev *sd)
 
 static const struct v4l2_subdev_core_ops max96714_subdev_core_ops = {
 	.log_status = max96714_log_status,
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_video_ops max96714_video_ops = {
@@ -605,8 +602,7 @@ static int max96714_create_subdev(struct max96714_priv *priv)
 		goto err_free_ctrl;
 	}
 
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &max96714_entity_ops;
 
diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 047bad30e263..9259d58ba734 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -17,7 +17,6 @@
 
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -577,8 +576,6 @@ static const struct v4l2_subdev_pad_ops max96717_pad_ops = {
 
 static const struct v4l2_subdev_core_ops max96717_subdev_core_ops = {
 	.log_status = max96717_log_status,
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_internal_ops max96717_internal_ops = {
@@ -692,8 +689,7 @@ static int max96717_subdev_init(struct max96717_priv *priv)
 		goto err_free_ctrl;
 	}
 
-	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &max96717_entity_ops;
 
diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 5606437f37d0..a608cb51ac6e 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -13,7 +13,6 @@
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 
 #define OV01A10_LINK_FREQ_400MHZ	400000000ULL
@@ -804,8 +803,6 @@ static int ov01a10_get_selection(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_core_ops ov01a10_core_ops = {
 	.log_status = v4l2_ctrl_subdev_log_status,
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_video_ops ov01a10_video_ops = {
@@ -892,8 +889,7 @@ static int ov01a10_probe(struct i2c_client *client)
 	}
 
 	ov01a10->sd.state_lock = ov01a10->ctrl_handler.lock;
-	ov01a10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
-		V4L2_SUBDEV_FL_HAS_EVENTS;
+	ov01a10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ov01a10->sd.entity.ops = &ov01a10_subdev_entity_ops;
 	ov01a10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ov01a10->pad.flags = MEDIA_PAD_FL_SOURCE;
diff --git a/drivers/media/i2c/ov64a40.c b/drivers/media/i2c/ov64a40.c
index 541bf74581d2..a5da4fe47e0b 100644
--- a/drivers/media/i2c/ov64a40.c
+++ b/drivers/media/i2c/ov64a40.c
@@ -18,7 +18,6 @@
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
@@ -3200,13 +3199,7 @@ static const struct v4l2_subdev_pad_ops ov64a40_pad_ops = {
 	.get_selection = ov64a40_get_selection,
 };
 
-static const struct v4l2_subdev_core_ops ov64a40_core_ops = {
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
-};
-
 static const struct v4l2_subdev_ops ov64a40_subdev_ops = {
-	.core = &ov64a40_core_ops,
 	.video = &ov64a40_video_ops,
 	.pad = &ov64a40_pad_ops,
 };
@@ -3605,8 +3598,7 @@ static int ov64a40_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	ov64a40->sd.internal_ops = &ov64a40_internal_ops;
-	ov64a40->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE
-			  | V4L2_SUBDEV_FL_HAS_EVENTS;
+	ov64a40->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ov64a40->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	ov64a40->pad.flags = MEDIA_PAD_FL_SOURCE;
diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 174c65f76886..7dcb235d2056 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -24,7 +24,6 @@
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
@@ -1500,13 +1499,7 @@ static const struct v4l2_subdev_pad_ops ov8858_pad_ops = {
 	.set_fmt = ov8858_set_fmt,
 };
 
-static const struct v4l2_subdev_core_ops ov8858_core_ops = {
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
-};
-
 static const struct v4l2_subdev_ops ov8858_subdev_ops = {
-	.core	= &ov8858_core_ops,
 	.video	= &ov8858_video_ops,
 	.pad	= &ov8858_pad_ops,
 };
@@ -1917,7 +1910,7 @@ static int ov8858_probe(struct i2c_client *client)
 		return ret;
 
 	sd = &ov8858->subdev;
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ov8858->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ret = media_entity_pads_init(&sd->entity, 1, &ov8858->pad);
diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index 75225ff5eff6..e2679601a301 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -27,7 +27,6 @@
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -879,8 +878,6 @@ static int thp7312_init_state(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_core_ops thp7312_core_ops = {
 	.log_status = v4l2_ctrl_subdev_log_status,
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_video_ops thp7312_video_ops = {
@@ -2127,7 +2124,7 @@ static int thp7312_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&thp7312->sd, client, &thp7312_subdev_ops);
 	thp7312->sd.internal_ops = &thp7312_internal_ops;
-	thp7312->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	thp7312->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	thp7312->pad.flags = MEDIA_PAD_FL_SOURCE;
 	thp7312->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-- 
2.34.1


