Return-Path: <linux-media+bounces-16644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D41D95CA74
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 12:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A73851C21299
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A376183CD8;
	Fri, 23 Aug 2024 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPjXe/Fa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24017165EFC
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408863; cv=none; b=BLm4rOMCkjKbZvCrUkNkd2pPo9TxPnMpydlrGrSEBkkmw9u/e2Z/C1xx5fJfm+H1jUs9j0t7qZelFbPD1QkPgjQcudyXafk26g/qTGwS2PGc5Zpaz3sjRKCxY1lzbbqlbQQ3lRdYyeUrGNXAFMPn/WMFWNw1BGDVvnJlNKIysmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408863; c=relaxed/simple;
	bh=dHPvVFMF9oE/Smq/fAVh/jP8Xok6qZTN+5FpM5SDwrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAhogYlni2WcdObQCDwef8zZCBuq3sTxaER5SqDX+0eYSO+DysAKpOA7ADN7YYAK612iOZ11C/VBAVJE7jpRiQznmo05w8fyN/sg6Y/tWG3JcPvGzppJrYNRCPR/6OSEgB8BlUPNcVCO5XSIGOxUnMAfjHqmoWMQZE/fATG3Pys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wPjXe/Fa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5334b61b6beso345977e87.3
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408860; x=1725013660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0tdmBT53w5VNdz5QchETAoTh/+fSs3HRvsgOCGHU8w=;
        b=wPjXe/FaO0xZhYY+jx1aJZHM9BCjg78ZG8d89tcJ4JF1cIIa/NKxr4Cuw4a4DS1+2f
         lafev4PRW4iOeAdKRNUyEEP5yPcmwsPg9/fTaLqf2WojpDOm6noANbzks4topXcyRicP
         kTUcsYzs5PkyWhGvDpjfG5jaoOK0h1JrlGPFLKmIvhy9Vu/AHMZcduqx7g9T9AAJzf6B
         GXVA2iDW2kLw4n2DGEfgT49rOkqxcMASXep/EZ7wgjQylUV7QYFficy9XoIiAxaI5Tk8
         oix6Op5syPbeCYC7B0WoMHLc0Hm8NrzSH0IFdi5Qk+FYoyq/XkTpJhwWCNOHmFy34YKR
         apBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408860; x=1725013660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0tdmBT53w5VNdz5QchETAoTh/+fSs3HRvsgOCGHU8w=;
        b=JaG5WSVSGSgFQ7v0pDSYbId7yF+c1Hn2BZis9XBcDh0OptoUglM2AhIIdkFw7xpMbC
         x2liNrm5EWljT6L9/TY350eDamUjgEH/Wzv+a74HqrSoxRYhUj0gzGac2YdJD7ApF+P1
         pLoUFjIQcuL4tPYtC/SXGv3Ac3XSPb6CCqj6hL6K0VhfgjDTVa/Q0VkME+nOdrv1uHjX
         lgvqfCl26vQCzqiJGSQ2YFFRCRUIYAcDNhaIky6en/u824n5K7s7jXD/CL9ZTLXXzq8b
         qc8opROs6c8U84tBzVkgUm4MeXnPUOmOjKGqc5nYIioNZW0iB9Bs1Xz/MLKXtbtnGzYz
         fbTA==
X-Forwarded-Encrypted: i=1; AJvYcCUuAAKbyng+1zv96SWMJTRuOTzVjKcRclCafIB9cmClDBtm9316toh/N2LdKE1blcLEai1ghCIgjiMRGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM9ZdM8dPm3t06fGBVZ9qlQ7G2PQ+2KF20tiwlG/M21OVBv3S0
	Iz+DkkAPVNsyo9h4vKOEAesdFWbKGpylcCR0Y/+oyLdEK6l/hRzRQxXb8piy+cg=
X-Google-Smtp-Source: AGHT+IHj6u1YSXOraviPtV63DYC7MbZqPcUgArDQQsE+WD3jUawG7j23x9GYsLGIIsYZQuTzoNAQwg==
X-Received: by 2002:a05:6512:2391:b0:530:baec:3975 with SMTP id 2adb3069b0e04-53438757440mr731455e87.1.1724408860163;
        Fri, 23 Aug 2024 03:27:40 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5d220sm504669e87.183.2024.08.23.03.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:27:39 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 2/6] media: i2c: og01a1b: Add OF support to the image sensor driver
Date: Fri, 23 Aug 2024 13:27:27 +0300
Message-ID: <20240823102731.2240857-3-vladimir.zapolskiy@linaro.org>
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


