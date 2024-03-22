Return-Path: <linux-media+bounces-7643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3DD8870EC
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 17:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 756522832FA
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 16:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9193159B5F;
	Fri, 22 Mar 2024 16:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oxt-co.20230601.gappssmtp.com header.i=@oxt-co.20230601.gappssmtp.com header.b="286ueGXl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8C35F874
	for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711125114; cv=none; b=tYAXoMx4S8nuVSBBu3N0jAi3deLIvagAj3Xu+GeioS3yK5VoWuegH0YnDaOw7P2kUoASxu34DaexMQjtHbmO8cZFH0qY9JHImSmj2eGrLw+ssC/4Gix3BzvsEKEd3iAEkedwSb3F4pzr3swJRGItkrrYkGnDKRnw7lBqagyOTAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711125114; c=relaxed/simple;
	bh=pQrYCWUbRzJe+OanV1hwbp6K1XTgb5SwJVbhPaZp+XQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G8vd1vMQUAyG6Bazp96gYdKs25OoWif901Q0h4OMo6YDvkbryKOlDRPtAVUdTLSnZFvYDNXE4GydhmtpMO2UtaAUAHZ+9GVp0pB1Q3f09CYhDYEBuxTLHT/w8bVubYRtjZ5xdSmHx7DRrwlOQsfViS+jOL8qAzpprAp6Aksb1W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oxt.co; spf=none smtp.mailfrom=oxt.co; dkim=pass (2048-bit key) header.d=oxt-co.20230601.gappssmtp.com header.i=@oxt-co.20230601.gappssmtp.com header.b=286ueGXl; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oxt.co
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=oxt.co
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6963cf14771so20947706d6.3
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oxt-co.20230601.gappssmtp.com; s=20230601; t=1711125110; x=1711729910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTWu2oRYftROJa0FKbmPCrT/T4q0UoNj3i7NDdlGkTQ=;
        b=286ueGXl+WaEx47+Lvi0aRY17AXEXWlbTkMLXQjvuuMSYYicwG2eiBeoQ8WbIWAsFT
         sHCP4TRg/EopLRQCW5wW6nZ1QzAP1t1TxpvwzKfyu1v0xCQcON34tVG80Iz66W7H1gWA
         UZP8Z6Wg+0Da1KdAI3EuUC1HfYTsoXA/4QiyxvL5tlDkhqsnW1s8ba7OJ/RbMIu4yqk5
         C9QvonCZ0HIXKvCjRcXgAEKhSQ/XxY9+p8NGItulJWnAWGlw9Z/2RUp2UdhnUunCceHv
         rv0RpxcwLkSvxXSuDWvDOayUmIRplHF2ncuYvQeeE3UrozN62igPRE2YW3CmTCUSZciq
         9nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711125110; x=1711729910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTWu2oRYftROJa0FKbmPCrT/T4q0UoNj3i7NDdlGkTQ=;
        b=N8KDO1bWII1ioU2jtlUCYEXC8MIyfyX9/d4h90OJga2bg2hrgd8eF28aNDs1TuJFyq
         pRcv43esWVV7DJuNCJh7i/CYB8BvNUEPHeA0A0FzuzOqG+PJURXUNTMTZbtIGNF1YA8R
         BJltvC89XdawhvFKoLzXBKyMKTz8frdWPoEGlQ6+/UirCWo5dfrkmE5W3HhB0uxmTUHk
         5LxPlKC9PURbqYV4OXra9fj/W71nfFVsl3Q9e+YpOsErBZqNzYEdcMjSyDbtyK7MlYlg
         BagtZeLnwy0VrVoIg0IrXjrpPx2FelHWZjpnp43CU/kd3dUToPVM30vAe+ULtUsHT32W
         6LNw==
X-Forwarded-Encrypted: i=1; AJvYcCXiLL0pX4lvuM8qBElQ6ZsOO5pGQ5nyojVJ00cw/0LAcpZ1tA6xvwy1XCZN8ua98VYIbnvIadgGF0ra2ORQbgn6rLMZSrVwq/yLrGk=
X-Gm-Message-State: AOJu0YzkyYffXm+tvn0Ef3VGhNmXb2gHxbILJuRtkKJ6lRf6jFuL+byl
	2jncmzg7eK2bT1SZ5gref7X2mNxmSnhRPvMiL4hnYabHEpN5eKWU/qN6DWcV+6MmDheZ/OXqtV8
	fEug=
X-Google-Smtp-Source: AGHT+IG3ihEDTwJufuaPB1TY9DxsYsu5HUpEbczjhgqO4cXXDd9+BJnFGPTdMz5iGckIXqYw3nc64Q==
X-Received: by 2002:a05:6214:19e2:b0:696:7567:ef74 with SMTP id q2-20020a05621419e200b006967567ef74mr624942qvc.27.1711125110486;
        Fri, 22 Mar 2024 09:31:50 -0700 (PDT)
Received: from StreamBox01.oxt.local (75-168-73-214.mpls.qwest.net. [75.168.73.214])
        by smtp.gmail.com with ESMTPSA id e2-20020a0cf742000000b006967565c827sm142078qvo.141.2024.03.22.09.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 09:31:50 -0700 (PDT)
