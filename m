Return-Path: <linux-media+bounces-16194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB429504A4
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEDE51C22E8D
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B8519939E;
	Tue, 13 Aug 2024 12:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FJkGtUgx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1549187348
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551233; cv=none; b=UuqA8L+TbjfxfqL5zXAe6XWc+I54CkcFztl50xCCiF2hdbKk56hp8aDXjrQJoqVzzh8x50KXpenNdVVDTVB6Vg4cuUCAWUI7w15YIn9HtKKW3TFBc0Qyj35ps0z56xBF6doLwNkBmCZJw/Knvzzu8/4u4gpi88mzKMKVy3AT93c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551233; c=relaxed/simple;
	bh=g+rNwochslFeeyi6Ofw/XN2e0QyEqWoJrguFWPehPrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHGuHLwHkYjyVMS7k9+PFCSlEU1MPRUIS4V/qGT9Z3ZehYzjktht/+Fd5gVP8nEsJlPtwiv3/5oeMmxg/gT71oJ3fYn27wLxgUHjox7xrjiFkOGjcLL2IOVrEM4heWgsJ65j0Kb7fKb98S8FxVip/f/yDXmZHP1HTy6fGmwfjGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FJkGtUgx; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a35eff1d06so333578285a.0
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551231; x=1724156031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2YaJNxhLs5F8lLYTx7H4r6rahb3C2THbGnEdQxh/xA=;
        b=FJkGtUgx8jqlftw8QTjDYEKtLyHy8f9YTd5QchYiWhdyy/JfMkuBkTjwL1crIZUAS5
         HtLarB/W4OKIThoR8D8o9Zae/kav761oIEJM7b/yirEuR9tQhWbkz592Q9bKQLdmgQ1u
         4oHAqvrrbX1veu3+e4o5vwveSlEKHnWD4pPsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551231; x=1724156031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2YaJNxhLs5F8lLYTx7H4r6rahb3C2THbGnEdQxh/xA=;
        b=wkXLBSUXgd2c8j+pNx+2WwldEE0EQaIy0zhWfpPotSWAKYTyCTnuT5JET4UMaKYrBy
         kp/Ov8b6RzJXUZTLjARX5HctNKKDiO3f0QaS7euL5CTjxnEAPtFKEvTvnH/iHR56yejX
         BPARLeeMY8XruB+DA4VqIK9TGjTNkw5kUDL1ccsbojevparFt1lWIoUVAZa1ZT8aYzFv
         PIAERmfFLs8neFCHuSIbtfAraYa8SzZ9eKE05Y6B4G6Fj2i3qSPBMz4PSSaLL6vScsty
         y8NZxZokor+14soNVOITJ50huIbLNhnuaJUhnvIGxPLSmGJH5z4eCxgUXGVd5tAdjd3W
         YBRw==
X-Forwarded-Encrypted: i=1; AJvYcCWhqchdFfUFyqxwl4gvIb7hddl1t96g8ikmD6QJMy+cba3iPQVsrImPZPoitD4iBMfvrYMruDq290jCfbvlbLKf/XVX1cTfSB6/kns=
X-Gm-Message-State: AOJu0Yx0ARl3oo8xo7cnoCm+I7lr8b5koW6Aq8O5w8gdxK4bKHQMucO8
	3KG5hHnCh8fV4Kha4HBqSaRtcTf82Jxxg8GCzAI6ifJ//OUj+PLFZ89QKpfXzA==
X-Google-Smtp-Source: AGHT+IEbPwywblqg1PHmJ6WOVqLAFdQNUuhFh7OmJ87lW/f5GlJN4YVEnCjKh12Gxxs2z0IijZihGw==
X-Received: by 2002:a05:620a:4109:b0:7a1:e2e0:b3c9 with SMTP id af79cd13be357-7a4e151ba74mr391481985a.24.1723551230715;
        Tue, 13 Aug 2024 05:13:50 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:48 +0000
Subject: [PATCH 1/6] media: ar0521: Refactor ar0521_power_off()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-smatch-clock-v1-1-664c84295b1c@chromium.org>
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
In-Reply-To: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
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
 drivers/media/i2c/ar0521.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 09331cf95c62..2c528db31ba6 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -835,7 +835,7 @@ static const struct initial_reg {
 	     be(0x0707)), /* 3F44: couple k factor 2 */
 };
 
-static int ar0521_power_off(struct device *dev)
+static void __ar0521_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ar0521_dev *sensor = to_ar0521_dev(sd);
@@ -850,6 +850,16 @@ static int ar0521_power_off(struct device *dev)
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
 
@@ -908,7 +918,8 @@ static int ar0521_power_on(struct device *dev)
 
 	return 0;
 off:
-	ar0521_power_off(dev);
+	clk_disable_unprepare(sensor->extclk);
+	__ar0521_power_off(dev);
 	return ret;
 }
 

-- 
2.46.0.76.ge559c4bf1a-goog


