Return-Path: <linux-media+bounces-678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8BC7F36F7
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 20:54:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76704282A94
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 19:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDA142077;
	Tue, 21 Nov 2023 19:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Crb37cSy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9AD1A1
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 11:53:53 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-677f974b72bso20598426d6.3
        for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 11:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700596433; x=1701201233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3dKWWo3LzCAEQiNhkIr0MWg5E8+oPU3fVyqu1x1TiE=;
        b=Crb37cSysZk6ssFT2wZzBeAY6UFXgEeq++bTqg3NCWi0s9fVENA2fd0ArX7nF9/fIB
         GaVviUbqaOP8xOkiA3MtM4K3BvGwMY4jxhVBuzkC91ri27vfI8jUpOdj+zD4ICeMCin7
         y6rO7sThVd/sf6pl3ZVRfF0TukWq6UzT/rVXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700596433; x=1701201233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3dKWWo3LzCAEQiNhkIr0MWg5E8+oPU3fVyqu1x1TiE=;
        b=mIhg1Rpc1sKDzcVliHo+abzNNwIWY/X4+YnI1OHePhbpwzczJZcV7DLqzY38esyGtm
         qA7nVnh8boZTZ5bnFQ607Mwdsp2JKU/yAzO5Uc89FzN7Gra329PtvjcOVbVq320b9Fcf
         o3vtuwF0nKJrxMW9M57AbPlCIFBjEzPCIh2qg8w3luTAwsCvRQ0aIKaeO51yBwtInQqm
         z9BPeAu9JQMYsrKmD4rs3mndAjo+Gf2sfmBKRLwSHd52x2k8GdSowV1JCvzE6oyTyyrE
         T9e4gseyGfVez5BqMOkS0eI8KusLTVRV/bALp5VkfC+f5vNq3Tm971+DqqRYq/cMisuQ
         oyug==
X-Gm-Message-State: AOJu0YzRbSGMAynnxa3FVqZgYd4o+nwKJVKOjacgTEWf7Wgcgf1HUpiz
	7rC95G/8vh/EEVVgEGitpaGRtQ==
X-Google-Smtp-Source: AGHT+IH4iZm8S/Q3/lVNTg9M6/32O3nNoVgDmsM5sk/1xQgXoqisut02jXqvXhdJwiN7ODhbs0v01A==
X-Received: by 2002:a05:6214:2341:b0:675:65d6:d0f3 with SMTP id hu1-20020a056214234100b0067565d6d0f3mr77672qvb.24.1700596432960;
        Tue, 21 Nov 2023 11:53:52 -0800 (PST)
Received: from denia.c.googlers.com (228.221.150.34.bc.googleusercontent.com. [34.150.221.228])
        by smtp.gmail.com with ESMTPSA id ct2-20020a056214178200b0065b0d9b4ee7sm4199409qvb.20.2023.11.21.11.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 11:53:52 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Nov 2023 19:53:49 +0000
Subject: [PATCH v3 2/3] media: uvcvideo: Do not halt the device after
 disconnect
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231121-guenter-mini-v3-2-d8a5eae2312b@chromium.org>
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
In-Reply-To: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.12.3

usb drivers should not call to any usb_() function after the
.disconnect() callback has been triggered.

If the camera is streaming, the uvc driver will call usb_set_interface or
usb_clear_halt once the device is being released. Let's fix this issue.

This is probably not the only driver affected with this kind of bug, but
until there is a better way to do it in the core this is the way to
solve this issue.

When/if a different mechanism is implemented in the core to solve the
lifetime of devices we will adopt it in uvc.

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
index 08fcd2ffa727..413c32867617 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2257,6 +2257,8 @@ static void uvc_disconnect(struct usb_interface *intf)
 		return;
 
 	uvc_unregister_video(dev);
+	/* Barrier needed to synchronize with uvc_video_stop_streaming(). */
+	smp_store_release(&dev->disconnected, true);
 	kref_put(&dev->ref, uvc_delete);
 }
 
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 28dde08ec6c5..032b44e45b22 100644
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
+	 * Barrier needed to synchronize with uvc_disconnect().
+	 * We cannot call usb_* functions on a disconnected USB device.
+	 */
+	if (!smp_load_acquire(&stream->dev->disconnected))
+		uvc_video_halt(stream);
+
 	uvc_video_clock_cleanup(stream);
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6fb0a78b1b00..4318ce8e31db 100644
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


