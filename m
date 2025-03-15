Return-Path: <linux-media+bounces-28312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CE1A632A9
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 23:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFF623B0EA8
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 22:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B18E1A315F;
	Sat, 15 Mar 2025 22:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZAuGh24m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57B91898F8
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 22:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742076592; cv=none; b=B7h994qnUFNz17gU1YQVUOjVnmnWQdAfvolNwErMFx/VZPivbkpJBu/1SuUiou+pGHlLaumsk4Nm99M0QIWjndt1p3AriFSB0uFBIPXWKjCyKg+S8XKVC5RLBtPHKNVDPFD7w5zeLiaQJvnvBhhucLKQdtmE/ZsmbNwvfMLGi2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742076592; c=relaxed/simple;
	bh=WYI59d5n1WEwqMOajV/6YVstC1dWvyjrnAvSU9/Ufgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJ23fuogSCHoFnEOw1+xCbuFeEwi+LNiEcUKFrsPPgYIWp49tkZ02N9f749jmkWdyHMUugZ/QoBsFqXB0zDWphJmU0RP3KeztbpcQEbPyxwZxUZ0GxZ4lZQmzA/788Mu1+W/jQuDHw8uFYjKI2OYCeUyKPU6y6+CGlfVsZfkI64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZAuGh24m; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abbb12bea54so668674166b.0
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742076589; x=1742681389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zozZR5DVYnV/f4VJnel+bk5Rhw59JpPBOweW3T6f0wo=;
        b=ZAuGh24mjV9aY31lq8XJojLPgTDTwJualUfd7yDjaVcwYVenvNLKt4zX8NQy6SIGea
         J6qt0+rsQI68Hhkf0Oz3Jih1RxifzU/p+szbzJvumb4zbqRJn9gQNzKwNLmZXFb7eHme
         ffhjEihCPYpHRpEmsVq0j5yUsD+8E8fx7R3fGirIrynk+nupYCMt/ydCoBXCBjiAlKOU
         uTO0dAWIdzIihUeu1HNwP8ZyEhyPQbNZ6fHi0kMEZhhpkPaIbuniuYRJEz4MFEgLR9vB
         vC1+UTaVKu1nzYaaW0HC3bylcmF+JzWts4x4HJLof0fTuupAnSiDLUDrr3THPYMzlbjT
         spWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742076589; x=1742681389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zozZR5DVYnV/f4VJnel+bk5Rhw59JpPBOweW3T6f0wo=;
        b=i6wzXMLFX3XK7BYunbthDe5gCOV2/yTzEMb/ouXWQRWBO1YalFwrGSIk4MKMzsifVu
         bRb1d1OsaN0WSZ4eSbKy/lPLgZ4ZboaWeqiW7vCTyrGZ2/2LQW811A8/H57updvdmPiY
         6AHcKeKHDdTVuy9HeetHko3KwAm1FOU24Y7JoG5xkGuE8P9ClQ9WF7QhH1cbANO1CbZo
         mttQH+ZVxBJyFhtQXoifj/ntvkP8jqoZW2ch5OtGyaarJxPkBasCRWC+s+6dDWjJOfpz
         1sjODGvPm57MeLHbegVbmFoddr53ASf5lm1wkNuqhTF1ExDaahzaxzHcO2sKhjRuYsPX
         EgDg==
X-Forwarded-Encrypted: i=1; AJvYcCUEesG8/aUK1TGms+sf60n/soQ1E2Deu6Pc3AtU8+q5f2hDgUpuih92L4uW+YTXaevrztUttVGFuqB58w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl0BT9Q5HdlgGOLnHkQYaW7hZYxUFv6OziHO/jHvBJYTnRKODD
	EghcSId/VysRt66xhHcyPcZqcEBjk27AC5nam3AyrSg7rm0436Jv1tYflg30dz8=
