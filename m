Return-Path: <linux-media+bounces-16649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4897E95CA79
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 12:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51F811C2124A
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE32F16DEDF;
	Fri, 23 Aug 2024 10:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HoHmUX7t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8918C186E5D
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408867; cv=none; b=ix3dt8u1YyzbcqjxXlBWjiuRCG6wIytTbivQ8HnBYAONFNcWOYwg8L4HrN1kDySNWUWc3V+DRigTXzl4pSigKJwDrwgP1HP946Y7yjAgryFJWrgV+LnnGh0sf3OHj80zhRN+CNnWQFyfPj7qN8XJKo9DMTdAM6qt/rfokpQ0RI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408867; c=relaxed/simple;
	bh=TLxSz++/7M97PUkNT2/Br7+oya34SVBySx4WaXTnWXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVBU7WXqIb7CfyRv8JrzzjNMhvjk8basZVFzsCI2Q4JnfeqF5cwy/ldnB/WH66e4FSBj5lwJ3ZUHO6w2Jv4M1FZ2yuYQfhk152i6s0d5Nwyo09sdHqHxaFkMwwg7ubX9tb9kWPxEPXSyTuRKO7QW80jLRsEbgMbkzGBgdeqGf6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HoHmUX7t; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53346424061so380187e87.2
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 03:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408863; x=1725013663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs0wiahdfO6Fz40mXpiMOeMkXjf8sxyUVit18FlZ5o4=;
        b=HoHmUX7toacGoEM/L9HFVRoWbImDEXbORG6baKGi3nWrwhpLvwUGwaF+uM97aZZDyq
         N3fh+oKjDiZ0j+a0BWogIs7chpBFEMBIIkS0Q9d4r86aJxu+TSsXdu0MoF8nMJI8jRjs
         +34YYi11DkzEf/x9lJNBGm//aJvTL1i3tq7fmrPMR3SuYGc7rPpknplt5PD9yBxq75tr
         fClKaWP3NJHRpbsPGL4nvID0ZNaOpAwhLLwgIUZ7r18gU+lkr1KjE/5NLxOldR0M0Cpf
         iNDZZS1Hiym+C7Y0Y5KfzAeS+XVM09sLzKsUrwiGbnK9+Tfu0GXqLgnGIiSj+4qBHo82
         SBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408863; x=1725013663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fs0wiahdfO6Fz40mXpiMOeMkXjf8sxyUVit18FlZ5o4=;
        b=WNdtNVE2hOAaKIcv2LqbJe+9K6g7CHJyH5z/Ytlskp0BVoDlhPKHvxBdsYNgdox7vg
         zJFtQxRj3D12YeqL4UQq1fkilYROZWO5D2Y2YyJBlq/By5m6w2Ai1e3CUE3SYmbpf0Wk
         4m9PEZezA/+UNuvM8QRH8hc3k4LZm/NLFVim4w9CkPyUq/p1pqTso0bt/MV07m8zpsNa
         /rJuRyr4kISoqkMUcg0nTpyIyKk70l7Bimee4Mk0wveZdETsPAP6meBidPvbH6JoyKQh
         V0y/FGKmS9X/AVsD1ZWpPgDv/jrlrpa+3+xiA0NpU07awicTqPMZXiTcC+fsyPvjGwVI
         USQA==
X-Forwarded-Encrypted: i=1; AJvYcCXxzTcEOVH9rLGqrkk0Tt3gSuxVh7fb+3Zuko3IHOtr86aM5fEkj4bVni3DnxrEbu7NV4flhiCsuKW7Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGW5P9TLwru3Qcuf7/bUM2kDl5q8c5krnUAkxp8Y2OG+OqlpJD
	O9K9k0XCyv5qpSx/Lo103DaAXMCMVlmzjFuTxZoJo1pfTFqn3V14LlclgXcfoKw=
X-Google-Smtp-Source: AGHT+IG1Ng+0IppKUCkwNvF7DM6tkj2HyfqHpfD5QWzj68seAvf1svSYrqh79zw+tkk3509heTNnlQ==
X-Received: by 2002:a05:6512:b8d:b0:52e:ccf4:c222 with SMTP id 2adb3069b0e04-534387c4d10mr806570e87.9.1724408863470;
        Fri, 23 Aug 2024 03:27:43 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5d220sm504669e87.183.2024.08.23.03.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:27:43 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 6/6] media: i2c: og01a1b: Add management of optional sensor supply lines
Date: Fri, 23 Aug 2024 13:27:31 +0300
Message-ID: <20240823102731.2240857-7-vladimir.zapolskiy@linaro.org>
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

Omnivision OG01A1B camera sensor is supplied by three power rails,
if supplies are present as device properties, include them into
the sensor power up sequence.

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


