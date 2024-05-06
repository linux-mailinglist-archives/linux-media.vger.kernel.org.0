Return-Path: <linux-media+bounces-10933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 440A48BD79B
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 00:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 661001C20DE9
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 22:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B7115218B;
	Mon,  6 May 2024 22:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fv1GChc/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F83744C88
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 22:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715034827; cv=none; b=M7GLLsUTqfs4F2iYR+Etkms//pjLAsdHwWdLgnRHS+wVs2PRbPFcMIKCPiNC0E/qZS1cfANyMJ6jIRRNgjQXRP5f0hC0g481q9FUm8biPVjDyrosMYOSO/XnfISnZkHqweBwJxOVr6PAKcLNoLJAFIC1QIxix762loXzhcPf3yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715034827; c=relaxed/simple;
	bh=XbeaIHre143E4vysQmGrzt4tNC6G3/zMv2H2o4AQ/yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iy7zIBXAoEqxl9/KBD2GjXp537JjRr5MfeDCxHRikIrmcCstOF2RL8gMNRa2zzyE8cDblKOMSk+XEIcFtJOJC2fUGTlkwOQyP1g8H+pXTy0xGiSrRxLUATaMHkYxHYP5dv+Z8FVUsiTxGu2kgHqB8AyKkz5y8XbE6/8sYzRnMys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fv1GChc/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41dc9c83e57so26770025e9.0
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715034824; x=1715639624; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L93aTq+yntQGwFV5vIt1XMlXm8vhsrvaK9kqXIrRNHA=;
        b=Fv1GChc/VhBKk7SHWj4sf1HvYNnhAikjgJGgjuwEZI0EzgmUAu73ID9imCMzrJRe6r
         L8X+FHjLtlo1iKMVL5Cj81HHl0oZJMy0ZTQcLG2jRFnvRZ1WSroFWUtB3g/O6swRp1FL
         HMF29RjYQSIOUAmxiPsLvqtwzjlRSGoSVWBfEW9Xqg2AaWkFilZ8YYag42Qzsjsff79h
         gIO6i3oqXQQrQnnUL2r5utRudyY29AkYr0GbyBsyEqsMoXbuILWwaiOGEUJ/8IlP7llN
         O8A4ZbHC0x36xnd6VcYZrz46F/MUE85ZgHzO1QUt4bUNaY7i/gMSoByFakQDVY9IoFDd
         VYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715034824; x=1715639624;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L93aTq+yntQGwFV5vIt1XMlXm8vhsrvaK9kqXIrRNHA=;
        b=QlZs5Og/LcIqQfVR/2ewQ5HCQY5iaiPaBMvwvp+nQn1qzCY+mhhGvQ1tVkwKyq4Rv8
         NUxD2liaY0d04ZZw/uqfPi9RPNHRdKQbwNe4VTYhYsm4oxCMGp1r03u5X3uhx+0ylXrv
         SB0Tw7BMhPuo3eWX5+LaqQmIYxK15L15nsMKwkUhA6bk0FuEnXOct56oT4QRb+/vlF+t
         s+48cY9XXLrJZWE/t3tSaQPZaHuxXaPn5mkDq6mXt9DEIGIYDR7pdYbgKerf3AJ3PV1B
         DDpJVsuMPsTNfriux6NzTcYriqHi75JEOlv90nk/pBDmJVgSvbmjyA/4MzkODOsL5HEO
         Qm4A==
X-Forwarded-Encrypted: i=1; AJvYcCUhAvGPReywHTg7DjR6aza+pe3zqkHsMvZM8ORuvVpMJuNK5CkfCiToEQ6B9VW/jFVnmZRzMJPFMlEku2tzcyVeXimbj807dmV7Wfg=
X-Gm-Message-State: AOJu0YwLeTZdqkRJg1dFry72VvxS6xqoMiM6nY4TOFOQBp4G55fs4gUe
	/qL8vnKMkL+s1cGfWoX8T9wGYxV1EVGw2tNTWRiVVf/Zn8W+6W0a2WheLSJxqKM=
X-Google-Smtp-Source: AGHT+IETCACzliOUjlrnticdSVUZDaX9BTfnVx0YXJZTNKGyAnSM76tyfOngJ61KyYRQjgCj5V3P+Q==
X-Received: by 2002:a05:600c:4f14:b0:41b:8c5c:31b9 with SMTP id l20-20020a05600c4f1400b0041b8c5c31b9mr775530wmq.14.1715034823704;
        Mon, 06 May 2024 15:33:43 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id be11-20020a05600c1e8b00b00418f7605249sm17264766wmb.24.2024.05.06.15.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 15:33:43 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 06 May 2024 23:33:39 +0100
Subject: [PATCH] media: i2c: Fix imx42 exposure control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v1-1-4b3a9426bde8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMJaOWYC/x2NQQrCMBBFr1Jm7UBS0wS8iriIdVIHmlQyqQRK7
 +7g7r+/eO8AocokcBsOqPRl4a0o2MsA8zuWhZBfyjCa0ZnJeHw6XLnsHQv1hnPMItjtVTBn2Vb
 k0mipsalGNzaShpz7FAIm7phsIvImGO8saONTSe9///44zx+klMhNjwAAAA==
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Martina Krasteva <quic_mkrastev@quicinc.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
requested exposure value and directly.

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


