Return-Path: <linux-media+bounces-21694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C982D9D4280
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 20:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CAE41F2356D
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 19:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D271C242C;
	Wed, 20 Nov 2024 19:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="t17vJq5G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E1F1C461C
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 19:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732130256; cv=none; b=Hr0h8/m7O2dhISenwQvMw5cl+IBFYmiBG5nhEHXShMN9VDY1y7t+wtXqDK000fyAJwsSh7eXeh4wgdwJBhvN8HHUiuO6ZtaB99724Dd6RdMN0xPykT89eb97StigfCj0kAKoxZ8HxEbcxB7++2bCK99gjUSeHM6ILb+khqZYBSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732130256; c=relaxed/simple;
	bh=0yiuVppUNHZf3L7doCK7wAGWo0y2MOO+Z6YHaTA040U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F62AE4eiRCH4jIZHGOrmEmcR+ik/8xKSRGk65VOKK88T/au7eEhuNr3Te+rrsYxIrIroPc1GVVWfsYW2/F6y6BfZ9kejf+1Ex8w3t7BDJXab/wFpmquxHDA9dxiU44LAVTmr29NWX5xoOcpWRR+wRaL+L5ctFEIh6VtI5BHT8Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=t17vJq5G; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-382433611d0so23395f8f.3
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 11:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732130253; x=1732735053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zitwIFEHcuodW9TqUQcqtnx2dFAFSgL0NQQ869EFe3Y=;
        b=t17vJq5GZflSjl9fwl626cyiWNINUk1veEi96uUriy0hybVgckUZnz7n73KK86M/vg
         59pRxX4pstrR8+JPFH4VwKuV0pwZ3eS9AnEWkMDAc7JYYjsJ3CSoKur4PckMMYqInqX5
         LpEJ//7OPwWmHvMGZlDCX3BAln1GWB2EEJWU9Up1mGMNvUxXlG43Suz2/rpn2KMXwete
         2uquAZ2L9OMyu1RetU92sVr+F3SvvBiUJ10pdcO5+yQMSLkQ/DDFmilceN/PFDroSN9x
         39GptRn4Gthuv3IM5cClY/83vTqV+1AzSKEXLN635UwYD+MXP4mf2pd0Eo+rtQsvz1mD
         phxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732130253; x=1732735053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zitwIFEHcuodW9TqUQcqtnx2dFAFSgL0NQQ869EFe3Y=;
        b=n+tORzmTtB7mhFucPedpQ8+4mg3AZhBo6SK32q9tBRHyzRufkLOdI+NCkGwFGViQgY
         4W5PGgaHXmYydxlnWzpq4q20epmqcKICPwPtLM0wRgV1noCsryBN/2crqRbvoYVbTem6
         IA5IrCOGWopUEOCz+NbqkXP2mp0ecNrNuCgVeQxS7BBgCFxqByWtw99SL69Skq5VN5O9
         iE9zOCYD7iypXJL6uFOI9dfCE4qrI9C8xJKZ0wlw3etcVhCcJDT9d7ifZBzSSr8nYWHG
         SRG3YY6VyuvRG+PNEwUHuaqXi6tE5yIOrTjqQAuq+W+sMBYXlyI6WeGOd1i0rf2UTN4/
         nLLw==
X-Gm-Message-State: AOJu0YwiIeqZc+ejahr3BWs6Zp/nK5OVYnQ7rJvQT+LrtxqM4zcNp5xp
	SAAUng9U80ZLzNsoB0gEYqNtUgubUbONi9L+Ua2uSb1IuAPI6WEva1fRPmZaZmE=
X-Google-Smtp-Source: AGHT+IGDyoH11Pb2u0yiBU+8Fdfd66KoXkLqC8DdXiQbdQWJ60b113ZzD+VLCAp8swQ0TH5bSW7kRg==
X-Received: by 2002:a05:6000:1fa3:b0:382:1b40:46ec with SMTP id ffacd0b85a97d-38254b25beamr4007449f8f.59.1732130253271;
        Wed, 20 Nov 2024 11:17:33 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3825a2c5ef2sm172457f8f.53.2024.11.20.11.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 11:17:32 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 20 Nov 2024 19:17:06 +0000
Subject: [PATCH v2 4/4] media: i2c: imx290: Add configuration for IMX462
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-media-imx290-imx462-v2-4-7e562cf191d8@raspberrypi.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
In-Reply-To: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

IMX462 is the successor to IMX290, and wants very minor
changes to the register setup.

