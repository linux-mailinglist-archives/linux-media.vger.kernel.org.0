Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9769261E21
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 21:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732446AbgIHTqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 15:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732143AbgIHTqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 15:46:07 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A01C061755;
        Tue,  8 Sep 2020 12:46:06 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id u126so17586118oif.13;
        Tue, 08 Sep 2020 12:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y37AOa3G4QMcyk1Wx1haiDnAcKZ7oI5qI1U1eVD/2Y8=;
        b=n657yzjoNd6tmxK11OuetuCi+f1J7zuGkbGspUrtUhjbVbBi7tJhGtYoa56vqCCx3X
         Ytp3O+at5CDjEq+xu0T0FtJGzodnobliMeg1M4gzmaMlfoN6M+z57YQwnoat5zFEeGAX
         cqfimUTLvEcyPJVBPN/o7gIUsfhwybTdjgRaCDSV8jlcCZpOWM5Xgm8pGKZsG85KlV2z
         AFDGMsAYRu1ToGqugfugvJ2jTBfk9P8w4Kwo+Jyp6QxE2W5mwXD0RMlnZWNoUMFDWUML
         JW6NspubSAm/Xtqiy1eEf/w4bo0oQCZUwKDrsYuOba/wzNWh74jJsxZoL6ul+1WiVg9V
         AJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Y37AOa3G4QMcyk1Wx1haiDnAcKZ7oI5qI1U1eVD/2Y8=;
        b=Tf0dKS8zIVYgxBNuCa7DTC0wCWdjaAb0lzbVx74mAEOxG8Q7s4LdDue9ga0NJiqzjq
         ls5Bu6Svm+J6QRHPOoU18+ldspRyswEWY4FVDt8gv+WUXCIDvjMI99cp1pPQbrMT4ZoE
         YLw/nS28ohvX2cPIswPxstfiHX1J8hhohQA9Xk9kciSZlWYyg9wgRSDFFYDVzBZUhAqh
         +Udj5rBMcyF8upbB5nYoV11eflLe4IvPumLVzin5dp7bKJvK7q47wUHf+RvA4AYi1ngU
         ayAcsX7Gl02qia3ptqqDzsL+yxLOXnbvFvvtYh3P0g2fC9aLS6YRLyFySPYG0LfPYJ2P
         ESeQ==
X-Gm-Message-State: AOAM531f6eHmLgA/5zhs9LjN8egPMcaclRcbFTb+M1vJm+OUtkYC9Jv0
        LKmPF1fVr/U6CpM5ezxjMdU=
X-Google-Smtp-Source: ABdhPJzcv6b2lbC07AT25hZ4YE5HQblKPRkOajG7TH6QGVXwozUfU0gMW9i0rxvla+qv0bOpvczVyw==
X-Received: by 2002:a05:6808:9a9:: with SMTP id e9mr416156oig.114.1599594366221;
        Tue, 08 Sep 2020 12:46:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t107sm33694otb.27.2020.09.08.12.46.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 12:46:05 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 2/5] media: uvcvideo: Lock video streams and queues while unregistering
Date:   Tue,  8 Sep 2020 12:45:54 -0700
Message-Id: <20200908194557.198335-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908194557.198335-1-linux@roeck-us.net>
References: <20200908194557.198335-1-linux@roeck-us.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The call to uvc_disconnect() is not protected by any mutex.
This means it can and will be called while other accesses to the video
device are in progress. This can cause all kinds of race conditions,
including crashes such as the following.

usb 1-4: USB disconnect, device number 3
BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 0 PID: 5633 Comm: V4L2CaptureThre Not tainted 4.19.113-08536-g5d29ca36db06 #1
Hardware name: GOOGLE Edgar, BIOS Google_Edgar.7287.167.156 03/25/2019
RIP: 0010:usb_ifnum_to_if+0x29/0x40
Code: <...>
RSP: 0018:ffffa46f42a47a80 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff904a396c9000
RDX: ffff904a39641320 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffa46f42a47a80 R08: 0000000000000002 R09: 0000000000000000
R10: 0000000000009975 R11: 0000000000000009 R12: 0000000000000000
R13: ffff904a396b3800 R14: ffff904a39e88000 R15: 0000000000000000
FS: 00007f396448e700(0000) GS:ffff904a3ba00000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000016cb46000 CR4: 00000000001006f0
Call Trace:
 usb_hcd_alloc_bandwidth+0x1ee/0x30f
 usb_set_interface+0x1a3/0x2b7
 uvc_video_start_transfer+0x29b/0x4b8 [uvcvideo]
 uvc_video_start_streaming+0x91/0xdd [uvcvideo]
 uvc_start_streaming+0x28/0x5d [uvcvideo]
 vb2_start_streaming+0x61/0x143 [videobuf2_common]
 vb2_core_streamon+0xf7/0x10f [videobuf2_common]
 uvc_queue_streamon+0x2e/0x41 [uvcvideo]
 uvc_ioctl_streamon+0x42/0x5c [uvcvideo]
 __video_do_ioctl+0x33d/0x42a
 video_usercopy+0x34e/0x5ff
 ? video_ioctl2+0x16/0x16
 v4l2_ioctl+0x46/0x53
 do_vfs_ioctl+0x50a/0x76f
 ksys_ioctl+0x58/0x83
 __x64_sys_ioctl+0x1a/0x1e
 do_syscall_64+0x54/0xde

