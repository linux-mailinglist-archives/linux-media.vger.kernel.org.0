Return-Path: <linux-media+bounces-30971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0D4A9BD23
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 05:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15D131BA23E6
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 03:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193D817A314;
	Fri, 25 Apr 2025 03:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUj+kWlM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305302701AE;
	Fri, 25 Apr 2025 03:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745550477; cv=none; b=frzcE/2yEd5yuYmznL2RG6bmcsIMUi19ecvexnu8T1H+GZhhijeBFTg4XXPD7RcySDV92GCau3xG6mVRXScTPzcTs6zNOvYcI8u3VDNTUXM0qBEkuO+olrl6auoP1J3iW5MYb+AC1hYyz1bzTYr9zjLmWPvkItQ8K2C+WtinCHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745550477; c=relaxed/simple;
	bh=osAwogrtr06X60DTlApbAWL7QentYdhlQifM5SVV7xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYx6EmYjqXE7RbjMer7HpcmIspCf2T+uoq8VugcqBJMNlIBzLI4RuBePyFxhonN/951VTdY4z+SuVqv2AwmLfXtO11OlXiq65Arq7uzUKNlRYr9SEViC9N+mShTORFtX98inxpouViM9mAuEsXh220wRNQ3iNXoK5mWivyPDLSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUj+kWlM; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-301cda78d48so2129982a91.0;
        Thu, 24 Apr 2025 20:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745550474; x=1746155274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ta4nCPpvWFM1ePJJeTQkgOJ6CbAh0GB+fI2VCmWT/+Q=;
        b=VUj+kWlMJijoWgO9pxKOyxkIZtVJ8y0KgW3O+bjdWmgqbnnSVsXeoEfAZeyGhAhfEG
         +P8qOwEnxKu7OHQBjKaEehjLaVadBYe0mKbxvfl/zLVMrJnWCTa3DvxbHMxa4ejZMr9s
         4NHHa8rg+/c+3dj7HxWYziYc23h4SjklbJhIiU4B9JpZGtGSK+msHu/z39cDX4cK/1k6
         66Gl4OhknpU4GH+Z1e/C/Oqpz3QKhi2q2mFO0FvYVszIv1LS38fA3xB//emV3rITTWbR
         7JmsemMhJTEWyTwP82FpIB7nYS5td29nXjhC05daDXzzc2YMQGDFMnvrvqmk6Dnzln/t
         xx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745550474; x=1746155274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ta4nCPpvWFM1ePJJeTQkgOJ6CbAh0GB+fI2VCmWT/+Q=;
        b=fhuHTHil/F/kGMfUmupcuP1XBGpaiBqNmh65A/FjUbJidyQWrJMANYbwlDu0UOPxLm
         +hdPysRWPOVPnI+nr5keHBZ8agVYRVO67rZUJc40rA+RV9mUUziJwaf7Pk7zDC5oTVwZ
         Du++1u08bgqMZsLVCncJYL5GGNcnPUbI3CnOtTE0HwEnUq4u1Zs9UnItNhTdobS6WBvR
         ud0AZ2+9wZYd879oI/lyaTwmfOhaSedL/NOdWNoTCQ3XsStknS/BJ6omJZWFFit6kZ6h
         1bWf75iS2RLl3j44nWtefj9ug7mKcgtpdKQE2IGuY//FtubPWjDB88Ywbp0cKJaxVyKJ
         h7uw==
X-Forwarded-Encrypted: i=1; AJvYcCX4vsAPBus8DxCGxq5837Mf2dD3+L8WD6iSvT0QnZitLBzlJ52PtzVkGv4sPcxlcpD7NMrC4r2DHLIFnVo=@vger.kernel.org, AJvYcCXXRlUb6PmHZ8tuTkGXPqymKOJuwvaDfQOkbYnwfiLYu7WQHthP+1pTW3IYH9t3kxktKnwNhtmEUl0Nh2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi0JSnrxz4sa3L49EvrHAFDpcEw1tINYuj5W+720DwhRUFJ8is
	rJQBh71CAR5cgfQNbstU3XbALr6PjdwAKNUpdmiJ9+HxWioKGXyG
X-Gm-Gg: ASbGncsAC+KaiGPcurGsZaN9VajyUkv96/Bgz8bWnJP37F9RPfs+2qp8+b9rZUS3hbO
	qmaueyyfqvpGpt3nJ8Kk/LnzCeM4mxOPlUpyPBzPoAuccnlf52BBFSCoko3ty5AHU11ndwrAb4c
	60dw1Dtx8Fmyn6YyHIWlWNLtLR/dk/Oczp6Nr2IBHd9L9vRad6KV9MUZ5U2YNRSsczak6Hb+JgB
	ltyeoZfYPqYoi1x+ktS2OANl1qajSqnpnohophZKfk2Uk5RUo6XhzFkllTxhfkj+jMehMLaWQu4
	1eNMvxjVaKXzfyOHSGCesEy/8cHoQ+Ql5/bcQbsIEKsvYEz12lx9s3Jx1Sb2UI/JFJ5W8AhzIA=
	=
X-Google-Smtp-Source: AGHT+IEifdjAiAzfngzEiV7YyS9Y7MiK3e5I+cEbEH1gO1XVnoigbM2rorDzv6SajhWMcmhTeOscOg==
X-Received: by 2002:a17:90b:2e4f:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-309f7d99265mr1496670a91.2.1745550474140;
        Thu, 24 Apr 2025 20:07:54 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([223.185.130.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef063c4csm2258790a91.20.2025.04.24.20.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 20:07:53 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH] media: i2c: ov13858: Enable clock frequency macro
Date: Fri, 25 Apr 2025 08:37:10 +0530
Message-ID: <20250425030747.6368-1-nueralspacetech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Z_5K9Kz2i8TouhC4@kekkonen.localdomain>
References: <Z_5K9Kz2i8TouhC4@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a macro `OV13858_EXTCLK` for the clock frequency (19.2 MHz)
and use it instead of the hardcoded value in the probe function.

Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>

---
 drivers/media/i2c/ov13858.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 7a3fc1d28514..a1242a90cdc9 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -21,6 +21,8 @@
 #define OV13858_REG_SOFTWARE_RST	0x0103
 #define OV13858_SOFTWARE_RST		0x01
 
+#define OV13858_MCLK				19200000
+
 /* PLL1 generates PCLK and MIPI_PHY_CLK */
 #define OV13858_REG_PLL1_CTRL_0		0x0300
 #define OV13858_REG_PLL1_CTRL_1		0x0301
@@ -1664,7 +1666,7 @@ static int ov13858_probe(struct i2c_client *client)
 	u32 val = 0;
 
 	device_property_read_u32(&client->dev, "clock-frequency", &val);
-	if (val != 19200000)
+	if (val != OV13858_MCLK)
 		return -EINVAL;
 
 	ov13858 = devm_kzalloc(&client->dev, sizeof(*ov13858), GFP_KERNEL);
-- 
2.43.0


