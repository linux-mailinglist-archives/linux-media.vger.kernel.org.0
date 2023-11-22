Return-Path: <linux-media+bounces-792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 288827F4519
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 12:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC9E8B2132B
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 11:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFCD3FB11;
	Wed, 22 Nov 2023 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZhBKQaoc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D4A197
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 03:45:54 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-58ceab7daddso784518eaf.3
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 03:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700653553; x=1701258353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elffK1EXr85X4x2IFuFEE5Q2jUK2YCgnrDhIYGitDxs=;
        b=ZhBKQaocA553wX4+vf6bwMyDnty7FgIwBy9z3eJHKP49hHrFbv9DpXIUpGM5z0C8os
         VnlHroXUBjxHPMUDX12Bled63QWUfC6jauvI2V9D0U7rZu5lyrLaeYIHozQ3xxgcqGJF
         01IjTDRk/XpSL5XkfYmmW9x2CZWCQTZXrqmaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700653553; x=1701258353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elffK1EXr85X4x2IFuFEE5Q2jUK2YCgnrDhIYGitDxs=;
        b=ThKgM+lasnQkIUDH9M5sZw4UfFJ7qSUZDRGpLnwcVGbeUSVGJq31b3Y1GGjKJB+V8s
         fae/Jn7FqXBGyPObQDBzClCA6S0tCO6AImVC1jVgw/jDbhdYhroN03RbuoPxSS9zJqY3
         Im3Dt6ABg2QM8xDLg2aI3abDm7onx6EsOQltJqrdwOIdyS/qeSFX6yr6N0EcWdx7WdS0
         j8keAseyoNBCHV05CcGNcSxSPdUunWxbJiV/9VfYI9njVJk0p6rkip9IfegKW9VwMZMX
         omFGpb/L5QtotvAivzDxzS6nSRBplWIbNO6CM5kZl10QH4yuZ6HjjSmWg3S+kWBMomDL
         ODdA==
X-Gm-Message-State: AOJu0YwtmnI7z+FizDjeBawjfCAep6xK40xu2/w3jPdyjww33OCRXS0S
	mHkjZyJhgcAbUixCNcRNdEDFq3hYXtgMz1vaS47lAQ==
X-Google-Smtp-Source: AGHT+IHUWar8rHJPdOcQm1lng13oaUezhWg21X09uEcRzO3ra9YUPzGDvdKieEgQGcowYN1FKzat6w==
X-Received: by 2002:a05:6358:50c6:b0:168:e396:aa96 with SMTP id m6-20020a05635850c600b00168e396aa96mr1416014rwm.11.1700653552709;
        Wed, 22 Nov 2023 03:45:52 -0800 (PST)
Received: from denia.c.googlers.com (228.221.150.34.bc.googleusercontent.com. [34.150.221.228])
        by smtp.gmail.com with ESMTPSA id h3-20020ac85143000000b00419732075b4sm4357790qtn.84.2023.11.22.03.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:45:52 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Nov 2023 11:45:49 +0000
Subject: [PATCH v5 3/3] media: uvcvideo: Do not use usb_* functions after
 .disconnect
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-guenter-mini-v5-3-15d8cd8ed74f@chromium.org>
References: <20231122-guenter-mini-v5-0-15d8cd8ed74f@chromium.org>
In-Reply-To: <20231122-guenter-mini-v5-0-15d8cd8ed74f@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.12.3

usb drivers should not call to any I/O function after the
.disconnect() callback has been triggered.
https://www.kernel.org/doc/html/latest/driver-api/usb/callbacks.html#the-disconnect-callback

If an application is receiving frames form a camera and the device is
disconnected: the device will call close() after the usb .disconnect()
callback has been called. The streamoff path will call usb_set_interface
or usb_clear_halt, which is not allowed.

This patch only solves the calls to close() *after* .disconnect() is
being called.

