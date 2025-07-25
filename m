Return-Path: <linux-media+bounces-38475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7F3B11F35
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 15:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 570C516F268
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9AB2EE265;
	Fri, 25 Jul 2025 13:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QEJltUpO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F4C2ED170
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 13:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753449175; cv=none; b=V1tnX2eXW6cxKsQY1VOncA0kIROm93+yl2DO2V11mlnrpQFOdiCw3ENGHD5J21oBlnOrD2xT0ThY2Fw/7PZWPrwtLxPKE7KViDqXi2OxTzWSOWV8OLf2gXs7ilqMk4lrx9pHmZ1IIaIBe3mKhO9AWgoyfHJ2r2MJNlCfPyG4W38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753449175; c=relaxed/simple;
	bh=qJ7bTd4Sn1KKVCh65oLiiB9cj7egg8oR8PkjOwHMbZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s2RYM9PKd9RsOLAUY9UyVBmb7pw+A54lKlch6sL/gviPM0yg3BwIiBG61pcKz8qmAi53a1CeyM0xgcQo5+1Oq9MVeU5Qrq2Xwdg3ZuifuHm8MoSc2Ems2RfUAATqIJSSKNaj5GzOY122zFgrFvEmmEQQIfB4s3X8P5n6m/9sgs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QEJltUpO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-558f7fda97eso1756898e87.2
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 06:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753449171; x=1754053971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFK1sBIyvrwVP0jUx5SHcUQRAyLYbMkJjN/1zNnddx8=;
        b=QEJltUpO3iH+uNkPuzwRoQB8OIZF6+vX1ULlfNLGaylWe6lriki/lQfYAY93FFxFiM
         2jiNHI8/DZmpEgK4rwhB7vvbOf9hGbb7fkVDjY+/UynNjeczeFa/fbN/3+UFKBpRXVbp
         HmybNAXzhsvhp3wbUl1D7UL0i/rcS1u8/kkmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753449171; x=1754053971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFK1sBIyvrwVP0jUx5SHcUQRAyLYbMkJjN/1zNnddx8=;
        b=ewWXw9mCQtNc+0Gf3useDy3LuWHjWnDeTconPYnAOFjFJPB3bVTDUabQAvQjsyP2mx
         sc3NyFItqaBTajTZbL1FWXy8MjV/GTErZbBocQ8mnW50W5kreXm90pakMNTTQQLA6Two
         xvlaFFIZBT77DPOo7QsQpRPHKYSF19W8WeAtHMmavdlIf+wntFiSQaukvlUoCodCUOwI
         +NMrtbpggy9RyVeaDiyg8D/J8MmzcnlwVKOVQ2a4m6InDDHNgMYaXj/7lUmzy+zNihBk
         kG/paaIRu4Ymm2Pn6YQnZ9FTkgU3pxFtNK8YzcFD50oOC84DZHDXtmOFIEwaLsTtiQOM
         rWiw==
X-Gm-Message-State: AOJu0YzOpcLCCmbqexaS/3H1f073cBPWy04DyDmos2EYUUgEb7/3OYL0
	A2RTI72NHWnZFI4fKQORblYPOfR1chp1AylEjXwZPc8ZjRLGjVR2gwwbwTJ/DuYdKNSugnzCLOB
	lUeU=
X-Gm-Gg: ASbGncsrf9y0R1FC+TFIJYadSfYO1/JS0DclRSl7BssBUJxR31yJXB1oHpTVoTegU6X
	qzuwgsGSUQpKE8Bj3+no0T/cMLOEzcrrDsnEEkanraP1drKCjtyfTQq786yuqnPLOUyoFtXhCbR
	a+6s4fZsvo6TS5B5LAf7aAzOjz9FQHJGaWfxBtpE0PUiIP2YmZuwDRLRHUOrXyatgOCTy7Jnjxa
	9EHT2aS33BG/URVj123bKd+xu3pT52SugFmO/dcmU4oPpKShq5oyC+2nQejWHSB5Nwru8t6INvR
	yIsLwQ7ik+EIkHga1EZbbpViqhf5xYVL9bQKLK58z7KwwDVaSegMPw9e4mPyHZ6chxBrW7kKmaP
	QijV/LUuxfEPInQikISQrUAMUZgA13FSXwrTEXvG6Pc5jv3F601sN4TXt3mX8bXJJ4TkakjvQQq
	cSHw==
X-Google-Smtp-Source: AGHT+IGuPgZqwk5F4hIkGfnvSbeismezpiFGW9+SDTWkYGxgugFIBA+kmGWaNfQEX9F1MNWxbkbiGg==
X-Received: by 2002:a05:6512:234c:b0:558:f96d:f74b with SMTP id 2adb3069b0e04-55b5f48979bmr576795e87.38.1753449171235;
        Fri, 25 Jul 2025 06:12:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53c712d3sm934605e87.118.2025.07.25.06.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 06:12:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 25 Jul 2025 13:12:49 +0000
Subject: [PATCH v2 2/2] media: uvcvideo: Move video_device under
 video_queue
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-uvc-onelocksless-v2-2-953477834929@chromium.org>
References: <20250725-uvc-onelocksless-v2-0-953477834929@chromium.org>
In-Reply-To: <20250725-uvc-onelocksless-v2-0-953477834929@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

It is more natural that the "struct video_device" belongs to
uvc_video_queue instead of uvc_streaming.

