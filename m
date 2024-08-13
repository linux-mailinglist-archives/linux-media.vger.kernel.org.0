Return-Path: <linux-media+bounces-16189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43310950254
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 683291C22CBD
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 10:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B69B194AFE;
	Tue, 13 Aug 2024 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LEPjag7e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC96194C73
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723544451; cv=none; b=lQ+DwsldcOUdJ0TCq4Gj5inCL465YYsDxrgImPqIzCXQUOcDJWMswp0f+Fs0KBTdSn3XPvgJVvGbmUs5/beZPfava4yAeYq7Ki2vSt0WVuP3v2gdK9JNvkbXHWHkb88M9nr+SehgyKFbTMuv5FvoTrOpv4MGYiQ4GlaZDd3r7AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723544451; c=relaxed/simple;
	bh=ptI+1cnf+u4VBn9bOwvEfCwCXmKV4oBoAMfSgsrVIoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QEUGOQsMykW/mkydA9+ULPlAwayj94kLzZ7bBdkSMznLozWcPBmtTVuathqaOAd5FXQQBD3dewm4y6TywV5hKN6yc8ioUoBxers2KzI4DGFiUp9ewBgBfLh+lOPHzFbcC/ji/Ijly+qKM2oMpL70Wd9mlNMFcThmPTEcx6YukUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LEPjag7e; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52f015ea784so849915e87.1
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 03:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723544448; x=1724149248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1GjYwT1PAjue3OAqw3OwrRMNr28kZG4xX7v3BOKWZ4=;
        b=LEPjag7emQgVZh7UYizmZr03diKcgtEJ1gHERPu9hDb7PCHLpbpGq9aVcH/pQ7nDXY
         zsEt/acBfTrr5Fsi0wvK+ZSxaneQJjs0tijJb9XwmvYUgrDCsBv7gnD0Woj2cyb2Qwfx
         XJtgUaxK7HNiQ6fP/uvqyft3MpdNXa90UDR3HfP0354wRnj/MpPNgSX4io9bQX7dU/11
         KowqHaPKd66eeA3rJCG2tYr0Ux5wOx3RBbJzedeLS/5YqVOB5GKLfqpQOFJmNbNTXO0/
         zVmM/ttTdwda3I5mU6seVCa72DV3WDG7qH5moWCDky1VP5pegZNf1LthL+2mRjNn0ik2
         1YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723544448; x=1724149248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1GjYwT1PAjue3OAqw3OwrRMNr28kZG4xX7v3BOKWZ4=;
        b=l+2GST5r5DIGwePqouWjg1PC5TTqcbhFyIE5M6PftTa5R9kufNCFfdWs0csE0W3ctG
         T2Mu2cXGOcOFAhGkuZuP8QNPBhTnVL1P7w09MTq/QZeqnOv434mRK6AH0Q7iyg/lIa80
         7KuznqH6s9gPBtRU1UIvfNzjWbg6zlgF+dNZcb8y9MKndLPNhe6nD8xsm0YXfLPnEZ4y
         hRojEd4z7zdLjoIj+RE1tEpCvkoF/FpQYrMd3ABrVgbpFBizaLSrDq/tLT0y4prVBMUK
         zVlOx2QHg+O4/hiJEZLP1peNpEbsjpCnssfuahNPFk2GN5wvEFw4xw4U/I8vHjNTPsqP
         2okA==
X-Forwarded-Encrypted: i=1; AJvYcCXBn8bbwqc0YcYNGNoUCOaNAdlRBucRToRrf856RMwj02Jq54nUXqn5XEyA7CSQ/GBpz4rMjn+hwDb4mmRzz31Iv14meOG+ZCBuLJU=
X-Gm-Message-State: AOJu0YxTqg1/M9n9w0QIQQqBDROxFx3FwtBeXeDjhBnH3jtEYzrUPDDN
	ejwk2cGzM/J6IOPKnIhCyuIeJ4/T6a4lVK8hOA7KLAtPtbDb0uAJWqLYyD6pl+A=
X-Google-Smtp-Source: AGHT+IEpQaqLGz7U6Da0y6hc4YcA3+PMH+jf2GZAO7uQ5ABFL5HDJvQPqGBMGfQZ84FsK4To9SrDIQ==
X-Received: by 2002:a05:6512:1589:b0:52e:fd7c:8b9b with SMTP id 2adb3069b0e04-5321502b50fmr791566e87.7.1723544448067;
        Tue, 13 Aug 2024 03:20:48 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200eb3ca5sm965917e87.55.2024.08.13.03.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 03:20:47 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 6/6] media: i2c: og01a1b: Add management of optional sensor supply lines
