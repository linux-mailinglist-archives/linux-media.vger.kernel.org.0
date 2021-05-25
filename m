Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B7C3905C5
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbhEYPpz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhEYPpz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:45:55 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA20C061756
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 08:44:25 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id x8so32742845wrq.9
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 08:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QB5rbYaxeihEjSMoN5dAdVTi5PO0UCxWpYj6IuQlB8M=;
        b=KqNPu//9WI6I0t1cBsCA2uSyEd8hvS3P6h8nbZSFtu29yT1f/RCzd37GTLEvJWjg6T
         Ri6A+PIWic10+wdXK4WMPrzxTwKxDsucfsR4NKRXWOHvyUG0qBXQj3UxXXdSARAJ3iUY
         p7CCHtxn97JyqcCeG8ZJUcQS/WK4e0XmPrZov46E/a4Vu6UhMRF+wusBQPwkqd7sFlLC
         +kmIt+pywl/SpXi+w16o8BJhsPqDMQznEx3rSUmsX7x2B17d+I5XvQpl8LL/9ZDhdyXh
         W84nkpqFDfbyh7yLsaeYlyasCzIm17gK7+kPDF4IS+pR5QReTcVIXk0Y/4xzHWsFDnCe
         WZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QB5rbYaxeihEjSMoN5dAdVTi5PO0UCxWpYj6IuQlB8M=;
        b=euY1HmS9k76+E2L48e+Sb7Tt9LdmXi+apiVjgZTAwRM1UPu7Sf1yDKFPgrV9RK0Ckc
         Zaljr65BcHB7cBjUS40snY5K7QoiVTGlFmtYLeLT2FDRcGGGS9NWqi8fYKY24B47G8CX
         HfDhQQWa3RiO1OxWypk+qZXEZOcKGvh+yZTJCbeN9nJIQ6Lc/XKpjh85PIEfiQizdvYS
         Xxq1WeU43HpY0PZGAb7hH1WQ/9yGxuFgSn21Tau6/y19oFgtGFeebwVlUpY2rscj7K4r
         nLJMo8q7tXx2Dh6wOUKHO07kz0daqGB1c0IxaTkcQys2aql2cU7mtorVmruuwiFH68QD
         7Prg==
X-Gm-Message-State: AOAM532sVTGvmfV6Xixah6sXpCRHVJmOgOjnefr4rdNypd3EtF3soHLO
        +cIXv9SzJmN/OhOVewQMyurdjN8bQYVhoA==
X-Google-Smtp-Source: ABdhPJwjaqvqSHTSrhTpQLQGtOOhUhrVy5rUi6UwEDhgVUiw/sA098xWKZlJZZ4Ivg7XCFrmJi77sg==
X-Received: by 2002:a5d:6d04:: with SMTP id e4mr27430410wrq.344.1621957463110;
        Tue, 25 May 2021 08:44:23 -0700 (PDT)
Received: from localhost.localdomain (plowpeople3.plus.com. [80.229.223.72])
        by smtp.gmail.com with ESMTPSA id a11sm16753212wrr.48.2021.05.25.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:44:22 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v2 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX controls
Date:   Tue, 25 May 2021 16:44:16 +0100
Message-Id: <20210525154417.7426-2-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210525154417.7426-1-david.plowman@raspberrypi.com>
References: <20210525154417.7426-1-david.plowman@raspberrypi.com>
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

