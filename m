Return-Path: <linux-media+bounces-34745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AAFAD8A4E
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 13:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 618133A61C9
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDEA2D8761;
	Fri, 13 Jun 2025 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+lh4K51"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E7D26B745;
	Fri, 13 Jun 2025 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813745; cv=none; b=BAbzUAk7U7RzVyzaOvC+mi5MZQbLjNOX3UO7a5V5mN6LGXpmM1V0DNPcti6dy1Q7g1JNIZbPFKu8Q1Xopb0aPLUKwDRNptGpJ8yjJS/y+m+EnszBZcwQIN44aHE8Wg0GUUHBp0/Rg3bUWRUB+QWvX/yL6crv5YoZBqZ7wdatNs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813745; c=relaxed/simple;
	bh=loUBtf8W60INWcTtQ4NQkAMupMusgbfDXpZrp8td7BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/roeXqIUM1veBx2TBNJfmGnVHTJL3At235NrbSA7BT1nhcnHdM7gx3amIaNTdaBFGHTYXbS/T7LpADFAs27O3GYktRSuQlpn2b3YhfPKAMichvzQRL0lb33eAHK/8XmHBxaqJgbqfMcx4semas3QTski4Yo84+eAoHN6K4K0TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+lh4K51; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ade58ef47c0so399275966b.1;
        Fri, 13 Jun 2025 04:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749813741; x=1750418541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cslt3f9C4mJd+mJKJpSfUQBV0IohQeT5wounvewwnQI=;
        b=P+lh4K51dly6ESh0+7wyBAKYEqqJtT72afLNRemNU5mxP7FGDp6CmXYvL/grzfezJH
         sFx/eRtAgfmJ5ASP+6CCWFeuz+AQL1+zZKK8lZp6ARi0tB4nynnqQclXw0JcIP56LPWP
         4vzOPHQ1V/FXOCr12oeNByCaCoH8/Z8v4yOzlnHkv38Tfo1QLrbOKeR80Ekvndu7PPMx
         V8Fa7HvbNLJWsFuCd6MTdfkTBjDgx4ApJD0Ph8VVpkMmDN18oV725VHGkznSx9e2aotj
         csFxf4bhplebicKjkp1tcM7tzKqKJnlP05HF67hUyFaMwAbqFBUzTbYGdEVOfgIDgfkI
         BZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749813741; x=1750418541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cslt3f9C4mJd+mJKJpSfUQBV0IohQeT5wounvewwnQI=;
        b=exbqYetcUWUzaWAQb3GHUs1C/ZggeHDZ+hDsJTaYAzBnIF4DtrkYEC6gMXCsvkky1V
         LA8OJU7te8vCeTsomOH2CAHrtlZx+D5UBRsbVcYfVYr6bq8WAJTUsdGgCo5qdvDUshqK
         D1QcX5fb++zkYCl0mz87G4xkjCXjcrUAvPfCjJEOWdrfJfX29DzV9ezro2ZV9w++W1V1
         Cgqze5iO/OgCb3OOOzux7WuFb9JzLNgfQzdqTlx8H3q0QjDkJiYfdY6G98Qg3Y3SfW9D
         fCZYc+yoszQ9RtTa3N0/8qaF253ZeqFtSsu9Z2tpSrQpoNnZDgPEgS7bb6JEhnXm1b/F
         hhfg==
X-Forwarded-Encrypted: i=1; AJvYcCV0QPeRr24P/+d6MEKDCERA1gMoztR0JjUwfebHdbMn0lJx6XGW76TnqQENKU5BgIhRBX5Rpy+9LCVuqEo=@vger.kernel.org, AJvYcCWHoBeEfJfi5BrwROouiRUMoou3uqK+lwYMBhelQ62gfxD6poH6kagiwasrVKFEG3UL86+EgFiFmDf4R7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVGbJROTOrLG60ju71OTt1lmXfH2mMuB/+AgEIbt0R1R3DQ6WU
	Z5iXKWgl14jAH+D7qOO/TaSy5xGmp2C+YCP4NmivbrNYNPQO1HK6n9Su
X-Gm-Gg: ASbGncua2odcYweNJIq15impAVxLMB432YRjKKImqyNzblkRDHm2+6xfvoi00NT8OWo
	zs5TEX7PcEnaiW7Z1YOWuXFkNEs8vXD3syTbuIAqsNC8BchW+ksRXIKZ+NN9+V3bI0mFDDxXuj7
	ZOoORCSGSUdxzsMR7Za6jdUXip03sDAfFoWuroC+zYAgB1jaT3US4m38NZK/SnWMzoJiP5+PwhG
	7KxV/S0rKgC4mJ6syhNSXtL6+hIS7nwC1ndkJYj2nJv5F8CKwnNBH/WumzEvju1jLzkQCnhC8Hi
	/DD/T7iLvJljsoBISOcAo+/zcP1iOTvMm5kab4n+smbiWF8RT/hVfODqqZbISPKKb+72MSg7+ZA
	=
X-Google-Smtp-Source: AGHT+IEx9GfzJrbNrYiYMIA+FYRdAm7xh2N93z+9r5XLJofNwKNlhi28bvRs4Begne6krdtPXTKLtQ==
X-Received: by 2002:a17:907:1b1a:b0:ad8:942b:1d53 with SMTP id a640c23a62f3a-adf4fa8ed37mr28379566b.27.1749813741126;
        Fri, 13 Jun 2025 04:22:21 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892b99asm111022566b.125.2025.06.13.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:22:20 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 1/3] media: rc: ir-spi: allocate buffer dynamically
Date: Fri, 13 Jun 2025 14:21:51 +0300
Message-ID: <20250613112210.22731-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613112210.22731-1-demonsingur@gmail.com>
References: <20250613112210.22731-1-demonsingur@gmail.com>
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


