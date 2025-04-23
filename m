Return-Path: <linux-media+bounces-30818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F02A98EA6
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 757A81B67E4F
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 14:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F113D27FD56;
	Wed, 23 Apr 2025 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAgSCVkP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C483175BF;
	Wed, 23 Apr 2025 14:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420097; cv=none; b=QAqmyAflNNd+yQj+QIcvmuGkxkwmOHS3HepbLLTWJuOTbBE3QeXVCNBlJunjA3SPX4W8NpUpwKQbFMwn/24qHMbBMLH9Nr9UtKlQl5aJZUOIeuhC2VEXn95H19d+WJrygX9ZJuvVL2vBRQkHxyAFSSsrM2dY2p7SjWf9A1xRxfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420097; c=relaxed/simple;
	bh=Wc9A61Zz11g83tlqW1DOFQ4UvW/DyqTaN8gqahVHOB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ke+CpKGWRtMKCq29ja9I2mODAfnyZVy3Imnru0P4WjI9n1y2YWhXKZmxW1vmBOI5rXw7Gkh8MNqjPS3Y483Fm8nn8bTCh9ZsyI/7ssg9xcH6kRc33z+OaBqz8xBWXnnfxm4GSBoFlTJRtd4xniIYE+jCcF4FTICg8ExdGZ9qgrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAgSCVkP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224100e9a5cso78414475ad.2;
        Wed, 23 Apr 2025 07:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745420095; x=1746024895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9L8NT1sI5HElpk2OIo93kPkVW1JxEsqlLvUnFwGIVQ=;
        b=aAgSCVkPQ4Gl9maXmVTmKJ4W3NSC0v6RnqCYX5auccYA+DIMzZr+eszcJqIVB08VrW
         w2r8oAMWz3De7PXZZjSEnMUbAEZikyHeYBdhE/QrjR8PkEl8JAhfBQHONqjh1zRvb1xW
         wMlWurCVBgtVgy98mGGQUtEz6v8iRaHq1NQPGWRRWIoQTgx2Q/Uelsb6PysRNZ5LNbrz
         XF8i95cTYL8iuIY0E5zjdL19GoPLOSHwpT2xF8XFlhUEcGgOnhCrxsvimSHbYRFEmUDS
         M9obLoWy9AZ5pFldFlYa4XYQRXKUd+AuExUUJXfZMBCXWmbnhv0/GqgtZvmdw4ETrHDk
         L9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420095; x=1746024895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9L8NT1sI5HElpk2OIo93kPkVW1JxEsqlLvUnFwGIVQ=;
        b=N57JcWCZE91CYsGYBt9Vx/9YE7rhdIeZn2Chuwd7Cq5fdYz6wzHEtsgw0kogQdvO3b
         dzp3ZCHdojF1+AKZKnNAK/eE9UZ3VyzGSFZd9+kTjFktGWAR4nbHrqlg+qloZy7kCxzV
         A8amiREiuOQYZ4BBlmHQjse/uzgtoDonbRfwSc9G0QnuDIIxeAwee0Oqdr118MLdJt2G
         KqoosXi2/wpCQs5Rlpls908H5PSllQhXLO0zxHlUoRvutUPb0NZQPTnLf5FXqz8xCUDp
         hnX4f/4zP9KwD4kp8R1DipXg0FcWZrPlRnNCju3A6QGkM4TLp7Ov5Ml2jwXpabRdnGr7
         jqsg==
X-Forwarded-Encrypted: i=1; AJvYcCVgJkJEP2nCCZYzr5C8QxUAErkBRQT4KnsLCgnxMo5bMVfpOhcDH9ZJmVriwdyUfrl5HQKoYEQ5FSnpXWs=@vger.kernel.org, AJvYcCVtglsA5G+tntymvOvbkpOk1egSu2NlVg4VGkbtmyUUwD9R5XIQBsGHkEAS7xrcjXSou75IfkYA8cOKoes=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU5f1FM6k1R1kABgJ2hkHse9/6ZkOe79lg0Ia+8Vfy/0MonAcI
	ijL0vNNX+RlEkOrib45UwJ3nHWR+VsVArRTL1XAWPbUi4wWd8A+uuBxJxw==
X-Gm-Gg: ASbGncuc4IeU+LnEOaFw342+KMb+oNeMNLfu3lVZwGkJSjlUHdfc8s5eNUXa5BtHUx0
	8//cy2euGaE0inq2C3XKq+BYwJZKNckVxJoLMMW7odZwBz6BLkxHQq0ApxH/YfsegxCV/h1bUM0
	mFZmo0+Zo7XTxCOjrpT0zHxrdtKTyEcjqf6mIr5mOWlK+Gs7tmRdXiqZ6+OaP6J2wReC+WImv9t
	2SZJsypihLR3nP1UPnW5gWgeZhnX2UkvdgiT5foCXkm2TrBwGFU/eNKhssw1hUJxfP4sHn+/HxR
	BeXTnV1SZLuzWjtfTgnE6jb8uhZOYmkD9IczsvxTuGxsNvk40EFopgyGMym65DQRYsRLqhYwWQ=
	=
X-Google-Smtp-Source: AGHT+IHdcTVX4/eBv3Iqn7kRy+NUkrDvuMMXYukENO07KV6GaDePMGVg/liTiBO2A70wYw1AQ8x42Q==
X-Received: by 2002:a17:902:d506:b0:220:d439:2485 with SMTP id d9443c01a7336-22c535acc7amr277796265ad.29.1745420094490;
        Wed, 23 Apr 2025 07:54:54 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([223.185.129.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdae69sm105318405ad.1.2025.04.23.07.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 07:54:54 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH V2] media: i2c: ov13858: Define macro for EXTCLK frequency
Date: Wed, 23 Apr 2025 20:23:03 +0530
Message-ID: <20250423145448.23407-1-nueralspacetech@gmail.com>
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

Defines a macro `OV13858_EXTCLK` for the clock frequency (19.2 MHz)
and use it instead of the hardcoded value in the probe function.

Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>

Thanks for the feedback. I have revised the commit message to use
correct terminology

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


