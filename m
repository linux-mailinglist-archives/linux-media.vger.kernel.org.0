Return-Path: <linux-media+bounces-44099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27315BC9896
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 16:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D89B63A50FD
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 14:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28B22EB865;
	Thu,  9 Oct 2025 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gF7oubbO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19AD2E9EBB
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020529; cv=none; b=WR6CtiiGrWyB5cAwMWFHlz6IJM8DxPqUb6Eg7kU5iGXB0LnCNttxismte026utexO2KoJ8LLf4Fug1gjWmT2vb478+HxxsFWraSDXqvgk/OwUKHX7GlaiRj6HEyGX7FNcPU+uYEv2gzQcDE76y8aklqL2BCZU7kRHOMqXtJYKpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020529; c=relaxed/simple;
	bh=zFAV7C6HOiSLgAt+J5kOIL2+5hrR7jxRpEnz3gcGgEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Echy6pYyyIjbfvxpiEfy84OiUxtvqvyZaL3W3sdRa/o9Uh2GqMvz5lSXCGGmlYwnbhK9gGTmvphJEPJ076b4CyIvPurRNrXcbaxcAbVQiRuH7MU7K4qyPQoP/mJaurQZTLHx/8LLyszm16qfa68G/NUvJ6am1TfSNoO0XcG6Poc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gF7oubbO; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b54f55a290cso91750166b.2
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760020526; x=1760625326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1L6kSB6WPa1m/EDbSGocETHDW+ojiTh43qomBSeQcXY=;
        b=gF7oubbOBPnX+JGKuJ1WhV8xY6vaWtoa/Qv1Du5dueCCWPZiOpH8k4yWKmhCo7kxRN
         EdpDfHzwh/bJ1XXxZ/YhlLXtPKweAfhc2vZ3aC0VXBbwZN7V63O3NfpwewjN8nuHWJFG
         QRZF1MgxiU/Yhhg1ZqPi+eUX+rBMhRlKCOE8+TAr+E6R/lAOpppKqiYS4BDcpDHo9iCO
         pzSFKLwCnzaerFL6al7M/LQ52Ljk6ER0MnFDe81950KUOManAueomzJHxzQPHj4Wui5Y
         dymQx/4nL75ZJNSq6TV2mM4cT2HxwRb5KuGoi9rqM9CYThnkkER5SqKku6rx3kYbzxY4
         TLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020526; x=1760625326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1L6kSB6WPa1m/EDbSGocETHDW+ojiTh43qomBSeQcXY=;
        b=bMxuuZTOCmTWlYPmzdJ58ii/m9oexXA7uhLlvkLsu5/XSPs0NXzFNO5uosqZdys26s
         djL0RXTQXOLp9y39Hrr7UCOoUb4rPy/OpUcWZ/jFtqIdHWPnSXjGiMfMFvKibSXedv9j
         lmAJTnwHjE6haeNfmIxnbwgA4KIGl53MWrEmNUOgj0Bdahs1F52vSZVBZm8FKcCAjro8
         LnF7cEOtFbpNU3iiMtQO8EMfnlOZXEGgotkxglKB4upJBdY+cZUSor8jjShJf4L/kzmc
         oWM0coFxpiVgkgTb+xiL1ZCWHAAjccKAbJOxJFRMxye2klz3kSY2iMjJU0MmzY5lDN0r
         1JHQ==
X-Gm-Message-State: AOJu0Ywyi9N/7CYlbq8OekgVvcrVmlIi/0cDCTQJBicH7D/IUd0dpmtV
	GXUMvDYz27VdLCx6iE6u9FcbM2nswU6Z8D9lpnJUY6e+BOzPl792OVu0BKvFVXIOk2j466uAAfV
	7tr9R
