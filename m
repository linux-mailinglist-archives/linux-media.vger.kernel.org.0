Return-Path: <linux-media+bounces-14934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1CC92EAEB
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 16:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DCB31F205A8
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 14:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE77A16A949;
	Thu, 11 Jul 2024 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JzLAs8FZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FB55477A
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720708695; cv=none; b=nbZmq0EUGrOHjyLghNmcYrACP3pQSw24WtUrTKwv+SJlN72Gz2qANkiLNLEWVZN3aP/c7t30IUIFvouYbJmXH6uGKWh56GQlVSPOMaBSTsNNsnD7kKweFYBVVdn14o3jWEdlIzaw8dHKnJGJnUxj17snrnfHmDQzfMtCFJlSL64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720708695; c=relaxed/simple;
	bh=+cdTiP9dj8e8SJZXEgF4LtTRbK33298paImQMDs+2bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tVi6GUDvx263U9+nz++x//EJWUHU8IRFow8uRnoOoG/ODDPfbpsncquUY2A0d39twMizykIEUzwlAA8QJ1mjGYX88Kp14IdFjhrtmrLZDrPQA3kkYd5NXRbG26rtvGaqW2dAfQowyT6T2r/ou8+YymdMdZTGjCEyqViuRdlQwO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JzLAs8FZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4266ea6a412so6983065e9.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720708692; x=1721313492; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/2rQG6qusYOLdxsnhVJWh4v91MMJIJgP837QrDDHJw=;
        b=JzLAs8FZ7xKcpH/1wtDndzz4x6NMdZrF24ClTaJ8mvWLBomiG5fwjH+eG5k2hPxQVA
         FIvOFT7cAmCwsRga0p2x5/KjLHdc8iz7VGY9ZmskaDlUGx4RqngUXq25uAnVWTPXBbJb
         WH+WvpF5QLOW61gG0+rCDmq6Vl1kbab/pBI+kuTCAdybmPbHlCSOtLLErKdMyT04msvu
         ZT7jhZO8wjJ49Lvb5mvxRlRhp5hMdwp0G/l1zOiCTklP0pwAyTk+opB6XkIt0iemLyv1
         eO5tyVdGRCPSO5IiQC791SgTeskqiCriPq75XnmnVCnv4PiFBHvuMPumcrRyaHY4ORvP
         hALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720708692; x=1721313492;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/2rQG6qusYOLdxsnhVJWh4v91MMJIJgP837QrDDHJw=;
        b=wpgHsYOTuLDxUwAT7W6Fb4bAcEANT0FAjSq4JQMr95y0HVYJMdYVMVpYaFBZuOshNj
         /psV9fzTTMRIBpuQWzGiYyKgqX3tOrTp1vb8umEgyo7r63szyiIjNFr4I5TuFsMfpEIM
         qPduzqQdxGCGr0bCaNnddsrVJyStZjlWYea2b7tAY2Aizl/2CFVdnCf68liK4bR0IBv0
         wwOPSXH7rwibVdj8S223Jrq4MwSSR3kP3s+xqofR5/SaHW5ZZrBeJMnIo0RVzYG6CTWh
         CEDmP0HcJkpwbQubl5j0AUpFQbDl4/85i0J75yz2njXSz8hgaX2KEIKy8YW4BYyeBcAS
         p3bg==
X-Forwarded-Encrypted: i=1; AJvYcCV5KOcnAVS0DTBgK34e6aRTgDKW1wHZMXL9t2QB3ChTlg4oU31wBzsnwcru4ZFaNdZshLvz80XJNXdczPPytM35nEy2eKX5cJI/1Vs=
X-Gm-Message-State: AOJu0YxSg1l35eeX7B8K67KGmquRPntck1+oMxdCgDzUQ/JIOdn3NJOb
	hrDyga8VDqAQqCmT6t6gr+P947zsIAJjnvJiqgEZ4h0URCp0vLltEOL/8R800LM=
X-Google-Smtp-Source: AGHT+IF/y967rQpaUTsEREkfcgiae6YzTKeupAxZjzOFwtIOuVn9rQDGqFXfgMTOw6/tS3NrmM6HCg==
X-Received: by 2002:a05:600c:48a2:b0:426:5471:12e2 with SMTP id 5b1f17b1804b1-426705cf0f1mr63758805e9.4.1720708691703;
        Thu, 11 Jul 2024 07:38:11 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f1ff9sm121535355e9.18.2024.07.11.07.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 07:38:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 11 Jul 2024 15:38:10 +0100
Subject: [PATCH v2] media: ov5675: Fix power on/off delay timings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-linux-next-ov5675-v2-1-d0ea6ac2e6e9@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFHuj2YC/22NwQ6CMBBEf4Xs2TVtkSKe/A/DAeoCm5jWtNjUk
 P67lcSbxzeZebNBIM8U4FJt4ClyYGcLqEMFZhnsTMj3wqCEOolWCnywfSW0lFZ0sdFtg1qMgs6
 1aetJQtk9PU2cduetL7xwWJ1/7xdRftOfTf6xRYkCdUfdqI1WRupr6QzeHZ2foc85fwC89Q9zs
 wAAAA==
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-13183

