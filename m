Return-Path: <linux-media+bounces-48538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8FDCB255F
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 08:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FB623096D37
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 07:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711092D8DB0;
	Wed, 10 Dec 2025 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XoRPgO7T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FE82EFD90
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 07:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765353231; cv=none; b=tn5/RJu+nAUrxCb3dhU6y6gpFwv4SuCG6Biv6VCtfBqr8H6So3x7G8U3CwGGAqD2NI3UZKrAcV9bCEog9LUSDIZXdBj0GUSqbUAgJNu+JYySld/5MQmzSgEK8OYXXy2JPjwY+/MPzAF0cT1NMhoBsNV1DWGinluQty+PBRdAYTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765353231; c=relaxed/simple;
	bh=ePnoCWKip2cIHSqPrIrGzhyGvdPxPPk6rI23f0xnhYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Rj6gMzbRqvMYoD0l1EEw6JIkBmU9W2YR4YChS/NwccJHlTUy277Ur9LRa4aOtCTsmr6XDwR6KAtNgn+4ij/WPxhhxTAqiy8mUZPKaUx5WZVG9rywqomCJJhZBfWbBQtNpkj6Dz+6G26H4Q2RNMXgnG+wsi1f9Ln994cNKUJHyTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XoRPgO7T; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so6786775e87.2
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 23:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765353227; x=1765958027; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V1BHg8+szL3E6Lw6B7LVHRoAOi5qQw2FcVcljaowIFs=;
        b=XoRPgO7T0PJiuz5Rb1aAaPkLra3775IEN/ojgX+A/labVqB189lz/5HSScMhkanPqm
         Sq8cVETHwIEK6P3gNMWuvR+a6wtLZIyLxm1hLROnh6DY+ReJBCp1AEC1jjzf/iJTGwIJ
         0givQVmqsbKHoXBBSSNvh70deyFbBMf0n8igw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765353227; x=1765958027;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1BHg8+szL3E6Lw6B7LVHRoAOi5qQw2FcVcljaowIFs=;
        b=imcjqQrQTc9y2rp852YXehIvGX8pj75Cxv4KaqufT2e1VCt1MOCbM7T9mN39JAD6jp
         y1KnKUrXelCBFs2QbaT/Pn+2iRNX2+VZC84uZyHLXOE+FNKiwtm3tBNL1QUJAjqzWRAU
         JIkROkirLWRG7ETFBQoxCEDHinhkAwvhCBKCj3Pm7MQYgBPpqokB/X5eS7h5L0dMy1O+
         KaeBus4PS9z5NZRQ5ZvGVW5399kNpJUY43YksYCrgrQGEYlaGWU7cK+9354D9oP8pX9T
         C3idjbUaxWDtxjKGIgtvUY9wJcLMaRyUiOHPvPA3tPTXxMzC/K0vAjUyqmhCece8aAJJ
         XVsA==
X-Gm-Message-State: AOJu0YyZ7psWxsXToNaPQVegxLusFk6UB5xQpgGBnTKImTqih4Rw6NDh
	uZAP+L16fSNvltOIkPdCEamfSmrU0crb9BQ2k2f25+sFdenPRK4eG37oXfBiAn595w==
X-Gm-Gg: AY/fxX71stlJB7vC/XkA66MrarfMKVep2rUpLjKZy2tZJdy1Mb8/63ORBfQPcqxpmK7
	uSBkrnOXRwgYFoRTYbQ0e5KFKgEzxvwWSZwwURJ1qBXPFycb31yTxEV0k0X0hRg80VetsZpucd2
	S5mxz6LTcvulsf2eAxtYJXW6SXxjUgaBx62cT8bRyFT1TafoYVBU+eCUgPpPxgVcnJU1ciWddEZ
	KQRgQr9K4Uh96fCiryLmOJ1WXqXRnXFoQs9qxgpfdlALTF4NwKEeI0cVB1F9WxkZTKgpLf6VcaJ
	zdz61pSW2anvXaluUSMzriEZFfw20cXovD8ox6Z5czXfLUb5DgX99YNUY3iStkrmksOVa8Z+9BU
	MBTqd//Yi5RjylH1wCjHXo7EiYxJQlp4Cce3SqypuOCaLgiBssKH7Ughm4yyVXRbSVmAPZdh8k3
	b+m+VUjEhhegyd5EjgSUtAxu6BlLaqAUW0TY332pKOCX5nOvOXhHeCQ5asMIyG4oBQDifwkg==
X-Google-Smtp-Source: AGHT+IFSv0RfFBmRzjsgVzccPnKovL/rstrasiaNG70qNrAShz148A0XWyg9FozgTeW/S4EdnmMrtQ==
X-Received: by 2002:a05:6512:3f10:b0:596:9e39:9ea4 with SMTP id 2adb3069b0e04-598ee4af2f5mr657696e87.36.1765353227160;
        Tue, 09 Dec 2025 23:53:47 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e3b3sm6179856e87.55.2025.12.09.23.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 23:53:46 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Dec 2025 07:53:43 +0000
Subject: [PATCH] media: dw9714: Fix powerup sequence
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-dw9174-timing-v1-1-4a5036465727@chromium.org>
X-B4-Tracking: v=1; b=H4sIAAYnOWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0MD3ZRyS0NzE92SzNzMvHRdy1RTC0sDY2NLy2RLJaCegqLUtMwKsHn
 RsbW1AHpAK0lfAAAA
X-Change-ID: 20251210-dw9174-timing-9e58903399c9
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ondrej Jirman <megi@xff.cz>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

We have experienced seen multiple I2C errors while doing stress test on
the module:

dw9714 i2c-PRP0001:01: dw9714_vcm_resume I2C failure: -5
dw9714 i2c-PRP0001:01: I2C write fail

Inspecting the powerup sequence we found that it does not match the
documentation at:
https://blog.arducam.com/downloads/DW9714A-DONGWOON(Autofocus_motor_manual).pdf

"""
(2) DW9714A requires waiting time of 12ms after power on. During this
waiting time, the offset calibration of internal amplifier is
operating for minimization of output offset current .
"""

This patch increases the powerup delay to follow the documentation.

Fixes: 9d00ccabfbb5 ("media: i2c: dw9714: Fix occasional probe errors")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/dw9714.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index 1e7ad355a388cfc37253bd764ec8df98f59beeea..3288de539452ebae41daa0988b2d52f27a790da7 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -149,7 +149,7 @@ static int dw9714_power_up(struct dw9714_device *dw9714_dev)
 
 	gpiod_set_value_cansleep(dw9714_dev->powerdown_gpio, 0);
 
-	usleep_range(1000, 2000);
+	usleep_range(12000, 14000);
 
 	return 0;
 }

---
base-commit: f7231cff1f3ff8259bef02dc4999bc132abf29cf
change-id: 20251210-dw9174-timing-9e58903399c9

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