X-Gm-Gg: ASbGncth/RNUB6vOWevfTwr1hnDwn3Bj5Sd4D1bL6ArPIv9QOmAXrpOGSO0rfjJSCxw
	D8cspuK2eKkdusKIE5JjZSilvjoRwKYd4UqCusR64cMMN+kSghHSw9nBZPgKhPBrTSv7Ng/SQ9i
	rFkTAnamwc8YSHcK6rBdb56wdOktfXgLb5T/PS1WPRZgHMk1imfGTZfBr63d6oAKLf6/zMsVxSL
	CVj5j52C759DUN8HYcK/Y/I8G1foBj6OrmkA8cHOG2hZN+i5i8lBaFz0MoDg/ddfgEFYhb1GpMs
	qwDqQGXcH37Wz895RHfOd1ymatMchmFgEl7H7eceB6Jo0CVOqOyToAQD/a57dKg/vT+Ot1TBr8V
	bV903cE+AC1XhNt+ksA7sK+XtJo2fLbuqM/h+huAPuQniYvzElYZLPyxzyZr81kZsvoYDtCylfQ
	==
X-Google-Smtp-Source: AGHT+IHeJUFseOz5p/V+5B1G/bveuEBrJNXK3pFEt8U/AlEgmbUBUWp/lAA74SJPV1MChatwm0+NIA==
X-Received: by 2002:a17:907:6093:b0:ac2:b6e1:b26b with SMTP id a640c23a62f3a-ac3301e8e91mr817224066b.20.1742076588859;
        Sat, 15 Mar 2025 15:09:48 -0700 (PDT)
Received: from localhost.localdomain (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816afdfd0sm3833911a12.75.2025.03.15.15.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:09:47 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: hdegoede@redhat.com
Cc: sakari.ailus@linux.intel.com,
	heimir.sverrisson@gmail.com,
	linux-media@vger.kernel.org,
	stanislaw.gruszka@linux.intel.com,
	ingvar@redpill-linpro.com,
	hao.yao@intel.com,
	mchehab@kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] media: i2c: ov02c10: Get the OF clock rate
Date: Sat, 15 Mar 2025 22:09:36 +0000
Message-ID: <20250315220936.2477-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315134009.157132-1-bryan.odonoghue@linaro.org>
References: <20250315134009.157132-1-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to get the mclk rate specified in dts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov02c10.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 094651228763..236623b26da0 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -647,11 +647,6 @@ static int ov02c10_get_pm_resources(struct device *dev)
 	if (ov02c10->reset)
 		fsleep(1000);
 
-	ov02c10->img_clk = devm_clk_get_optional(dev, NULL);
-	if (IS_ERR(ov02c10->img_clk))
-		return dev_err_probe(dev, PTR_ERR(ov02c10->img_clk),
-				     "failed to get imaging clock\n");
-
 	for (i = 0; i < ARRAY_SIZE(ov02c10_supply_names); i++)
 		ov02c10->supplies[i].supply = ov02c10_supply_names[i];
 
@@ -840,11 +835,22 @@ static int ov02c10_check_hwcfg(struct device *dev, struct ov02c10 *ov02c10)
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "waiting for fwnode graph endpoint\n");
 
-	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
-	if (ret) {
+	ov02c10->img_clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(ov02c10->img_clk)) {
 		fwnode_handle_put(ep);
-		return dev_err_probe(dev, ret,
-				     "reading clock-frequency property\n");
+		return dev_err_probe(dev, PTR_ERR(ov02c10->img_clk),
+				     "failed to get imaging clock\n");
+	}
+
+	if (ov02c10->img_clk) {
+		mclk = clk_get_rate(ov02c10->img_clk);
+	} else {
+		ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
+		if (ret) {
+			fwnode_handle_put(ep);
+			return dev_err_probe(dev, ret,
+					     "reading clock-frequency property\n");
+		}
 	}
 
 	if (mclk != OV02C10_MCLK) {
-- 
2.48.1


