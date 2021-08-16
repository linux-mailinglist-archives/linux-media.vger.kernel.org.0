Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB0E3ED32E
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 13:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236179AbhHPLjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 07:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236131AbhHPLjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 07:39:54 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D76C0613C1
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 04:39:23 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id i10-20020a05600c354ab029025a0f317abfso14761779wmq.3
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=am3po7tFFKOjxreZAMFOikHzx21vo4EVP5N25KRWOrw=;
        b=SeNit5wJj4nBjC8V1JWGep2DMexTz3r3vajG5EF+GYq3qodNf3FC9zqafjztHtFkYF
         bWwjEWWM5Y3gdFSjRiL/AN0flbhD9XsvwFphW5a43JM8qJt8rbQZLoe5kULfJZmVfHfN
         2pIbkL0DCyBKIVTqeE1ncJKq18ZUtmaBo7U3oFeRcPPeysNopZvvHyQBUTSLHq8PkTNA
         kkiaGKfTybzStUrXDESHLJgv4fMNF+NlZV616fLYMC5WWCNO4aR1GP1d0rMUhAn1+gb1
         s9jl0SCAUB+h6s3yYpjahzRsDDkNzSAuyjLpOmZ9AVX2VhVvH2/FPMulFwnw2I5nAbXT
         XTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=am3po7tFFKOjxreZAMFOikHzx21vo4EVP5N25KRWOrw=;
        b=KzTu2HoD1adcKkv8WiWvvUw7lpTJJWCCwyrCfZE2ir4PGi40HTgVNUPFp120E/SRDk
         SKddbDl+AjB4DpU84MiTWWpapJ+qcRj3xIiv/1Ww9U8W756NCJRZWhoEfU0V3jHxKI3E
         VmJJY81y5+MSJGax/VBWLHhXVv0xDzIvCbwDqJ9I86F9zYNeyeMbVeN1cRV9rcK54XBY
         aqthXqi7ic62Vd+lrzEpSg9u/oTLiLiIwAo5nhSKJ6I28EFQFSdpn2xdBQHJAwePeBpw
         p7NmNpP31YzgQ6Y5fwHq+8IywH3CCTBY697KCzlP0YSaBomayZjSskiry5Z3yZJszeMp
         xC6w==
X-Gm-Message-State: AOAM533urDaBQ/ppn5MJe8uSsrQm5WE66f2t2l4kvg0v0HN25vi3ru50
        EfbwAf64wzIJtuXPPFyXj0nnA6xjrbxwag==
X-Google-Smtp-Source: ABdhPJycgAuGkRrGoCARbjoLrUD9iYcGipJ2CcLlm1dOsSv7NS83BethlJrIZ8hCzDpTeFOHLnhDtg==
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr14974909wmb.5.1629113961724;
        Mon, 16 Aug 2021 04:39:21 -0700 (PDT)
Received: from davidp-xps-13.lan (plowpeople3.plus.com. [80.229.223.72])
        by smtp.gmail.com with ESMTPSA id g9sm10356548wmk.34.2021.08.16.04.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 04:39:21 -0700 (PDT)
From:   David Plowman <david.plowman@raspberrypi.com>
To:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     David Plowman <david.plowman@raspberrypi.com>
Subject: [PATCH v6 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
Date:   Mon, 16 Aug 2021 12:39:08 +0100
Message-Id: <20210816113909.234872-2-david.plowman@raspberrypi.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210816113909.234872-1-david.plowman@raspberrypi.com>
References: <20210816113909.234872-1-david.plowman@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We add a new control V4L2_CID_NOTIFY_GAINS which allows the sensor to
be notified what gains will be applied to the different colour
channels by subsequent processing (such as by an ISP), even though the
sensor will not apply any of these gains itself.

For Bayer sensors this will be an array control taking 4 values which
are the 4 gains arranged in the fixed order B, Gb, Gr and R,
irrespective of the exact Bayer order of the sensor itself. The use of
an array makes it straightforward to extend this control to non-Bayer
sensors (for example, sensors with an RGBW pattern) in future.

The units are in all cases linear with the default value indicating a
gain of exactly 1.0. For example, if the default value were reported as
128 then the value 192 would represent a gain of exactly 1.5.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
 include/uapi/linux/v4l2-controls.h        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 421300e13a41..f87053c83249 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1107,6 +1107,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_GREENR:	return "Green (Red) Pixel Value";
 	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
+	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5532b5f68493..133e20444939 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1118,6 +1118,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
 #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
 #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
+#define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
 
 
 /* Image processing controls */
-- 
2.30.2

