Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40563D231F
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 14:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhGVLca (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 07:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbhGVLc2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 07:32:28 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A13C061575
        for <linux-media@vger.kernel.org>; Thu, 22 Jul 2021 05:13:03 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id k14-20020a05600c1c8eb02901f13dd1672aso2411580wms.0
        for <linux-media@vger.kernel.org>; Thu, 22 Jul 2021 05:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vnR2lUf9gTQzwDBNDeTwAed1gYoD0FTWfr1g0VBZfns=;
        b=k0oJgwuknwFUDCg0GGpoWtKovAYgwWXb4db47EO0FJxY9ZxA2qixP/25/7iqIuIccN
         Zj7MPUo1c9cI9CivuaiOUqzOrfkAZl3yW8jIo1GIz/wdHpi1cCYg0/2EY7RNxHTmbMWU
         DWFC1zSyCmAreKeuedL+W4WUpNzLSYCaz1SFx/uglGeJUxtqD5AKdjftzMpD8casNTDU
         ReEUjAgyyev+riMVV6h2v8YaxVLjBjdpo8qnDMQnsfnMjplkSkNiR8yuNe6ZYOfNti40
         hvvkPrI7++dg0JFb4DIkBEzcsTGwDbOgwIZFoPOhOSGpaFmz4IjOVPJ+76PUNg46wxq1
         FRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vnR2lUf9gTQzwDBNDeTwAed1gYoD0FTWfr1g0VBZfns=;
        b=eP5TX6nXzV30Kni1QEBvokCmdqoraI6DpTrZ5qTckIlcDyWK5IMQXr0Y7VtAma8dtC
         NtFggEw0wQdJqVDsbicF3P4U0mqSaz1Uy+ePuqbEfs/UksN/j0q9hkvK6Ut/07vYWeH6
         waKS4obLClTDGaEggRHmFBvBSH4n7GLOwdMaf4T7/D27Rttwd+vLayZf8GdCAooMIexT
         31fFYv6tjvUk0KjsHgW8DJBaghw/YjDUHofkUcpvOwPOegrTAoAr2wHyJOjGFcPocjxG
         aUy3luxdO0p/M8qA5vFGGXCSKzwmvfsP5mAD7EarMd+SQBiwen/UPqtM/F5yoQ3duR0v
         xM/A==
X-Gm-Message-State: AOAM533WqrLgfUTmkk5PqolCaIFmoJHtWuokFvDU45eBsgXfWbefdtaS
        w+HF3m1eodGtYOBeaPZGtLs0XcYpwwIbpg==
X-Google-Smtp-Source: ABdhPJw6vfoqPlVKw0bQzV6Eo0KnupMH4vFSV2UclbHr0ddzhEoClMO/NE2Bt4wB4INYyi5tB6ESnA==
X-Received: by 2002:a1c:790a:: with SMTP id l10mr42552147wme.8.1626955981950;
        Thu, 22 Jul 2021 05:13:01 -0700 (PDT)
Received: from davidp-xps-13.pitowers.org ([2a00:1098:3142:14:b918:b36f:9ba:b778])
        by smtp.gmail.com with ESMTPSA id e8sm8448228wrc.6.2021.07.22.05.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 05:13:01 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v3 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX controls
Date:   Thu, 22 Jul 2021 13:12:48 +0100
Message-Id: <20210722121249.16483-2-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722121249.16483-1-david.plowman@raspberrypi.com>
References: <20210722121249.16483-1-david.plowman@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The units are linear with the default value indicating a gain of
exactly 1.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 4 ++++
 include/uapi/linux/v4l2-controls.h        | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index b6344bbf1e00..12c810cd4ae6 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1106,6 +1106,10 @@ const char *v4l2_ctrl_get_name(u32 id)
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
index fdf97a6d7d18..711930bb54f0 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1117,6 +1117,10 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
 #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
 #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
+#define V4L2_CID_NOTIFY_GAIN_RED		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
+#define V4L2_CID_NOTIFY_GAIN_GREENR		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
+#define V4L2_CID_NOTIFY_GAIN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
+#define V4L2_CID_NOTIFY_GAIN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 
 
 /* Image processing controls */
-- 
2.30.2

