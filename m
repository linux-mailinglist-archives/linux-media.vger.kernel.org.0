Return-Path: <linux-media+bounces-27420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ADFA4CBD5
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 20:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 992F7169329
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 19:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DFE23FC4B;
	Mon,  3 Mar 2025 19:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="blSqxnsD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A8235345
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 19:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741029228; cv=none; b=VTAwTyVqG3m7vQTS1BdIU5Dq+oGpyZkcn2qF5PnsJJhKnvjX4kHguV4KnZn5wfUAXmWcXefPLpQHwovX7nQcQ6u2AlhwMFxqq2KKVhfsVMuiRUuwJvp2DbkHefQyyaapKDHvsKcE1vxbHaTn7miOSBME8QGhDCTJGznal8NWP7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741029228; c=relaxed/simple;
	bh=PPWla/2kebrucLkJRseQ3ggOogZO4AGyTq5pphOr1VE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjR8owa9+mhoZKqFaFz3vZ4uGApKhrPIju7dvPGH2d9tnCMvfnRfO0Uw3d4na3Esr4oIr1eCVDQjUbWUW2sSBUWcPyO3vxpvBwdlpgrKjYj54XDHwY9eftJMWpXPUmqOaKndnVVKAIKKh9keGwXFZ1mv7hFkc0BdfnQu13O4aYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=blSqxnsD; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-474f15a2087so5024361cf.1
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 11:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741029226; x=1741634026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7P1QXq27JNB3kApamJPl6/Zqox7TOiVvRdkffBjGTI=;
        b=blSqxnsDTBPoxPm+EF3xgFH/IMedaruRmlbUbKgvDT3VejAnIWA/FZ3cU0RQWBT7jf
         xHlQSvJGyOd1Os20s8/tnvSTidTConl0tqUGmtkXD8Fba/kU8Cp7pCxZGpxZ6KuGiD4F
         tuAjAo/c4AmDkCqMk3txQuDAWd9D+tPjboirA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741029226; x=1741634026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7P1QXq27JNB3kApamJPl6/Zqox7TOiVvRdkffBjGTI=;
        b=eTYS3PcNzCYNZNOXU+w2UkYsEJYHJDeCv8KTScD2u5krkWPSoSO8YVhVEGcPabc6k8
         LDx0/c/4Bqz5DUfVGQ77VvDfPXL6zV+Xb40b1owppAYS2k3C4kh3dRFVrSgHQczxrfYc
         wPllxcBKA5tw7jPgNZ3hj4Rx6HPPnMsbee9PMzTv0Uon8sc8V6TX5+hVn6Rdk6uueyMa
         S7lsnmJnDIM9IPj4Qm1Asjie+73d0k9aJR+4h37k0HQ3F6JtAqez30Zh8tKUens6mnQu
         b3rEJM+/qcxBaslx/oeYjzM7XXGmPrzBQEwgN4yRBNjRCz4zn7KWHpc18atMhAspB7JK
         DBIw==
X-Gm-Message-State: AOJu0YzAsoCpB3g3Rv/jFEPdJkkGKUGvl9V9IzzE5B1EHAkC+MjZsnUC
	lUxax7SnytNkw7T+n8oJ4MR7D0NgxX5Oy/ygUpOL+L074MoHqby5sct8veXxyg==
X-Gm-Gg: ASbGncu+MdMtJgdP1Uz6JeQcEOM+pzBVqG4ElQR6syy4ZUYkWidely7VakyC2K4C/HB
	jnFQNWXDLRqA96OuZtMOek7OLGfZmShycIw0ZoaVxmERJRMPYRhNGZt1kVYwrkEH+5n3z56DPGP
	dad4HF2LZf6TQ7WA14JH8861gXd3FDREIr8BziZ6z+cCwPsMQG0mHx3vz2uY24hyXDZrgE21ehB
	lOzsa0ZcVYiBIM4QOOmx/OtTHt9QNYefMlfl7cKG0HloE2pYoOJssAcVS9Eu5JZzSwx8PVn9ezj
	xpEInel7fjxLU641ZczzLZvkoTpbA13WhUpNZMOMJi/ckQnQbpYJvbPhfxjWdDINDCzYzQkcFjR
	YSGUa4bP2dmjRUV5HJajX0w==
