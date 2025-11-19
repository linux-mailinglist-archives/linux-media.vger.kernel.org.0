Return-Path: <linux-media+bounces-47406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF9C70D9B
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id BA6112F987
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 19:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C681E377E97;
	Wed, 19 Nov 2025 19:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YJGq39dQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040AE3064AA
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 19:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581046; cv=none; b=tS9g7xv9546c0ved/MMcwksqFFmcXhYdgIO9YwRyjzDMTJlJ2fEXBWd2Q7tCn8trIC0AVamKQQmJI2nFuIHUJr4sFPuaUwZEfjAUn3RP91MDD8eSxCeGMhVVlY5oQtX3N24Olw64STak7JUDIrcSVh64NJ2SLYF4qvigTgaS5mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581046; c=relaxed/simple;
	bh=XDj9ocTyx9oryYDrbjArgB3LC+yDZJXak7E+MwK0LjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RhNlUnzboIkKf+ZXoiz1/Vly2dBcMLJiGwiTqdbKSao5rXFpjjgRbGT1zJ8lIZX+rSDBSQRwJBLF2g+mDCGc86Hl8oc9pkGMMJ+TKaCf/LHJrWrHAQFvjWBdIXgmZD5ymIP7qtVinBpAEJJe7cIipMvW8vkK7mpckm2z9A5GDB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YJGq39dQ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5958232f806so50672e87.0
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 11:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763581037; x=1764185837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5eTj0Zl9H6KKr2E/V9bLoQx3up36sHhHmEcBFbvIkE=;
        b=YJGq39dQv06n1uhvZK0GT7nUQuX1cyNATq3oqw436i21CDPryjgXqYcfaOw5GJ6SFO
         3KmQw2xPYGFrxajojSEebU64Qwv0OCptr/GKKj+js8UzPA2z5H47zRFYOCzWrEyw4GQ+
         12s/H8z8eaE85+urKEB6c0VDiyPZel2FBIawA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581037; x=1764185837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i5eTj0Zl9H6KKr2E/V9bLoQx3up36sHhHmEcBFbvIkE=;
        b=lCLWS1aiPUqYrMnuZf7T7khybBrtaOn45Sza6S++yEP8mNGgO3k85FLPix5cUIsFso
         CSoBul1Ky94X0EfwpSyCZQF3sxETG3hTFKBPhQl1yRVMs1kcjfjxl0mKCgnfbLv1tji1
         FSxqGVPb0j4SI40mYygFnuyKR7s1XAgXjzrz0LaxVWDhwgpVxNEuuxXRzkTkylosy0ee
         GRk9ehO7ELOLWp7rcXa7xu6pZn4Z7oZcsDbl5dG45BGyvDklxmNHxTfuSc7sdFyWkfO/
         wMpUct4H9IPbtLXkFSgLFO5+iFYi7nxKahoQwwrSUMjQa2zAd1zUwIKLZ5bAw2pNFXiI
         NsZA==
X-Gm-Message-State: AOJu0Yxxlw/t4lpo4HWv4AovBLnQcrCTCZU01NjfODXl8sk+WCLl2NKh
	ChrNIoKeptAMdnmwSrQqtrR398fjdXotRGgl1djuAZnQ/1uUYwLdOYv17fZN8T+GQA==
X-Gm-Gg: ASbGnct78Kkbt9Gcps/lpDwME5R0HhMXiKBIjfqLfMl3VctqzJixpaTzWMnc+uGVgiT
	uTqkFL02DjAUsBG47k6l0QSSYBk6h3hbU97jMfdaH1ZbA2dGcwcc6PEvoljMV7OXCQPBv4P8DMx
	Ij2hwfHZKQ06ZRU3tnzNhHy4B1Rq1p3x4Y6BDBVH9EnpEjxN5znJG8IDYU0eR395VqCJI5I8RY2
	LxefrFWV7OPoOLFdgFVg/DH1ftpMgpo8mmsMHzLHiXUiOS8t+Hni8KCqBqQRif7lRcODpsDYdsg
	qRy/uCXvwvif3gMlFZujs4JMYjTXHVMoG7uSS8IT9c1mfy8BVEvnK20urFpYbxUqEqKwiVIv7UA
	Z14lbC/zxJgUVSUydZNXoB2ydn/2PTb1eu3S/GhbmMzXaJ8xcyrzd1fK1GXtIvclIRR//BgikrL
	+BJdsvAr5W3so2MCL/bQI/3+GEizlRgPipPRL9C06EBMUzqMnt45dyIkRuLsQ8gM8BVSnkuhqwz
	8fXyjrWNJ4=
X-Google-Smtp-Source: AGHT+IERHHkbtKXSw+15NY4svW/rWIoMgO85bCSSYZTk1S6xodaPy31Swm4Ot1JpvrPQxRHT3dqImQ==
X-Received: by 2002:a05:6512:3d91:b0:594:25c9:2c6e with SMTP id 2adb3069b0e04-5969e2f6338mr25386e87.25.1763581037401;
        Wed, 19 Nov 2025 11:37:17 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbd15a1sm65790e87.98.2025.11.19.11.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:37:16 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 19 Nov 2025 19:37:15 +0000
Subject: [PATCH v2 6/6] media: uvcvideo: RFC: Convert
 allow_privacy_override into Kconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-uvcdynctrl-v2-6-0359ffb98c9e@chromium.org>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
