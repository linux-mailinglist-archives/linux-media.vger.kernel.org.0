Return-Path: <linux-media+bounces-22444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 922839E04D3
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A2F71679C7
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27F3205E1A;
	Mon,  2 Dec 2024 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QQt+Cel/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AE7204F8A
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733149488; cv=none; b=jdRNg6D5uCyV8viZPElhdeuPiX4xuBClf2UCw5BL4CRqUCVahGy7hOM3DkTwq7BR1bITpcY3higHlGO6Kbyo5dXXwJm4rup4Vo1sVGAcd1+X0qGM6DIErwJGl+HgRTse4DRK5CSWGBAIsbaDdu1YDQd7h/pmIw1R+ZznbiLU+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733149488; c=relaxed/simple;
	bh=2CouL6TauW+OfYTjBFsOKvayyxDlTHWIFYpffgKYGh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LabEaHYp11mjkGu2VNBaNVowk9uZqmUeT3BGMVcNAWge9Qpm4QL48rbVQb5f/HKkoieGSsRGkUG6dO5IF6RxvZzszuRkDuL7XiBT+AArPi2GxPE+4MEjitib8L3fTSxAoHwCelkpjo3b8RoO0nVcqsq5ZRew+hnDmB2mKd9uLl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QQt+Cel/; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-29e2a50586dso1540247fac.0
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733149483; x=1733754283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLNHXjJlr/6qPBJLlmj7xWzEmuF7V3Sn4z0szK5h1CI=;
        b=QQt+Cel/9pcHXIo351Fm6cSzKXJJH94/WB2pyW+SWXCWffVvlENBc0OnhJU1p7dje8
         4xfu8pOaZKteALYVyIaBWsg9a4/DzzLrcf7sUI8p+cpjOuo/WLgurrnTWtb4yIdZ0V31
         2ok4xPPtxO9w/VfDXN0WFKwNyd0XL12YBtJjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149483; x=1733754283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLNHXjJlr/6qPBJLlmj7xWzEmuF7V3Sn4z0szK5h1CI=;
        b=bPEM+lv1wKv+7HgjTnfvDJnBFlGDUZaIunCJH1NSDkY7V8yUuQ1QIsW96PzvAfM8IV
         uRTcMw6R6LucsQcB55qr1tz+FFCUKvi8X9rINuT0DEntceOCuD7BYCt/B0R9gmOLWHFQ
         wl6MMpUbd3q+my50QKM/SSTEzUv80yzMzZFDgpODWzRihlhA2ktzpQJfvXbn8jD8PfSq
         YGsR4p3BOswEbDck1SVvC3oTBqKq4NahCFX/1BianNW8xUYDlsYGcjmajQrcTAYN210C
         IzpiDDubonIFcIFD28cCMqtGK6cAzPy8DypkFboTGV7OscKSxZTaovV3HeKAad+cHI9l
         5Kgw==
X-Forwarded-Encrypted: i=1; AJvYcCUiE8vGeuyx/s60JHJuFXQcq7dEKFezwZoun8ijSN5FaVMOEa3AyKk+C5Zc048vaxuXU2g4LIHIT5KxPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLW/fDNnE6GCIcq6jPY3YOm2QetPgY3MySq291tfMyBguBIcCs
	1h3g/5iYx8imaHGVFHLzpibet6rtajYWBRPo89co4AR5MSKC+ZlFcgr5Xb5RFg==
X-Gm-Gg: ASbGncuiWCjx7DxqzI7CdAZNz2LjaGUsLF0B6Gpqve816Okuc8ZBAq0tgukbFri5smS
	vPpO1mq3wv70YYXXmyudwln/sqfuYcpiWiAOO0mDvKz/xGZiqGEeeehnikIvVIyZ2sj9/DRFSdf
	uKIZN5yuoEWPRI8KWmmGVqqLui+Ce0PvXEN1TXut+DSIVRjEebsSae25Xh7ZH7hZyKfSlxwwIsT
	6pgxNsqsWN/X2pyYCMs+r3/Pm++VUUyAaXWUFoWoHLR1K81oXAmJsXfMxTEybdipb/e4LG8Gvn9
	Lohf2l8XsBKvvnABfz4vDeGx
X-Google-Smtp-Source: AGHT+IHOmHK950Sz16eLfZ56imS30OV+bUBssh4g96SgnL/6rRx0a78AipUgKMzMa352e4qpARm5UA==
X-Received: by 2002:a05:6358:50ca:b0:1b8:3283:ec6e with SMTP id e5c5f4694b2df-1cab169cf8emr614679055d.24.1733149483059;
        Mon, 02 Dec 2024 06:24:43 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85be9087890sm179710241.25.2024.12.02.06.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:24:41 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 14:24:36 +0000
Subject: [PATCH v5 2/5] media: uvcvideo: Remove dangling pointers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-uvc-fix-async-v5-2-6658c1fe312b@chromium.org>
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
In-Reply-To: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
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
 drivers/media/usb/uvc/uvc_ctrl.c | 52 ++++++++++++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
 drivers/media/usb/uvc/uvcvideo.h |  9 ++++++-
 3 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 9a80a7d8e73a..af1e38f5c6e9 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1579,6 +1579,37 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
 }
 
+static void uvc_ctrl_get_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
+{
+	lockdep_assert_held(&handle->chain->ctrl_mutex);
+
+	if (ctrl->handle)
+		dev_warn_ratelimited(&handle->stream->dev->udev->dev,
+				     "UVC non compliance: Setting an async control with a pending operation.");
+
+	if (handle == ctrl->handle)
+		return;
+
+	if (ctrl->handle)
+		ctrl->handle->pending_async_ctrls--;
+
+	ctrl->handle = handle;
+	handle->pending_async_ctrls++;
+}
+
+static void uvc_ctrl_put_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
+{
+	lockdep_assert_held(&handle->chain->ctrl_mutex);
+
+	if (ctrl->handle != handle) /* Nothing to do here.*/
+		return;
+
+	ctrl->handle = NULL;
+	if (WARN_ON(!handle->pending_async_ctrls))
+		return;
+	handle->pending_async_ctrls--;
+}
+
 void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 			   struct uvc_control *ctrl, const u8 *data)
 {
@@ -1589,7 +1620,8 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 	mutex_lock(&chain->ctrl_mutex);
 
 	handle = ctrl->handle;
-	ctrl->handle = NULL;
+	if (handle)
+		uvc_ctrl_put_handle(handle, ctrl);
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
 		s32 value = __uvc_ctrl_get_value(mapping, data);
@@ -1865,7 +1897,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 
 		if (!rollback && handle &&
 		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
-			ctrl->handle = handle;
+			uvc_ctrl_get_handle(handle, ctrl);
 	}
 
 	return 0;
@@ -2774,6 +2806,22 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
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
+	list_for_each_entry(entity, &handle->chain->dev->entities, list)
+		for (unsigned int i = 0; i < entity->ncontrols; ++i)
+			uvc_ctrl_put_handle(handle, &entity->controls[i]);
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
index 07f9921d83f2..92ecdd188587 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -337,7 +337,11 @@ struct uvc_video_chain {
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
@@ -612,6 +616,7 @@ struct uvc_fh {
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
 	enum uvc_handle_state state;
+	unsigned int pending_async_ctrls;
 };
 
 struct uvc_driver {
@@ -797,6 +802,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
 
+void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
+
 /* Utility functions */
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
 					    u8 epaddr);

-- 
2.47.0.338.g60cca15819-goog


