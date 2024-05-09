Return-Path: <linux-media+bounces-11209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F18C0FF6
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 14:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1B5B1F23C0F
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 12:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C09147C83;
	Thu,  9 May 2024 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="poGlvMif"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8717417579
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 12:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715259193; cv=none; b=aVpR5qhKADoG7pT7dp1hYF5vFpQsk/lVfbxV3Fs4WGb0Cxh9ws0OBAfhpTWkwVx9QQKJJs+dTzFcFVRl2jUUAIW/NbA+729egfR191iiBAXQ4wF9wxQD6879cFzpDsn8JO9bxB+NeThpbqfTEeEtBBxGPXy4F6ztAZJjD29LcR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715259193; c=relaxed/simple;
	bh=tHJUV8jemlCBNR0e9dyQ6K2sM3GE6d2f862tqmw8smw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YIEAOVq6qfbUd4AXh8ngOqrVL3OgNQHDQK/FjpsHjLX2fHYasgcOIaPtkOkfHraY49O0DDkZdvAapntpKURAXfuCl2DOXxPhEsttp7cbWj795nNVj9bWKR/72WRGmcIAa/KWwg4COcOrxDnHsRZJOQGAJyFlkiifd802ii30tEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=poGlvMif; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-41c7ac71996so6043795e9.3
        for <linux-media@vger.kernel.org>; Thu, 09 May 2024 05:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715259190; x=1715863990; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=psmu9THAqsGOKJL0eF6J9cwaZgQkJwTOQ1cnvhZ/MDc=;
        b=poGlvMifEmbkA+gNMbrdSSnnUH2Rrt9YZyT/XQFGLDOfe9cdozqvVdlqrcg6pTZFB6
         gEkb1Q4Cal3j+FVDiHx4xrhf15UFkqvnaYmkUmtzKkNUq5Fju9pRsED626aTS0kDhDu8
         99Q6EtiW475CCRSZUsGfuVSug270vpb35U07P3QIwSKH/ImQNab6Ki3q6GMiQqeCLfpe
         2fc9sEvp7NKPcx5Dl+BOeb9KZa17SlI/KSngRwJnB7UVxFKyV1ayXiNxUaCF/KW6OUCS
         w3XBam4IIDiHpzKmudQeakhbd76N0RzuoExMEY4fdZmiP5hOdLCWtRUJvsVHu93xtDz8
         O6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715259190; x=1715863990;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psmu9THAqsGOKJL0eF6J9cwaZgQkJwTOQ1cnvhZ/MDc=;
        b=G30X5W25Go1o3afWplKt7GuW4rzJThjnFZY1nbPaicoDs1yfVOCPRB368c51VkNQCe
         TYfoGIUXlXW0lYvCJpiHNi402bP7TTh5Fq/CCizoxi7jFJufAafdsmfWDHM2sRAbPkKa
         9RwJFIzJUSXiH3bNxvj1pGU0/n65kM7AXRa7W0IY1yCS9irdSiaXnUFV9R4IcuSAOFQ9
         vUR8W/DZdYqvTnXCM/wrtpS9ncRUIp62Xh33YXgsgV274eOEsmyrBGEMxH/p9H003yrL
         UzghvK2IgS9oBABakXgN8mEAdfBbU5vyxKl38PbFRwRPP3wDXezCkok2kEOYQPBZjy/S
         dngw==
X-Forwarded-Encrypted: i=1; AJvYcCWdul1yCpx7hlv0lnCDXIU/bIciC34kd6+Q4+1Wg6Ed43jMJ8opOGR0tfeJbd4VTgZz+yXQPOVk2CS2AkIXbW/Mp3+bNJ74betBvzY=
X-Gm-Message-State: AOJu0Yy2ChH01WuQ46Hk1/2aZYxdNnXd6lBMh4mVMGHWmKuZW+dz8TUp
	FuMknl0aguK0ejK23jhiZWcnVRCms2oSYRa7y3NncSL3q1mjZGjsTqjgfU8OsJ0=
X-Google-Smtp-Source: AGHT+IEt0Gt7AfywVRXND++7a2GFpREKsqIdQ+FWSI0zCgsC5v88rnKoatYR7kECZuQT2qkjfB/c+w==
X-Received: by 2002:a05:600c:46ca:b0:41c:7bd:5a84 with SMTP id 5b1f17b1804b1-41f71bc9fa4mr47777675e9.17.1715259189896;
        Thu, 09 May 2024 05:53:09 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe9011sm25058525e9.7.2024.05.09.05.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:53:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 09 May 2024 13:53:07 +0100
