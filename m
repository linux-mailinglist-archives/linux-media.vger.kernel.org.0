Return-Path: <linux-media+bounces-19061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B0598F2D1
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 17:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D78191F224D8
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 15:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237501A76A9;
	Thu,  3 Oct 2024 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ENCNE+cL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528FD1A4F25
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 15:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727970095; cv=none; b=t3MSglye80zTXpCP1sHMRGSv6FiwDQU6hfLNzHCca5LbEZkufqpZxe9wUHjxErPC70cqfYyiYzsi8EeUu/ifieabsB24hpOBp1pDiNLvG88Gv2odqN4bhiv1HKiRsoh9lTIO147yny0hHE2a+2tcgpJLBMfvygZwe2fu/sl6dvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727970095; c=relaxed/simple;
	bh=KuJYhS6BLwFHq2M3BsUApExs70W98G5/TG0tISRMP7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejTN9gRyVxAVilPA8w3ymiEr9Oiw0oI+dSg4tQ3XQVw/QQcX4yPzBW/xreQsQLkHjjeWwV/1FkozKDPWSuuMsAJ7XANsZHwvotFRo22eXptz7lsytFoZtfcdS0Jmh9rj6ErN8PxUrDVpXRN6/LSc6c7bPt4eq7cb/5gtoq6OJb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ENCNE+cL; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9909dff33dso180711566b.2
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2024 08:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727970090; x=1728574890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDWnOefZjmiIEjMknhotah0eI13dQMdxoD4kz7zvhSU=;
        b=ENCNE+cLdICmlPtUceRaEBy6qY0M3cJQxPHM6jZNf/WD8A0cuU7c96DMrEguQxCX0g
         IvySPeg9JFjAwprcHDru3fIGB09XjH2fd9kwGhkwjsUjs0pGHVdG38vcgHVd0Ua9CEql
         ddPdqosYcZfuUd5zNYjk5mcoBde0bO0TqvDtXTAMNfljSEZH3yaVlhsDB1a8yJjq92Sr
         xxPRasxhg5I07F0ubmRXCBbm+3pjc8B6YJAwHpc9AoHDCw3pnFOlVk+aVOGTnNKqLgl1
         uTgQv3amBoB42RMP+sZYFhkTqFGYidOWmJDj04KUQ6jZkEnlVb24Zgdiw7QMWnsSy9Wo
         JiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727970090; x=1728574890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDWnOefZjmiIEjMknhotah0eI13dQMdxoD4kz7zvhSU=;
        b=pskYIYXjTk26mIqUQAEZOBI3iFsE3An3rY6P8pCFkWplNiFb8wA10nSdk5im0j8JY/
         TGuXHJWc45aV0GUH7+RHiTA2p4mbtejdFM2esEH5L7RBWgSSW1q7gA9G7+KeRoBpaZry
         vxDoo/iBM+pE7Vt+3u+n+1hQJ/EQ7UBY45Df+Q+uexz22Tkd03QYg6VSgqgitWp5do2N
         HKU4ehDVziooPxVsz6HUK88k07ZghJjeIun+XoSrrY2O98yIkcpKzozgOlIVuouU83CS
         UmRoFZOwRDWHZw70JrUEOXl/Kna2bUr+lpU20TYnfF4Ea2NDoKRdvdORm1ZJcM8GtCgO
         9e6Q==
X-Gm-Message-State: AOJu0Yws1I/uQo5ZV+ALX6XSuni0U7X4O/PQXceKCmSsEJMEzvb3FcFg
	QAzzM0dCbOi15HuPzYrOfRh/S70aDr9bAMP8sapW3IcXIEVBhSKIVkdiGrH1G40=
X-Google-Smtp-Source: AGHT+IG3rMtoMbI9NN5aMRWEJU21BT28htx5oYE4D7ib0ifyGr9FipmKAjWzxrRPM3WSGUHkvnJTYw==
X-Received: by 2002:a17:907:1c04:b0:a8d:7210:e28c with SMTP id a640c23a62f3a-a98f821eabcmr730643966b.20.1727970090572;
        Thu, 03 Oct 2024 08:41:30 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99104c4f3fsm98492866b.200.2024.10.03.08.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 08:41:30 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 03 Oct 2024 16:41:27 +0100
Subject: [PATCH v4 3/4] media: ov08x40: Rename ext_clk to xvclk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-b4-master-24-11-25-ov08x40-v4-3-7ee2c45fdc8c@linaro.org>
References: <20241003-b4-master-24-11-25-ov08x40-v4-0-7ee2c45fdc8c@linaro.org>
In-Reply-To: <20241003-b4-master-24-11-25-ov08x40-v4-0-7ee2c45fdc8c@linaro.org>
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


