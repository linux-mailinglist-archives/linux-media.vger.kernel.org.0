Return-Path: <linux-media+bounces-20909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6929BCB11
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 11:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A25B81F23B1B
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 10:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30771D3654;
	Tue,  5 Nov 2024 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iLCzjuSb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE86A1D27A9
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730804047; cv=none; b=GbQdsyYWDardntu2xlehNzVRh+toUnXv4h8rHQ6xjlWE/ZNxPlzEAdnuhIy2QVPi7Uu9s5NHhd1XFdxeo0pg38o2OmaP5HCaUraRC1M4Q/h/3pOoVSDs3hc8q+yQ2dX0Z9X93p1xwIX1h5mSkZBtKJU8TH68JtpwcXeeNXD/rLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730804047; c=relaxed/simple;
	bh=I/zxD1ZX5xViP0hA+xiMUSFElQFf5YSxEvrMcQj7olE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AYz1wZF1HRqBdAZpMNjgclx6D0dQgRP1qPyrbJkQBMKYRdmcCZkzvSiKUpGanwB3hBaGcxkJB1qkJp+lmuoMOdDqpcETOAgJfyevBt9YNTSx7+2bQ7BvbFYgsxskPDrSwpDqu3JHWRWM2hMMuWCXmK5QTI6NLCtJJP6r00tfbJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iLCzjuSb; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6cbe53a68b5so37030066d6.1
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 02:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730804043; x=1731408843; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9LlhOovcF6A+v0lu4WJaM/qiFM0SFBq/pB5i7J9JwM=;
        b=iLCzjuSbsoiavzX4+B5aut0dKqr6DSiuN4Ugt/01oWrbzb8r4MVjzZIkFV8ZktBbbr
         urDu+gs4Fs31BDn0p2TAxb291OYe5qwR5Xt9fFYPozxIWdiyRuXwSdImGSGXuspVsSPm
         5BmZcrggyr8WAFwFViWYP9rhjfzUDus3kn1/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730804043; x=1731408843;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9LlhOovcF6A+v0lu4WJaM/qiFM0SFBq/pB5i7J9JwM=;
        b=QQ7KaU6p9R+0JNT3WYp4e7RPYuSll0jXB4Waa96xWYkrCWzX4iMMA9/uFQQaWIYYlT
         0lMC+7GNzV/Oj89Shrtd3Hyy0wIfmWL/ic7JF0ZgfBhhgbfVj7PzJwjKiUprKPLJux1q
         adp1vfJUwaVh4OJmISpaWMK1KNWlYiTpLz80amHxWASJTygcbkoQAiuG2hz7iVr5CLg2
         pe5+td0mmz8EaWkjgyazMAigYfsL3KdHfCIRXMkFHaw0aPfA1NSGRZE1kNqYeFaP7/lp
         qfqIsGQXFyL26Mv//yA484sA56/B1ogozXAahst8UGBGY8EIhB8lS1cuAWH3BBBUxvx9
         C52A==
X-Forwarded-Encrypted: i=1; AJvYcCWSSSLofl0aC0/ZXbug4J6D6lQqg9hekGkZmcm6lke5LnAMeEpU4h45k2SF2pFvFEtw1nIu/A4TqyTIcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm7dYoUAkQHFCtcP83pDTV8ll+In5jFYeaB5loyh7TWb5zqIS5
	L6ij2EoCxD59RL9z2phKCOO3YHru1EwFkPHLUWy7PxoJx/VAcP+Yeoqq8E+NZw==
X-Google-Smtp-Source: AGHT+IH1P3HlgzEOSpgPpqcH4O+hZepqfFtlWOVIoe8EIKIKxbnJCrC5OfHZjfzzOW+yhahs8+zHgA==
X-Received: by 2002:a05:6214:5b85:b0:6cb:e798:5589 with SMTP id 6a1803df08f44-6d346022456mr328000856d6.28.1730804043699;
        Tue, 05 Nov 2024 02:54:03 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d353fd8308sm58284686d6.57.2024.11.05.02.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:54:02 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 05 Nov 2024 10:53:59 +0000
Subject: [PATCH v2] media: uvcvideo: Fix crash during unbind if gpio unit
 is in use
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-uvc-crashrmmod-v2-1-547ce6a6962e@chromium.org>
X-B4-Tracking: v=1; b=H4sIAEb5KWcC/3XMyw6CMBCF4Vchs7aG4dIEV76HYYHtlM6i1Eyh0
 RDe3cre5X+S8+2QSJgS3KodhDInjkuJ5lKB8dMyk2JbGpq66bBuUW3ZKCNT8hJCtEprbal1ZsA
 OoZxeQo7fJ/gYS3tOa5TP6Wf8rX+pjApV3Q+O+qF9Ium78RIDb+EaZYbxOI4venbrw68AAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

We used the wrong device for the device managed functions. We used the
usb device, when we should be using the interface device.

If we unbind the driver from the usb interface, the cleanup functions
are never called. In our case, the IRQ is never disabled.

If an IRQ is triggered, it will try to access memory sections that are
already free, causing an OOPS.

Luckily this bug has small impact, as it is only affected by devices
with gpio units and the user has to unbind the device, a disconnect will
not trigger this error.

Cc: stable@vger.kernel.org
Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2: Thanks to Laurent.
- The main structure is not allocated with devres so there is a small
  period of time where we can get an irq with the structure free. Do not
  use devres for the IRQ.
- Link to v1: https://lore.kernel.org/r/20241031-uvc-crashrmmod-v1-1-059fe593b1e6@chromium.org
---
 drivers/media/usb/uvc/uvc_driver.c | 28 +++++++++++++++++++++-------
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index a96f6ca0889f..af6aec27083c 100644
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
@@ -1329,15 +1329,28 @@ static int uvc_gpio_parse(struct uvc_device *dev)
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
+	if (!ret)
+		dev->gpio_unit->gpio.inited = true;
+
+	return ret;
+}
+
+static void uvc_gpio_cleanup(struct uvc_device *dev)
+{
+	if (!dev->gpio_unit || !dev->gpio_unit->gpio.inited)
+		return;
+
+	free_irq(dev->gpio_unit->gpio.irq, dev);
 }
 
 /* ------------------------------------------------------------------------
@@ -1880,6 +1893,7 @@ static void uvc_delete(struct kref *kref)
 	struct uvc_device *dev = container_of(kref, struct uvc_device, ref);
 	struct list_head *p, *n;
 
+	uvc_gpio_cleanup(dev);
 	uvc_status_cleanup(dev);
 	uvc_ctrl_cleanup_device(dev);
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 07f9921d83f2..376cd670539b 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -234,6 +234,7 @@ struct uvc_entity {
 			u8  *bmControls;
 			struct gpio_desc *gpio_privacy;
 			int irq;
+			bool inited;
 		} gpio;
 	};
 

---
base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
change-id: 20241031-uvc-crashrmmod-666de3fc9141

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


