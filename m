Return-Path: <linux-media+bounces-14994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E76BC9307B5
	for <lists+linux-media@lfdr.de>; Sun, 14 Jul 2024 00:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 681D71F218F9
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 22:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73830146D7E;
	Sat, 13 Jul 2024 22:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d70HG5kO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BBD132105
	for <linux-media@vger.kernel.org>; Sat, 13 Jul 2024 22:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720910013; cv=none; b=Nyv0oRHwR5bx3po/58zWneQszuQ6CTjJEUp1ezeJ6KsPonHKPeQPL56TrvGC4kgvoRDJD+21F3oH0HCO66t5yhpPMJwxIq0XsmNR97cNKkFmql0gkCaaQDkOZvqLA/RPHFE1dkr8o9TkPm2synIK00xzjlKjmOm3DiktUGX6xIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720910013; c=relaxed/simple;
	bh=3CXyrYSrmPb64WZII5vJE5PCpHH/1D0iX1ETEE6XCE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iUr9jf3WbDSAjQcPOi8ThfrsBRDW6BjZ0amTt4wKfVniZq35o7QkyFIdgcOqw/b0mc+uyykxbo/3Vx1Wqbld712Nr/VwE7n44YheUfjyO5/FmhyxoH3YwN0LPWDicEjlKlDPm5cAwkP4uTB8jcNJ7KNzqXOIH6eNzVq1eN+4CxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d70HG5kO; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52eafa1717bso3234797e87.2
        for <linux-media@vger.kernel.org>; Sat, 13 Jul 2024 15:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720910010; x=1721514810; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvEv4Gz0ta82e2qmUjNC9xU8qmNOnjV53fsNG0mOdZI=;
        b=d70HG5kOtDBLzNqiIPKuosLFTIFEjEQAdigLlph3iawkxcXiT5XNDCsunVIWDB8Uq3
         u+QkhS/u7pug/4r4wQPTSqcDJBOixJKwd/iHwaKC9mkN+SrQD9/afepgu+wCFUooRO+Z
         LzQUNk5XMizOdMrlGoTkUHZjyAygFSmZqoxXWctqUtQAgCV/Q00W4EQ0F3rloXv8I0C2
         nUr7Jghg8tpVVc1bTKtYdOnjSjonH3PFhP177TFY/PBQPlmU6fQfca/Pixq4KaiKoR8A
         azQ3/lf6/onucEyRyZ2xyHXJ1A0aEH3SObQ5cqliIBfLyyLQVJpeygbix90/KUE6XnB/
         XkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720910010; x=1721514810;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvEv4Gz0ta82e2qmUjNC9xU8qmNOnjV53fsNG0mOdZI=;
        b=AbfD+8aPwIGVIG1r42YFbq0uh+dEp3sHkJ0AlUnn8vIlALyhM6sAoHR0YXXhCUeFS0
         G7fOtSZA8wYH8QCnaN3QD9LzRq3jUmoaPObd91jnX40NtmZnb9m7esWw2D+aRPVb0cxn
         +kxodwzo4JVtrtduwHZdP7q57jSdhMzxfuUjZ6YcKx2nPX+RC5I/h+g03tOcKFTA4k9c
         +fDStPAmywHUb4q8K1D4d9JG/mpIsTcegofw9xCUiuNLN1XMJWnpd2vQuDVudAIp4as1
         mcy/0kc0OJnmYojp7bPnEhBHhCBCpHTP1XrzMNdg1r+7suLJzZE9GEIdCk6NcvKfjf2C
         7SIw==
X-Forwarded-Encrypted: i=1; AJvYcCXRmRXt+j29abndNR4WYP/ZNrGgOocFmK5ttuXwSirkv1mnZgLD8n2Q2zEUAa8mcZJR91Fb1IvXjFgQl6EBSWAbRiW1rtKoUf1zP7o=
X-Gm-Message-State: AOJu0Ywh6CzO5/qU19kp4sW4w/L1ksMA79Vty3ovM4XJc+9s3KiSJcYu
	MbDtQ9uWUKB7ozWBIZltq3N073H67x1aOnKspe5PhQyivYDZdT5SawSQFLcD+uU=
X-Google-Smtp-Source: AGHT+IHUkzJY8gJ3KS5kY/6nl7sWuA/rT6ok5vNO/3cnlv+sFkffPabRIlb5WJhlg2gt3YBk8Jys5Q==
X-Received: by 2002:a05:6512:ea0:b0:52c:e03d:fa33 with SMTP id 2adb3069b0e04-52eb99d4d27mr11720207e87.62.1720910009699;
        Sat, 13 Jul 2024 15:33:29 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368155f7891sm227401f8f.52.2024.07.13.15.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 15:33:29 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 13 Jul 2024 23:33:29 +0100
Subject: [PATCH v3] media: ov5675: Fix power on/off delay timings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240713-linux-next-ov5675-v3-1-527f5b985836@linaro.org>
X-B4-Tracking: v=1; b=H4sIALgAk2YC/4XNwQrCMAyA4VeRnI20ncucJ99DPHRdthWklXaWy
 di72w08CILHPyRfZogcLEc472YInGy03uUo9jswg3Y9o21zgxLqKCop8G7dc0LH04g+lVSVSKI
 RfCpMVXQS8t0jcGenzbzecg82jj68thdJrtOPJn9oSaJAqrluyJAyki55Rwd/8KGHlUvqL6FQY
 itYkzaKiesvYlmWNwmoRLr2AAAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
85.3 microseconds on the power-off path is 90 microseconds with grace.

Fixes: 49d9ad719e89 ("media: ov5675: add device-tree support and support runtime PM")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
v3:
- Fixed my out-by-one 853 -> 85.3 us calc and the 900 us -> 90us calc as a
  result.
- Link to v2: https://lore.kernel.org/r/20240711-linux-next-ov5675-v2-1-d0ea6ac2e6e9@linaro.org

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
index 3641911bc73f..5b5127f8953f 100644
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
+	usleep_range(90, 100);
 
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


