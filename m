Return-Path: <linux-media+bounces-22370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9B09DECF0
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 22:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD785163B60
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 21:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F371A9B3E;
	Fri, 29 Nov 2024 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="meuxX1IQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F81A76D5
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 21:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732915834; cv=none; b=r4sKWKY3ffUvD/bK2rgaLTPujl7C7N6S7KysPrpYofy/G50y+iZWCd3MAigTUUOv2dCL8i9ZarHlSTbZuOtTqP8Z5Fgn9KvQsJqAGR6vKy1Eq6GxrlsrgvXKAEhWctyCD/FhGQshz+nJXWUiTLgRxvplAp6dCe4jGRSGpgVBoKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732915834; c=relaxed/simple;
	bh=+pfaMnSC0go4/J60SrpKpFXQ/i2qf8ZpJd+CtfqYHc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WML/uS2yGChE83iddhtT+3/END6XkMOMrlTJy4UvdUkQB0Mo4dwi6U9wVfmjRpveNM1ZD4XFanaL96oD3MrHpAa9eG92Qz2H/zRtbf1Bv+4fnpYApjwfddFp6vIahbfR806OxJJpLQZoCim00fSNsqvI74xm1XFbQaoEkfjuNGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=meuxX1IQ; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85bb08df36dso37799241.0
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732915832; x=1733520632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhCf5eirgTgth8XVE2W1qnK6YW57KSpNmGivwsRejzA=;
        b=meuxX1IQdfC4s6PO23AcZGaieysvEH88HOrPUrziIUJfjtUVWF+WGlOFSSlKjA4M6C
         gWw0POZB7PHE6Vy8m6SVrmB0gBi6B5mLkAlHKFMQUc2bhVVPTGb1m4mL0Da6g07LQ39d
         ibkiV7i+wGSwSa5cTnhkmYE2y6mW0p3DSF+mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732915832; x=1733520632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhCf5eirgTgth8XVE2W1qnK6YW57KSpNmGivwsRejzA=;
        b=ByQQzfnWzSwmfpTjuF9z7GY1Iv+Go4hYOGmKPyZWO2bKiuWWX+7/OgFpM9gat6sOb+
         5IdPIB7dxWXd533u4+gyG+1Sz3TVL+Z3zuYtcORwAQrkGGdG1p9DarBuUpk7VKRHe6fL
         7AMKBurKfOKsQI/k6Tn7WBzfQCseSj+qH+M/LH4fn0QElmUBQUbsO4EovOYlsN8+D1uw
         EeZSMKTT2dnCbDuWY0d2CBkYR+fb7N4aTzbW5i2I/+5ggCerRWdfu+Y9v77IzJ6m6ZXt
         sfgC5YtfPwU4A6f+J5mWGeBCRDjVrzP2KXGzIZIwayT86VZXFJD7LEawsQpmfjImNeqk
         V1hg==
X-Forwarded-Encrypted: i=1; AJvYcCUl7R8aLjlfcSan0SBXDXVECz8D52yTCyF0pYlZbSO0ReNlU7ew+myOVGF7qWOurgRU0LhlskFiJefHmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL/RwUtbRhDHHbuFeeVRl0llBGrk95cjVswU5Wh3A7oeClSe4K
	XSTjZVu04WlsULxcvUt2z6GmWPskY7MEK8gQUINp6rT27SwWB9Lna09GKKG1MQ==
X-Gm-Gg: ASbGncu/wBX7Ob9opEQQ59yKoRUSKIEIuk1V+F11KzDUxymrsmj89PDyYgcDpEuwuYA
	RP80ENM1ovpFEMyleW0K3x2RMxMeQYEMndSH/KqHnEtCtzdtvgm0k4zkNTtjryxo9WCST4WCZHu
	l3v3v0zK+qp1EkBnodQaTHXpuOqJysWLuB/pA0z/8CATm9XIQwvNyPazQ0vtYKuKV81aesbpqYq
	ZTL4E7ySPhSXHcwOn/hmnJanzaJHjujdOh5+CEDkjL3M7kbqw1MF53y4ccZFH6jLIohvgdlxDOp
	yljCUiS6aP3I15FmlEGf0kro
X-Google-Smtp-Source: AGHT+IFYwmDx0IKqcsATxkcItz9Kemn9Y5b19SBUmQymuvzPqTIPXsfSyh1fHAg0r6gBeJc73H4R+A==
X-Received: by 2002:a05:6122:6419:10b0:50d:40bb:ae14 with SMTP id 71dfb90a1353d-515569e2f8cmr9832094e0c.9.1732915830592;
        Fri, 29 Nov 2024 13:30:30 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0c1b7asm607254e0c.36.2024.11.29.13.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 13:30:29 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 21:30:16 +0000
Subject: [PATCH v4 2/4] media: uvcvideo: Remove dangling pointers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-uvc-fix-async-v4-2-f23784dba80f@chromium.org>
References: <20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org>
In-Reply-To: <20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org>
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
 drivers/media/usb/uvc/uvc_ctrl.c | 54 ++++++++++++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
 drivers/media/usb/uvc/uvcvideo.h |  9 ++++++-
 3 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 88ef8fdc2be2..bc96fb475b9c 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1579,6 +1579,33 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
 }
 
+static void uvc_ctrl_set_handle(struct uvc_control *ctrl, struct uvc_fh *handle)
+{
+	/* NOTE: We must own the chain->ctrl_mutex to run this function. */
+
+	if (handle) {
+		if (handle == ctrl->handle) /* Nothing to do here. */
+			return;
+
+		/* We can't change the original handler. */
+		if (WARN_ON(ctrl->handle))
+			return;
+
+		ctrl->handle = handle;
+		handle->pending_async_ctrls++;
+		return;
+	}
+
+	if (!ctrl->handle) /* Nothing to do here.*/
+		return;
+
+	handle = ctrl->handle;
+	ctrl->handle = NULL;
+	if (WARN_ON(!handle->pending_async_ctrls))
+		return;
+	handle->pending_async_ctrls--;
+}
+
 void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 			   struct uvc_control *ctrl, const u8 *data)
 {
@@ -1589,7 +1616,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 	mutex_lock(&chain->ctrl_mutex);
 
 	handle = ctrl->handle;
-	ctrl->handle = NULL;
+	uvc_ctrl_set_handle(ctrl, NULL);
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
 		s32 value = __uvc_ctrl_get_value(mapping, data);
@@ -2047,7 +2074,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS && !ctrl->handle)
-		ctrl->handle = handle;
+		uvc_ctrl_set_handle(ctrl, handle);
 
 	ctrl->dirty = 1;
 	ctrl->modified = 1;
@@ -2770,6 +2797,29 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
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


