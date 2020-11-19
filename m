Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3E02B9D25
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 22:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgKSVuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 16:50:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgKSVuf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 16:50:35 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68175C061A4B
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 13:50:33 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a3so8049492wmb.5
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 13:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M4UWJdzxGjZ3FRbN2p0hSo/ueaYeOwZVoPX3ogUn9Jg=;
        b=iXVkGHnII8i3RzXJ8Aaig2z/iMI4UYTlhuf9rzpqG06q/VB3iMLKUvvBYaYJohyOvI
         B6UphpbRnEqKer7Lz1BQqEppKfaEOYzzCgn40jfqbB83lFJRwMddR67x1ACMcXs9gBMk
         ElVftK0vZhOdtIHLsO4L2F/yiIYX5NhQu7uyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M4UWJdzxGjZ3FRbN2p0hSo/ueaYeOwZVoPX3ogUn9Jg=;
        b=bCJnjy0dv4piS1yMFIeS7IbiToIlnROxmXIfD/3LC1aoiQeNduadmcb1f7I2rJ3UBf
         TlSaOCUH9uHV8kCdfdTQshTrp6HT+xH5uMZfBrheW/1gDME8Ffh3i87MUnMJgWO3Wh1I
         yTkQqu2AmL3iRyT0DAtVrrVA1a/+TKd7UKxHoMewfN3nTah0aMmbn9uZV38G9VykZWtH
         dFvtNwv4uOIl0L+CqOh229njaCH7F2VlR8aOBGjDiFhACsvshtoNmuy7X92MVLKOzlbp
         S2lgdR8737bG8G+Uxu8VNR5Dq5QeKWoTb606EPsN+v8wGW4h8JsrYACxXBXVuBsv2oKb
         LNhA==
X-Gm-Message-State: AOAM5331TFNYvN1NERfMHrNxmdiAH9EwmQqVFrUDxBoxJNUXyYlkiOUh
        wwNDHfUxEb03dVs3VrMbBdmQPA==
X-Google-Smtp-Source: ABdhPJyuLmLcz0d7kjC/WN7d4l8LW8AXWfMs9Pzi8U7sS/tco+TZLf7VGo72ldEA9fKzYQ77wlrsCw==
X-Received: by 2002:a1c:1982:: with SMTP id 124mr6474217wmz.74.1605822632113;
        Thu, 19 Nov 2020 13:50:32 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t136sm1818859wmt.18.2020.11.19.13.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 13:50:31 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Joe Perches <joe@perches.com>
