Return-Path: <linux-media+bounces-17201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D4D9657AE
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 406A01F247E6
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2B01531F3;
	Fri, 30 Aug 2024 06:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7DwJqBl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7301E14F9C5
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 06:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724999708; cv=none; b=Sq2DOG7E01POdh2va0/QHjYi0bDR50AinAnuJ+Xuw82MynkCZyCKQUm8tlXmO3nG1rxTMSfGT8IDhf7R5O0Wsist7XSQTa1Egj2foM1PJB4MKp5LuICMGPysc8fUVF+pP/Cl69k09aiwpR3938JtHtTOxheeTnebGca8OAj/6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724999708; c=relaxed/simple;
	bh=dHPvVFMF9oE/Smq/fAVh/jP8Xok6qZTN+5FpM5SDwrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQDtssYbY1RlJIM2UCKsgrOmciOU21Br44gE/5wiWHRKelQ/8RbSOJXyvMQ/udR8USEUdPH+R2C8aoUEb3LRbGPNeBjQ3ylDy5BVWGG4EnLZIPwjNryjs7bkjpmC2G0f6VEM4FrHuvVvoAGWy4HtJp7ATxRTLZQSxRITVM6Qv5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P7DwJqBl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3f2b86b2dso2637361fa.3
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 23:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724999704; x=1725604504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0tdmBT53w5VNdz5QchETAoTh/+fSs3HRvsgOCGHU8w=;
        b=P7DwJqBluoj2v4IW4Swcui8jtscwDcVkhEP8eLz2JsU4uoeuyNDX1tCnMJDspzz4HB
         aKqSsiJflKO855XDzHcfQp6djTyA+jCrxbZJ5rmtF/Oz3G8IXbcg8w+MimZ6tnadiQN7
         MdjBO6+dKGxkmcoIxneUKlTBoyTJR9TtsXcvIGe37RXClJrrtGPP12QcYC4PPaNedp6r
         ikJmd5CDGab1Xe00svSWc8rgiubgAo5aEvKOA0WK1DgxJtFv8fzbPudHSNU5d8fauhuy
         rkP0YWlfZsCUwTMLTOEsM+u4YO48lIRZ2KmRfM+bgrYOE/CXryTep6ubUnAX+ZAfkiFS
         LIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724999704; x=1725604504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0tdmBT53w5VNdz5QchETAoTh/+fSs3HRvsgOCGHU8w=;
        b=CMK3V9AOqIUgg4aT7h5hGUXihskaNz7ryJytq3/0m6wnGDFgSpWVax2S2ui12sPSS1
         j2olmTTWmLi6CJ6VJo5yTULF+KFSZhl3OChoq4nqkZ9dxEA8Ehgnz1unQc38kDJGvh3F
         8SFHvQKYHhm84FrOwtJTNJwf5cgYCjzxcbbzy6ouPg7j7ubqEj5y/qXG3IjbhnOvz+L0
         fFwrJcbO3CI6NZG5n77nM1bIKTeSG4bynOuR9XEgvbmyOeR7riLKrKxA8/fq4oBdfrGb
         sTWstVT7aH3ZeFWUVG5VlN+sTabLltWoBJOBLgzSfavS//FDvt0vS2EpcjXzzY5zCiRz
         L03Q==
X-Forwarded-Encrypted: i=1; AJvYcCWB47fPGGraUVfW1kFeeOMfzRAEr2W5pkKlU7yKAth7w5ePwaYwe7Hw0exB+T2R1vOPC1cXeDE8MPmulQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBaRpBxUVTt+2vstf9tGh0A9VFAoD7qG9uSGvd0fPd80KkrHTZ
	K/v4W5wbg6Jbjw80nXZ2o+ampzk2zZ2I7r0+AXyDrLLBQ7ncHJJvCHmrDXJtN7o=
X-Google-Smtp-Source: AGHT+IFuvKUckfbRC+E10FenwVh2Z2J91k652f4e/vTm6Ou50FkcDfTix9qXMYz6TbhCrjIL3Jx2FA==
X-Received: by 2002:a05:651c:2115:b0:2ef:2373:5f90 with SMTP id 38308e7fff4ca-2f61df9f4b8mr4658801fa.0.1724999704477;
        Thu, 29 Aug 2024 23:35:04 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614f00860sm4879441fa.45.2024.08.29.23.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 23:35:04 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 2/6] media: i2c: og01a1b: Add OF support to the image sensor driver
Date: Fri, 30 Aug 2024 09:34:55 +0300
Message-ID: <20240830063459.3088895-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830063459.3088895-1-vladimir.zapolskiy@linaro.org>
References: <20240830063459.3088895-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OmniVision  OG01A1B image sensor driver currently supports probing
only on ACPI platforms, the changes adds support of OF platforms to
the driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/og01a1b.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index bac9597faf68..9e756c1c47df 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -1057,10 +1057,17 @@ static const struct acpi_device_id og01a1b_acpi_ids[] = {
 MODULE_DEVICE_TABLE(acpi, og01a1b_acpi_ids);
 #endif
 
+static const struct of_device_id og01a1b_of_match[] = {
+	{ .compatible = "ovti,og01a1b" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, og01a1b_of_match);
+
 static struct i2c_driver og01a1b_i2c_driver = {
 	.driver = {
 		.name = "og01a1b",
 		.acpi_match_table = ACPI_PTR(og01a1b_acpi_ids),
+		.of_match_table = og01a1b_of_match,
 	},
 	.probe = og01a1b_probe,
 	.remove = og01a1b_remove,
-- 
2.45.2


