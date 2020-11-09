Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3392AC260
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 18:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732111AbgKIRcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 12:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732095AbgKIRcV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 12:32:21 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4781C0613D4
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 09:32:19 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id ay21so9640294edb.2
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 09:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FGNFPuj/SX/rcqMTW0uy7ZBhU7+E+vudgCF6hi4C9Do=;
        b=K/q9QV3OM/pZlqVFg480sOR2HLKVB+UGI5Q88kxNCVOsAU1QmHphPzs7d/VJErln9/
         pXBsgE9IW02Pk5v7PwoKTFCoD3cigdUPJtp1OLeWpF4DUT2aVaM4kEwWZn7jq2yyUVlX
         YN7a3qZe3BNwFHcBvz5lb2eGI6l2u7FdvfqcPKgNGls3F1k01MK8aLh5AbKT0rc5Z1jn
         Ecej351fPYLZy3WKX+ypYWJGgUu3I2qil96zviN/cKjgoVFAtNhsaRMIn8p90f3xz3Rx
         3taElNqFCxCqhxHtJQRth5dh14iFtusqGWu+Sq4Hi3qc9Nw7FKLDeaD0yjKzvATHkQum
         2tOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FGNFPuj/SX/rcqMTW0uy7ZBhU7+E+vudgCF6hi4C9Do=;
        b=OueRYJacrJCBeyVdoIqHcMGGNckQ7xtmadppvm4o0V2w/45BBNP0wyYR5ePwCVVn+p
         stfxHhXQokNmQV2cqyloM9UQGq2jAc2YDYadFxwgmRLgmJXOMYaF/IbfVEUZ3aSKzMWy
         H4/sWB51HIvoGNqLDisckBoBcIi1aGEh2CyPtzylo/4xqOgouswwoGEXwiC9QRNmPhFq
         +lCGeJmRyza42qyyk80343Mr6hX8e57gnndpn/m2NR9VhekZ1XbkliN+eBMbIBMciOK1
         igIyxD/W/NBenywGW3q4HXd5oJPi6/dxxe7Q1P/qn2+4gYNTIUwzy87LfbsNEoSzxWTy
         s2ZQ==
X-Gm-Message-State: AOAM533+FB6ccNDsxngMLIVSRHD2WM4/GsRwSjJpfN6dhYQeadvkrAZq
        fTrQkYQLDVMR9liVs1jQlK2tv+lLfWjz8wwk
X-Google-Smtp-Source: ABdhPJyMJQrQJTwuF2GzVsX8AOFWtNJg7ZZydyNbS+xqZZiVJZf1tHX/Sj9G4pF+MVgAR4WBTaqV+g==
X-Received: by 2002:a50:f68b:: with SMTP id d11mr16978977edn.64.1604943138340;
        Mon, 09 Nov 2020 09:32:18 -0800 (PST)
Received: from localhost.localdomain (hst-221-32.medicom.bg. [84.238.221.32])
        by smtp.gmail.com with ESMTPSA id w18sm5037005edq.43.2020.11.09.09.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:32:17 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/3] docs: media: Document CLL and Mastering display
Date:   Mon,  9 Nov 2020 19:31:52 +0200
Message-Id: <20201109173153.23720-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
References: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document Content light level and Mastering display colour volume.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/v4l/ext-ctrls-codec.rst             | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ce728c757eaf..39d0aab5ca3d 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -4382,3 +4382,64 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - Selecting this value specifies that HEVC slices are expected
         to be prefixed by Annex B start codes. According to :ref:`hevc`
         valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO (struct)``
+    The Content Light Level defines upper bounds for the nominal target
+    brightness light level of the pictures.
+
+.. c:type:: v4l2_ctrl_hevc_cll_info
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hevc_cll_info
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``max_content_light_level``
+      - An upper bound on the maximum light level among all individual
+        samples for the pictures of coded video sequence, cd/m2.
+    * - __u16
+      - ``max_pic_average_light_level``
+      - An upper bound on the maximum average light level among the
+        samples for any idividual picture of coded video sequence, cd/m2.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY (struct)``
+    The mastering display defines the colour volume (the colour primaries,
+    white point and luminance range) of a display considered to be the
+    mastering display for current video content.
+
+.. c:type:: v4l2_ctrl_hevc_mastering_display
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hevc_mastering_display
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``display_primaries_x[3]``
+      - Specifies the normalized x chromaticity coordinate of the colour
+        primary component of the mastering display.
+    * - __u16
+      - ``display_primaries_y[3]``
+      - Specifies the normalized y chromaticity coordinate of the colour
+        primary component of the mastering display.
+    * - __u16
+      - ``white_point_x``
+      - Specifies the normalized x chromaticity coordinate of the white
+        point of the mastering display.
+    * - __u16
+      - ``white_point_y``
+      - Specifies the normalized y chromaticity coordinate of the white
+        point of the mastering display.
+    * - __u32
+      - ``max_luminance``
+      - Specifies the nominal maximum display luminance of the mastering
+        display.
+    * - __u32
+      - ``min_luminance``
+      - specifies the nominal minimum display luminance of the mastering
+        display.
-- 
2.17.1

