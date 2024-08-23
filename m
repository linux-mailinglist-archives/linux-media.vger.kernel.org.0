Return-Path: <linux-media+bounces-16648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A57795CA78
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 12:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0A41281D7D
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA8D187338;
	Fri, 23 Aug 2024 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LGvYAvPH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F43185B62
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408866; cv=none; b=bRjDw5g7N8vOK2E9OQZW7Nti5hFyLjUpuLlm4/c1VDLXEtGxucwixVFwlBYb4/2QQ1xJ012kHHdiOZX1UrVDH19aXg3fmQhcYMZt5b0eFsD1l7gQCDiodlVMs88H0zrLvGUhdiNXAf1ku8m2LV8RMmJWARFKLVOljMLt8r+pbyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408866; c=relaxed/simple;
	bh=GCZa41LBUHJwi/6V+Gjr/aZ/mKBaKvgPNKryTB40qo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ipf56Pw6JrBK4zFr1LN0wn1wYX2TtWKDlIRWhU7SyH3yPuTG5vR9qbhSQrX1LbSinK5Vc7BhEPIr0IcrokQMLXwxYci/q8iQTZEmpN7MAHUV7c9pjBHSj5kgZwFrJbkMAkuXeBM8g8fIi2nBHnz1WaB/J/lEW64SPTt4EW1LBGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LGvYAvPH; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f402830d19so2961911fa.0
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408863; x=1725013663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCeplELLLeiitcqgFPRs5GSflnURqy8in4V3Us1wY+w=;
        b=LGvYAvPHeyNSh1NHzUq+TV3mH8bf5fgVwMqlMMJOlgOZI97+itDTLmlnXms2tZvD3j
         chIYqFz2V/j6EtgxclZakOHwZJJSHY6qsPsq2JNnvUyCayhte99ACiazwn2QCMuN557z
         kNwe+jxpaxMF2vjCPxteOHu0rkE1j1vs10GL6fYBk23gIOiKxW7JK2l1zNCpTdcaMeLv
         Ff1BCmHEpereXdsZGP4yMlmrQ7o0Y3BRNJgmQzHsjw8TlOXpbaLmymCB44lFILbIcXLQ
         FtmmAQ/1TmcRfITZQrwVHKj6jozumEHuCuTo/SxH8F40vl3xsBssR04h20NDJvdZOBi/
         mCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408863; x=1725013663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCeplELLLeiitcqgFPRs5GSflnURqy8in4V3Us1wY+w=;
        b=vC0zcneFQsvS3+VhM/lERUuSBr0isNgoucqk+EeGQz4goKO3rhlqt9nyOGdepcNoCC
         tysmgpBj4uPHITw2XySDC7uUFYXuicHG0A4VNKDHwGNxdzkn48Y0BMl82+p3E4DRCpTC
         npY7O+G7uGaOzTAr34TL/DFTm1oL7oPAk0w8w7syuLz5bYXtvAZwhCK9CK7J+mbeHyI3
         rdZXaXz1xjKaJ5If7ltJuczXGvPy4Amvpidd3C6LS9sxv5ZQg6kgpiT/pD/AjEDZNLf5
         WIn46fBOxEf/6f64oPjoaxB1i3DHieLTOydLe9cd5xq5VgHZ/sviLnbn46Be1PLSpxBm
         PyPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoB+4c1+dy6bvNUBBTUyGXHVK1tfVmVCIsbEzIIouvhmKXRJoB+0k6Gx0I7wbHQR9gGHDhwBATrkaMPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2xA8ie+t22FYEX0a2I3wsb9zazlZcwHLtp24+CpOWwa1J7uJC
	/Vq5yuMkrqje0R6GGOF+/erRUgFkL8Vjg7u7lWFin3z+1JaX2yBFeuW4PTuDGsZ/Us+ojC3Q1Wm
	G4C0=
X-Google-Smtp-Source: AGHT+IHi4gWkeo6N+GlWFmMIkV/0UQJbJ+PFkaW5dUMWp8wa2Fa+Ci8FiQc6/0jqjsd3e3DDPhkrOA==
X-Received: by 2002:a05:6512:3ba7:b0:52e:9b87:2340 with SMTP id 2adb3069b0e04-534387be0d3mr640917e87.6.1724408862641;
        Fri, 23 Aug 2024 03:27:42 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5d220sm504669e87.183.2024.08.23.03.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:27:42 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 5/6] media: i2c: og01a1b: Add management of optional reset GPIO
Date: Fri, 23 Aug 2024 13:27:30 +0300
Message-ID: <20240823102731.2240857-6-vladimir.zapolskiy@linaro.org>
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

Omnivision OG01A1B camera sensor may have a connected active low GPIO
to XSHUTDOWN pad, and if so, include it into sensor power up sequence.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 766740bd04c1..90a68201f43f 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -5,6 +5,7 @@
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -420,6 +421,7 @@ static const struct og01a1b_mode supported_modes[] = {
 
 struct og01a1b {
 	struct clk *xvclk;
+	struct gpio_desc *reset_gpio;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -981,6 +983,9 @@ static int og01a1b_power_on(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct og01a1b *og01a1b = to_og01a1b(sd);
 
+	gpiod_set_value_cansleep(og01a1b->reset_gpio, 0);
+	usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);
+
 	return clk_prepare_enable(og01a1b->xvclk);
 }
 
@@ -991,6 +996,8 @@ static int og01a1b_power_off(struct device *dev)
 
 	clk_disable_unprepare(og01a1b->xvclk);
 
+	gpiod_set_value_cansleep(og01a1b->reset_gpio, 1);
+
 	return 0;
 }
 
@@ -1031,6 +1038,13 @@ static int og01a1b_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	og01a1b->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						      GPIOD_OUT_LOW);
+	if (IS_ERR(og01a1b->reset_gpio)) {
+		dev_err(&client->dev, "cannot get reset GPIO\n");
+		return PTR_ERR(og01a1b->reset_gpio);
+	}
+
 	/* The sensor must be powered on to read the CHIP_ID register */
 	ret = og01a1b_power_on(&client->dev);
 	if (ret)
-- 
2.45.2


