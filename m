Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430C72A6C65
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 19:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732212AbgKDSHt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 13:07:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgKDSHs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 13:07:48 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CED8C0613D4
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 10:07:48 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id k18so3190324wmj.5
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 10:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KBJdPJKhHMcEG3i3MssFQOTFq5qAUMX15kP0Cu1fqHY=;
        b=aah+dx1Av5pM+VYV1e9dWE3ehzZ6Vmsu1Py6GgjJk9e/aROc4f5UfmfHeDQljhQN0T
         CPV7o4E/YzYf8QX6LU01ji019CT/C7s/u1/H4j2x4vCoxvoYL22c2SbuoIr14llnow1u
         y8+QEf5Ij4uChguyvnyIkeaDyb7U0V0gYQyfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KBJdPJKhHMcEG3i3MssFQOTFq5qAUMX15kP0Cu1fqHY=;
        b=YVDKJGdElqMHs7usLLi2Rdfo+Y09jGQ273WM1YfhRMbENZOX7E2YgyZ1euj6qV5biC
         xbjjMKOs52W9/mZrFeww4i4pJL2hH13UsLBRr087t7d7PBC6DAMw0gsK2EADQo8Ay1CM
         DjwfZxBRvUQUWzu13ecJseDcDLCY0gCv0th25cmVqFBZtatQ1SZZ9qUriFdCpcNshrvE
         zmXg0hJMT87zKVNyV4YY1jhEBl8gzl0SAIo1H+3X0T6PFvIM6QC2TruL6xRUSOF9LOtK
         pipfmOrB+9WL6azVVZLLRJ7v6qjvpGpmYolOA/OUjcm0AR5FvMjqNkwnXoyqW8oCmj03
         MQRQ==
X-Gm-Message-State: AOAM530aqdF1IAzWX0vDWnMrKNWmDcPTPN7mZ6lbea+aQs6Ld8vaEPPz
        tZjTX7XH6MqFyk/TJQUUIa3EDA==
X-Google-Smtp-Source: ABdhPJyBKEK/HrrERt5hZuIKNep/zDOG7j7Egm92CqgQtPbFdEAPD53XzUWv6ghn9iwHxfvKVG9DRA==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr5985826wma.93.1604513266866;
        Wed, 04 Nov 2020 10:07:46 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id y10sm3801841wru.94.2020.11.04.10.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 10:07:46 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 1/7] media: uvcvideo: Use pr_cont() macro
Date:   Wed,  4 Nov 2020 19:07:28 +0100
Message-Id: <20201104180734.286789-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201104180734.286789-1-ribalda@chromium.org>
References: <20201104180734.286789-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace all the uses of printk(KERN_CONT ... with pr_cont().

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ddb9eaa11be7..9fc0b600eab1 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1476,7 +1476,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 	switch (UVC_ENTITY_TYPE(entity)) {
 	case UVC_VC_EXTENSION_UNIT:
 		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- XU %d", entity->id);
+			pr_cont(" <- XU %d", entity->id);
 
 		if (entity->bNrInPins != 1) {
 			uvc_trace(UVC_TRACE_DESCR, "Extension unit %d has more "
@@ -1488,7 +1488,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 
 	case UVC_VC_PROCESSING_UNIT:
 		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- PU %d", entity->id);
+			pr_cont(" <- PU %d", entity->id);
 
 		if (chain->processing != NULL) {
 			uvc_trace(UVC_TRACE_DESCR, "Found multiple "
@@ -1501,7 +1501,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 
 	case UVC_VC_SELECTOR_UNIT:
 		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- SU %d", entity->id);
+			pr_cont(" <- SU %d", entity->id);
 
 		/* Single-input selector units are ignored. */
 		if (entity->bNrInPins == 1)
@@ -1520,7 +1520,7 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 	case UVC_ITT_CAMERA:
 	case UVC_ITT_MEDIA_TRANSPORT_INPUT:
 		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- IT %d\n", entity->id);
+			pr_cont(" <- IT %d\n", entity->id);
 
 		break;
 
@@ -1528,17 +1528,17 @@ static int uvc_scan_chain_entity(struct uvc_video_chain *chain,
 	case UVC_OTT_DISPLAY:
 	case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
 		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " OT %d", entity->id);
+			pr_cont(" OT %d", entity->id);
 
 		break;
 
 	case UVC_TT_STREAMING:
 		if (UVC_ENTITY_IS_ITERM(entity)) {
 			if (uvc_trace_param & UVC_TRACE_PROBE)
-				printk(KERN_CONT " <- IT %d\n", entity->id);
+				pr_cont(" <- IT %d\n", entity->id);
 		} else {
 			if (uvc_trace_param & UVC_TRACE_PROBE)
-				printk(KERN_CONT " OT %d", entity->id);
+				pr_cont(" OT %d", entity->id);
 		}
 
 		break;
@@ -1588,9 +1588,9 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
 			list_add_tail(&forward->chain, &chain->entities);
 			if (uvc_trace_param & UVC_TRACE_PROBE) {
 				if (!found)
-					printk(KERN_CONT " (->");
+					pr_cont(" (->");
 
-				printk(KERN_CONT " XU %d", forward->id);
+				pr_cont(" XU %d", forward->id);
 				found = 1;
 			}
 			break;
@@ -1608,16 +1608,16 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
 			list_add_tail(&forward->chain, &chain->entities);
 			if (uvc_trace_param & UVC_TRACE_PROBE) {
 				if (!found)
-					printk(KERN_CONT " (->");
+					pr_cont(" (->");
 
-				printk(KERN_CONT " OT %d", forward->id);
+				pr_cont(" OT %d", forward->id);
 				found = 1;
 			}
 			break;
 		}
 	}
 	if (found)
-		printk(KERN_CONT ")");
+		pr_cont(")");
 
 	return 0;
 }
@@ -1643,7 +1643,7 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
 		}
 
 		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT " <- IT");
+			pr_cont(" <- IT");
 
 		chain->selector = entity;
 		for (i = 0; i < entity->bNrInPins; ++i) {
@@ -1664,14 +1664,14 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
 			}
 
 			if (uvc_trace_param & UVC_TRACE_PROBE)
-				printk(KERN_CONT " %d", term->id);
+				pr_cont(" %d", term->id);
 
 			list_add_tail(&term->chain, &chain->entities);
 			uvc_scan_chain_forward(chain, term, entity);
 		}
 
 		if (uvc_trace_param & UVC_TRACE_PROBE)
-			printk(KERN_CONT "\n");
+			pr_cont("\n");
 
 		id = 0;
 		break;
-- 
2.29.1.341.ge80a0c044ae-goog

