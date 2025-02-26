Return-Path: <linux-media+bounces-27052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9196A462A3
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0C573B4B79
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA71222A1F5;
	Wed, 26 Feb 2025 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cVCGN5bi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594EA221735
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579816; cv=none; b=VT2vPdVmP0AfbMuvNa+vwUDNB+OiNATeHVQGfR1xn8S2e0/FWmv3CktvTowuJwf/jQu29/ggJtjAxtXg3e23Q3IbHyZ5+9Mwcw7s7nl7tkqkNRFomoIp+OZJ4rg2yBm43qzPyv7I2VRaRu+iihZcWVe75/sWEw7w1vRumUGaXM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579816; c=relaxed/simple;
	bh=rylK6f1QH5ynXpFEibP1x7WRxpQi7HVpYgi2w6TZTjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hyYMlieKok9ax53e1aQPC5X5z4zP/b1plSlUt3R0tYb3sMcOx/phLD6AzebVs1pnhf0bChlv4etxBsU3EpVZhtRP5aHJZ5BYPFtRS91nBwgEi+4rXYIwzE7mpSt4FTFS+6K5TS0vthK42HJfxPBJEYBkxfYGhoMyDzxV8SzvPsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cVCGN5bi; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7be6fdeee35so1300087785a.1
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 06:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740579813; x=1741184613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnrHbOIeNyXFgC3ohSck6umf/PDQ1ndtYxjmn58DA5o=;
        b=cVCGN5biLc3Z6k+Ujn3n7oJEPeXrWGlSGj67YyL/nK/8ioJn575UKicejmg7+Z65Y+
         HqzNeOnYQiqi05lAu/p4sqW8Jup3s2I15po1VjHPbnzUrY1Y387kRXcAXbiAD4f6Iepb
         pl44YiBGrsIfr/w1Xoyy1yiVT6pTvWnvw+ohU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579813; x=1741184613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnrHbOIeNyXFgC3ohSck6umf/PDQ1ndtYxjmn58DA5o=;
        b=uLREHjH57/OTItpHSsm/aKo+XZerQSL0CXnowEtuXpyMtvHajkJ4PpwCt4wKS1bsvb
         ZkNeA0pK1o/ZScUrX/XlUfFS0iVq1YJ3NfBrMUPuZxTzbAzpxKvH7YJhu4D3sn3r+YrD
         RY2W3bxs1tN52PjlZuyTx8ZunKr6XlbCDMiVTx0l1GmS3zccs1nm68ZBOzV1xvu3N1Sb
         Ua2DsSU5oDAQPtHT1k+gKoelERSv8Y24n54MX0Fxh612tfmEXGVz2T1ZkKs9Q1XDN0S9
         VCjQX3OC7RBuw3WkctpKj3k5Ka7umhAJolpK3KVpjjWRv5bcm3Uk+laq41yqpvfTiz4N
         IJGg==
X-Gm-Message-State: AOJu0YxF5AZUjyNgTsqgquGNeGsqnbaL/I4nthEXz9Qq+cb4R0qrOL2V
	pnh7iTL213+MEjuBOCXBH7Vig6LpqhQDtlsPlZ/8bD11XX/eT72rTLUAlGmkrQ==
X-Gm-Gg: ASbGncvLlzJxizlQdwwxSs8jaRAfNVODzyKob1ADPl47bnBhNm+4U/w21fRYcLBLHHe
	1oSuTTu3QJT20tG+5bPw3DRdtoAEkULBSxUOMEzMK9YRyCIsdQ5tqec6tQlI9iOQk04G6Q1Sl5U
	C+kNJCyCz/SmZIg/53oHo6hEMkCPr11FZe+/5e5AE9BOHS+kXW3TG/qMtEDNa6gvtDvp/BQ//q/
	UotScRmk5uR/uxmXLr0dt53VdlwyMf1/ADauxNVVfeE4iuQ8DOpwiAU5z4ZfclXnkzwwxCyfKTW
	CTgKNhGCq/BaPUroWYRAvzovxE2IgRPYeviQKucxceoaTgMKZ8SKiiNvu/Jc0CtBjmZHdXGTsD8
	Wjno=
X-Google-Smtp-Source: AGHT+IF2fi7OhvOIfrZBpLucCECiFhFVL1Q4iddsUtPiahTbS8VKT8yERMFERI4M5Nb7Ay79RtvcaA==
X-Received: by 2002:a05:620a:4106:b0:7c0:a28e:4970 with SMTP id af79cd13be357-7c23be24c00mr740057185a.29.1740579813351;
        Wed, 26 Feb 2025 06:23:33 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c33cfb0sm246336085a.103.2025.02.26.06.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:23:32 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 26 Feb 2025 14:23:29 +0000
Subject: [PATCH v4 3/5] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-uvc-granpower-ng-v4-3-3ec9be906048@chromium.org>
References: <20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org>
In-Reply-To: <20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org>
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
2.48.1.658.g4767266eb4-goog


