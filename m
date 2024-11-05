Return-Path: <linux-media+bounces-20939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278BA9BCF1A
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 15:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 306D71C2372F
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 14:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19ED1DB344;
	Tue,  5 Nov 2024 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N6mGU9fx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915C1D9A48
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816503; cv=none; b=KWloKrDNx9wpgjLhENUFXtuc3HK9+d1RgGVOKhagjfsrKwGIQmgICYQxv9ojEuy4qza3BX1vTCtsS/YEzhN6GdXOwpNtg08+pIoPVv9Wf1HPYFWG96Li/bf1I7Thmiq9Lfy+FEOSMXDAoZfyMKQhlWQ6NiMTS6w6DcG36Hm0SOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816503; c=relaxed/simple;
	bh=+WeoblxcVi27gfW2V2SiOkOlm5SjuVVgD0/kYFf0aBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M1XqVS0dso7UDEUewLyntj3k1sNpcQ00uhqsGAPcxPR1V8bkHoxezEsOJW5IRcgNqUV5aaPhK+TxX4UmaODn0n+kcy1nPXKvZ+quGRDh3OANZzIhYUnI40LcrUXzDme02twOaWvvRlH83hDqGB2n3wWv23Rq7YHSB4mnhrZ+S3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N6mGU9fx; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b1488fde46so431103185a.2
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 06:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730816500; x=1731421300; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dJDZZo4Ve4iYh3WFwxUk1X5fJAMiaOerhjZjpwZfd8g=;
        b=N6mGU9fxuBEF39JNfkPSvuUDWb5h9/rLYxgLhoF/2SOPMHX0khevkFIcgH06eqfeYR
         o8ZG4x818s2Mvo+yj1MuAK/nqIHRvY089v1pC6Qkh3JTlq0Ya2w5ZbH+lhopsISTPNHx
         EfdVPIlkr4OdV50M+a9JH8t5vd7YHTj0XFjIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730816500; x=1731421300;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJDZZo4Ve4iYh3WFwxUk1X5fJAMiaOerhjZjpwZfd8g=;
        b=baaDzgIkHxdhejhH/R6MhoJ0r45ncYVzcNgPsBH4k1ejTKZ/Ze80/NmFXenyzcK9Gv
         /v1FoOIw7Ls5cu38UHJGzz3e0GQPkCSdOzXosQo1eX6i+4KSyM5eVwtAdudCDjW3ELg1
         dRbrut9MXBRKhflPFri0AnFYSnXrnbIb73ICS6NIoYzhZ5QMJkyEI28urDkIWWOY10IJ
         86W1cqxPXQFLiXHyhJWYLaLRpWT3g6A7hErZDVgcy41LLIylEGyBvxD9NisActa4uJgA
         GRhiqttfmv3k/z792zJ5Qd39FQ/S+EhYGRe34vjikmI4AwK5ukISW5cJAGkFiaTGmeeW
         CHAg==
X-Forwarded-Encrypted: i=1; AJvYcCVc42Jt4LWzoSpXvcEyoK7+7SJJIP+54i9r8zz+NCxwL/8ruZV5f8+drZVZ/mSJ8MBVJh8TfKWYtk4Omw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5zknuzZAIQRmghyCCQ7SVyUvK0cqozsqzbOpTvEgT1vX0Fddj
	00ZShzy08VvdWhekZPw1cfyijkPZvOMxgi1hJmEmn7lhO5+XbozxccFlH8e4H2gxuNDbBXotAL4
	=
X-Google-Smtp-Source: AGHT+IET76wqGeZeiKOO0DDFoEAcw6qhsEUFzcltfZKRHsvnCaSVmQgqX4SOBZGzP4pWrL7tbrsm0A==
X-Received: by 2002:a05:620a:3712:b0:7ac:dfed:65ee with SMTP id af79cd13be357-7b193ee170fmr5175922885a.3.1730816500369;
        Tue, 05 Nov 2024 06:21:40 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a7139fsm521024685a.76.2024.11.05.06.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:21:39 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 05 Nov 2024 14:21:38 +0000
Subject: [PATCH v5] media: uvcvideo: Fix crash during unbind if gpio unit
 is in use
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-uvc-crashrmmod-v5-1-8623fa51a74f@chromium.org>
X-B4-Tracking: v=1; b=H4sIAPEpKmcC/33Pyw7CIBCF4VcxrMUw3Fpc+R7GRYWhZdFiwBKN6
 buLbky8Lf+TzJfMjWRMATPZrm4kYQk5xKmGWq+IHbqpRxpcbcIZl8AE0LlYalOXhzSO0VGttUP
 hrQEJpB6dEvpweYL7Q+0h5HNM16df4LH+pApQoEwZj8qII6De2SHFMczjJqaePLTCXwIw9SHwK
 ijZWNSdNprjF0H8F0QVLDPK2NYw7cQXQf4XJGW0/odKtp6ZpnsTlmW5AwqX/6V1AQAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 stable@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