Subject: [PATCH v3 8/8] media: uvcvideo: New macro uvc_trace_cont
Date:   Thu, 19 Nov 2020 22:50:20 +0100
Message-Id: <20201119215020.508487-9-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
In-Reply-To: <20201119215020.508487-1-ribalda@chromium.org>
References: <20201119215020.508487-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove all the duplicated code around pr_cont with a new macro.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 57 +++++++++++-------------------
 drivers/media/usb/uvc/uvcvideo.h   |  6 ++++
 2 files changed, 27 insertions(+), 36 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 4379916a6ac1..e49491250e87 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1593,8 +1593,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 {
 	switch (UVC_ENTITY_TYPE(entity)) {
 	case UVC_VC_EXTENSION_UNIT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			pr_cont(" <- XU %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- XU %d", entity->id);
 
 		if (entity->bNrInPins != 1) {
 			uvc_trace(UVC_TRACE_DESCR, "Extension unit %d has more "
@@ -1605,8 +1604,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 		break;
 
 	case UVC_VC_PROCESSING_UNIT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			pr_cont(" <- PU %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- PU %d", entity->id);
 
 		if (chain->processing != NULL) {
 			uvc_trace(UVC_TRACE_DESCR, "Found multiple "
@@ -1618,8 +1616,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 		break;
 
 	case UVC_VC_SELECTOR_UNIT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			pr_cont(" <- SU %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- SU %d", entity->id);
 
 		/* Single-input selector units are ignored. */
 		if (entity->bNrInPins == 1)
@@ -1637,27 +1634,22 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 	case UVC_ITT_VENDOR_SPECIFIC:
 	case UVC_ITT_CAMERA:
 	case UVC_ITT_MEDIA_TRANSPORT_INPUT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			pr_cont(" <- IT %d\n", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- IT %d\n", entity->id);
 
 		break;
 
 	case UVC_OTT_VENDOR_SPECIFIC:
 	case UVC_OTT_DISPLAY:
 	case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			pr_cont(" OT %d", entity->id);
+		uvc_trace_cont(UVC_TRACE_PROBE, " OT %d", entity->id);
 
 		break;
 
 	case UVC_TT_STREAMING:
-		if (UVC_ENTITY_IS_ITERM(entity)) {
-			if (uvc_trace_param & UVC_TRACE_PROBE)
-				pr_cont(" <- IT %d\n", entity->id);
-		} else {
-			if (uvc_trace_param & UVC_TRACE_PROBE)
-				pr_cont(" OT %d", entity->id);
-		}
+		if (UVC_ENTITY_IS_ITERM(entity))
+			uvc_trace_cont(UVC_TRACE_PROBE, " <- IT %d\n", entity->id);
+		else
+			uvc_trace_cont(UVC_TRACE_PROBE, " OT %d", entity->id);
 
 		break;
 
@@ -1704,13 +1696,11 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
 			}
 
 			list_add_tail(&forward->chain, &chain->entities);
-			if (uvc_trace_param & UVC_TRACE_PROBE) {
-				if (!found)
-					pr_cont(" (->");
+			if (!found)
+				uvc_trace_cont(UVC_TRACE_PROBE, " (->");
 
-				pr_cont(" XU %d", forward->id);
-				found = 1;
-			}
+			uvc_trace_cont(UVC_TRACE_PROBE, " XU %d", forward->id);
+			found = 1;
 			break;
 
 		case UVC_OTT_VENDOR_SPECIFIC:
@@ -1724,18 +1714,16 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
 			}
 
 			list_add_tail(&forward->chain, &chain->entities);
-			if (uvc_trace_param & UVC_TRACE_PROBE) {
-				if (!found)
-					pr_cont(" (->");
+			if (!found)
+				uvc_trace_cont(UVC_TRACE_PROBE, " (->");
 
-				pr_cont(" OT %d", forward->id);
-				found = 1;
-			}
+			uvc_trace_cont(UVC_TRACE_PROBE, " OT %d", forward->id);
+			found = 1;
 			break;
 		}
 	}
 	if (found)
-		pr_cont(")");
+		uvc_trace_cont(UVC_TRACE_PROBE, ")");
 
 	return 0;
 }
@@ -1760,8 +1748,7 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
 			break;
 		}
 
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			pr_cont(" <- IT");
+		uvc_trace_cont(UVC_TRACE_PROBE, " <- IT");
 
 		chain->selector = entity;
 		for (i = 0; i < entity->bNrInPins; ++i) {
@@ -1781,15 +1768,13 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
 				return -EINVAL;
 			}
 
-			if (uvc_trace_param & UVC_TRACE_PROBE)
-				pr_cont(" %d", term->id);
+			uvc_trace_cont(UVC_TRACE_PROBE, " %d", term->id);
 
 			list_add_tail(&term->chain, &chain->entities);
 			uvc_scan_chain_forward(chain, term, entity);
 		}
 
-		if (uvc_trace_param & UVC_TRACE_PROBE)
-			pr_cont("\n");
+		uvc_trace_cont(UVC_TRACE_PROBE, "\n");
 
 		id = 0;
 		break;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index d8e2f27bf576..2b5ba4b02d3a 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -748,6 +748,12 @@ do {									\
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
2.29.2.299.gdc1121823c-goog