The ov5675 specification says that the gap between XSHUTDN deassert and the
first I2C transaction should be a minimum of 8192 XVCLK cycles.

Right now we use a usleep_rage() that gives a sleep time of between about
430 and 860 microseconds.

On the Lenovo X13s we have observed that in about 1/20 cases the current
timing is too tight and we start transacting before the ov5675's reset
cycle completes, leading to I2C bus transaction failures.

The reset racing is sometimes triggered at initial chip probe but, more
usually on a subsequent power-off/power-on cycle e.g.

[   71.451662] ov5675 24-0010: failed to write reg 0x0103. error = -5
[   71.451686] ov5675 24-0010: failed to set plls

The current quiescence period we have is too tight. Instead of expressing
the post reset delay in terms of the current XVCLK this patch converts the
power-on and power-off delays to the maximum theoretical delay @ 6 MHz with
an additional buffer.

1.365 milliseconds on the power-on path is 1.5 milliseconds with grace.
853 microseconds on the power-off path is 900 microseconds with grace.

Fixes: 49d9ad719e89 ("media: ov5675: add device-tree support and support runtime PM")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
v2:
- Drop patch to read and act on reported XVCLK
- Use worst-case timings + a reasonable grace period in-lieu of previous
  xvclk calculations on power-on and power-off.
- Link to v1: https://lore.kernel.org/r/20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org

v1:
One long running saga for me on the Lenovo X13s is the occasional failure
to either probe or subsequently bring-up the ov5675 main RGB sensor on the
laptop.

Initially I suspected the PMIC for this part as the PMIC is using a new
interface on an I2C bus instead of an SPMI bus. In particular I thought
perhaps the I2C write to PMIC had completed but the regulator output hadn't
become stable from the perspective of the SoC. This however doesn't appear
to be the case - I can introduce a delay of milliseconds on the PMIC path
without resolving the sensor reset problem.

Secondly I thought about reset pin polarity or drive-strength but, again
playing about with both didn't yield decent results.

I also played with the duration of reset to no avail.

The error manifested as an I2C write timeout to the sensor which indicated
that the chip likely hadn't come out reset. An intermittent fault appearing
in perhaps 1/10 or 1/20 reset cycles.

Looking at the expression of the reset we see that there is a minimum time
expressed in XVCLK cycles between reset completion and first I2C
transaction to the sensor. The specification calls out the minimum delay @
8192 XVCLK cycles and the ov5675 driver meets that timing almost exactly.

A little too exactly - testing finally showed that we were too racy with
respect to the minimum quiescence between reset completion and first
command to the chip.

Fixing this error I choose to base the fix again on the number of clocks
but to also support any clock rate the chip could support by moving away
from a define to reading and using the XVCLK.

True enough only 19.2 MHz is currently supported but for the hypothetical
case where some other frequency is supported in the future, I wanted the
fix introduced in this series to still hold.

Hence this series:

1. Allows for any clock rate to be used in the valid range for the reset.
2. Elongates the post-reset period based on clock cycles which can now
vary.

Patch #2 can still be backported to stable irrespective of patch #1.
---
 drivers/media/i2c/ov5675.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 3641911bc73f..547d6fab816a 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -972,12 +972,10 @@ static int ov5675_set_stream(struct v4l2_subdev *sd, int enable)
 
 static int ov5675_power_off(struct device *dev)
 {
-	/* 512 xvclk cycles after the last SCCB transation or MIPI frame end */
-	u32 delay_us = DIV_ROUND_UP(512, OV5675_XVCLK_19_2 / 1000 / 1000);
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov5675 *ov5675 = to_ov5675(sd);
 
-	usleep_range(delay_us, delay_us * 2);
+	usleep_range(900, 1000);
 
 	clk_disable_unprepare(ov5675->xvclk);
 	gpiod_set_value_cansleep(ov5675->reset_gpio, 1);
@@ -988,7 +986,6 @@ static int ov5675_power_off(struct device *dev)
 
 static int ov5675_power_on(struct device *dev)
 {
-	u32 delay_us = DIV_ROUND_UP(8192, OV5675_XVCLK_19_2 / 1000 / 1000);
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov5675 *ov5675 = to_ov5675(sd);
 	int ret;
@@ -1014,8 +1011,11 @@ static int ov5675_power_on(struct device *dev)
 
 	gpiod_set_value_cansleep(ov5675->reset_gpio, 0);
 
-	/* 8192 xvclk cycles prior to the first SCCB transation */
-	usleep_range(delay_us, delay_us * 2);
+	/* Worst case quiesence gap is 1.365 milliseconds @ 6MHz XVCLK
+	 * Add an additional threshold grace period to ensure reset
+	 * completion before initiating our first I2C transaction.
+	 */
+	usleep_range(1500, 1600);
 
 	return 0;
 }

---
base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
change-id: 20240710-linux-next-ov5675-60b0e83c73f1

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


