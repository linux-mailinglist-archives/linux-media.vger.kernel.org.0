Return-Path: <linux-media+bounces-32678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCD5ABA9D9
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66BD93A6E42
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF8C1FAC42;
	Sat, 17 May 2025 11:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZsuyZrXl"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DBB1F8ACA
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482194; cv=none; b=AIVjGzEnY5LYylRi2xfoHa/z4W6ESKgvFAIZtJ17m4GY/ntcSWOQ+mHFqzowhcOgSEEM9JV37Cj1Uxvn7HQon72AdIyWC32I/9jcaHQ9YN8g0NMLEdt6qtn04j9sNsxB2Lg0EN0sGBZqetD2xkhmXauzjsAKROfgWRZB1jAY+GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482194; c=relaxed/simple;
	bh=nrE+A6YpHdLB/ojW1hnKP9m5q2DyFEHJJCsJsNagl54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACEyDcui0KwWuj54amGVACA8GkVaUvpPRWW6mOe/Nu7vrg//GGsp6oVtEMdbd5nDufY+gGRIj3IFaPiYvLOknfIkOqlHoKcyQ9TtMvOLEC8Oj4vUqrP8alNNZMpHZGImT62FMzEtFP3eLhIGYD1S5eFLvtifx5NNzX20ywSS98M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZsuyZrXl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cIRQkJeKHIekyWxU4NudLN4JLLYxEvuNpPcobBt85Rs=;
	b=ZsuyZrXl45lq7HYclXygdbB/8hVK/zMr2GMUZ9JcUmfkyn89w0WOUF2dczRaLHnrIQtQ36
	paGGACtuOGK8AjLSgLoBk8godeh23t7c3FwjZb9Uq94gE3Vf221Xhrt68fyBDcfsqHlzXz
	otXNEGoPceyMbjPn/JFctZnqh7DPgbQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32--7Ij4LttMW29pNus4smhQQ-1; Sat,
 17 May 2025 07:43:07 -0400
X-MC-Unique: -7Ij4LttMW29pNus4smhQQ-1
X-Mimecast-MFC-AGG-ID: -7Ij4LttMW29pNus4smhQQ_1747482186
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A4C661956094;
	Sat, 17 May 2025 11:43:06 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E2D9118003FC;
	Sat, 17 May 2025 11:43:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 20/23] media: atomisp: gc0310: runtime-PM fixes
Date: Sat, 17 May 2025 13:41:03 +0200
Message-ID: <20250517114106.43494-21-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The i2c-client's power-domain has already been powered up when probe()
gets called. So e.g. ACPI resources for regulators and clks have
already been enabled and only the GPIOs need to be set to the on state.

Instead of calling pm_runtime_set_suspended() while the domain is
already powered up and then have detect() do a pm_runtime_get()
to set the GPIOs do the following:

1. Call gc0310_power_on() to only set the GPIOs
2. Set the device's runtime-PM state to active instead of suspended
3. Avoid the device getting suspended as soon as pm_runtime_enable()
   gets called by calling pm_runtime_get() before _enable(), this means
   moving the pm_runtime_get() / _put() from detect() to probe ()

This fixes power_on() not getting called when runtime-PM is not
enabled in the Kconfig and this keeps the sensor powered-up while
registering it avoiding unnecessary power cycles.

Also modify gc0310_remove() to power-off the device if it is in
active state when gc0310_remove() runs.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 56 +++++++++----------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 9532114d6139..152835fa4226 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -431,11 +431,7 @@ static int gc0310_detect(struct gc0310_device *sensor)
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	ret = pm_runtime_get_sync(&client->dev);
-	if (ret >= 0)
-		ret = cci_read(sensor->regmap, GC0310_SC_CMMN_CHIP_ID_REG,
-			       &val, NULL);
-	pm_runtime_put(&client->dev);
+	ret = cci_read(sensor->regmap, GC0310_SC_CMMN_CHIP_ID_REG, &val, NULL);
 	if (ret < 0) {
 		dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
 		return -ENODEV;
@@ -672,6 +668,10 @@ static void gc0310_remove(struct i2c_client *client)
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		gc0310_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 }
 
 static int gc0310_check_hwcfg(struct device *dev)
@@ -759,16 +759,15 @@ static int gc0310_probe(struct i2c_client *client)
 	if (IS_ERR(sensor->regmap))
 		return PTR_ERR(sensor->regmap);
 
-	pm_runtime_set_suspended(&client->dev);
+	gc0310_power_on(&client->dev);
+
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_get_noresume(&client->dev);
 	pm_runtime_enable(&client->dev);
-	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
-	pm_runtime_use_autosuspend(&client->dev);
 
 	ret = gc0310_detect(sensor);
-	if (ret) {
-		gc0310_remove(client);
-		return ret;
-	}
+	if (ret)
+		goto err_powerdown;
 
 	sensor->sd.internal_ops = &gc0310_internal_ops;
 	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
@@ -776,31 +775,32 @@ static int gc0310_probe(struct i2c_client *client)
 	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	ret = gc0310_init_controls(sensor);
-	if (ret) {
-		gc0310_remove(client);
-		return ret;
-	}
+	if (ret)
+		goto err_powerdown;
 
 	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
-	if (ret) {
-		gc0310_remove(client);
-		return ret;
-	}
+	if (ret)
+		goto err_powerdown;
 
 	sensor->sd.state_lock = sensor->ctrls.handler.lock;
 	ret = v4l2_subdev_init_finalize(&sensor->sd);
-	if (ret) {
-		gc0310_remove(client);
-		return ret;
-	}
+	if (ret)
+		goto err_powerdown;
 
 	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
-	if (ret) {
-		gc0310_remove(client);
-		return ret;
-	}
+	if (ret)
+		goto err_powerdown;
+
+	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
+	pm_runtime_use_autosuspend(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return 0;
+
+err_powerdown:
+	pm_runtime_put_noidle(&client->dev);
+	gc0310_remove(client);
+	return ret;
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(gc0310_pm_ops, gc0310_power_off,
-- 
2.49.0


