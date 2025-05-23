Return-Path: <linux-media+bounces-33268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D19BDAC250A
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 16:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE769E76FF
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 14:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78A029553C;
	Fri, 23 May 2025 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B2SRNaCS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663C71EE02F
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010526; cv=none; b=KdELaCNQI/nLbQy2NkduHqEWF4a3LGlEqKndb/CfHxU/yVXDb4eiRIqdgoaity1VpohNj4sauMFlsFoRwg2yEkOG3Fu4MXx04AOO2CuWh2OmHp7kAVQuE6hZM9qID6gk96YC9cESHfFmbhCrPmBFBZhf/ysTPG+CFFyqz69zg9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010526; c=relaxed/simple;
	bh=a2TDZ2q/7uNti2V57OlYau145NB4eR13OsEIBn0U4gA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kc9ZQVcN4gDUehbGHWe1PFVo+vdxj2XnSCKGqtn9OZmCaKeVftGcd/kQVO/KyJgrNYQG99G3zNVU/MeDFgWjrGn3wTCzSQh2iWFa8X6VfrNuk3wEApEzskTDbQiJNrAKfdS2cz6k/lZ6vXCF7J33YVhvZxTRQPs7f7xrqBtlhB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B2SRNaCS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-551f0072119so1870e87.0
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 07:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748010522; x=1748615322; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iw0TCyt07qCHVss0tlxpT1VU8Sfr9QBlaolFbQV/mVU=;
        b=B2SRNaCSKyyKEZJ1UPGQXvduY2oxpVWCQr4r9vP3xmlXZmfohiKV41WSjQ/lf49TVH
         URyKbYQR/3Mb1s0gkukNsf5H5nrV9XLGxSBWKnKmRTp/sGnrI7mPtrEB6SYFL8i9DVoM
         D/2drHtyEUwq2HmBbtzhnW/8moIlPB2bsPdlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748010522; x=1748615322;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iw0TCyt07qCHVss0tlxpT1VU8Sfr9QBlaolFbQV/mVU=;
        b=CGT3At1w9WIqPcsDz/vffAZrtMxlVedAeRgffPU4D86/5VizdyFjhFx6XuLVADbdsb
         AxCj2l4YKMIHEEvR8fmxR9V677zjR59LgEcAHbLBOhAkXyDKZ4Tw51tXBHdVq4TBsblq
         /+t6DX+FBRdpsUd8XpTmstosnT425bpw/ePA4RZMk1T76eisbkq77xGB/5I9kGQcNHWo
         eQpLJM9S71yjaVjgNzmg2zvfumt2hZ3iIgldPgvEAclo2T0GnU9wuXp6h6BUCjxGyOO8
         fxvsrDUhKsm54wPVgKsM1dqVaH8ZaPr5u7N08klHMnnxeT7DBNxLSXoT0DasERLIahK2
         KKJg==
X-Gm-Message-State: AOJu0YyZcT3Sg2RQP9rr5BzLeX4fcP9emSruPYlNf7WxejYCAXZO3KB9
	Bx81aAx2Dhw13INjcCEEfIhR280BvTOdFP3SYrkkk1+4eAWb/q2pbRcTul+YRH93Lg==
X-Gm-Gg: ASbGnctcw3XddBDUfCBoKsK6/KHf8oG9/y8REcQ6nl8JdRWnr0gOLZkRrhNi6xMe9a2
	X7B35l4opRd/aKAQqsMY3bpNbER4MoQ58UwmntRslHZQENPt2nEeDB6bhbEl4m3vm3wj9rC6KeJ
	qA4GvMTF+GwKii25k4MChR3aPhdxV8mIuM0KiTsHq9JKUksVg6iDfdBvZwC7aDI21yXDLH9xWi/
	UwaAQcXxIaY/4Zx5ByUWtqqMx2g/BQPTsXfb+j/yx3qILgQPRBGI3oieoH24Mk0HD+M0270RcFH
	ExpFa0dpXyG9d5B0D5NbTASsTa7uaGidtWZCz1rpzehTxN+r9IJ0/Hb1FOAorm+B7TSmq+CP+ug
	sWgx0/J9OvVzhHhAKNNS99T28+A==
