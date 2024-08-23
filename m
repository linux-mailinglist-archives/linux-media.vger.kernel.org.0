Return-Path: <linux-media+bounces-16646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 789B695CA76
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 12:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 959AE1C212AC
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8FB185B7F;
	Fri, 23 Aug 2024 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J1Dx9/G4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6301474D7
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408864; cv=none; b=Smoynq4A5otJH0uTa3twW+1OY0xnpfNzhQ83brJDaabLCiuwtokARZVTm0+qFdDzvek8Gqmgf2bmtvMPpDcixVwXsxZshB2PoeG0bxU3Kpg60GTBJW7hKyCQTT3W/NkY9dXi7jES2fxpBZW3DZggi6I5DkHngbr0xZWcRcN+TU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408864; c=relaxed/simple;
	bh=kIV0F91IXvXUKzpvDFHxNVojmJGwADBZn1C2iDFr0hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bHt8EpxXivK8Ek6x7KqSGtotaOI4TAhObUP2VxG2zmCHSd49P/4YnyrC2wpzG7yH29PYfsfdKNzFe/0tEk4RVnVcecvA3Ce4IFInGiKBMSQIXW2PuW3ptchyE/4Bm1lHR4KA8RPt30H4+YhtyBaP/YXdi9Mj5on91w+ZFmBnW/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J1Dx9/G4; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ef9714673so330596e87.0
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 03:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408861; x=1725013661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsv5X2BcXiIj52Q3nX5m9Zd42JJpX6eUx2njNNBJGRU=;
        b=J1Dx9/G4Vo9+18g3Bpf8FeHy2YGgEIPKpn44Z4okFue3o+uoOSkqyR9X8XGcdhcX+x
         IMZlbNV14rtW7bXdO4UgAq/ZYVFZ/iYF1c2hMXbCaChuNkr51xcg07LB4GstTisl9FGJ
         9B7vVBjBZyFAPlBGhV4u6tK2EtxUYKRhMOX4lE7gQ51EML+q3GggiDTD20A7QlZIVXPr
         mUpSaK9L4S3XcdB5Ju9V0X5WdCWM7KxXxsFu+akQbT7inF66++/tZSoYL+08PskIuPLg
         KlLvpJkfTY+bhMp9ZvhRwnLDu8acAT/AiMqK5eTlysSjdBB6wCY32Eyo2uBESXmjJ7iB
         R5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408861; x=1725013661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsv5X2BcXiIj52Q3nX5m9Zd42JJpX6eUx2njNNBJGRU=;
        b=k87S8OXIb8AWJplavOUMlA/SvluqRqddOI2kz134Qp19Qc+R425vN2W1dN/1nDRvo9
         +hx7wqfZpE0su9RjKtkfZrPNwSpcIXhuHeaFOedGqHIOK3wB3FJ+VQXAm/GRgNz+tV9m
         RXk6DA+hclw3K1lYIH7kEcRSxbtZow1xajdzl2Ss5in2ftRnBZ1iB0GI26AljU+U2O/X
         vPJ5zq0Awbl7/hztTjMmbkPr2f/IRzRMPQ5BvBZDqqxxQAuTWS5v6S6fwS1vdcjDDHe7
         J7cEJSa0JL5HFWeW6wpwIRCAt0vy2gUd5uOFQ4IUs6TOH0MCGmkNn2iBIuFje17eVA+q
         MQdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPdcXj03cJTI2/ji0zxPJWy6PPtDJ0vZiaEfyXbNSgUHcpo8aXEWZ6SafButB/wUdT9ju463A9zwL2gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCSckt15m0PnQGDO+c2sOaC92DX0Z+NyiPvIBxR1M6mWaDUQtz
	Wag9gvW2mSXgSGpHGahbTfe6ALNAJzSv+U3NgByDe5+3qgWmsjxgKhBqdgCveuY=
X-Google-Smtp-Source: AGHT+IH4TL1ZXoDhWNLr+Lh/z+iV+vwHBgCcEZuSIqYsOPCqcsvImsC++yuqxqyQwfIhLByC2nXQNA==
X-Received: by 2002:a05:6512:10c6:b0:52e:fd7c:8b9b with SMTP id 2adb3069b0e04-534387bf0c6mr647460e87.7.1724408860912;
        Fri, 23 Aug 2024 03:27:40 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5d220sm504669e87.183.2024.08.23.03.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:27:40 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 3/6] media: i2c: og01a1b: Add stubs of runtime power management functions
Date: Fri, 23 Aug 2024 13:27:28 +0300
Message-ID: <20240823102731.2240857-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240823102731.2240857-1-vladimir.zapolskiy@linaro.org>
References: <20240823102731.2240857-1-vladimir.zapolskiy@linaro.org>
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


