Return-Path: <linux-media+bounces-17205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 455B19657B7
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A67E4B21486
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BD4156668;
	Fri, 30 Aug 2024 06:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zt1jJK7H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA01537D5
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 06:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724999712; cv=none; b=TWQuDz6jODHY8C4llgCAkIwqAVTnPUxR3Xa6+RjjYwKigjoRIL0w/pCjTC4SY1kg49R80+TiyaT3jMOQHSUIsLkrJOcREKiT6Bh70cSjWsEfmG+cv7OyDsRVCm/1fmXQMfMbWNxxgwsAOTitmsAblJCV693QSmonZDNjHrX4OQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724999712; c=relaxed/simple;
	bh=WR5Qvyz7HypShOnXPuR8rNv8zzczm+28Xc29+mq391Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oB2qedH/TnY1vaCLw+yIubR+SNVAf0X316QN7w/Jvx+h5Tsr+hH3uBx3Twms8c+wYXv3JXaR91XSH9R04hRtfsiEf5pUscQ7qFnAf/a9txKNTMVHxuCHe3WE81RcLOh/5iOsqOmlSM3VCYZ1E+lDWLLS0qg7wCSicpYObP1knYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zt1jJK7H; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f3f8ff9209so1136081fa.2
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 23:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724999708; x=1725604508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5d+S6BZ2xnZFCEe28a2+FjlgiCY+QJgtrYEFKv4TVXk=;
        b=zt1jJK7HAkzx5bL3CJy/rhMn0aJ85Zq4I89Cws3Afvon4Y9Y3ZFbdG91hwnPdssPxa
         t3uxwZDEE9Ox3CgeJHUTYwzGLi5xAfb42NbMtNitEE2hbIcZhgDreWzoCk8o9mr0t8Y0
         tZRjMteCbukJWxS+tM8iHn95pa6DDrGI+Wygnv6lyNbv7rP2xUlhcxsT+S9O1lwwWdyt
         jVVFz1yx3wQ+8D2B+LnGArIkBuZhLj8cmfv34GPyyL+y0meFRzrZcZZDYmgM+Apg5+mZ
         d4+ZlwqlbCU6Bnmcj4VyrKvWjN7JJzD/nD04L0qvXBJLgX+nnOEUDKvd/VC3T1bnP7ak
         MKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724999708; x=1725604508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5d+S6BZ2xnZFCEe28a2+FjlgiCY+QJgtrYEFKv4TVXk=;
        b=JU4EuVh76uAkap3knMqBZ8BoaVIV+BN2AmzDha+qoS781qENDIbYek0iMjTgyH5VS+
         31BNmdQnQG5ITOxQ2mk2kEvmIpfniEapdCPoQd9qvDFqF3L8QyWqdiqp2a1EiAvdvWuS
         1wALktUlCq6k/T+7sutueuh8a0DIDDBcyC74VKxWcXXyK1pGmULLQJcu9qMcGRKpVZTU
         qLmcHUkVXU8zBHlEnj5aExzVD37oE/DQyENRciV1g+R/zyS1WARrjWF2Wxf6ccbCWhYY
         VJKc3GrcGIyX3M5j1YDw/OlMzzJYhZ9Q9fhkymwkC/zlIYc5G6qyzXWYuV6n5YkWUFUf
         zuJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg5oj2MRvDgHH8rJ7L8p4UnGnZ+GL8Kik+PGYO7sUxIO5+OZF9l6SpgUkvpKhvTIutNyjdgj/mnkzQ0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8/MQWK2DabjPnmW/+9x6QQEnEasA0kuqh5yhnW1YCSpAOxmo1
	fjg5bFzW8l1DpURrj0Vwy/NCnLpIEJt6V1522qy202Nm19qOpl7zrqzVXuT4JRM=
X-Google-Smtp-Source: AGHT+IFwR04+YaRtD81Bd5CgyKgIg1X3z4iMKssOTxQQ9CHPiej5OiZ7eYOlrnqDQb3ZkLLuEHV4ZA==
X-Received: by 2002:a2e:a98e:0:b0:2ef:2d71:e23c with SMTP id 38308e7fff4ca-2f61e02592dmr3684331fa.2.1724999708390;
        Thu, 29 Aug 2024 23:35:08 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614f00860sm4879441fa.45.2024.08.29.23.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 23:35:08 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 6/6] media: i2c: og01a1b: Add management of optional sensor supply lines
Date: Fri, 30 Aug 2024 09:34:59 +0300
Message-ID: <20240830063459.3088895-7-vladimir.zapolskiy@linaro.org>
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

Omnivision OG01A1B camera sensor is supplied by three power rails,
if supplies are present as device properties, include them into
sensor power up sequence.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 81 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 95716c234cd5..a6a2b1ba84b3 100644
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
@@ -985,9 +989,27 @@ static int og01a1b_power_on(struct device *dev)
 	struct og01a1b *og01a1b = to_og01a1b(sd);
 	int ret;
 
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
+
 	ret = clk_prepare_enable(og01a1b->xvclk);
 	if (ret)
-		return ret;
+		goto dvdd_disable;
 
 	gpiod_set_value_cansleep(og01a1b->reset_gpio, 0);
 
@@ -997,6 +1019,18 @@ static int og01a1b_power_on(struct device *dev)
 		usleep_range(delay, 2 * delay);
 
 	return 0;
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
@@ -1012,6 +1046,15 @@ static int og01a1b_power_off(struct device *dev)
 
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
 
@@ -1059,6 +1102,42 @@ static int og01a1b_probe(struct i2c_client *client)
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