This is an aesthetic change. No functional change expected.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c   | 16 ++++++++--------
 drivers/media/usb/uvc/uvc_metadata.c |  3 +--
 drivers/media/usb/uvc/uvc_v4l2.c     |  2 +-
 drivers/media/usb/uvc/uvc_video.c    |  2 +-
 drivers/media/usb/uvc/uvcvideo.h     |  4 +---
 5 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 3039e6a533b82dd917050d416c9ced8756d69170..505e85a6b4d99666f3a4a9441dd1ca72e13228e0 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1954,11 +1954,11 @@ static void uvc_unregister_video(struct uvc_device *dev)
 
 	list_for_each_entry(stream, &dev->streams, list) {
 		/* Nothing to do here, continue. */
-		if (!video_is_registered(&stream->vdev))
+		if (!video_is_registered(&stream->queue.vdev))
 			continue;
 
-		vb2_video_unregister_device(&stream->vdev);
-		vb2_video_unregister_device(&stream->meta.vdev);
+		vb2_video_unregister_device(&stream->queue.vdev);
+		vb2_video_unregister_device(&stream->meta.queue.vdev);
 
 		/*
 		 * Now both vdevs are not streaming and all the ioctls will
@@ -1980,12 +1980,12 @@ static void uvc_unregister_video(struct uvc_device *dev)
 
 int uvc_register_video_device(struct uvc_device *dev,
 			      struct uvc_streaming *stream,
-			      struct video_device *vdev,
 			      struct uvc_video_queue *queue,
 			      enum v4l2_buf_type type,
 			      const struct v4l2_file_operations *fops,
 			      const struct v4l2_ioctl_ops *ioctl_ops)
 {
+	struct video_device *vdev = &queue->vdev;
 	int ret;
 
 	/* Initialize the video buffers queue. */
@@ -2067,9 +2067,9 @@ static int uvc_register_video(struct uvc_device *dev,
 	uvc_debugfs_init_stream(stream);
 
 	/* Register the device with V4L. */
-	return uvc_register_video_device(dev, stream, &stream->vdev,
-					 &stream->queue, stream->type,
-					 &uvc_fops, &uvc_ioctl_ops);
+	return uvc_register_video_device(dev, stream, &stream->queue,
+					 stream->type, &uvc_fops,
+					 &uvc_ioctl_ops);
 }
 
 /*
@@ -2105,7 +2105,7 @@ static int uvc_register_terms(struct uvc_device *dev,
 		 */
 		uvc_meta_register(stream);
 
-		term->vdev = &stream->vdev;
+		term->vdev = &stream->queue.vdev;
 	}
 
 	return 0;
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 649844e2ad60ed9e9951daec871f2000f48702a6..9ed50c3249cbd222be71ffdba18c41ff972158af 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -228,12 +228,11 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 int uvc_meta_register(struct uvc_streaming *stream)
 {
 	struct uvc_device *dev = stream->dev;
-	struct video_device *vdev = &stream->meta.vdev;
 	struct uvc_video_queue *queue = &stream->meta.queue;
 
 	stream->meta.format = V4L2_META_FMT_UVC;
 
-	return uvc_register_video_device(dev, stream, vdev, queue,
+	return uvc_register_video_device(dev, stream, queue,
 					 V4L2_BUF_TYPE_META_CAPTURE,
 					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
 }
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index fdc4520a7bb42af7cd5cb9c1fa49957c31e0041c..5b0a7edc9966e7c66438af6daa1f98fa87a6d0d3 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -576,7 +576,7 @@ static int uvc_v4l2_open(struct file *file)
 	if (!handle)
 		return -ENOMEM;
 
-	v4l2_fh_init(&handle->vfh, &stream->vdev);
+	v4l2_fh_init(&handle->vfh, &stream->queue.vdev);
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
 	handle->stream = stream;
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2e377e7b9e81599aca19b800a171cc16a09c1e8a..ef12a935829277d7f1c1ebffcd901742513fbe7e 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1705,7 +1705,7 @@ static void uvc_video_complete(struct urb *urb)
 	struct uvc_streaming *stream = uvc_urb->stream;
 	struct uvc_video_queue *queue = &stream->queue;
 	struct uvc_video_queue *qmeta = &stream->meta.queue;
-	struct vb2_queue *vb2_qmeta = stream->meta.vdev.queue;
+	struct vb2_queue *vb2_qmeta = stream->meta.queue.vdev.queue;
 	struct uvc_buffer *buf = NULL;
 	struct uvc_buffer *buf_meta = NULL;
 	unsigned long flags;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 86765b9d7935f0888476249c3fb826cd7f36b35c..d4947878fd0126d788d16977a553fa0f45645dcd 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -328,6 +328,7 @@ struct uvc_buffer {
 #define UVC_QUEUE_DISCONNECTED		(1 << 0)
 
 struct uvc_video_queue {
+	struct video_device vdev;
 	struct vb2_queue queue;
 	struct mutex mutex;			/*
 						 * Serializes vb2_queue and
@@ -450,7 +451,6 @@ struct uvc_urb {
 struct uvc_streaming {
 	struct list_head list;
 	struct uvc_device *dev;
-	struct video_device vdev;
 	struct uvc_video_chain *chain;
 	atomic_t active;
 
@@ -477,7 +477,6 @@ struct uvc_streaming {
 		       struct uvc_buffer *meta_buf);
 
 	struct {
-		struct video_device vdev;
 		struct uvc_video_queue queue;
 		u32 format;
 	} meta;
@@ -727,7 +726,6 @@ int uvc_meta_register(struct uvc_streaming *stream);
 
 int uvc_register_video_device(struct uvc_device *dev,
 			      struct uvc_streaming *stream,
-			      struct video_device *vdev,
 			      struct uvc_video_queue *queue,
 			      enum v4l2_buf_type type,
 			      const struct v4l2_file_operations *fops,

-- 
2.50.1.470.g6ba607880d-goog


