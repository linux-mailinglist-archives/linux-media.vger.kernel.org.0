Return-Path: <linux-media+bounces-34747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89102AD8A52
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 13:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10C947A839C
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922912E1746;
	Fri, 13 Jun 2025 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDQsn+LP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB72D879C;
	Fri, 13 Jun 2025 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813749; cv=none; b=IVKe97a31roAYt3JUgKXWINac5kM9PlwOyrPt5Hp90kY8Hy8OWB5kKxuL8vM1TeBbcSGUy6QdlEWB5KHvuJhiaiaeq5JkuRTRPwVwioKF4uy7iTyz9lb9Fe17y8FC9NlDQpDXln3q2yuYKsVMoOurXv8tLFNweRKVVOEbMi1nlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813749; c=relaxed/simple;
	bh=eYjZCfQ0f7Bv/kFih3mI4oepqqLcQ4rw3x9HPwSrX5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNTAv1tc0jCOUbjsdVw5FReiIqJBlSuSLbD9OfcUq1s+iC3gv8DSCpqL3kU+k1szi/f+G5DJQQXuiNUbnDhfJizOiluDGApzU95YfUqv9VEG4VsCF6ovBNSneIBzrWW8GoYHAiIEffFvIjqNDtDxjrimZf57+HCGbB38OTxfoEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDQsn+LP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad883afdf0cso394079366b.0;
        Fri, 13 Jun 2025 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749813745; x=1750418545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CHsP8nua2vc48gch5Autt0Ao+kx2eun61DBEUljxec=;
        b=FDQsn+LPZnZ8qWFmp1+fjIe+Mb4u7vn01UUrQP7uaxkjG9PXopRx/rpGeur1Z3kPtb
         HwgBemVUacUMu2WpkwGrVpfcYw5nfuEyZao84UnIrVKTUAVPZujtKYP8oeaKSnWwBAFZ
         K0kXfiXSxKz+J+JrHxHgS99qVSoY+/czbiFSjfELkZ63qwVFHY6ULj/AEHdekpIibf2v
         3aunNuodv4TWw0EFxGVQtoloFOq37Zuoyt3cVC29klkebvmZMdf00bCTrBtBxpzfaNir
         t0aMkNlmmlyNrCu2ctrdLOtboxF/k56yRsXwgK27PJ8KkZgg1DCDkukvAyiLu2yLENHH
         mpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749813745; x=1750418545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CHsP8nua2vc48gch5Autt0Ao+kx2eun61DBEUljxec=;
        b=v+n884EmMMD8XSMQmxL3dYV34bOuM3Y+OyXioPuOFqWASp1R5tHzjqDupVCAlvUHB2
         vWg7HzqOseB4fcs6vjRjEUaa6jJDQ0wuKXwUFZDhvDfTj7z58CHhW453iRbrqMGIeRGg
         eDIGlq5Zn8FAzsniMPrwd5I6xMyVsBT3QgFUGMlm+8mHDBNkD9pgK8IorRJA/4TtZHZY
         9vOajPLRxwSMFmB6fcFcB0jrhUH+lgwV4jX8u+QhW85hQgjzy/iiNcEDOOaKmj41boEX
         HWf+Rz0PR8wtPwpEu2LNFIhbl9WlCPKvAMiOzG+uufkNwSt8BUgrVn7Vib0DZXi8xP/3
         FWMA==
X-Forwarded-Encrypted: i=1; AJvYcCWCbBrz8R4YXL69mpvvXBdXpvxWE0Hr8/evRzH0Ro8Nby7JuFuFSMaKv32Qz1lthRFtqZ3w3OGoNv1tr0c=@vger.kernel.org, AJvYcCXxgmSqOv2Bb6DOUGrY+jQ0WD/1ifgmop0FB87Si87NaiihEKWHKnJ6puCsJXCXtCX/I+MGloXTO8g3lQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYc3q77fDZqlUuRHbAezTyVmaBvm0+LidpXxxbBxbyofA88Nvw
	ic3JNZ18Foo9GMsn9DkQBmt80STjcrpRghX1vSPTz6Xl76kMoyn0fM35
X-Gm-Gg: ASbGncs/OuJnNAPeBi5yzA0JiWQypqcRunoJNSUlU8BdsPtlHJElHzwIrnWuqN8hsN/
	+V7tbOSYMj6GBj4RKaWTJ1/KNMU1wd/C2asN154wko86cmd4RerBGkEAm9VzFq7jzrItW98e5V2
	1PMazPDV/UGq7A0xfJoU7uckLExfzc+GyX6bAw0m1PRzK0kdTjWuESd2Ru2cIhZMLxfsTVqZEyh
	LRzQMr5gy0TkMnhmlYQE5J21Kf8q4iEsUx9eDHP1Ici2yukf7f8jV0jj1D8pSHNbLO4/Q6HfB12
	NBSSEkKSPiiFFQPZhTe9RsEBhRH4CzugRBI4dBlr4fW/tqXcdO1FXrev/4E4It9bJuZDFvutCHc
	=
X-Google-Smtp-Source: AGHT+IHgzOkzboGNgtSvrNDUN1A1i0mKlOmr+iJfBERSN6L+klxvs3TkoUpW8lt4rPaYCN13Y5T0Ig==
X-Received: by 2002:a17:907:8692:b0:ad8:9257:5717 with SMTP id a640c23a62f3a-adec55ee118mr259342566b.13.1749813745190;
        Fri, 13 Jun 2025 04:22:25 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892b99asm111022566b.125.2025.06.13.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:22:24 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 3/3] media: rc: ir-spi: avoid overflow in multiplication
Date: Fri, 13 Jun 2025 14:21:53 +0300
Message-ID: <20250613112210.22731-4-demonsingur@gmail.com>
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

Switch to u64 arithmetic and use DIV_ROUND_CLOSEST_ULL() to avoid
the overflow.

buffer[i] is unsigned int and is limited by the lirc core to
IR_MAX_DURATION, which is 500000.

idata->freq is u32, which has a max value of 0xFFFFFFFF.

In the case where buffer[i] is 500000, idata->freq overflows the u32
multiplication for any values >= 8590.

0xFFFFFFFF / 500000 ~= 8589

By casting buffer[i] to u64, idata->freq can be any u32 value without
overflowing the multiplication.

0xFFFFFFFFFFFFFFFF / 500000 ~= 36893488147419 (> 4294967295)

The result of the final operation will fit back into the unsigned int
limits without any issues.

500000 * 0xFFFFFFFF / 1000000 = 0x80000000 (< 0xFFFFFFFF)

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/rc/ir-spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/ir-spi.c b/drivers/media/rc/ir-spi.c
index 0b54ad74cec0..392441e0c116 100644
--- a/drivers/media/rc/ir-spi.c
+++ b/drivers/media/rc/ir-spi.c
@@ -46,7 +46,8 @@ static int ir_spi_tx(struct rc_dev *dev, unsigned int *buffer, unsigned int coun
 
 	/* convert the pulse/space signal to raw binary signal */
 	for (i = 0; i < count; i++) {
-		buffer[i] = DIV_ROUND_CLOSEST(buffer[i] * idata->freq, 1000000);
+		buffer[i] = DIV_ROUND_CLOSEST_ULL((u64)buffer[i] * idata->freq,
+						  1000000);
 		len += buffer[i];
 	}
 
-- 
2.49.0


