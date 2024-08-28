Return-Path: <linux-media+bounces-17054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59238962F85
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 20:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 744CB1C23A41
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 18:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61341AB51B;
	Wed, 28 Aug 2024 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlNG77RX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF511AAE09;
	Wed, 28 Aug 2024 18:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724868822; cv=none; b=YwHNhRU1t2+spFIE7hw19/CbyavhPnECuxWYih0U5t51oU8vnjQVWYd8TjOYAf1WjouqbGzzq0klH2IzCaxIpCZFlvPHmoOJmFxuLDbSr2z6hdnwbqXwd4UhfCkjjxN2/fl1vjDGFMfn8nqJ4a2W36VVshdHITlPNsFrSW37WTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724868822; c=relaxed/simple;
	bh=QvB5B+gFFlGNEzY159HtfVgEGSfv5n2tQ2JQPgW0Yk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J2XqZhz15+fxkdUw7WElPXTPDRiHZwS3dIJiO4A6ChMNDPLcInAQI7DUg4vjIrZ1d+B6eCVASUZXUdId27XMkcJhZVeZNopkZH8rcqgrhPS3PzOHs+GijRKDI+qz4n+ipPGk10Vhic6ue35HyK+itcd+38ynsF4F5cV+UuKoTko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlNG77RX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5bef295a45bso3935428a12.0;
        Wed, 28 Aug 2024 11:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724868819; x=1725473619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcODzWXELTUrcpsghGy3IM6a1Sura9bZQ8wxI+JOi9w=;
        b=RlNG77RXCrLKjv7+DjRM9jn7qohORdxkzDbTzJ2Waigfnw4qAprxHeNzbm3piMr2fp
         Q7W/2eWY6m/l8T9kmHvqnByUneEiN+VOt+oTEnyJoa8ozvZEO/xUtDhPGSs2dUh6YKCF
         b3RpgUpBHThcn0ILZsp8V4CvUC8F9240qUMrwgQp6KEtUonqXrDCr3ErjRQbsh6tU/0z
         QbNbIt5llYP70TNv3kmw1Q82l2AVnvE6v+EzDBCdA2R6jtlr0PA9/ECf816XF4sEGtgO
         pGHwPwjW+VVne8IV+0/MB2M19LBdQavmLi03S/QfWEbz7BOp+qWK7f85iMfFf6uK5/du
         zL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724868819; x=1725473619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcODzWXELTUrcpsghGy3IM6a1Sura9bZQ8wxI+JOi9w=;
        b=Li7XLCf1loJxn9TLaDNWD17o9hiF2RnSPoTNsUFZKD1yCEF0j9bwRY6PMMYjXkE81P
         79DKOKkY31qJWFJrfEdZISEjFub3AEixL2y89SonmUCSsSWnq83tWafL2TjXVvshYRVa
         9nlK8XAZtqeC2rDkFRP1REfOtlittdIbHvaK5F/va0q9OhoR5eRvu0N+x07EUp2C4yLP
         vZFPQD2pdHjefpIcP9IdgllAGIDBbPzPd/KnplI75t8wLYTe8MVTQ23LIud7Rgs07Tzh
         kpJSXbN0n2teuPy+trH1d8az+Kg6p1sJ842SuBlqeQGf9iZx0Yla7bLnB1V/qHyWsaD1
         Ke5w==
X-Forwarded-Encrypted: i=1; AJvYcCVDR1fEZFnDOTzEmxPm3lJZLPtlXzHPyug01nFMYOyGyE8RLSqemyC34YAT7pk6DzXGjGYmc9Sb1t3WFc8=@vger.kernel.org, AJvYcCW0TwdwmMFoNSQrkmb/MKtdtiCGuXR/hfUfGAvb3rfIwuC6UEfIctBVnHvrNCrv+oeTXY8i+0YNK2Wkdac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9SRibmT/tB3kgI72AxlS+lLK6psCL64FTAaXUbqfW6A6yE8B+
	Q+iu6f9HzGYbmeZA8kvBEqnkx23q/ikLw9ks12Zc+rYTdgstqz+F
X-Google-Smtp-Source: AGHT+IHaUr5q5Al83EARrMlCIJjOHxmMiBcCChtkjUuNQOycdzrDD5OfPDiEbkDNRi1sgDE12L6hFQ==
X-Received: by 2002:a05:6402:4308:b0:5be:ff75:3aa9 with SMTP id 4fb4d7f45d1cf-5c21ed8c6a2mr368408a12.26.1724868818425;
        Wed, 28 Aug 2024 11:13:38 -0700 (PDT)
Received: from [127.0.1.1] (77.116.208.33.wireless.dyn.drei.com. [77.116.208.33])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb1e51c8sm2525549a12.34.2024.08.28.11.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 11:13:38 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
X-Google-Original-From: Benjamin Bara <benjamin.bara@skidata.com>
Date: Wed, 28 Aug 2024 20:13:07 +0200
Subject: [PATCH v2 1/2] media: i2c: imx290: Check for availability in
 probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
In-Reply-To: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

Currently, the V4L2 subdevice is also created when the device is not
available/connected. In this case, dmesg shows the following:

[   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
[   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
[   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
[   10.454018] imx290 7-001a: Error writing reg 0x3020: -6

which seems to come from imx290_ctrl_update() after the subdev init is
finished. However, as the errors are ignored, the subdev is initialized
but simply does not work. From userspace perspective, there is no
visible difference between a working and not-working subdevice (except
when trying it out or watching for the error message).

This commit adds a simple availability check before starting with the
subdev initialization to error out instead.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Changes since v1:
- define operating/standby mode and use it
- read out the standby mode during probe and ensure it is standby
---
 drivers/media/i2c/imx290.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 4150e6e4b9a6..2a869576600c 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -29,6 +29,8 @@
 #include <media/v4l2-subdev.h>
 
 #define IMX290_STANDBY					CCI_REG8(0x3000)
+#define IMX290_STANDBY_OPERATING			(0 << 0)
+#define IMX290_STANDBY_STANDBY				(1 << 0)
 #define IMX290_REGHOLD					CCI_REG8(0x3001)
 #define IMX290_XMSTA					CCI_REG8(0x3002)
 #define IMX290_ADBIT					CCI_REG8(0x3005)
@@ -1016,7 +1018,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
 		return ret;
 	}
 
-	cci_write(imx290->regmap, IMX290_STANDBY, 0x00, &ret);
+	cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_OPERATING, &ret);
 
 	msleep(30);
 
@@ -1029,7 +1031,7 @@ static int imx290_stop_streaming(struct imx290 *imx290)
 {
 	int ret = 0;
 
-	cci_write(imx290->regmap, IMX290_STANDBY, 0x01, &ret);
+	cci_write(imx290->regmap, IMX290_STANDBY, IMX290_STANDBY_STANDBY, &ret);
 
 	msleep(30);
 
@@ -1520,6 +1522,7 @@ static int imx290_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct imx290 *imx290;
+	u64 val;
 	int ret;
 
 	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
@@ -1580,6 +1583,16 @@ static int imx290_probe(struct i2c_client *client)
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 
+	/* Make sure the sensor is available before V4L2 subdev init. */
+	ret = cci_read(imx290->regmap, IMX290_STANDBY, &val, NULL);
+	if (ret)
+		goto err_pm;
+	if (val != IMX290_STANDBY_STANDBY) {
+		dev_err(dev, "Sensor is not in standby mode\n");
+		ret = -ENODEV;
+		goto err_pm;
+	}
+
 	/* Initialize the V4L2 subdev. */
 	ret = imx290_subdev_init(imx290);
 	if (ret)

-- 
2.46.0


