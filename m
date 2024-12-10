Return-Path: <linux-media+bounces-23007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E659EACCE
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83809188CC75
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BD9215778;
	Tue, 10 Dec 2024 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZBVm9jsu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6E22153DD
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733823779; cv=none; b=U0I0lBHjPPvXaP06To1q8ztmLofVjqEmF3LE0yu+dnhSCQ0+UtiAyTA7OQT5nmD9WFpasU2XRb1vHwDoEgtxRM0B71uGeeZtoGQM/8mw4bJvzVN+FSnWQexMNUxGMj8MKcl17PkO8N++h5nIesAhbJ7eBXIPTVyMKxt0h0P8ZkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733823779; c=relaxed/simple;
	bh=GtKZpTsdb2dvroqPwQk6P+D+VqxjXsWA4K0LgOtCk+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVVkfCZc9xZbI/g1xswUWNARfFBS9m68gWfONVARB3S47xdfLVqPCUsw6GT+G0829DhV3YLAxOKhwAZCRy9Yvx6hd3hSEszU+qTIFDKbVbvkfZzke1eSUrZGi4QVC+zAeJKDV40989uxXCqwmrCCY3QP5kqfyC2iFq+SmYuSyGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZBVm9jsu; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d89a727a19so56024256d6.0
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733823776; x=1734428576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUxdbTzsjHBE16Atfsk1TxmxgMhTKgD4TgYnLbGJtwM=;
        b=ZBVm9jsuunPVsO/Npib35CfvTPs3OhsMfqN+toWkr/11DzcCrRPTqAMtzETwgq4uaB
         FeQJ+WyEYzwjy2rdrHy+57nb6dElitH9qoD8haPbmlEA3jNDZEu+NdIEdVubkKtZQanf
         uM1qvnkk5BJ6RKGAvhd6bg2yxMwqvuF8KUefw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823776; x=1734428576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUxdbTzsjHBE16Atfsk1TxmxgMhTKgD4TgYnLbGJtwM=;
        b=gqQriU8rcUjHRQbY7QADoYMWI78qPEsZL6gU6XvXIU3lNYMCcV92DjM9tXVUNLn8CH
         qWfGRvFI3ycxsLtPQtQ2omOSoXqhac3029u6I2LqNfYTh4taI8/syhozipDbNPPOyzQe
         yN0ueGuc2uNzFVNL6w2OYRUEIFa36HwnyruGWiHR1VGGgfMislEfyFvwOBLBekIpPFh1
         476ZOkla4cuNACJ47s9nU/WjVxf4CcLe3dM1YHLZA7/K34kb1UkgQ+GSEseiC24gXkUc
         wGseaWRa39+bUzcRXCVwY5cLmYwl9WCYfWy1UxrsnPT14d40kH51jKkaEU1fhRc9EN2I
         skaA==
X-Forwarded-Encrypted: i=1; AJvYcCXlwtQRl35gaMO4OIzOy/RU2lM0AtI5yqu3mfiWsad2vPrn8y3JSK9RReiO0BSryU4D0R9eCAm2QSeCTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW8pRc6nzB4z8vN2kKOSedh5RM7RlfrjMctAx66a5Q581f0vjP
	5ymHv/Wewk1XfD+rj4OOFaM4qebN9TWnIDr5iThPgKy8uy3sGh/RmTTi4cxHLQ==
X-Gm-Gg: ASbGncs90vjM+gWvRc6yjSfFtZdo0ZecH18xVgLr7DeSKghsWBEMXAyuA7FvHIjmUJn
	k8Lt7SP0F3bSHZC+z7MhMCEl7+UhGY06cCxh+VKhy/koRqGY+fMd5Sm1pNZmTD7NzKbMTkc0wf7
	fNjKd8rY8DtiH5jnZv/cLtQifjdNFuu7VWBtMdelWQIyRT77uXHlR8oBKzh/UrfU2b++lCmZoyu
	oArXpJ81E4+QQHzbMMHnHXQRLGmYz+G9dVQOYo2QxjDfKcTI9tObV34IKuYaFnV0sYUXCkuBeA7
	X+158n6O6QXEzfnxeJjJ90g5LVit
