Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF6134151E
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 06:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbhCSFyO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 01:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233934AbhCSFxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 01:53:55 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049E8C06175F
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:53:55 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id v3so2968509pgq.2
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 22:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hUuLvnE4iNx9waeqgL5Xgn7vAWrbF4/6uYgvJNfJksg=;
        b=UVOTQqJHmqbSvw07EbUCTFAVj5IMI31Xz8uAB6N6OxqUi9fvgpOSEhhVcnnyVWpW+s
         5bo73igaDKOwnax+Vqrf1uP/AUeY23eXLoiJrxepJwIofAghqVltSB383yzb5807HEYF
         yZh/wHRNZ4KzOdfB5knPeXK6yV93hxkQ9rxTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hUuLvnE4iNx9waeqgL5Xgn7vAWrbF4/6uYgvJNfJksg=;
        b=MuZxJndNPtidtcCgaJw/f/0P6P3h6t1K8cuCRGo+Wksjlp0vYt74adbURwiBN1cvig
         lrueivs/MhJJqgokZYd75E+Gy6zA+uj0o0DWmMzRWvEHAkdAI6NUXg1ftJ0v+VfBCoKX
         Kinag5zDGhaaH15CVLMc5GgYR5w40/Egqcly7ywI6D6ih3IZoQuasiQoR0MTlfcT/DH9
         a456xUqIY7BctYeTXeAvA8OMEvi1mmzzayoMkODdMAgqJUDe9zpil90XKun6jjS3cE9l
         ByTc46+5oysUsP4EPuwwEr/mN46dIiGqDbZ52YbaXHyDLK44mbPbo0ZDIVxeuRMx8bP1
         THZQ==
X-Gm-Message-State: AOAM530Hk1UzUv557LdYttt0A/PyQUOR1M+c4imF9RGZjrOQdOkN6wus
        Ax6+FkM+QDodLIZOws1IMU3oww==
X-Google-Smtp-Source: ABdhPJxVy4XVGCcz82gGDVFXdWhb4Y4yAGSiwmz+FlkVcTFDrFAkDmAg+DhTeTysBhsmD/fZmXSEfw==
X-Received: by 2002:aa7:8dda:0:b029:1fa:19b3:7ed9 with SMTP id j26-20020aa78dda0000b02901fa19b37ed9mr7681554pfr.32.1616133234579;
        Thu, 18 Mar 2021 22:53:54 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:6577:f83d:5865:dfac])
        by smtp.gmail.com with ESMTPSA id o13sm4043704pgv.40.2021.03.18.22.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 22:53:54 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 2/6] media: v4l UAPI: document ROI selection targets
Date:   Fri, 19 Mar 2021 14:53:38 +0900
Message-Id: <20210319055342.127308-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319055342.127308-1-senozhatsky@chromium.org>
References: <20210319055342.127308-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document V4L2 selection targets that will be used to ROI
implementation.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/v4l/selection-api-configuration.rst | 22 +++++++++++++++
 .../media/v4l/selection-api-examples.rst      | 28 +++++++++++++++++++
 .../media/v4l/v4l2-selection-targets.rst      | 24 ++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/selection-api-configuration.rst b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
index fee49bf1a1c0..b5fdd765e2db 100644
--- a/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
@@ -135,3 +135,25 @@ and the height of rectangles obtained using ``V4L2_SEL_TGT_CROP`` and
 ``V4L2_SEL_TGT_COMPOSE`` targets. If these are not equal then the
 scaling is applied. The application can compute the scaling ratios using
 these values.
+
+Configuration of Region of Interest (ROI)
+=========================================
+
+The range of auto-controls values and of coordinates of the top left
+corner, width and height of areas that can be ROI is given by the
+``V4L2_SEL_TGT_ROI_BOUNDS_MIN`` and ``V4L2_SEL_TGT_ROI_BOUNDS_MAX``
+targets. It is recommended for the driver developers to put the top/left
+corner at position ``(0,0)``.
+
+The top left corner, width and height of the Region of Interest area
+and auto-controls currently being employed by the device are given by
+the ``V4L2_SEL_TGT_ROI`` target. It uses the same coordinate system
+as ``V4L2_SEL_TGT_ROI_BOUNDS_MIN`` and ``V4L2_SEL_TGT_ROI_BOUNDS_MAX``.
+
+In order to change active ROI top left, width and height coordinates
+and ROI auto-controls use ``V4L2_SEL_TGT_ROI`` target.
+
+Each capture device has a default ROI rectangle and auto-controls
+value given by the ``V4L2_SEL_TGT_ROI_DEFAULT`` target. Drivers shall
+set the ROI rectangle to the default when the driver is first loaded,
+but not later.
diff --git a/Documentation/userspace-api/media/v4l/selection-api-examples.rst b/Documentation/userspace-api/media/v4l/selection-api-examples.rst
index 5f8e8a1f59d7..ad2664888700 100644
--- a/Documentation/userspace-api/media/v4l/selection-api-examples.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-examples.rst
@@ -82,3 +82,31 @@ Example: Querying for scaling factors
 	/* computing scaling factors */
 	hscale = (double)compose.r.width / crop.r.width;
 	vscale = (double)compose.r.height / crop.r.height;
+
+Setting Region Of Interest area to half of the default value
+
+Example: Simple ROI
+===========================
+
+.. code-block:: c
+
+	struct v4l2_selection roi = {
+	    .type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
+	    .target = V4L2_SEL_TGT_ROI_DEFAULT,
+	};
+	struct v4l2_rect r;
+
+	ret = ioctl(fd, VIDIOC_G_SELECTION, &roi);
+	if (ret)
+	    exit(-1);
+	/* setting smaller ROI rectangle */
+	r.width = roi.r.width / 2;
+	r.height = roi.r.height / 2;
+	r.left = roi.r.width / 4;
+	r.top = roi.r.height / 4;
+	roi.r = r;
+	roi.target = V4L2_SEL_TGT_ROI;
+	roi.flags = V4L2_SEL_FLAG_ROI_AUTO_EXPOSURE;
+	ret = ioctl(fd, VIDIOC_S_SELECTION, &roi);
+	if (ret)
+	    exit(-1);
diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
index b46bae984f35..d1dc9c50eb05 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
@@ -75,6 +75,30 @@ of the two interfaces they are used.
 	modified by hardware.
       - Yes
       - No
+    * - ``V4L2_SEL_TGT_ROI``
+      - 0x0200
+      - Current Region of Interest rectangle and auto-controls value.
+      - Yes
+      - No
+    * - ``V4L2_SEL_TGT_ROI_DEFAULT``
+      - 0x0201
+      - Suggested Region of Interest rectangle and auto-controls value.
+      - Yes
+      - No
+    * - ``V4L2_SEL_TGT_ROI_BOUNDS_MIN``
+      - 0x0202
+      - Minimum bounds of the Region of Interest rectangle and minimum
+	auto-controls value. All valid ROI rectangles and auto-controls
+	should be within minimum-maximum range.
+      - Yes
+      - No
+    * - ``V4L2_SEL_TGT_ROI_BOUNDS_MAX``
+      - 0x0203
+      - Maximum bounds of the Region of Interest rectangle and maximum
+	auto-controls value. All valid ROI rectangles and auto-controls
+	should be within minimum-maximum range.
+      - Yes
+      - No
 
 .. raw:: latex
 
-- 
2.31.0.rc2.261.g7f71774620-goog

