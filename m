Return-Path: <linux-media+bounces-25584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9145CA2596D
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B19A162360
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3702054E0;
	Mon,  3 Feb 2025 12:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GyUiovyT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F72204C29
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585654; cv=none; b=T71h7vQau1kr8rWf66WLXpXj6gLRyBWAhezsfNWRNzoTV7k5P5Mye0ODsubMHty6qEzdiVEwnXRQ4rYai/5RwnJBS7jPEwQNGVy+hAX2XXbCNVZuOZwPgH9nXZL2fc3RtzHmaG8rCnr8ZDn70IEUf7VxbJbhZlp72VqWn4smUrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585654; c=relaxed/simple;
	bh=Dkb3vRn/aSnNXXamQQ3bU2b0mGpMI3r96lRrP4TLfrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SkXFb0ZGUScHOjB8ZB8NOC3+xT4fz6CJgwuNRfpHhd9XvvhzZ6OdWD294ySBRUsX3h6MdqJovR0mgY5kB16MzIAH40GrLwZNDRVBPAEWa+kWSdfa+/aGQgLEYtBZ5zn1ImZ+xQo+scQ1ZpW+4WmDfahzYkbjqZEcHdqvjc0VEGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GyUiovyT; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-467a17055e6so52257811cf.3
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 04:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585652; x=1739190452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUu3vo9b65Sf181M7tDHFuWOo/PqnpmKoQ95ebWAmW8=;
        b=GyUiovyTM86Ka0VhfDBEP0JxZ2KQ3/KEY5KiQZRCucB8t7Ih15Iosl62uAUxLyvmhC
         jO8JWfeTXjESSz26gcuZJyIcqCwibpiC6IUdbBbEmisvL0WGIKuQAYnBCClwWoU6wuly
         3TGlI4UrS6phxngYQWKUjeISwzUFW81SPgb0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585652; x=1739190452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUu3vo9b65Sf181M7tDHFuWOo/PqnpmKoQ95ebWAmW8=;
        b=VYNzB5oS1au8Opb+BR6vVWH3GCqtDMO5dA5AnJEt8Y+aPz7jx8IVJ5Cz4+KWUFU8vC
         fqLt4CiqCX8zBVwqTHgtKKjzMl1Xdglvj0sEIm+8+RNPFXZ33VKzhJj/9ek2VUl4tEmI
         qpmJuxn8Q9xGndSNADWEg/JnDllukhlGWmUN43uOKV30fQnfG2RY5Zje15Rx5JCu/TdI
         +5yiDTX9PGguza3j5lFN4sFFgd8V7hdOwT6Ph7+BqAHiLKJx5KMWZp4Y6jGP+JsaWR7H
         1kTpJ8xWnKRMKUR5ANRonAnuq+dNOMUQ0fM0NCF5uRhzkaCjcbKuIiIAFWA1XJWYNiRG
         xYwQ==
X-Gm-Message-State: AOJu0YxXw5okxnYn/tAy/sHypWm9bb5smkg3TEjXmc6KCs2LY5spd4VD
	l3cVFa9qDUdX94WmvpKE/4m56/CREgWnEcR2xi9biBQLK1WhxL+nCofmbvj3oA==
X-Gm-Gg: ASbGncvLWowNGglD63B6ocfYO9ceJlTz0KaB+RvkECvepAg2qaVTeuSbg1x1mKsyzDh
	VFTYkkLeqvFtKwh95KADqvw+l9CaxG1qZS7KjhtWejeR6jzFIhNs2EiOdeG2VzyLAVGYLSEw6+z
	lJGZFZ5Pc9yNb5vuL2sEpoGC6kBRLue+hpP7zP8XWmojmQtYSfRs0tZc79dGOEy/Ksep/zBwWJM
	EWAkbQ2BrHBqsNP+8A8/N03YBcDJLoKGjiWVIDAaGEy6d01XTp30W8Wf3Urhn+MwotEr9YMzM8g
	pUdmwRWDhRgNTQ+5ZT6rOmKOQx+/qWxfQUuhS73UAoUiYAsU7zvKycSF5aUuN8DfHw==
X-Google-Smtp-Source: AGHT+IHNc1v8i7U+bC9jsIDo/vsrugAngiPdsvamvE9+h5FZ2Afv8RFdQv4Kws+yotU6HXV+UgzlAg==
X-Received: by 2002:a05:622a:1993:b0:45d:82a0:5028 with SMTP id d75a77b69052e-46fd0a7fda9mr347778861cf.1.1738585651956;
        Mon, 03 Feb 2025 04:27:31 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 12:26:23 +0000