X-Gm-Gg: ASbGnctrxbhjsJcnnSrTQCaavap2FnzRV8reMHwAtk6JC0J9/zWzm04kZWYGu1yjRoj
	6v3mqTiwPEDikhNAvJZzlk+c0+m4TwGhtRKFgEqpzJA9SNe9/LJIJgTPZjQbukimRCrYtOE7eBN
	EVl/1a2I0Z7WqSJ9nX4Pbe1oU4TjViCLADPX0IN9JycdU7yyNged0J6BeqvxRkWv5qxYVUJUdeh
	MNUp7oDKQHS3DAlXMOSKlhk2VE6SXMTlN6jw4uA2GnTCyIySGcf0blh8ji11hxdGKwLfgURV/uK
	duDbCo4U80tgG65kCMb3q6fztjiH0G0tOmWhvKPh/2qG78mMEAXeJ8W9nvLNojNB80X5QnpxZz9
	MA6JOqTy8ouisQKUVgzaqUEeQ3GZokb9j5YGW3AFU8r7PWDhsLoBc9hzSXtUHqaSQSlQS+yEz9X
	RH5+hA5JKKw1nfdj3Rtec03iA49FcnEqxXWKQustA=
X-Google-Smtp-Source: AGHT+IHyxb27ncBLKPFMzYBytYf8JdFFzBjcq0eQ234clNgQbqS+rM5m2Q/04U20l7Jzr5p1a/bdHw==
X-Received: by 2002:a17:907:c27:b0:b3e:256:8332 with SMTP id a640c23a62f3a-b50ac6d378amr918608366b.54.1760020525656;
        Thu, 09 Oct 2025 07:35:25 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1885797166b.45.2025.10.09.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:35:25 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 09 Oct 2025 16:35:08 +0200
Subject: [PATCH v2 2/4] media: i2c: dw9719: Add DW9800K support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-dw9800-driver-v2-2-3c33ccd1d741@fairphone.com>
References: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
In-Reply-To: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760020524; l=2755;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=zFAV7C6HOiSLgAt+J5kOIL2+5hrR7jxRpEnz3gcGgEk=;
 b=++B3Hg6F2Jx1mjZN7drCLj6rjYz3YZYQxAKK5x//96hcAgUDnhNv/m+Bkp8NpoJZ1aTZ6pknB
 aeYBdkBaBEeDjSu0k2CA5tQ+yUbRQLyd8w0DcZ13jxv3o3F0mo02kph
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

The DW9800K is a similar part to the DW9719. The method for operation is
the same as the DW9719, but the register set is different. Add support
for this part to the existing dw9719 driver.

Tested on the Fairphone 5 smartphone.

Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/media/i2c/dw9719.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3627e78b8b6668933c4ecd92231465ce4105ff0c..fad716ece5ddcdc450669851b4b2685691b681bb 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -68,6 +68,9 @@
 #define DW9761_VCM_PRELOAD		CCI_REG8(8)
 #define DW9761_DEFAULT_VCM_PRELOAD	0x73
 
+#define DW9800K_DEFAULT_SAC		1
+#define DW9800K_MODE_SAC_SHIFT		6
+#define DW9800K_DEFAULT_VCM_FREQ		0x10
 
 #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
 
@@ -75,6 +78,7 @@ enum dw9719_model {
 	DW9718S,
 	DW9719,
 	DW9761,
+	DW9800K,
 };
 
 struct dw9719_device {
@@ -130,11 +134,16 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 	cci_write(dw9719->regmap, reg_pwr, DW9719_STANDBY, &ret);
 
 	if (detect) {
-		/* This model does not have an INFO register */
-		if (dw9719->model == DW9718S) {
+		/* These models do not have an INFO register */
+		switch (dw9719->model) {
+		case DW9718S:
 			dw9719->sac_mode = DW9718S_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9718S_DEFAULT_VCM_FREQ;
 			goto props;
+		case DW9800K:
+			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
+			dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
+			goto props;
 		}
 
 		ret = cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
@@ -177,6 +186,12 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 	}
 
 	switch (dw9719->model) {
+	case DW9800K:
+		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
+		cci_write(dw9719->regmap, DW9719_MODE,
+			  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);
+		cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
+		break;
 	case DW9718S:
 		/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */
 		dw9719->sac_mode &= DW9718S_CONTROL_SAC_MASK;
@@ -426,6 +441,7 @@ static const struct of_device_id dw9719_of_table[] = {
 	{ .compatible = "dongwoon,dw9718s", .data = (const void *)DW9718S },
 	{ .compatible = "dongwoon,dw9719", .data = (const void *)DW9719 },
 	{ .compatible = "dongwoon,dw9761", .data = (const void *)DW9761 },
+	{ .compatible = "dongwoon,dw9800k", .data = (const void *)DW9800K },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dw9719_of_table);

-- 
2.43.0


