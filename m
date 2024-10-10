Return-Path: <linux-media+bounces-19340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AC099861D
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 14:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4F702847BB
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 12:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CD11C8FA7;
	Thu, 10 Oct 2024 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InJNtkpR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754F1C6893
	for <linux-media@vger.kernel.org>; Thu, 10 Oct 2024 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728563606; cv=none; b=jLOdxLiiRlQy5vCsrEP7sBK3oH3AZU2W/29HjQkQJvTOKR2WmIHwBOp17cshvcoZJTiz6CAj/qE6NS5nd2d0GPMb76sKJevNuO9Y1m6HM849xFX5m+X8xGPGX0IYvt0jaBg679pmSXGPYHVowk106zLQeUN6xeCEReZSBjpVkho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728563606; c=relaxed/simple;
	bh=KuJYhS6BLwFHq2M3BsUApExs70W98G5/TG0tISRMP7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfJ1JpW9u9CR2fZbXRwP34UxULnbG4j8D9fOF81tbfdq7FTLxWmf3VIV4KtV88bIugP6VhJFBYgjP0dJ1zTPyDFs1wsVb37IZNldRUtra7FfOH7RQdS8ZBjNF2koTkItm3nzwgVMh9ak4SKQXi/G/ay6idzi3UPiiG4sdn5/4RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InJNtkpR; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9952ea05c5so145497566b.2
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2024 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728563603; x=1729168403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDWnOefZjmiIEjMknhotah0eI13dQMdxoD4kz7zvhSU=;
        b=InJNtkpRB3rvWqsgxWuZ26JEOorIycoPYwsiYMM+vmOEmjZSYXuUGCQfweSFWirQnY
         R/dV1xvt5d44SQVc7slBP+F/9b38OYFOMstTp9nEW2JgaAApNGw5atT/Zli+3MMUX8gG
         ptCOiGvaa+izSbx/POOr8rghbBX4W3g7kkO0AKnEdTepXmCNWxldBzGyBqTdMYuq0pJ9
         j0UDr1t2qTM1LuYmhfkbgS3cXAdbWvHsCQsbi3P6dDOKNhcO1jCO2SjoqrDhZebd7ZCP
         P1NGQc8OEZBCsXpLIZsjrtOxr3E7lidiAT1zzM8Oy0BOq9HjH6mTj8u39PHptRH94IAq
         uWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728563603; x=1729168403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDWnOefZjmiIEjMknhotah0eI13dQMdxoD4kz7zvhSU=;
        b=P+xbtZ9LZ5f5/Dg+cQIeEllF7rE3AAkbtUnyM/A7HLzS7I8D2wOQUsaTEGFdlZaaQu
         HljOZlWKW4JJvdFbee+xIs4AMoZJ8ERACM5C7Hoo8cXPYSEvWIY3s1KrZCximi1/O1eH
         nlTcsFd66kIzkfI09NkOvBdyLs3nGD/HPW1p/34Eq4IS8zHZfQGizsU9n7d3MHkHppfA
         cBx2FD15wulPMh03MecpVg9sK02RmVhUJ4cevEFD7eutwfie/5pCy11znQgkZEa92J8g
         NCl4EjfFAkWdLMLdtcl2/L+1iNXqYSDqkzrfq+TFzf/89QiRymiO3kyRDtVArrNzoDg0
         ArcA==
X-Gm-Message-State: AOJu0YxUHE14PFnjchJunfpzgKJN6nLdtZ5gL3Dsbqg2UzKF7B0n7K8B
	umdWlVyCqysli05zRAdnfuyuYiHZy6E0v8UqhN1b9XCjb9iJSE8ReBorL5WA3uA=
X-Google-Smtp-Source: AGHT+IHfZ6X8GXgC8wsZ2KRljq0m2VKytBnnmaGg4/iAn7dxvcGlhXWjOd4IaDOLDhRHZf/dEyqWlg==
X-Received: by 2002:a17:907:6d24:b0:a99:7999:281 with SMTP id a640c23a62f3a-a998d314b9cmr613150766b.48.1728563603136;
        Thu, 10 Oct 2024 05:33:23 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c0723sm82416666b.135.2024.10.10.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 05:33:22 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 10 Oct 2024 13:33:19 +0100
Subject: [PATCH v6 3/4] media: ov08x40: Rename ext_clk to xvclk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-b4-master-24-11-25-ov08x40-v6-3-cf966e34e685@linaro.org>
References: <20241010-b4-master-24-11-25-ov08x40-v6-0-cf966e34e685@linaro.org>
In-Reply-To: <20241010-b4-master-24-11-25-ov08x40-v6-0-cf966e34e685@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jason Chen <jason.z.chen@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

The data-sheet and documentation for this part uses the name xvclk not
ext_clk for the input reference clock. Rename the variables and defines in
this driver to align with the data-sheet name.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov08x40.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index be25e45175b1322145dca428e845242d8fea2698..3ab8b51df157af78fcccc1aaef73aedb2ae759c9 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1215,7 +1215,7 @@ static const char * const ov08x40_test_pattern_menu[] = {
 /* Configurations for supported link frequencies */
 #define OV08X40_LINK_FREQ_400MHZ	400000000ULL
 #define OV08X40_SCLK_96MHZ		96000000ULL
-#define OV08X40_EXT_CLK			19200000
+#define OV08X40_XVCLK			19200000
 #define OV08X40_DATA_LANES		4
 
 /*
@@ -2081,21 +2081,21 @@ static int ov08x40_check_hwcfg(struct device *dev)
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	unsigned int i, j;
 	int ret;
-	u32 ext_clk;
+	u32 xvclk_rate;
 
 	if (!fwnode)
 		return -ENXIO;
 
 	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &ext_clk);
+				       &xvclk_rate);
 	if (ret) {
 		dev_err(dev, "can't get clock frequency");
 		return ret;
 	}
 
-	if (ext_clk != OV08X40_EXT_CLK) {
+	if (xvclk_rate != OV08X40_XVCLK) {
 		dev_err(dev, "external clock %d is not supported",
-			ext_clk);
+			xvclk_rate);
 		return -EINVAL;
 	}
 

-- 
2.46.2