Subject: [PATCH v3] media: i2c: Fix imx412 exposure control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v3-1-3f7e15ddc280@linaro.org>
X-B4-Tracking: v=1; b=H4sIADLHPGYC/63OMW7DMAwF0KsEmstCkmU57ZR7BBnkmHIIxFIhK
 oaKwHcvk627N/4//MenYiyErL4PT1VwJaacJHQfB3W9hTQj0CRZWW2d7rWH0cGd0qNBwlbhGhZ
 maKZjWBbOd6BUcS6hyozcUJEr0NL6YYBIDaKJiF4P2jujxPgpKPXbP18k34hrLr/vd1bzaveSV
 wMG3NiFL2f9OOHxJGOh5M9cZvWiV7srZ4Wz6H0f9WDjMf7jtm37A1yHPPl6AQAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Martina Krasteva <quic_mkrastev@quicinc.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
X-Mailer: b4 0.13-dev-26615

Currently we have the following algorithm to calculate what value should be
written to the exposure control of imx412.

lpfr = imx412->vblank + imx412->cur_mode->height;
shutter = lpfr - exposure;

The 'shutter' value is given to IMX412_REG_EXPOSURE_CIT however, the above
algorithm will result in the value given to IMX412_REG_EXPOSURE_CIT
decreasing as the requested exposure value from user-space goes up.

e.g.
[ 2255.713989] imx412 20-001a: Received exp 1608, analog gain 0
[ 2255.714002] imx412 20-001a: Set exp 1608, analog gain 0, shutter 1938, lpfr 3546
[ 2256.302770] imx412 20-001a: Received exp 2586, analog gain 100
[ 2256.302800] imx412 20-001a: Set exp 2586, analog gain 100, shutter 960, lpfr 3546
[ 2256.753755] imx412 20-001a: Received exp 3524, analog gain 110
[ 2256.753772] imx412 20-001a: Set exp 3524, analog gain 110, shutter 22, lpfr 3546

This behaviour results in the image having less exposure as the requested
exposure value from user-space increases.

Other sensor drivers such as ov5675, imx218, hid556 and others take the
requested exposure value and use the value directly.

Take the example of the above cited sensor drivers and directly apply the
requested exposure value from user-space. The 'lpfr' variable still
functions as before but the 'shutter' variable can be dispensed with as a
result.

Once done a similar run of the test application requesting higher exposure
looks like this, with 'exp' written directly to the sensor.

[  133.207884] imx412 20-001a: Received exp 1608, analog gain 0
[  133.207899] imx412 20-001a: Set exp 1608, analog gain 0, lpfr 3546
[  133.905309] imx412 20-001a: Received exp 2844, analog gain 100
[  133.905344] imx412 20-001a: Set exp 2844, analog gain 100, lpfr 3546
[  134.241705] imx412 20-001a: Received exp 3524, analog gain 110
[  134.241775] imx412 20-001a: Set exp 3524, analog gain 110, lpfr 3546

The result is then setting the sensor exposure to lower values results in
darker, less exposure images and vice versa with higher exposure values.

Fixes: 9214e86c0cc1 ("media: i2c: Add imx412 camera sensor driver")
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165-rb5/imx577
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Using libcamera/SoftISP on a Qualcomm RB5 with the imx577 sensor I found
that unlike on other platforms such as the Lenovo x13s/ov5675 the image was
constantly getting darker and darker.

At first I assumed a bug in SoftISP but, looking into the code it appeared
SoftISP was requesting higher and higher exposure values which resulted in
the image getting progressively darker.

To my mind the software contract between user-space and kernel should be
increasing exposure requests always meant higher exposure but, to be
certain I asked around on IRC.

Those polled agreed in principle that the software contract was consistent
across sensors.

Looking at the range of imx sensors, it appears this particular error has
been replicated a number of times but, I haven't so far really drilled into
each sensor.

As a first pass I'm submitting the fix for the sensor I have but, I expect
if this fix is acceptable upstream it should be pushed to most of the imx
sensors with what seems to be copy/paste code for the exposure.
---
Changes in v3:
- Fixes non sequitur in commit log
- Applies RB from Jacopo and Gjorgji
- Link to v2: https://lore.kernel.org/r/20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v2-1-2e665f072f8f@linaro.org

Changes in v2:
- Fix typo in patch 42 -> 412
- Link to v1: https://lore.kernel.org/r/20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v1-1-4b3a9426bde8@linaro.org
---
 drivers/media/i2c/imx412.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 0efce329525e4..7d1f7af0a9dff 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -542,14 +542,13 @@ static int imx412_update_controls(struct imx412 *imx412,
  */
 static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
 {
-	u32 lpfr, shutter;
+	u32 lpfr;
 	int ret;
 
 	lpfr = imx412->vblank + imx412->cur_mode->height;
-	shutter = lpfr - exposure;
 
-	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, shutter %u, lpfr %u",
-		exposure, gain, shutter, lpfr);
+	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, lpfr %u",
+		exposure, gain, lpfr);
 
 	ret = imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 1);
 	if (ret)
@@ -559,7 +558,7 @@ static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
 	if (ret)
 		goto error_release_group_hold;
 
-	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, shutter);
+	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, exposure);
 	if (ret)
 		goto error_release_group_hold;
 

---
base-commit: ff3959189f1b97e99497183d76ab9b007bec4c88
change-id: 20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-f1fee6070641

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