usb_set_interface() should not be called after the USB device has been
unregistered. However, in the above case the disconnect happened after
v4l2_ioctl() was called, but before the call to usb_ifnum_to_if().

Acquire various mutexes in uvc_unregister_video() to fix the majority
(maybe all) of the observed race conditions.

The uvc_device lock prevents races against suspend and resume calls
and the poll function.

The uvc_streaming lock prevents races against stream related functions;
for the most part, those are ioctls. This lock also requires other
functions using this lock to check if a video device is still registered
after acquiring it. For example, it was observed that the video device
was already unregistered by the time the stream lock was acquired in
uvc_ioctl_streamon().

The uvc_queue lock prevents races against queue functions, Most of
those are already protected by the uvc_streaming lock, but some
are called directly. This is done as added protection; an actual race
was not (yet) observed.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 drivers/media/usb/uvc/uvc_driver.c |  9 +++++++
 drivers/media/usb/uvc/uvc_v4l2.c   | 39 +++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index bfba67a69185..a5808305f1e3 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1941,14 +1941,22 @@ static void uvc_unregister_video(struct uvc_device *dev)
 {
 	struct uvc_streaming *stream;
 
+	mutex_lock(&dev->lock);
+
 	list_for_each_entry(stream, &dev->streams, list) {
 		if (!video_is_registered(&stream->vdev))
 			continue;
 
+		mutex_lock(&stream->mutex);
+		mutex_lock(&stream->queue.mutex);
+
 		video_unregister_device(&stream->vdev);
 		video_unregister_device(&stream->meta.vdev);
 
 		uvc_debugfs_cleanup_stream(stream);
+
+		mutex_unlock(&stream->queue.mutex);
+		mutex_unlock(&stream->mutex);
 	}
 
 	uvc_status_unregister(dev);
@@ -1960,6 +1968,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
 	if (media_devnode_is_registered(dev->mdev.devnode))
 		media_device_unregister(&dev->mdev);
 #endif
+	mutex_unlock(&dev->lock);
 }
 
 int uvc_register_video_device(struct uvc_device *dev,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 0335e69b70ab..7e5e583dae5e 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -237,6 +237,12 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	 * the Windows driver).
 	 */
 	mutex_lock(&stream->mutex);
+	if (!video_is_registered(&stream->vdev)) {
+		mutex_unlock(&stream->mutex);
+		ret = -ENODEV;
+		goto done;
+	}
+
 	if (stream->dev->quirks & UVC_QUIRK_PROBE_EXTRAFIELDS)
 		probe->dwMaxVideoFrameSize =
 			stream->ctrl.dwMaxVideoFrameSize;
@@ -274,6 +280,12 @@ static int uvc_v4l2_get_format(struct uvc_streaming *stream,
 		return -EINVAL;
 
 	mutex_lock(&stream->mutex);
+
+	if (!video_is_registered(&stream->vdev)) {
+		ret = -ENODEV;
+		goto done;
+	}
+
 	format = stream->cur_format;
 	frame = stream->cur_frame;
 
@@ -312,6 +324,11 @@ static int uvc_v4l2_set_format(struct uvc_streaming *stream,
 
 	mutex_lock(&stream->mutex);
 
+	if (!video_is_registered(&stream->vdev)) {
+		ret = -ENODEV;
+		goto done;
+	}
+
 	if (uvc_queue_allocated(&stream->queue)) {
 		ret = -EBUSY;
 		goto done;
@@ -387,6 +404,11 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
 
 	mutex_lock(&stream->mutex);
 
+	if (!video_is_registered(&stream->vdev)) {
+		mutex_unlock(&stream->mutex);
+		return -ENODEV;
+	}
+
 	if (uvc_queue_streaming(&stream->queue)) {
 		mutex_unlock(&stream->mutex);
 		return -EBUSY;
@@ -713,6 +735,10 @@ static int uvc_ioctl_reqbufs(struct file *file, void *fh,
 		return ret;
 
 	mutex_lock(&stream->mutex);
+	if (!video_is_registered(&stream->vdev)) {
+		mutex_unlock(&stream->mutex);
+		return -ENODEV;
+	}
 	ret = uvc_request_buffers(&stream->queue, rb);
 	mutex_unlock(&stream->mutex);
 	if (ret < 0)
@@ -797,7 +823,12 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 		return -EBUSY;
 
 	mutex_lock(&stream->mutex);
+	if (!video_is_registered(&stream->vdev)) {
+		ret = -ENODEV;
+		goto unlock;
+	}
 	ret = uvc_queue_streamon(&stream->queue, type);
+unlock:
 	mutex_unlock(&stream->mutex);
 
 	return ret;
@@ -808,15 +839,21 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 {
 	struct uvc_fh *handle = fh;
 	struct uvc_streaming *stream = handle->stream;
+	int ret = 0;
 
 	if (!uvc_has_privileges(handle))
 		return -EBUSY;
 
 	mutex_lock(&stream->mutex);
+	if (!video_is_registered(&stream->vdev)) {
+		ret = -ENODEV;
+		goto unlock;
+	}
 	uvc_queue_streamoff(&stream->queue, type);
+unlock:
 	mutex_unlock(&stream->mutex);
 
-	return 0;
+	return ret;
 }
 
 static int uvc_ioctl_enum_input(struct file *file, void *fh,
-- 
2.17.1

