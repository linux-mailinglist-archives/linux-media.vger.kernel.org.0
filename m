Return-Path: <linux-media+bounces-34313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8949EAD13ED
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 20:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43E347A2A5D
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 18:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC631D514B;
	Sun,  8 Jun 2025 18:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imkYx/3B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46D71519BA;
	Sun,  8 Jun 2025 18:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749409103; cv=none; b=RE1FYe1TJTx9TjkpiCySmzZ8L4m5lPBQS++0WbIerNJptq0pS8K4Fyu/pBGn4A0V3ibJwhMJE94DlOvEi/00Ap8B3aYRO2Rq9d9cBv2cu6nhRAaHGKs2P0VxRfSezQHaTBVdMMoeFYiobRso9Yq8GGweT9B8yJe4yyLYQSoIxxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749409103; c=relaxed/simple;
	bh=88Uh/dRShAqEMRZ9HjGQGMvcN1IivebAqc9Wm9lCQFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QuwAsBc1U+1rVnJTS/YhPti125Y3MdSDVXFTtLsvKRe0QVMHLod4jiFaRKudWc0b6MIt1v81WaRrybAZd2W9iJB6iXSuk1GUj3jMBsBQsval7rIcWvfw+niQ40hfkaqHHMdWXssGIwLeFy8s7DBF4EvaufXWvvL6dNQzoo3mWH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imkYx/3B; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so23490725e9.2;
        Sun, 08 Jun 2025 11:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749409100; x=1750013900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QspH1QXhZUOGOJ5T/E0jFenLoFrw9f9dtqDQBN6qV2k=;
        b=imkYx/3Bh+nETLC/nun7yoA0/mo6cROK9QNZmm9PqUQB8rWtVXZV2RZ1pyyrU0vUCF
         8Sc7l+M7FQQi77OAuxrSwnC5TEnBsqzG71z6FSyswwmlBy8vZDr6A130cAwitKgCfN1U
         XLgoC4bEveBu+2GMgg+pwOFoCWk3zKbuI7ADkL9JtysYKEWUAmfowmcNazsqVbSyIDuB
         YlOmQ/I7Fzn6ixXTIIVbbHzDZIDf5iguFa3QrNSlXE9BZMAOi4dTChWixjX4nMlSPv3C
         keroH0QaXel/dPj3RQZruHQA4ofU/dOhOAqNuhQ0cs2XLbN4766etv620MiEQVS4fwBG
         cSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749409100; x=1750013900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QspH1QXhZUOGOJ5T/E0jFenLoFrw9f9dtqDQBN6qV2k=;
        b=rLqXwDGXATtZG6DtTiCuU/EgoKicQUpvnB0hBpgkZHKCKY6bcu3hmGXSu/Y6sHZofO
         O8OZD3iWuzTVO7ga2wz2dzdylnqUU+RLiKo9fzTW1OUtkXcB6bu4xCJiLX1x5kFVe4Z3
         xF3qkHYNaXBkPfQaZvXZBEx5HxPze98Gfr8/N86IW08U3ISzQcGwZi4DCeOoRjALIkF8
         u8Do70IRRHs6cIUVH/s95THy9i0iXn62RwGE3zJjEiPu0M+PlC4T3O1GmQ+C5v5oX2nm
         Ao2sUeKsGPaynjzGTWxgUbf1YuSVsKeHFQAYWJgVQL3AXhs/kgXPjNVb1wijKrct0wyN
         qYJw==
X-Forwarded-Encrypted: i=1; AJvYcCW/L4oI5JuFARZyHIgpM1FToePgSucKg7JZAD7xK0W+mBBHSnWJU87JC2lAMUvYSmAQmgU2MpHRXDrhDpA=@vger.kernel.org, AJvYcCXH2PwCNah8RYrltbZsquJkhsEU3tSfuYF7c5fgEZ3v+mNokA/0cBqfwzExN9twXgFsiKPOIPDYBuF2CaY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9VVX9dCkoipppSHY03cnL45NmUs0+dCuMuvPpgxpkaTj6SQCt
	N3btiI4rE7ngB2MUMXYVMU9roFvRbUAfosRw5Xbu9JVRJUV8iH8+3afkbuRh9w==