Trace:
[ 1065.389723] drivers/media/usb/uvc/uvc_driver.c:2248 uvc_disconnect enter
[ 1065.390160] drivers/media/usb/uvc/uvc_driver.c:2264 uvc_disconnect exit
[ 1065.433956] drivers/media/usb/uvc/uvc_v4l2.c:659 uvc_v4l2_release enter
[ 1065.433973] drivers/media/usb/uvc/uvc_video.c:2274 uvc_video_stop_streaming enter
[ 1065.434560] drivers/media/usb/uvc/uvc_video.c:2285 uvc_video_stop_streaming exit
[ 1065.435154] drivers/media/usb/uvc/uvc_v4l2.c:680 uvc_v4l2_release exit
[ 1065.435188] drivers/media/usb/uvc/uvc_driver.c:2248 uvc_disconnect enter

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c |  2 ++
 drivers/media/usb/uvc/uvc_video.c  | 45 ++++++++++++++++++++++++--------------
 drivers/media/usb/uvc/uvcvideo.h   |  2 ++
 3 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index d5dbf2644272..d78640d422f4 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2266,6 +2266,8 @@ static void uvc_disconnect(struct usb_interface *intf)
 		return;
 
 	uvc_unregister_video(dev);
+	/* Barrier needed to pair with uvc_video_stop_streaming(). */
+	smp_store_release(&dev->disconnected, true);
 	kref_put(&dev->ref, uvc_delete);
 }
 
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 28dde08ec6c5..f5ef375088de 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -2243,28 +2243,39 @@ int uvc_video_start_streaming(struct uvc_streaming *stream)
 	return ret;
 }
 
-void uvc_video_stop_streaming(struct uvc_streaming *stream)
+static void uvc_video_halt(struct uvc_streaming *stream)
 {
-	uvc_video_stop_transfer(stream, 1);
+	unsigned int epnum;
+	unsigned int pipe;
+	unsigned int dir;
 
 	if (stream->intf->num_altsetting > 1) {
 		usb_set_interface(stream->dev->udev, stream->intfnum, 0);
-	} else {
-		/*
-		 * UVC doesn't specify how to inform a bulk-based device
-		 * when the video stream is stopped. Windows sends a
-		 * CLEAR_FEATURE(HALT) request to the video streaming
-		 * bulk endpoint, mimic the same behaviour.
-		 */
-		unsigned int epnum = stream->header.bEndpointAddress
-				   & USB_ENDPOINT_NUMBER_MASK;
-		unsigned int dir = stream->header.bEndpointAddress
-				 & USB_ENDPOINT_DIR_MASK;
-		unsigned int pipe;
-
-		pipe = usb_sndbulkpipe(stream->dev->udev, epnum) | dir;
-		usb_clear_halt(stream->dev->udev, pipe);
+		return;
 	}
 
+	/*
+	 * UVC doesn't specify how to inform a bulk-based device
+	 * when the video stream is stopped. Windows sends a
+	 * CLEAR_FEATURE(HALT) request to the video streaming
+	 * bulk endpoint, mimic the same behaviour.
+	 */
+	epnum = stream->header.bEndpointAddress & USB_ENDPOINT_NUMBER_MASK;
+	dir = stream->header.bEndpointAddress & USB_ENDPOINT_DIR_MASK;
+	pipe = usb_sndbulkpipe(stream->dev->udev, epnum) | dir;
+	usb_clear_halt(stream->dev->udev, pipe);
+}
+
+void uvc_video_stop_streaming(struct uvc_streaming *stream)
+{
+	uvc_video_stop_transfer(stream, 1);
+
+	/*
+	 * Barrier needed to pair with uvc_disconnect().
+	 * We cannot call usb_* functions on a disconnected USB device.
+	 */
+	if (!smp_load_acquire(&stream->dev->disconnected))
+		uvc_video_halt(stream);
+
 	uvc_video_clock_cleanup(stream);
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index ba8f8c1f2c83..5b1a3643de05 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -559,6 +559,8 @@ struct uvc_device {
 	unsigned int users;
 	atomic_t nmappings;
 
+	bool disconnected;
+
 	/* Video control interface */
 #ifdef CONFIG_MEDIA_CONTROLLER
 	struct media_device mdev;

-- 
2.43.0.rc1.413.gea7ed67945-goog


