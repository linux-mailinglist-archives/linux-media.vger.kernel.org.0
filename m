Return-Path: <linux-media+bounces-32165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13358AB1C3D
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 20:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EC76A250FE
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 18:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31B42405E5;
	Fri,  9 May 2025 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kz93+UpO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E4423D281
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815059; cv=none; b=XqnVFUxUvaXwqArOMQ6f451fXx3uA62dW9dtnXgOJI2BKhifLdsQejEvR1ZGqG1VMKVt2gNUeAk71Pcm/QmnG7ACofCvBYcu0YjDPDOweGJz7J8hZ4w/rNJM6NScxDGPKfLK4SZJOMT7oQAY1lh9AGLSsdlWAPtik7OgHvmxZbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815059; c=relaxed/simple;
	bh=zFV4u4xYrdJXQYQST/NOy93iVerYdoMEvRx9i5izrDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l1B5dGu4bt26BjTjCFGBoRZ8aX6jmIXAliOG70xUhuCWuF498S/65f1Lka64zMzGlaIh5sDE4lUNg5QiKk4zPK/nNBgYfx5OELp7q2FJYR+Ld4mPG7iUxt1gDCRl164jAaMlOGTmSE29RvvbNxd+XhpkcA9QA/FvMoPDQ2klUl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kz93+UpO; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499d2134e8so3053863e87.0
        for <linux-media@vger.kernel.org>; Fri, 09 May 2025 11:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746815054; x=1747419854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yi5XaVNppgwZ+7IG1Lz4V8UPUgu4s/f0SGWRQuuh7uw=;
        b=Kz93+UpOIxMebqw9iGgAs3Sdq2rhRiybIwuuUew88UCNr5zOFaNTJj73KzLLN0IN1D
         GJL8WUbMDlwmexHov5u0lXN5ReoDYLB/Xi36I5O7QSDoxUnB8eHWuOJWuj1BxNvmLZWE
         uSYQJYz5l2yDpdQ9buE+fCupqZY4j2lTD3BCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815054; x=1747419854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yi5XaVNppgwZ+7IG1Lz4V8UPUgu4s/f0SGWRQuuh7uw=;
        b=wZyI6E1EsSBNinmsC7xYGY1O8kyy2roiB2Q8OmQn9VwkjgJad9aOI6+CWvAXZKijEv
         fDi0MQ8zlunFjez2VBWuUXtLIDgbhH0wf1Xb8Jy9+9nv/8fQ5r3WFlHHRO6kY5VwaQZ9
         g7Lrwd98LjvwKBpmrIjC23IIBI30JMz6pXWhwKP3jiKFbz6VflTZg5M0ID5qvqEfw5BB
         33bSdnJ0oQJwhIldiTfNWTF067ooXoBMlg6UyLMoUvoN8lxVBMpFB/2pQJXk/PbxmZ62
         CdagxlamUMlqlqtS/cuSXSvH/lKaQ+1MfjUX9rHWoRHSQY6BQiR7wWX9YXFkOUHKG+Fk
         VzxA==
X-Gm-Message-State: AOJu0YxTZns7nyofkmBAlfI8Wky9EPkaWHk5fltwc4Sn9WDwGPqoVaGy
	kVTO+2kUqkX2HwGPlnjR2HSNE7t2ygX1voJ5f4zL4xL6XmQWNJAJOmX4AmpYQGSJFz+UYJa7Ybc
	=
X-Gm-Gg: ASbGncuZNsLyLI2DSfVZ54Yw6WC4akwKzOJhKQhy2px8kg1ldSR4XZEPGFMoC4ALxUs
	qrMYkd+SFrA6dxuWYl5mSZyQMPeKPPO96xYJg0awnDLXzao+y7MFqKST007I2OSxOAxrLvonFi0
	LLav9dV2WLrLJV6QAgBtYJUwsxO7PdcJmWQp6BYbiVB2AbTIvuSMGw7RwzGTdhwojE1chVqlYYp
	HOuMWYcG1YGGEcrboRPeWpVOvx68vr5YetK7mQGagq98JcU4iz1uPCH6/qyWnz00IHYGmh184aS
	/jbE9NYRBHOfGm79mWGZjnqcpH1PHmMUsRIyyoQfG9fco6AjldXPlemS0uNm2vPbKLOxAjPyBsp
	1NJhj96sqsQPpug9yyh78H76++5LF+5Y=
X-Google-Smtp-Source: AGHT+IHPOHJuwzRwwthAHfX0RVaD2nwsVxCj0w/t87pjwfGTdyTLGs9Grg4VR0ctezRgetwQoyhrqg==
X-Received: by 2002:a05:6512:670b:b0:54e:9038:d835 with SMTP id 2adb3069b0e04-54fc67c4734mr1262503e87.20.1746815054485;
        Fri, 09 May 2025 11:24:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bc9sm349410e87.147.2025.05.09.11.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:24:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 09 May 2025 18:24:13 +0000
