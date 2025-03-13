Return-Path: <linux-media+bounces-28146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2071A5F425
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 13:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC8967A9B51
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 12:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B0F267709;
	Thu, 13 Mar 2025 12:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gHTvzOkq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827A7266F08
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 12:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868444; cv=none; b=BL9XNAMMabBTJvroBH1ajUWti+gdkIT8ZinWMdGnC0bU5T69oPz/CpvfOT68IYhAnXkza0+/SPstjMktYwqkYR0dv/s+ILOMIC8LZOB4uoDVlJrZUt0UlBBMRTvae9EXuTmbIOpSoMSj4Y9e3hwZZ7rFf9FPFd+dUwJYnZ08PEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868444; c=relaxed/simple;
	bh=AY58SoD+ZhVTBIYdcNttMGVWKza2+aUpZJjjxBBwdDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LzTJlasbDKg1l8FrYitSHdXxm1G0AyEjUy5VWSVsFP8RCLm74AJtrEGKnnIRci7cVCbg6WgVnhZEqsW/hd36izygjcSFnjs7fqg7HhV57BByDb6VtF5x+BmwGTqomIyiYJS0JzXH73SY/8X717C8jvvlqVVfdrM91ikRM/Og0ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gHTvzOkq; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8fb83e137so8203276d6.0
        for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741868441; x=1742473241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LaUbLtHwwn028SmzBwWRS6gnlRFgt6AH8li0LyjHLg=;
        b=gHTvzOkqtS5KplnkpiscnACQfhdZHXHOU96S4b8MdccUveMnf2VxZDoe/lTIi6/yEM
         XwoAUaMz4fVjPHOO5NHEQ7IYzIhj51E7xVrI+9NY6pnMOXF65NDxr7sTTkf0+FYQJ3yk
         1HO0vHJ6vsBX11ASHgqNI5g5Njj7WVLgHi3oQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741868441; x=1742473241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LaUbLtHwwn028SmzBwWRS6gnlRFgt6AH8li0LyjHLg=;
        b=FwsULan4m8WXwxPW6SjupZHwsUBwYWYsKE+xFbvW/7XqCmevAupD2TfjpNb9u/bZd2
         RicjBlL+s0rSyJKRkeaux0U1M4uk4EPaTQwAZwsI32oPxEnSLiv/MTp174bJ5xI66TZ7
         GHt8uLUrlUgqAIvejGJhuE2BwYsr8Dryvu8uruSOEQAUYCSNqSoDFf/NKQQ3mB67D2/f
         sZ9T5s+bF86hJWfQlOqr3xaWUqDO+WvkKtMbUBj6FldlMN2H4bNjtCDUr8j2ysK57Z+u
         xFWfITWDlEjdXyMbxgFUdtnc59wzX87hYYK6wnwCRAfoRm2jXNpXar5U6I5AOBxoilYY
         fdDw==
X-Forwarded-Encrypted: i=1; AJvYcCVL5Lo0PmUnQ9egkNDIZlxBRo2MKisev4zu617E+f5eq7RH1xa7Qll3EBr6YI4hThWgtWpVnF8fBDoEUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZkaUsnd9MQGY/jBElLrd789u94t1qxpDN7/huD5GNnpghYS8O
	gm4X0DwynVJd26aFBDF6qKlAdvT0FmfenO/1/1sm+qprQFqgZ/kv78vKozGStQ==
X-Gm-Gg: ASbGncudBdk/+H/pXFvfDh0i/oT1RQ+gK908z0GrXukhbidy8us3YWMbd2VokE8irGs
	eya3Hsm37xTDAyM2q0wbirrdL606XQYLJHAngC+GZWbWwa257vsiD3MtZwmmkO6EDi/UT8sHsoL
	CFjaxYLb6KFNRfDNro3UQybZIsNcHUsijHEuf4ghwdDZoKTkp5ge/uu8D1elsiwA6PazGNkxTBG
	GuaB0tF52tuInh7Lcyw2i35RDKcV5iNt8ucoQ8tzeF/88qeIirF4cmgpvhxReJim+KatnHDRCXx
	XNj8fXEgskBfAvxfbjsvl2k+tAwM72OnMeCSRTV7s1hsVGrCtck7UfojlAtOFsTQD9GDkVowBCO
	V4+pbEiqFxMDHO4WLPi5wmA==
