Return-Path: <linux-media+bounces-28325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9631A638F5
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 01:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EABFE7A5DF3
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 00:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF96574C14;
	Mon, 17 Mar 2025 00:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zb+n8QMq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3F438F91
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 00:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742171985; cv=none; b=GvjbC9CGbrA28G+mQKiEjhYJqskr3+BHCfF0hSvr2KFARdvo/Kx6/4roispieljL8iD4glNsUMv0ZGEDjhFBRt4lMPgsBf9tCqgl5u3jrWq9J0jjBJZJFr8JqRlXFrq0s+bjXDh3+VPqXFRjNrJoC717WO1n5Ag1/AaKWaK1naA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742171985; c=relaxed/simple;
	bh=3QrEKdTshQRi2xw4f5hCGvoDJjZMloAagBZBYMjysZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/7IJDAU/C171d+dYt6ME+TlKZYQ314f7m9vk919oTuHN3fI+qHaZGjDGTbpElahPDgxsRrQTw0nnPxKrQd6U9+RqS9tIEBt1/PrxVd9ysVy1HAMZ6iBm1TWckGdMl7jj4ZBlxJudmRvZ/CIVp9G7zsHj32zVvRsTPr1UFuKQd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zb+n8QMq; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5491eb379so5818242a12.3
        for <linux-media@vger.kernel.org>; Sun, 16 Mar 2025 17:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742171982; x=1742776782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjMvwquUu5HvTpeV8tRi1qdeKCAJgZcm3OhYAciYMmY=;
        b=Zb+n8QMqtAJfUrnUn2Hf6aLcRH0Ofw2ocoAxBxX4OKkb9LnnkTPgYXLHTy2xSlpTun
         T9S4wXGOttRuHGWC6Mnh1CT9OtCn/hZxdSQ9wyvdJuiR9m2HsJzce/uDecBG+16jiFUf
         cE1DoBQe/a4xUgC2spdjUHJQHyJ5UjMFXtY7omNQ9XrTiBkMaaKoWg5T0uT07ysF4t1w
         s84pPNMTcbX2Dxz+nOxzGyEKoMaOCyf7e02ch4owRIJfBRxUntL37RI9dh85tqBJpBx7
         TKJXw1Y8hZ9IrHt2xvkyWXFXjjd0o8TWhX3WvnyGgFHBTc8sp10sjFRXznhc7CyAOZbw
         rlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742171982; x=1742776782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjMvwquUu5HvTpeV8tRi1qdeKCAJgZcm3OhYAciYMmY=;
        b=Xt+ThWd4E91PExhu7aopwlHuP1ZzYt8uxVfCLrNALbv4mXrh1Fnvn0ClegKiU4Fvsg
         zTuBZDUp2GFscQV/982BrSkj17y0ggCz/fOTE58zaFM37DwJVqb9T6f79VasGyp1dplz
         BvF9Na8IIrmTfimgSkgkDj3QIJuV1r5xEOJnuvz2lHKbc14ZHagBzZcUWA5mrkvGJxvl
         GZyw4FmcXIIjj54I7eBKZxooNXbigiyA10CArcQBB7uhzAFp+MvfYHJCqOcUOasgsmlh
         c9a7DXRJWk/9aeLYnQ3CNa6LAqMklpH2dRU4p7wvCPH8mFLZFLtfcFtJgD5Vf2kE2g5i
         Tb2A==
X-Forwarded-Encrypted: i=1; AJvYcCXgSdYugF5gb0KhVNTwexAwec1OlrsAM6szfCY0L3GDTIig4L9n/K8WRVqNf38k+S1J85ccvi5wuOxiGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3vTCiRNhuyyhxtGFYxUnDDX/QnwYpTNXlILmwMk3fjZXXRYwX
	uPFvILg+IWWs+nlg0KVwS/QmLn5K4D0X/mEzT5K5oIz1fXl57cug6KBJ3gMG96w=