From: John Bauer <john@oxt.co>
X-Google-Original-From: John Bauer <johnebgood@securitylive.com>
To: linh.tp.vu@gmail.com
Cc: laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	ribalda@chromium.org,
	soyer@irl.hu,
	John Bauer <johnebgood@securitylive.com>
Subject: [PATCH] Quirk-fix-for-OBSBOT-Tiny-camera-minimum-settings
Date: Fri, 22 Mar 2024 11:31:46 -0500
Message-Id: <20240322163146.43231-1-johnebgood@securitylive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAD4e14uBMtVTYBAWibcsff+FYgZqA-c8RW4qCE7YHSy6xZknKw@mail.gmail.com>
References: <CAD4e14uBMtVTYBAWibcsff+FYgZqA-c8RW4qCE7YHSy6xZknKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings, this is my first patch in about 30 years so I'm probably
going to do something wrong so apologies in advance. Below is my working 
patch tested on the OBSBOT Tiny and Tiny 4k. I'm not sure if the overrides 
can be done in a different way/place. uvc_ctrl_get_rel_speed doesn't have 
a reference to maximum when it's called. 

I am on the OBSBOT Facebook support page which is the only way to get
support that I can find. I'm really hoping they can fix this in the
firmware and to fix other issues for example on the OBSBOT Tiny 4k auto
exposure can't be set in Linux with the UVC driver even though the
minimum shows it can be 0. I would like to see them add the ability to
enable/disable AI tracking with a custom XU control as well.

Ricardo, I ran the output message you suggested and 0 is being returned
for zoom and 1 for pan/tilt which is being negated in
uvc_ctrl_get_rel_speed: return -data[first+1]; 

[  219.164932] usb 1-4: Found UVC 1.00 device OBSBOT Tiny 4K (3564:fef4)
[  219.222257] zoom: GET_MIN 00 0x0 00
[  219.222261] zoom: GET_MAX 00 0x0 064
[  219.223261] speed: GET_MIN 00 0x1 00
[  219.223264] speed: GET_MAX 00 0xa0 00
[  219.223313] speed: GET_MIN 00 0x1 00
[  219.223314] speed: GET_MAX 00 0x78 00
[  219.368848] usb 1-7.3: Found UVC 1.10 device OBSBOT Tiny (3564:fef0)
[  219.405003] zoom: GET_MIN 00 0x0 00
[  219.405006] zoom: GET_MAX 00 0x0 064
[  219.405361] speed: GET_MIN 00 0x1 00
[  219.405362] speed: GET_MAX 00 0xa0 00
[  219.405368] speed: GET_MIN 00 0x1 00
[  219.405369] speed: GET_MAX 00 0x78 00

---
 drivers/media/usb/uvc/uvc_ctrl.c   | 29 +++++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c2761..509eb7ed652a 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1322,9 +1322,22 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		break;
 	}
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
+	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
 		v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
-				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+					uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+
+		if (chain->dev->quirks & UVC_QUIRK_OBSBOT_MIN_SETTINGS) {
+			switch (v4l2_ctrl->id) {
+			case V4L2_CID_ZOOM_CONTINUOUS:
+			case V4L2_CID_PAN_SPEED:
+			case V4L2_CID_TILT_SPEED:
+				v4l2_ctrl->minimum = -1 * mapping->get(mapping, UVC_GET_MAX,
+						     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+			default:
+				break;
+			}
+		}
+	}
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
 		v4l2_ctrl->maximum = mapping->get(mapping, UVC_GET_MAX,
@@ -1914,6 +1927,18 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 				   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
 		max = mapping->get(mapping, UVC_GET_MAX,
 				   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+
+		if(chain->dev->quirks & UVC_QUIRK_OBSBOT_MIN_SETTINGS) {
+			switch (xctrl->id) {
+			case V4L2_CID_ZOOM_CONTINUOUS:
+			case V4L2_CID_PAN_SPEED:
+			case V4L2_CID_TILT_SPEED:
+				min = max * -1;
+			default:
+				break;
+    		}
+		}
+
 		step = mapping->get(mapping, UVC_GET_RES,
 				    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
 		if (step == 0)
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index bbd90123a4e7..8cc2fe144887 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3120,6 +3120,24 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
+	/* OBSBOT Tiny 1080p pan, tilt, zoom min settings quirk */	  
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x3564,
+	  .idProduct		= 0xfef0,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_OBSBOT_MIN_SETTINGS) },
+	/* OBSBOT Tiny 4k pan, tilt, zoom min settings quirk */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x3564,
+	  .idProduct		= 0xfef4,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_OBSBOT_MIN_SETTINGS) },	
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 6fb0a78b1b00..0e2f083a5c0e 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -73,6 +73,7 @@
 #define UVC_QUIRK_FORCE_Y8		0x00000800
 #define UVC_QUIRK_FORCE_BPP		0x00001000
 #define UVC_QUIRK_WAKE_AUTOSUSPEND	0x00002000
+#define UVC_QUIRK_OBSBOT_MIN_SETTINGS 0x00004000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
-- 
2.34.1


