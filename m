Return-Path: <linux-media+bounces-21419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A86889C922B
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68652280E2C
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784021AE006;
	Thu, 14 Nov 2024 19:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eBPAhNmN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A321AB6ED
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611454; cv=none; b=i9SiV8F+Ksd2PBWBrcCzhuDbSuv4kt0gDXQsO5YIULsPwuJtYqrzW4EKd//eoSTi+bMVz6UWCIpEy/OJ7beUXES38JO7Arfi9JHvi4DZ+gnf0l9u16ZGmOnSpWGhqU3UngSO/HIYagCRFoIRnxOIMiUlFjGkxms3MSYF1BTfVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611454; c=relaxed/simple;
	bh=aivOJ+nhVk++XVwDmChI0xJhucq0gzquyrqV4wPEJLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QiiYBJkyFSS0O0vWV18UvuEy+CpCCUWglAP/Gsgzdx2Z7/OEYoniHXl2PvYVB8OuAHjH4rRRQDY4/ubWVLC8OiAvcD6BOumOZlx5n7VEvuKWJqAX4JRoLPJf79WQYdvYvULEy58poQUz0FQFgU9mZhdi+8Ie5+JfusX5xDmPXpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eBPAhNmN; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cbd550b648so5833116d6.0
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611452; x=1732216252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+t1HpWfn8XfUwUDY3vH72Vh4+vht6oJzl9J9rxV/wc=;
        b=eBPAhNmNsSwVZ94pu5nOo4lOfzYmOLM1QEEKY3nY+RfWv84+ddl+r1FTpPvf6XzWQv
         ThHaIxfa50grt3WXmr96eIZDIMQgkVV9PuFR3i6angOfe48YZyhdChMuOAI72ySshzim
         Yfz2sb55cuwFP7AuGcgyMQlV766Wn2AmuoL3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611452; x=1732216252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+t1HpWfn8XfUwUDY3vH72Vh4+vht6oJzl9J9rxV/wc=;
        b=PhtEN78/FyXSq3HFfbLhcrCiaJkoiICJU2THQbOOyhw/TE62Ia6XHc5NTxhCJAsFw7
         JXcFVPJg/sjh49v4T6+jQDzbP6IyNk11Of4Ueu3wJFWtqwEuDTXCPvuubP9GsYA+NMSD
         5GHZjGFvqg/rqAEXNI0OX3sFUJHaGiuSE91gzSFw3QoZ4+umW/NtDtdvRzDjNKzzx+Qs
         k+gCXxNGSFf9MK9RTDguW1oIDTvEMHAQt8Jk1J56mOSYCRBqjTDMN/nF/NtC2aVGZP5k
         c7wnUtLgcQTKvitvsFFYVtkKOG2zNMeXphZYqiqOhlREtaBFm/X21i1rHW8qWIt6tb3D
         SnDg==
X-Forwarded-Encrypted: i=1; AJvYcCVAJL/2H1zBjMZbtL9q/hafMeVIXNr0ljXfwWsT4PO8ql4us1cfLj/RFjwhnh3kxfg1794Nj8WDR70Bzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkTB/L9IiX19UpaljmAiPhhsN12Zd+Fc6tRsaynnluhcNcEzi/
	sXvrFSF2BHwJggVbz9KSBuu5HYw6wrIjk44Brfpt9hU7MqCE+JgTIIgnc/03cA==
X-Google-Smtp-Source: AGHT+IEex+DoUGm8txDsQ+O5LFK9oysSR8094coj0M6PtiSGgzitE5xIRuCfwOw8ppjTuKj2ETwuhQ==
X-Received: by 2002:a0c:f413:0:b0:6d3:5187:bcf8 with SMTP id 6a1803df08f44-6d3edcdc541mr30747576d6.17.1731611451781;
        Thu, 14 Nov 2024 11:10:51 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:10:51 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:36 +0000
Subject: [PATCH v15 07/19] media: uvcvideo: refactor uvc_ioctl_g_ext_ctrls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-uvc-roi-v15-7-64cfeb56b6f8@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

We want to support fetching the min and max values with g_ext_ctrls,
this patch is a preparation for that.

Instead of abusing uvc_query_v4l2_ctrl(), add an extra parameter to
uvc_ctrl_get, so it can support fetching the default value.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 21 ++++++++++++++++++---
 drivers/media/usb/uvc/uvc_v4l2.c | 28 +++++++++++-----------------
 drivers/media/usb/uvc/uvcvideo.h |  3 ++-
 3 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index c975e0ab479b..d6afa131a5e1 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1902,8 +1902,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 	return ret;
 }
 
-int uvc_ctrl_get(struct uvc_video_chain *chain,
-	struct v4l2_ext_control *xctrl)
+int uvc_ctrl_get(struct uvc_video_chain *chain, u32 which,
+		 struct v4l2_ext_control *xctrl)
 {
 	struct uvc_control *ctrl;
 	struct uvc_control_mapping *mapping;
@@ -1915,7 +1915,22 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
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