X-Gm-Gg: ASbGncv9d1/84eSDfDFbLhyzTy6UmzNhMzf/nQUMYZaovm+RI/GONYjgq2Ohtt82Mr1
	roo+sDRdBMowYEzjMlje7DhAs0ggRnP4lZ3EJNCraHnYkdhzwylCfJg1dSnQvfUX+HgvPoSEfit
	ca8XxdmFyLO63uP9rOYvZ+i1tW49lfGknlUSeFRbKNziTdc4RelAYJBuImSovotZv6BXQHvNu+L
	w8rTClboiNp+XRyrgBdJc4zwmL3KMPhxc8N1uSq8y6atqtf4hul2F5h7wVwmX3OwYlLu3GKFWdp
	3DvXU+L2bs8vtzY2i5drSbVG1uxthhOO90hVZBAwNKmuEqHbQf8IFc+pwduNGTln
X-Google-Smtp-Source: AGHT+IFwSWal1Zw5l3HeLqEQUgPizdxwO1ui7AxbVpUKdP678hvNhFUMh28xHc67H/xJ7L8UWGhkBw==
X-Received: by 2002:a05:600c:859a:b0:453:c39:d0c2 with SMTP id 5b1f17b1804b1-4530c39d5a4mr13919265e9.24.1749409099945;
        Sun, 08 Jun 2025 11:58:19 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm8005335f8f.16.2025.06.08.11.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 11:58:19 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH] media: rc: ir-spi: reallocate buffer dynamically
Date: Sun,  8 Jun 2025 21:58:04 +0300
Message-ID: <20250608185805.2159705-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the static transmit buffer with a dynamically allocated one,
allowing the buffer to grow as needed based on the length of the
message being transmitted.

Introduce a helper function ir_buf_realloc() to manage the allocation
and reallocation of the buffer. Use it during probe to preallocate
a buffer matching the original static buffer, then reallocate it as
needed, with an overhead to avoid frequent reallocations.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/rc/ir-spi.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
index 8fc8e496e6aa..b13efd61fb8c 100644
--- a/drivers/media/rc/ir-spi.c
+++ b/drivers/media/rc/ir-spi.c
@@ -27,7 +27,8 @@ struct ir_spi_data {
 	u32 freq;
 	bool negated;
 
-	u16 tx_buf[IR_SPI_MAX_BUFSIZE];
+	u16 *tx_buf;
+	size_t tx_len;
 	u16 pulse;
 	u16 space;
 
@@ -36,6 +37,28 @@ struct ir_spi_data {
 	struct regulator *regulator;
 };
 
+static int ir_buf_realloc(struct ir_spi_data *idata, size_t len)
+{
+	u16 *tx_buf;
+
+	if (len <= idata->tx_len)
+		return 0;
+
+	len = max(len, idata->tx_len + IR_SPI_MAX_BUFSIZE);
+
+	tx_buf = devm_kmalloc(&idata->spi->dev, len * sizeof(*tx_buf),
+			      GFP_KERNEL);
+	if (!tx_buf)
+		return -ENOMEM;
+
+	devm_kfree(&idata->spi->dev, idata->tx_buf);
+
+	idata->tx_buf = tx_buf;
+	idata->tx_len = len;
+
+	return 0;
+}
+
 static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int count)
 {
 	int i;
@@ -52,8 +75,9 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
 
 		periods = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
 
-		if (len + periods >= IR_SPI_MAX_BUFSIZE)
-			return -EINVAL;
+		ret = ir_buf_realloc(idata, len + periods);
+		if (ret)
+			return ret;
 
 		/*
 		 * The first value in buffer is a pulse, so that 0, 2, 4, ...
@@ -153,6 +177,10 @@ static int ir_spi_probe(struct spi_device *spi)
 
 	idata->freq = IR_SPI_DEFAULT_FREQUENCY;
 
+	ret = ir_buf_realloc(idata, IR_SPI_MAX_BUFSIZE);
+	if (ret)
+		return ret;
+
 	return devm_rc_register_device(dev, idata->rc);
 }
 
-- 
2.49.0


