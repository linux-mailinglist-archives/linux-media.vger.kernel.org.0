Return-Path: <linux-media+bounces-22362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3C69DEC5C
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 20:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 971A2B224AB
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 19:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399711A4F19;
	Fri, 29 Nov 2024 19:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hk9GHpCA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4CF1A286D
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 19:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732908314; cv=none; b=FTQBkFsT30stfrUt/ijUXUmJqZt2ePgg7YQb9ktUYYjpfJedTYns+mm/P7AIjPsXuXzep3ZMtc32KHXluM6CVy/2qczVN/KATlCGb6ynE+8LgEqE6akhAHdMYr0exh+NhLBlXN8mggYPgw0TBpZhjouDk5Yeh4IrGUzZB/wz5T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732908314; c=relaxed/simple;
	bh=Zy1WcuTev5lX3bXIs4fw/TsAuA82ld2oaDvt3MBOS90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xk1AHJ+Y/+vI/+SfDu4Ps5eVv+id9n5Gx9/geXWZN+V0Z2hreLf7HukMVH9R4nggVAxdQXdJi8CKXwt709MvAXeS/8vgjEhYnEMXA3RGH0oKd0BqtvimyvdEc8CkMCLxnPfLUZHB9h7gNwkWqYLeDJC3WSMsaRb904fJWim2AJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hk9GHpCA; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b667d2fb9dso123142385a.1
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 11:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732908312; x=1733513112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQeQ2KyqHtNBRriL9fVSW5MUmGsZLOcz6c7UY+k+UN0=;
        b=hk9GHpCAa93ddWHZ1b5JNNxZXsDhBwfn5AXD1sh72MCBtOre/SVB+5bc6Ve9s7pCGK
         Blbb3ffqY3rzvt8OMdnUg8pb3dsmcrueVCMhV/4/up9s+g5zTtJycbiE3SFog8a3aOuy
         VUcS/aDpttdPQryxrDEn9HTHNteRFrwmHjKEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732908312; x=1733513112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQeQ2KyqHtNBRriL9fVSW5MUmGsZLOcz6c7UY+k+UN0=;
        b=jEj5CjXPmcoFFwdbOv6GKi09RT1RpBuAiLoq4T7LVv1ZnkUg1JX8qlGb1T1jWX5QQm
         C3lLEN1cWdO2tk8PllQMaZu/SP4LqA0yfHQT/loBqXUnqENhFE9KZLjbsdz1zArHIrtG
         7l6UTDh9MDuix3hxcrItAR2QvMGCP2ROJJXwRRYP/x341GSvQTMMHAX2WvNqQh8RUKxc
         alU0+mm3EsN/jlvKVwRbTHyoZuWNAyULMJcZUYWArbAu/B+h2RmKaB24AEKw7BtElhtH
         UJltGBy04WSuhc3hLyUMViQd00I1pDQJbgP4dr9potoFzTkYc8DS1irPIyLdwyfRBsX7
         HQRg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Uvk8gC93stOAWOIzqPBuuZIS10Qs6fmu/q/97b+ydsD+vcn+Ycpsai+k1mTeHNYRiix7+v56iO2QXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkOwl8bFhUnl4C+B0jMiiRGMtAWenbJW3yDJfchVZ39EiHeX5h
	+f/RD326ZpqZoGY8ViYQ/ekSOiDU3kkHLAJDoPgjPfZwm6okxkvCYzuF5iyRbw==
X-Gm-Gg: ASbGncseMV9gnZuZ5p65wsulJR8bcsdu7F8Z1D+APRd5SDTZl4f36XxbD7B7bIKrszE
	fCa3+FGDq5YvvV8wKNtY5Kfh0bhA5pcS2our8RotGdpqbE1gw0Yo/NkuzWS0+WQT6QzcYaoyRps
	BE7EkKTV2xgTOCehMDAiMUOUqjFFUjGNX7r9IlXKqHjgjrGlwRqe+kebNSZ2BvQVxOhBYDzGd0Z
	mV/eCQVcBWbdFX0kTl7WLBeiGu45FSJ2jNCy2NQpRlilfiqxA4FYqMRE26e8SpfrztabCo1pzMb
	V8AiUmv2JFplWYWYCgPhQhLT
X-Google-Smtp-Source: AGHT+IGedfeMWQrD0Uy4movxPEueNKjXW4h6eR7BQ7bbYDKwsyyTMfuMQXVM2jydDrBBUQytGq8yqQ==
X-Received: by 2002:a05:620a:8013:b0:7af:cfc0:7822 with SMTP id af79cd13be357-7b67c2c2828mr1659490185a.33.1732908311936;
        Fri, 29 Nov 2024 11:25:11 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d87d899ec2sm14462146d6.50.2024.11.29.11.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 11:25:11 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 19:25:03 +0000
Subject: [PATCH v3 2/4] media: uvcvideo: Remove dangling pointers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-uvc-fix-async-v3-2-ab675ce66db7@chromium.org>
References: <20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org>
In-Reply-To: <20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
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
operation), a counter has been introduced with some logic to make sure
that it is properly handled.

Cc: stable@vger.kernel.org
Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 44 ++++++++++++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
 drivers/media/usb/uvc/uvcvideo.h |  9 +++++++-
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 88ef8fdc2be2..0a79a3def017 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1579,6 +1579,23 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
 }
 
+static void uvc_ctrl_set_handle(struct uvc_control *ctrl, struct uvc_fh *handle)
+{
+	/* NOTE: We must own the chain->ctrl_mutex to run this function. */
+
+	if (handle) {
+		if (WARN_ON(ctrl->handle))
+			return;
+		handle->pending_async_ctrls++;
+		ctrl->handle = handle;
+	} else if (ctrl->handle) {
+		ctrl->handle = NULL;
+		if (WARN_ON(!handle->pending_async_ctrls))
+			return;
+		handle->pending_async_ctrls--;
+	}
+}
+
 void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 			   struct uvc_control *ctrl, const u8 *data)
 {
@@ -1589,7 +1606,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 	mutex_lock(&chain->ctrl_mutex);
 
 	handle = ctrl->handle;
-	ctrl->handle = NULL;
+	uvc_ctrl_set_handle(ctrl, NULL);
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
 		s32 value = __uvc_ctrl_get_value(mapping, data);
@@ -2047,7 +2064,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS && !ctrl->handle)
-		ctrl->handle = handle;
+		uvc_ctrl_set_handle(ctrl, handle);
 
 	ctrl->dirty = 1;
 	ctrl->modified = 1;
@@ -2770,6 +2787,29 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
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
+			uvc_ctrl_set_handle(ctrl, NULL);
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
index ce688b80e986..e0e4f099a210 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -340,7 +340,11 @@ struct uvc_video_chain {
 	struct uvc_entity *processing;		/* Processing unit */
 	struct uvc_entity *selector;		/* Selector unit */
 
-	struct mutex ctrl_mutex;		/* Protects ctrl.info */
+	struct mutex ctrl_mutex;		/*
+						 * Protects ctrl.info,
+						 * ctrl.handle and
+						 * uvc_fh.pending_async_ctrls
+						 */
 
 	struct v4l2_prio_state prio;		/* V4L2 priority state */
 	u32 caps;				/* V4L2 chain-wide caps */
@@ -615,6 +619,7 @@ struct uvc_fh {
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
 	enum uvc_handle_state state;
+	unsigned int pending_async_ctrls;
 };
 
 struct uvc_driver {
@@ -800,6 +805,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
 
+void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
+
 /* Utility functions */
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
 					    u8 epaddr);

-- 
2.47.0.338.g60cca15819-goog


