Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3837A2C1923
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 00:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388161AbgKWXDY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 18:03:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388147AbgKWXDX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 18:03:23 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D4AC061A52
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 15:03:22 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h21so1076297wmb.2
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 15:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QhN+lDzmalRXq6eSeelHxy7r4hkE9XL9c8QWorRlPDE=;
        b=wnuFFlqTobGEjCkGMekAPp/naZTrAXJJdQ2RXyfr55HnRLiiJI7W8lRgJb//rpvg/p
         HNhly7cEb2zvPKMRV4yQCopV12KFgjwHSy5LETxKywp2brT5WOlp+2VNMdB8t8X/zSNm
         ykSco6BsD6SWB3/otfTXk+ZZxS1g3Uyiw6jfUrB6UlkZHLd8HC3HUytqw1HXI62HscLc
         wXoBuEcYB0ndJKvlrLpoQ3z+1jMGsmeY0yUrE8DuqqSV5r6vjap0/u0/aie33i6GKrNK
         pEHmHKvp35vcmOeBhso0TcSfgojhHGLJJYx5xwTVAYgaJECDEdPIeVEFFAG3fn2/45Iy
         Y35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QhN+lDzmalRXq6eSeelHxy7r4hkE9XL9c8QWorRlPDE=;
        b=MJiApVIrJhqTciC0RmTEUIjqO8MFHx3mVIyjndOnJCwuiMLpOv6rpVhQIKYE5mS6jz
         /HD8C8GQ/3uNBR4Id6zdlqZjxWqhqTCkMfVQFEXoeybDizIot+GiZxPeX/vttpmBvAzl
         0DCDBHsRACWpdIVOT61S3Bay6PaB3l9AFRT0fOdaKSkBi3/8N53ceyCUu+OOV32SLMIW
         SfocuFmQcQUOT0aOVRjv1HXMLgz5eJ/nJP2F8slM9bxa8IvOemJIKD700AUak7tjppBp
         1bBDYlRduSdSWuLybyUocl+dQKon7ptKzZ2PhWhziX7VIMPMrUZs2cQ/li6PtaZa1mSB
         nZFQ==
X-Gm-Message-State: AOAM531MHBb6ZOCr3/bL+hL+WN+jAn5XPyn/HdxicMNc40AMHYDe6+Dv
        hRmE8oQ1wQHEgYRz6xIRPNA7VFLQ8MKyow6z
X-Google-Smtp-Source: ABdhPJw4PG524YXfRWrpk4TmHXI+jEgDQANPHhtJtsza7IMl6rSzxsZbhWq+mQOHMVK5DXUMvcYbFg==
X-Received: by 2002:a1c:c205:: with SMTP id s5mr1187628wmf.122.1606172601259;
        Mon, 23 Nov 2020 15:03:21 -0800 (PST)
Received: from localhost.localdomain (hst-221-74.medicom.bg. [84.238.221.74])
        by smtp.gmail.com with ESMTPSA id q66sm1501463wme.6.2020.11.23.15.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 15:03:20 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 2/3] docs: media: Document CLL and Mastering display
Date:   Tue, 24 Nov 2020 01:02:56 +0200
Message-Id: <20201123230257.31690-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201123230257.31690-1-stanimir.varbanov@linaro.org>
References: <20201123230257.31690-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document Content light level and Mastering display colour volume.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/v4l/ext-ctrls-codec.rst             | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ce728c757eaf..1d26a5db07ef 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -4382,3 +4382,74 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - Selecting this value specifies that HEVC slices are expected
         to be prefixed by Annex B start codes. According to :ref:`hevc`
         valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
+
+``V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO (struct)``
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
+      - An upper bound on the maximum light level among all individual
+        samples for the pictures of coded video sequence, cd/m2. When
+        equal to 0 no such uppper bound is present.
+    * - __u16
+      - ``max_pic_average_light_level``
+      - An upper bound on the maximum average light level among the
+        samples for any individual picture of coded video sequence, cd/m2.
+        When equal to 0 no such uppper bound is present.
+
+``V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY (struct)``
+    The mastering display defines the colour volume (the colour primaries,
+    white point and luminance range) of a display considered to be the
+    mastering display for current video content.
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
+        For describing mastering display that use Red, Green and  Blue colour
+        primaries, index value c equal to 0 correspond to Green primary, c
+        equal to 1 correspond to Blue primary and c equal to 2 correspond to
+        Red colour primary.
+    * - __u16
+      - ``display_primaries_y[3]``
+      - Specifies the normalized y chromaticity coordinate of the colour
+        primary component c of the mastering display in increments of 0.00002.
+        For describing mastering display that use Red, Green and  Blue colour
+        primaries, index value c equal to 0 correspond to Green primary, c
+        equal to 1 correspond to Blue primary and c equal to 2 correspond to
+        Red colour primary.
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
-- 
2.17.1

