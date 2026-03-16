Return-Path: <linux-media+bounces-55919-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH8ZM30IuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55919-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:41:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53529A9EC
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B01373055FBB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B97C39C635;
	Mon, 16 Mar 2026 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EpUjj/sJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB10E39B4AF
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668093; cv=none; b=WxvNwVVO/Epl61gwCK03SVAYeRY7Mw9lbBLC5U907tvnyQYQrh8Hn97wINkimiHljY6iAqqqDZIDxuRolyWbX+OgvJxjERhIBX4bRnR7CZC7LAWo0bVnLPHGbbVhOSZ6M2X3VT41ZeKIVeCB3dPQ4HckQXnL+rmLjgEly+wXh8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668093; c=relaxed/simple;
	bh=t4X4K5vFnBQTTs4ZuZurlfNMkVH5xrm/oy3JiEkG6OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYUwmuN7SEy7wD/IkIC0GSyBOfeyherlQKmjJoB9k1QSk3D7xpx7jHeHmZ1PMJHl6P+epA6uR4odtos0hVYzFhPwSTrzm5ersqyPFdFIXiAVPFHQCY10npgeevqzXKGXyhBcshIryCZw4X1u+E54aVz1ttZkbCSB9L3coZUJtPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EpUjj/sJ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so5256059e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773668090; x=1774272890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAs/NGIMe6yEYwcK3Dv3ybFWLR+6vTJh3GyoeoXUzuc=;
        b=EpUjj/sJz9Ow3LOwmEtGX5lNS4FnjDMDQKj+Sb0YKUg7N0DGxo11T7kyuKmoXiOssr
         fp+9Fjb/6I2fPxZlCuuG/Txo/W/iUaI4nKu1ROQ3o3d9g4tF5/a6tBaMwaQtfi/9coz9
         /8VjzH4gXCWEfuEJAyfYxcnwOsEzxb5C08wns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668090; x=1774272890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yAs/NGIMe6yEYwcK3Dv3ybFWLR+6vTJh3GyoeoXUzuc=;
        b=sG/ftgDNN1FfgoYFp+vTVy4J0DfO+a/faFH7gT+IxCn/ta6ssCsMaGqhY5I4pLs1pU
         zaueGXiMIEtK7/hdNpge+JeSC1SHsJX0kdaJF1MxurJ6oZyiu4ZWggeyfBQqG64T5LoA
         gT6FnM45UcaUKeXCZZ/9bN4dGmrvNncg8YbOIOjC2JIBJz3zQzvJFN6hVTTJwDfl5R2A
         ciHZSnz0wc9yCCzK9kNgXj0QXrbgn2lxlbkRkvRybxjfx3qAHF9TLG/CMM+tZ9W90612
         SCnp2zaUhmo36e4tdFDxJdOVXbOVtal8cRtwGyskl2/l/R5I6k7u42e+seXRAxSOnwUL
         sg3w==
X-Gm-Message-State: AOJu0YxXa4BhHW/XHCjkTou7fdIJRR8BEDekrIoxGU4pqee+aG76y+cd
	5/UFqpbpHIlmnF7VOed+Oub5vvFLl8bt/c+L7dG49YaL0kvI1r/sy8l8+vrlyHV9fA==
X-Gm-Gg: ATEYQzxcg1K0zNwH2FBsHH62is7tQsh2roWhsBvj3XDdQ3Q9nGsOHNhRZd/Uprgb7dM
	C7IIXTaMe/TNqRzDYUjjlybiATTA8OhYTgAHRHcKSmA5gDqYYcHIbuEsKWqf4vPnDxtC1qUJebl
	o35bVBsfWmC1McdYUgC3VFxJH0lGPpRkSAwoIBmvLszZhlvkuY5ZVcAJYLHHRcNM3hU0owz4UZM
	vneUcbW+A3UeeRKNRWcvKmm57GV17QmImlUQnfx7xRziy9Zukj6jXYkg6/udegBQJiEjsKSHHAm
	KrCnZ5v2hxrWgOewU9M5KauVzJDNE2oyFB37iUxeKjppN9xvh76zzYQ7j/Ckcbw4RDU9Bv5wyf+
	LCSQXZvMwJeOP0RMitQzAdaGM3rUv3pqNH7pVTXlpYMgdDUDkAyDjhYivTB2/rxvVNDW/b3x7jN
	Um/775pgKjdt1UW8Idoz20zTKphaTf2u/Lzx4cThzyqxFPz6v0MZsZ3UqBSuDabvXK7NUVzznCL
	A==
X-Received: by 2002:a05:6512:10d1:b0:5a1:3e69:b186 with SMTP id 2adb3069b0e04-5a1629f4182mr4265107e87.19.1773668089954;
        Mon, 16 Mar 2026 06:34:49 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a7fsm3481473e87.76.2026.03.16.06.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:34:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Mar 2026 13:34:47 +0000
Subject: [PATCH v3 4/4] media: uvcvideo: RFC: Convert
 allow_privacy_override into Kconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-uvcdynctrl-v3-4-19cd4657e1f3@chromium.org>
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
In-Reply-To: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55919-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6F53529A9EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 579532272fd6..7c0f2260d135 100644
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
index 3ca108b83f1d..c9c195974765 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3075,9 +3075,9 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	}
 
 	if (uvc_ctrl_is_privacy_control(entity->guid, xqry->selector) &&
-	    !uvc_allow_privacy_override_param) {
+	    !IS_ENABLED(CONFIG_USB_VIDEO_CLASS_ALLOW_PRIVACY_OVERRIDE)) {
 		dev_warn_once(&chain->dev->intf->dev,
-			      "Privacy related controls can only be accessed if module parameter allow_privacy_override is true\n");
+			      "Privacy related controls can only be accessed if CONFIG_USB_VIDEO_CLASS_ALLOW_PRIVACY_OVERRIDE is true\n");
 		uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Control %pUl/%u\n",
 			entity->guid, xqry->selector);
 		return -EACCES;
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 74c9dea29d36..b0ca81d924b6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -36,7 +36,6 @@ unsigned int uvc_no_drop_param = 1;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
-bool uvc_allow_privacy_override_param;
 
 static struct usb_driver uvc_driver;
 
@@ -2506,25 +2505,6 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
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
index 6d4f027c8402..f83abbd13aca 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -134,9 +134,9 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 	}
 
 	if (uvc_ctrl_is_privacy_control(xmap->entity, xmap->selector) &&
-	    !uvc_allow_privacy_override_param) {
+	    !IS_ENABLED(CONFIG_USB_VIDEO_CLASS_ALLOW_PRIVACY_OVERRIDE)) {
 		dev_warn_once(&chain->dev->intf->dev,
-			      "Privacy related controls can only be mapped if module parameter allow_privacy_override is true\n");
+			      "Privacy related controls can only be mapped if CONFIG_USB_VIDEO_CLASS_ALLOW_PRIVACY_OVERRIDE is true\n");
 		return -EACCES;
 	}
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 362110d58ca3..2898384d5f78 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -664,7 +664,6 @@ extern unsigned int uvc_no_drop_param;
 extern unsigned int uvc_dbg_param;
 extern unsigned int uvc_timeout_param;
 extern unsigned int uvc_hw_timestamps_param;
-extern bool uvc_allow_privacy_override_param;
 
 #define uvc_dbg(_dev, flag, fmt, ...)					\
 do {									\

-- 
2.53.0.851.ga537e3e6e9-goog


