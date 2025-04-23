Return-Path: <linux-media+bounces-30819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17261A9907E
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 17:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E8A68E1392
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 15:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BD228CF64;
	Wed, 23 Apr 2025 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m30e9pEf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CD128D83D;
	Wed, 23 Apr 2025 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420775; cv=none; b=IBdFr9jjxM/Ls239u8xlKULu0uenvonaIZtqzsG22wFDFo8xAKcl7JExGcqEcLeqhJD1DMyY10opyIb4hoft2j7lR+8YfB5nYJywIIQyye1cSgfkX0Z43USNFDaYSIj68ej6jWWhdkwiQXY6wNRTMGiWX3PbxwDjUiX0MROyCbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420775; c=relaxed/simple;
	bh=MKfNl/vKy4qc7YFj2UqPbycwbIBF6/vxIf1HgVczXlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqoOd1FqOPw7BAwFGgAN+dqUoqEpOuh2QaApQi8eMriIrQyModiz5BCO2a6DeFGcVD+o6pWjkaqWCU2iOunNkyeSNPCjNCrEH32Wq+1Y0KP7v/fuvSZOxPAmpiotnMkq4Td0bras8NDWLK0K36AyLinfZp6bkxgJ8R4cmSlYRkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m30e9pEf; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fd89d036so81611795ad.1;
        Wed, 23 Apr 2025 08:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745420773; x=1746025573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTcgf5wGkRP/G2TvF4vXSu8ZLKj7vSHNlv5neOpUl0A=;
        b=m30e9pEfdZT33SCL7jl4wzzCrAcQeIXtcipQ3GM09ScR7NE3wmvR0ssJmfslXoxbfa
         TaqClrKpIBKhYro/RZuh4NrCwI30vkTUVZE8C13poazrxkbCEK3ZItWpEvatn9TbCc1j
         h1qDc3B/4XmtDmOnJWpzTOLmyxMG+MTpB+vW56zJTBXC3kF5VnSielLa3TRA96Li/r2q
         QCqDU3Qwo5kOPlc5TbEXIB4Dyp2NH4o1UpEHrcOGZFq6ksoRFocM0AbkufkrSmH/x5Ne
         L/+3x7kdYEMSqbEEQzIazRY77wpgknSNOrHIZPS6OyGTQ4J9BOk4C9MUrJafV+agU9Xa
         zhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420773; x=1746025573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTcgf5wGkRP/G2TvF4vXSu8ZLKj7vSHNlv5neOpUl0A=;
        b=b0ou+WtKqZSUMVgL6WCHS+M+KjQfz9YXfoPKJ56GE5Gx7iYemwugFw+kQcb4vDUYxx
         u6djzh8WlB1QpsimCvcOKXtemX0QL6eOPsFxpjn3N67/anuzzA65XOs2mONuypvsFl2V
         X7bCsCnMF2uGOxCkvKQhKVhnBuZbyVNj6fggG57THW9YSB7DF7nDV1HIRSfuqlwyVHAy
         3yXLF6WlQgERIUuI2RY+lQgvQC/0JFkU0S39WWenDUw+gcM2TTRVl/KsplkKjEbQPMDq
         vFVRfKmown3C+4mr+qFwhzWBqUd4FZ3/1TAKv1vSYt7nyZ3tnvIPP8S7UAEV/6N0kMEF
         msMA==
X-Forwarded-Encrypted: i=1; AJvYcCUnGfrbRiupbsuEcUpLxcyBE0TAGMOtkkYMjs8us97d+a18+PjzZAYaWu7H2HBnWRROwjYXz3Si2FoF/NU=@vger.kernel.org, AJvYcCXnnuG97lndTgZM1BCdJkPbnXldrVXcxwBCr0hH7f+fl7BtNJ/JiuhYO/8gf5is0V8gsdM6iYM6OqkcbC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdup+pEM84LTdRQRDp3Lvk3HfJpFd942TNXHBBU/qPfjHeq9u0
	/C/+g9hf3l/W72htfspZBQnHPazYTvxeYzTt1yZwnLzLzPOGSre3
X-Gm-Gg: ASbGncuZ0Kd37Gm/SLrPwaC0QZVKEMye4AnaUP5GXiZwzChVuO6zjnYQ4uh9rPIC+Mv
	VWbFjpt8gU2uAjs/vsgOtfpS7TToW5ohxjBjL/0cd8n1Fgjc4J55zeTmyyRAaT9m5T+6W2L2bCj
	2Uuvum0VrOSFb+knzsN9cg5ONEeW8Mwhdze/dfUY4jvv6NVnF5xpUZm70hC6P3wXwvzmLoETzjI
	uy1aNws4Gj2JoGCDJKJn2qWnQXYa2hzD8KkTTnMBXXNlvGnCXVbqH5Lq8fLUCPNVuD/76BaWkS4
	1RZMUzrBpSE1MDg58sDn30G9cWTO2tcvTQY7CqwxfeRfQVudv2Y0qFR38z6eS/s=
X-Google-Smtp-Source: AGHT+IEZYUncIM0+Gq7FgAxhpIWNnNJTQ1hwm7juNuxoQt6bm/+vxQDEWXqXzxe7i+iQELNVfASfnQ==
X-Received: by 2002:a17:903:1b25:b0:223:f408:c3f8 with SMTP id d9443c01a7336-22c5357f266mr285717295ad.14.1745420773250;
        Wed, 23 Apr 2025 08:06:13 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([223.185.129.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed12cdsm105519825ad.204.2025.04.23.08.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:06:12 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH] media: i2c: ov13858: Enable clock frequency macro
Date: Wed, 23 Apr 2025 20:32:49 +0530
Message-ID: <20250423150606.26917-1-nueralspacetech@gmail.com>
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

Thanks for the feedback. I have revised the commit message to use
correct terminology. And please discard the privious mail as it doesn't
have correct patch file.

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


