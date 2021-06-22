Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C083B02FB
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 13:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhFVLmm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 07:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhFVLmi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 07:42:38 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B394C0617A6
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 04:40:21 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id i94so23245282wri.4
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 04:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SuSvtD+Nv+CHB27crL9nwMh5wHimNIqoxaFLzzkG3PY=;
        b=ijzVsaIB4FsCX9SbN3ecdP5Ei7CZr43XT9EKA5w58gn6k00DcpJvG9J0XT99hC87yX
         3ujmqoDlzmyQFGcA9KMW/fdY7BzsO5tflw/7Lj/BD0hpZpIZ/NITB2LQbrpZRdT47evY
         sVstdEzVSCppVDlWQbGrCQIlKWBocXDEtD+5ILfGE1eSeVR9x/cpORMMRTxd9hf7JSor
         dwRYx+yMaJ5nSeCqHW8j1d53lu1Zd5UZl+zMlrOrftCeTRaPxf0YjXBaTNSi00x37DO2
         k/y+L9j0xwHSP0hqhwMnSvDxMkMs+MhkR1Pc/RxBGDRy0GmKi+eQ+wtOMrs7OI3iYLs2
         bWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SuSvtD+Nv+CHB27crL9nwMh5wHimNIqoxaFLzzkG3PY=;
        b=e5pHe/yTsd6NL1nypWyRrCJb1xFoey8GL3xmDKAnMplvr+QVTp/zXRCh7hl8G15XU4
         ZOa+TR9FqRsoAo/I7WT5e3erGOxlBNKoDHgyRDtYalPSIY43DqOYQvgOhbnXxhMZpqHv
         5UPr8yEXfNZsZua8+84UhOYnFxKrJNbcZImqcO6MdujC3qefHlXqWphUBvKjOC9JF07Y
         k9/5sFns44R7oTd+Mu9KVwL0Klk2k1+R258/Ur10A/ZGHWxBaTCu7va18W0M8ITxy4fg
         9TF5CwZXo7XkhhgkeAQe8Wi3Npdqp0T3WFTh7alD/4gSvQBe7mhjVMCDxBzR6gyhfLY+
         p/kg==
X-Gm-Message-State: AOAM530MalsblPY+8AGVncVicz4f4DWbWfvZx1Bet6PBgB6APf8P2g3P
        vAWwOAOTiI+cfC9L6oM0HxGqpo+ypEUGMMPn
X-Google-Smtp-Source: ABdhPJxcgzqvhn6ITzSZ4EoXOUWS1jq2qmPrsdDpRnb5uj771RFW74Jtt2G3eoeUUuPYzq8I/AaSZw==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr4184521wru.73.1624362019899;
        Tue, 22 Jun 2021 04:40:19 -0700 (PDT)
Received: from localhost.localdomain (hst-221-32.medicom.bg. [84.238.221.32])
        by smtp.gmail.com with ESMTPSA id k2sm20690929wrw.93.2021.06.22.04.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:40:19 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 2/3] media: v4l2-ctrls: Add intra-refresh period control
Date:   Tue, 22 Jun 2021 14:39:57 +0300
Message-Id: <20210622113958.809173-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622113958.809173-1-stanimir.varbanov@linaro.org>
References: <20210622113958.809173-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a control to set intra-refresh period.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst | 17 ++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c       |  2 ++
 include/uapi/linux/v4l2-controls.h              |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index addf44b99dfa..64c76a3a1205 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1175,9 +1175,24 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     macroblocks refreshed every frame. Each frame a successive set of
     macroblocks is refreshed until the cycle completes and starts from
     the top of the frame. Setting this control to zero means that
-    macroblocks will not be refreshed.
+    macroblocks will not be refreshed.  Note that this control will not
+    take effect when ``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD`` control
+    is set to non zero value.
     Applicable to H264, H263 and MPEG4 encoder.
 
+``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD (integer)``
+    Intra macroblock refresh period. This sets the period to refresh
+    the whole frame. In other words, this defines the number of frames
+    for which the whole frame will be intra-refreshed.  An example:
+    setting period to 1 means that the whole frame will be refreshed,
+    setting period to 2 means that the half of macroblocks will be
+    intra-refreshed on frameX and the other half of macroblocks
+    will be refreshed in frameX + 1 and so on. Setting the period to
+    zero means no period is specified.
+    Note that if the client sets this control to non zero value the
+    ``V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB`` control shall be
+    ignored. Applicable to H264 and HEVC encoders.
+
 ``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE (boolean)``
     Frame level rate control enable. If this control is disabled then
     the quantization parameter for each frame type is constant and set
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index b6344bbf1e00..421300e13a41 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -833,6 +833,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:	return "Decoder Slice Interface";
 	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 Loop Filter Enable";
 	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "Number of Intra Refresh MBs";
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:		return "Intra Refresh Period";
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:		return "Frame Level Rate Control Enable";
 	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
@@ -1258,6 +1259,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
 	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
 	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index fdf97a6d7d18..5532b5f68493 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -435,6 +435,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX		(V4L2_CID_CODEC_BASE+233)
 #define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+234)
 #define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+235)
+#define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD	(V4L2_CID_CODEC_BASE+236)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
-- 
2.25.1

