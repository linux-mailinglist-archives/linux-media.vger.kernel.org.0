Return-Path: <linux-media+bounces-28327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A27EFA63909
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 01:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7172D3ADFF5
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 00:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C206E1494A3;
	Mon, 17 Mar 2025 00:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ynz5jpJz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537E712CD96
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 00:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742171989; cv=none; b=nNIZtuYJ/s8b5485AaE0vDi3pVhHsj0bium0gB0tSgQq97C2qQQlawto8f4tJOLbs2xtx178+nRPeGlP35W0yudbSCM/nAXSFVZwLPDuCnHN+OeoaRr/s0I0TwCdSPOHVInQpo8SEDtLB7wHAKEbZ28y/LCcdRcwUgPp3GQkdf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742171989; c=relaxed/simple;
	bh=eRL0pzRV5KcpM/Epzs62OHbODj4sT3wl0WJ5nHoAiS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCHz6BKiOjdhIOUuTqsUq+2bdyX6YARKN+qaL1keu8P/dafCsvVZB7l729MwkxVZyYKSKnrteBr/wp9ZF/FIzmbN0Limecbwj3/EMyB6JPmUrSzwoT+Ae6qSgBF3HP5yXWCwXyxBzqEFPaUBAd2VcDHlHxwA+8oYoBu/vbsz8os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ynz5jpJz; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso6586594a12.3
        for <linux-media@vger.kernel.org>; Sun, 16 Mar 2025 17:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742171986; x=1742776786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n082EhybKfMTlm5jNgC5EZa5zxrxPioIfsLFHDtNktM=;
        b=Ynz5jpJzvKjK/QzLn6GZ6emyWWiNmi00f+YlMX2vGGUqG1eJ2lY4FCDB4R22Wr5xfj
         v+ON+0pUAWxzLMvBX4imbe1513utnqjqIHlUbUL67RhlY2Ht44IREKpjumP45S8+Ftak
         h/4HutK4cr/sSmiv7rMSvtQQz7+ACYdimDFK6YYEDTtyAi8nK2f5BlJ5V6bs70zT/iqt
         dGhxpjH86H3NsaoFh9GlHujmTdDbDtFkB7do8jb84nxZ7kmfZc6VR5/oM5a7IJlgx1DG
         lZmckWu1BKgVA/4A+OVHRfOxmmeHF7gSw6N8aE534zbHAX07RCgxMN7XW0XbyI4we5TX
         IE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742171986; x=1742776786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n082EhybKfMTlm5jNgC5EZa5zxrxPioIfsLFHDtNktM=;
        b=psl4d7OwF7T3QElnAJR87aOBsluVRoSgLFizzs9U1WSAx47XZSTMQyiz0Vq3F/EMEg
         lbCD7gQ0jLqurgHEO3KzJlIsMneTNvlj7Fvoqnw2y88r4UlVNuaQnmlWp86G5s/vkIEe
         A9fVK9IyYaEDwLpvmSw8C7AdfrYQLqCQ1adOBQHx/3iub8zJuKqX3WUq8H6/o1VAoK/j
         T1LzQveIZ6tH2+iMaUwhPtfxsIOznp/jZMI1L6egzWDqZyz0Ana40Oxe+Lhw2hxfp3z3
         YGDDE3Ctg2APBKh8aLHul1FF7H7rpK4hhgaK8jZFImEmsHS2qY0SAhaOHmXCaDV8JKOm
         Yceg==
X-Forwarded-Encrypted: i=1; AJvYcCXd+xMUYD1l8SW7yosIMizC8XTrwRE8cPohlUk9pPEb6ZgOOV/1old/q+lWLP37XRr1EdVnjhRfBzT6Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS1WuO2YWPuyS2h/qpg1HWaMqtD+/puV4AVacj+L82mSmtrMkQ
	kvuIF1711Y4I5IJNIP76LXYP579lG1wf/wEKF7cu6yoy7pgLl0I0agpdn8jUFhw=
X-Gm-Gg: ASbGncsdZumkYX+gMnskw8daQ52Am80p0eRlVxXEEsJROdMoDo9Q8b/jqxfdBJ2wFE9
	8xYgiF6fu3TWF2hO+I5dfw5Qj1kuMAovDM0TzrAQc3FZjZvh5/Wv7/C521XatfQmJyhVOcDqA65
	+KHZg6N+4U95U1Uo2VsgYIbBF9tReosis4AUrC4US9cWBiQ0YbuMCahcGr6L6/U16CuKyEqOM22
	aqkbW0so3mlrD2hst89694fgCiP3tMXuorKxQ7sdyEFYbZUlqGGhOgJoJK8Ff3rm75k1MQgt+EO
	RKkNeTZdFWz/odyGHkXcv4HRvUBRM90cg4n1VMzWujGVozKYehIJrcS8jU0/ol3R6jv/adZRHza
	NZ7HGjkZMwXTWRkSWiZeCcLy8qhJn1aaK1IGSlx11RoJr7+FuDxqdAgwrqHRtFVnhPOMBgxevXS
	s2WxQ=
