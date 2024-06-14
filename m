Return-Path: <linux-media+bounces-13266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAAF908BE0
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 14:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78BF5288238
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 12:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6823B19AD41;
	Fri, 14 Jun 2024 12:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PQIxWPGD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A20D1990CD
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718368903; cv=none; b=hNyJz8hkhetECF1kYtdJCcZ5gpA0zxse1PGRRAJJWOZ/0oy69wtmu8KeW2Sdb3gsWC/it3Uy03MrxqvO0IT5xB3kbDR8ul2r79P67c0N5ZvB+LkNPW/ou7iwcWiC5OkbXt/xD6ClHoGDq8Ei8dva0EN4W1WubRPV6OEHDh8PrKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718368903; c=relaxed/simple;
	bh=uXpDcwRqOU3iiAGO1O46hyoNKWa9ISkvjQJvmjavmUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWq/TvLu+90OHbAOUbWKo4xLHiOiq8+RiKiAEthwxpPk6QDKzQejnp0GDbo7sJrWEYiJudbJ9B2mrc0DYxpi0cv4rTfAdegDbEEEdU7zGQ+00OurXxKNd4ArVSVtRye0KypCbV78qxitJaOUgmUzOvhZ2RINGt6X+QTLxhVRNCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PQIxWPGD; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-795a4fde8bfso119104985a.2
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 05:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718368900; x=1718973700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKoE+RIOmQJlHGEBp9l62JpXSTtIbmY829LT5LUBfbs=;
        b=PQIxWPGDgRT8sz2HTQ6b/8wsEsCoTgBUF+BB9148O37m16ExYB1no1WgKaeIJmAj3B
         Gp+lFGee2T4ggk3WTadRGhxgkFpv73XDheYTPxsSWUBI8mLBtNj+d/b+TITYol5Qo0dt
         bhPNtXUH6VYCxqLqja6kDqslCi/0nJH2rs5FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718368900; x=1718973700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKoE+RIOmQJlHGEBp9l62JpXSTtIbmY829LT5LUBfbs=;
        b=ftCAeaCfCBwElYCyrR8uqFw/ZCpTPL4ywKBe32tYbWxi6b+BYnfyCFEnyLhAUe/AbJ
         s2RebNytNifNY/o24cnquwQ1oKkOe8VfehiqIz00eUBHWBSw8a3hWQPfSQfD2yBuBMGQ
         21XF0Lfdwbduvjl46QNuLFOi/B/AhnKN7dnvSFQtQEm2BR6X0mZqhAI96kbSVsfGLYkz
         TlTLOFPFoflu9guaXzBbR87fXL0Kxm3azxgkk41LDpDHXk5Wg8oVJauU12GtdZrGvCE+
         Zff3f9mTyt5IbB5faZX8D2UZOPWgnjufZiXAOtAQrAJIkXPPNRoD9JCUC43Yxu17JUR1
         EhaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGH0/xRuUOjkkTDVSq05dASJvD/vlIWPBCODRl3COWlMQ5JJ9sDOg8acT74hDguJ43PX9r/JFNC7RhoqvpvjjH7ZpfPJxbnVQ583Q=
X-Gm-Message-State: AOJu0YxtMgQnQxYdymuGeXFY5eB1iRsyVBTjsc+UwLP6adlA+0TPS3WY
	Gvl8To1wEH7PBVeJ2JN4tNPjwFWG975l99AmlnF862hyUzsVIARJHVaQnB5VDg==
X-Google-Smtp-Source: AGHT+IHDIaw9zNQIJOOgfKn75K1P93hUk40/EXahuqWPNl2coOrMG2Gw7mzdwnqJJMwkub7LkhrqRQ==
X-Received: by 2002:a0c:e78d:0:b0:6b0:6400:3b6f with SMTP id 6a1803df08f44-6b2afc78e7emr24373436d6.8.1718368900344;
        Fri, 14 Jun 2024 05:41:40 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5c202e8sm17734056d6.50.2024.06.14.05.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 05:41:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 14 Jun 2024 12:41:28 +0000
Subject: [PATCH v6 2/4] media: uvcvideo: Refactor the status irq API
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-guenter-mini-v6-2-7b7fdc3b21b3@chromium.org>
References: <20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org>
In-Reply-To: <20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.13.0

There are two different use-cases of uvc_status():
	- adding/removing a user when the camera is open/closed
	- stopping/starting when the camera is suspended/resumed

Make the API reflect these two use-cases and move all the refcounting
and locking logic to the uvc_status.c file.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 13 ++-------
 drivers/media/usb/uvc/uvc_status.c | 55 ++++++++++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c   | 22 +++++----------
 drivers/media/usb/uvc/uvcvideo.h   | 10 ++++---
 4 files changed, 67 insertions(+), 33 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 55132688e363..c8c0352af1e5 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2135,7 +2135,6 @@ static int uvc_probe(struct usb_interface *intf,
 	INIT_LIST_HEAD(&dev->streams);
 	kref_init(&dev->ref);
 	atomic_set(&dev->nmappings, 0);
-	mutex_init(&dev->lock);
 
 	dev->udev = usb_get_dev(udev);
 	dev->intf = usb_get_intf(intf);
@@ -2301,10 +2300,7 @@ static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
 	/* Controls are cached on the fly so they don't need to be saved. */
 	if (intf->cur_altsetting->desc.bInterfaceSubClass ==
 	    UVC_SC_VIDEOCONTROL) {
-		mutex_lock(&dev->lock);
-		if (dev->users)
-			uvc_status_stop(dev);
-		mutex_unlock(&dev->lock);
+		uvc_status_suspend(dev);
 		return 0;
 	}
 
@@ -2335,12 +2331,7 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
 				return ret;
 		}
 
