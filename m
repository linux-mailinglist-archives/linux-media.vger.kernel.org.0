Return-Path: <linux-media+bounces-34314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19324AD13F7
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 21:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34CC07A4A15
	for <lists+linux-media@lfdr.de>; Sun,  8 Jun 2025 19:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDF91DA61B;
	Sun,  8 Jun 2025 19:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOd4Kn1s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36701519A6;
	Sun,  8 Jun 2025 19:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749410154; cv=none; b=mnXWStOj5IYj07mT+tEngTcLxkpHB25Y12PFVfuk6Ddvz/lE1KAXUbCLmjwpuvF0RQBTfulaqBnaAPKWw131jotX79c8Gp6eMAFPs8ewykLDDs06ahcd/eAvz0MsydEElQtnBFmpFtwp/dWjs6AREHvzZEAD2zM1yW+TorTiAbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749410154; c=relaxed/simple;
	bh=0n+FP6IKP0h8dUZFNxMKHOQyd4miE987XFTH1/jTiyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LmXo4SgKL36bHf/HqiU2E5dujzaBhMFrLDFWP4hSkTVcwok6PH3sv+bv2hKy4LH7jpul3WxmwmYK3hLQdH/3fpnERsc7r45DfmPuAwb3OfVECM2Rnz/7GgvtCfxMlH9b53YsP5dcd7vf0kBruI0qG5FreiZhO/ce6nhcj6wwBPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOd4Kn1s; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so7128542a12.3;
        Sun, 08 Jun 2025 12:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749410151; x=1750014951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BWLGTyZAa3gfmbNyB/lRce7+iTbTYhGZk9b72pmxMus=;
        b=eOd4Kn1slp1XRmPgsoeaOtfgpm/YkZtYyeCUR+KM5v06ZM86dKOdFLv5rcmYNY/a+W
         ZdRM1+FQ+zOORHVhhJJtq4OoGVwUzlxkGqj9sj7DKduG5+MukF9AS2edt4oXEAY5G7y0
         RlaoqAp9cPuehNPalEmG86IKZoPmPbxQnjtU7VFQXXtqQSg5eX+EsThnev/evohON44y
         SIPJiEO7mUUXGF7J7tf7BQ54Klf/jrQK5d14J6mFfWoxaGXSF81XsljSBCm3BO8r7abW
         bz29FcrrShuwy7Iy+HFEizyLkzIkp+ua/VBse3bXYrovKZ/1GHORLfnVrKHmRjgnZ86Y
         JQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749410151; x=1750014951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWLGTyZAa3gfmbNyB/lRce7+iTbTYhGZk9b72pmxMus=;
        b=Na8t4BhE85RmciqhhqE/0kKDYPkMzCvLDzvQc3GypKhWBrd7IXqy7+FP5NRo8U66hz
         uyhoO8MvvzhrmKQHcORPY310uiBdx4+vhkYk/sdELompKmqUBt1tml9Mx9k++f381u+4
         kHbks4XhieC5SFfjlxnVyOJ1Fy1MGaLKJUChkdzBS2z0PZlyygeY6abOMzUk9DTLWH8u
         fdXmbwmBSep+l75EM/iXl7nI4c2f+GvWL+uwyG7Q5JkxtDQb94aigx7tlJLSazbk7AS6
         0R0w1GXOYrexpXPLP0ngqRt0Zx1ZDHz+d4TWMVIdug9bnvZli3GLFGNXfzomNKGzJTBn
         czuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhpMC6CLD7KJJjU1t54aN4GL4Q5gQ7k84D0QfndnBk5Kz3yVybBhvbU/qmPUXVNAbcrHqvs1nWlwHAveA=@vger.kernel.org, AJvYcCXuf7maA+FSY8fofa+HmmadsIpqR2QA27xZYlCu2SuKNNfuVFBGxx/hqD9t/5cFNTqOM577ssVQOyiHxko=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKVW+zCUX2aumep9Pv+/gBIHnimT3OayQja6MXwuF0Y+WyPFzq
	U1w4bMKzjR2KPnx7sk1vgfIx6P8UgdLenQTHfMgpWbqnL8cXTlH1e65EfhgboA==
X-Gm-Gg: ASbGncsgOJQECirkQkvg8kVz/gxMerBbsvR55/IAWNfAgUq2Wsk5H/TUyDhv6MODHQh
	d0/DVMwzYAs5AMG0DnpfzhkQIgbncOp9qVP7zUuzYUi0MKRsqDpHfW2gJj6R2hA+eZloCYklc0b
	LYAJRM/Qw0PRQFyFklOoYbJqg0ICQioCA5HUW//mr/35f08+Si683BJOSAFQNEXwDgzKtiwjH/b
	Ppm7dtX1p1MVlE1FgaS8TF11g6CSsvGH1/p8EWXEtV2Ey+z/ls09r3tJ3qfs+9XgOk677qAxduv
	UWqyPjxDFdgDSeZPWt7b817ROAlHh318U7PaxAn5e9aLxHZKxkFB4ItieQLgCjEc
X-Google-Smtp-Source: AGHT+IGGZ4kpIgA5XTYvjIK27+j4SKnMshCGIC8nLAh/2siSl+pSKVczTVCuUkau7d/U6WjZlOj5NQ==
X-Received: by 2002:a17:906:f5a9:b0:ad8:8529:4f86 with SMTP id a640c23a62f3a-ade1ab5ebe0mr981831066b.58.1749410151015;
        Sun, 08 Jun 2025 12:15:51 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc39c34sm441037466b.117.2025.06.08.12.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 12:15:50 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2] media: rc: ir-spi: reallocate buffer dynamically
Date: Sun,  8 Jun 2025 22:15:33 +0300
Message-ID: <20250608191536.2181756-1-demonsingur@gmail.com>
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
V2:
 * use devm_krealloc_array

 drivers/media/rc/ir-spi.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
index 8fc8e496e6aa..2f931950e107 100644
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
 
@@ -36,6 +37,26 @@ struct ir_spi_data {
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
+	tx_buf = devm_krealloc_array(&idata->spi->dev, idata->tx_buf, len,
+				     sizeof(*idata->tx_buf), GFP_KERNEL);
+	if (!tx_buf)
+		return -ENOMEM;
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
@@ -52,8 +73,9 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
 
 		periods = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
 
-		if (len + periods >= IR_SPI_MAX_BUFSIZE)
-			return -EINVAL;
+		ret = ir_buf_realloc(idata, len + periods);
+		if (ret)
+			return ret;
 
 		/*
 		 * The first value in buffer is a pulse, so that 0, 2, 4, ...
@@ -153,6 +175,10 @@ static int ir_spi_probe(struct spi_device *spi)
 
 	idata->freq = IR_SPI_DEFAULT_FREQUENCY;
 
+	ret = ir_buf_realloc(idata, IR_SPI_MAX_BUFSIZE);
+	if (ret)
+		return ret;
+
 	return devm_rc_register_device(dev, idata->rc);
 }
 
-- 
2.49.0