Subject: [PATCH 1/4] media: uvcvideo: Refactor uvc_ctrl_set_handle()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-uvc-followup-v1-1-73bcde30d2b5@chromium.org>
References: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
In-Reply-To: <20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Today uvc_ctrl_set_handle() covers two use-uses: setting the handle and
clearing the handle. The only common code between the two cases is the
lockdep_assert_held.

The code looks cleaner if we split these two usecases in two functions.

We also take this opportunity to use pending_async_ctrls from ctrl where
possible.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 65 +++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 44b6513c526421943bb9841fb53dc5f8e9f93f02..26be1d0a1891cf3a9a7489f60f9a2931c78d3239 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1812,48 +1812,53 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
 	uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
 }
 
-static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl,
-			       struct uvc_fh *new_handle)
+static int uvc_ctrl_set_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
 {
-	lockdep_assert_held(&handle->chain->ctrl_mutex);
-
-	if (new_handle) {
-		int ret;
+	int ret;
 
-		if (ctrl->handle)
-			dev_warn_ratelimited(&handle->stream->dev->udev->dev,
-					     "UVC non compliance: Setting an async control with a pending operation.");
+	lockdep_assert_held(&handle->chain->ctrl_mutex);
 
-		if (new_handle == ctrl->handle)
-			return 0;
+	if (ctrl->handle) {
+		dev_warn_ratelimited(&handle->stream->dev->udev->dev,
+				     "UVC non compliance: Setting an async control with a pending operation.");
 
-		if (ctrl->handle) {
-			WARN_ON(!ctrl->handle->pending_async_ctrls);
-			if (ctrl->handle->pending_async_ctrls)
-				ctrl->handle->pending_async_ctrls--;
-			ctrl->handle = new_handle;
-			handle->pending_async_ctrls++;
+		if (ctrl->handle == handle)
 			return 0;
-		}
-
-		ret = uvc_pm_get(handle->chain->dev);
-		if (ret)
-			return ret;
 
-		ctrl->handle = new_handle;
-		handle->pending_async_ctrls++;
+		WARN_ON(!ctrl->handle->pending_async_ctrls);
+		if (ctrl->handle->pending_async_ctrls)
+			ctrl->handle->pending_async_ctrls--;
+		ctrl->handle = handle;
+		ctrl->handle->pending_async_ctrls++;
 		return 0;
 	}
 
+	ret = uvc_pm_get(handle->chain->dev);
+	if (ret)
+		return ret;
+
+	ctrl->handle = handle;
+	ctrl->handle->pending_async_ctrls++;
+	return 0;
+}
+
+static int uvc_ctrl_clear_handle(struct uvc_fh *handle,
+				 struct uvc_control *ctrl)
+{
+	lockdep_assert_held(&handle->chain->ctrl_mutex);
+
 	/* Cannot clear the handle for a control not owned by us.*/
 	if (WARN_ON(ctrl->handle != handle))
 		return -EINVAL;
 
-	ctrl->handle = NULL;
-	if (WARN_ON(!handle->pending_async_ctrls))
+	if (WARN_ON(!ctrl->handle->pending_async_ctrls)) {
+		ctrl->handle = NULL;
 		return -EINVAL;
-	handle->pending_async_ctrls--;
+	}
+
+	ctrl->handle->pending_async_ctrls--;
 	uvc_pm_put(handle->chain->dev);
+	ctrl->handle = NULL;
 	return 0;
 }
 
@@ -1871,7 +1876,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
 
 	handle = ctrl->handle;
 	if (handle)
-		uvc_ctrl_set_handle(handle, ctrl, NULL);
+		uvc_ctrl_clear_handle(handle, ctrl);
 
 	list_for_each_entry(mapping, &ctrl->info.mappings, list) {
 		s32 value;
@@ -2161,7 +2166,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
 
 		if (!rollback && handle && !ret &&
 		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
-			ret = uvc_ctrl_set_handle(handle, ctrl, handle);
+			ret = uvc_ctrl_set_handle(handle, ctrl);
 
 		if (ret < 0 && !rollback) {
 			if (err_ctrl)
@@ -3271,7 +3276,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
 		for (unsigned int i = 0; i < entity->ncontrols; ++i) {
 			if (entity->controls[i].handle != handle)
 				continue;
-			uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
+			uvc_ctrl_clear_handle(handle, &entity->controls[i]);
 		}
 	}
 

-- 
2.49.0.1015.ga840276032-goog


