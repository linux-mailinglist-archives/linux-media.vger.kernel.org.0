Return-Path: <linux-media+bounces-16186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F2495024F
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18A9E281CB3
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 10:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0863D19412F;
	Tue, 13 Aug 2024 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SwgGkj5p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15A7208AD
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723544448; cv=none; b=PSA1KjNYh/ImNhpykI5vaKNB1whZzcMkZRNKkiH3975mg4bCtYLpedKXv9pbefBcelFg50qc+ZitB7Wu+VbkE3mzi/R0/16l8gzncxMJQiCZaFAMdK0YNPQaio0ryvk5cqbVqqLYus/G94/TY8VbD3guaqRijif6sH+EkSAZhL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723544448; c=relaxed/simple;
	bh=kIV0F91IXvXUKzpvDFHxNVojmJGwADBZn1C2iDFr0hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t2z1Xuuj9/isL4lZ+QM5AiUDIjKffSxX8Dg+YevoLn0kjH727STx1ng6azA622zRfD5QT1QE3ucTZNXDCivzHsKvATavb5NYydnicVLTIvSt9xqq6TH41HSlMESXHwYJvNjPARe/ZX4+Bk8mYINH+MqZ6t6wOsffiZ3+Bbokm6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SwgGkj5p; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-530ad984f2dso496366e87.1
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 03:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723544445; x=1724149245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsv5X2BcXiIj52Q3nX5m9Zd42JJpX6eUx2njNNBJGRU=;
        b=SwgGkj5pr7YajKV9SOtf58rhBh0PtEzPBfJzdQ3v3Ld/vmUFK5QyXOILGzP9YEO6y4
         P8q2MbMTIWVrTuFWogUO7C6R0xuAiRC6l0H1ipP9Y2aES560qYS0LvU0NhrZAVp7C6GC
         7FpHd10AQ98daGiwI/696w7RULYOVgjfkcfgLvoMbOw2WS+iyl7wp0a/ktMz+4MV9atH
         Ry6j1ReBCmRpxyQ1VNosW1+9FzAINq1f4ckZ8TqGym6QgyFHtdHjvvcJ46yQfiwcrnkh
         DuGfV+Py7wq0ycJxaGzdWZGkRAq3ijJgAzckYulKIZgFr+ywfrGlXGLdrpnxDN+1Hje7
         8kFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723544445; x=1724149245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsv5X2BcXiIj52Q3nX5m9Zd42JJpX6eUx2njNNBJGRU=;
        b=WKH/LoF5WBX/Q9U5DFC0YmVuzGIjJW/M4R26EVCxSki0kJXM/nETkiZZ7AA3GsRtFr
         sYa7CpRPxYDsTcP2/iV3N5Juz55x3pul26oH7/VDtYBYcOXNinSb+//kpGBNgTyR6UfP
         m01J2qFh0dNji+ce2wW4A6HXQD5SGizqE2yR8nDYg53hMO0hhr9y9USXta5Xif8Bti6v
         LpnfPEO9ojcOLRCOBTDaccmSJb5J2URlSRWvR0D4vyq5fppEMlxA91RY3Kf9oWl3PgAV
         JIWW44neXVWzpUEu29VfxqpTa4Sg+QJ/1kqxLxeS8ldcZZTX5PSsmpGt/kFYUarenYxl
         8TlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHiV5TcLbRFRufr1cyh0Rh77AgLoQcaeGSe44e9VfCEvU/UDCFmXDO3vovkoLTOXvyM2dzo3TR5ytN1jxfZc581it6354xV74BYnw=
X-Gm-Message-State: AOJu0YyoCoDRFoMRmj1qjd9nH1X9wo+o0DeLee05sErrmRpmyuh7bDrS
	QEkwagjFltIf6XDtq9OiUSEfdzrXOHTYuQcWTQeSRCoaq+QVNIEYBjv1rA5F4vU=
