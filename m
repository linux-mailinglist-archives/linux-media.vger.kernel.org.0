Return-Path: <linux-media+bounces-791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE67F4517
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 12:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E76E6B210D7
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 11:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D8B21109;
	Wed, 22 Nov 2023 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JRrhO6eL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE491BB
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 03:45:53 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-41cd4446cf5so39733461cf.3
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 03:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700653552; x=1701258352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sAQl0rfqb2MgR7IdUDNyZwwNJlU43qhGuht31RgDDQ=;
        b=JRrhO6eLxXdz6GTob0Y+fXeycWQUz2rLOd5DpyvYxf3zn27VObpv4fjH+rNtwNWg1C
         8KkA843ZSes5KCDpqEKU9eiLGnbTHvdWLmH3Uiez3hO3K2LdTQs9nBT2S8geMMSFnYmX
         C0MuukEUSXZ901THm2cE6qQDnoR97FIC7MZGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700653552; x=1701258352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sAQl0rfqb2MgR7IdUDNyZwwNJlU43qhGuht31RgDDQ=;
        b=m+GveeEA0NVPqsq0q1AXt5K2HMgojReNaEHrD2tUUa70Ui/VBSvC7UEA9JSGDJpUtJ
         87MxhBq/Trx8Y9wsmiXCET7j0rPlrHs0kH59S7CF+eNbNjjKEbXxysycynGwIuD47t0c
         +7m5gb/uq4vMhZp+fg1GRLOkjmPmNkqTDts05GZwJODVJGtv8OSoXK48ua65Ql6HMQ0r
         opoQlNzb+U7U2viRQcyMJrjm8eL7MI5Uj+WhvhwqFtVmpdEh2wycwWFX9bukO1tubjj5
         hOSUb6Myea9xMemcWqNIpUEvRjUo2IHuxJrlcw7DBIspR/kkeKyleux8XPuqg2ucqizo
         VVBw==
X-Gm-Message-State: AOJu0YxM3yH89WEWp206EJS2s+NPLU29nazoIXF2ooLd9WdhKUGRun7s
	4VKf6dWgXKt2EaYp0YQLSfXY4z0EYnU1I+4pzCEIuw==
X-Google-Smtp-Source: AGHT+IFuRxBzIzlStEKWTRZj48FWDA+kHeGWta5oj05iCnsPuDfT8Y/L+eHbenVXuyk4BBSswOfiyg==
X-Received: by 2002:ac8:5c09:0:b0:423:7766:a6f4 with SMTP id i9-20020ac85c09000000b004237766a6f4mr2570094qti.15.1700653551903;
        Wed, 22 Nov 2023 03:45:51 -0800 (PST)
Received: from denia.c.googlers.com (228.221.150.34.bc.googleusercontent.com. [34.150.221.228])
        by smtp.gmail.com with ESMTPSA id h3-20020ac85143000000b00419732075b4sm4357790qtn.84.2023.11.22.03.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:45:51 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Nov 2023 11:45:48 +0000
Subject: [PATCH v5 2/3] media: uvcvideo: Always use uvc_status_stop()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-guenter-mini-v5-2-15d8cd8ed74f@chromium.org>
References: <20231122-guenter-mini-v5-0-15d8cd8ed74f@chromium.org>
In-Reply-To: <20231122-guenter-mini-v5-0-15d8cd8ed74f@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.12.3

The only thread safe way to stop the status handler is with uvc_status.

Let's remove all the code paths partially stopping uvc_status.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 4 ----
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 drivers/media/usb/uvc/uvc_status.c | 8 ++++----
 drivers/media/usb/uvc/uvc_v4l2.c   | 2 +-
 drivers/media/usb/uvc/uvcvideo.h   | 2 +-
 5 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c2761..8e22a07e3e7b 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2765,10 +2765,6 @@ void uvc_ctrl_cleanup_device(struct uvc_device *dev)
 	struct uvc_entity *entity;
 	unsigned int i;
 
-	/* Can be uninitialized if we are aborting on probe error. */
-	if (dev->async_ctrl.work.func)
-		cancel_work_sync(&dev->async_ctrl.work);
-
 	/* Free controls and control mappings for all entities. */
 	list_for_each_entry(entity, &dev->entities, list) {
 		for (i = 0; i < entity->ncontrols; ++i) {
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ded2cb6ce14f..d5dbf2644272 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2282,7 +2282,7 @@ static int uvc_suspend(struct usb_interface *intf, pm_message_t message)
 	    UVC_SC_VIDEOCONTROL) {
 		mutex_lock(&dev->lock);
 		if (dev->users)
-			uvc_status_stop(dev);
+			uvc_status_stop(dev, true);
 		mutex_unlock(&dev->lock);
 		return 0;
 	}
diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index a78a88c710e2..9c5da1244999 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -292,7 +292,7 @@ int uvc_status_init(struct uvc_device *dev)
 
 void uvc_status_unregister(struct uvc_device *dev)
 {
-	usb_kill_urb(dev->int_urb);
+	uvc_status_stop(dev, false);
 	uvc_input_unregister(dev);
 }
 
@@ -310,7 +310,7 @@ int uvc_status_start(struct uvc_device *dev, gfp_t flags)
 	return usb_submit_urb(dev->int_urb, flags);
 }
 
-void uvc_status_stop(struct uvc_device *dev)
+void uvc_status_stop(struct uvc_device *dev, bool run_async_work)
 {
 	struct uvc_ctrl_work *w = &dev->async_ctrl;
 
@@ -326,7 +326,7 @@ void uvc_status_stop(struct uvc_device *dev)
 	 * Cancel any pending asynchronous work. If any status event was queued,
 	 * process it synchronously.
 	 */
-	if (cancel_work_sync(&w->work))
+	if (cancel_work_sync(&w->work) && run_async_work)
 		uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
 
 	/* Kill the urb. */
@@ -338,7 +338,7 @@ void uvc_status_stop(struct uvc_device *dev)
 	 * cancelled before returning or it could then race with a future
 	 * uvc_status_start() call.
 	 */
-	if (cancel_work_sync(&w->work))
+	if (cancel_work_sync(&w->work) && run_async_work)
 		uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
 
 	/*
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index f4988f03640a..f90206263ff4 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -672,7 +672,7 @@ static int uvc_v4l2_release(struct file *file)
 
 	mutex_lock(&stream->dev->lock);
 	if (--stream->dev->users == 0)
-		uvc_status_stop(stream->dev);
+		uvc_status_stop(stream->dev, false);
 	mutex_unlock(&stream->dev->lock);
 
 	usb_autopm_put_interface(stream->dev->intf);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6fb0a78b1b00..ba8f8c1f2c83 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -745,7 +745,7 @@ int uvc_status_init(struct uvc_device *dev);
 void uvc_status_unregister(struct uvc_device *dev);
 void uvc_status_cleanup(struct uvc_device *dev);
 int uvc_status_start(struct uvc_device *dev, gfp_t flags);
-void uvc_status_stop(struct uvc_device *dev);
+void uvc_status_stop(struct uvc_device *dev, bool run_async_work);
 
 /* Controls */
 extern const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited;

-- 
2.43.0.rc1.413.gea7ed67945-goog


