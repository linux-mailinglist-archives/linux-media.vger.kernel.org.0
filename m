Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D33345FED
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbhCWNlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbhCWNk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:40:59 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDCBC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:40:59 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id w3so27168032ejc.4
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VmfOlnNHDrGmLQHATXfl48zw4SyfIPyue1iLUvZyyls=;
        b=Zb9/PTYVhs5fxyf2gd6VaeTMSPY0eS6j2Gzri/xH+FwcEyvVTS1w3AEVklOwZoUHXR
         mNU0AQddCuTDzUKVRTp3pH0NxrFzGweO/alaO2gWa+XrzlG+H/YGWxEUUJjT60MJXcWZ
         HmvxBQQsf9X7sZtTc8xhG1JnOAzrUlzf3bRwQ3NvQG5zwhpR94VOPaAM4+gAHPRqXJP9
         AhJ1VrgovS0E7yqQPdrdHON6MsCOuBa7Iq431lTkrZqCnzRYlrQliaX3nQVnrUCMVLHn
         lXzm2wDMkyKEoUCd8MgmrgKv3RsQ64niL4cFq1f7RLPtUEnxr2L263Lr3BScn7zIwhL3
         dbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VmfOlnNHDrGmLQHATXfl48zw4SyfIPyue1iLUvZyyls=;
        b=XJOLBKMFTpf3RKup315YISYiJJwbJvDc8o5pVR9hVEKHQrvDA28OwLtUxNUwYPptxi
         FhAu1rkcxO0RsM138Y7eWGtObzatdBg6w4LXRFrHUCKwNMtAxreRKkc951avpMMiJY3E
         p8ex5vtWFno03O2VHeYVuheTm3taBZ9dcZlqTMGEAHZKS1PfOdI93OToCvUiEI2W2JME
         BU+g8zp8iN6TnUAuZHxXHeaFgkJ0WSpCQWq6FNT4+Rba4dgatW+TKyhX/B7PejbryGIl
         TOk3lxcWTWA1vzF1nBYVEsrry8j76GWQNB3pM3FACJ1z3JRgpiQNlh0yQziHByggXTQy
         Zhtg==
X-Gm-Message-State: AOAM533n5EgAW9P0Sv+8C1vD9UUkKx5KtbaIN0d29MLwFch6Cl9891Wf
        NALJIk9IfmVH1vCi3DThQjPq1JiPhixDbXla
X-Google-Smtp-Source: ABdhPJxbEzSzYVv7LtNTxwLS2S/SXfSwa/RNW/sFA4QOiox8TuvGG1hs+FAK5z9OoJ2BRcjWVSEPeA==
X-Received: by 2002:a17:906:4bce:: with SMTP id x14mr4854113ejv.383.1616506858010;
        Tue, 23 Mar 2021 06:40:58 -0700 (PDT)
Received: from localhost.localdomain (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.gmail.com with ESMTPSA id r10sm11207317eju.66.2021.03.23.06.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:40:57 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, ezequiel@collabora.com,
        nicolas.dufresne@collabora.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v6 4/5] docs: Document CLL and Mastering display colorimetry controls
Date:   Tue, 23 Mar 2021 15:40:39 +0200
Message-Id: <20210323134040.943757-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323134040.943757-1-stanimir.varbanov@linaro.org>
References: <20210323134040.943757-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document Content Light Level and Mastering Display v4l2 colorimetry
controls.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/v4l/ext-ctrls-colorimetry.rst       | 71 +++++++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  8 +++
 .../media/videodev2.h.rst.exceptions          |  2 +
 3 files changed, 81 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
index 862f78b41b32..1e7265155715 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
@@ -20,3 +20,74 @@ Colorimetry Control IDs
     The Colorimetry class descriptor. Calling
     :ref:`VIDIOC_QUERYCTRL` for this control will
     return a description of this control class.
+
+``V4L2_CID_COLORIMETRY_HDR10_CLL_INFO (struct)``
+    The Content Light Level defines upper bounds for the nominal target
+    brightness light level of the pictures.
+
+.. c:type:: v4l2_ctrl_hdr10_cll_info
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hdr10_cll_info
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``max_content_light_level``
+      - The upper bound for the maximum light level among all individual
+        samples for the pictures of a video sequence, cd/m\ :sup:`2`.
+        When equal to 0 no such upper bound is present.
+    * - __u16
+      - ``max_pic_average_light_level``
+      - The upper bound for the maximum average light level among the
+        samples for any individual picture of a video sequence,
+        cd/m\ :sup:`2`. When equal to 0 no such upper bound is present.
+
+``V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY (struct)``
+    The mastering display defines the color volume (the color primaries,
+    white point and luminance range) of a display considered to be the
+    mastering display for the current video content.
+
+.. c:type:: v4l2_ctrl_hdr10_mastering_display
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hdr10_mastering_display
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``display_primaries_x[3]``
+      - Specifies the normalized x chromaticity coordinate of the color
+        primary component c of the mastering display in increments of 0.00002.
+        For describing the mastering display that uses Red, Green and Blue
+        color primaries, index value c equal to 0 corresponds to the Green
+        primary, c equal to 1 corresponds to Blue primary and c equal to 2
+        corresponds to the Red color primary.
+    * - __u16
+      - ``display_primaries_y[3]``
+      - Specifies the normalized y chromaticity coordinate of the color
+        primary component c of the mastering display in increments of 0.00002.
+        For describing the mastering display that uses Red, Green and Blue
+        color primaries, index value c equal to 0 corresponds to the Green
+        primary, c equal to 1 corresponds to Blue primary and c equal to 2
+        corresponds to Red color primary.
+    * - __u16
+      - ``white_point_x``
+      - Specifies the normalized x chromaticity coordinate of the white
+        point of the mastering display in increments of 0.00002.
+    * - __u16
+      - ``white_point_y``
+      - Specifies the normalized y chromaticity coordinate of the white
+        point of the mastering display in increments of 0.00002.
+    * - __u32
+      - ``max_luminance``
+      - Specifies the nominal maximum display luminance of the mastering
+        display in units of 0.0001 cd/m\ :sup:`2`.
+    * - __u32
+      - ``min_luminance``
+      - specifies the nominal minimum display luminance of the mastering
+        display in units of 0.0001 cd/m\ :sup:`2`.
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 15291be55299..f8847abd2766 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -216,6 +216,14 @@ still cause this situation.
       - ``p_fwht_params``
       - A pointer to a struct :c:type:`v4l2_ctrl_fwht_params`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_FWHT_PARAMS``.
+    * - struct :c:type:`v4l2_ctrl_hdr10_cll_info` *
+      - ``p_hdr10_cll``
+      - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_cll_info`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_HDR10_CLL_INFO``.
+    * - struct :c:type:`v4l2_ctrl_hdr10_mastering_display` *
+      - ``p_hdr10_mastering``
+      - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_mastering_display`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY``.
     * - void *
       - ``ptr``
       - A pointer to a compound type which can be an N-dimensional array
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 0ed170c6e720..38b31a9b9580 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -147,6 +147,8 @@ replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
-- 
2.25.1

