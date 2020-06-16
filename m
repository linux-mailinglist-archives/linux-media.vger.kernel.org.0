Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DDC1FBFD1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 22:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731642AbgFPUP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 16:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731676AbgFPUPo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 16:15:44 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E683C0613EF
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 13:15:41 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id l27so23120716ejc.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gW9cbjjRPD6R6Z7AF3iL+tqbW8lQcn4mBsQDieJZv9Y=;
        b=TvS+lpRerMK7Vh9j8U/PXM8SvfVymFr6pX9tI7Shj29sprrHvMvzGEFsqWa8uXWTkR
         fOVEMyyl0EL25CtoL9PLNJS1BNdetkq7c5E9CpjAA8Ih08ptnMxWahoK/yYrRPsxaf7o
         vBtX/zJSXErob5isSOg8B063lsyxaN10ZtQ8oRHs25gZjXwJ8ISzStb9G2xesomdiiE/
         qfpNMoTc28Z7YRuPZC3AwKvAfV69ApepJGlGKe2hvVdJkGJlQeqpdZNYrkpbfFG74gxm
         hvQFytLZ7F2UwRii9qRLXt/bFCBm8/g695mr1gVqnG03s8/Fb42CuQL+VlLhNmbecWtl
         Ga5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gW9cbjjRPD6R6Z7AF3iL+tqbW8lQcn4mBsQDieJZv9Y=;
        b=ZQ1asQgIi7jd+egfxjXyoWgCZTjyXnBf+yBMcNisGVAXHgin3Y6llTfy0/HKhm3DBk
         YsJ7mDYT07DeTEs3zxrC9YsaPCUT6BPHdv1mgKfS8AYIHFafFvIFZOQof/LfudTLwcPY
         3Fixnp5OWJlnuWBNrZrtRSkMrqO5dymvFecYL87nY0LkWLnlqRFGit80wAfw3QtHRSl5
         u38rClMvoFrCgEdb+eHOAOt4trA4fsNaAI2pPauJ000ZGzpIJNFczeiGkPw7boppjnMm
         YVQf1lCLEM9yGK88ozzcB/EksLkljcqiS92avPDShUvfcX6q1A1GElbyrBTffp1MY5vV
         OW+Q==
X-Gm-Message-State: AOAM530IPXMv5Z1/smdDzU6+jVCeLk7PcyhwaTzOPRAUr65P98bGh5gE
        8X3uNnn4vf8jkfkWzmHqzH74ppF/TYI4mw==
X-Google-Smtp-Source: ABdhPJzgXkbMUwl8DMfZ408p8n1EGyMsTX1YMSgHzEF6jce2krk5jx3jQ+aRMOjy2tB0tYG6LH3ywA==
X-Received: by 2002:a17:906:7253:: with SMTP id n19mr4557425ejk.31.1592338539978;
        Tue, 16 Jun 2020 13:15:39 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.gmail.com with ESMTPSA id b14sm11602658ejq.105.2020.06.16.13.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 13:15:39 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 3/4] v4l2-ctrl: Add control for intra only decode
Date:   Tue, 16 Jun 2020 23:14:45 +0300
Message-Id: <20200616201446.15996-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616201446.15996-1-stanimir.varbanov@linaro.org>
References: <20200616201446.15996-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds a new decoder control to instruct the decoders to
produce on its output intra frames only. Usually in this mode
decoders might lower the count of output decoder buffers and
hence reduce memory usage.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst          | 9 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                     | 2 ++
 include/uapi/linux/v4l2-controls.h                       | 1 +
 3 files changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index b9d3f7ae6486..d7f34596f95b 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -652,6 +652,15 @@ enum v4l2_mpeg_video_bitrate_mode -
     otherwise the decoder expects a single frame in per buffer.
     Applicable to the decoder, all codecs.
 
+``V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY (boolean)``
+    If enabled the decoder should start decoding only intra frames. The
+    decoder consume first input buffer for progressive stream (or first
+    two buffers for interlace). Decoder might not allocate more output
+    buffers than it is required to consume one input frame. Usually the
+    decoder input buffers will contain only intra frames but it is not
+    mandatory. This control could be used for thumbnails generation.
+    Applicable to the decoder, all codecs.
+
 ``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE (boolean)``
     Enable writing sample aspect ratio in the Video Usability
     Information. Applicable to the H264 encoder.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index bc00d02e411f..2b1fb8dcd360 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -846,6 +846,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
 	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
+	case V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY:	return "Decode intra frames only";
 	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
@@ -1197,6 +1198,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
 	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
 	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
+	case V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY:
 	case V4L2_CID_WIDE_DYNAMIC_RANGE:
 	case V4L2_CID_IMAGE_STABILIZATION:
 	case V4L2_CID_RDS_RECEPTION:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 0f7e4388dcce..c64471e64aa7 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -744,6 +744,7 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
 #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
 #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
 #define V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY		(V4L2_CID_MPEG_BASE + 645)
+#define V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY	(V4L2_CID_MPEG_BASE + 646)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
-- 
2.17.1

