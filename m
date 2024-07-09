Return-Path: <linux-media+bounces-14744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E8092B5D9
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 12:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0436285542
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763B215746B;
	Tue,  9 Jul 2024 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSH2BskH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647CA14290;
	Tue,  9 Jul 2024 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720522207; cv=none; b=uYI6SD4VK3YVfSZQ7W4R1ImsqLPEOxrXe0zJMeB8yd/APq2S76HOuyN2PAA10VpKmBtlG3Mjha3bs6h6ueISDcfvnWVdOuvD/Bkvo/WlNtzzAJKH4IVMrZPWIKTnkehZgTc2Ag33a0jNgA0nLY0GNfwLZE2sWBtPltCS9OYmPkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720522207; c=relaxed/simple;
	bh=cfkQROxpQ3ODJ6mApydadNz5RDmrNUOliBwpjxyf0m4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=A+hyJXyBdNi4ySvtEWyQ2Ja4mIu2rF4Dx2v2f5Brltz6slX+5YUAPOoaOKEd0bekKcCqV5NGhEHGG2lavoZe4qZjdNvryOlLhNU7Qpsz0VJnaOha6tu3Vc+y1uFNFTgdDS/9kRaWj2uSFpaXomDDvR1U1/pDW6gB4fc50YDpm0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSH2BskH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42573d3f7e4so34001195e9.0;
        Tue, 09 Jul 2024 03:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720522205; x=1721127005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o7NZxGqNGmbidCE7D7qtZyKAE80sPf8YO3V55ixCNY0=;
        b=MSH2BskHsIE+fNx6/jRdE/LPiyhhU3eNh4f/7XLWGiHNTqbD2Md0s6TBZqkl6g3xF7
         PnAGmlklu3oqRGZGMM35PN6Ddd3JDK2iBJki2Ic3Wxsu2wqnflQUnfq3P62rUllKpgNU
         RYCxb/EaRBf1GjNeiSwulbMBtcs5Qjg5/xFMe5HW/1gNOb49kH7EkwCSvv9nYsvrRMmQ
         xWO7brwHnWdNfROGdzX4NydECeo2GmG0Ss5Kpw9FL3r8XK8CpIusW0ZwwS/VjYRyEckU
         b3Qf2zUzmMdLWVN1VMTnS0ildTAvsxBkGaKDBGW/fJnOrd2QTCgIdlAZ9HRXkb1ToqJ5
         3HGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720522205; x=1721127005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7NZxGqNGmbidCE7D7qtZyKAE80sPf8YO3V55ixCNY0=;
        b=GGmzbZWkvFud6IieA5Zbx4yriaMG79A9m6tNafcghmo2L07R/wIFfm5vhNGr4UumlM
         atCwWBFY27J95k3PsDiGtIN4Feyq5TSfXE8VI8byB25J8l8m0q3Snf5Edsg/jGODS0sI
         j+s0vjuahG3ixakfhOG9X0MlQ4agf1kcutdjoqp1Zbets6zcI+EsLgips9e3sW0/w1bP
         o1IJ1SVbBJHqoHPJeZmJ+b9hlQ0v0ak6djZRXRR55iv4tzvGITZ2M47iEB1/6QQOaIzX
         aRTJQwg3AxSYUmqZknUgVoc7DdlUuqOsZZBtWmyXxl+WFY9jMqdmvKb3EIvddgJRjjci
         ugfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNzgFiofhHWnZDRnPJGXPWFYuiKaO/iVmlHaOaZad8kfFBaOR3IAt5ReB3oaO8gXpssub6jSSJOdEFEkZ6JH+1yi7iPgzra0RnuJeyK5LGpk6OwKUUZ6p90tyijiwCtVN3+EMKggq1bz8=
X-Gm-Message-State: AOJu0YwYAPqeDn85RY3YGIukX2MnIRS21iFuwP7sq87C7XEJLDkrEnid
	RhAdqNb1kzcj6ux49TSBJRz2QaqlycH4xL7wGmsQxYtDqgdgmEVF45JYeA==
X-Google-Smtp-Source: AGHT+IGW8y63IoUfQbNtYMROoq79X9Z5OSDL5E8FvO2qE/CK2lZ/epocGDaa+hTSOmot6x3ePsFB2g==
X-Received: by 2002:adf:a78a:0:b0:364:3ba5:c5af with SMTP id ffacd0b85a97d-367ceadc875mr1715790f8f.61.1720522204250;
        Tue, 09 Jul 2024 03:50:04 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab6d3sm2157496f8f.112.2024.07.09.03.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 03:50:03 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: i2c: GC08A3: Fix spelling mistake "STRAEMING_REG" -> "STREAMING_REG"
Date: Tue,  9 Jul 2024 11:50:03 +0100
Message-Id: <20240709105003.168142-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/i2c/gc08a3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/gc08a3.c b/drivers/media/i2c/gc08a3.c
index 7680d807e7a5..84de5cff958d 100644
--- a/drivers/media/i2c/gc08a3.c
+++ b/drivers/media/i2c/gc08a3.c
@@ -948,7 +948,7 @@ static int gc08a3_start_streaming(struct gc08a3 *gc08a3)
 
 	ret = cci_write(gc08a3->regmap, GC08A3_STREAMING_REG, 1, NULL);
 	if (ret < 0) {
-		dev_err(gc08a3->dev, "write STRAEMING_REG failed: %d\n", ret);
+		dev_err(gc08a3->dev, "write STREAMING_REG failed: %d\n", ret);
 		goto err_rpm_put;
 	}
 
-- 
2.39.2