X-Gm-Gg: ASbGncsOsiGWML/sne5o6bXDMXze6d/bGjh8Th08hHlApWLR/e+9OMgm6hYS424eH0o
	nQ4oUP0xQImGmgQEl7DVKOrTK6/RBt+VZttUs8k6MGn98HHUE6CzrVy832vHMfMi5HCCWnLaxul
	ipodE/hfvGm3BWfPb+ObPOl1Z+6ayFnxQvJSIRNh3jyGWwWvLg3smEXCk6H9pNkyyagAyO8M4ul
	oXsgFL27fTfGslzEeaCBQ0kkX+ikNvEZsW09EVzmoVJ/KPaRvgo6IYqGwpWPYTsy2C/iWYX1Pj9
	BC4F5ht20pTAvhITM6mkrjfOFIWTwwO5Ho6o9pFwtMY6TxJUjisygdHArJUaPjLCVjh8+OCkE7Q
	JIS4jHcVT3MFOFaYtP6mR7ApSsXHDSESjoTEVHNHyTm1TfHUMWI++zJ07NShH9OfojDxS
X-Google-Smtp-Source: AGHT+IG2MA1VjloGr2GNffV2SfFhbl1kHIYBhP5Cte6pgnARhrLj1e4TxqCjo29diAEMPEL/GmQdjw==
X-Received: by 2002:a17:907:1ca3:b0:ac2:d1bd:3293 with SMTP id a640c23a62f3a-ac3301e34c8mr955902066b.19.1742171981897;
        Sun, 16 Mar 2025 17:39:41 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aefadsm562407166b.8.2025.03.16.17.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 17:39:40 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 17 Mar 2025 00:39:34 +0000
Subject: [PATCH 2/8] media: i2c: ov02e10: Fix initial indentation and
 spacing
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-2-bd924634b889@linaro.org>
References: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
In-Reply-To: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>, 
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>, 
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov02e10.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
index 8c4455b3643307be5b1e8110979740a7e843c146..db27d8c9f3f0b8dd6df6f9757cc674075e419075 100644
--- a/drivers/media/i2c/ov02e10.c
+++ b/drivers/media/i2c/ov02e10.c
@@ -220,7 +220,6 @@ static const struct ov02e10_mode supported_modes[] = {
 			.num_regs = ARRAY_SIZE(mode_1928x1088_30fps_2lane),
 			.regs = mode_1928x1088_30fps_2lane,
 		},
-
 		.link_freq_index = OV02E10_LINK_FREQ_360MHZ_INDEX,
 	},
 };
@@ -771,14 +770,14 @@ static int ov02e10_identify_module(struct ov02e10 *ov02e10)
 	u64 val;
 
 	ret = cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
-			   OV02E10_PAGE_0, NULL);
+			OV02E10_PAGE_0, NULL);
 	cci_read(ov02e10->regmap, OV02E10_REG_CHIP_ID, &val, &ret);
 	if (ret)
 		return ret;
 
 	if (val != OV02E10_CHIP_ID) {
 		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
-			OV02E10_CHIP_ID, (u32) val);
+			OV02E10_CHIP_ID, (u32)val);
 		return -ENXIO;
 	}
 
@@ -948,7 +947,7 @@ static int ov02e10_probe(struct i2c_client *client)
 
 static const struct dev_pm_ops ov02e10_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ov02e10_suspend, ov02e10_resume)
-	    SET_RUNTIME_PM_OPS(ov02e10_power_off, ov02e10_power_on, NULL)
+	SET_RUNTIME_PM_OPS(ov02e10_power_off, ov02e10_power_on, NULL)
 };
 
 static const struct acpi_device_id ov02e10_acpi_ids[] = {
@@ -960,10 +959,10 @@ MODULE_DEVICE_TABLE(acpi, ov02e10_acpi_ids);
 
 static struct i2c_driver ov02e10_i2c_driver = {
 	.driver = {
-		   .name = "ov02e10",
-		   .pm = &ov02e10_pm_ops,
-		   .acpi_match_table = ov02e10_acpi_ids,
-		    },
+		.name = "ov02e10",
+		.pm = &ov02e10_pm_ops,
+		.acpi_match_table = ov02e10_acpi_ids,
+	},
 	.probe = ov02e10_probe,
 	.remove = ov02e10_remove,
 };

-- 
2.48.1


