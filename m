Return-Path: <linux-media+bounces-16195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6AB9504A7
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 14:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DF881C22FD8
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A99199EA1;
	Tue, 13 Aug 2024 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NnIzU98n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE1F199250
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 12:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551234; cv=none; b=k6K0VZ2gFWl2nXcrT6Sq6zS/ZejJQCu/RZGodd0dfGwO+JSBst8+P0Vy2csae6QHgoNaY8Bp/PPZ4bjlfUvjZEVaXz086k7Rm3AX+boZB28qHT7K/eyuw/Dk9ribYC8V3OWgy3bIK4q/Edw9dXDCEfJhhk/XqVh8nzt1yMQAGAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551234; c=relaxed/simple;
	bh=m5XHSgRo8F8WjUA+xwLRz6jjxaEE3qje9U5hDygSCPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvdIpFfLUZ72lHrH4yjf0i2z8FM4FvF69bfORQoC9zsaRfCb5sSRHfLKVgqWd7a6xxEWaPJFRV231inW9CF9yevLQ0QA9q9vjjRNkT/85te7LOdvVCDAGiCGOT3TV7ktuuQPe0CeQ2QgMzP7E3ZTpIw+LpO352/7+IsMMqILByE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NnIzU98n; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a1dd2004e1so337971485a.3
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551231; x=1724156031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NN4I3pMa1z6u3JhFybH/YMr+WwEfsG16l3i3ACZ6OI=;
        b=NnIzU98n9usdqMARhJaHFWnNolZkXw26IDzbHeoG5B7YyN0PWOcS9L5BpW4Pp/7auz
         52cS2XhOE9rF10zd0rpeT443ZXJi9T8UcHr2GejupbfT5CDmiafZLAUM+T9uIGKPNhH8
         sTlMcitR5WIFfnZl7RvWKbuTHXB4zG1exPgtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551231; x=1724156031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NN4I3pMa1z6u3JhFybH/YMr+WwEfsG16l3i3ACZ6OI=;
        b=FyBL1D15TekOo08ON6YluRwDl51CYKPom+/xSiULADjbl9miLNAqiudhO90exmCfxH
         pTibHUKo0T7k2AsYmvNVhr3kd84AEfV0KJkE4im/NWxqw63MtUcqTEO8S0Nk3K2PbynP
         h7W6f/af6uDpu9re9YwDD38TeUx6qeLtLDBx5kAc6NIRb9ySuXFsV/NZA9N+MH3gWBPH
         VaQcZ5yCoEUgPJNLxF/xW+VGT8Gri5+OOvaQEAxPDSBOXE39AuwIkWGoAKcpY0V1Y7+8
         7QnPXhzDHOoa8COFBTSXzWPcvcSaMO3f6LbSWdK7VzLuXvWohNACWcumop3Rr6QTjzKZ
         qFAA==
X-Forwarded-Encrypted: i=1; AJvYcCXAH7MY6VPR+qJ+FgeyXnaOj82hMNsJCd4lSDoNMJrXD2bcCFuXIJTS6Vu4fVU+sJpKNo5ohZzbpcI/LSwd8gwVZvFLyW5dOIpWRw0=
X-Gm-Message-State: AOJu0YwVXPMaI7uKOCC0BTmQbQW/C8+KhJ62l+ncUhhtY8h0+n8ePp7p
	FME/+MS0SM4PJNMCihbnXdlSHPg9aUkVATbBkZ/vqQRQowYwEDF9mCI+iBOAPQ==
X-Google-Smtp-Source: AGHT+IEbzzCLxiIWDetpY/N6kglqi3rroSN+bG6y6yQxlctkjM/b9mCaiLCXSWS8MVpF1YKtj23MkQ==
X-Received: by 2002:a05:620a:4451:b0:79d:76e5:be76 with SMTP id af79cd13be357-7a4e15afa64mr377756785a.41.1723551231504;
        Tue, 13 Aug 2024 05:13:51 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:49 +0000
Subject: [PATCH 2/6] media: i2c: ov5645: Refactor ov5645_set_power_off()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-smatch-clock-v1-2-664c84295b1c@chromium.org>
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
2.46.0.76.ge559c4bf1a-goog


