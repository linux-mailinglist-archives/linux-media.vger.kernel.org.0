Return-Path: <linux-media+bounces-17382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CD7968B6B
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 17:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E4151C2299F
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 15:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A561A3053;
	Mon,  2 Sep 2024 15:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUG/drAB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B0B1AB6F3;
	Mon,  2 Sep 2024 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292664; cv=none; b=JBeTS19R5ykUqRbAy2fu9QdUkvatBD4raNlN/PzdE61phMIX+j8O6x6HaXOsZHVnHaUJTEZDm/gRXs47Q11zruXnWMvijCdFNyaEOjeTlCrS4IxLsAk/wGDS2aB5hArudDrt3TG4m/R3knU8ApfF3RBe7pC39Cqm9i3nKRBJdzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292664; c=relaxed/simple;
	bh=Lzl+omPBtHR44Z4UzBtKNCzvZ4x/bVYsZ1+ORCVtREQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ixBIOEhmsSmD3XiZwuWmoPNKI2AaCTsQtLalv79biXiXMXaTSvJoqKoQsN7+ol0KLwv9v+dBhfT7P9+UPe1g+Gv05Todb9Jr6TDbGm7uCfv35/xsglLt79k20oM/GDxXvBjqyMYWinEA9Ow3lPYwoPLLU7o0b7ZcXTHHtQhApw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUG/drAB; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-534366c194fso3988619e87.0;
        Mon, 02 Sep 2024 08:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725292660; x=1725897460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4hI8+kGIT6wXCqJnZXAvzgNsi+lvmQBwJ5g0y2c0eY=;
        b=HUG/drABLHc4Gq8BL3lT6Edjk8VqEGq+zu0e0CbPws4qPpwifWqGibF/V53LE4ufuD
         r77w+EHngdGayxjLw7uz0iIhd5svW1x36CKfskVroKBW1dcnibCqWNQBmRoLx49OwSCl
         l90bcbDoxbfE340g0lGb6Cr3eQWLzrNVQ3hJI7aaDATjuvJPxvknjDtj0ffmZ4isWcZ1
         1ZizCfcFYv8i7bGbcUFkDjAikmqVEMtFzo0U0Ppb2sGxqfqDLI/cT+aYqcMjskSBCvO9
         B3gsw7rnkRdKrMZsZpWqrmcbIeeV7BMjj1nE6vRUprvhhlkPbgdGXaGbNGw1q9tLM49a
         srDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292660; x=1725897460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4hI8+kGIT6wXCqJnZXAvzgNsi+lvmQBwJ5g0y2c0eY=;
        b=SqBF1T0fPknHTjVQW3prmhEVTsQeP1Vlc8792W7oUcHHt4aRVSFj6OaMauw1hY8Hh3
         EEf+G0jRZqh2f3GqHskVlP1RRRMh2Kubogk6MRVGmIJSMrBXD+qVzITY13k7eAmhM4HE
         AyCO/8bV7B2CeqsgkwfHEnso2HBjKJ3PBHn60j5fEI4yEVZIL1+Y94KYNpX8r8ubmTJm
         wI7wnwgcMqWi68LzcCivuMledVmeSAEOM0B5/VqY7c6WYcs8SQfX76WbLqCBx5FPMcJU
         I3vrxlkr0JYndDlNoiePLzmPXdK6x7pXqVc50SIkWRO2inonB5C+q9LtWbeCgrcrHG8a
         8+dA==
X-Forwarded-Encrypted: i=1; AJvYcCWGMQQssWvPXyTJLen3AxkRUadNCSW/jVB00Jzqpvm8END/IyqGgloCPLyx4mveHx4AwizDo4MINr8Hxg8=@vger.kernel.org, AJvYcCWtnaqyDiiy3LSW3ltYgxXsoD4ZB8a7QQqCSADAS4t7KpDcbv6bN+j16qTQVRMWofM49eEFBlz0kaoXex8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw30js7ZXwXybf2eoN1R0W51TPBpa/GX9uQoOL1Ky5yihXl4va1
	/nmdvB3KMw/rRJ1POUs/i46JcR9l0Yt/qRW1XEu8O3BsmPQV4Nhq
X-Google-Smtp-Source: AGHT+IHq8nsQgQhjegoUPQJBRWJ413Ys61mHnHpnkGz58ELOfcaiYF8SrvSeNxqmCmZHqIHx6w4DtA==
X-Received: by 2002:a05:6512:ea7:b0:533:44d7:c055 with SMTP id 2adb3069b0e04-53546b19184mr6908419e87.5.1725292659664;
        Mon, 02 Sep 2024 08:57:39 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6f87sm570951366b.158.2024.09.02.08.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 08:57:39 -0700 (PDT)
