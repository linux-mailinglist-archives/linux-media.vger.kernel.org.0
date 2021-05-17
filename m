Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07C05382958
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 12:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236217AbhEQKHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 06:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236220AbhEQKFD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 06:05:03 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1F75C061760
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 03:02:45 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id z19-20020a7bc7d30000b029017521c1fb75so2628042wmk.0
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 03:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QB5rbYaxeihEjSMoN5dAdVTi5PO0UCxWpYj6IuQlB8M=;
        b=HK5obDKADubAaceVCc/tl0NBYN1UBVT5AZ8fX75TEAf32o7B6uz3A1dteBoXbJyYLW
         E3m6dWTK14pqbBv9zcMiJ+uxsV0bEXo2u0UdsheDD8ca35Pltn/RgikyZwlrOStJk2PQ
         6SQ9oCGZwsNmxTrO0nG1KVmTy56JN3XNUFg+Bw+d0j0RmQF6+X07r1i2LYXdR4XfK9gJ
         9tFRX94FeA0KJhvIAtt5Z3YNabAirbYafbn4vvvJaZVGRVxX13LnP9e4GFJspJkp1Mfh
         RQeCxVacEoEAqUtPM4ATVIpLLk2xxR4LLnSTG4LqeajH9peSDMsNvhtVnd5qyf1bbNX+
         cQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QB5rbYaxeihEjSMoN5dAdVTi5PO0UCxWpYj6IuQlB8M=;
        b=VEKH8n309cWHPwQPOlD8ULO0OKpfR+Kz0E269cmuvCAvdlYOt3de71RIg3sOWUkdeX
         3sLhWaTwzMFQ9Hy+sKVgKGES0us1DmGVm+Pex3m2+Nub1Ptb6BIuHaHv640oVjeo3VYG
         NRpfrOnGGXowM35FWjCHLYs9D9NrMfOLD1mG0MCCZBOHt1llxo7fg4uUM2dgQPKFpSVf
         I48fHUpVU0ISndTqJ4Y9gWb+FzwDtIBXVHJ0UVB8sr9+5jpC1cy2/XqsXFDROq1ngE1E
         N+/8ZXp4Q4/D/QGVMYm9wiWs/KLX7lwa1PaQTkam0ESHRU9DosmOVBuRQ5ExoTd6yFAI
         xQvw==
X-Gm-Message-State: AOAM533WTHthwCQrlU0Au8OZUmujOVMzlcrawUOJnulcytvxgNuslUzY
        7SU8THQcava1WxJtwHceO4dKoFdzJtDlzg==
X-Google-Smtp-Source: ABdhPJx0YiT0iZPYurEpJ/BJjABFf/goPQvV9xl5Uq9urjQ7JPMlzStULRtj2l1MBwwZRSEif21TqQ==
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr9260496wmy.175.1621245764147;
        Mon, 17 May 2021 03:02:44 -0700 (PDT)
Received: from cluck.pitowers.org ([93.93.133.154])
        by smtp.gmail.com with ESMTPSA id f12sm10373292wre.88.2021.05.17.03.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:02:43 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX controls
Date:   Mon, 17 May 2021 11:02:39 +0100
Message-Id: <20210517100240.3323-2-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517100240.3323-1-david.plowman@raspberrypi.com>
References: <20210517100240.3323-1-david.plowman@raspberrypi.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We add new controls, one for each of the four usual Bayer channels:

V4L2_CID_NOTIFY_GAIN_RED
V4L2_CID_NOTIFY_GAIN_GREENR
V4L2_CID_NOTIFY_GAIN_BLUE
V4L2_CID_NOTIFY_GAIN_GREENB

These are provided for sensors that need to know what colour gains
will be applied to the Bayer channel by subsequent processing (such as
by an ISP), even though the sensor will not apply this gain itself.

The units, as with analogue gain, are determined by the driver.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 4 ++++
 include/uapi/linux/v4l2-controls.h   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 0d7fe1bd975a..2f4436e04cf9 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1150,6 +1150,10 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_GREENR:	return "Green (Red) Pixel Value";
 	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
+	case V4L2_CID_NOTIFY_GAIN_RED:		return "Notify Red Gain";
+	case V4L2_CID_NOTIFY_GAIN_GREENR:	return "Notify Green (Red) Gain";
+	case V4L2_CID_NOTIFY_GAIN_BLUE:		return "Notify Blue Gain";
+	case V4L2_CID_NOTIFY_GAIN_GREENB:	return "Notify Green (Blue) Gain";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d43bec5f1afd..dff5f0d26d4a 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1116,6 +1116,10 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
 #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
 #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
+#define V4L2_CID_NOTIFY_GAIN_RED		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
+#define V4L2_CID_NOTIFY_GAIN_GREENR		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
+#define V4L2_CID_NOTIFY_GAIN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
+#define V4L2_CID_NOTIFY_GAIN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 
 
 /* Image processing controls */
-- 
2.17.1

