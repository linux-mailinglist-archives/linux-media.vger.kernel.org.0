Return-Path: <linux-media+bounces-34503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4452DAD53C8
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 13:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54DD81898106
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 11:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF9725F979;
	Wed, 11 Jun 2025 11:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtI61jXs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A91D2E612F;
	Wed, 11 Jun 2025 11:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641050; cv=none; b=hI+Ye79TUsvmN+faIvTIMUf2H7GeC7PK7ZI75u10kHde2NrZ6h2XBAOqqj+uDtW4TeJplx50p6tSsqcNv/7mwELt0dsnhWFY9MuRmspYvtA+QOpGb9j0JKRTy3yCRDeZYfyKLn/Rd0U800LPS1Ol5NcsWdO6MihZukbtsu+divc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641050; c=relaxed/simple;
	bh=loUBtf8W60INWcTtQ4NQkAMupMusgbfDXpZrp8td7BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPSNTWvps90BibYeK6pOIhF5gRCP0mJ2+z5tRlYzOSsTwzfkgFa/BROvESlZkECQTW9dlBTxC5m0jFfh0yn4D58NLYp7jXOboMhgJXn0OV7h6BKgIa6tRVahsS4poZ+piMkLCVZQmoFhG52Vdn/UA9clQMu3hDBbwLcCuSpPUzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtI61jXs; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so6012804a12.0;
        Wed, 11 Jun 2025 04:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641046; x=1750245846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cslt3f9C4mJd+mJKJpSfUQBV0IohQeT5wounvewwnQI=;
        b=TtI61jXsIe5Ypt6D0oTTEToDitK6VN40s8yjx8GlcZ77/mSUwsTqyn3DCQji7dqOfM
         QRKqbDLTDM3kvHCCUKen7xrkoknELj07k1ubKVS1wRdktmVcBoYuuZwOYi20+kQQ38G4
         JuIrZGX7jeT1Y6Qe9eSehJdwQ4n/VqdGzDnU94PXuKHiuT2vEP2DtVTQXZ+1UHKH2bDo
         26f7kDqhGt3HrxKuJ1n3dGmBK/TD7IkDCom8L5RK1JAxJOZvY0w9syTa8Tyg2TGTZFAQ
         mMgY8RKz2C4khS4RwWflBk4TpHe4I0vmip3J4yqzBOhH4LWRizk/B87I9d7741+JiPHI
         IaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641046; x=1750245846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cslt3f9C4mJd+mJKJpSfUQBV0IohQeT5wounvewwnQI=;
        b=kf+zeUIGfZnZy7on2rH72UhiNbAwWXUUVs/OivgV/k/XA5gyO8k9nbpushag4qKAXi
         mvNWgnoBt8eGBc+ptVkeL79POg+ZO2QUs+6M+JolQbXpyHEsquzFPCxgzTutJqLzHsCc
         iyosxrtAqy8l1UnZSVn/3SOiV+UzLS/RrxY4T8kegU3QAkZkf52GXrT7sm8qalocqr6+
         y1u55ueBJXFuf1MYfzkqADXcuQFkiyYzesDytaV8wpaiot05nVdSdS9wxtWlkOxJHLzX
         NXxsXw9tfKqQ5YJ/S4E0Y2vPC8JogOoKKdSf7P53k0+IC7Zio3xRB7ejbdQAV3weZrbT
         6ZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpAVxYNxrfaTGkoR1yK9EjkSZzrtbOlaMknfY81XnbhWfXH5M/4/ZSIdsnPPswqweA8bbj+HfEFyOZSa0=@vger.kernel.org, AJvYcCUrCbGSDp4/SB7YA6bWHqGk3VfosqRMr4T/8kfQGsAwIKXzPxel9Gs9LrsgH3zxry+IR+RiQ73fVCB5/Z0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuQNIV/YJifMEM5xCpDMkMPsYFxA/Ut+PvIapyV4df8V8lOX+K
	KlOjTBujmHcybcpU7QQpfmPHlL6lCZBcyDNKSLz3oNjNdgRooIyOQzsP