From: bbara93@gmail.com
Date: Mon, 02 Sep 2024 17:57:32 +0200
Subject: [PATCH v3 7/7] media: i2c: imx290: Implement a "privacy mode" for
 probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-imx290-avail-v3-7-b32a12799fed@skidata.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
In-Reply-To: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

From: Benjamin Bara <benjamin.bara@skidata.com>

Currently, we have a trade-off between potentially enabling the privacy
LED and reading out the connection state of the sensor during probe().

To have a somewhat defined policy for now, make a decision based on the
power supplies of the sensor. If they are enabled anyways, communicate
with the powered sensor for an availability check. Otherwise, create the
subdevice without knowing whether the sensor is connected or not.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Changes since v2:
- new
---
 drivers/media/i2c/imx290.c | 82 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 57 insertions(+), 25 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 6b292bbb0856..338b2c5ea547 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1354,6 +1354,17 @@ static void imx290_subdev_cleanup(struct imx290 *imx290)
  * Power management
  */
 
+static bool is_imx290_power_on(struct imx290 *imx)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx->supplies); i++)
+		if (!regulator_is_enabled(imx->supplies[i].consumer))
+			return false;
+
+	return true;
+}
+
 static int imx290_power_on(struct imx290 *imx290)
 {
 	int ret;
@@ -1571,6 +1582,7 @@ static int imx290_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct imx290 *imx290;
+	bool power_on;
 	u64 val;
 	int ret;
 
@@ -1611,36 +1623,54 @@ static int imx290_probe(struct i2c_client *client)
 		return ret;
 
 	/*
-	 * Enable power management. The driver supports runtime PM, but needs to
-	 * work when runtime PM is disabled in the kernel. To that end, power
-	 * the sensor on manually here.
+	 * Privacy mode: if the regulators are not enabled, avoid enabling them.
+	 * In case the regulators are enabled, we still want to make sure that
+	 * the regulators know that they have another consumer, therefore run
+	 * the powering sequence.
 	 */
-	ret = imx290_power_on(imx290);
-	if (ret < 0) {
-		dev_err(dev, "Could not power on the device\n");
-		return ret;
+	power_on = is_imx290_power_on(imx290);
+	dev_dbg(dev, "%s: power on: %d\n", __func__, power_on);
+	if (power_on) {
+		/*
+		 * Enable power management. The driver supports runtime PM, but
+		 * needs to work when runtime PM is disabled in the kernel. To
+		 * that end, power the sensor on manually here.
+		 */
+		ret = imx290_power_on(imx290);
+		if (ret < 0) {
+			dev_err(dev, "Could not power on the device\n");
+			return ret;
+		}
+
+		/*
+		 * Enable runtime PM with autosuspend. As the device has been
+		 * powered manually, mark it as active, and increase the usage
+		 * count without resuming the device.
+		 */
+		pm_runtime_set_active(dev);
+		pm_runtime_get_noresume(dev);
 	}
 
-	/*
-	 * Enable runtime PM with autosuspend. As the device has been powered
-	 * manually, mark it as active, and increase the usage count without
-	 * resuming the device.
-	 */
-	pm_runtime_set_active(dev);
-	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 
-	/* Make sure the sensor is available before V4L2 subdev init. */
-	ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
-	if (ret) {
-		ret = dev_err_probe(dev, -ENODEV, "Failed to detect sensor\n");
-		goto err_pm;
-	}
-	if (val != IMX290_STANDBY_STANDBY) {
-		ret = dev_err_probe(dev, -ENODEV, "Sensor is not in standby\n");
-		goto err_pm;
+	/*
+	 * Make sure the sensor is available before V4L2 subdev init.
+	 * This only works when the sensor is powered.
+	 */
+	if (power_on) {
+		ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
+		if (ret) {
+			ret = dev_err_probe(dev, -ENODEV,
+					    "Failed to detect sensor\n");
+			goto err_pm;
+		}
+		if (val != IMX290_STANDBY_STANDBY) {
+			ret = dev_err_probe(dev, -ENODEV,
+					    "Sensor is not in standby\n");
+			goto err_pm;
+		}
 	}
 
 	/* Initialize the V4L2 subdev. */
@@ -1666,8 +1696,10 @@ static int imx290_probe(struct i2c_client *client)
 	 * Decrease the PM usage count. The device will get suspended after the
 	 * autosuspend delay, turning the power off.
 	 */
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	if (power_on) {
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_put_autosuspend(dev);
+	}
 
 	return 0;
 

-- 
2.46.0


