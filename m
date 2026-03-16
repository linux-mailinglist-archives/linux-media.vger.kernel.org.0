Return-Path: <linux-media+bounces-55918-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ez8D6sHuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55918-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:37:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0014729A92C
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 574F4303E6B9
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1B239A04A;
	Mon, 16 Mar 2026 13:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OiceH/G3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004BF39A072
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668092; cv=none; b=jHs3to/qgP+0x9YwN5tIhXRf549MKkyXRsrHPK/Uv+gbFQkvwqIZwVzpqdZ/EdIy/C1C8S7u1LO0ssMkaHmWBJ5lznW/YX7fMHwp8PNn0oHaix78zRTT9HxWUO34aVl3igOYPeSQTn7DJHuyv45adiv3I1hflVqCKa0sc6VvhXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668092; c=relaxed/simple;
	bh=ZqtbkN9X0RvpKTXiACrFylvAxPZu6LxQ+9wsTyXgq08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kaey7bHTIb5OzgixJV66UkbN2zmJ5pwun0VJZwAm++4YB9zhVhGIcaPji1OWbW6ojM0r3BQ6Ar+rsjlpEl7BRMsrKPh9J6xtINt9mU3R7i0MwuPNkCrDNpyupslv2yI9UOzvJ8AeqlhMN0i+eZLYN+RTo4FGKiSbiXmFEnkI7bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OiceH/G3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dea72099eso4843365e87.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773668089; x=1774272889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bVigAWa0kFOUeMtknvqHxM/1nuFW2KCUzcM3K92o58=;
        b=OiceH/G3ab3NHy4p9dksCLz87q+QYv+FiEsntgzWKueMN5vYbyP9orrP9UX2Xzto0u
         LDoVdTrPD9WdPgiscOumwGAW8wmTPpwM8t2Mmy1IRQLVP3iR0TcfFxvibHh+wdO4PjFn
         r3qFu2eI1CszRbOqG6Cx3dhTnfug9ZbmS3SsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668089; x=1774272889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6bVigAWa0kFOUeMtknvqHxM/1nuFW2KCUzcM3K92o58=;
        b=im9DPYnAoXnyc2SxnahxmBOwOApt2o+5mzdFnH16COzabyuCFioFQZBMpNQndQpiNd
         Gm4tT9Hlm1Dg+z8w2wAtL2/SolcBFx6h9rS4CL6tCtKNckhp1EKoLyEr9AQFeTtS/aZS
         /caVMNxkONumzCoCdliNPZ/WqTUTE3x8iKGw6mSTDmq7rjv+6caqR80U6ZU4Jqwcu0wC
         oxSrMRraEBFT8LqYSxmtnbUEiLG9DBTHnRiYVaSJtpRrAfoXLcMnjXWQ5Y6yImCGcpTV
         WyyvVnPOfdnmJOWIbk0iwvIgcAJSZHotvQHW2mEm+YaH8FKpBfDsog3wAIKPRL6fTdUH
         sLfQ==
X-Gm-Message-State: AOJu0YzxPxX6bOf9RYcbrYe/1hc1qJM6bSmm81JLvsskEQ5t4zeoxjaZ
	Gx7yMw2u7cJ6R1WkMFkeyJ56cjKIFHAfglbyKWAO3YAwhp53uNvdgn/gjcjHKLKsXA==
X-Gm-Gg: ATEYQzwk/iP5VmA3n+QyA5ciah7NQnaWHH0rrZZbqFC9kJwnmvYjCNGuWT4eudeQ/KS
	kxRnhp8JnOcAYU0wwxi2Ivd/HOaxbb4KCMw7L70AmwpCVRd09nz5m4lSYoU/wUNuSDQ7Px5DG8F
	OpWFq3jcXn2hE3pQJQknEIJnuaDG2EDt7D1dprccr2Y4v643YZ1NcH4nIrb9ZRilW4LqFWEZIyd
	dmUyNyxhBGsLegAUkrzC7gbi37qIl4OHQXdVZ1PhqV0RVHG1qsjul6l6Qc0+0Tb0kmdTI7A5lrr
	yTlj1CzCOFtz3s3JCPJw8d/DfNT7zB59YF5UvmdIrgY5TSXon+SoPKfOSptLCUPdDBvln+/Yn58
	PBVnhr9BuWcqqtzZ94rvhlij1H20V0Yd/2gvfkN4Osrr2u+yXIssIuJNj7bkipYavecq6dqh2qL
	M7Ze0lpds6UnGu9voo6jjf3JB9Rzkt8jUlCTdxM5Nqxxn6x/eVwsz73VADR6tciQ9ugOwBWWMns
	w==
X-Received: by 2002:ac2:50a5:0:b0:5a1:1496:920 with SMTP id 2adb3069b0e04-5a162b124bamr3566254e87.26.1773668089070;
        Mon, 16 Mar 2026 06:34:49 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a7fsm3481473e87.76.2026.03.16.06.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:34:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Mar 2026 13:34:46 +0000
Subject: [PATCH v3 3/4] media: uvcvideo: Introduce allow_privacy_override
 module parameter
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55918-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,chromium.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0014729A92C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index b6e020b41671..3ca108b83f1d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3001,6 +3001,35 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
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
@@ -3045,6 +3074,15 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		return -ENOENT;
 	}
 
+	if (uvc_ctrl_is_privacy_control(entity->guid, xqry->selector) &&
+	    !uvc_allow_privacy_override_param) {
+		dev_warn_once(&chain->dev->intf->dev,
+			      "Privacy related controls can only be accessed if module parameter allow_privacy_override is true\n");
+		uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Control %pUl/%u\n",
+			entity->guid, xqry->selector);
+		return -EACCES;
+	}
+
 	if (mutex_lock_interruptible(&chain->ctrl_mutex))
 		return -ERESTARTSYS;
 
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index b0ca81d924b6..74c9dea29d36 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -36,6 +36,7 @@ unsigned int uvc_no_drop_param = 1;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
+bool uvc_allow_privacy_override_param;
 
 static struct usb_driver uvc_driver;
 
@@ -2505,6 +2506,25 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
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
index f9049e9c0d3a..6d4f027c8402 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -133,6 +133,13 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 		return -EINVAL;
 	}
 
+	if (uvc_ctrl_is_privacy_control(xmap->entity, xmap->selector) &&
+	    !uvc_allow_privacy_override_param) {
+		dev_warn_once(&chain->dev->intf->dev,
+			      "Privacy related controls can only be mapped if module parameter allow_privacy_override is true\n");
+		return -EACCES;
+	}
+
 	map = kzalloc_obj(*map);
 	if (map == NULL)
 		return -ENOMEM;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 8480d65ecb85..362110d58ca3 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -664,6 +664,7 @@ extern unsigned int uvc_no_drop_param;
 extern unsigned int uvc_dbg_param;
 extern unsigned int uvc_timeout_param;
 extern unsigned int uvc_hw_timestamps_param;
+extern bool uvc_allow_privacy_override_param;
 
 #define uvc_dbg(_dev, flag, fmt, ...)					\
 do {									\
@@ -794,6 +795,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 		      struct uvc_xu_control_query *xqry);
 
 void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
+bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector);
 
 /* Utility functions */
 struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index dea23aabbad4..70c2a7d25236 100644
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
2.53.0.851.ga537e3e6e9-goog


