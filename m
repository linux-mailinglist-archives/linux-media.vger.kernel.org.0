Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A592FCE7F
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733054AbhATKem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731312AbhATJ2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:28:18 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADAEC06179B
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 01:26:37 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id b5so16117678ejv.4
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 01:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iOLteU0y/E6exJE5YL/l2x0USlJDB217kK70I6Kv1VE=;
        b=MddKoXzskkXvWo93r04q+Opa483XZHht2VNNMubr45P9407hBYjlYEw0jNazZadnKt
         o5Qj75aL1fnNK4ZJhbnR9lJK239X6zzR/m3Jf94hmekS/ZHzYq3TopWIFQ1wME8hccNi
         86VAFjFhaPlqHDch0Qu03nt96We4EyMarAtoTpKDWfMNPKGtIJD9WBut4F4VlYXQ0jmF
         vvFoCzBwlmpqvVgwR3kiVK5LRzCGskiac/zgX02izhZ6C1+OTerqyBDwLfqXtOfJCKik
         UdEDnGpz842JWWkS/NDK+fSr6UenIZAeT+JPfGq55msUDNZrnCB6cYd4ezU9oc53Ty2q
         nOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iOLteU0y/E6exJE5YL/l2x0USlJDB217kK70I6Kv1VE=;
        b=nIraib5UcdZ7q92PDCeNJ2D+iTqA4S+FntxR0fg6w7KbCVBAhbWIrGZSz6YroxRBet
         9VG9lBoGLRYrSKaLA2YxFNJSpS1rYTJTuskF83AefozBshwroZoe606Q4S/uTMXuPt9d
         cD+XKf0uaOVJD9n6fN+gf1LCI5qcYIx0tYoITCQp06Zhrns2e0TVqCY7DGX0JdJPAOp/
         A2gZR2hr2luzG1OxBG5Zab/zB552tuMeug4Oprc/TM/KUy4e79xJbfF97mi/QEgbpUWx
         eTCcGL/DMcmsHfW3/Byg8CO2nCQhaJIZfagqQzsalV42JiLvL2BkYnnExcxPekJz4RYA
         PFtA==
X-Gm-Message-State: AOAM531e6Dam/bx6lWkR08jqOkxldoQ/WbtwnBnkprJB83eQu3Xmu1mP
        fAAAdTG1aMu8Ystosy2dL+yPmuOz+B8dvVCm
X-Google-Smtp-Source: ABdhPJzAPhI3KgBmfKmfQLJQF8mt67kcPhSiGlpSf1ZqglTSXI6Pgc5n+gjcnbMVwZQQM02E9IdQ/w==
X-Received: by 2002:a17:906:d98:: with SMTP id m24mr5388335eji.428.1611134795728;
        Wed, 20 Jan 2021 01:26:35 -0800 (PST)
Received: from localhost.localdomain (hst-221-66.medicom.bg. [84.238.221.66])
        by smtp.gmail.com with ESMTPSA id k16sm619392ejd.78.2021.01.20.01.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:26:35 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 4/5] docs: Document CLL and Mastering display colorimetry controls
Date:   Wed, 20 Jan 2021 11:26:05 +0200
Message-Id: <20210120092606.3987207-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
References: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document Content Light Level and Mastering Display v4l2 colorimetry
controls.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/v4l/ext-ctrls-colorimetry.rst       | 71 +++++++++++++++++++
 .../media/videodev2.h.rst.exceptions          |  2 +
 2 files changed, 73 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
index 6b0cd2054e84..e7e55323651f 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
@@ -17,3 +17,74 @@ Colorimetry Control IDs
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
+        samples for the pictures of a coded video sequence, cd/m2. When
+        equal to 0 no such upper bound is present.
+    * - __u16
+      - ``max_pic_average_light_level``
+      - The upper bound for the maximum average light level among the
+        samples for any individual picture of a coded video sequence, cd/m2.
+        When equal to 0 no such upper bound is present.
+
+``V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY (struct)``
+    The mastering display defines the colour volume (the colour primaries,
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
+      - Specifies the normalized x chromaticity coordinate of the colour
+        primary component c of the mastering display in increments of 0.00002.
+        For describing the mastering display that uses Red, Green and Blue
+        colour primaries, index value c equal to 0 corresponds to the Green
+        primary, c equal to 1 corresponds to Blue primary and c equal to 2
+        corresponds to the Red colour primary.
+    * - __u16
+      - ``display_primaries_y[3]``
+      - Specifies the normalized y chromaticity coordinate of the colour
+        primary component c of the mastering display in increments of 0.00002.
+        For describing the mastering display that uses Red, Green and Blue
+        colour primaries, index value c equal to 0 corresponds to the Green
+        primary, c equal to 1 corresponds to Blue primary and c equal to 2
+        corresponds to Red colour primary.
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
+        display in units of 0.0001 cd/m2.
+    * - __u32
+      - ``min_luminance``
+      - specifies the nominal minimum display luminance of the mastering
+        display in units of 0.0001 cd/m2.
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 0ed170c6e720..af4b8b87c5d7 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -147,6 +147,8 @@ replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`v4l2_ctrl_hdr10_cll_info`
+replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`v4l2_ctrl_hdr10_mastering_display`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
-- 
2.25.1

