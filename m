Return-Path: <linux-media+bounces-47231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F163DC6615D
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 21:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id B964F29A32
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 20:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA4433C525;
	Mon, 17 Nov 2025 20:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HYZxAWEg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D40533344E
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 20:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763410465; cv=none; b=j8qvrmIRBa/3uE7HIaUXBqDtCYG6xzHRI3ScKZBblu9YYro6omiO5SHDxxcDJozyqrXzObmQBe8E6OiEYRf036skkMMN6CJ3oEb+2XqvYZvsdxK+Tu7etc0IupFX2vchXG0D3enRH4Pp1hUO3YNedBVNHCbn4U5nT6pujoY4ef0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763410465; c=relaxed/simple;
	bh=lNuoYkLvd+eD46/OBdJpQ72e0YfFGIty3L9APEHHUsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3WK2ONKMtohD9SoCsDRSXK+JThiRsp/2BtnizQOwEfY83Ee7jOjJprmW1RxVRIU+u2b6e8p3SCDI1EKKMNz05qVK2BA7tX2IMlhcG2w8pPlBBWmvRitk4dW7019rutq94BqAVtAxfPXnuvEFQZdNaipbC1kUORLgqgCgYSGm+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HYZxAWEg; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37bac34346dso26370841fa.2
        for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 12:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763410461; x=1764015261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJ11MTmtpMbfLC31x15oun+LOtxDWcheLgXdGkh/tGo=;
        b=HYZxAWEgZ7WMoRNSOU9MWgT6li+Pi7wvVdaXS4PGcAS+AYoFG/qqIyMePAUyTzLdi+
         ZPQTch5BbsdjXMDLfqHQ9zWNzskw3+GFNWpx/otka1UwaLIdPT13fQ6R6PGk7cqp70SM
         0rgApnqQl6/c3LEAnK2jDXCSNWdrC65bPBm4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763410461; x=1764015261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJ11MTmtpMbfLC31x15oun+LOtxDWcheLgXdGkh/tGo=;
        b=r/+jgYwXm0gWgPRj0AJS4TiFQKKHK/xGKBFgvuZdF1To71c/lk0FZQUoAmXVGjygZw
         sxPKi0Dxq4rRlTpatLrcJ8kRTLtAK8ApYbD8Om5k5lE5jd0Cid5BEt9fFl2nX9t4Umes
         r2VeGNRci42+SfZ/TtGvB/0+Ui3c/kfmmBasF4iQDtxwSsQ1/mevWzLtkhd+13dIc1Zc
         5co8dxWJGe4T72jZX8/9ztI3tClZGmgrCOVxRjs1c1wlpeEwvvkDlywPuIq7WWlYXPlo
         7rDzqW5JfEQG0wJ/mbRBgDyE4N59WPoFfniW/5EajrEH0X5LsPS1rKQDvNP6EkFnuYRk
         BoAg==
X-Gm-Message-State: AOJu0YzR38iSVTRGMD1lGDVzkD2m5u0ZErrLSt/4HmEGlRf/whdL1A7J
	/xHPhyr5wdhr4FW/ojeLYW8F9RWAvbABZsHhArLEC3clYEEcg81fEUMAXArMZun5FDYOrIEwvP4
	GrORJVG5Z
X-Gm-Gg: ASbGncvFZPBZNuv8CItvJY++H+qEjhmjcsmhtngclNfW5aEPxpPieRwWJPii8YbOXHQ
	hPd0+y5ui+Q/53CmojYky/8qvCSSLP2OoGza1uvfC4OE8apViOwj3cMvxtd+LjTd+Eyx12YGuXd
	KmI8bV92V2sU1iuVliV2497fpm1a+qd1z+M3l17doZOFg1b+RmXB0VrzhaFqmW/Q6nuBtdPuki1
	unNCI605bUCTeJqq5l3gtKzE3hSzJSsMDMCV/y4N6KkIhUjKcxSXPWLYqYycMcF3KAscN9H5bFg
	cPkE2Ce3uzKckOh6XG84KhoKovQAV2Wk09/LDwZlUeRJdJYHJtdNEB932PaUbXUXrA9DEgKvdnZ
	rG7vB3IqHrw5V+dsoJxOL7UwXRRITv7SItXqpm5vdejmlxhNi3MT0Ce6HQf527Fg1nNqGqLlkoq
	dbhQNK4q0hGHLpZPEJb+Xj+q9XEfoXHKPW/X6apsrJ+5UKWDeTO40VuQ0UcYiKbZBBedpZp0Ok
