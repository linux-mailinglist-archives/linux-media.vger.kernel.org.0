Return-Path: <linux-media+bounces-16381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5529548C9
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92DD81F24534
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33E21B582D;
	Fri, 16 Aug 2024 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n8mSQ4n/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DC02E859
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811526; cv=none; b=S+okqHHN4Mh2JBtsLfqfkd3TRovvEI+DS3phaUG7p/ptskDsRjGOEWrMmkL1r6aV+CD+uYYYupRlj7f7Q5+0BQqmE/L3atNsKF23QzqGTRjis0L9NJfJ9xzsEbTawa/XH0b4yphotPT2of4rSBQdz2X+7DG/4MeN3pLrfrOUrY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811526; c=relaxed/simple;
	bh=gLudReYyvC4mUmRJU8EVa/JKuPaZK02zBMk37qmw3do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WrPk8JhcSNT8BUwkb2PSU/DuDR2I5IHMWZcPIdkOBqbVyalOQN+tqvEVUJqzldw1NJ3w87135l/oYTSuzHLaEFhG4BfoFfW78AbEoYYv5qHh6gr1OgwnKhXZgEY4URnvx82RkSQ2suoCwh4ykSu2hx8R1frezlXch4WYO02yFyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n8mSQ4n/; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6bf7f4a1334so2804826d6.2
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811523; x=1724416323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16nB20lne5nZUXu6hYGLNV1RBZ9sfyRh8sah/xieHmI=;
        b=n8mSQ4n/7LHiSKhajLsfcX9t+rzuq3sgpKKfuRDclRSNYE+bbvXLaOvp2htsE1D5wV
         Nd/lTvMe75sE4onL1OIMAoREpAqmySL5Ruqga/ygnm29GHRNxBCWASFKYQ6jFJlM8lJs
         YCVL7q4j1eh12ivt4r9YHNJHmKyr1/uFZnU3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811523; x=1724416323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16nB20lne5nZUXu6hYGLNV1RBZ9sfyRh8sah/xieHmI=;
        b=Wr4od/spzWu8g6BplGF7awJZnRMfgsVYd38sPvt7BdBKWziCV1mE2YuU7KQ3RTrJSR
         boOqkfd4Nmhy0OjpTTZR2fCdQcFmRGKQQDZFmD78+mLXdwEJDw750478fYkfgtLhsZzC
         3Z4IBBwy0lyPAF/Kt25W+yZ1bCRXghRLmPcSqa9jtAxriTGVID0lyIjq91Ga0iX01C84
         1ai2lf0+DvYaag8NzARH7EvAkx9/+pisMX9waiM0naA1eih0CXX/cV+ltvAhECXo1RPI
         4RVZd9pifSyzshRnGKEdV7r41C2M6jLA7QMV5CHUiNnVCvW45aXX8Z0em0CFXlLli5Ts
         MTOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX4Cdb3TE8TL5CaOhHesWFKYkaYJEYQhEpHR8hLcMMWaAXR/wJ3DjMDeH3x78OU2lIaGnPFswFclv02XPqej1Sm+WFAQo8AX6ut8s=
X-Gm-Message-State: AOJu0YxkxXl+W6VVSjFKRPeARegjq4EePn6K2pC0IGDIXBMdM6dNg754
	Wq+SmokcoqcP/SIkg0ziX3Mi8tfnZaPJ5XLxKb5bfu+Oj6ooyI349HarYYtqyw5vYGuiMXaVDz1
	rqA==
X-Google-Smtp-Source: AGHT+IEc/DNqda2J9XQ7o/We+y3QlRxp9UtmD1+ZU6guILT/Q3NfuJJCxXcnUIyCC+eWr3aG9Ceo3Q==
X-Received: by 2002:a05:6214:5892:b0:6b4:fde8:8688 with SMTP id 6a1803df08f44-6bf7cebc8d0mr28626046d6.53.1723811523632;
        Fri, 16 Aug 2024 05:32:03 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:31:59 +0000
Subject: [PATCH v2 1/6] media: ar0521: Refactor ar0521_power_off()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-smatch-clock-v2-1-c63105db07e8@chromium.org>
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

Factor out all the power off logic, except the clk_disable_unprepare(),
to a new function __ar0521_power_off().

This allows ar0521_power_on() to explicitly clean-out the clock during
the error-path.

The following smatch warning is fixed:
drivers/media/i2c/ar0521.c:912 ar0521_power_on() warn: 'sensor->extclk' from clk_prepare_enable() not released on lines: 912.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ar0521.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 09331cf95c62..56a724b4d47e 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -835,14 +835,12 @@ static const struct initial_reg {
 	     be(0x0707)), /* 3F44: couple k factor 2 */
 };
 
-static int ar0521_power_off(struct device *dev)
+static void __ar0521_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ar0521_dev *sensor = to_ar0521_dev(sd);
 	int i;
 
-	clk_disable_unprepare(sensor->extclk);
-
 	if (sensor->reset_gpio)
 		gpiod_set_value(sensor->reset_gpio, 1); /* assert RESET signal */
 
@@ -850,6 +848,16 @@ static int ar0521_power_off(struct device *dev)
 		if (sensor->supplies[i])
 			regulator_disable(sensor->supplies[i]);
 	}
+}
+
+static int ar0521_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ar0521_dev *sensor = to_ar0521_dev(sd);
+
+	clk_disable_unprepare(sensor->extclk);
+	__ar0521_power_off(dev);
+
 	return 0;
 }
 
@@ -908,7 +916,8 @@ static int ar0521_power_on(struct device *dev)
 
 	return 0;
 off:
-	ar0521_power_off(dev);
+	clk_disable_unprepare(sensor->extclk);
+	__ar0521_power_off(dev);
 	return ret;
 }
 

-- 
2.46.0.184.g6999bdac58-goog


