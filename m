Return-Path: <linux-media+bounces-32168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 230FBAB1C42
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 20:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7931C03475
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 18:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828D0242D8C;
	Fri,  9 May 2025 18:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A92b7SEp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A232241132
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 18:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815061; cv=none; b=n4No/9eP4/iklQH7fm2qBPxstW7rc0LTjtsC4veb+LGG9Xqiqf4ZQisbQdh3OAAfL69c3IYEolhxIx1e4Q2hYfzr9SwRO9/w1rqwZs7J1y3pnmK362sk46u8qpf1DK1/eL24ft3MygdLrzrsNTQvwMs78SqiQWZso+ugcicAYdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815061; c=relaxed/simple;
	bh=dmEDUd2MAksdGuyMaIYfV/evhD42SfWsITizphcH7IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVFlOrTzseKADpSA0e4/wm2bVNAuRFcqGWNLifzXBV4TDkxLF38mQCsgP0BiJUWBR6fh8CaLVITog121l+PEBf0IYPgMDVmKJkI02EZyIjgeDsaODaEfHTFpnGfKFOpmHfiZIcERjlBcvLwzg78UXelGwq7q9MyMf+TojwG73gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A92b7SEp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so3037924e87.2
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746815056; x=1747419856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXSgPFuFz+fNGABAM7JsWHcPwhMV/Um0ycmbxkQJ5u4=;
        b=A92b7SEp3f9UEn/ns0ATB5v6WT776x7JpWxO0uM7mD8v0I4kmikHIk9W/IAk979AEz
         ra88l0JKuMjg6WLgDEl7CL0vFypiPu+lHKLk4gAhznOJMnajNedFAIhdOw5jmQHnLdmL
         v9XLYkaFZybawLuh7X+BUG1dSxi+S7qz6GayM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815056; x=1747419856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXSgPFuFz+fNGABAM7JsWHcPwhMV/Um0ycmbxkQJ5u4=;
        b=Qn43uxrqOFKlXM2tXTBwU13wUykxlY2Lp/F3qi0yV1yWVD2KYBOqZ5zI1OvpYa36oE
         eX2AMYnd+f3J+JWTKKqwM2JmxQszIeXwtYakTha6N8iREXoNo0ded8E+UrWZV/SG+7GD
         NVfhWPsYU/eotgiYOl7vL7c/PWAqgODf+NIKXvW7NXBNmupj3TnZ/TkuhvheADuaYhou
         kKsCL5SUf/4SeNUgqU/TcsjdyDccyznWV3HhaQ1fkcDKmZQcKuOu0pp7cU4m8unQ/6Z8
         4XDBRVXd8p9m882yNC76K3i9N11UvpVNE+ZP10WeBrvDPQDRERdgq1uWd2Dxuiggp5JF
         Or2w==
X-Gm-Message-State: AOJu0YwhoiLY0n8c+vxTzWcNwhA6sdS2h6LzlkTFq9OIB86tJZSTKzdz
	sxCvRH/uinVt27LBDDFTP+xgB/tySBSKmVgZQ9IIjjtKvf+4TgqEbd6jhy9kPo3DsqS574C1taI
	=
X-Gm-Gg: ASbGncsRW6zDCJDIrSVwrRo1FoqHYdD1mJvLkUBm9AXMxlZrcUgmM0ZROC+cDWw+0ZZ
	u5XdYVVTJVZUFxUMqvI0XchoJzhaZjYmSoDnWQskefqR9tgtljKy3sj5pFtZV0bqycSeD0DuUKT
	iAS8jCFKyRU35hq9xZLmmts3cWPJhi/zSUen7jMazc2QONVR7CnCPAaH4gohMUtUbbN2aLg5Wl8
	9kDPGlu7vp+bT13NkfDDtgQtHoIMMTb5n4/rMZtEWgGN9mVCoF3kQ81PGlclSyx/QTYXKjkNnQx
	AMHbVI7v/0vaD1We4YGjC5nSuA4ythCE73N8pSEGbiocte5tpP4dNF255IllwXorimVjf+cD0OA
	6bz1tH68wr2TgpN6GC7D04TzzubnhQt4=
X-Google-Smtp-Source: AGHT+IG1edMScKGbHzfRhfZyEuDSvbr+Wl5F6wdkbHLnOVyRsXgnr8JzOVlmPHkNqFi2Fch4VmkWaA==
X-Received: by 2002:a05:6512:3e01:b0:54e:85bc:d150 with SMTP id 2adb3069b0e04-54fc67ec33amr1483266e87.53.1746815056482;
        Fri, 09 May 2025 11:24:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bc9sm349410e87.147.2025.05.09.11.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:24:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 09 May 2025 18:24:16 +0000
Subject: [PATCH 4/4] media: uvcvideo: Populate all errors in uvc_probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-uvc-followup-v1-4-73bcde30d2b5@chromium.org>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
In-Reply-To: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
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
 drivers/media/usb/uvc/uvc_driver.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68cc0957762f2b67387677c22224d1..cdf4bbe582272277a6a95267e9752010adc51b6b 100644
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
@@ -2275,22 +2274,16 @@ static int uvc_probe(struct usb_interface *intf,
 		goto error;
 
 	/* Scan the device for video chains. */
-	if (uvc_scan_device(dev) < 0) {
-		ret = -ENODEV;
+	if (uvc_scan_device(dev) < 0)
 		goto error;
-	}
 
 	/* Initialize controls. */
-	if (uvc_ctrl_init_device(dev) < 0) {
-		ret = -ENODEV;
+	if (uvc_ctrl_init_device(dev) < 0)
 		goto error;
-	}
 
 	/* Register video device nodes. */
-	if (uvc_register_chains(dev) < 0) {
-		ret = -ENODEV;
+	if (uvc_register_chains(dev) < 0)
 		goto error;
-	}
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 	/* Register the media device node */

-- 
2.49.0.1015.ga840276032-goog


