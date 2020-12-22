Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73192E108C
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 00:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgLVXGw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 18:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbgLVXGv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 18:06:51 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64CF9C0619D4
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:57 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id c133so3671191wme.4
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 15:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nGFSx+t8QOkCFsM4Ak8b3ukgqnZJdFf1VbpNo5PiXJs=;
        b=b2ogYRzqn0fAh+Vwlef5gGvcxCs6mwSu7kRa+91yOXrDncLUIidw83MyNCSkQIH0I5
         /8jcI99WL+k2txwdFqKw2e9qZPsFg9goMvch4kaLRc+gJ7c6XkChKMCIXN+Bby4RFo00
         xG9Bo8C1ASAz+G+YIwAIy7onvoFI8RW0A0I2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nGFSx+t8QOkCFsM4Ak8b3ukgqnZJdFf1VbpNo5PiXJs=;
        b=kH6VJNYpBf7lfRUWTu2ueRHrZLv+UU9gvz9otiMmBHbtzC7uYen9ByJHK+Y1jyZw7j
         Qk5anAW+eYip8Ki4iLzxenmK5RYQfOYep8p+Vf7dpEUfPvv1Bm6iJgYm/QI8y0thYEzo
         GTAYWDEKe7NBxb0vjahlt5NaVl5Gf3SXLVY1ZOyU6+DHf9Z8CzxgkheZWpaha4G9Dlp+
         ZNc8bu43vzVojIOVUtJ6YfETUeYJQPu5obUl+IyJRCKD8/4YxeYRKyDlsuFCii6OPoJq
         6wmrvRGoR7l5l0B8FIZlP4Qh4aSgrclYeVvVgo5Gn1VkSLWyNZnVqcsZFPLwREPSC9Xh
         A0yA==
X-Gm-Message-State: AOAM5309oHxG5n9jcMv6eu+AbxxXawi86Zyub97JI6ZAaynXjIcWM0rm
        xHUiOXe24s0qOqcb4jefNGO/Vw==
X-Google-Smtp-Source: ABdhPJxtYyTp9/X2eSVSkeUTvofnLYhPCZgZqUX24HSjwlpqHXvLf9obQRtxtpy70SeuWch48Lop9w==
X-Received: by 2002:a1c:ddd5:: with SMTP id u204mr23407177wmg.174.1608678296109;
        Tue, 22 Dec 2020 15:04:56 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id r16sm34463401wrx.36.2020.12.22.15.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 15:04:55 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Joe Perches <joe@perches.com>
