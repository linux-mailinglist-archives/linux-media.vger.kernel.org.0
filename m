Return-Path: <linux-media+bounces-28895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060BDA73FE6
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 22:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A88617D452
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726971D515B;
	Thu, 27 Mar 2025 21:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AKI4ftBC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A1D1D9A41
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 21:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109535; cv=none; b=WZVvaujwjzV3lYGOEr7PoP0eS4ZxC1TCZgSbKDZRS2SOjXGcAOJ5jUr0OLwbeHE+DDt9PDlgdhv+dJQZpLy88MAOf21yLolWkP72C+kB6r2/6HCNfANOKwQUIq4oPec3ioFG5oOH4OplSg9QRfvmfArKKayNDNAalox2UIZjtR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109535; c=relaxed/simple;
	bh=UNUEZP3w8YZerWod8kYMkdwNDmb95xdLkSVLnYJi2iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WAZVK6fMNicrcDkSSX+rSB/NdVBZkifLgcDODEsmdL4aH9AYEDzAcqnPbGWXOkCGuoGDCrcvs+h0PaIvira4eMHoNKc/lUd/7kudwF6FaxA6TjDeHaqTVkANArU8x1UCDPFaHmXO/8vtwIMYzol3B2a26lfozarm9yB0r4QbsnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AKI4ftBC; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-476ac73c76fso17831281cf.0
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 14:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109533; x=1743714333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyF9yV+q7HdGxjYeapc60IDH/reeh91Du4rxUglSpiU=;
        b=AKI4ftBCMAhinHCJz6k1VCHo+xhVqgjGYOOEhiwsHpxgVCfdsIoSNXNCL44yEi/XOE
         dsqEO5I4Ut513E6cQWKxDz6Faf3Eix3lhRYayWq/1XLTFZ+u8VZNPdwubqixvhdCJuLj
         o0P9bOA3gF9MOzk5Z8FAFL+8wF5oNZyYjHLss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109533; x=1743714333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyF9yV+q7HdGxjYeapc60IDH/reeh91Du4rxUglSpiU=;
        b=W3EFppd/l1eHnV6SQTzRiCV/WZMclP5joXm0xAW5nIpOmCSwzRWWGeUEMAmFSATCBw
         RupeyQQdKRggGumt3kUoKbB9qGuSH0leaZXhMc7LaHJ3faDYd29yz/zyACOGZiAiBjH5
         5RutV9NJxZo4FhdLWVltfUElfonL6165cwOaMMpe+GM6uEcS7e3VsGMuE+gXx6NUaXO5
         5MaOl+sO0RSOEWuZmqcv/Ab8IdqOF2sr5Mr/MbeCqFOT8o7iCLtgEvQGPOY0TpAJCzJ+
         ILj3wZrAciY0SUIFVgMKUOw6WR/8A/Jn4zepuoZoH0XMkLMdl6W3s/8AnZJjjMm4XgTN
         4vDA==
X-Gm-Message-State: AOJu0YxMxyY0/a/HNEYtQ8gAqiX7FxjgDPO142VRFyUt+43tKRjca/HR
	FA7ayy+X+8YsJZucR9EAl4A57TXwCfbo2+WqTfTd+0nSyMMDAXYcnyAFl7wdAQ==
X-Gm-Gg: ASbGncu2WHJU95PpFVGhuot1FHmc7uau3mwh1be7x6lzDSIC8d0JM2IiA6tlBD6gete
	r0p3hj9WzyDYBO8OPXMnryqbRpyP7gX52L76yOYnsbq2nrKrHhZxmO7epmwr0TW+ycYQ+748XPv
	F6xl31C4WyDWULEXxlB1fl2iRk+vnN53N+pFvTRE03poRt6faedEWO3CVx+xrKckImq88NUvYvQ
	/rn29Tt1dXKsp7WcpxHEZZGeMxF+UYHYh0K4osPbxXXpuRpbzyEuXlOGvTEIruAvws8IGFEsfNf
	w19z5yXXyOilkl4BxBt0FSnLRAgBycJi2P0eJLm1CtHXHQPFcEf3k7CJEN0hkR/2uVnGaT8bgd2
	wZQUSNzNOnwmDRF89nGuZow==
X-Google-Smtp-Source: AGHT+IFuMMc1va0NxXgRq16C7VpNCV4wcIWIZAEQC7Wykd+RvFsh2EJN4046LsbERIAF/4anKeaZJQ==
X-Received: by 2002:a05:622a:244f:b0:476:77ba:f7 with SMTP id d75a77b69052e-4776e1eeb22mr83967141cf.34.1743109532717;
        Thu, 27 Mar 2025 14:05:32 -0700 (PDT)
Received: from denia.c.googlers.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a1070csm2275421cf.9.2025.03.27.14.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:05:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Mar 2025 21:05:29 +0000
Subject: [PATCH v6 3/5] media: uvcvideo: Increase/decrease the PM counter
 per IOCTL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-uvc-granpower-ng-v6-3-35a2357ff348@chromium.org>
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
In-Reply-To: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

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
 drivers/media/usb/uvc/uvc_ctrl.c | 37 +++++++++++++++++++++++++++----------
 drivers/media/usb/uvc/uvc_v4l2.c | 39 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index cbf19aa1d82374a08cf79b6a6787fa348b83523a..3fad289e41fd5a757f8dcf30a6238c694fc4250c 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1812,38 +1812,49 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
 }
 
