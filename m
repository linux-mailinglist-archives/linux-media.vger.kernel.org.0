Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F51256EE1
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 17:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgH3PFN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 11:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgH3PEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 11:04:52 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE371C061575;
        Sun, 30 Aug 2020 08:04:51 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id y6so1783000oie.5;
        Sun, 30 Aug 2020 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EA6cVmvUSvTNBygQ//XKPSrIb6L3Na4NjlVN7lTwXxg=;
        b=XnhYXd4owlC48q5pHppL8pWHP5eIa4NA+vZjkreSJx5XrzXu/D+uOyVtG13Qg+/8vo
         ZeWGKOAIgfGhJGp/4tsfzfAfcbtgW5sieQwRuJQG4j51GclVbX+YE8l3Q3fz7nwyKh0b
         pgIXArNjOQ9C5e9Aw1Au7TfRq5DCkoH6Ifd50pTXNQIl85QoCf2Kcut2tmm6Zfhfskj7
         kekMi01qR5+iZMRFg2fEz0dJSMoqN+FRc6fis4bXxizOcEpRjpIyBvDDSULKVV0SJ6jI
         5QpfG3lsvNgvunJYAU/NbPJfzG2S46wmMYU+h4P+UEANhJZAXEJh8oO1vMrNlNkDDMW0
         ROAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=EA6cVmvUSvTNBygQ//XKPSrIb6L3Na4NjlVN7lTwXxg=;
        b=PnKFkvWd489b9UlKj1PQo+9r9tkqd4Vhb+hh48JBmTgByZJ+faJsBNc+qF8hNqfdTx
         Rt/I5UqSQmeuGMnn+21TMiusRPq4ijbInJvRjCiXtly+UZ0Rl86z9JPmLl/c2D+SPXFa
         AaTt3dQ7vlgNUyJSvQSHDBdTqdxxvib3KT6xeb4WeG+YrgvOK+ypiTQN7PuSHR14Fghi
         NUFy3VlN8GS2kxPdt3/xh88OeHx8GOdVU1XuJajOg6JLeFlO1Eu+E2q+TP/PXEGyfnqp
         MDeOHZHKf6kSxv8qF6j4pboa5b7uDCNj8vdMr4b6iP7kymWQBM6udR60VHPinSs9KNsN
         m++Q==
X-Gm-Message-State: AOAM531AvwDIgLiQFvrB2BB+4ruR+9PAq3kuOhrF2DuqAtOH5SMFa00d
        d/yiBTObpOpFTCTgtLgFCdk=
X-Google-Smtp-Source: ABdhPJyjiyp/u2wu+8G/I/KCDNXt4GO4vFz3W1cns6AhTEUFrg+p04IunHBMIk5k5HWKPfLJeujM+A==
X-Received: by 2002:a05:6808:7dc:: with SMTP id f28mr1364574oij.26.1598799891024;
        Sun, 30 Aug 2020 08:04:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z10sm1198394otk.6.2020.08.30.08.04.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Aug 2020 08:04:50 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/5] media: uvcvideo: Lock video streams and queues while unregistering
Date:   Sun, 30 Aug 2020 08:04:40 -0700
Message-Id: <20200830150443.167286-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200830150443.167286-1-linux@roeck-us.net>
References: <20200830150443.167286-1-linux@roeck-us.net>
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

