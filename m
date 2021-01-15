Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80D82F755C
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 10:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbhAOJ1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 04:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbhAOJ1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 04:27:43 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAADC061795
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 01:26:25 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id hs11so9985807ejc.1
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 01:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=t+LIjSQQZkRT5kA7Y1VVVn+LaJzyPGxbVa/mAnWmpfM=;
        b=Msso7NqhPhEB4q0UnUA8XAPok6JM03bozuMhwDOETKKxRwPjxCwRautZMeGgx5AsdV
         lJSzMqlyjQBcrcJgp95PfoEI2Q6fRp28H1lGx72DAu/EKKMjuf5hDuDVSAdcze/LajF5
         35/Tg8PdCZNZx9klkRPJrkGaBym+hZM/W9FDqYaRYe0Qw2YbSeMoM0S+rY/NFp/XyFgv
         jFc1wRHx2I55nWpib5/zg7V+aRYN25LHx/tD27UgnUYxCi887GcM3n3UFftH+ijkrGKY
         TIlANhAGkBILk0j01SuWILKsjurPq5GzAdGBTiwvGryMi5xAqY9dhVR/C/dzmj+igDEj
         d9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=t+LIjSQQZkRT5kA7Y1VVVn+LaJzyPGxbVa/mAnWmpfM=;
        b=G2S0OE19id4MFxIakdzqUbzPShEKkfzhln3xdddQfIqXYLsNrArUsA93aVABQkof8G
         gbshImMz/M27o0f7t2J0cCz4b6B4W5XAD5oxcbr0p1xo7JgKO0MdxSC7i3BMBxBVeRs0
         ovBZcDJxDqrpDVXP/gM9fESVCsTtVSimxeReDcnf4Sci57CwVYB0P1Pf/jFdyVdON36t
         QoKP6IjgUvmcbb+5Apky/OcFNrecXwzNBiyqd1I7KBBOAFzjyAP/jN3NSY6qcrg/5H/4
         2gW/J9euJGetiAVAw/NCdQHHEEgLcDrkvwDE6hHrCl6UK8EZwu03NgZjEaV8KDDAKRID
         t+kA==
X-Gm-Message-State: AOAM533xRtwbdaThenAzzyGZYMBIUcaXqw/lU030DIkv6TaubHAqTd4Z
        8YKOCgIWk88a1DONCRUNoe5QODIwr/H/a3V5
X-Google-Smtp-Source: ABdhPJxn30W4zKu9VCJ3o50F75dE3Sw6KR6uluS9N0XbHTzNL1rLZMcI1H9C7ygMJOID9q/CeST6DQ==
X-Received: by 2002:a17:906:94d2:: with SMTP id d18mr8129364ejy.94.1610702783791;
        Fri, 15 Jan 2021 01:26:23 -0800 (PST)
Received: from localhost.localdomain (hst-221-63.medicom.bg. [84.238.221.63])
        by smtp.gmail.com with ESMTPSA id u24sm3004140eje.71.2021.01.15.01.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 01:26:23 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/4] v4l2-ctrl: Make display delay and display enable std controls
Date:   Fri, 15 Jan 2021 11:26:04 +0200
Message-Id: <20210115092607.29849-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
References: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make display delay and display delay enable MFC controls standard v4l
controls. This will allow reuse of the controls for other decoder
drivers. Also the new proposed controls are now codec agnostic because
they could be used for any codec.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst   | 15 +++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c              |  4 ++++
 include/uapi/linux/v4l2-controls.h                |  3 +++
 3 files changed, 22 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 00944e97d638..5d7c47837035 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -679,6 +679,21 @@ enum v4l2_mpeg_video_frame_skip_mode -
     otherwise the decoder expects a single frame in per buffer.
     Applicable to the decoder, all codecs.
 
+``V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE (boolean)``
+    If the display delay is enabled then the decoder is forced to return
+    a CAPTURE buffer (decoded frame) after processing a certain number
+    of OUTPUT buffers. The delay can be set through
+    ``V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY``. This
+    feature can be used for example for generating thumbnails of videos.
+    Applicable to the decoder.
+
+``V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY (integer)``
+    Display delay value for decoder. The decoder is forced to
+    return a decoded frame after the set 'display delay' number of
+    frames. If this number is low it may result in frames returned out
+    of display order, in addition the hardware may still be using the
+    returned buffer as a reference picture for subsequent frames.
+
 ``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE (boolean)``
     Enable writing sample aspect ratio in the Video Usability
     Information. Applicable to the H264 encoder.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index f7b310240af2..2ae305d6db01 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -874,6 +874,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
 	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
 	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:		return "Display Delay";
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:	return "Display Delay Enable";
 	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
@@ -1241,6 +1243,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_FLASH_READY:
 	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
 	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
 	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
 	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
@@ -1276,6 +1279,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		break;
 	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 039c0d7add1b..4b361fdce231 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -797,6 +797,9 @@ enum v4l2_mpeg_video_frame_skip_mode {
 #define V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP        (V4L2_CID_CODEC_BASE + 651)
 #define V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP        (V4L2_CID_CODEC_BASE + 652)
 
+#define V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY		(V4L2_CID_CODEC_BASE + 653)
+#define V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE	(V4L2_CID_CODEC_BASE + 654)
+
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
 #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)
-- 
2.17.1