X-Google-Smtp-Source: AGHT+IEBZg7xrIchOcxBtUlwk2C3pGpQWWzzOxVC3QlFAe5yveXxpUNg2ZCRPGvVTd0hCvw0OsJVIQ==
X-Received: by 2002:a05:6512:3054:b0:549:88b8:ccad with SMTP id 2adb3069b0e04-552156bbd11mr1215091e87.20.1748010522389;
        Fri, 23 May 2025 07:28:42 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc7d8a4bsm1952590e87.115.2025.05.23.07.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 07:28:42 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 23 May 2025 14:28:41 +0000
Subject: [PATCH v2] media: uvcvideo: Populate all errors in uvc_probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-uvc-followup-v2-1-487541656e83@chromium.org>
X-B4-Tracking: v=1; b=H4sIABiGMGgC/3XMSw7CIBSF4a00dyyGQrCpI/dhOrA8yk3a0lwEN
 Q17Fzt3+J/kfDtES2gjXJsdyGaMGNYa4tSA9o91sgxNbRBcKK54z1LWzIV5Dq+0MdN3zqmLNK5
 XUC8bWYfvg7sPtT3GZ6DPoef2t/6Bcss46+SojZXciFHdtKewYFrOgSYYSilfYHDKkKsAAAA=
X-Change-ID: 20250509-uvc-followup-d97ff563df95
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Now we are replacing most of the error codes with -ENODEV.
Instead, Populate the error code from the functions called by
uvc_probe().

Take this opportunity to replace a generic error code from
uvc_scan_device() into something more meaningful.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
CodeStyle and refactor patches after the last uvc Pull Request.
---
Changes in v2:
- Patches 1-3 will be handled by Laurent: https://lore.kernel.org/linux-media/20250523125840.GG12514@pendragon.ideasonboard.com/
- Properly propagate ret value. Sorry about that :)
- Link to v1: https://lore.kernel.org/r/20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org
---
 drivers/media/usb/uvc/uvc_driver.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68cc0957762f2b67387677c22224d1..04552da114354128b0cc8fb25e1cc645498ac323 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1866,7 +1866,7 @@ static int uvc_scan_device(struct uvc_device *dev)
 
 	if (list_empty(&dev->chains)) {
 		dev_info(&dev->udev->dev, "No valid video chain found.\n");
-		return -1;
+		return -ENODEV;
 	}
 
 	/* Add GPIO entity to the first chain. */
@@ -2239,7 +2239,6 @@ static int uvc_probe(struct usb_interface *intf,
 	/* Parse the Video Class control descriptor. */
 	ret = uvc_parse_control(dev);
 	if (ret < 0) {
-		ret = -ENODEV;
 		uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
 		goto error;
 	}
@@ -2275,22 +2274,19 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 
 	/* Scan the device for video chains. */
-	if (uvc_scan_device(dev) < 0) {
-		ret = -ENODEV;
+	ret = uvc_scan_device(dev);
+	if (ret < 0)
 		goto error;
-	}
 
 	/* Initialize controls. */
-	if (uvc_ctrl_init_device(dev) < 0) {
-		ret = -ENODEV;
+	ret = uvc_ctrl_init_device(dev);
+	if (ret < 0)
 		goto error;
-	}
 
 	/* Register video device nodes. */
-	if (uvc_register_chains(dev) < 0) {
-		ret = -ENODEV;
+	ret = uvc_register_chains(dev);
+	if (ret < 0)
 		goto error;
-	}
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 	/* Register the media device node */

---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250509-uvc-followup-d97ff563df95

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


