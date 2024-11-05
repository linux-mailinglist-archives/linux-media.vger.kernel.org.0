Return-Path: <linux-media+bounces-20941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8065D9BCF66
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 15:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 405C4285941
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 14:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5CD1D8DE4;
	Tue,  5 Nov 2024 14:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fbYwe+hs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17941D5CD7
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 14:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730817164; cv=none; b=KWcYp8OxsHfT41qB6fm5iujxNzenCX33LppwC5upVPMXpOyT8LrjQ7Xy7EzzsxFzVMqeuGwJ3iPdX8vRR4jhPu3B4gPQ4s4UwnVMUx0P7fus5Ta6Y6p24xXBLrxqNHoC0vxHdwZSHkdl8d31Wk3rAQXrS2+GSV03C7svS9b1VJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730817164; c=relaxed/simple;
	bh=JOtBuRuptx6aynlVjS3XxFiIchWMqa6f2ZGHo9y3vNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lt6XU417Ir6/vMQiSFJxLKMkjr7TYFN/Yu/Eic873ZroL1Nvg4c1QKJ4ZVpzrTJ2uhYAzlP2gSayU/+FGRemfyQ0ko+++g9ju8H6HntiNJ/uWX95ISsXF1z2omuHh2uEJD/e2x8v4X1jH0LaY8lUP0VAziKQNFHNtrTOkUY4bi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fbYwe+hs; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b152a923a3so382548285a.3
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 06:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730817162; x=1731421962; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mh6wcJRaaoFfgA/PI0+gh0VHMIduRtoAQnAU9qQerOg=;
        b=fbYwe+hswtGW21j6SogQv4crdNKv9VZndmhI43s+Kmlg8Bvq0Qg5lpZ38UmSm6Ke7A
         C/TqXLjhx+owmNUI4X1Pq6eCZRf6QoMZhF2zu7rn7Q7KuLRCt6WEEYG4drmB2pZMRryE
         Z4/plorVPn/+VHSY5ZRJX7kkS5O/2YKfR1qII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817162; x=1731421962;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mh6wcJRaaoFfgA/PI0+gh0VHMIduRtoAQnAU9qQerOg=;
        b=kf86yQjviWMLNQyFSsIzOSazBQLXUh/qHumMD8qsY8lM3beNVOlR6OvZNctrjJz4RE
         pQLegmpQtVNQIdBhqjpx/vkAuqKBT7T+OoUeALzpfEdlC0oB662YwqNUm6k6bPf/Aran
         3JJFSPjJcaS4r0vKQzQZAFQsDFmBX9kycz953g9Sx3a0sQmBIiU5h+l/ejDcF6q8VOYD
         top1BCZVPdPJvqriGYPArNlN57g5y1JMv0r+k9AwzHyZo9pl9JJ0vk37bRKCifcQdOw2
         fAk+l3WFRo/NE5DJW8R+17wCQC1STqjTUmlLI8KU+GMUFX4bIalE1egKh7iHpk/kM3WD
         VNUA==
X-Gm-Message-State: AOJu0Yy7W9+JhqWQB/bksK5EvV8YxMexmSK46JEl8+EzM3Wv8GInAjwc
	Jg9GzsUh+mRYVyt8H6JHzILvDeMXL3SSE3Yc7vfxosFWFRbXE9jHzQkhcPnvMQ==
X-Google-Smtp-Source: AGHT+IE9JbPrCbrkaKjMlscZUO7hP79GowP6m6qs/o/ZK1p8JuRhg/+RZwPShS5hHydgzc/lyzTubw==
X-Received: by 2002:a05:620a:294d:b0:79d:69b5:aaf7 with SMTP id af79cd13be357-7b2f24c52f1mr2796640785a.11.1730817161666;
        Tue, 05 Nov 2024 06:32:41 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39ee118sm526243785a.20.2024.11.05.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:32:41 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 05 Nov 2024 14:32:39 +0000
