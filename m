Return-Path: <linux-media+bounces-29341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE10A7AE19
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 22:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 637527A0431
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 20:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60475202982;
	Thu,  3 Apr 2025 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DWgwO9MS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428711FFC74
	for <linux-media@vger.kernel.org>; Thu,  3 Apr 2025 19:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707789; cv=none; b=CPW6AOeiy35cNf4p+XFZGsbIRrD4prC/JPFa8Uscj+3qCnLttFg3Th7nBZ0O03KR+TqOKoBmHkE1hMJz9CAyFxYyM6lqSUsnwOB2X9lzwchAJrKLeIPAZY5CFYYBdSCEJK8gTDLC5SjcH/01hLNbvl1UJpn/CPKNlguA49ZYy4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707789; c=relaxed/simple;
	bh=Wk0eWcuzWua/Qg5JYIHzxP7iyJmxxh8gGdGpfJV3+s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKzE2ZoVZuip6av6ru1ChAAxH4nrfZh1tu3f50SG9Jxkpt7yy5oUOABUOfXJwYJImpunbZpYfbf08P31vdBP+Dc0GdbohJJKoIekIeItpZfR0GXY3BFgUVN/Kh8j6yTFDONo9GHwA81NFCu1MwLkSrVVBvtgWJ/RF+OEmNTgiL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DWgwO9MS; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549b159c84cso1514448e87.3
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 12:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707785; x=1744312585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYoADrO9YZr1hNVt8FHHeiiSHUxZ6kaNBXaVFMruk+4=;
        b=DWgwO9MSWkKsNzZMC1zNRqXdDRAAWPff8lY2AmYm3PblwLKcMXt/NkDHDtHVm4x83n
         2A8V8L1ZBAsC4gzccm/aotFQlP7sJJmD5BKMNUz60qx08wz8QJRy62Y/gKgNbjzN7yQ/
         vmv10DmO5RqtS4diElpgm3KGnqAL2qIoFbVDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707785; x=1744312585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYoADrO9YZr1hNVt8FHHeiiSHUxZ6kaNBXaVFMruk+4=;
        b=HyzEpl14HJIFLPY1v0mwKNottpsoiO28vFKXfZDPzpvSRvoMmSamHW3q8SD2H/azZI
         k/5xbOE0ChAz9Vmyew/XiLAxXNdv7f36PKQGA+MZuyJBKcCpqUNw0FJNQTkOJfY0OMVL
         dcvJj36q3zr3tvnO+VHKUi+8OOCrUeY1ZQcE2j0mcSd7z9ilCguA14f05HxnWU3FBJqW
         3rSYkGGaNm8OCUI8ZM+HfVlcvN5qckd+h1szstsCxtPmzZLOdRGgq75TTvkPHYqrg/XC
         FE8vrAewIWbba7fC5b2T191huB/eIfp+im3g06/o8gAaUGer25rq6trxQgjf8b+lOD20
         PiFg==
X-Gm-Message-State: AOJu0Yy+7cGT6TJAEulQgHfChinSxgyUhw0FuMyWB0Yg46vbm3cf6S4y
	dC7BsL0K04NJy/pyfgPO0THPvGctC0qk/hNqLBoTx2SZa75C7iPEC8uyD1p9Dg==
X-Gm-Gg: ASbGncv0wx0aMBARBCkU3j4iFCBUqAxJ30x14YsvHXgwkLvayEgReosEJqVtfETCFr/
	/QZ7dM/EoP+aGAT669xr1kpHmWfKJiZWUl1Zv105zazrI16rFpkbDz6QZRV/gWjM5culetfVItl
	Wc582RLUMy8MrcBx/6djOy80Xy1XBpLl3QqtWcXX4O/rqw61E72/7+eLY7UyYcp6ghxFF3v7oSc
	5qOaVY8UhmO4XIOidDa6sUDVyn0XrfqT+qkBLsIxh0sl2zyXMbAzV3RnAB3s7o8f4WeeBZFsc3x
	JYjWXAft3N3yRj1PWenxK5XQRTC6VsqpFEdV1TBikVULjrQTJW7tuSkOMx8k/P58a8oPE0rMCnk
	qhjF9g47A4Om91qwDFKuX2ohAJLWrEun+SU0=
X-Google-Smtp-Source: AGHT+IEGoLkshPtfD44DKnSZEUYb7gfzSjncS4T82uGZM/B3/E2lVpGdvLMrx6Bl5sLRu/jazB7Lrg==
X-Received: by 2002:a05:6512:3048:b0:542:213f:78fd with SMTP id 2adb3069b0e04-54c227f589amr79715e87.40.1743707785277;
        Thu, 03 Apr 2025 12:16:25 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:13 +0000
Subject: [PATCH 2/8] media: uvcvideo: Use dev_err_probe for
 devm_gpiod_get_optional
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-2-1a0cc595a62d@chromium.org>
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
In-Reply-To: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Doug Anderson <dianders@chromium.org>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.14.2

Use the dev_err_probe() helper for devm_gpiod_get_optional(), like we do
with gpiod_to_irq()

That eventually calls device_set_deferred_probe_reason() which can be
helpful for tracking down problems.

Now that all the error paths in uvc_gpio_parse have dev_err_probe, we
can remove the error message in uvc_probe.

Suggested-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 25e9aea81196e0eddba6de74951a46a97ae0bdb8..da24a655ab68cc0957762f2b67387677c22224d1 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1299,8 +1299,13 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 
 	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
 					       GPIOD_IN);
-	if (IS_ERR_OR_NULL(gpio_privacy))
-		return PTR_ERR_OR_ZERO(gpio_privacy);
+	if (!gpio_privacy)
+		return 0;
+
+	if (IS_ERR(gpio_privacy))
+		return dev_err_probe(&dev->intf->dev,
+				     PTR_ERR(gpio_privacy),
+				     "Can't get privacy GPIO\n");
 
 	irq = gpiod_to_irq(gpio_privacy);
 	if (irq < 0)
@@ -2241,10 +2246,8 @@ static int uvc_probe(struct usb_interface *intf,
 
 	/* Parse the associated GPIOs. */
 	ret = uvc_gpio_parse(dev);
-	if (ret < 0) {
-		uvc_dbg(dev, PROBE, "Unable to parse UVC GPIOs\n");
+	if (ret < 0)
 		goto error;
-	}
 
 	dev_info(&dev->udev->dev, "Found UVC %u.%02x device %s (%04x:%04x)\n",
 		 dev->uvc_version >> 8, dev->uvc_version & 0xff,

-- 
2.49.0.504.g3bcea36a83-goog