In-Reply-To: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

This patch is just shared for discussion purposes! Do not land.

In a perfect world, after a deprecation process, we will be able to
remove allow_privacy_override and block all privacy related controls.

If there is any usecase out in the field that resists, we shall move it
into a Kconfig.

This patch shows how the transition to Kconfig can look.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/Kconfig      | 11 +++++++++++
 drivers/media/usb/uvc/uvc_ctrl.c   |  4 ++--
 drivers/media/usb/uvc/uvc_driver.c | 20 --------------------
 drivers/media/usb/uvc/uvc_v4l2.c   |  4 ++--
 drivers/media/usb/uvc/uvcvideo.h   |  1 -
 5 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/media/usb/uvc/Kconfig b/drivers/media/usb/uvc/Kconfig
index 579532272fd6d7a8ef65c1a3a892b723f40e584e..7c0f2260d1357cc4f27fa63d90c42f61afd92da9 100644
--- a/drivers/media/usb/uvc/Kconfig
+++ b/drivers/media/usb/uvc/Kconfig
@@ -20,3 +20,14 @@ config USB_VIDEO_CLASS_INPUT_EVDEV
 	  to report button events.
 
 	  If you are in doubt, say Y.
+
+config USB_VIDEO_CLASS_ALLOW_PRIVACY_OVERRIDE
+	bool "Allow overriding the privacy controls"
+	default n
+	depends on USB_VIDEO_CLASS && BROKEN
+	help
+	  If this option is enabled, the privacy related controls, such as
+	  the ones controlling the privacy LED will be accessible from
+	  userspace.
+
+	  If you are in doubt, say N.
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d9cbb942f798dc7138608982a5d3e3ef9f8141f6..c41724a342e57f64f3c10af9752bd45209f80e36 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3025,9 +3025,9 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	}
 
 	if (uvc_ctrl_is_privacy_control(entity->guid, xqry->selector) &&
-	    !uvc_allow_privacy_override_param) {
+	    !IS_ENABLED(CONFIG_USB_VIDEO_CLASS_ALLOW_PRIVACY_OVERRIDE)) {
 		dev_warn_once(&chain->dev->intf->dev,
-			      "Privacy related controls can only be accessed if param allow_privacy_override is true\n");
+			      "Privacy related controls can only be accessed if CONFIG_USB_VIDEO_CLASS_ALLOW_PRIVACY_OVERRIDE is true\n");
 		uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Control %pUl/%u\n",
 			entity->guid, xqry->selector);
 		return -EACCES;
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index c292bf8b6f57e9fdacee726285f5b46e638fd317..71563d8f4bcf581694ccd4b665ff52b629caa0b6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -35,7 +35,6 @@ unsigned int uvc_hw_timestamps_param;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
-bool uvc_allow_privacy_override_param;
 
 static struct usb_driver uvc_driver;
 
@@ -2475,25 +2474,6 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
 module_param_named(timeout, uvc_timeout_param, uint, 0644);
 MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
 
-static int param_set_privacy(const char *val, const struct kernel_param *kp)
-{
-	pr_warn_once("uvcvideo: " DEPRECATED
-		     "allow_privacy_override parameter will be eventually removed.\n");
-	return param_set_bool(val, kp);
-}
-
-static const struct kernel_param_ops param_ops_privacy = {
-	.set = param_set_privacy,
-	.get = param_get_bool,
-};
-
-param_check_bool(allow_privacy_override, &uvc_allow_privacy_override_param);
-module_param_cb(allow_privacy_override, &param_ops_privacy,
-		&uvc_allow_privacy_override_param, 0644);
-__MODULE_PARM_TYPE(allow_privacy_override, "bool");
-MODULE_PARM_DESC(allow_privacy_override,
-		 "Allow access to privacy related controls");
-
 /* ------------------------------------------------------------------------
  * Driver initialization and cleanup
  */
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 510cf47c86a62ba7fe3c7fa51be82c996cf37f9f..d52497d68b910553f385b1b41ec5c4eecb915743 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -134,9 +134,9 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 	}
 
 	if (uvc_ctrl_is_privacy_control(xmap->entity, xmap->selector) &&
-	    !uvc_allow_privacy_override_param) {
+	    !IS_ENABLED(CONFIG_USB_VIDEO_CLASS_ALLOW_PRIVACY_OVERRIDE)) {
 		dev_warn_once(&chain->dev->intf->dev,
-			      "Privacy related controls can only be mapped if param allow_privacy_override is true\n");
+			      "Privacy related controls can only be mapped if CONFIG_USB_VIDEO_CLASS_ALLOW_PRIVACY_OVERRIDE is true\n");
 		return -EACCES;
 	}
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 4b1a70e3100bbf2180411a865a89952a81d0f0a4..5da219e1c6ac89e89a1658f1126bfa292876d55f 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -662,7 +662,6 @@ extern unsigned int uvc_clock_param;
 extern unsigned int uvc_dbg_param;
 extern unsigned int uvc_timeout_param;
 extern unsigned int uvc_hw_timestamps_param;
-extern bool uvc_allow_privacy_override_param;
 
 #define uvc_dbg(_dev, flag, fmt, ...)					\
 do {									\

-- 
2.52.0.rc1.455.g30608eb744-goog