X-Google-Smtp-Source: AGHT+IFR79c6AfufLGPoblEmwJJEzbibgTXgjSFkUykGZ8Cp3S6Wc8BlYkoUbuSlrw6WDQWkP0jUow==
X-Received: by 2002:ad4:5c49:0:b0:6d9:dd:5c5a with SMTP id 6a1803df08f44-6d9213c2296mr47786416d6.23.1733823776610;
        Tue, 10 Dec 2024 01:42:56 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d92f7c2bc1sm773326d6.83.2024.12.10.01.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:42:56 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:42:43 +0000
Subject: [PATCH v16 07/18] media: uvcvideo: refactor uvc_ioctl_g_ext_ctrls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-uvc-roi-v16-7-e8201f7e8e57@chromium.org>
References: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
In-Reply-To: <20241210-uvc-roi-v16-0-e8201f7e8e57@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Yunke Cao <yunkec@google.com>
X-Mailer: b4 0.13.0

We want to support fetching the min and max values with g_ext_ctrls,
this patch is a preparation for that.

Instead of abusing uvc_query_v4l2_ctrl(), add an extra parameter to
uvc_ctrl_get, so it can support fetching the default value.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 21 ++++++++++++++++++---
 drivers/media/usb/uvc/uvc_v4l2.c | 28 +++++++++++-----------------
 drivers/media/usb/uvc/uvcvideo.h |  3 ++-
 3 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 987a9700bed9..12ce7e38d6f6 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1908,8 +1908,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 	return ret;
 }
 
-int uvc_ctrl_get(struct uvc_video_chain *chain,
-	struct v4l2_ext_control *xctrl)
+int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
+		 struct v4l2_ext_control *xctrl)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
@@ -1921,7 +1921,22 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
 	if (ctrl == NULL)
 		return -EINVAL;
 
-	return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	switch (which) {
+	case V4L2_CTRL_WHICH_CUR_VAL:
+		return __uvc_ctrl_get(chain, ctrl, mapping, &xctrl->value);
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		if (!ctrl->cached) {
+			int ret = uvc_ctrl_populate_cache(chain, ctrl);
+
+			if (ret < 0)
+				return ret;
+		}
+		xctrl->value = mapping->get(mapping, UVC_GET_DEF,
+					    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
+		return 0;
+	}
+
+	return -EINVAL;
 }
 
 int uvc_ctrl_set(struct uvc_fh *handle,
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 97c5407f6603..02fd5cbc3474 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1078,34 +1078,28 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	struct uvc_video_chain *chain = handle->chain;
 	struct v4l2_ext_control *ctrl = ctrls->controls;
 	unsigned int i;
+	u32 which;
 	int ret;
 
+	switch (ctrls->which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+	case V4L2_CTRL_WHICH_CUR_VAL:
+		which = ctrls->which;
+		break;
+	default:
+		which = V4L2_CTRL_WHICH_CUR_VAL;
+	}
+
 	ret = uvc_ctrl_check_access(chain, ctrls, VIDIOC_G_EXT_CTRLS);
 	if (ret < 0)
 		return ret;
 
-	if (ctrls->which == V4L2_CTRL_WHICH_DEF_VAL) {
-		for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-			struct v4l2_queryctrl qc = { .id = ctrl->id };
-
-			ret = uvc_query_v4l2_ctrl(chain, &qc);
-			if (ret < 0) {
-				ctrls->error_idx = i;
-				return ret;
-			}
-
-			ctrl->value = qc.default_value;
-		}
-
-		return 0;
-	}
-
 	ret = uvc_ctrl_begin(chain);
 	if (ret < 0)
 		return ret;
 
 	for (i = 0; i < ctrls->count; ++ctrl, ++i) {
-		ret = uvc_ctrl_get(chain, ctrl);
+		ret = uvc_ctrl_get(chain, which, ctrl);
 		if (ret < 0) {
 			uvc_ctrl_rollback(handle);
 			ctrls->error_idx = i;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 07f9921d83f2..6ebaabd11443 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -788,7 +788,8 @@ static inline int uvc_ctrl_rollback(struct uvc_fh *handle)
 	return __uvc_ctrl_commit(handle, 1, NULL);
 }
 
-int uvc_ctrl_get(struct uvc_video_chain *chain, struct v4l2_ext_control *xctrl);
+int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
+		 struct v4l2_ext_control *xctrl);
 int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl);
 int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
 			   const struct v4l2_ext_controls *ctrls,

-- 
2.47.0.338.g60cca15819-goog


