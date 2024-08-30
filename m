Return-Path: <linux-media+bounces-17202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ACD9657B1
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC90AB2244D
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D907B1531D9;
	Fri, 30 Aug 2024 06:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F7cSB899"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9621531D5
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724999709; cv=none; b=j5P9THOUIXZFYwstLFKrTBV0ocwwDY0KCXrg9ySuSrJZjmxziBYD2mA0FtxrERZ5l+XWEd7MpIv+FmStwGK2eqxSf4hBEkSLTkYlZeJ1XsyuEIQms8Wdp4PNhvgwSNLVcOwq/NABhrUxQpulGilGGE2jicMR7qWGIBx+XXoioYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724999709; c=relaxed/simple;
	bh=kIV0F91IXvXUKzpvDFHxNVojmJGwADBZn1C2iDFr0hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saWYIaRkWi0CZGV6TTY8ubYxZGU2GnTZC2d8g0apXWmiJykySqoMndSYzK46bgO3+9YFitFF3xqbAz+VUDRurV2l5DriR6cCFTqt9K04n5Hg8v5nlyMvRgVLxKZxi3Fft9YYoTowzqxw7qJ7IIcrx1ohce7pFZaoMxse3ihyOKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F7cSB899; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f3f99ccb76so968491fa.0
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 23:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724999705; x=1725604505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsv5X2BcXiIj52Q3nX5m9Zd42JJpX6eUx2njNNBJGRU=;
        b=F7cSB8996cjaloIuHe9CBD8H+AqTLAmh4r88RJkqb9NLafGTdt+yWgIGX5lBY1gozA
         KJgdJ5QGFa1wcK9ZXzF/Ur4q2NYEVQ50oTBLYNRGgTGRZYOIZUQIvoX6d60k7zpNdO82
         3odjR13YEWj+URllJ0d1vUAwIcQuM+dN2iFEo/ibGNmgTpJBQQaCgK0ipf2S8m9+sY4i
         AFamusayvVNDA5pgx/2VUX8SxW+ykON/VlL+Nk0QoxqOo6z0WnPn/ZLBYo37FGOapMED
         BcbJv2MkmdAJkcyth68Tp0shaOejb1hDTL4909hSlYLputAjMwotgkjSwFO9F+JQcl+3
         MgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724999705; x=1725604505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsv5X2BcXiIj52Q3nX5m9Zd42JJpX6eUx2njNNBJGRU=;
        b=Vv+szphqKAzQJf7g9lVmrDJBFVizEPcoQ19cIENBH65PnTCyGUFJu9QM6Gy77dZszf
         5WE7MdVMEwTpXmzhgiu/KF3YTtp4gdvDZUsOubhQhT3gNY8v+4GDCQeVnzBeqnl6cDK+
         Vo3GbdJK9MdkpEsd5h/NI64cO7RwVgZKNem3jcxjg9WqVPP2YWwapErEli7bajJGKfIT
         D+oOntg1bcV4lVGC3EzRC4YCqBORnPhmH6tjqhP6qTrt6PBi1TDurvfs0+AYchSXre8j
         uJSPpB8kx+CrOpA1uiPnQGYxG4tHeu6l/yJGVJHoHLjavQiqUNNhx2Xcl0xgcV+lx4/y
         Y71w==
X-Forwarded-Encrypted: i=1; AJvYcCVTEI3xv6ThoFWHF9SwY3buRT04NjY0Xghw50bPnnMNX3k48gqOAoTggKCZnKLjeV3UoeU3vPTyRevmRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUFrJaBDp0x9+mG/j6dFy6MDFFouIMUf9TOzLeK7kT/2guQK9i
	VvtC5AO3vmOCGKppeyLVmzsxgiiRbiRdYbnXRTIgNdmwrrrsmitMkZdxrwoEo3Y=
X-Google-Smtp-Source: AGHT+IHrkn7X8r1BezpfgrvJ9H3MdnM6LLa+YY9J5l1LnwUSt2AZ77rXeLwXmw7DSaQQCNWtORcSjg==
X-Received: by 2002:a2e:be09:0:b0:2ef:17df:62f9 with SMTP id 38308e7fff4ca-2f61e09b105mr4011121fa.7.1724999705423;
        Thu, 29 Aug 2024 23:35:05 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614f00860sm4879441fa.45.2024.08.29.23.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 23:35:05 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/6] media: i2c: og01a1b: Add stubs of runtime power management functions
Date: Fri, 30 Aug 2024 09:34:56 +0300
Message-ID: <20240830063459.3088895-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830063459.3088895-1-vladimir.zapolskiy@linaro.org>
References: <20240830063459.3088895-1-vladimir.zapolskiy@linaro.org>
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