Date: Tue, 13 Aug 2024 13:20:35 +0300
Message-ID: <20240813102035.1763559-7-vladimir.zapolskiy@linaro.org>
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

Omnivision OG01A1B camera sensor is supplied by tree power rails,
if supplies are present as device properties, include them into
sensor power up sequence.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 86 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 90a68201f43f..0150fdd2f424 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -9,6 +9,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -422,6 +423,9 @@ static const struct og01a1b_mode supported_modes[] = {
 struct og01a1b {
 	struct clk *xvclk;
 	struct gpio_desc *reset_gpio;
+	struct regulator *avdd;
+	struct regulator *dovdd;
+	struct regulator *dvdd;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -982,11 +986,46 @@ static int og01a1b_power_on(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct og01a1b *og01a1b = to_og01a1b(sd);
+	int ret;
+
+	if (og01a1b->avdd) {
+		ret = regulator_enable(og01a1b->avdd);
+		if (ret)
+			return ret;
+	}
+
+	if (og01a1b->dovdd) {
+		ret = regulator_enable(og01a1b->dovdd);
+		if (ret)
+			goto avdd_disable;
+	}
+
+	if (og01a1b->dvdd) {
+		ret = regulator_enable(og01a1b->dvdd);
+		if (ret)
+			goto dovdd_disable;
+	}
 
 	gpiod_set_value_cansleep(og01a1b->reset_gpio, 0);
 	usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);
 
-	return clk_prepare_enable(og01a1b->xvclk);
+	ret = clk_prepare_enable(og01a1b->xvclk);
+	if (ret)
+		goto dvdd_disable;
+
+	return 0;
+
+dvdd_disable:
+	if (og01a1b->dvdd)
+		regulator_disable(og01a1b->dvdd);
+dovdd_disable:
+	if (og01a1b->dovdd)
+		regulator_disable(og01a1b->dovdd);
+avdd_disable:
+	if (og01a1b->avdd)
+		regulator_disable(og01a1b->avdd);
+
+	return ret;
 }
 
 static int og01a1b_power_off(struct device *dev)
@@ -998,6 +1037,15 @@ static int og01a1b_power_off(struct device *dev)
 
 	gpiod_set_value_cansleep(og01a1b->reset_gpio, 1);
 
+	if (og01a1b->dvdd)
+		regulator_disable(og01a1b->dvdd);
+
+	if (og01a1b->dovdd)
+		regulator_disable(og01a1b->dovdd);
+
+	if (og01a1b->avdd)
+		regulator_disable(og01a1b->avdd);
+
 	return 0;
 }
 
@@ -1045,6 +1093,42 @@ static int og01a1b_probe(struct i2c_client *client)
 		return PTR_ERR(og01a1b->reset_gpio);
 	}
 
+	og01a1b->avdd = devm_regulator_get_optional(&client->dev, "avdd");
+	if (IS_ERR(og01a1b->avdd)) {
+		ret = PTR_ERR(og01a1b->avdd);
+		if (ret != -ENODEV) {
+			dev_err_probe(&client->dev, ret,
+				      "Failed to get 'avdd' regulator\n");
+			return ret;
+		}
+
+		og01a1b->avdd = NULL;
+	}
+
+	og01a1b->dovdd = devm_regulator_get_optional(&client->dev, "dovdd");
+	if (IS_ERR(og01a1b->dovdd)) {
+		ret = PTR_ERR(og01a1b->dovdd);
+		if (ret != -ENODEV) {
+			dev_err_probe(&client->dev, ret,
+				      "Failed to get 'dovdd' regulator\n");
+			return ret;
+		}
+
+		og01a1b->dovdd = NULL;
+	}
+
+	og01a1b->dvdd = devm_regulator_get_optional(&client->dev, "dvdd");
+	if (IS_ERR(og01a1b->dvdd)) {
+		ret = PTR_ERR(og01a1b->dvdd);
+		if (ret != -ENODEV) {
+			dev_err_probe(&client->dev, ret,
+				      "Failed to get 'dvdd' regulator\n");
+			return ret;
+		}
+
+		og01a1b->dvdd = NULL;
+	}
+
 	/* The sensor must be powered on to read the CHIP_ID register */
 	ret = og01a1b_power_on(&client->dev);
 	if (ret)
-- 
2.45.2


