Return-Path: <linux-media+bounces-19119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E59915F9
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 12:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A8711F234F6
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 10:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF5614B959;
	Sat,  5 Oct 2024 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="seD4MwBA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A34145B3F
	for <linux-media@vger.kernel.org>; Sat,  5 Oct 2024 10:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728124274; cv=none; b=qZAOdxypXdfO+YqC8IQxRrIDjvYdP+Hq3HlJEOETpRu7ZA7Ld4LvkGZcrbELbNDcPdtPOm0X8SQ4/T5RLq9OgAsLLFZcyw1XUkVk4TRUKpJKjksnbgXKYUaF65V4Zr1PN2ItKI18dXnMsFUGrj/+sIFqAB9GUTD2DBnGlCKaYGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728124274; c=relaxed/simple;
	bh=vTwVvG8iZlHzHza+YS67mEwp2zyunt+kNzBDYWtFYWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJKt3vdDm5FpJOERSMdtBbx49X2QARRHhR/d7ixWnrYRnueTue+6laHD3oWSt9NjmpT/ldiYh6RFfOdZRg3PDClHgQpd+fguNV46Ksqe5n7UloadFWNs0BKk2c8Qv9cXrHcjYR26ExatBWktrYBSfxAYuTU/8gYBfiAm7clTdMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=seD4MwBA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c8784e3bc8so3778696a12.1
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2024 03:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728124270; x=1728729070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7nKjwcfTxwC0PwN6GrPgJAgBaaTNk6QSx4URpDS/gc=;
        b=seD4MwBAXKkpEdn7C2LoWocjv2PJcqpzzHZtnkFLnk7K4G2StrEv7ndQi7uQPR4w6J
         eFO82dx7lT6bmLzRmBFwyxk443/8KNqlAPdrqG9lxfHYZhlrP35FrThEEjFuRqD3ehPL
         sayZoBqWNP7oV4kqqefXGpETtao/PBOb3gIn2XEJOSdk8SZ8qy/Xn3E7+RiJqDDsmnYM
         VfA+ADHB7h+2wdIwnagGEJlplyoVVIw7RG0oEYAPBQCcGKf2OQikpYKRPfO6ucEOqwaJ
         OiIw0WGjPDsvKWI6gIb6lQnvqAAuiHJmd6cpqdf+Pr2H3aWwaD+2ezAeIsdEhDuZwJIp
         NbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728124270; x=1728729070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7nKjwcfTxwC0PwN6GrPgJAgBaaTNk6QSx4URpDS/gc=;
        b=fo2nCl7+6g0zvJcOhvX85vB3H123UZB8ZLwix/MzEpI7ZywvawhCCNorSsZPdUOxHD
         nRnQBUdiETW1f6y3rpb2A9svMg5E66YrJa4d489q14gIaUwwfQzEoAwUWAxQF2Zy1ABq
         i9nq/KZApJVJsrtjmZoM9kKiDbbzDlyp7E8Jv6lr0VQPq9SlRePbSvXasJPJ/HCktxTD
         nydAHyp1k6ytQ+Rn+pMe6/rQ11v8oDzYvm18oed3BGQYwPUN2MCJW0E9jld1HBeh1VER
         E2u4SCdRe6HisutIMjC+Ymk4idRIKahhYiYd+MrsMRPH7/zQfSKAn73YMeR60xfOZb3a
         h77g==
X-Gm-Message-State: AOJu0YxjWPNp6XyDzpUTlNKqyoM8xew9LCFcNo9CKZPZ8vB1uOM77jzp
	zSoLmtnO5njCWRNdr3KP/ywfQ0T64h7TJYsTLhvtHUvsYnMnsqcHpZWGHGGBya0=
X-Google-Smtp-Source: AGHT+IGMw6qNSWut4ShGQ2E89T3alI/rY9/tMRu5/jv2l5XfRLkJFb4c9fLiEXAjApPQ+ggWZtlBlA==
X-Received: by 2002:a17:907:25c3:b0:a80:f6a0:9c3c with SMTP id a640c23a62f3a-a991ba979famr577085366b.0.1728124269473;
        Sat, 05 Oct 2024 03:31:09 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e7856bfsm116315566b.138.2024.10.05.03.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 03:31:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 05 Oct 2024 11:31:03 +0100
