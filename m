Return-Path: <linux-media+bounces-34504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7EEAD53CA
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 13:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77E2518999B5
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 11:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FFE26A1BE;
	Wed, 11 Jun 2025 11:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARX3ysvD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE71625BF0A;
	Wed, 11 Jun 2025 11:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641051; cv=none; b=LoPuWpov+Qk2be32dCJWmSrlHx2yhAOGa9SW+pyyTY1XaVjcTBk0GghffIp0WHCWiAWSLEzvHAVvpGnr6OekpuRavqBIhAgYWrauUETU5Ifi4h1q8ChqK2KDLx4YLUTQTb51IddfpN9YujRr6/RP4lnyO3shEcXXMF+yaex/J28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641051; c=relaxed/simple;
	bh=qQowHimkDY5O36l9bcebAPtoLD0YCpWgzZrC47GAamc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pAMjPZhGK2xxm/8iqFhQkC1JWWDM/+Cn5EwQrswRgOTm3s5i84R/KUzXAdxjSYdUvsk8bQTjvQ2kYWhDwOdoP5EbUtLoZr3nJaCMy4qrRnJCW2Rwml96Ma18E21rZMBBqEKdQWxHhplb0MZd2OR3TAdYwMd1itpREQiti4mh2mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARX3ysvD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so7339936a12.2;
        Wed, 11 Jun 2025 04:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641048; x=1750245848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpCsjn5uBLet2HvbNimusuBhVPBOv0so70kd8GNgKhc=;
        b=ARX3ysvDX0wt7v0H14YnQuctEVwOqVcNPT9Ec4M1PhbrT2j+EQ9nJeUm1Aw+Jvfq7K
         Gd88AH8095pp31WgwzZzT05x1WT+TTDoMvA4MSnRK6qom++neBFeYvA4E6cnr72U6QnN
         0rEARBrhb5OctL1iK4eTRukKbc/9NS/WqbV6qGuE5M3kMJY2GTQBMm4QuRutRlrRSXFp
         OXMIa9QW/d+vexz8y+1EnbOOUM4Zb3vpAb7nwdSutEzJtlnNtoLetlMBSR35d3twIHym
         kL9ag06szR1BZdA9UpBO2Xa+SL9WT/hbTrieYVbvS1V/e7HLpUC6Ph1DOIAPei3JBubY
         DjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641048; x=1750245848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpCsjn5uBLet2HvbNimusuBhVPBOv0so70kd8GNgKhc=;
        b=P5Za2aUhdPTK84MGymlBXREU5jxPWEEHqzGO1MgWURL/6gsFgIr+FfF3hk91WgUtej
         72wvH22B0ra2jzAEX2D8/nSL9knWuxH4j1Bay9QnaZOoR1Ccu82rtXO4WBMR90G5X9fJ
         a0SeXkHFqykempTPk7GD1q+/H2auUbxAkyBO0QkhsvmzBS/036VSjcHzDNtGowt5WRhr
         yq1Cbto8v92djAGvzOIarGM90oj7LUd7Q0ESH+qCUUHFREjfRJFtVIEAc4O5CLXM/U9k
         drpHq95IXSPS7JSoRJghnvxc4M8bunZ9ALB996LoRdyp6w49i/VcPaPA3Zde4wMurpgJ
         Xl9w==
X-Forwarded-Encrypted: i=1; AJvYcCVHHzjsbjn8xdGHPbKtq04RJ9SQiwAoX4H/PzFOF3pLBhCrdXbqQCGUkslrb3mzU5LFFnnRXrUPTQ2RocQ=@vger.kernel.org, AJvYcCX+5oa3xitXCrA5KXe2o3DfvjURVkkDGpWDM4RT10MpyET/oKc8vfG5xv9qRR8cTnYJUVyWgJAXGsPW0K8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOv0IIBOJiwbGLmTbHZxhrN7/r+ADJQCQ+6+ooeERNDtlEnNnr
	gfyrRDC7KR6RtUPvlaZ92/q9Q98GJICOZxNj3UIqlyU0Iac2bX0JfY12
X-Gm-Gg: ASbGncsg2XLq7RXJBSkI2vgf0P3l35UqcVdfq/DtZOb30ZiqbiAgXiRyguygHudsxrL
	awiUozT/su/ram7CgCp1pDyiyynKg7+JUqgRcqzBUvFs0Bnj2UbFNUfnWV2rm5vWLx6bm8UNBO4
	bq1AriuMlXwXBKChkS6xz19CsePW6RXSs+8rkEAjhQdyWit0tLtit5YzXvaSPaRVRYzfP9ChoOS
	eH8IlHeZiyuLh5G249ZstyuFwcGhRSCN/F3tEzdmH6vZQuZjulcui+nYprJ5x68L9NGRGr/DjS5
	rVgvpx+BWOSe7w2ByYjkw32J/feNh8faFFZC8WMFbOWydgc8JfBD8T1LvKA8kLx7Wua2APZn6S4
	=
X-Google-Smtp-Source: AGHT+IFKytvNTAGV4UC3x4PBNIjHTGD7hh3ofzJUyn9/CDwNUuqL4Zol0t3+992uaqsspMhYwBfeSA==
X-Received: by 2002:a05:6402:5203:b0:606:f37b:7ed1 with SMTP id 4fb4d7f45d1cf-60846c0af35mr2329260a12.21.1749641047875;
        Wed, 11 Jun 2025 04:24:07 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607fbbdaadbsm3739639a12.51.2025.06.11.04.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:24:07 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 2/2] media: rc: ir-spi: constrain carrier frequency
Date: Wed, 11 Jun 2025 14:23:44 +0300
Message-ID: <20250611112348.3576093-3-demonsingur@gmail.com>
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

Carrier frequency is currently unconstrained, allowing the SPI transfer
to be allocated and filled only for it to be later rejected by the SPI
controller since the frequency is too large.

Add a check to constrain the carrier frequency inside
ir_spi_set_tx_carrier().

Also, move the number of bits per pulse to a macro since it is not used
in multiple places.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/rc/ir-spi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
index 50e30e2fae22..bf731204c81e 100644
--- a/drivers/media/rc/ir-spi.c
+++ b/drivers/media/rc/ir-spi.c
@@ -21,6 +21,7 @@
 #define IR_SPI_DRIVER_NAME		"ir-spi"
 
 #define IR_SPI_DEFAULT_FREQUENCY	38000
+#define IR_SPI_BITS_PER_PULSE		16
 
 struct ir_spi_data {
 	u32 freq;
@@ -70,7 +71,7 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
 
 	memset(&xfer, 0, sizeof(xfer));
 
-	xfer.speed_hz = idata->freq * 16;
+	xfer.speed_hz = idata->freq * IR_SPI_BITS_PER_PULSE;
 	xfer.len = len * sizeof(*tx_buf);
 	xfer.tx_buf = tx_buf;
 
@@ -98,6 +99,9 @@ static int ir_spi_set_tx_carrier(struct rc_dev *dev, u32 carrier)
 	if (!carrier)
 		return -EINVAL;
 
+	if (carrier * IR_SPI_BITS_PER_PULSE > idata->spi->max_speed_hz)
+		return -EINVAL;
+
 	idata->freq = carrier;
 
 	return 0;
-- 
2.49.0