Subject: [PATCH] media: uvcvideo: Remove refcounted cleanup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-uvc-rmrefcount-v1-1-123f56b01731@chromium.org>
X-B4-Tracking: v=1; b=H4sIAIYsKmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwNT3dKyZN2i3KLUtOT80rwSXQNDgxRLixQTS7NkUyWgpgKgTGYF2MD
 o2NpaABIqSCFgAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

After commit c9ec6f173636 ("media: uvcvideo: Stop stream during unregister")
we have some guarantee that userspace will not be able to access any of
our internal structures after disconnect().

This means that we can do the cleanup at the end of disconnect and make
the code more resilient to races.

This change will also enable the use of devres functions in more parts
of the code.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 24 +++++-------------------
 drivers/media/usb/uvc/uvcvideo.h   |  1 -
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index a96f6ca0889f..2735fccdf454 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1868,16 +1868,12 @@ static int uvc_scan_device(struct uvc_device *dev)
 /*
  * Delete the UVC device.
  *
- * Called by the kernel when the last reference to the uvc_device structure
- * is released.
- *
- * As this function is called after or during disconnect(), all URBs have
+ * As this function is called during disconnect(), all URBs have
  * already been cancelled by the USB core. There is no need to kill the
  * interrupt URB manually.
  */
-static void uvc_delete(struct kref *kref)
+static void uvc_delete(struct uvc_device *dev)
 {
-	struct uvc_device *dev = container_of(kref, struct uvc_device, ref);
 	struct list_head *p, *n;
 
 	uvc_status_cleanup(dev);
@@ -1919,14 +1915,6 @@ static void uvc_delete(struct kref *kref)
 	kfree(dev);
 }
 
-static void uvc_release(struct video_device *vdev)
-{
-	struct uvc_streaming *stream = video_get_drvdata(vdev);
-	struct uvc_device *dev = stream->dev;
-
-	kref_put(&dev->ref, uvc_delete);
-}
-
 /*
  * Unregister the video devices.
  */
@@ -2009,7 +1997,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 	vdev->v4l2_dev = &dev->vdev;
 	vdev->fops = fops;
 	vdev->ioctl_ops = ioctl_ops;
-	vdev->release = uvc_release;
+	vdev->release = video_device_release_empty;
 	vdev->prio = &stream->chain->prio;
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		vdev->vfl_dir = VFL_DIR_TX;
@@ -2045,7 +2033,6 @@ int uvc_register_video_device(struct uvc_device *dev,
 		return ret;
 	}
 
-	kref_get(&dev->ref);
 	return 0;
 }
 
@@ -2160,7 +2147,6 @@ static int uvc_probe(struct usb_interface *intf,
 	INIT_LIST_HEAD(&dev->entities);
 	INIT_LIST_HEAD(&dev->chains);
 	INIT_LIST_HEAD(&dev->streams);
-	kref_init(&dev->ref);
 	atomic_set(&dev->nmappings, 0);
 
 	dev->udev = usb_get_dev(udev);
@@ -2300,7 +2286,7 @@ static int uvc_probe(struct usb_interface *intf,
 
 error:
 	uvc_unregister_video(dev);
-	kref_put(&dev->ref, uvc_delete);
+	uvc_delete(dev);
 	return -ENODEV;
 }
 
@@ -2319,7 +2305,7 @@ static void uvc_disconnect(struct usb_interface *intf)
 		return;
 
 	uvc_unregister_video(dev);
-	kref_put(&dev->ref, uvc_delete);
+	uvc_delete(dev);
 }
 
 static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 07f9921d83f2..feb8de640a26 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -578,7 +578,6 @@ struct uvc_device {
 
 	/* Video Streaming interfaces */
 	struct list_head streams;
-	struct kref ref;
 
 	/* Status Interrupt Endpoint */
 	struct usb_host_endpoint *int_ep;

---
base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
change-id: 20241105-uvc-rmrefcount-010d98d496c5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


