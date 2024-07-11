Return-Path: <linux-media+bounces-14905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA2F92E45C
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4FDCB21374
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 10:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4331159582;
	Thu, 11 Jul 2024 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AeDeOfgq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31A115887C
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 10:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693207; cv=none; b=RE+kvVLasN5FAmbu6ilvz0fJXdjKP8qmglhamSjWmZPoUKbgFWdNVuVUtVi0GF+1Gs1Hx2WD8aaE5EhFTJwfYj6GKyF79rJmgdxr2r9+4LjuWnqcfaApqcLgyvJPG6xHMmizl/13xZ5UBrmgH9+nX3hsXl1HIjJub89E3LXPhzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693207; c=relaxed/simple;
	bh=bKIdUuVmWv5FJkFDtu2H6clQsAHCUTFbn8+qyaw6hHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N6NU3XawD3fLsPPC+BiZGsqklsXtYYSyYgTlh/EQA0nWERhK/8i/cIGTwx6D1rVRfkcNNbeR4ITp+KvdnwbV8Mgf6KBKEmaJPB0hSjBHsFftIo17DTX1dM8AKiu0qG1DhcIzwb+/Zb5QdW8UR3JQv217jU9n1SZ01WeHsX+nXe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AeDeOfgq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4279c924ca7so35395e9.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 03:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720693203; x=1721298003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jw6bLyA4dVnYszcIqA96Q05ikE6tm67ysRPS44gZ2Bo=;
        b=AeDeOfgqmtP6YqYtgTpYNinb9oqMQl3i7j38vK4+io3o2BdQ00xqcjagYE4jzCULnB
         E4zK8QAZ7vgI18tg4Wl9bxBcVnzYW/fUdzoUskWQc+r5st4WQBPQ18QdyrnbNCK/CkK9
         9by3L7M9izvLBeYybfLp7EGrHzIkly9reeppj256TLUcJTas4KaaYGDeL6blF2Xj67po
         7JmFAm3A3hjbGCAd7Q45WmwhiU9R7cNAbVHuzPXOMnlorAPMeRcyY1KCUJmq8r2iA7vm
         Jmdj+/wNpcM5s0aaCWbWTgk2OVrKksnQfoAsrNXjLVa1Ng0pN2u+TS64yQ0ie+9HuytJ
         lUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720693203; x=1721298003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jw6bLyA4dVnYszcIqA96Q05ikE6tm67ysRPS44gZ2Bo=;
        b=Jw6ev/WrFlZjf73GPlzCavoVlW8KlbV3iEvAZVXT3RT7hO1Fp1LtfRjRT/jdGC+ia9
         gS/STO3VMq0Et2caiGpB9QiTij7zaVI7QZaL7ozO2A57ldqnYfiIEHPO1d02RGnOBT/H
         eqXe6Zlg/tF4+1A8WWkzqA+BFmR2gu0FrK/sR1cmXDiZZV9/uDNZvNrl4fzwZsEqBR8j
         kGzj+du3tIVbMv4oOY4pSCpSml1WSqKYWOa8CczvhLYsg2sVysfst/Fe9hwRK8xi5dnV
         StBsLNES2stGdfJv3XjsS9ytzNuRZ4jjaDkM62eGlVgGoV1P6YhCC4CRd8TtSS7tEhT2
         orwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF2z9XLRwSMXYyurjvy9j/pAoBX/nm0JF/0A/IHg8etp8i4+kG3q7jzfr+Gy/KEqLlq68b081WEkBQ9x1CcVBtR0w3kDQm+vepoS4=
X-Gm-Message-State: AOJu0YxRI0mcQc0G4WsOOj3gBcWG6qN73rwt+vDGgBx1URePWSrzEqKH
	GzgUltx4uGkabjd5Z4wLHT3b0nYRibSbjY6DCsrUDF9GguI/c3Jj2NT5GBOxAj4=
X-Google-Smtp-Source: AGHT+IEPG6ALVrKC0vxITNNnj0AxUU2b5IhohOK+zwxcy7Y2DoKsbVYQ4rwu1v3iMbA9+oXaQb0Gcw==
X-Received: by 2002:a05:600c:228f:b0:426:668f:5eca with SMTP id 5b1f17b1804b1-426706c6878mr52146665e9.7.1720693203327;
        Thu, 11 Jul 2024 03:20:03 -0700 (PDT)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266e861339sm125270025e9.12.2024.07.11.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 03:20:02 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 11 Jul 2024 11:20:02 +0100
Subject: [PATCH 2/2] media: ov5675: Elongate reset to first transaction
 minimum gap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-linux-next-ov5675-v1-2-69e9b6c62c16@linaro.org>
References: <20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org>
In-Reply-To: <20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
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

The current quiescence period we have is too tight, doubling the minimum
appears to fix the issue observed on X13s.

Fixes: 49d9ad719e89 ("media: ov5675: add device-tree support and support runtime PM")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov5675.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 92bd35133a5d..0498f8f3064d 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1018,8 +1018,13 @@ static int ov5675_power_on(struct device *dev)
 
 	gpiod_set_value_cansleep(ov5675->reset_gpio, 0);
 
-	/* 8192 xvclk cycles prior to the first SCCB transation */
-	usleep_range(delay_us, delay_us * 2);
+	/* The spec calls for a minimum delay of 8192 XVCLK cycles prior to
+	 * transacting on the I2C bus, which translates to about 430
+	 * microseconds at 19.2 MHz.
+	 * Testing shows the range 8192 - 16384 cycles to be unreliable.
+	 * Grant a more liberal 2x -3x clock cycle grace time.
+	 */
+	usleep_range(delay_us * 2, delay_us * 3);
 
 	return 0;
 }

-- 
2.45.2