Subject: [PATCH v2 4/6] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-granpower-ng-v2-4-bef4b55e7b67@chromium.org>
References: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
In-Reply-To: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Now we call uvc_status_get/put from the device open/close. This low
level of granularity might leave the camera powered on in situations
where it is not needed.

Increase the granularity by increasing and decreasing the Power
Management counter per ioctl. There are two special cases where the
power management outlives the ioctl: async controls and streamon. Handle
those cases as well.

In a future patch, we will remove the uvc_status_get/put from open/close.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c | 26 +++++++++++++++++++++++---
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4e58476d305e..97c1141a45b3 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1594,12 +1594,15 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
 
 		if (ctrl->handle) {
 			WARN_ON(!ctrl->handle->pending_async_ctrls);
-			if (ctrl->handle->pending_async_ctrls)
+			if (ctrl->handle->pending_async_ctrls) {
 				ctrl->handle->pending_async_ctrls--;
+				uvc_status_put(handle->chain->dev);
+			}
 		}
 
 		ctrl->handle = new_handle;
 		handle->pending_async_ctrls++;
+		uvc_status_get(handle->chain->dev);
 		return;
 	}
 
@@ -1611,6 +1614,7 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
 	if (WARN_ON(!handle->pending_async_ctrls))
 		return;
 	handle->pending_async_ctrls--;
+	uvc_status_put(handle->chain->dev);
 }
 
 void uvc_ctrl_status_event(struct uvc_video_chain *chain,
@@ -2815,6 +2819,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 {
 	struct uvc_entity *entity;
+	int i;
 
 	guard(mutex)(&handle->chain->ctrl_mutex);
 
@@ -2829,7 +2834,11 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 		}
 	}
 
-	WARN_ON(handle->pending_async_ctrls);
+	if (!WARN_ON(handle->pending_async_ctrls))
+		return;
+
+	for (i = 0; i < handle->pending_async_ctrls; i++)
+		uvc_status_put(handle->stream->dev);
 }
 
 /*
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 5d4e967938af..5d6935539e0a 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -670,6 +670,9 @@ static int uvc_v4l2_release(struct file *file)
 	if (uvc_has_privileges(handle))
 		uvc_queue_release(&stream->queue);
 
+	if (handle->is_streaming)
+		uvc_status_put(stream->dev);
+
 	/* Release the file handle. */
 	uvc_dismiss_privileges(handle);
 	v4l2_fh_del(&handle->vfh);
@@ -832,8 +835,10 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 		return 0;
 
 	ret = uvc_queue_streamon(&stream->queue, type);
-	if (!ret)
+	if (!ret) {
 		handle->is_streaming = true;
+		uvc_status_get(stream->dev);
+	}
 
 	return ret;
 
@@ -851,7 +856,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 	guard(mutex)(&stream->mutex);
 
 	uvc_queue_streamoff(&stream->queue, type);
-	handle->is_streaming = false;
+	if (handle->is_streaming) {
+		handle->is_streaming = false;
+		uvc_status_put(stream->dev);
+	}
 
 	return 0;
 }
@@ -1374,6 +1382,16 @@ static int uvc_v4l2_put_xu_query(const struct uvc_xu_control_query *kp,
 	return 0;
 }
 
+static long uvc_v4l2_video_ioctl2(struct file *file,
+				  unsigned int cmd, unsigned long arg)
+{
+	struct uvc_fh *handle = file->private_data;
+
+	guard(uvc_status)(handle->stream->dev);
+
+	return video_ioctl2(file, cmd, arg);
+}
+
 #define UVCIOC_CTRL_MAP32	_IOWR('u', 0x20, struct uvc_xu_control_mapping32)
 #define UVCIOC_CTRL_QUERY32	_IOWR('u', 0x21, struct uvc_xu_control_query32)
 
@@ -1388,6 +1406,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 	void __user *up = compat_ptr(arg);
 	long ret;
 
+	guard(uvc_status)(handle->stream->dev);
+
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
@@ -1507,7 +1527,7 @@ const struct v4l2_file_operations uvc_fops = {
 	.owner		= THIS_MODULE,
 	.open		= uvc_v4l2_open,
 	.release	= uvc_v4l2_release,
-	.unlocked_ioctl	= video_ioctl2,
+	.unlocked_ioctl	= uvc_v4l2_video_ioctl2,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl32	= uvc_v4l2_compat_ioctl32,
 #endif

-- 
2.48.1.362.g079036d154-goog