Subject: [PATCH v5 1/4] media: ov08x40: Fix burst write sequence
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241005-b4-master-24-11-25-ov08x40-v5-1-5f1eb2e11036@linaro.org>
References: <20241005-b4-master-24-11-25-ov08x40-v5-0-5f1eb2e11036@linaro.org>
In-Reply-To: <20241005-b4-master-24-11-25-ov08x40-v5-0-5f1eb2e11036@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jason Chen <jason.z.chen@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2802;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=vTwVvG8iZlHzHza+YS67mEwp2zyunt+kNzBDYWtFYWc=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBnARVpPvMthR5vaCpvzYZx2Ib+Iducs9nYCFnN1
 kMDZUqdG+KJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCZwEVaQAKCRAicTuzoY3I
 Ohj/D/49VOqkWw6B83cchu7024YSwZ9ifrGHWKGj5dPQ/pm5R19PW26WsWa9rD4GKbaz8Yc+ZZw
 qoIiRg+ezt6zLVHtRjS6xIM9k8tlZYGEyNoKtyqJGO54XJdkNiJc6P8cEcStc7YGOne9VV0/bFL
 FSx2wzfl1K4qmeiSn+sS2jV46Kbv/tjCXPQwgeEpv70mnkeQ0EA4AYOTrlVBmmNaSHMPrPW4DVE
 xIhnrV3xpK/kqwuAXSKdQGG0nFL+iAGMp3B0205d/l/PHqhuTFBGn14Zzm/pTmqfxOdCw763PWY
 o1YLwipqSyEcV/wtg7Abr6cIUeAu+2q09nasK2hla/bUdgNWoEnyXx/Vc+/7TwTZvd3e2K5ACys
 sJZlgUdlXQLDpZO5VeZC8xUEIew9i6d7nEm0SkwEMgsGKwS0VgyVHgOgDTo4PcGyyggx6ESl5ni
 IusIKJlYVKqpR3JYlRvmrDaLMSNUKQRGJhx0Jg5Jycrg3ZZSxe3YB+eor5oh3r9Ekf6xWoY5IcO
 xvA/5zvwRKDbWYUORrqVy2idpiPdK6T3huVpvn2lJshU+3qybWkyTg/vIFclJb673AL+AcD54+8
 Dovy2QRQMtreUzbPnbf8ehZ7B7crZjvGFlHONpM8G/Xzb/876xaePKi+dhDpflmHfkKrFoLpUSn
 TN06H04H50FCceA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

It is necessary to account for I2C quirks in the burst mode path of this
driver. Not all I2C controllers can accept arbitrarily long writes and this
is represented in the quirks field of the adapter structure.

Prior to this patch the following error message is seen on a Qualcomm
X1E80100 CRD.

[   38.773524] i2c i2c-2: adapter quirk: msg too long (addr 0x0036, size 290, write)
[   38.781454] ov08x40 2-0036: Failed regs transferred: -95
[   38.787076] ov08x40 2-0036: ov08x40_start_streaming failed to set regs

Fix the error by breaking up the write sequence into the advertised maximum
write size of the quirks field if the quirks field is populated.

Fixes: 8f667d202384 ("media: ov08x40: Reduce start streaming time")
Cc: stable@vger.kernel.org # v6.9+
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e80100-crd
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/ov08x40.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 48df077522ad0bb2b5f64a6def8844c02af6a193..be25e45175b1322145dca428e845242d8fea2698 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1339,15 +1339,13 @@ static int ov08x40_read_reg(struct ov08x40 *ov08x,
 	return 0;
 }
 
-static int ov08x40_burst_fill_regs(struct ov08x40 *ov08x, u16 first_reg,
-				   u16 last_reg,  u8 val)
+static int __ov08x40_burst_fill_regs(struct i2c_client *client, u16 first_reg,
+				     u16 last_reg, size_t num_regs, u8 val)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
 	struct i2c_msg msgs;
-	size_t i, num_regs;
+	size_t i;
 	int ret;
 
-	num_regs = last_reg - first_reg + 1;
 	msgs.addr = client->addr;
 	msgs.flags = 0;
 	msgs.len = 2 + num_regs;
@@ -1373,6 +1371,31 @@ static int ov08x40_burst_fill_regs(struct ov08x40 *ov08x, u16 first_reg,
 	return 0;
 }
 
+static int ov08x40_burst_fill_regs(struct ov08x40 *ov08x, u16 first_reg,
+				   u16 last_reg,  u8 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
+	size_t num_regs, num_write_regs;
+	int ret;
+
+	num_regs = last_reg - first_reg + 1;
+	num_write_regs = num_regs;
+
+	if (client->adapter->quirks && client->adapter->quirks->max_write_len)
+		num_write_regs = client->adapter->quirks->max_write_len - 2;
+
+	while (first_reg < last_reg) {
+		ret = __ov08x40_burst_fill_regs(client, first_reg, last_reg,
+						num_write_regs, val);
+		if (ret)
+			return ret;
+
+		first_reg += num_write_regs;
+	}
+
+	return 0;
+}
+
 /* Write registers up to 4 at a time */
 static int ov08x40_write_reg(struct ov08x40 *ov08x,
 			     u16 reg, u32 len, u32 __val)

-- 
2.46.2


