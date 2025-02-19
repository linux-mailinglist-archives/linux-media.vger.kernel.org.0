Return-Path: <linux-media+bounces-26340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEE7A3BAE9
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E74C3B7CCD
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 09:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F021CB9F0;
	Wed, 19 Feb 2025 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiFgEqi8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D21B1684A4
	for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 09:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958417; cv=none; b=kBKR9o3SqVgUFogY3SFZGbhE5qCyty6+P2+AHROSMDwEsJg+ztvb9soFdV+f382hU1bhn9rXR8oLRAInxksJAFlxgTNptGq7aJDes5gxHLSbwV+fNvQZnuUiTq+VnmwuC8tb4XWv+s9+LHCamZAEHi2En/a6UjxFggDfooCO5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958417; c=relaxed/simple;
	bh=MSGahAspL0H7nN8WF1fpIWlDanBkpa2R3w3kTb6pCR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qb5+RWFnH8+J9ElFjo8rdtZlF7JFj4wu06c61zj3nbZEluWjlH425KDbyGfTJH5IZ874NPYfc4Lu4Yan5nB4Rt7mHtv+0TBeXEYXLWkoslN8xlFHbd1Agy6jZQb2XxqHZ8r+5TL567pomtRDXoGf0qKn/rFYFbJEmlcsUP82iAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiFgEqi8; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30762598511so62342461fa.0
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 01:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739958413; x=1740563213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27jbWYLsEblYbKzhUCnk+9LLkCJuxP9z70eUMMXUEj4=;
        b=MiFgEqi85XwZgDZdjCABNfcL3CpclAPDNGSuskY+baudLVcmTOmftbX+H1aE1kGOX6
         myB6cHyKR3VPKoLyV+nD3an4CQH6x22QF5udFTPxCQ5dd56ZlMAIa+0MrgRMXHpvdmKv
         kLYOCkTsKEjt9Rtz4QcYvafThYq/cfEsciCISXrJtPwxCbZkJqw+qeon+5UCYsMnVmNK
         CZo5JwI8msuSVuP4IYHyVBEqBLS9HUE3Wx9so5N8scVsg6l0rpbEKKmtmatS4bMHKDak
         aQLLkatAV26AhE/y5p7aHPYMNawugYHgwDzvpnAHKMURodq3IB/3qg7VEAHarq7Wg7Oq
         JOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739958413; x=1740563213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27jbWYLsEblYbKzhUCnk+9LLkCJuxP9z70eUMMXUEj4=;
        b=PgooCT0Gwk3PDEqOl9TXkOtZZWdX8AvqQpzaQfEdJX60QPz6LnXHG8U8jOii50f1ys
         HHMWusZ1uzcBvxYhvfpn9Oe9WN/ttnC7Jy4WJQlNL9H4m2nGZBJcqnjFy8IvH9vldeJh
         xBj3c6kiLxnnwjuVavQZ+8TKw+MiIsNNrrQT9NyDTXr3ulBjwViZX15PXD6UWPWrCk9y
         5uawSsDwCdXeihtW6dpbptE0wCNOXpGwFs/f/1ARMuOjX/w7zGVDZgDEYjIZCG9puHzN
         CWjL1YYTIo3qcN6Vdx4j2WKyJgPDN9uhe8/CQorRJs8XUiL+m+BMmoLPckcL7XFg17zA
         2JHw==
X-Gm-Message-State: AOJu0YwYnaSaH7h7fVibsFmgoBycrTfOFQvEbuq81lk10D0lCfQciJDE
	oDf70NpKNVj+gD5i7a4LpEKlaUIa+y3kWwS+nF8chM67jRrmeHwgBMC5mg==
X-Gm-Gg: ASbGnctaeBLFBvTBAxpGSfnqNrl9Syo5jSOwR8Zh5r1043TDNlVOtcGy2zlrsr02laB
	3Ux3HaRPDoLKUSmS7xiMesyDsGDpu3KtPPPeHaqvL9YPfycHHTuz+D8sjlPUZfUF47S5EBtpSgU
	Aqa5b332+nPPHRED+F8SxhCg+YT3JOs/qjEBN8PmNz/OQzUJD5KmSW4AJcr6UpBPLuWTA1vjbSd
	rSionxNjqJVUjW/Xxzad7i/l7GuwlLYsFrUcWcvgB8+KzmkiWApSpxPRQJIpbkL4ji4+9SJxhVu
	ZIu5OTLUbzs5w5SMn4JX06iiEzluZpj50q4W+w==
X-Google-Smtp-Source: AGHT+IGcYmPTReGL0zG3/OVEcuOZiUOtQkTsq1nQtRn0UypinsHysqfrn+8mmfFTx9nxv57EuKlx9g==
X-Received: by 2002:a05:6512:308d:b0:545:2f09:a3fc with SMTP id 2adb3069b0e04-5452fe26402mr7026380e87.3.1739958412466;
        Wed, 19 Feb 2025 01:46:52 -0800 (PST)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f105fe5sm2095131e87.138.2025.02.19.01.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 01:46:51 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 2/4] media: i2c: imx415: Add missing ADBIT1 register for setup output format
Date: Wed, 19 Feb 2025 12:46:35 +0300
Message-Id: <20250219094637.607615-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250219094637.607615-1-eagle.alexander923@gmail.com>
References: <20250219094637.607615-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The imx415 sensor has one more register for setting the output
format (10/12 bit), which is currently not in the driver.
The patch adds it.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/imx415.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 16a52900c61c..c5beba4da18b 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -77,6 +77,7 @@
 #define IMX415_INCKSEL5		  CCI_REG8(0x311e)
 #define IMX415_DIG_CLP_MODE	  CCI_REG8(0x32c8)
 #define IMX415_WRJ_OPEN		  CCI_REG8(0x3390)
+#define IMX415_ADBIT1		  CCI_REG8(0x3701)
 #define IMX415_SENSOR_INFO	  CCI_REG16_LE(0x3f12)
 #define IMX415_SENSOR_INFO_MASK	  0xfff
 #define IMX415_CHIP_ID		  0x514
@@ -581,6 +582,7 @@ static const struct cci_reg_sequence imx415_init_table[] = {
 	{ IMX415_REVERSE, 0x00 },
 	/* use RAW 10-bit mode */
 	{ IMX415_ADBIT, 0x00 },
+	{ IMX415_ADBIT1, 0x00 },
 	{ IMX415_MDBIT, 0x00 },
 	/* output VSYNC on XVS and low on XHS */
 	{ IMX415_OUTSEL, 0x22 },
-- 
2.39.1


