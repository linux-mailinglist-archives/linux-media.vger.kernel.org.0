Return-Path: <linux-media+bounces-28168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09854A5FFD4
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B62F27A68E6
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1941C1F03C2;
	Thu, 13 Mar 2025 18:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g0GiKz8F"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD641DB54C
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891454; cv=none; b=BU9prS9ItCF31wb5VD/bUcqaWt6vpKuZcuoRUlKoo29kOOgAE3t5It/h9fR3Gl49yvKk4zi1oldydgnWlfGbvp9qYVTRlqFWjjj2wstP0zHxAFRJ3PtdvMrBmBqC3vdy9pkgHNNpalws3uq+QD329G/1V9hw4IDTkzZrtdKeaKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891454; c=relaxed/simple;
	bh=Uk+so7eUmtvz2WjCluFzkpSqCe9MlbDfJkFZeJrws+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKSPb/WhEL8RZZu8tkeJ6RFnuZO1NDFFO32xjPnacwYwftGhkDYPmSnGqU8ky/Gq/gNMscnm0Pcn4CUdFKS/OM5WWi0oNzVUpfvey7ftc9E3CAiXFOP58mYRqlmZKrZmOkp7SMQkrSOtmPf3hhaVPZa8LoCGwgcWB75upf82SOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g0GiKz8F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtnIs3r612IqfdsvGw8jSjrKvvgCjuMzj6IFiqbJk7Y=;
	b=g0GiKz8F7Yf+qQ3n+lF8Ib4kCue9I7qI9zn3aXsXYaxqPSvZoFsYO3QB1ehicQ9WkhH5g0
	MwuWM0MNPRWvn1MOaXLe9b0XzO0Ml0+Dzqf1o//P4mbGC0yLR5KFvXSXVyPIAqSJ9mYOUu
	bnJjVXxrvN8qL4YTkACxvMI7UopL/KI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-255-rDgfnX4HPvaAkkEXWUhB3g-1; Thu,
 13 Mar 2025 14:44:05 -0400
X-MC-Unique: rDgfnX4HPvaAkkEXWUhB3g-1
X-Mimecast-MFC-AGG-ID: rDgfnX4HPvaAkkEXWUhB3g_1741891444
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D47F1800349;
	Thu, 13 Mar 2025 18:44:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4B5B4300376F;
	Thu, 13 Mar 2025 18:44:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Ingvar Hagelund <ingvar@redpill-linpro.com>,
	Joachim Reichel <joachim.reichel@posteo.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hao Yao <hao.yao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v8 13/14] media: ov02c10: Switch to using the sub-device state lock
Date: Thu, 13 Mar 2025 19:43:13 +0100
Message-ID: <20250313184314.91410-14-hdegoede@redhat.com>
In-Reply-To: <20250313184314.91410-1-hdegoede@redhat.com>
References: <20250313184314.91410-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

While at it also properly setup runtime-pm before registering
the subdev.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 51 +++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 09e70ffcf07a..c559a69140ec 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -2,7 +2,6 @@
 // Copyright (c) 2022 Intel Corporation.
 
 #include <linux/acpi.h>
-#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -387,9 +386,6 @@ struct ov02c10 {
 	/* Current mode */
 	const struct ov02c10_mode *cur_mode;
 
-	/* To serialize asynchronous callbacks */
-	struct mutex mutex;
-
 	/* MIPI lane info */
 	u32 link_freq_index;
 	u8 mipi_lanes;
@@ -490,7 +486,6 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 	if (ret)
 		return ret;
 
-	ctrl_hdlr->lock = &ov02c10->mutex;
 	cur_mode = ov02c10->cur_mode;
 
 	ov02c10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
@@ -608,8 +603,6 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 	int ret;
 
-	guard(mutex)(&ov02c10->mutex);
-
 	ret = pm_runtime_resume_and_get(&client->dev);
 	if (ret)
 		return ret;
@@ -628,8 +621,6 @@ static int ov02c10_disable_streams(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
-	guard(mutex)(&ov02c10->mutex);
-
 	ov02c10_stop_streaming(ov02c10);
 	pm_runtime_put(&client->dev);
 
@@ -718,7 +709,6 @@ static int ov02c10_set_format(struct v4l2_subdev *sd,
 				      height, fmt->format.width,
 				      fmt->format.height);
 
-	mutex_lock(&ov02c10->mutex);
 	ov02c10_update_pad_format(mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
@@ -736,7 +726,6 @@ static int ov02c10_set_format(struct v4l2_subdev *sd,
 		__v4l2_ctrl_modify_range(ov02c10->hblank, h_blank, h_blank, 1,
 					 h_blank);
 	}
-	mutex_unlock(&ov02c10->mutex);
 
 	return 0;
 }
@@ -747,14 +736,11 @@ static int ov02c10_get_format(struct v4l2_subdev *sd,
 {
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
-	mutex_lock(&ov02c10->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 		fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
 	else
 		ov02c10_update_pad_format(ov02c10->cur_mode, &fmt->format);
 
-	mutex_unlock(&ov02c10->mutex);
-
 	return 0;
 }
 
@@ -909,13 +895,16 @@ static int ov02c10_check_hwcfg(struct device *dev, struct ov02c10 *ov02c10)
 static void ov02c10_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(&client->dev);
-	mutex_destroy(&ov02c10->mutex);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		ov02c10_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 }
 
 static int ov02c10_probe(struct i2c_client *client)
@@ -951,10 +940,9 @@ static int ov02c10_probe(struct i2c_client *client)
 	ret = ov02c10_identify_module(ov02c10);
 	if (ret) {
 		dev_err(&client->dev, "failed to find sensor: %d", ret);
-		goto probe_error_ret;
+		goto probe_error_power_off;
 	}
 
-	mutex_init(&ov02c10->mutex);
 	ov02c10->cur_mode = &supported_modes[0];
 
 	ret = ov02c10_init_controls(ov02c10);
@@ -974,31 +962,38 @@ static int ov02c10_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
+	ov02c10->sd.state_lock = ov02c10->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&ov02c10->sd);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to init subdev: %d", ret);
+		goto probe_error_media_entity_cleanup;
+	}
+
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(&client->dev);
+
 	ret = v4l2_async_register_subdev_sensor(&ov02c10->sd);
 	if (ret < 0) {
 		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
 			ret);
-		goto probe_error_media_entity_cleanup;
+		goto probe_error_v4l2_subdev_cleanup;
 	}
 
-	/*
-	 * Device is already turned on by i2c-core with ACPI domain PM.
-	 * Enable runtime PM and turn off the device.
-	 */
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
-
 	return 0;
 
+probe_error_v4l2_subdev_cleanup:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+	v4l2_subdev_cleanup(&ov02c10->sd);
+
 probe_error_media_entity_cleanup:
 	media_entity_cleanup(&ov02c10->sd.entity);
 
 probe_error_v4l2_ctrl_handler_free:
 	v4l2_ctrl_handler_free(ov02c10->sd.ctrl_handler);
-	mutex_destroy(&ov02c10->mutex);
 
-probe_error_ret:
+probe_error_power_off:
 	ov02c10_power_off(&client->dev);
 
 	return ret;
-- 
2.48.1


