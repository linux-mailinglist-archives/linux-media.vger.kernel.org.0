Return-Path: <linux-media+bounces-20544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A49C9B561E
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 23:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 993C2281D8F
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 22:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF3B1EE021;
	Tue, 29 Oct 2024 22:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4OAqGxU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0D120B1E0;
	Tue, 29 Oct 2024 22:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730242604; cv=none; b=R71Bqd1mbzFqx/DkAwjJamQmaWF7OG5No0MSB70N9DXMPxUM0beqCG70LbaCDjLEUlNSoVe85KBcfMS1h2h+IQodh4+i3AYbu9cdnLEZVSneU4EzsUfgFm8DbumiUQbAkfMVWH5tORmheZJlzrSX/YzlcGUE9DsZs63vKwNRR0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730242604; c=relaxed/simple;
	bh=holUwdZfjY4UeX6D5df8ESCw5JgliwDXxFm9n4+96vM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BVYIoenL274bxfF+f4OaRWxG1lyR4SUM6EPTaBgRp4qNnNL6J8e1kqAFYoEXf2tmZUu4vVezcFBweCbYxlebyAmQvwu9JYvUoFfGSrMgrRokutlhleR1En9pXywYKGzdu9AQnPG8jApJjPUzhgMyI6GIiLDAWwAGUe7kt7l0mdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4OAqGxU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so4367619f8f.3;
        Tue, 29 Oct 2024 15:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730242598; x=1730847398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds5hmSlvds8wfamXPO6PwtiXp1C+nr7XDpMTSfQKTmg=;
        b=Z4OAqGxU3uXLr3ZwkTtxEp0jgO79+sTgiwgkXyXkvsyiIab7joRsBBKtP7M1ePKjsd
         CeQiOn9DTlVoBFEVSfkCrgcVLvezWiSi75nlKe7kJ3LLuMpR2Fb8H4xQRLzFl1toWMzs
         8iC0aRqcOWxAsz0BeoybxCqLDAhgVWetcF+xM/qPE6zHEbivvs013MONs3RlPcXUC+qT
         Kr/VXHoRZ97kgOrggboLZ6abcu2HPtnFmatyttVyHTlIQQJnAkm9YVGUWg23Fm9ugJOA
         bbz/FzPwvme/vYy7VVuisOxsoZr4VPNeKZ8Wgbw6wdQvRrlb9Exyz5zkO7eT55JE8hGF
         E6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730242598; x=1730847398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ds5hmSlvds8wfamXPO6PwtiXp1C+nr7XDpMTSfQKTmg=;
        b=LGrNz1EBsnZAb0KraiAlsbWbSK6o/QdsEH8jt1X8qRyFKUkawWCEoU/A+RffblzbLC
         tCbfGloHgZ+vnJnBHsA9S0UAzNxlsqcsQDmWuUOeOtyt7dqjCqgttLeIrOJixg41UiHG
         mMyX8E90tI2hWtwcVwuaRHQF4kFe9I2illnyCeLZWWS3YemNZXdIl3yg4EYCTyvsGaxu
         HvonZR8I60XUDEZU5/wv6P9wn3uVgQl/8Z9IlX3P4WObIuF79RbLFfwGFT0e4l1XaQm7
         kOMXUnBg9Ri+qHPMLwoEJd8rvUl53Gc5ZOysS6rNXA80aKz0dR4cOKWL2bqOWTRQ1uJi
         lDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFCokqAT1B5HvY820mdm9vthDT0mzT4tS1kDPvGC6AirDbnFDlTbEW677pZ7/G17bD+U8RNhrpyVedP84=@vger.kernel.org, AJvYcCX+NjHHVS9W/CFScQjEqkElekadHQcALMVzNyeAtDD65aYrCM8/QUHeGSLe6PjPAzStoh6/66MVAVepgI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxppuR9TFGGKzKVAyMnxJWzeecOuToRScAnuzr1n8NZyAjmCK6B
	s7i/qxMnna9gyZEg5blAT+xPeZDo8tHGHE3G54QBVEPL77Qi6o27
X-Google-Smtp-Source: AGHT+IF4puEuMDDsokzEUVdG4PM6oFdsw2JMN64KahrIvvDwf7Q9cssQQgjb+zoD2Rs1A0FCgw6hCA==
X-Received: by 2002:adf:cb0c:0:b0:37d:4ebe:1650 with SMTP id ffacd0b85a97d-38061200b50mr8853110f8f.46.1730242598216;
        Tue, 29 Oct 2024 15:56:38 -0700 (PDT)
Received: from tom-desktop.station (net-188-217-53-167.cust.vodafonedsl.it. [188.217.53.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca704sm2737165e9.41.2024.10.29.15.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 15:56:37 -0700 (PDT)
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
Subject: [PATCH v2 1/2] media: i2c: Drop HAS_EVENTS and event handlers
Date: Tue, 29 Oct 2024 23:56:30 +0100
Message-Id: <20241029225632.3019083-2-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029225632.3019083-1-tomm.merciai@gmail.com>
References: <20241029225632.3019083-1-tomm.merciai@gmail.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:
 - Rebased tree to avoid fuzz on alvium-csi2.c drv as suggested by SAilus
 - Fixed commit msg as suggested by LPinchart

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
index 5ddfd3dcb188..05b708bd0a64 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -16,7 +16,6 @@
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
-#include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -2240,8 +2239,6 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
 
 static const struct v4l2_subdev_core_ops alvium_core_ops = {
 	.log_status = v4l2_ctrl_subdev_log_status,
-	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
-	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_video_ops alvium_video_ops = {
@@ -2289,7 +2286,7 @@ static int alvium_subdev_init(struct alvium_dev *alvium)
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


