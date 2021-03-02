Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B155832A85D
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580224AbhCBRar (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:30:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1577807AbhCBJyn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Mar 2021 04:54:43 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44729C061794
        for <linux-media@vger.kernel.org>; Tue,  2 Mar 2021 01:54:02 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id p8so7714509ejb.10
        for <linux-media@vger.kernel.org>; Tue, 02 Mar 2021 01:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6IV5VLrP2K6hakTQn5ZKKEh0aLDdahbFbJ/jSG0w0Qk=;
        b=mt3f0nccW8Be+pKxoRLkK919cWp9XaFIhiLsVUFy/KTwAbqgTW6woAgd1dMFKsG70H
         x207CdNv0v7gLoleaAZAkJ1JnQSGbamQRHQXU8ZHfdnxZi7MBv7gepXNjjh/4hkwRhX0
         +5aHRy+dpeexRDWzlpqglyXDJxJax166IZSGt8L485nBNtf7+Uvxgl0/ImtX9BCIOH+B
         mRJCKIQfKY8vG/kO8rb1VwPo5DXii8ro94/wq0NWdwbhGeWbFTAbjEP1Bgw8hc2a3YUT
         sciQC0UTDPuSvkXuilEryUsF8Gua4NWtjVk6/zA0rjZIA2jtV1MePeX7GCKMncKORt15
         9KIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6IV5VLrP2K6hakTQn5ZKKEh0aLDdahbFbJ/jSG0w0Qk=;
        b=BoLxzGaf8Qij+iPgfDLVb3QTJJ5Nd1iM4t7lN1Xr9qReUU+DDijYDFPPOZG1e/fQV+
         uoiDXtMIeC4RAzvcqYANWDE/ejjChPxMNqT9evo+wQUomhm0t5iL6xOB1McgiIf4f+Al
         AcK4RWvndth5Kg9mK9hBwdQDLE6H8cEaXxuer+2TfIJX3BOfb4h3t7zwAcSzh6s9Prd6
         SAkFpybgGWzkMOSRdblR8unj3tTpDKkWmcJl1osmveET9UKgFweHz2Gi9pEd8X091tVP
         4m0CbyWMo9ON5KkxfSQffuZWjELbadhdJICACWXUk2I++RiWXD00BWt1x8IcO3K8xLG+
         z9mw==
X-Gm-Message-State: AOAM5309eCjS0UaG2judL1txP0zoTYs7ofMQf5P9j8ov5x6IC6LpEMwa
        b6MenirWGQjGXzN9zdW6o+FMsVxN45R+RujW
X-Google-Smtp-Source: ABdhPJweNw/k9wLfEaT79zQYNRF7Yt7r5/uF5qc/QVfKMZNVlZ57jJrWf9GWgv+E/gGMWfJOLQTjiQ==
X-Received: by 2002:a17:906:2a06:: with SMTP id j6mr19490245eje.164.1614678840805;
        Tue, 02 Mar 2021 01:54:00 -0800 (PST)
Received: from localhost.localdomain (hst-208-217.medicom.bg. [84.238.208.217])
        by smtp.gmail.com with ESMTPSA id be27sm2530535edb.47.2021.03.02.01.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 01:54:00 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 1/2] media: v4l2-ctrls: Add intra-refresh period control
Date:   Tue,  2 Mar 2021 11:53:39 +0200
Message-Id: <20210302095340.3584204-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302095340.3584204-1-stanimir.varbanov@linaro.org>
References: <20210302095340.3584204-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a control to set intra-refresh period.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst      | 12 ++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                 |  2 ++
 include/uapi/linux/v4l2-controls.h                   |  1 +
 3 files changed, 15 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 00944e97d638..49e6d364ded7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1104,6 +1104,18 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     macroblocks is refreshed until the cycle completes and starts from
     the top of the frame. Applicable to H264, H263 and MPEG4 encoder.
 
+``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD (integer)``
+    Intra macroblock refresh period. This sets the period to refresh
+    the whole frame. In other words, this defines the number of frames
+    for which the whole frame will be intra-refreshed.  An example:
+    setting period to 1 means that the whole frame will be refreshed,
+    setting period to 2 means that the half of macroblocks will be
+    intra-refreshed on frameX and the other half of macroblocks
+    will be refreshed in frameX + 1 and so on. Setting period to zero
+    means no period is specified. Note that intra-refresh  is mutually
+    exclusive with V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB control.
+    Applicable to H264 and HEVC encoders.
+
 ``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE (boolean)``
     Frame level rate control enable. If this control is disabled then
     the quantization parameter for each frame type is constant and set
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 016cf6204cbb..2ee463e08f1e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -869,6 +869,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:	return "Decoder Slice Interface";
 	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 Loop Filter Enable";
 	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "Number of Intra Refresh MBs";
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:		return "Intra Refresh Period";
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:		return "Frame Level Rate Control Enable";
 	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
@@ -1276,6 +1277,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		break;
 	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 039c0d7add1b..1fddd9f0d4f1 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -428,6 +428,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
 #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
 #define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+230)
+#define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD	(V4L2_CID_CODEC_BASE+231)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
-- 
2.25.1

