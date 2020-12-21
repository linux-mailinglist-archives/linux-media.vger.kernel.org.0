Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA90D2E0050
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 19:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727475AbgLUSqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 13:46:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgLUSq1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 13:46:27 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D016C061248
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:45:46 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id y24so9884673edt.10
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 10:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OYTLr/bF0U0a0TZZ36ui4Zah1iqpScSOC7Qe5cMmNcM=;
        b=OLJM/RvTXaLIrogkY4mLnmeK1zsDuVlumHJpuAszcyMo4UL7CfqxrX5kSZVPrsMq1s
         no1XBo691bsbZXHi6zntrdEkDImvAHKlKHMYiA+9F29nOunGDPSrrqoe5NnVJQ/ZvWsL
         73fQVKzcJPX8aAx8YPZ5KISTuuddNwxgZBR3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OYTLr/bF0U0a0TZZ36ui4Zah1iqpScSOC7Qe5cMmNcM=;
        b=P622OJ7SiPRz4gi7JEBVauAO3vyJAcQxHjfxBQfSjECEuTN2gWYppRgKPSO9sviq/N
         Xyz21fDflzz3ih1HVwZZ+thO7JHhPzXh4jnSxtd+/XancS73HiXESjoNGLexYEjja/OL
         I5HYQFXgYNHjQe/T0MacRWCroJkR0tyOCm0P67o9mTHVa8/uhIlRhvdxI2kS7mEk2AVS
         3zY7qDEnIgKEK7nSNU+XTzwlmox22CLVQGStlzsReTKLQubwBTm2WQNfKdXnixFXfsEP
         Ja+kmMxiPEo7pnW3AV12OdeSJkagV/HmRtKgTW4gcVBJs8Q1undOW4xNxS4UPr9pJr15
         stBQ==
X-Gm-Message-State: AOAM530b9Cb0u+SX+vZycMRQw/jFsAwhDOfeBgTanuw2wQTHvBxDmQah
        uLICR8mIWN5YXwmyPhxKFYIIQ1uAsL5NAu3B9L0=
X-Google-Smtp-Source: ABdhPJwsU61O9EF37DtkGGZmhDt3rybyxW5D0KgYnHDJRm3lVMNTNQ3y/uXckt49FmHkSMsC2U1Mhw==
X-Received: by 2002:a5d:6902:: with SMTP id t2mr19344181wru.214.1608569310373;
        Mon, 21 Dec 2020 08:48:30 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o125sm24581109wmo.30.2020.12.21.08.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:48:29 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Joe Perches <joe@perches.com>
Subject: [PATCH v5 11/12] media: uvcvideo: New macro uvc_trace_cont
Date:   Mon, 21 Dec 2020 17:48:18 +0100
Message-Id: <20201221164819.792019-12-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201221164819.792019-1-ribalda@chromium.org>
References: <20201221164819.792019-1-ribalda@chromium.org>
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
index c98d57680e5c..ea64c716f1f3 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1686,8 +1686,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 {
 	switch (UVC_ENTITY_TYPE(entity)) {
 	case UVC_VC_EXTENSION_UNIT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- XU %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- XU %d", entity->id);
 
 		if (entity->bNrInPins != 1) {
 			uvc_trace(UVC_TRACE_DESCR, "Extension unit %d has more "
@@ -1698,8 +1697,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 		break;
 
 	case UVC_VC_PROCESSING_UNIT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- PU %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- PU %d", entity->id);
 
 		if (chain->processing != NULL) {
 			uvc_trace(UVC_TRACE_DESCR, "Found multiple "
@@ -1711,8 +1709,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 		break;
 
 	case UVC_VC_SELECTOR_UNIT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- SU %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- SU %d", entity->id);
 
 		/* Single-input selector units are ignored. */
 		if (entity->bNrInPins == 1)
@@ -1730,27 +1727,22 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
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
 
@@ -1797,13 +1789,11 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
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
@@ -1817,18 +1807,16 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
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
@@ -1853,8 +1841,7 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
 			break;
 		}
 
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- IT");
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- IT");
 
 		chain->selector = entity;
 		for (i = 0; i < entity->bNrInPins; ++i) {
@@ -1874,15 +1861,13 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
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
index a4ebd56bb987..4a7d1fb76eee 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -763,6 +763,12 @@ do {									\
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
2.29.2.684.gfbc64c5ab5-goog

