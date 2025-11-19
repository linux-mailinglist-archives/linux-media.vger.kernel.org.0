Return-Path: <linux-media+bounces-47405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA5C70DEB
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 54FF44E56B5
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 19:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289FA373760;
	Wed, 19 Nov 2025 19:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RKgdZCMn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A54836C0DC
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 19:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581043; cv=none; b=mHNixlUXlvOEC6TpTOqzy2XOruH32sYMyEwbQagv1IHsxJRv0artpVyppoUm63AzZJybgDGYSid6Q3oiz7RwodUC5tmTnAlCQRcCTbzNrAgjQLt+UJz1cz+nDGhJbX+vw0rUNe/KKoadwqYAa0SVH/6liLjItdLUKubA7Nkm29Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581043; c=relaxed/simple;
	bh=z3RQnW9TDrjp6E3Mq0bkoasBNVPiwhP/q8Ly9/EmPiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i37ti02C7HYZ5loj//8mSoB4Y4XDb80S2pJRhEo4q3vmv9o8jgfwf4L0wo5qm1wxACuCn0RzWyNq11kXQFkTLpKHOABL7CP/BhiSMMsKgQpclZcbN73+MTq5RCoUbOjppfFxV5yvwTM5zWFzqCGRWQ3wkNkojR92PF79zF1fWpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RKgdZCMn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-591c98ebe90so38151e87.3
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 11:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763581036; x=1764185836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrRdO95H/URozAYz+64TTt354ty7fajzYMMZmV7FQXc=;
        b=RKgdZCMnx7ktpch36bi3jE5PERqDUycuqG/B37CeK5OYpVrq/P2i+zFX5GqlN9CUDy
         yPZcS6Y/RujgnNOyaBTCqcsuheUoiZgHXgZWVkItZC9WCNeZRfmjYA0DItuNu4dJY6fc
         kO00ZnZel8WbjVnxONdiYAhsD2r9DZcMB+VEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581036; x=1764185836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GrRdO95H/URozAYz+64TTt354ty7fajzYMMZmV7FQXc=;
        b=MKUviRKdZYe7VxEp6Nnnz/bdX70sYttklruONGaW5+1bvbK/+IJwUdhZ3URrMYs5SK
         C7K4nFkjyLFd3cA/yVkW/2kdFVUPJDNsrA4tRGFJFzc5JyDLPPuDqwaTuM3DWnWU2YRX
         sYRbp9JIsmw7jmIDwOUpmSKvDli0fkPf8BFG/Nd7jQyoC60UGHa96OrB4bxD9fywXXZ9
         hO7WH8Xh2T627bxeyoQSQd2uD/11XseOdO88RtKsqO92ZgYXc02RiaBkIAsYSgW6u7u6
         98WHuqMOsgxlIP97QUk20fMzuVjFsEa75uKi382zeHLU1Mh6TwjO8Gba+aa5fZS+Y0ZR
         3esA==
X-Gm-Message-State: AOJu0Yx69j9qU/J0GNMh8pJ8WV/LZoIiy5lYnHSuh6AMWEPE26FzxFt8
	8bwy5rsRzZMHbciaNpRIlmY7Ng127eIl9GaXfcmoSsGVwpMiv+wEklgFq5hWZ139mg==
X-Gm-Gg: ASbGncuSsjgsgeyC1R8xU0QaBPva67Eg3qITppqmzE6TfGkCPTJjxad24u9u+gQUE7E
	WTIjhesF4FNRSi/AjI4qzMO1Cagxx50vJinKUDn6OQ0IWXAqu+okDjjCE19fH9mLYV3nCiS1iof
	wiNzFH35rbZvIV3oUKpS2xbLokrxnAqJcZ1deI/RMx3k9+qded5P9TX1NHnXSSXwaGjUoPdlf+m
	M7CiOFOc2WS6UyGOY6DEsnZBqSNqTRsiOvUJ9/WzKXyVkQ77ZnxgcM1vBYwZc9ysVrebe07ara4
	zLegjv46nqjKGDjcCNq/1AVPwF9ORsOq1wB7W02bSDoZ5hfY2TT75APBs2fNA4OrAsIJfSSS3vy
	h+GzVelcP8FyYFqlfEsAgHhNaCwl+dCGIy0wYFkDe1d1ekaHIRM0O/c+drx9x8t9Rv2cJ4DKzbQ
	x6W2ycGfUCWYkGMdm0Z+QibIVU1ECqcu/bmmscnIaZF8/0CmHNMK4S+vDi7nIlgN79afX0MY0cq
	q8todmz5hQ=
X-Google-Smtp-Source: AGHT+IE1emsD2Tk2JI/OKbxlYKyMxpFXszRLd28cKQKy+3DQkGLpAlNNQrb7cXY68X+u3Kf/i8fXrQ==
X-Received: by 2002:a05:6512:1390:b0:594:33fc:d513 with SMTP id 2adb3069b0e04-5969e2d54e7mr30680e87.19.1763581035995;
        Wed, 19 Nov 2025 11:37:15 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbd15a1sm65790e87.98.2025.11.19.11.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:37:15 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 19 Nov 2025 19:37:14 +0000
Subject: [PATCH v2 5/6] media: uvcvideo: Introduce allow_privacy_override
 param
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-uvcdynctrl-v2-5-0359ffb98c9e@chromium.org>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
In-Reply-To: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Some camera modules have XU controls that can configure the behaviour of
the privacy LED.

Block mapping of those controls, unless the module is configured with
a new parameter: allow_privacy_override.

