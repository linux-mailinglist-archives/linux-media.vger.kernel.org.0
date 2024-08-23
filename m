Return-Path: <linux-media+bounces-16647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D52E395CA77
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 12:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654A81F21E89
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D909A18732D;
	Fri, 23 Aug 2024 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfBtpnFh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02D217C7DC
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408865; cv=none; b=tYe71o/6ZWksvaoRg0ktK3AIR27/d95ZgflzeOO0V7UZbyg4LPEW82g9Bfob7AgDUkHfC0B2N830sLZgtE4rWGW3tC+hNwhSgPfMrv34QK7Jiow6OgW1JsN++kFu5j81VdEiKjPIogp2QljTa/ni//PVbpQlbiqZCmVE7mhmcOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408865; c=relaxed/simple;
	bh=zFeRD1dubZTlUw2Tr8sTwatKL5cUhpCf5nRuXAjei3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4X7R9dy++h5+xGOF7QD+OQwQ8N7Rss2XAPgYxYxEtsR3/1GQ6TwT91o8YDfrBc12tNg26Q3Wf/oAbYy4AOCH8m0YdoZXDizmY0ZpzbJhBiORigL5Yis/acrD3OL2NLtwwhuBMryQMI+OopBIWN25GpjZTaUZ7u0nBccLpQqxrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfBtpnFh; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3f2b86b2dso2307871fa.3
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 03:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408862; x=1725013662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AauUhOtdcxefr/CJ3rnixUCq6aw4Uq29mzp5fPuYe10=;
        b=LfBtpnFhXuH5pcRlimFlDlCroKdycTP6yITicgAPCvojSVdlMEpc1lYMC5ubHGUNQW
         nfsRbajQAtldXrN5aYLigUeDobVQLH/fnzPHiCOPzuNv6W+kiSRjKj4/jASCXEYKqLv3
         K2Fei6Agb2ntElCTHXbWsnX5MTKGNpqD0nvvM+Sbtfo35oRGLBPMvd8MHmfS/wNkRmPi
         10ghUzWuXeWmMXS6WEMdduw/anyHv2JMXnt5Hdcdyn9o6ptBhSnJIE1mVnG2ljrz8/Mm
         hXuIni5nqZ0Tgee7rwDpSp0RlW7kL8HP5F6nngeVAVB/ldudhbD0ItnWK7xDLBnjiaKb
         u3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408862; x=1725013662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AauUhOtdcxefr/CJ3rnixUCq6aw4Uq29mzp5fPuYe10=;
        b=U9njE70+yFmRNxmjMvKH/zlp/HtXb1ha2nc08nh5eWwzcrAh+ug+a1Y/D9adZ9oVtP
         PyyAK+Nf/tK/FiB+nXLW4y1H9urRFgB2oOfEQzgJUO0hbvJyRLY1buuv+/8Ev7CFvhF0
         vbhosB8lRnA/ASFklBvZGbZg+nbqxTHoVYWXqYY91MzECDgOErwIGS4SnRtNWbpJ/NjR
         g/8KA0Zi78jbfM1uFL6Y98u74GDAvV2bPFzini76sVL6zqjBTdPoWJ5QVs2gDSs0DQwa
         qiX0CB1HmVKNnogwXfrhBncnSSQAi5bV5ZeI9YsfSIrfaGpuf6hj5fZtQr18sI2Frs68
         6ecQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQmVRJG5c+kzZY0MFLxaTs9tS2+uoyQIKkQuzfZyUXbvUe0/9DMeAsHTlovjUiX9hqozRaxrcOgwVmDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwSq/5JqCoMNsSWagaRi+2QjQOqe3qc1cUC3VpLRGWuhz1zWx
	pr9UH+1TUNS5PCxD1d15YTupIvf6HJG228rkV6AwTnYZvD24udAprR4cxjY65l8=
X-Google-Smtp-Source: AGHT+IE+1+8eRFLGdhtll5p2rIecUHj9u7LHRyeW0jm+/ekgPTBRYJ8/dJcusYYe6NZl4x7efnvUlw==
X-Received: by 2002:a05:6512:3e1b:b0:52f:c285:323d with SMTP id 2adb3069b0e04-534387bb090mr676570e87.5.1724408861821;
        Fri, 23 Aug 2024 03:27:41 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5d220sm504669e87.183.2024.08.23.03.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:27:41 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 4/6] media: i2c: og01a1b: Add support of xvclk supply clock in power management
Date: Fri, 23 Aug 2024 13:27:29 +0300
Message-ID: <20240823102731.2240857-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240823102731.2240857-1-vladimir.zapolskiy@linaro.org>
References: <20240823102731.2240857-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OmniVision OG01A1B camera sensor has an xvclk supply clock, which
could be described and then explicitly controlled on OF platforms.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index d993ef4bad46..766740bd04c1 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -3,6 +3,7 @@
 
 #include <asm/unaligned.h>
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -418,6 +419,8 @@ static const struct og01a1b_mode supported_modes[] = {
 };
 
 struct og01a1b {
+	struct clk *xvclk;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -898,8 +901,10 @@ static int og01a1b_identify_module(struct og01a1b *og01a1b)
 	return 0;
 }
 
-static int og01a1b_check_hwcfg(struct device *dev)
+static int og01a1b_check_hwcfg(struct og01a1b *og01a1b)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(&og01a1b->sd);
+	struct device *dev = &client->dev;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -913,10 +918,13 @@ static int og01a1b_check_hwcfg(struct device *dev)
 		return -ENXIO;
 
 	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
-
 	if (ret) {
-		dev_err(dev, "can't get clock frequency");
-		return ret;
+		if (!og01a1b->xvclk) {
+			dev_err(dev, "can't get clock frequency");
+			return ret;
+		}
+
+		mclk = clk_get_rate(og01a1b->xvclk);
 	}
 
 	if (mclk != OG01A1B_MCLK) {
@@ -970,13 +978,19 @@ static int og01a1b_check_hwcfg(struct device *dev)
 /* Power/clock management functions */
 static int og01a1b_power_on(struct device *dev)
 {
-	/* Device is already turned on by i2c-core with ACPI domain PM. */
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct og01a1b *og01a1b = to_og01a1b(sd);
 
-	return 0;
+	return clk_prepare_enable(og01a1b->xvclk);
 }
 
 static int og01a1b_power_off(struct device *dev)
 {
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct og01a1b *og01a1b = to_og01a1b(sd);
+
+	clk_disable_unprepare(og01a1b->xvclk);
+
 	return 0;
 }
 
@@ -1003,7 +1017,14 @@ static int og01a1b_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&og01a1b->sd, client, &og01a1b_subdev_ops);
 
-	ret = og01a1b_check_hwcfg(&client->dev);
+	og01a1b->xvclk = devm_clk_get_optional(&client->dev, NULL);
+	if (IS_ERR(og01a1b->xvclk)) {
+		ret = PTR_ERR(og01a1b->xvclk);
+		dev_err(&client->dev, "failed to get xvclk clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = og01a1b_check_hwcfg(og01a1b);
 	if (ret) {
 		dev_err(&client->dev, "failed to check HW configuration: %d",
 			ret);
-- 
2.45.2