X-Google-Smtp-Source: AGHT+IGNyXNcWaYVf0rGafFn/puOzTSkTz9BwDiy0iJXuA6J/c7TqdQjttIrcFPbgWoWX7Ii83xHCw==
X-Received: by 2002:a05:6512:3a93:b0:530:e0fd:4a85 with SMTP id 2adb3069b0e04-5321501af69mr747431e87.4.1723544444558;
        Tue, 13 Aug 2024 03:20:44 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200eb3ca5sm965917e87.55.2024.08.13.03.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 03:20:44 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/6] media: i2c: og01a1b: Add stubs of runtime power management functions
Date: Tue, 13 Aug 2024 13:20:32 +0300
Message-ID: <20240813102035.1763559-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813102035.1763559-1-vladimir.zapolskiy@linaro.org>
References: <20240813102035.1763559-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rearrange initializations and checks in probe before population of
the power management functions.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 42 +++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 9e756c1c47df..d993ef4bad46 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -967,6 +967,19 @@ static int og01a1b_check_hwcfg(struct device *dev)
 	return ret;
 }
 
+/* Power/clock management functions */
+static int og01a1b_power_on(struct device *dev)
+{
+	/* Device is already turned on by i2c-core with ACPI domain PM. */
+
+	return 0;
+}
+
+static int og01a1b_power_off(struct device *dev)
+{
+	return 0;
+}
+
 static void og01a1b_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
@@ -984,6 +997,12 @@ static int og01a1b_probe(struct i2c_client *client)
 	struct og01a1b *og01a1b;
 	int ret;
 
+	og01a1b = devm_kzalloc(&client->dev, sizeof(*og01a1b), GFP_KERNEL);
+	if (!og01a1b)
+		return -ENOMEM;
+
+	v4l2_i2c_subdev_init(&og01a1b->sd, client, &og01a1b_subdev_ops);
+
 	ret = og01a1b_check_hwcfg(&client->dev);
 	if (ret) {
 		dev_err(&client->dev, "failed to check HW configuration: %d",
@@ -991,15 +1010,15 @@ static int og01a1b_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	og01a1b = devm_kzalloc(&client->dev, sizeof(*og01a1b), GFP_KERNEL);
-	if (!og01a1b)
-		return -ENOMEM;
+	/* The sensor must be powered on to read the CHIP_ID register */
+	ret = og01a1b_power_on(&client->dev);
+	if (ret)
+		return ret;
 
-	v4l2_i2c_subdev_init(&og01a1b->sd, client, &og01a1b_subdev_ops);
 	ret = og01a1b_identify_module(og01a1b);
 	if (ret) {
 		dev_err(&client->dev, "failed to find sensor: %d", ret);
-		return ret;
+		goto power_off;
 	}
 
 	mutex_init(&og01a1b->mutex);
@@ -1028,10 +1047,7 @@ static int og01a1b_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup;
 	}
 
-	/*
-	 * Device is already turned on by i2c-core with ACPI domain PM.
-	 * Enable runtime PM and turn off the device.
-	 */
+	/* Enable runtime PM and turn off the device */
 	pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
@@ -1045,9 +1061,16 @@ static int og01a1b_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(og01a1b->sd.ctrl_handler);
 	mutex_destroy(&og01a1b->mutex);
 
+power_off:
+	og01a1b_power_off(&client->dev);
+
 	return ret;
 }
 
+static const struct dev_pm_ops og01a1b_pm_ops = {
+	SET_RUNTIME_PM_OPS(og01a1b_power_off, og01a1b_power_on, NULL)
+};
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id og01a1b_acpi_ids[] = {
 	{"OVTI01AC"},
@@ -1066,6 +1089,7 @@ MODULE_DEVICE_TABLE(of, og01a1b_of_match);
 static struct i2c_driver og01a1b_i2c_driver = {
 	.driver = {
 		.name = "og01a1b",
+		.pm = &og01a1b_pm_ops,
 		.acpi_match_table = ACPI_PTR(og01a1b_acpi_ids),
 		.of_match_table = og01a1b_of_match,
 	},
-- 
2.45.2