X-Gm-Gg: ASbGncvJaSh/QVobQeCX8NMRotLjfi4yZHRcXWB1d5EiDu9akqjk/ZLPUzns63+vOMM
	/2Qv4zCigm1pMDn4S+y8uRqvjxPJi9PTt2jtpZK2NsHsS+mp/8IWu1qsg8kR1kGaFxCax25MnAU
	TbI450S1SDsIUFjmCWU6sYbT4ixtYAuatZTSKirlxZ43nydlYuNU9jkBOokztoYFc42QDd3A8UU
	SgTDIgYCTnN12CDktXEIUiV8vDKoICCp+ThlF99pc8qBTqRtEvRni/FYHo5HW24uq+P3vLDCc/k
	lltulv0V4roSIeCYQjyT/YyWycJxA401K6Bo0JtcJBoda5Eaz+pw1wR3bey7OPbE3NMFknQ/6WK
	w+604+hW+2Q==
X-Google-Smtp-Source: AGHT+IGJo96lLkcA/QSw5uk+MR9UxhuEIN7LAB4iLj3VPgMWdyQPUKL57ff+jJsp1k9QACWNGBaLmA==
X-Received: by 2002:a05:6402:5cd:b0:605:878:3553 with SMTP id 4fb4d7f45d1cf-60846c4d573mr2392680a12.16.1749641046254;
        Wed, 11 Jun 2025 04:24:06 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607fbbdaadbsm3739639a12.51.2025.06.11.04.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:24:05 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 1/2] media: rc: ir-spi: allocate buffer dynamically
Date: Wed, 11 Jun 2025 14:23:43 +0300
Message-ID: <20250611112348.3576093-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611112348.3576093-1-demonsingur@gmail.com>
References: <20250611112348.3576093-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the static transmit buffer with a dynamically allocated one,
removing the limit imposed on the number of pulses to transmit.

Calculate the number of pulses for each duration in the received buffer
ahead of time, while also adding up the total pulses, to be able to
allocate a buffer that perfectly fits the total number of pulses, then
populate it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/rc/ir-spi.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
index 8fc8e496e6aa..50e30e2fae22 100644
--- a/drivers/media/rc/ir-spi.c
+++ b/drivers/media/rc/ir-spi.c
@@ -21,13 +21,11 @@
 #define IR_SPI_DRIVER_NAME		"ir-spi"
 
 #define IR_SPI_DEFAULT_FREQUENCY	38000
-#define IR_SPI_MAX_BUFSIZE		 4096
 
 struct ir_spi_data {
 	u32 freq;
 	bool negated;
 
-	u16 tx_buf[IR_SPI_MAX_BUFSIZE];
 	u16 pulse;
 	u16 space;
 
@@ -43,37 +41,42 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
 	unsigned int len = 0;
 	struct ir_spi_data *idata = dev->priv;
 	struct spi_transfer xfer;
+	u16 *tx_buf;
 
 	/* convert the pulse/space signal to raw binary signal */
 	for (i = 0; i < count; i++) {
-		unsigned int periods;
+		buffer[i] = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
+		len += buffer[i];
+	}
+
+	tx_buf = kmalloc_array(len, sizeof(*tx_buf), GFP_KERNEL);
+	if (!tx_buf)
+		return -ENOMEM;
+
+	len = 0;
+	for (i = 0; i < count; i++) {
 		int j;
 		u16 val;
 
-		periods = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
-
-		if (len + periods >= IR_SPI_MAX_BUFSIZE)
-			return -EINVAL;
-
 		/*
 		 * The first value in buffer is a pulse, so that 0, 2, 4, ...
 		 * contain a pulse duration. On the contrary, 1, 3, 5, ...
 		 * contain a space duration.
 		 */
 		val = (i % 2) ? idata->space : idata->pulse;
-		for (j = 0; j < periods; j++)
-			idata->tx_buf[len++] = val;
+		for (j = 0; j < buffer[i]; j++)
+			tx_buf[len++] = val;
 	}
 
 	memset(&xfer, 0, sizeof(xfer));
 
 	xfer.speed_hz = idata->freq * 16;
-	xfer.len = len * sizeof(*idata->tx_buf);
-	xfer.tx_buf = idata->tx_buf;
+	xfer.len = len * sizeof(*tx_buf);
+	xfer.tx_buf = tx_buf;
 
 	ret = regulator_enable(idata->regulator);
 	if (ret)
-		return ret;
+		goto err_free_tx_buf;
 
 	ret = spi_sync_transfer(idata->spi, &xfer, 1);
 	if (ret)
@@ -81,6 +84,10 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
 
 	regulator_disable(idata->regulator);
 
+err_free_tx_buf:
+
+	kfree(tx_buf);
+
 	return ret ? ret : count;
 }
 
-- 
2.49.0


