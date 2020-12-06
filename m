Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DDC2D02C0
	for <lists+linux-media@lfdr.de>; Sun,  6 Dec 2020 11:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbgLFK21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 05:28:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgLFK20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 05:28:26 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C3DC061A53
        for <linux-media@vger.kernel.org>; Sun,  6 Dec 2020 02:27:42 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id q16so10481771edv.10
        for <linux-media@vger.kernel.org>; Sun, 06 Dec 2020 02:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LkouQoHke2anJQVlx6D+TqgyIrZywjU7nWFfQMQRPxY=;
        b=Zy6Na8/YzIOd0z/7FasMN5MglqMug1tF32Gc3OnmDlsGum7uvzEwyIB1CudNYNlfm2
         crPc0ItSFBNqkP14lXbpricf+h5ZOmzALro36jKuD7eJbJsuRQhhzD571XiKthcnqnaw
         mqxKWaNEq7NgN0MxK2iaKcKvfymAEw0aOqwKnSdtTrwlvfgO1etpd8y+nV0anyc4pE+4
         iSAWeWIHp9Wy4XztzOuQer5beIpFrSGMuxvTqMivz27ohpdUxW8WKyev1eEExOGg8RkE
         XLUAbmpSTbI3Xw0TiZAq8Q9odneYApw8nbLtXIOa/zoP9utaB1TZ1sbS4qfw3JlyVplZ
         niSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LkouQoHke2anJQVlx6D+TqgyIrZywjU7nWFfQMQRPxY=;
        b=IaoktVMbudr/fHrhE+CxpY1rBRqQTpcknDAhdzb1jJQ7JcXyt44IwAcGinmLmDdXK7
         MnL/Rq4QViZrrv2XXBBZwRXJ9DBJv57DV3UqhgWcB6N2Dn78WG1GE5iaCwrjiRTqDe1b
         LbaQoqRcqZ+RP9E9cg9v0iI7AlGMbWC3t8VIGYWwSDv1ORiXXMUsuMLg9oj6MjwE3FSv
         jGE3/Z9U5KhIksGVru+/wltHZGLRzqBKbAnKXgRDk6wCAzeugwb+ve9NtHiMRzCtc10W
         G3grDsCpQ5dNi6JkNVsFWEg1FgVaopBybnfb+Qh4qaUw6BEPUuDuSdl8dPbBYkOPBwCv
         fTrw==
X-Gm-Message-State: AOAM533+wYF8ODTZ5Nl/R3QIU/APLb83cDIat5P3y/TmV+bfaJe4RNTK
        BgU6kh20r6sNwPQ7Cu4eSnMsG61qeDpQAyIV
X-Google-Smtp-Source: ABdhPJyJ9Aq31+G1+lnPE1SoJrpmby5XBaFqfCWelPv22Qs8OsJUd5sgrtDCiioNfRvfhmWAbrZsdQ==
X-Received: by 2002:a50:e083:: with SMTP id f3mr18754edl.223.1607250461360;
        Sun, 06 Dec 2020 02:27:41 -0800 (PST)
Received: from localhost.localdomain (hst-221-17.medicom.bg. [84.238.221.17])
        by smtp.gmail.com with ESMTPSA id d4sm8464736edq.36.2020.12.06.02.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 02:27:40 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/4] media: v4l2-ctrls: Add intra-refresh period control
Date:   Sun,  6 Dec 2020 12:27:14 +0200
Message-Id: <20201206102717.19000-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201206102717.19000-1-stanimir.varbanov@linaro.org>
References: <20201206102717.19000-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a control to set intra-refresh period.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 11 +++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                  |  2 ++
 include/uapi/linux/v4l2-controls.h                    |  1 +
 3 files changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 454ecd9a0f83..d65d7c1381b7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1104,6 +1104,17 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     macroblocks is refreshed until the cycle completes and starts from
     the top of the frame. Applicable to H264, H263 and MPEG4 encoder.
 
+``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD (integer)``
+    Intra macroblock refresh period. This sets the period to refresh
+    the whole frame. With other words, this defines the number of frames
+    for which the whole frame will be intra-refreshed.  An example:
+    setting period to 1 means that the whole frame will be refreshed,
+    setting period to 2 means that the half of macroblocks will be
+    intra-refreshed on frameX and the other half of macroblocks
+    will be refreshed in frameX + 1 and so on. Setting period to zero
+    means no period is specified.
+    Applicable to H264 and HEVC encoders.
+
 ``V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE (boolean)``
     Frame level rate control enable. If this control is disabled then
     the quantization parameter for each frame type is constant and set
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 5cbe0ffbf501..ac44848d2d6e 100644
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
@@ -1260,6 +1261,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		break;
 	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 823b214aac0c..54b9072ac49d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -422,6 +422,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+227)
 #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
 #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
+#define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD	(V4L2_CID_CODEC_BASE+230)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
-- 
2.17.1