This is just an interim solution. Based on the users feedback, we will
either put the privacy controls behind a CONFIG option, or completely
block them.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c   | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c   |  7 +++++++
 drivers/media/usb/uvc/uvcvideo.h   |  2 ++
 include/linux/usb/uvc.h            |  4 ++++
 5 files changed, 71 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 57ce486f22bbc404a1f127539eb2d12373431631..d9cbb942f798dc7138608982a5d3e3ef9f8141f6 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2951,6 +2951,35 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
 	return ret;
 }
 
+bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector)
+{
+	/*
+	 * This list is not exhaustive, it is a best effort to block access to
+	 * non documented controls that can affect user's privacy.
+	 */
+	struct privacy_control {
+		u8 entity[16];
+		u8 selector;
+	} privacy_control[] = {
+		{
+			.entity = UVC_GUID_LOGITECH_USER_HW_CONTROL_V1,
+			.selector = 1,
+		},
+		{
+			.entity = UVC_GUID_LOGITECH_PERIPHERAL,
+			.selector = 9,
+		},
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(privacy_control); i++)
+		if (!memcmp(entity, privacy_control[i].entity, 16) &&
+		    selector == privacy_control[i].selector)
+			return true;
+
+	return false;
+}
+
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	struct uvc_xu_control_query *xqry)
 {
@@ -2995,6 +3024,15 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		return -ENOENT;
 	}
 
+	if (uvc_ctrl_is_privacy_control(entity->guid, xqry->selector) &&
+	    !uvc_allow_privacy_override_param) {
+		dev_warn_once(&chain->dev->intf->dev,
+			      "Privacy related controls can only be accessed if param allow_privacy_override is true\n");
+		uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Control %pUl/%u\n",
+			entity->guid, xqry->selector);
+		return -EACCES;
+	}
+
 	if (mutex_lock_interruptible(&chain->ctrl_mutex))
 		return -ERESTARTSYS;
 
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 71563d8f4bcf581694ccd4b665ff52b629caa0b6..c292bf8b6f57e9fdacee726285f5b46e638fd317 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -35,6 +35,7 @@ unsigned int uvc_hw_timestamps_param;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
+bool uvc_allow_privacy_override_param;
 
 static struct usb_driver uvc_driver;
 
@@ -2474,6 +2475,25 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
 module_param_named(timeout, uvc_timeout_param, uint, 0644);
 MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
 
+static int param_set_privacy(const char *val, const struct kernel_param *kp)
+{
+	pr_warn_once("uvcvideo: " DEPRECATED
+		     "allow_privacy_override parameter will be eventually removed.\n");
+	return param_set_bool(val, kp);
+}
+
+static const struct kernel_param_ops param_ops_privacy = {
+	.set = param_set_privacy,
+	.get = param_get_bool,
+};
+
+param_check_bool(allow_privacy_override, &uvc_allow_privacy_override_param);
+module_param_cb(allow_privacy_override, &param_ops_privacy,
+		&uvc_allow_privacy_override_param, 0644);
+__MODULE_PARM_TYPE(allow_privacy_override, "bool");
+MODULE_PARM_DESC(allow_privacy_override,
+		 "Allow access to privacy related controls");
+
 /* ------------------------------------------------------------------------
  * Driver initialization and cleanup
  */
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 03c64b5698bf4331fed8437fa6e9c726a07450bd..510cf47c86a62ba7fe3c7fa51be82c996cf37f9f 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -133,6 +133,13 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 		return -EINVAL;
 	}
 
+	if (uvc_ctrl_is_privacy_control(xmap->entity, xmap->selector) &&
+	    !uvc_allow_privacy_override_param) {
+		dev_warn_once(&chain->dev->intf->dev,
+			      "Privacy related controls can only be mapped if param allow_privacy_override is true\n");
+		return -EACCES;
+	}
+
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
 	if (map == NULL)
 		return -ENOMEM;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9a86d7f1f6ea022dace87614030bf0fde0d260f0..4b1a70e3100bbf2180411a865a89952a81d0f0a4 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -662,6 +662,7 @@ extern unsigned int uvc_clock_param;
 extern unsigned int uvc_dbg_param;
 extern unsigned int uvc_timeout_param;
 extern unsigned int uvc_hw_timestamps_param;
+extern bool uvc_allow_privacy_override_param;
 
 #define uvc_dbg(_dev, flag, fmt, ...)					\
 do {									\
@@ -792,6 +793,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
 
 void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
+bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector);
 
 /* Utility functions */
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index dea23aabbad48270c807463c1a7e1c0d1b79fc1f..70c2a7d2523611418aba363328f76667d379b571 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -49,6 +49,10 @@
 #define UVC_GUID_LOGITECH_PERIPHERAL \
 	{0x21, 0x2d, 0xe5, 0xff, 0x30, 0x80, 0x2c, 0x4e, \
 	 0x82, 0xd9, 0xf5, 0x87, 0xd0, 0x05, 0x40, 0xbd }
+#define UVC_GUID_LOGITECH_USER_HW_CONTROL_V1 \
+	{0x82, 0x06, 0x61, 0x63, 0x70, 0x50, 0xab, 0x49, \
+	 0xb8, 0xcc, 0xb3, 0x85, 0x5e, 0x8d, 0x22, 0x1f }
+
 
 /* https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls */
 #define UVC_MSXU_CONTROL_FOCUS			0x01

-- 
2.52.0.rc1.455.g30608eb744-goog