-static void uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
-				struct uvc_fh *new_handle)
+static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
+			       struct uvc_fh *new_handle)
 {
 	lockdep_assert_held(&handle->chain->ctrl_mutex);
 
 	if (new_handle) {
+		int ret;
+
 		if (ctrl->handle)
 			dev_warn_ratelimited(&handle->stream->dev->udev->dev,
 					     "UVC non compliance: Setting an async control with a pending operation.");
 
 		if (new_handle == ctrl->handle)
-			return;
+			return 0;
 
 		if (ctrl->handle) {
 			WARN_ON(!ctrl->handle->pending_async_ctrls);
 			if (ctrl->handle->pending_async_ctrls)
 				ctrl->handle->pending_async_ctrls--;
+			ctrl->handle = new_handle;
+			handle->pending_async_ctrls++;
+			return 0;
 		}
 
+		ret = uvc_pm_get(handle->chain->dev);
+		if (ret)
+			return ret;
+
 		ctrl->handle = new_handle;
 		handle->pending_async_ctrls++;
-		return;
+		return 0;
 	}
 
 	/* Cannot clear the handle for a control not owned by us.*/
 	if (WARN_ON(ctrl->handle != handle))
-		return;
+		return -EINVAL;
 
 	ctrl->handle = NULL;
 	if (WARN_ON(!handle->pending_async_ctrls))
-		return;
+		return -EINVAL;
 	handle->pending_async_ctrls--;
+	uvc_pm_put(handle->chain->dev);
+	return 0;
 }
 
 void uvc_ctrl_status_event(struct uvc_video_chain *chain,
@@ -2137,15 +2148,16 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 
 		ctrl->dirty = 0;
 
+		if (!rollback && handle && !ret &&
+		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
+			ret = uvc_ctrl_set_handle(handle, ctrl, handle);
+
 		if (ret < 0) {
 			if (err_ctrl)
 				*err_ctrl = ctrl;
 			return ret;
 		}
 
-		if (!rollback && handle &&
-		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
-			uvc_ctrl_set_handle(handle, ctrl, handle);
 	}
 
 	return 0;
@@ -3222,6 +3234,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 {
 	struct uvc_entity *entity;
+	int i;
 
 	guard(mutex)(&handle->chain->ctrl_mutex);
 
@@ -3236,7 +3249,11 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
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
index 1d5be045d04ecbf17e65e14b390e494a294b735f..8bccf7e17528b62f2594c0dad99405034532973d 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -697,6 +697,9 @@ static int uvc_v4l2_release(struct file *file)
 	if (uvc_has_privileges(handle))
 		uvc_queue_release(&stream->queue);
 
+	if (handle->is_streaming)
+		uvc_pm_put(stream->dev);
+
 	/* Release the file handle. */
 	uvc_dismiss_privileges(handle);
 	v4l2_fh_del(&handle->vfh);
@@ -862,6 +865,11 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
+	ret = uvc_pm_get(stream->dev);
+	if (ret) {
+		uvc_queue_streamoff(&stream->queue, type);
+		return ret;
+	}
 	handle->is_streaming = true;
 
 	return 0;
@@ -879,7 +887,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
 	guard(mutex)(&stream->mutex);
 
 	uvc_queue_streamoff(&stream->queue, type);
-	handle->is_streaming = false;
+	if (handle->is_streaming) {
+		handle->is_streaming = false;
+		uvc_pm_put(stream->dev);
+	}
 
 	return 0;
 }
@@ -1378,9 +1389,11 @@ static int uvc_v4l2_put_xu_query(const struct uvc_xu_control_query *kp,
 #define UVCIOC_CTRL_MAP32	_IOWR('u', 0x20, struct uvc_xu_control_mapping32)
 #define UVCIOC_CTRL_QUERY32	_IOWR('u', 0x21, struct uvc_xu_control_query32)
 
+DEFINE_FREE(uvc_pm_put, struct uvc_device *, if (_T) uvc_pm_put(_T))
 static long uvc_v4l2_compat_ioctl32(struct file *file,
 		     unsigned int cmd, unsigned long arg)
 {
+	struct uvc_device *uvc_device __free(uvc_pm_put) = NULL;
 	struct uvc_fh *handle = file->private_data;
 	union {
 		struct uvc_xu_control_mapping xmap;
@@ -1389,6 +1402,12 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 	void __user *up = compat_ptr(arg);
 	long ret;
 
+	ret = uvc_pm_get(handle->stream->dev);
+	if (ret)
+		return ret;
+
+	uvc_device = handle->stream->dev;
+
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
@@ -1423,6 +1442,22 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 }
 #endif
 
+static long uvc_v4l2_unlocked_ioctl(struct file *file,
+				    unsigned int cmd, unsigned long arg)
+{
+	struct uvc_fh *handle = file->private_data;
+	int ret;
+
+	ret = uvc_pm_get(handle->stream->dev);
+	if (ret)
+		return ret;
+
+	ret = video_ioctl2(file, cmd, arg);
+
+	uvc_pm_put(handle->stream->dev);
+	return ret;
+}
+
 static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
 		    size_t count, loff_t *ppos)
 {
@@ -1507,7 +1542,7 @@ const struct v4l2_file_operations uvc_fops = {
 	.owner		= THIS_MODULE,
 	.open		= uvc_v4l2_open,
 	.release	= uvc_v4l2_release,
-	.unlocked_ioctl	= video_ioctl2,
+	.unlocked_ioctl	= uvc_v4l2_unlocked_ioctl,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl32	= uvc_v4l2_compat_ioctl32,
 #endif

-- 
2.49.0.472.ge94155a9ec-goog