Subject: [PATCH v6 10/11] media: uvcvideo: New macro uvc_trace_cont
Date:   Wed, 23 Dec 2020 00:04:45 +0100
Message-Id: <20201222230446.1027916-11-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201222230446.1027916-1-ribalda@chromium.org>
References: <20201222230446.1027916-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove all the duplicated code around printk(KERN_CONT, with a new macro.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 57 +++++++++++-------------------
 drivers/media/usb/uvc/uvcvideo.h   |  6 ++++
 2 files changed, 27 insertions(+), 36 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e348d8bb625d..c146944db091 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1646,8 +1646,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 {
 	switch (UVC_ENTITY_TYPE(entity)) {
 	case UVC_VC_EXTENSION_UNIT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- XU %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- XU %d", entity->id);
 
 		if (entity->bNrInPins != 1) {
 			uvc_trace(UVC_TRACE_DESCR, "Extension unit %d has more "
@@ -1658,8 +1657,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 		break;
 
 	case UVC_VC_PROCESSING_UNIT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- PU %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- PU %d", entity->id);
 
 		if (chain->processing != NULL) {
 			uvc_trace(UVC_TRACE_DESCR, "Found multiple "
@@ -1671,8 +1669,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 		break;
 
 	case UVC_VC_SELECTOR_UNIT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- SU %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- SU %d", entity->id);
 
 		/* Single-input selector units are ignored. */
 		if (entity->bNrInPins == 1)
@@ -1690,27 +1687,22 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 	case UVC_ITT_VENDOR_SPECIFIC:
 	case UVC_ITT_CAMERA:
 	case UVC_ITT_MEDIA_TRANSPORT_INPUT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- IT %d\n", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- IT %d\n", entity->id);
 
 		break;
 
 	case UVC_OTT_VENDOR_SPECIFIC:
 	case UVC_OTT_DISPLAY:
 	case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " OT %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " OT %d", entity->id);
 
 		break;
 
 	case UVC_TT_STREAMING:
-		if (UVC_ENTITY_IS_ITERM(entity)) {
-			if (uvc_trace_param & UVC_TRACE_PROBE)
-				printk(KERN_CONT " <- IT %d\n", entity->id);
-		} else {
-			if (uvc_trace_param & UVC_TRACE_PROBE)
-				printk(KERN_CONT " OT %d", entity->id);
-		}
+		if (UVC_ENTITY_IS_ITERM(entity))
+			uvc_trace_cont(UVC_TRACE_PROBE, " <- IT %d\n", entity->id);
+		else
+			uvc_trace_cont(UVC_TRACE_PROBE, " OT %d", entity->id);
 
 		break;
 
@@ -1757,13 +1749,11 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
 			}
 
 			list_add_tail(&forward->chain, &chain->entities);
-			if (uvc_trace_param & UVC_TRACE_PROBE) {
-				if (!found)
-					printk(KERN_CONT " (->");
+			if (!found)
+				uvc_trace_cont(UVC_TRACE_PROBE, " (->");
 
-				printk(KERN_CONT " XU %d", forward->id);
-				found = 1;
-			}
+			uvc_trace_cont(UVC_TRACE_PROBE, " XU %d", forward->id);
+			found = 1;
 			break;
 
 		case UVC_OTT_VENDOR_SPECIFIC:
@@ -1777,18 +1767,16 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
 			}
 
 			list_add_tail(&forward->chain, &chain->entities);
-			if (uvc_trace_param & UVC_TRACE_PROBE) {
-				if (!found)
-					printk(KERN_CONT " (->");
+			if (!found)
+				uvc_trace_cont(UVC_TRACE_PROBE, " (->");
 
-				printk(KERN_CONT " OT %d", forward->id);
-				found = 1;
-			}
+			uvc_trace_cont(UVC_TRACE_PROBE, " OT %d", forward->id);
+			found = 1;
 			break;
 		}
 	}
 	if (found)
-		printk(KERN_CONT ")");
+		uvc_trace_cont(UVC_TRACE_PROBE, ")");
 
 	return 0;
 }
@@ -1813,8 +1801,7 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
 			break;
 		}
 
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- IT");
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- IT");
 
 		chain->selector = entity;
 		for (i = 0; i < entity->bNrInPins; ++i) {
@@ -1834,15 +1821,13 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
 				return -EINVAL;
 			}
 
-			if (uvc_trace_param & UVC_TRACE_PROBE)
-				printk(KERN_CONT " %d", term->id);
+			uvc_trace_cont(UVC_TRACE_PROBE, " %d", term->id);
 
 			list_add_tail(&term->chain, &chain->entities);
 			uvc_scan_chain_forward(chain, term, entity);
 		}
 
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT "\n");
+		uvc_trace_cont(UVC_TRACE_PROBE, "\n");
 
 		id = 0;
 		break;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 3dcb9e417b3d..a362ba6d5295 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -760,6 +760,12 @@ do {									\
 		printk(KERN_DEBUG "uvcvideo: " fmt, ##__VA_ARGS__);	\
 } while (0)
 
+#define uvc_trace_cont(flag, fmt, ...)					\
+do {									\
+	if (uvc_trace_param & flag)					\
+		pr_cont(fmt, ##__VA_ARGS__);				\
+} while (0)
+
 #define uvc_warn_once(_dev, warn, fmt, ...)				\
 do {									\
 	if (!test_and_set_bit(warn, &(_dev)->warnings))			\
-- 
2.29.2.729.g45daf8777d-goog

