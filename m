Return-Path: <linux-media+bounces-34349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B807AD1C5D
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 13:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6CCA161480
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 11:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF99255E23;
	Mon,  9 Jun 2025 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dm+ZTXQ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E944747F;
	Mon,  9 Jun 2025 11:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467855; cv=none; b=HdSV+mcz+ZFhLHsz+pzgHJHu4WMKYYwXSYBMiH4H1pgqPuSQkcem8snbgDWlLBsHBtn4XsorvUs3Q5RVD7UehYeR5E4G5WmWXxY7oChDMrdq0LkXC9Jwb7Tmtzgt1CvWQkhGMKsjSgQHgIFsMRIrFNOPDF1WfuijxgF5VEjcU7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467855; c=relaxed/simple;
	bh=rm7/Sn8R70joA1nXgsERHotRyy0o6EsWO4xlioDF+nU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TVwnm6oJrIhtK7Yu4ieL5EUo/yUhL2DOwb79xCBCJ2ULZWgQEiA+TxUJWvIiJSEmmhLULGbouuTROmMdP4qjJRFF1lw2dnSepx2pxSOQi/VHoYdGOstEnJn6MrT/pVxux19JIqtFSQMDZNf0gqiMtKZgAys+q0yJwK80tQdoGjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dm+ZTXQ6; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade30256175so492761366b.1;
        Mon, 09 Jun 2025 04:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749467851; x=1750072651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+QVndT9s1x73LHa/50NWybEw6M6YRjTZGPQs2Gx3s7c=;
        b=Dm+ZTXQ60qlusj+TiUIeVzp2CMi8w5++pJ/9pj6TWURUn+HhK6lJMExY1FrMV0Qo5e
         NwNZ2bed3UCokTC1EPfOcmt6kcNASOIsQDXvfv/sTda8D2G2lAELOJv2UNb06Pg6CJuk
         NdTQujAjYbxRynhXMqbercM95//RZqrFF2lURcz6SrxYfWoLBLhJ1fszLp3fxotE2QYR
         vTbw8eCCQw5gxMRdy+j6O4EMGcvwL+dAUg0TZ17fQyn4r5gV7bb2vbMLaz1c95Ikkd4a
         ZhUeCiHKGqBDEuebOAZdtUORKpA74DY3KQXp15F0Tza4sc65wHmDUux9bco5qLbunxZc
         WmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749467851; x=1750072651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QVndT9s1x73LHa/50NWybEw6M6YRjTZGPQs2Gx3s7c=;
        b=lRJ8gi/4OqdmBtASRHDWHq0W7D46G4vwy7XTqTB8i0aIxNO0YvImBOoGJMnBH0Hr+5
         F4aGqOD1hVxHr/c+UwV8k/4+mJVxaXvTnhMfXcccREpVLiJAYOTLALndxnZU4AamSf8a
         Ce4OlhuSQPiosaIP45LEzn8Ye+4WXt4NS1zksbnz0BF9jWFwJledaVs4sWzSd3KONp0E
         bH71ZE3IwVV7StMa8ndyIEyupI2mqD5gEVlcAX6YOUQlhALHN9j+5moJrb553MPQ8Q3U
         rx9qHEg8rDvg1ivXN18EYHqMNUmHJ24a9NkEeGBQbJxFkuAb7tMNy4m9fZVM/jWJ/Aia
         s4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGXwQ54MQDHmo3mJhbn5pZS8lJFadzvhMJrvscl1kCI5JxPdPgm+MGmRiSpnO2Qq09rq7LP/5uyvuCEH4=@vger.kernel.org, AJvYcCXhcoDdlCq5Hqm+4DM5YHiRDthghDpkpDbibpuF2aVdvl8xi9KaN2jRqMCXItJOwm+YFgzkhOvHZdQcjEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuh5NKz50/cyV7CSpdhZoAAEG1Oc1BNnVBzC02TdkF1rG6dFN8
	nksSOfQElED59DR1sSPcKP67DJDnqRfink36Opebn3tTJ6+aDx1a0qKtMa16dA==
X-Gm-Gg: ASbGncsS4JhCLKrr9jjQB+idc3cjPmfu+Uvlc0rL2RsWd/B7nnyaI/rJA8DgQfYh8s6
	ELWyjYOZk0cC3s/FmWGXk/dEM2Wpaln6oJ9nSYigEN5CyLbBosqSGlrJEVkWg7Ci5XuNDjt34T5
	HiDjRoLWUeg1yxgPvgvGeRKGZkuqGhR5V63uUFSqaFrRKLIXe+gJWSKMJc4IhyfaTBPul/NOCsF
	/c1/JxQ7sPCIcrCFrKYWvPLPRQ756RCgusBhhVsnVDw33pTr06MTBJlg77dkcWYfw0EQMD0fTHB
	UdVX463BSWf/siIqeHfyunqHogY8DyNvM1CKpf8NO3IaX1+ZuHagDY+mEfALEccN
X-Google-Smtp-Source: AGHT+IHrT4QCR/BaVDL9uE3/1BsorCr9NkrQ8xWi0Rleivnq8AQQT8c9G6zHSUSFXsXVx6pWSogZQg==
X-Received: by 2002:a17:907:9307:b0:ad8:a41a:3cba with SMTP id a640c23a62f3a-ade1aa07412mr1202524866b.43.1749467850405;
        Mon, 09 Jun 2025 04:17:30 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c7efsm533446466b.77.2025.06.09.04.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 04:17:29 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3] media: rc: ir-spi: allocate buffer dynamically
Date: Mon,  9 Jun 2025 14:17:13 +0300
Message-ID: <20250609111715.2572138-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
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
V3:
 * move the allocation to be done per-TX operation

V2:
 * use devm_krealloc_array

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