X-Google-Smtp-Source: AGHT+IF0LQVRgCzkI7Nuvq266Wk5lgf/Th1urxfb6eFhn7BdMEj7xPDiCeLXnIeLYP+vZb6jZV9IdQ==
X-Received: by 2002:a17:907:2cc4:b0:abf:75ba:c99f with SMTP id a640c23a62f3a-ac330404688mr1052267966b.46.1742171985688;
        Sun, 16 Mar 2025 17:39:45 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aefadsm562407166b.8.2025.03.16.17.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 17:39:45 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 17 Mar 2025 00:39:36 +0000
Subject: [PATCH 4/8] media: i2c: ov02e10: Convert to regulator_bulk API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-4-bd924634b889@linaro.org>
References: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
In-Reply-To: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>, 
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>, 
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

Change to regulator_bulk API to capture the full range of rails to the
o02e10 sensor.

This will work for ACPI systems which only have the avdd rail available as
missing rails won't fail the regulator_bulk_* function calls.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov02e10.c | 48 ++++++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
index 29f9eec927b4660f941fa8e32249b321d25b7735..0a016cb23cbe98d8af371c6a35db2f1d8c699d68 100644
--- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -224,6 +224,12 @@ static const struct ov02e10_mode supported_modes[] = {
 	},
 };
 
+static const char * const ov02e10_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
 struct ov02e10 {
 	struct regmap *regmap;
 	struct v4l2_subdev sd;
@@ -238,7 +244,7 @@ struct ov02e10 {
 	struct v4l2_ctrl *exposure;
 
 	struct clk *img_clk;
-	struct regulator *avdd;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov02e10_supply_names)];
 	struct gpio_desc *reset;
 
 	/* Current mode */
@@ -525,7 +531,7 @@ static int ov02e10_get_pm_resources(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov02e10 *ov02e10 = to_ov02e10(sd);
-	int ret;
+	int i;
 
 	ov02e10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ov02e10->reset))
@@ -537,32 +543,26 @@ static int ov02e10_get_pm_resources(struct device *dev)
 		return dev_err_probe(dev, PTR_ERR(ov02e10->img_clk),
 				     "failed to get imaging clock\n");
 
-	ov02e10->avdd = devm_regulator_get_optional(dev, "avdd");
-	if (IS_ERR(ov02e10->avdd)) {
-		ret = PTR_ERR(ov02e10->avdd);
-		ov02e10->avdd = NULL;
-		if (ret != -ENODEV)
-			return dev_err_probe(dev, ret,
-					     "failed to get avdd regulator\n");
-	}
+	for (i = 0; i < ARRAY_SIZE(ov02e10_supply_names); i++)
+		ov02e10->supplies[i].supply = ov02e10_supply_names[i];
 
-	return 0;
+	return devm_regulator_bulk_get(dev, ARRAY_SIZE(ov02e10_supply_names),
+				       ov02e10->supplies);
 }
 
 static int ov02e10_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov02e10 *ov02e10 = to_ov02e10(sd);
-	int ret = 0;
 
 	gpiod_set_value_cansleep(ov02e10->reset, 1);
 
-	if (ov02e10->avdd)
-		ret = regulator_disable(ov02e10->avdd);
+	regulator_bulk_disable(ARRAY_SIZE(ov02e10_supply_names),
+			       ov02e10->supplies);
 
 	clk_disable_unprepare(ov02e10->img_clk);
 
-	return ret;
+	return 0;
 }
 
 static int ov02e10_power_on(struct device *dev)
@@ -577,16 +577,20 @@ static int ov02e10_power_on(struct device *dev)
 		return ret;
 	}
 
-	if (ov02e10->avdd) {
-		ret = regulator_enable(ov02e10->avdd);
-		if (ret < 0) {
-			dev_err(dev, "failed to enable avdd: %d\n", ret);
-			clk_disable_unprepare(ov02e10->img_clk);
-			return ret;
-		}
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov02e10_supply_names),
+				    ov02e10->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators\n");
+		goto disable_clk;
 	}
+
 	gpiod_set_value_cansleep(ov02e10->reset, 0);
 
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(ov02e10->img_clk);
+
 	return ret;
 }
 

-- 
2.48.1


