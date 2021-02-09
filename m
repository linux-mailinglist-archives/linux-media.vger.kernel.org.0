Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886F0314C18
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 10:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhBIJtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 04:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhBIJrJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 04:47:09 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E34C0617A9
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 01:46:28 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id u14so2806322wmq.4
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 01:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1MJqHrGnM0dQu0DigyaEySsKOikDfnTwALiwB12s0IA=;
        b=sdkcqo0A9Izowz51J/Xl+MxE07qepu1wSn5rnIPp42yTTyJ7qzmmNeOWlam7RKWHEC
         nl/TbLDmBiFb8Cdjjc6V5UWn2uSK3dbTi8af6JvRi2g6AgQGTbzoUF3UrRHAPvSYzruc
         OjyC4lCRLth7+k5RxxPWNOxs4iANp+M7rJM9xhCty8UocfdC9VjYEgeIHW9CzH95suKc
         j2zPZscmfLgMQ0xAbeuMYSUyBcq8L9qBXxldj99Ae5UfBuT+HpOb7E+d5uz/puXKCW5e
         a0NnmLBPbD2dV+U0lxvJXs3MEaCERp8l0klwOZpBP7hc6p2Pfv4a7QWHhqGn+JK33hrE
         pXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1MJqHrGnM0dQu0DigyaEySsKOikDfnTwALiwB12s0IA=;
        b=adVxr0E+9o8TWpGGi0OtRm5gRnSJITtwhkxmevLtwC+iCia1Rx+nH7rQE0IH5vX+1C
         viINhFKve8dr4fZEL5TUv/QN0XzAhOtSSllRKmjCObzWIvJC39Rc+1lgZBkIzfb8Dlqr
         DHZQTPbWMlwpCnQir0RLcj+HnlMdW9C5ID7r9+9ndFJ4t+bj12BMMN+BhR16oWG/EGiH
         Qe5zcBzpV+y+eSTapI1yz3LG0FB/9hcqTcIVxigFxm4Ty4zUIre13bJgRQJWcOMFHrqU
         LcsS4ddylJa7J8CLkO3yC72fpi7wEE8ND0j3aHeuAgad89Ph7U3GcvclI1OQM6oFJvKz
         Be4w==
X-Gm-Message-State: AOAM532oBEjK+ZQvH1PtOYiRiPpi4+8Meu95g9V5iaKOV4GHLLsogRAB
        3yZXkMP9kpj3bzuifx6SNmArlq5gO/69fuYA
X-Google-Smtp-Source: ABdhPJyCFtPzgL4IocQjeap4megCyaapFbNH9N5yl0YRFY/K7tFIs00hzQli+R5XfFKveYfMDI7sjw==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr2581018wmc.136.1612863982243;
        Tue, 09 Feb 2021 01:46:22 -0800 (PST)
Received: from localhost.localdomain (hst-221-63.medicom.bg. [84.238.221.63])
        by smtp.gmail.com with ESMTPSA id u14sm1509627wro.10.2021.02.09.01.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 01:46:21 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/2] v4l2-ctrl: Add decoder conceal color control
Date:   Tue,  9 Feb 2021 11:45:26 +0200
Message-Id: <20210209094527.2173690-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210209094527.2173690-1-stanimir.varbanov@linaro.org>
References: <20210209094527.2173690-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add decoder v4l2 control to set conceal color.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/v4l/ext-ctrls-codec.rst             | 20 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 3 files changed, 30 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 00944e97d638..994650052333 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -674,6 +674,26 @@ enum v4l2_mpeg_video_frame_skip_mode -
     is currently displayed (decoded). This value is reset to 0 whenever
     the decoder is started.
 
+``V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR (integer64)``
+    This control sets conceal color in YUV color space. It describes the
+    client preference of error conceal color in case of error where
+    reference frame is missing. The decoder would paint the reference
+    buffer with preferred color and use it for future decoding.
+    Applicable to decoders.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - Bit 0:15
+      - Y luminance
+    * - Bit 16:31
+      - Cb chrominance
+    * - Bit 32:47
+      - Cr chrominance
+    * - Bit 48:63
+      - Must be zero
+
 ``V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE (boolean)``
     If enabled the decoder expects to receive a single slice per buffer,
     otherwise the decoder expects a single frame in per buffer.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 016cf6204cbb..a3b9d28a00b7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -945,6 +945,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_VBV_SIZE:			return "VBV Buffer Size";
 	case V4L2_CID_MPEG_VIDEO_DEC_PTS:			return "Video Decoder PTS";
 	case V4L2_CID_MPEG_VIDEO_DEC_FRAME:			return "Video Decoder Frame Count";
+	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:		return "Video Decoder Conceal Color";
 	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:			return "Initial Delay for VBV Control";
 	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:		return "Horizontal MV Search Range";
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
@@ -1430,6 +1431,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*max = 0x7fffffffffffffffLL;
 		*step = 1;
 		break;
+	case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
+		*type = V4L2_CTRL_TYPE_INTEGER64;
+		*min = 0;
+		/* default for 8bit black, luma is 16, chroma is 128 */
+		*def = 0x8000800010LL;
+		*max = 0xffffffffffffLL;
+		*step = 1;
+		break;
 	case V4L2_CID_PIXEL_RATE:
 		*type = V4L2_CTRL_TYPE_INTEGER64;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 039c0d7add1b..5e5a3068be2d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -428,6 +428,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
 #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
 #define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+230)
+#define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+231)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
-- 
2.25.1

