Return-Path: <linux-media+bounces-22174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0209DA7E1
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 13:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25CB7B2DAA0
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554FF1FBE9D;
	Wed, 27 Nov 2024 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y+UqrPhQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F361FA856
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732709700; cv=none; b=LTGlTG2x9k8DuHH00SEJDCsqlWoiOTkBMJ18aYsx/WyrzkfcOuA+/ijTAAP4vCPsdyywQ7Yy/mXMkukxxlguIYS/rkbj8Z5CxXgR9jQCMsQvkGEVVDwqgM65jx/jtALVR2zj6x+FKlIviaB8362n4u9IBCag3GDCWcAvmi1dyv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732709700; c=relaxed/simple;
	bh=WhdTkzcqR6Bf+l9KubUuR4/DJ8IIJcn0RVpx0dWpsR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkoEZU9DzlMizPZ9VF9kd/uTfpOrpIZY9keMMS5SrinA2RBklpO+7a45O4YFxb/CBy/1gJlxj5zy+bh6CDA72HtXZ0dOdjQ5brDqvjRjFP2Q2pFbd0HnNfK5xAGuFLgCVGLx4aSWf+9/5XdrQvhBDwQQfiyufBFJ/t+a73p2yak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y+UqrPhQ; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b678da9310so109654085a.2
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 04:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732709697; x=1733314497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0KHNn4es9DIQwBkLUHR0O3A+08DvzwFXH+1YhEGXA0=;
        b=Y+UqrPhQAPtBgpBCqlACR9fj87wmQeEX5Yd2Vuj6MGOrRL8wYIcQU6cKY56Kn4oIaF
         6Af93lMpqLk2qt2+C64L907THMur6bxxzVe9SBUvPn7Tcf0cykoOPpzjdbafFNYEIM2f
         ILPzsnQg1YsCoAMWW+WCGq3y8nyOCga2BlPao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732709697; x=1733314497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0KHNn4es9DIQwBkLUHR0O3A+08DvzwFXH+1YhEGXA0=;
        b=DsoAboSEk6hf8yttKIe4yrkw2FL9xp6aOZXZqRvx8Bw1E80GlWwKERdc/8xruVYZn5
         MWpFj5RXOhD8ZF48GSQIbuzAlXFlyDH00MuSlcYoWWKlO/zockIJgrD5DF3W+G9PQ1YK
         YwbPo9ghCl4zHFn617M0CqSlponv90Agx68IssXMQ2ShaaKtlWvYpyy7MVh9d+pngeSg
         zh3UAfZh39kN9OAYQxY6QW1RUtxdp6H+T9oadfrMaDGGo8vpQK6NbFAx34PvwyCpky9m
         mSz3KOfcBTQ9nhArUbVUXMXeTEWKd9pmcF6Eb0ZoDVcLzkTyNbY7fwEU5LBIgO9edx+e
         SYjw==
X-Forwarded-Encrypted: i=1; AJvYcCXG/CgSCPpEe4yoyT+bea8H1gLcLXD+mGZi0YtuM90Xomj+2rJd8jzqMkJI22nGqfSRK77dp3qZuOhGwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8blyL2BiXQhuW8GlBM54zHhqXhyCAzsmZFk82IElR9RPE3APf
	BcH8It3pIane6o1ZLsbVziid/fRJXrETQUq7gUMEHVLgJu01S8otdCdwhE8iVA==
X-Gm-Gg: ASbGncu6QZ5dYF088IIKwTXgkKWyzHWB+lSv7NaEsV3qyx2pMfVyWxd8FW3wqcv7f/8
	cKzSosHTRjuOtThmM+eCHWMqow5iIzvbmHjM+KeycaB+9vawlj5L/URDoW4Q6+FNMbfECOWWq9F
	8CIXtrlwRpxACXqZ92emvuV/iBRDBDs9781GBK2NMXv+XYIF9A/+aCC5EM+NzS6cOK7QOVfxpXN
	Aj9M6AF/RDc1U4UmabHU1w9/mfzii/4pstOUDuMIH/2bFtBhXQuV9eyYkbPQjCYxux40q67xPFb
	j0B+gH7vq6UNL0n4zI6auMQ/
