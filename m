Return-Path: <linux-media+bounces-22129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A55269DA355
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 08:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66C8E282E7F
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 07:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D643D18C34B;
	Wed, 27 Nov 2024 07:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FEepfIsQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C320B17B418
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 07:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732693587; cv=none; b=cM3SSqodKd5+nuTUYrjaGa6SSBMvjfP02vz9CwYxfrKJMk4SF109JS+nGICMIH1SG9EuuVCss83sBIuPrSaRwJ541KB4kALdrrZL8W0r3+RVHuG2aNqIL2Du9CPe4LyXhwHKR5TxZUQYQgY25WImdIxyxVRpM1pz10puRATEBUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732693587; c=relaxed/simple;
	bh=wsupc+qJZWfWzVfaFmE6CWRDyNHqRQr4iSu156pifPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TsVn3jAXDFK6JaEanJiUcV5YJ8lX15XEdHH+AkBTTY52YQODxqJTT/uYVNwmgtXEF42HCDQlV/tLcPDUz6eeXZqsQ/pfAphuHChFMcvuDTg+sTtV4rzZNGB+wov/MXmm+IMT4+5uMOkMdCU8XdPWDr3nLUIokW6aEtmpz84XmF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FEepfIsQ; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6d41eeca2d6so47048986d6.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 23:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732693584; x=1733298384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6+TDrLkgXM9/PtCs6e0qWgX2PpjlMIZQ4o/NRcpkPc=;
        b=FEepfIsQqghG5+AY7JdtOFU2R0W67wOJgJWPVC8LAvHY7YvxqFbtjDKGBlLel6BQtz
         WiPkoRBZK4IOHPo6MUDMkaFTkLk3QhDTFRYL5PJbKck0Zu8NFesG6rpzz1dvdSwGx5P+
         QGp6OehKOMZmMngVAiqAxtVQqG+QolX2mpvaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732693584; x=1733298384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6+TDrLkgXM9/PtCs6e0qWgX2PpjlMIZQ4o/NRcpkPc=;
        b=agFCWjcgdFbcdJs3TA9/6OrFQNfP9l4TzNCbL4pWMqiqQDYlFYfQ1QH2kzzR1JstZ2
         ZJRc4Vg8aNencOtdMmJyPAFr7JGp0oE/sWndscqAa68LZxKO/1rbf9PU+EXJi23WVO4Q
         QR9h6b6XVkRZXyt1Fg6IQrySxZpXafS3z+RBWDSsEughcpiyHaVr4CFpYshS/RzvwlqQ
         jIVqLm58EuwvUFDjqUSftNZ60aGpRufdtPfx2oM9qZL34Xhus/n3ur11oBTpvFBvDtAB
         9llIxind/DN0bq17PvJOWVFnFPbyRhgIxcGhgtHnKTYdWDg6RlGC/7MNgSXS3xVMB4Il
         Pbmg==
X-Forwarded-Encrypted: i=1; AJvYcCXQPNNAmBLmhNA/s58mHHVotUkZ8TJHOHphxzcV/edocHDdrNeZa8UH4amlcXqIyvOW7zJMWs1iDeat5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YywikoEUKUtfBrF4yhD1eEE31gR7SsTVTFED+d/Rltr/q5Yov/K
	Wa8UXfbQE90TZPueKzVE8EehijlWvgtBYjv34KhAOqXzL3Hy8P5k2VCIIM1iMQ==
X-Gm-Gg: ASbGnctSkfndfmTp68VjrLQtUc9Ko1fvS5ZbSeq1Vox/AXjWZllDLBfLqlUT8A/X9Qk
	8MUxtXfCHNJF9yNOuoG67D5CAFO7kIRisYWoa/i75lD4MSrPAa3pzo+uQA9wCxEGZty9ST/THzW
	w5S4mzV39GeNhKCpjq5pvcj3lwCyQtvACf4DopYJrukwWy/mlNL1duQ5zNw2qlzFyYsd6DUGLpq
	rHPGEMhGOuexC5IjlQysjSJw0U2ovZjL9MzeuZj12G8+mJtMPHxJD3ysAQTQUsbq3bet2zwfJzy
	r8ZfcQgs6gR9Ya3xnBLpy8Nx
X-Google-Smtp-Source: AGHT+IHa7Pn2PDpYTelow+sIFnWl3x1JrObmzUG1+LV1s9m1wO2itR1j+AfGUfW2xoUFqinWiiyXvA==
X-Received: by 2002:a05:6214:2587:b0:6d4:1425:6d2b with SMTP id 6a1803df08f44-6d864dcb836mr30231026d6.36.1732693583896;
        Tue, 26 Nov 2024 23:46:23 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451a97b1asm63750386d6.40.2024.11.26.23.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 23:46:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Nov 2024 07:46:11 +0000
Subject: [PATCH 2/2] media: uvcvideo: Remove dangling pointers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-uvc-fix-async-v1-2-eb8722531b8c@chromium.org>
References: <20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org>
In-Reply-To: <20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org>
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
 drivers/media/usb/uvc/uvc_ctrl.c | 40 ++++++++++++++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
 drivers/media/usb/uvc/uvcvideo.h |  3 +++
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 5d3a28edf7f0..51a53ad25e9c 100644
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
@@ -2050,8 +2055,11 @@ int uvc_ctrl_set(struct uvc_fh *handle,
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
@@ -2774,6 +2782,34 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
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
+		int i;
+
+		for (i = 0; i < entity->ncontrols; ++i) {
+			struct uvc_control *ctrl = &entity->controls[i];
+
+			if (!ctrl->handle || ctrl->handle != handle)
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
index 07f9921d83f2..2f8a9c48e32a 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -612,6 +612,7 @@ struct uvc_fh {
 	struct uvc_video_chain *chain;
 	struct uvc_streaming *stream;
 	enum uvc_handle_state state;
+	unsigned int pending_async_ctrls; /* Protected by ctrl_mutex. */
 };
 
 struct uvc_driver {
@@ -797,6 +798,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
 
+void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
+
 /* Utility functions */
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
 					    u8 epaddr);

-- 
2.47.0.338.g60cca15819-goog