-		mutex_lock(&dev->lock);
-		if (dev->users)
-			ret = uvc_status_start(dev, GFP_NOIO);
-		mutex_unlock(&dev->lock);
-
-		return ret;
+		return uvc_status_resume(dev);
 	}
 
 	list_for_each_entry(stream, &dev->streams, list) {
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index a78a88c710e2..375a95dd3011 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -257,6 +257,8 @@ int uvc_status_init(struct uvc_device *dev)
 	unsigned int pipe;
 	int interval;
 
+	mutex_init(&dev->status_lock);
+
 	if (ep == NULL)
 		return 0;
 
@@ -302,18 +304,22 @@ void uvc_status_cleanup(struct uvc_device *dev)
 	kfree(dev->status);
 }
 
-int uvc_status_start(struct uvc_device *dev, gfp_t flags)
+static int __uvc_status_start(struct uvc_device *dev, gfp_t flags)
 {
+	lockdep_assert_held(&dev->status_lock);
+
 	if (dev->int_urb == NULL)
 		return 0;
 
 	return usb_submit_urb(dev->int_urb, flags);
 }
 
-void uvc_status_stop(struct uvc_device *dev)
+static void __uvc_status_stop(struct uvc_device *dev)
 {
 	struct uvc_ctrl_work *w = &dev->async_ctrl;
 
+	lockdep_assert_held(&dev->status_lock);
+
 	/*
 	 * Prevent the asynchronous control handler from requeing the URB. The
 	 * barrier is needed so the flush_status change is visible to other
@@ -350,3 +356,48 @@ void uvc_status_stop(struct uvc_device *dev)
 	 */
 	smp_store_release(&dev->flush_status, false);
 }
+
+int uvc_status_resume(struct uvc_device *dev)
+{
+	int ret = 0;
+
+	mutex_lock(&dev->status_lock);
+	if (dev->status_users)
+		ret = __uvc_status_start(dev, GFP_NOIO);
+	mutex_unlock(&dev->status_lock);
+
+	return ret;
+}
+
+void uvc_status_suspend(struct uvc_device *dev)
+{
+	mutex_lock(&dev->status_lock);
+	if (dev->status_users)
+		__uvc_status_stop(dev);
+	mutex_unlock(&dev->status_lock);
+}
+
+int uvc_status_get(struct uvc_device *dev)
+{
+	int ret = 0;
+
+	mutex_lock(&dev->status_lock);
+	if (!dev->status_users)
+		ret = __uvc_status_start(dev, GFP_KERNEL);
+	if (!ret)
+		dev->status_users++;
+	mutex_unlock(&dev->status_lock);
+
+	return ret;
+}
+
+void uvc_status_put(struct uvc_device *dev)
+{
+	mutex_lock(&dev->status_lock);
+	if (dev->status_users == 1)
+		__uvc_status_stop(dev);
+	WARN_ON(!dev->status_users);
+	if (dev->status_users)
+		dev->status_users--;
+	mutex_unlock(&dev->status_lock);
+}
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index f4988f03640a..97c5407f6603 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -628,20 +628,13 @@ static int uvc_v4l2_open(struct file *file)
 		return -ENOMEM;
 	}
 
-	mutex_lock(&stream->dev->lock);
-	if (stream->dev->users == 0) {
-		ret = uvc_status_start(stream->dev, GFP_KERNEL);
-		if (ret < 0) {
-			mutex_unlock(&stream->dev->lock);
-			usb_autopm_put_interface(stream->dev->intf);
-			kfree(handle);
-			return ret;
-		}
+	ret = uvc_status_get(stream->dev);
+	if (ret) {
+		usb_autopm_put_interface(stream->dev->intf);
+		kfree(handle);
+		return ret;
 	}
 
-	stream->dev->users++;
-	mutex_unlock(&stream->dev->lock);
-
 	v4l2_fh_init(&handle->vfh, &stream->vdev);
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
@@ -670,10 +663,7 @@ static int uvc_v4l2_release(struct file *file)
 	kfree(handle);
 	file->private_data = NULL;
 
-	mutex_lock(&stream->dev->lock);
-	if (--stream->dev->users == 0)
-		uvc_status_stop(stream->dev);
-	mutex_unlock(&stream->dev->lock);
+	uvc_status_put(stream->dev);
 
 	usb_autopm_put_interface(stream->dev->intf);
 	return 0;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6fb0a78b1b00..00b600eb058c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -555,8 +555,6 @@ struct uvc_device {
 
 	const struct uvc_device_info *info;
 
-	struct mutex lock;		/* Protects users */
-	unsigned int users;
 	atomic_t nmappings;
 
 	/* Video control interface */
@@ -578,6 +576,8 @@ struct uvc_device {
 	struct usb_host_endpoint *int_ep;
 	struct urb *int_urb;
 	struct uvc_status *status;
+	struct mutex status_lock; /* Protects status_users */
+	unsigned int status_users;
 	bool flush_status;
 
 	struct input_dev *input;
@@ -744,8 +744,10 @@ int uvc_register_video_device(struct uvc_device *dev,
 int uvc_status_init(struct uvc_device *dev);
 void uvc_status_unregister(struct uvc_device *dev);
 void uvc_status_cleanup(struct uvc_device *dev);
-int uvc_status_start(struct uvc_device *dev, gfp_t flags);
-void uvc_status_stop(struct uvc_device *dev);
+int uvc_status_resume(struct uvc_device *dev);
+void uvc_status_suspend(struct uvc_device *dev);
+int uvc_status_get(struct uvc_device *dev);
+void uvc_status_put(struct uvc_device *dev);
 
 /* Controls */
 extern const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited;

-- 
2.45.2.627.g7a2c4fd464-goog


