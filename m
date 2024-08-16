Return-Path: <linux-media+bounces-16382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C92E9548CB
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7171A1C22450
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE531B86F9;
	Fri, 16 Aug 2024 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IqFnCpGA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81FD1AC425
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811527; cv=none; b=eevnPdgpjHghVrTKKEt40u1WhFRu43DxHY8oYB7Z/ok+17k48N2xDh8oBhS8EI6YrqaQ0JrVEC0RYTlBE3GzPM6RKyL4rLwg0JO4r7qLBeNj6EQb7fBxsCRfBnto1Y/YPvGstcDosu6JrPARq15g22nD+iOs1X79z3SH44gxXwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811527; c=relaxed/simple;
	bh=/6WcXSLwFpxkzdTierJx9NQnI7bszU0POONTE1m0oX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DVqaX3GkCtRS/DWGoNmuP7g9fZV/7lY0jGSXxCrQBPG0THuNeyFqtwG+Xs0FPRPwwRpyiLniDZo+fuVVCjcugXWrh5JxKpBQDhvBxmMKSgpSoGisRYhN3ZxUr8Tghltz2uAvBoDdxyJlVREeHKCKBUsAG5GXt/3YvZlikdqcpq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IqFnCpGA; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a1d984ed52so125825885a.0
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811525; x=1724416325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfdvYEITLctEiJZFaHWRY9JyibDLYc0ZAVB9q9sxkkI=;
        b=IqFnCpGAjZieWm+d2U018WgTAp9eNP3PcJzwfE4Wwej/mDkSSNwXVOE14/njNEIb/X
         hMeikCmHBn11tMrR3S8rOhn280jsSPnnceAUotJQD2i0ar8RC7gOu3/gSZnNSK2BeinN
         BKo/AL3SxsWfYB5vAdgBlRxfoablys9fEh1pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811525; x=1724416325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfdvYEITLctEiJZFaHWRY9JyibDLYc0ZAVB9q9sxkkI=;
        b=Oee8IyzpvV/wOJKEJI1/BZh3nhtwMhBXWvGn9HQOL2bvn9Y1O7WajzsR0J9SvR6nW+
         XpKlI6SPgaxiRwsUpSCncJbLpnOfzXBhI5YoV2y45Mw/FrxC3YTzTnv+hWahfB5CdkXL
         dxlLmQnFG1b4S8sFWj9tj/8+kPCzO+x9ZbDG9VLFEUInsw2KxQN7CUgtuevth/xAP5qH
         LfxGrrMG7QtxGbrRYAMj1SDStFYl0LKVaP9VNRSUIjrQrVelb88kxs5t7yFi1IS7SQ6n
         +ASRxLU+agHSBQ54Fvwsfpl5wpBv1tFWH0MD2yQ8kRl2RqBFg6/8uVVv5D7XgIRHylxl
         8CxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVwTJMTzxIr4hL77FqZNVOU3r3+VUMutNForOOFFmyqKoElE4L8dEocarrBE24c9VwEUg6EnJ3HSMflg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCLi50nd8NUoSvJPwW9Zr2YTlbpcBXWyBZnwqNIf0Tp6XHJuDx
	AyMb8hhxEZREWt966hBFk0uV87W8WSMiXM3aFgzgPgQkMlK2c5CcyVPIBQk4dztLS/KgRryLINt
	8IQ==
X-Google-Smtp-Source: AGHT+IEykfMYCYnAHIqKejoI5UsxnxEpAhtpapnpWCBE4rLm0ZmyJu5Jr8Cmioy5du0vYTkAoMT82A==
X-Received: by 2002:a05:6214:4520:b0:6b7:ae86:e33e with SMTP id 6a1803df08f44-6bf7ce59f5cmr23889246d6.37.1723811524592;
        Fri, 16 Aug 2024 05:32:04 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:00 +0000
Subject: [PATCH v2 2/6] media: i2c: ov5645: Refactor ov5645_set_power_off()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-smatch-clock-v2-2-c63105db07e8@chromium.org>
References: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
In-Reply-To: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Factor out all the power off logic, except clk_disable_unprepare(), to a
new function __ov5645_set_power_off().

This allows ov5645_set_power_on() to excplicitly clean-out the clock
during the error-path.

The following smatch warning is fixed:
drivers/media/i2c/ov5645.c:690 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 690.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ov5645.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 6c2d221f6973..0c32bd2940ec 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -635,7 +635,7 @@ static int ov5645_set_register_array(struct ov5645 *ov5645,
 	return 0;
 }
 
-static int ov5645_set_power_off(struct device *dev)
+static void __ov5645_set_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov5645 *ov5645 = to_ov5645(sd);
@@ -643,8 +643,16 @@ static int ov5645_set_power_off(struct device *dev)
 	ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x58);
 	gpiod_set_value_cansleep(ov5645->rst_gpio, 1);
 	gpiod_set_value_cansleep(ov5645->enable_gpio, 0);
-	clk_disable_unprepare(ov5645->xclk);
 	regulator_bulk_disable(OV5645_NUM_SUPPLIES, ov5645->supplies);
+}
+
+static int ov5645_set_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov5645 *ov5645 = to_ov5645(sd);
+
+	__ov5645_set_power_off(dev);
+	clk_disable_unprepare(ov5645->xclk);
 
 	return 0;
 }
@@ -686,7 +694,8 @@ static int ov5645_set_power_on(struct device *dev)
 	return 0;
 
 exit:
-	ov5645_set_power_off(dev);
+	__ov5645_set_power_off(dev);
+	clk_disable_unprepare(ov5645->xclk);
 	return ret;
 }
 

-- 
2.46.0.184.g6999bdac58-goog


