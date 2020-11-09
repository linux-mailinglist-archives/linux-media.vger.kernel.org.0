Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42612AC281
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 18:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732276AbgKIRgk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 12:36:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731962AbgKIRgG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 12:36:06 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956EEC0613D6
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 09:36:05 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id t9so6267261edq.8
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 09:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4uG33267VrZPuq/TP2MGJz5yF4YqwpdNO7AQA5+ar2s=;
        b=O7BrI5oNvRv+OmwF/UkCImulVAiaztkPKqytKHXY+phxO3mvlbqqkcs7BYsB3rn+Ek
         gt/KpHJr49OZdbt3NADQHFhpcYjja0bSgE7+WXDaEpg9tTcJTvd6K9bJpFw7UGkQ6IPD
         zQD8Op68Wh8S0LF2m8pknytLEj1QY2q0+RspgasOMtL1dALe96WnNFKUYYvK+hSXueoQ
         +oLlVcUZJOe0gwrYm8fEiHaIm6U+zLyzi0+qN7XU+p4k1d/G15GbNbsUen5muluj1D8a
         WN9VnyOW3Mgpq3uRVEuGPeRZVRta5YJGcTWNftJ1lbfp+i4BmT7fpVjOCs1UsKaMm7tV
         6kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4uG33267VrZPuq/TP2MGJz5yF4YqwpdNO7AQA5+ar2s=;
        b=iKbmmtuHH5UBtK/zozQLwE4ip+a5pNRFiR9hhwS71bPJ4Smnpw7Pd/FJXtLgSglqFJ
         HmWPiwRGz3mr+C6vLWkVWc2doVi8f7nn9tUQm4EhyAly1V+NGEbLmFqbHfPBszPru7yQ
         6pgiWjHuLrSRhKYe/5Y1UV7qL1i9x1xWavQhVB2mxWG18K83fW1b+bgTmI7gW7RORF5H
         cJ9q87BzAWdwxqDn7DiEtZ3VFLDEbD1IFGxVtioQT9Dr1zd7Yz/aYABl/e7IVHHecxnM
         +Mb1H2X3u2ZzrsW+WxVcJ1+Z+XopIBsZ0/r7U2hS6mkl+tuqARIeLCUXFxeii10TLVgG
         nLWw==
X-Gm-Message-State: AOAM531TP+JHuuszVahx1P6BV7n4s2NKWFBnqTF5THVxN6RWaAjHL6zg
        r2ju24CAyVin4bNCb847ZJBXRPha2UPW/Yo7
X-Google-Smtp-Source: ABdhPJwd5XROm0SteLGhK+SA+asZkfwB4SG1O6GLXXZCMl1pEL4LS2NKMI2H3wIFjOKUXuYZgkXwcQ==
X-Received: by 2002:a50:a40f:: with SMTP id u15mr17002139edb.307.1604943362974;
        Mon, 09 Nov 2020 09:36:02 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id jw7sm9123981ejb.54.2020.11.09.09.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:36:02 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/4] v4l2-ctrl: Make display delay and display enable std controls
Date:   Mon,  9 Nov 2020 19:35:38 +0200
Message-Id: <20201109173541.10016-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109173541.10016-1-stanimir.varbanov@linaro.org>
References: <20201109173541.10016-1-stanimir.varbanov@linaro.org>
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
 include/uapi/linux/v4l2-controls.h                |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ce728c757eaf..82c9cda40270 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -679,6 +679,21 @@ enum v4l2_mpeg_video_frame_skip_mode -
     otherwise the decoder expects a single frame in per buffer.
     Applicable to the decoder, all codecs.
 
+``V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE (boolean)``
+    If the display delay is enabled then the decoder is forced to return
+    a CAPTURE buffer (decoded frame) after processing a certain number
+    of OUTPUT buffers. The delay can be set through
+    ``V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY``. This
+    feature can be used for example for generating thumbnails of videos.
+    Applicable to the decoder.
+
+``V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY (integer)``
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
index bd7f330c941c..4a21802e026b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -874,6 +874,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
 	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
 	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
+	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY:		return "Display Delay";
+	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE:	return "Display Delay Enable";
 	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
@@ -1221,6 +1223,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_FLASH_READY:
 	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
 	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
+	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE:
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
 	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
 	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
@@ -1256,6 +1259,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		break;
 	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
+	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 7035f4fb182c..d6b19f8d0022 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -773,6 +773,8 @@ enum v4l2_mpeg_video_frame_skip_mode {
 	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT	= 1,
 	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT	= 2,
 };
+#define V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY		(V4L2_CID_MPEG_BASE + 647)
+#define V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE	(V4L2_CID_MPEG_BASE + 648)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
-- 
2.17.1

