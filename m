Return-Path: <linux-media+bounces-57896-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGouBb1izWmMcwYAu9opvQ
	(envelope-from <linux-media+bounces-57896-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 20:23:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C05837F3BE
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 20:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9535C3088EA9
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 18:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56EE3242D7;
	Wed,  1 Apr 2026 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c02290qF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E9831F9B0
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 18:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775067430; cv=none; b=K2XAIyiaJp6/FTga1kJPvvnK+G7RYUQDIbPOnceShpyTmpciwM4wh6Tgf+aeg4We1xyZSyEJb0qn80a2oc7YZiqL3AqQOPBwzBFJXfS8FfGzjtNpACeai1B+/RrbOaZp76Jb83lyfWCn4L8WnrAEnXmjlou4fcGfLOHDGfxNmG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775067430; c=relaxed/simple;
	bh=N/EZlwfTVAXMZYR5+Cbo+7F19oN0R7nVr7sjA/fVH28=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NXMwaaRovapXj0cCFHC6f/hDcHzy3nSf3U7C7LQudh1JNE6Qjq+siT9GfjKCp5yleFoGjgs80m5YI4EVLX7OQS/G85rD5eJukPcIqwqn+aho5OiHM5l0ExH1dMfk5MHjfsdCCuG+Kp7lUJ7NMa1mvXi9xR/0i0or9Ny+IYISwrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c02290qF; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82cf96ca071so28557b3a.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 11:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775067428; x=1775672228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAnrp5sLZFK9z49ZYni0sXiNyaOFM3jLPCzXU4u6bHg=;
        b=c02290qFo91/X4aXoah+xoOTxcIxGx+cDuMxt3bIziQJsG7I14rFSa3Qsw+8jXKx68
         k3sKmVhIgyRDxBTWKWTQ+IAt7aIlbwtAn5qWMSZIQgQMdu+yfeTbWvcIue6GKcYN9tzJ
         E48XnCb8z/xMHnhe078UNsP0rUfvVsJZYTyBp5geLAgFN5eGKmk3Ei2mA+fekSNempUf
         TS83xp43Jo0UfOozn18hDGNFlUspC9gqTVXB85ZVdQoz++AJ8N3j5Wsu3sSNmgVmix47
         RZl3X5dSLcyRC1WIJRI4jfZCoH+X9vRlbuMm2f0RW6ejvQSOKWGIxXmWyQKe2icVGizd
         0kfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775067428; x=1775672228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BAnrp5sLZFK9z49ZYni0sXiNyaOFM3jLPCzXU4u6bHg=;
        b=e3EH71RD82Z3Gpu+wLyVFRXEHVOxwpmC6mBSSo1kwZ9In1mGuUNYWTX43G4w6rycVV
         DNPXNaVQUVLWCdbLMCnbQRIrKz6Kxs/CPfN0VnnzVzRZePgyTsYIk8dzvSlyaeY+HA06
         45MU30tJi26OciJXQxUZRFuSnRUeZ0HY2AsC+/uSqA8Q8LDBQtE/y68FOaZt/ne9zr0f
         EqekUCRV0fS57vt4JAWUPmR+KQs+QhUyx26UYz9xwXBLp25ke4YtvGJy1mI0kZwVDqB1
         Oy7q/cHu/d8fHWDAfofoIy4LsWrfhSbEfGUIzX6W2+IX4mWo61bhez4lNqruoLToihSb
         DzCA==
X-Forwarded-Encrypted: i=1; AJvYcCXygn43vB/yYM4sgiNJoxCQMk5SpOiBkw1Vwir9snYEHeFJd93V94jldm0I31WtKREjK5NHkDewNhFY7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAp3qj6KvPBsKO+0suqYUAjxOO9fxD5/IGn9rJ68vCsKy/9Q4I
	1CFp/nPCixjHW7I/OYQGNkJ2Js5Knn2/JGegdO9ZgWklFcYRxY81dDJ4
X-Gm-Gg: ATEYQzxxmBkWjIi/1p75PMlS/o8VLpxu0bES895iSAgAqLhlktnV9OaDEFXxzewVQW/
	0BoTQfWsGmuwSjaiQHMMOU75zcEz7g2PCsrQeP9YG1ZUWj8yIA5VE+7m7Rwpr/386BHoXKDBMBV
	yqMbXosfLVd3CEXoO350hdaQ6986PzleFGMwzTIsy02Y3dPCrngljwr2ZYYriyZs1DC6lJgl2L2
	Wav84zVRs9VRXpwfYzz0Qf5c8tdnO+3Phynty2paTJiickORsiQ1D8c0tmh/MXDs+0g4IpzQTWy
	bUOaELqaUK9JIfVgOqhg8jZMbm7CoJN+l9cYifJdxIrxVxcnNOllIrUnMWsn4af8IT2zqEk7wi8
	crGlni+L8pWOJtqoSxZVKYwD5asv80V8ik6vPbsjwKWVh6Q4wKodT6RwsFgpMI4QVutkc4O71b+
	YZ4L2X75Q8mKL7S3/u0mNZ3QJIdYiTpWXtlliXG9DIY0hwg0k5
X-Received: by 2002:a05:6a00:2395:b0:82c:a048:30da with SMTP id d2e1a72fcca58-82ce88ea317mr4687167b3a.8.1775067428037;
        Wed, 01 Apr 2026 11:17:08 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca14b3sm666249b3a.54.2026.04.01.11.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:17:07 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: i2c: gc0310: use cached client and device pointers
Date: Wed,  1 Apr 2026 23:46:56 +0530
Message-Id: <20260401181657.654055-3-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260401181657.654055-1-sanjayembedded@gmail.com>
References: <20260401181657.654055-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-57896-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C05837F3BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

The driver was repeatedly retrieving the i2c_client using
v4l2_get_subdevdata() only to access the underlying struct device.

Replace this with the cached sensor->client and sensor->dev pointers,
which are already available in the sensor structure.

This simplifies the code, avoids redundant subdev lookups, and makes
the driver more consistent with common V4L2 sensor driver patterns.
No functional change intended.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/media/i2c/gc0310.c | 72 ++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
index 72a82ad4118a..e538479fee2e 100644
--- a/drivers/media/i2c/gc0310.c
+++ b/drivers/media/i2c/gc0310.c
@@ -84,6 +84,9 @@
 #define to_gc0310_sensor(x) container_of(x, struct gc0310_device, sd)
 
 struct gc0310_device {
+	struct device *dev;
+	struct i2c_client *client;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -409,28 +412,27 @@ static int gc0310_power_on(struct device *dev)
 
 static int gc0310_detect(struct gc0310_device *sensor)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	u64 val;
 	int ret;
 
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+	if (!i2c_check_functionality(sensor->client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
 	ret = cci_read(sensor->regmap, GC0310_SC_CMMN_CHIP_ID_REG, &val, NULL);
 	if (ret < 0) {
-		dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
+		dev_err(sensor->dev, "read sensor_id failed: %d\n", ret);
 		return -ENODEV;
 	}
 
-	dev_dbg(&client->dev, "sensor ID = 0x%llx\n", val);
+	dev_dbg(sensor->dev, "sensor ID = 0x%llx\n", val);
 
 	if (val != GC0310_ID) {
-		dev_err(&client->dev, "sensor ID error, read id = 0x%llx, target id = 0x%x\n",
+		dev_err(sensor->dev, "sensor ID error, read id = 0x%llx, target id = 0x%x\n",
 			val, GC0310_ID);
 		return -ENODEV;
 	}
 
-	dev_dbg(&client->dev, "detect gc0310 success\n");
+	dev_dbg(sensor->dev, "detect gc0310 success\n");
 
 	return 0;
 }
@@ -440,10 +442,9 @@ static int gc0310_enable_streams(struct v4l2_subdev *sd,
 				 u32 pad, u64 streams_mask)
 {
 	struct gc0310_device *sensor = to_gc0310_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
 
-	ret = pm_runtime_resume_and_get(&client->dev);
+	ret = pm_runtime_resume_and_get(sensor->dev);
 	if (ret)
 		return ret;
 
@@ -474,7 +475,7 @@ static int gc0310_enable_streams(struct v4l2_subdev *sd,
 
 error_power_down:
 	if (ret)
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(sensor->dev);
 
 	return ret;
 }
@@ -484,7 +485,6 @@ static int gc0310_disable_streams(struct v4l2_subdev *sd,
 				  u32 pad, u64 streams_mask)
 {
 	struct gc0310_device *sensor = to_gc0310_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
 	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
@@ -494,7 +494,7 @@ static int gc0310_disable_streams(struct v4l2_subdev *sd,
 	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
 		  GC0310_REGISTER_PAGE_0, &ret);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(sensor->dev);
 	return ret;
 }
 
@@ -559,7 +559,6 @@ static const struct v4l2_subdev_internal_ops gc0310_internal_ops = {
 
 static int gc0310_init_controls(struct gc0310_device *sensor)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	struct v4l2_ctrl_handler *hdl = &sensor->ctrls.handler;
 	struct v4l2_fwnode_device_properties props;
 	int exp_max, ret;
@@ -597,7 +596,7 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
 				  GC0310_H_BLANK_DEFAULT, 1,
 				  GC0310_H_BLANK_DEFAULT);
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
 	if (ret)
 		return ret;
 
@@ -621,10 +620,10 @@ static void gc0310_remove(struct i2c_client *client)
 	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
-	pm_runtime_disable(&client->dev);
-	if (!pm_runtime_status_suspended(&client->dev)) {
-		gc0310_power_off(&client->dev);
-		pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(sensor->dev);
+	if (!pm_runtime_status_suspended(sensor->dev)) {
+		gc0310_power_off(sensor->dev);
+		pm_runtime_set_suspended(sensor->dev);
 	}
 }
 
@@ -695,15 +694,18 @@ static int gc0310_probe(struct i2c_client *client)
 	if (!sensor)
 		return -ENOMEM;
 
-	sensor->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
+	sensor->client = client;
+	sensor->dev = &client->dev;
+
+	sensor->reset = devm_gpiod_get(sensor->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(sensor->reset)) {
-		return dev_err_probe(&client->dev, PTR_ERR(sensor->reset),
+		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
 				     "getting reset GPIO\n");
 	}
 
-	sensor->powerdown = devm_gpiod_get(&client->dev, "powerdown", GPIOD_OUT_HIGH);
+	sensor->powerdown = devm_gpiod_get(sensor->dev, "powerdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(sensor->powerdown)) {
-		return dev_err_probe(&client->dev, PTR_ERR(sensor->powerdown),
+		return dev_err_probe(sensor->dev, PTR_ERR(sensor->powerdown),
 				     "getting powerdown GPIO\n");
 	}
 
@@ -713,11 +715,11 @@ static int gc0310_probe(struct i2c_client *client)
 	if (IS_ERR(sensor->regmap))
 		return PTR_ERR(sensor->regmap);
 
-	gc0310_power_on(&client->dev);
+	gc0310_power_on(sensor->dev);
 
-	pm_runtime_set_active(&client->dev);
-	pm_runtime_get_noresume(&client->dev);
-	pm_runtime_enable(&client->dev);
+	pm_runtime_set_active(sensor->dev);
+	pm_runtime_get_noresume(sensor->dev);
+	pm_runtime_enable(sensor->dev);
 
 	ret = gc0310_detect(sensor);
 	if (ret)
@@ -734,34 +736,34 @@ static int gc0310_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
 	if (ret) {
-		dev_err_probe(&client->dev, ret, "failed to init entity pads\n");
+		dev_err_probe(sensor->dev, ret, "failed to init entity pads\n");
 		goto error_handler_free;
 	}
 
 	sensor->sd.state_lock = sensor->ctrls.handler.lock;
 	ret = v4l2_subdev_init_finalize(&sensor->sd);
 	if (ret) {
-		dev_err_probe(&client->dev, ret, "subdev init error\n");
+		dev_err_probe(sensor->dev, ret, "subdev init error\n");
 		goto error_media_entity;
 	}
 
 	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
 	if (ret) {
-		dev_err_probe(&client->dev, ret,
+		dev_err_probe(sensor->dev, ret,
 			      "failed to register gc0310 sub-device\n");
 		goto error_subdev_cleanup;
 	}
 
-	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
-	pm_runtime_use_autosuspend(&client->dev);
-	pm_runtime_put_autosuspend(&client->dev);
+	pm_runtime_set_autosuspend_delay(sensor->dev, 1000);
+	pm_runtime_use_autosuspend(sensor->dev);
+	pm_runtime_put_autosuspend(sensor->dev);
 
 	return 0;
 
 error_subdev_cleanup:
 	v4l2_subdev_cleanup(&sensor->sd);
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_disable(sensor->dev);
+	pm_runtime_set_suspended(sensor->dev);
 
 error_media_entity:
 	media_entity_cleanup(&sensor->sd.entity);
@@ -770,8 +772,8 @@ static int gc0310_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
 
 error_power_off:
-	pm_runtime_put_noidle(&client->dev);
-	gc0310_power_off(&client->dev);
+	pm_runtime_put_noidle(sensor->dev);
+	gc0310_power_off(sensor->dev);
 
 	return ret;
 }
-- 
2.34.1