X-Google-Smtp-Source: AGHT+IH/Si6c/IRfGlQZcmYGRMYCiNBeXJ2Mujhyi1F02SW3SKnVbJIOPFSmJ7DPN02kVq+M9GRlLA==
X-Received: by 2002:a05:6512:131c:b0:594:5ec5:8fec with SMTP id 2adb3069b0e04-595841ff9f5mr3977626e87.28.1763410461174;
        Mon, 17 Nov 2025 12:14:21 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003a4sm3413302e87.59.2025.11.17.12.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 12:14:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 17 Nov 2025 20:14:19 +0000
Subject: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
In-Reply-To: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
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

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c |  5 +++++
 drivers/media/usb/uvc/uvc_v4l2.c   | 32 ++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 include/linux/usb/uvc.h            |  4 ++++
 4 files changed, 42 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 71563d8f4bcf581694ccd4b665ff52b629caa0b6..d50c501121e6f774dfd6cfdb859279e0860d06a5 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -35,6 +35,7 @@ unsigned int uvc_hw_timestamps_param;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
+bool uvc_allow_privacy_override_param;
 
 static struct usb_driver uvc_driver;
 
@@ -2473,6 +2474,10 @@ module_param_named(trace, uvc_dbg_param, uint, 0644);
 MODULE_PARM_DESC(trace, "Trace level bitmask");
 module_param_named(timeout, uvc_timeout_param, uint, 0644);
 MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
+module_param_named(allow_privacy_override, uvc_allow_privacy_override_param,
+		   bool, 0644);
+MODULE_PARM_DESC(allow_privacy_override,
+		 "Allow UVCIOC_CTRL_MAP ioctl map privacy related control");
 
 /* ------------------------------------------------------------------------
  * Driver initialization and cleanup
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 03c64b5698bf4331fed8437fa6e9c726a07450bd..e067b8f38500299fe6acc7e3b9770f7374748823 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -18,6 +18,7 @@
 #include <linux/mm.h>
 #include <linux/wait.h>
 #include <linux/atomic.h>
+#include <linux/usb/uvc.h>
 
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
@@ -121,6 +122,32 @@ static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
 /* ------------------------------------------------------------------------
  * UVC ioctls
  */
+
+static bool uvc_is_privacy_mapping(struct uvc_xu_control_mapping *xmap)
+{
+	struct mapping {
+		u8 entity[16];
+		u8 selector;
+	} privacy_mappings[] = {
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
+	for (i = 0; i < ARRAY_SIZE(privacy_mappings); i++)
+		if (!memcmp(xmap->entity, privacy_mappings[i].entity, 16) &&
+		    xmap->selector == privacy_mappings[i].selector)
+			return true;
+
+	return false;
+}
+
 static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 				 struct uvc_xu_control_mapping *xmap)
 {
@@ -133,6 +160,11 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 		return -EINVAL;
 	}
 
+	if (uvc_is_privacy_mapping(xmap) && !uvc_allow_privacy_override_param) {
+		pr_warn_once("uvcvideo: Privacy related controls can only be mapped if param allow_privacy_override is true\n");
+		return -EINVAL;
+	}
+
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
 	if (map == NULL)
 		return -ENOMEM;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9a86d7f1f6ea022dace87614030bf0fde0d260f0..1895e4fe45e9c0246b7f0613dd2bc51f60b78759 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -662,6 +662,7 @@ extern unsigned int uvc_clock_param;
 extern unsigned int uvc_dbg_param;
 extern unsigned int uvc_timeout_param;
 extern unsigned int uvc_hw_timestamps_param;
+extern bool uvc_allow_privacy_override_param;
 
 #define uvc_dbg(_dev, flag, fmt, ...)					\
 do {									\
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index b939a01da11466747249c64c72a3ea40cd364a59..f2d6cf52427ce9c0a62a80ca3629c6e350fa02c8 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -41,6 +41,10 @@
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