X-Google-Smtp-Source: AGHT+IEITUBocDzG1BLH4x0HoF9i4dp788zMihFPD7doCspz6hQIiTeuZXkgdafnavqpm9lCQfQD7w==
X-Received: by 2002:a05:6214:1c43:b0:6e6:6713:3ea8 with SMTP id 6a1803df08f44-6e90060cc3emr410041766d6.23.1741868441393;
        Thu, 13 Mar 2025 05:20:41 -0700 (PDT)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade235f9bsm9038616d6.29.2025.03.13.05.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:20:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 13 Mar 2025 12:20:39 +0000
Subject: [PATCH v3 1/2] media: uvcvideo: Fix deferred probing error
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-uvc-eprobedefer-v3-1-a1d312708eef@chromium.org>
References: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
In-Reply-To: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.2

uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
have not yet been probed. This return code should be propagated to the
caller of uvc_probe() to ensure that probing is retried when the required
GPIOs become available.

Currently, this error code is incorrectly converted to -ENODEV,
causing some internal cameras to be ignored.

This commit fixes this issue by propagating the -EPROBE_DEFER error.

Cc: stable@vger.kernel.org
Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index deadbcea5e227c832976fd176c7cdbfd7809c608..e966bdb9239f345fd157588ebdad2b3ebe45168d 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2231,13 +2231,16 @@ static int uvc_probe(struct usb_interface *intf,
 #endif
 
 	/* Parse the Video Class control descriptor. */
-	if (uvc_parse_control(dev) < 0) {
+	ret = uvc_parse_control(dev);
+	if (ret < 0) {
+		ret = -ENODEV;
 		uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
 		goto error;
 	}
 
 	/* Parse the associated GPIOs. */
-	if (uvc_gpio_parse(dev) < 0) {
+	ret = uvc_gpio_parse(dev);
+	if (ret < 0) {
 		uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
 		goto error;
 	}
@@ -2263,24 +2266,32 @@ static int uvc_probe(struct usb_interface *intf,
 	}
 
 	/* Register the V4L2 device. */
-	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
+	ret = v4l2_device_register(&intf->dev, &dev->vdev);
+	if (ret < 0)
 		goto error;
 
 	/* Scan the device for video chains. */
-	if (uvc_scan_device(dev) < 0)
+	if (uvc_scan_device(dev) < 0) {
+		ret = -ENODEV;
 		goto error;
+	}
 
 	/* Initialize controls. */
-	if (uvc_ctrl_init_device(dev) < 0)
+	if (uvc_ctrl_init_device(dev) < 0) {
+		ret = -ENODEV;
 		goto error;
+	}
 
 	/* Register video device nodes. */
-	if (uvc_register_chains(dev) < 0)
+	if (uvc_register_chains(dev) < 0) {
+		ret = -ENODEV;
 		goto error;
+	}
 
 #ifdef CONFIG_MEDIA_CONTROLLER
 	/* Register the media device node */
-	if (media_device_register(&dev->mdev) < 0)
+	ret = media_device_register(&dev->mdev);
+	if (ret < 0)
 		goto error;
 #endif
 	/* Save our data pointer in the interface data. */
@@ -2314,7 +2325,7 @@ static int uvc_probe(struct usb_interface *intf,
 error:
 	uvc_unregister_video(dev);
 	kref_put(&dev->ref, uvc_delete);
-	return -ENODEV;
+	return ret;
 }
 
 static void uvc_disconnect(struct usb_interface *intf)

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