We used the wrong device for the device managed functions. We used the
usb device, when we should be using the interface device.

If we unbind the driver from the usb interface, the cleanup functions
are never called. In our case, the IRQ is never disabled.

If an IRQ is triggered, it will try to access memory sections that are
already free, causing an OOPS.

We cannot use the function devm_request_threaded_irq here. The devm_*
clean functions are called after the main structure is released by
uvc_delete.

Luckily this bug has small impact, as it is only affected by devices
with gpio units and the user has to unbind the device, a disconnect will
not trigger this error.

Cc: stable@vger.kernel.org
Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v5:
- Revert non refcount, that belongs to a different set
- Move cleanup to a different function
- Link to v4: https://lore.kernel.org/r/20241105-uvc-crashrmmod-v4-0-410e548f097a@chromium.org

Changes in v4: Thanks Laurent.
- Remove refcounted cleaup to support devres.
- Link to v3: https://lore.kernel.org/r/20241105-uvc-crashrmmod-v3-1-c0959c8906d3@chromium.org

Changes in v3: Thanks Sakari.
- Rename variable to initialized.
- Other CodeStyle.
- Link to v2: https://lore.kernel.org/r/20241105-uvc-crashrmmod-v2-1-547ce6a6962e@chromium.org

Changes in v2: Thanks to Laurent.
- The main structure is not allocated with devres so there is a small
  period of time where we can get an irq with the structure free. Do not
  use devres for the IRQ.
- Link to v1: https://lore.kernel.org/r/20241031-uvc-crashrmmod-v1-1-059fe593b1e6@chromium.org
---
 drivers/media/usb/uvc/uvc_driver.c | 27 ++++++++++++++++++++-------
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index a96f6ca0889f..aa937f07b6b5 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1295,14 +1295,14 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 	struct gpio_desc *gpio_privacy;
 	int irq;
 
-	gpio_privacy = devm_gpiod_get_optional(&dev->udev->dev, "privacy",
+	gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
 					       GPIOD_IN);
 	if (IS_ERR_OR_NULL(gpio_privacy))
 		return PTR_ERR_OR_ZERO(gpio_privacy);
 
 	irq = gpiod_to_irq(gpio_privacy);
 	if (irq < 0)
-		return dev_err_probe(&dev->udev->dev, irq,
+		return dev_err_probe(&dev->intf->dev, irq,
 				     "No IRQ for privacy GPIO\n");
 
 	unit = uvc_alloc_new_entity(dev, UVC_EXT_GPIO_UNIT,
@@ -1329,15 +1329,27 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 static int uvc_gpio_init_irq(struct uvc_device *dev)
 {
 	struct uvc_entity *unit = dev->gpio_unit;
+	int ret;
 
 	if (!unit || unit->gpio.irq < 0)
 		return 0;
 
-	return devm_request_threaded_irq(&dev->udev->dev, unit->gpio.irq, NULL,
-					 uvc_gpio_irq,
-					 IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
-					 IRQF_TRIGGER_RISING,
-					 "uvc_privacy_gpio", dev);
+	ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
+				   IRQF_TRIGGER_RISING,
+				   "uvc_privacy_gpio", dev);
+
+	unit->gpio.initialized = !ret;
+
+	return ret;
+}
+
+static void uvc_gpio_cleanup(struct uvc_device *dev)
+{
+	if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
+		return;
+
+	free_irq(dev->gpio_unit->gpio.irq, dev);
 }
 
 /* ------------------------------------------------------------------------
@@ -1982,6 +1994,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
 	if (media_devnode_is_registered(dev->mdev.devnode))
 		media_device_unregister(&dev->mdev);
 #endif
+	uvc_gpio_cleanup(dev);
 }
 
 int uvc_register_video_device(struct uvc_device *dev,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 07f9921d83f2..965a789ed03e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -234,6 +234,7 @@ struct uvc_entity {
 			u8  *bmControls;
 			struct gpio_desc *gpio_privacy;
 			int irq;
+			bool initialized;
 		} gpio;
 	};
 

---
base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
change-id: 20241031-uvc-crashrmmod-666de3fc9141

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