X-Google-Smtp-Source: AGHT+IEdu8deXp9Whw6D3ODj6kf5vf4xXQ1BzDm2O19GNjsuQS6uwUGVVt/ypGSUyCnQ8eyQm4KPdA==
X-Received: by 2002:a05:620a:4095:b0:7b1:4b2e:3c0 with SMTP id af79cd13be357-7b67c263e59mr439636385a.14.1732709697396;
        Wed, 27 Nov 2024 04:14:57 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466be77cf7bsm371171cf.89.2024.11.27.04.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:14:56 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Nov 2024 12:14:49 +0000
Subject: [PATCH v2 1/4] media: uvcvideo: Remove dangling pointers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-uvc-fix-async-v2-1-510aab9570dd@chromium.org>
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
In-Reply-To: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

When an async control is written, we copy a pointer to the file handle
that started the operation. That pointer will be used when the device is
done. Which could be anytime in the future.

If the user closes that file descriptor, its structure will be freed,
and there will be one dangling pointer per pending async control, that
the driver will try to use.

Clean all the dangling pointers during release().

To avoid adding a performance penalty in the most common case (no async
operation). A counter has been introduced with some logic to make sure
that it is properly handled.

Cc: stable@vger.kernel.org
Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 38 ++++++++++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
 drivers/media/usb/uvc/uvcvideo.h |  8 +++++++-
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4fe26e82e3d1..b6af4ff92cbd 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1589,7 +1589,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 	mutex_lock(&chain->ctrl_mutex);
 
 	handle = ctrl->handle;
-	ctrl->handle = NULL;
+	if (handle) {
+		ctrl->handle = NULL;
+		WARN_ON(!handle->pending_async_ctrls);
+		if (handle->pending_async_ctrls)
+			handle->pending_async_ctrls--;
+	}
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
 		s32 value = __uvc_ctrl_get_value(mapping, data);
@@ -2046,8 +2051,11 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 	mapping->set(mapping, value,
 		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
+	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS) {
+		if (!ctrl->handle)
+			handle->pending_async_ctrls++;
 		ctrl->handle = handle;
+	}
 
 	ctrl->dirty = 1;
 	ctrl->modified = 1;
@@ -2770,6 +2778,32 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
 	return 0;
 }
 
+void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
+{
+	struct uvc_entity *entity;
+
+	guard(mutex)(&handle->chain->ctrl_mutex);
+
+	if (!handle->pending_async_ctrls)
+		return;
+
+	list_for_each_entry(entity, &handle->chain->dev->entities, list) {
+		for (unsigned int i = 0; i < entity->ncontrols; ++i) {
+			struct uvc_control *ctrl = &entity->controls[i];
+
+			if (ctrl->handle != handle)
+				continue;
+
+			ctrl->handle = NULL;
+			if (WARN_ON(!handle->pending_async_ctrls))
+				continue;
+			handle->pending_async_ctrls--;
+		}
+	}
+
+	WARN_ON(handle->pending_async_ctrls);
+}
+
 /*
  * Cleanup device controls.
  */
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 97c5407f6603..b425306a3b8c 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)
 
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
 
+	uvc_ctrl_cleanup_fh(handle);
+
 	/* Only free resources if this is a privileged handle. */
 	if (uvc_has_privileges(handle))
 		uvc_queue_release(&stream->queue);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 07f9921d83f2..c68659b70221 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -337,7 +337,10 @@ struct uvc_video_chain {
 	struct uvc_entity *processing;		/* Processing unit */
 	struct uvc_entity *selector;		/* Selector unit */
 
-	struct mutex ctrl_mutex;		/* Protects ctrl.info */
+	struct mutex ctrl_mutex;		/*
+						 * Protects ctrl.info and
+						 * uvc_fh.pending_async_ctrls
+						 */
 
 	struct v4l2_prio_state prio;		/* V4L2 priority state */
 	u32 caps;				/* V4L2 chain-wide caps */
@@ -612,6 +615,7 @@ struct uvc_fh {
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
 	enum uvc_handle_state state;
+	unsigned int pending_async_ctrls;
 };
 
 struct uvc_driver {
@@ -797,6 +801,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
 
+void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
+
 /* Utility functions */
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
 					    u8 epaddr);

-- 
2.47.0.338.g60cca15819-goog


