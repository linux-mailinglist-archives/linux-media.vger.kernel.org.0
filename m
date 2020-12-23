Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C7E2E1CAE
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 14:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbgLWNhf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 08:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728593AbgLWNhd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 08:37:33 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D20C0611E4
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 05:35:39 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d13so18612694wrc.13
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 05:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WhLb6YEyHwrOqQmqk1DfxxcKaubqjfT3yk59f4tyNrg=;
        b=coviEdr6k+TMkbLssys3vcXiH0H19eMqKwfZlw0TMmHAg+EarrsY9i9DPIFglr/4Fz
         vwRyb+++MV1UMbPVXBZpJhTowMs81E/c675nPQCLrbVgXRtXShLLRlRVTU5/EqCqryfy
         yX/DvAefMhi1E6oQ5ywN/MHDIw3MYc3N5al1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WhLb6YEyHwrOqQmqk1DfxxcKaubqjfT3yk59f4tyNrg=;
        b=NMh3UEQSupG001+DOBkjuoCEBErPDuHVxs/gRfMte+krYU2t5/WuxsRYHJOYxHbe6N
         eTgsXsW+hUlb2wDa19Y9oZfUEYmmK1PYFefYf+DsQTDsLVd1gg3wExg9JGDAA8321kaY
         ksLuaE4ACWvtrCeuIim51qFAaBostJ2zitjB9B4fJKP31fF8MA2sQsuDdlIClw8VgrK2
         N1BMEqDOO+l6zc18fcm0OQ0Z0fcBLzvJg7+KVUiR7baoMr3+mWaxt3jdUawVBnYV/frB
         cSatLq4pnyBcKjsEJluFozQBadr+bb6j6tKRYUc/XrHJDKjJ9z1BlfY6IxLQy+Ie8TEC
         WX5Q==
X-Gm-Message-State: AOAM532/+tgrgdbGJKBFZEHcwl0Udwl6687hxnTcSEPePhpgW7EtuS4T
        mewUzaktUSY0QY+JV0z6ISVmpQ==
X-Google-Smtp-Source: ABdhPJzTctbIfPnML6LuIvgSIeDPTQ8xXjXTSSxIPiDaRSaOK0lIgCSVbk7ZJKCSKHLr63xi2IYlEg==
X-Received: by 2002:a5d:5005:: with SMTP id e5mr28782686wrt.279.1608730537773;
        Wed, 23 Dec 2020 05:35:37 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id q143sm31572247wme.28.2020.12.23.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 05:35:37 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Joe Perches <joe@perches.com>
Subject: [PATCH v7 09/12] media: uvcvideo: New macro uvc_trace_cont
Date:   Wed, 23 Dec 2020 14:35:25 +0100
Message-Id: <20201223133528.55014-10-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20201223133528.55014-1-ribalda@chromium.org>
References: <20201223133528.55014-1-ribalda@chromium.org>
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
index 9ca9fcdb7b3d..b4b47cc35af9 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1606,8 +1606,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 {
 	switch (UVC_ENTITY_TYPE(entity)) {
 	case UVC_VC_EXTENSION_UNIT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- XU %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- XU %d", entity->id);
 
 		if (entity->bNrInPins != 1) {
 			uvc_trace(UVC_TRACE_DESCR, "Extension unit %d has more "
@@ -1618,8 +1617,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 		break;
 
 	case UVC_VC_PROCESSING_UNIT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- PU %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- PU %d", entity->id);
 
 		if (chain->processing != NULL) {
 			uvc_trace(UVC_TRACE_DESCR, "Found multiple "
@@ -1631,8 +1629,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 		break;
 
 	case UVC_VC_SELECTOR_UNIT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- SU %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- SU %d", entity->id);
 
 		/* Single-input selector units are ignored. */
 		if (entity->bNrInPins == 1)
@@ -1650,27 +1647,22 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
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
 
@@ -1717,13 +1709,11 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
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
@@ -1737,18 +1727,16 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
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
@@ -1773,8 +1761,7 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
 			break;
 		}
 
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- IT");
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- IT");
 
 		chain->selector = entity;
 		for (i = 0; i < entity->bNrInPins; ++i) {
@@ -1794,15 +1781,13 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
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
index a8c2766f3d6a..fb01d52eed39 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -757,6 +757,12 @@ do {									\
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