Add the relevant configuration to support it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 7d794a509670..3bad7779d0d0 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -170,6 +170,8 @@ enum imx290_model {
 	IMX290_MODEL_IMX290LQR,
 	IMX290_MODEL_IMX290LLR,
 	IMX290_MODEL_IMX327LQR,
+	IMX290_MODEL_IMX462LQR,
+	IMX290_MODEL_IMX462LLR,
 };
 
 struct imx290_model_info {
@@ -316,6 +318,50 @@ static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
 	{ CCI_REG8(0x33b3), 0x04 },
 };
 
+static const struct cci_reg_sequence imx290_global_init_settings_462[] = {
+	{ CCI_REG8(0x300f), 0x00 },
+	{ CCI_REG8(0x3010), 0x21 },
+	{ CCI_REG8(0x3011), 0x02 },
+	{ CCI_REG8(0x3016), 0x09 },
+	{ CCI_REG8(0x3070), 0x02 },
+	{ CCI_REG8(0x3071), 0x11 },
+	{ CCI_REG8(0x309b), 0x10 },
+	{ CCI_REG8(0x309c), 0x22 },
+	{ CCI_REG8(0x30a2), 0x02 },
+	{ CCI_REG8(0x30a6), 0x20 },
+	{ CCI_REG8(0x30a8), 0x20 },
+	{ CCI_REG8(0x30aa), 0x20 },
+	{ CCI_REG8(0x30ac), 0x20 },
+	{ CCI_REG8(0x30b0), 0x43 },
+	{ CCI_REG8(0x3119), 0x9e },
+	{ CCI_REG8(0x311c), 0x1e },
+	{ CCI_REG8(0x311e), 0x08 },
+	{ CCI_REG8(0x3128), 0x05 },
+	{ CCI_REG8(0x313d), 0x83 },
+	{ CCI_REG8(0x3150), 0x03 },
+	{ CCI_REG8(0x317e), 0x00 },
+	{ CCI_REG8(0x32b8), 0x50 },
+	{ CCI_REG8(0x32b9), 0x10 },
+	{ CCI_REG8(0x32ba), 0x00 },
+	{ CCI_REG8(0x32bb), 0x04 },
+	{ CCI_REG8(0x32c8), 0x50 },
+	{ CCI_REG8(0x32c9), 0x10 },
+	{ CCI_REG8(0x32ca), 0x00 },
+	{ CCI_REG8(0x32cb), 0x04 },
+	{ CCI_REG8(0x332c), 0xd3 },
+	{ CCI_REG8(0x332d), 0x10 },
+	{ CCI_REG8(0x332e), 0x0d },
+	{ CCI_REG8(0x3358), 0x06 },
+	{ CCI_REG8(0x3359), 0xe1 },
+	{ CCI_REG8(0x335a), 0x11 },
+	{ CCI_REG8(0x3360), 0x1e },
+	{ CCI_REG8(0x3361), 0x61 },
+	{ CCI_REG8(0x3362), 0x10 },
+	{ CCI_REG8(0x33b0), 0x50 },
+	{ CCI_REG8(0x33b2), 0x1a },
+	{ CCI_REG8(0x33b3), 0x04 },
+};
+
 #define IMX290_NUM_CLK_REGS	2
 static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
 	[IMX290_CLK_37_125] = {
@@ -1456,6 +1502,20 @@ static const struct imx290_model_info imx290_models[] = {
 		.max_analog_gain = 98,
 		.name = "imx327",
 	},
+	[IMX290_MODEL_IMX462LQR] = {
+		.colour_variant = IMX290_VARIANT_COLOUR,
+		.init_regs = imx290_global_init_settings_462,
+		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
+		.max_analog_gain = 98,
+		.name = "imx462",
+	},
+	[IMX290_MODEL_IMX462LLR] = {
+		.colour_variant = IMX290_VARIANT_MONO,
+		.init_regs = imx290_global_init_settings_462,
+		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
+		.max_analog_gain = 98,
+		.name = "imx462",
+	},
 };
 
 static int imx290_parse_dt(struct imx290 *imx290)
@@ -1654,6 +1714,12 @@ static const struct of_device_id imx290_of_match[] = {
 	}, {
 		.compatible = "sony,imx327lqr",
 		.data = &imx290_models[IMX290_MODEL_IMX327LQR],
+	}, {
+		.compatible = "sony,imx462lqr",
+		.data = &imx290_models[IMX290_MODEL_IMX462LQR],
+	}, {
+		.compatible = "sony,imx462llr",
+		.data = &imx290_models[IMX290_MODEL_IMX462LLR],
 	},
 	{ /* sentinel */ },
 };

-- 
2.34.1