X-Google-Smtp-Source: AGHT+IEpNw4RsO+LZoW3IoxCforKe9aJtgSY48ThTpTugK/BWGpZU9TY/rkkvX28MUKTMjrfrVMrTw==
X-Received: by 2002:ac8:5852:0:b0:471:fee7:9610 with SMTP id d75a77b69052e-474bc080335mr164587941cf.12.1741029225763;
        Mon, 03 Mar 2025 11:13:45 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474e0f1e0c1sm19745661cf.47.2025.03.03.11.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:13:45 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Mar 2025 19:13:40 +0000
Subject: [PATCH v5 3/5] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-uvc-granpower-ng-v5-3-a3dfbe29fe91@chromium.org>
References: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
In-Reply-To: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.1

Now we call uvc_pm_get/put from the device open/close. This low
level of granularity might leave the camera powered on in situations
where it is not needed.

Increase the granularity by increasing and decreasing the Power
Management counter per ioctl. There are two special cases where the
power management outlives the ioctl: async controls and streamon. Handle
those cases as well.

In a future patch, we will remove the uvc_pm_get/put from open/close.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c | 23 +++++++++++++++++++++--
 drivers/media/usb/uvc/uvcvideo.h |  1 +
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4e58476d305e..47188c7f96c7 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1594,12 +1594,15 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
 
 		if (ctrl->handle) {
 			WARN_ON(!ctrl->handle->pending_async_ctrls);
-			if (ctrl->handle->pending_async_ctrls)
+			if (ctrl->handle->pending_async_ctrls) {
 				ctrl->handle->pending_async_ctrls--;
+				uvc_pm_put(handle->chain->dev);
+			}
 		}
 
 		ctrl->handle = new_handle;
 		handle->pending_async_ctrls++;
+		uvc_pm_get(handle->chain->dev);
 		return;
 	}
 
@@ -1611,6 +1614,7 @@ static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
 	if (WARN_ON(!handle->pending_async_ctrls))
 		return;
 	handle->pending_async_ctrls--;
+	uvc_pm_put(handle->chain->dev);
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
+		uvc_pm_put(handle->stream->dev);
 }
 
 /*
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index de1e105f7263..1c9ac72be58a 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -691,6 +691,9 @@ static int uvc_v4l2_release(struct file *file)
 	if (uvc_has_privileges(handle))
 		uvc_queue_release(&stream->queue);
 
+	if (handle->is_streaming)
+		uvc_pm_put(stream->dev);
+
 	/* Release the file handle. */
 	uvc_dismiss_privileges(handle);
 	v4l2_fh_del(&handle->vfh);
@@ -857,6 +860,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 		return ret;
 
 	handle->is_streaming = true;
+	uvc_pm_get(stream->dev);
 
 	return 0;
 }
@@ -873,7 +877,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 	guard(mutex)(&stream->mutex);
 
 	uvc_queue_streamoff(&stream->queue, type);
-	handle->is_streaming = false;
+	if (handle->is_streaming) {
+		handle->is_streaming = false;
+		uvc_pm_put(stream->dev);
+	}
 
 	return 0;
 }
@@ -1410,6 +1417,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 	void __user *up = compat_ptr(arg);
 	long ret;
 
+	guard(uvc_pm)(handle->stream->dev);
+
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
@@ -1444,6 +1453,16 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 }
 #endif
 
+static long uvc_v4l2_video_ioctl2(struct file *file,
+				  unsigned int cmd, unsigned long arg)
+{
+	struct uvc_fh *handle = file->private_data;
+
+	guard(uvc_pm)(handle->stream->dev);
+
+	return video_ioctl2(file, cmd, arg);
+}
+
 static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
 		    size_t count, loff_t *ppos)
 {
@@ -1529,7 +1548,7 @@ const struct v4l2_file_operations uvc_fops = {
 	.owner		= THIS_MODULE,
 	.open		= uvc_v4l2_open,
 	.release	= uvc_v4l2_release,
-	.unlocked_ioctl	= video_ioctl2,
+	.unlocked_ioctl	= uvc_v4l2_video_ioctl2,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl32	= uvc_v4l2_compat_ioctl32,
 #endif
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index fbe3649c7cd6..eb8e374fa4c5 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -766,6 +766,7 @@ void uvc_status_put(struct uvc_device *dev);
 /* PM */
 int uvc_pm_get(struct uvc_device *dev);
 void uvc_pm_put(struct uvc_device *dev);
+DEFINE_GUARD(uvc_pm, struct uvc_device *, uvc_pm_get(_T), uvc_pm_put(_T))
 
 /* Controls */
 extern const struct v4l2_subscribed_event_ops uvc_ctrl_sub_ev_ops;

-- 
2.48.1.711.g2feabab25a-goog


