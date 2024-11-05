Return-Path: <linux-media+bounces-20936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED249BCEAB
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 15:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3DC81C218BE
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 14:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153CF1D89F3;
	Tue,  5 Nov 2024 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PKaGrq1n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E431D8A16
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730815573; cv=none; b=iONEO/L+IIYZxooCveEBrB59dtfWGppNmAF+kExJgO4jQyhG6kB0bh4o9pyfxnWy6JpHuzvrzi6U+AYjoRe/xUNKiM67k/S9BxoSTfpJSF/jVJmLSM5D7mwEGmJWkcXp5ktGBC+BrxrSAT7AH27H+RrPMe+1T+xXO6tavB3yNyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730815573; c=relaxed/simple;
	bh=llHpLGlkUHZowYuOkDk6k/JCIAhD9hLmX4RX3PNhlsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APL88VFTblcPeGOMS3C5CPWLjqp00eh39f70jP8dyADZChv6MOIvaX5FaYc1539IdkQ5tklU3aNbN38q7zlmNS1Pb02Um4pR07bwtgpcrU0stebrhzyP4P3fkHfn8vO3ABDdd0GXJrqf+cp9I5GSTogZ4aCd8ADpid3YWthMZVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PKaGrq1n; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b158542592so389877185a.2
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 06:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730815570; x=1731420370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gio7v/Jh4+pISjPYX2FMMZSUjUbp0P+7Vz75sUpvXsU=;
        b=PKaGrq1nJyNdSxwiQg6orjFw8thaOymlBjKIRG/HhxpJ3POB7+KMv16ZmbmmAGU8NA
         0uyq8V6qpJ4AuqMzz/pbBku6jcPokLfkmXzdcMnbZcNzyyFACmFCtcFTyGs0C910yEH/
         FFB+XuiOgSzlqVAcGOkGgZ/9c5AmwEOCbpHg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730815570; x=1731420370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gio7v/Jh4+pISjPYX2FMMZSUjUbp0P+7Vz75sUpvXsU=;
        b=jUY/hpu0h6aXw2U+GMueX2vd+rx1yhNERg+FnynFH0MkV3jWWDQRIajIHKZwf1z7E7
         ExdWmgWLtSQ3ufURQb4L0St+20oba4wy6t04v4g5Lj9pPse7ixIx+HOuxZzXFhNkdgFG
         Dy7sSVC2sv9TgpQxh/PXDnqzSSIgyFzSOb23s0xNsrjFftSG/yLTfPZuiRlYTfBJHj++
         9VhMUZFvHdIq7CjKR68KmSnqinueyQ64I5HBJUkp0tDYuQCpkXnRxdSRXS84nb0eWWEi
         OWqShvPcNV2qdUCytPTM9Q1QY8I/u0IN/b/9NfwRl3MbTh7NlKv8e8CLSDLNAM6OcX2p
         eRsA==
X-Forwarded-Encrypted: i=1; AJvYcCWfPw1EE3rlbRDZAIzW+9c1kgkrGj4ysyxeXubL6U2G8My8uK1zVhaxCjh+YqHHYMVmfDg1JJ6D3ZeRwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBV2CDJ/AzYYobBOkNvgJJRR8J4PuyismGEgNKCCdaV5/Ew2mP
	aWCuMqUTPadAyzSQWmnl9d7vNIxZO2ImxYGiQbPF4Zo6YR/018oVx5srE+4chQ==
X-Google-Smtp-Source: AGHT+IHJSp6KoCO0JCiw9Js2LtOlX7ZsvBREP0xvGv2MuJzWFhwN8LTZLpMVZXngGMQU2mZFB23TSQ==
X-Received: by 2002:a05:620a:2a12:b0:7b1:4caf:3750 with SMTP id af79cd13be357-7b2fb9beb07mr2585903885a.53.1730815570498;
        Tue, 05 Nov 2024 06:06:10 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a816afsm520422185a.101.2024.11.05.06.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:06:10 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 05 Nov 2024 14:06:06 +0000
Subject: [PATCH v4 1/2] media: uvcvideo: Remove refcounted cleanup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-uvc-crashrmmod-v4-1-410e548f097a@chromium.org>
References: <20241105-uvc-crashrmmod-v4-0-410e548f097a@chromium.org>
In-Reply-To: <20241105-uvc-crashrmmod-v4-0-410e548f097a@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

After commit: c9ec6f173636 ("media: uvcvideo: Stop stream during unregister")
we have some guarantee that userspace will not be able to access any of
our internal structures after disconnect().

This means that we can do the cleanup at the end of disconnect and we
will be able to use devres functions without fear of races.

Cc: stable@vger.kernel.org
Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
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

-- 
2.47.0.199.ga7371fff76-goog


