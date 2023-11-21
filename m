Return-Path: <linux-media+bounces-679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 811B77F36F8
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 20:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1BA01C20C29
	for <lists+linux-media@lfdr.de>; Tue, 21 Nov 2023 19:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6BB4207D;
	Tue, 21 Nov 2023 19:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mVJnvzEg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A44191
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 11:53:54 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6d7e56f6845so447022a34.0
        for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 11:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700596434; x=1701201234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBBR3Lb8+qLiLMbc/jEnU4Lx/0wS0LihO+fwyf1YUqQ=;
        b=mVJnvzEgvHgTXvGHTkIA53uO+Ifdo3TgXxNPsUo7sb4BRl2+BghrRSdPx5Itbp8EVF
         7FdkBg+7JcCw+Y8PTu4vxCcF5ADjPPRslOEWwgdAcjDBEJBlzSse6WWJPzoIzemABcgC
         HRuV09zfPV86dCbLDhPqVwHSd5tzUb70pWu4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700596434; x=1701201234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBBR3Lb8+qLiLMbc/jEnU4Lx/0wS0LihO+fwyf1YUqQ=;
        b=U0VMd0D9Fzp/iXrMLtY+hoMigKnkDY2bMP3oUDVOvy84yZXF2E0UyLyjwk4tNk7/Zg
         Xa8hichHGy5S2lMVcub8G6kaDhPXFspaqdEByPlJMaloT0a0nNYdGqanUfwdhmk+J7t8
         hZ14FyAPx2GbEXdLaOPFYxuWxJM2j+KCWgu2QOPz4s1RbIPSh5gUkX5txIZOLLaEKHd/
         kAghVrzOERoQQ2tKBlvon62LT1v85uIUMrxGKbdJi8EO1IbVpiPyP11KnHSkBTy2PsSz
         38oftCJO3ivywqw40eOH0ZPAlwB3WlwZkZfCCV76e/DaV4QPPGABvSrRhf8aQqlQfi9S
         JpkQ==
X-Gm-Message-State: AOJu0YxeKa6/UjgBjMuCZ+4OccujXFs4PHM/uSbB3GtTRONkuPdzCFNM
	mGTGAv0rKux99AH6QXR7J2xxKw==
X-Google-Smtp-Source: AGHT+IHB81wHsX96Couk1aRPcExkFua5WXgh+OpUbktLI410dXLaqQdYl/czRy+2ofoE2m4aEMetUw==
X-Received: by 2002:a05:6830:39cc:b0:6d6:4c25:5a56 with SMTP id bt12-20020a05683039cc00b006d64c255a56mr325498otb.12.1700596433867;
        Tue, 21 Nov 2023 11:53:53 -0800 (PST)
Received: from denia.c.googlers.com (228.221.150.34.bc.googleusercontent.com. [34.150.221.228])
        by smtp.gmail.com with ESMTPSA id ct2-20020a056214178200b0065b0d9b4ee7sm4199409qvb.20.2023.11.21.11.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 11:53:53 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Nov 2023 19:53:50 +0000
Subject: [PATCH v3 3/3] media: uvcvideo: Lock video streams and queues
 while unregistering
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231121-guenter-mini-v3-3-d8a5eae2312b@chromium.org>
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

From: Guenter Roeck <linux@roeck-us.net>

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
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 413c32867617..3408b865d346 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1907,14 +1907,22 @@ static void uvc_unregister_video(struct uvc_device *dev)
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
@@ -1925,6 +1933,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
 	if (media_devnode_is_registered(dev->mdev.devnode))
 		media_device_unregister(&dev->mdev);
 #endif
+	mutex_unlock(&dev->lock);
 }
 
 int uvc_register_video_device(struct uvc_device *dev,

-- 
2.43.0.rc1.413.gea7ed67945-goog


