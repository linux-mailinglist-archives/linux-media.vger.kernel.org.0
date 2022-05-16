Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE0552866B
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 16:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244161AbiEPOE4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 10:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237003AbiEPOEz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 10:04:55 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424AC3A18F
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 07:04:54 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id d188-20020a25cdc5000000b00648429e5ab9so13192120ybf.13
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 07:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=TzhRNhSvZip0U+P9bw1a3ilxnx9VjzybHPf6lKSqclk=;
        b=cHe0ooWxXH1cD2V3U1gZkS2koDAl2KLtsJrhbK3GPXR/HGNaF/IvmsVINFcqUTLZuA
         iPBD+CAow/fG+pJZuvgnUwT63KuzrzWAjD8Z1miO+SeLJwh6wCxqx2jBwNlrCz+X5yzx
         6WSlwnjzNwv5PV2sCjCf8E1BwVWPGRF3xHIUklOjl34CU4kgVUmqupAcj8P4U6tcW/9L
         GOqo5L2I0hnl7Z6gpdb4Xr4h2ILLEvwh5es7Ut0t6mApkyMQ52PqwKUFUUAJS2R6Uu6I
         sdZRBJ6uQNrT/fmUXC07u9DrYgYDa3I0D37OrsQs4jacMXBrdIpqyGm4m+qJs0gmJY2I
         47Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=TzhRNhSvZip0U+P9bw1a3ilxnx9VjzybHPf6lKSqclk=;
        b=vJV/gCoUmNWVY2Q3fLmC8OKljzemKwl9eRKC6dKutestysWvRFLflXsRj8jvxJQ3wn
         CTiyBwxnBJz0bwJoLZ0XW67v7q912v0r1vhZtpnM5rExbEziN53EnjZt4xnGyaw8iMmc
         CrQHgBqrL7IPQ2CwFc/smJWPJOf3ljB3eKYLYNRDDG1lHGaKO8/eAPOXvpZ54JM5kzu0
         BaBJhR9IrbRV+tEGVewVA6WRBPyEhBty4tgd05xDwksPm6VhAKYow7Ade/uOoqtRyB6X
         lzRYxjC6Z2jg7NKfAljCIudcIdU8XrU4JY/roJ0z8WhrSaLLlgpHI5smAsu78HF+l/qP
         BD2g==
X-Gm-Message-State: AOAM533kuwpZsWNav85Msxb9dXlpOZLLXZaaRVT7C44RqYMy9yVAoqyU
        sGOlCSPDXFisiim+KGjnY3fTri10iJE=
X-Google-Smtp-Source: ABdhPJxskj/y+H8V2baE0tM7PKkvDdAFTJ6s7exTncMZMSOoPhqTePzrT+Xm7P68oHC3T3BvrHGrqFN8ZLU=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:2bd1:4151:d530:8b73])
 (user=yunkec job=sendgmr) by 2002:a05:6902:2ce:b0:64b:9bbd:34fa with SMTP id
 w14-20020a05690202ce00b0064b9bbd34famr14917749ybh.440.1652709893476; Mon, 16
 May 2022 07:04:53 -0700 (PDT)
Date:   Mon, 16 May 2022 23:04:30 +0900
In-Reply-To: <20220516140434.1871022-1-yunkec@google.com>
Message-Id: <20220516140434.1871022-3-yunkec@google.com>
Mime-Version: 1.0
References: <20220516140434.1871022-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v2 2/6] media: v4l2_ctrl: Add region of interest auto control
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Yunke Cao <yunkec@google.com>
---
 .../media/v4l/ext-ctrls-camera.rst            | 25 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
 include/uapi/linux/v4l2-controls.h            |  9 +++++++
 3 files changed, 36 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index 86a1f09a8a1c..3da66e1e1fc7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -665,3 +665,28 @@ enum v4l2_scene_mode -
 ``V4L2_CID_REGION_OF_INTEREST_RECT (struct)``
     This control determines the region of interest. Region of interest is an
     rectangular area represented by a struct v4l2_rect.
+
+``V4L2_CID_REGION_OF_INTEREST_AUTO (bitmask)``
+    This determines which, if any, on board features should track to the
+    Region of Interest.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE``
+      - Auto Exposure.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS``
+      - Auto Iris.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
+      - Auto White Balance.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS``
+      - Auto Focus.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT``
+      - Auto Face Detect.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
+      - Auto Detect and Track.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
+      - Image Stabilization.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
+      - Higher Quality.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 95f39a2d2ad2..f28763bf95e9 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1043,6 +1043,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
 	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
 	case V4L2_CID_REGION_OF_INTEREST_RECT:  return "Region Of Interest Rectangle";
+	case V4L2_CID_REGION_OF_INTEREST_AUTO:  return "Region Of Interest Auto Controls";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1415,6 +1416,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_JPEG_ACTIVE_MARKER:
 	case V4L2_CID_3A_LOCK:
 	case V4L2_CID_AUTO_FOCUS_STATUS:
+	case V4L2_CID_REGION_OF_INTEREST_AUTO:
 	case V4L2_CID_DV_TX_HOTPLUG:
 	case V4L2_CID_DV_TX_RXSENSE:
 	case V4L2_CID_DV_TX_EDID_PRESENT:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 499fcddb6254..f6938e4de129 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1009,6 +1009,15 @@ enum v4l2_auto_focus_range {
 #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
 
 #define V4L2_CID_REGION_OF_INTEREST_RECT	(V4L2_CID_CAMERA_CLASS_BASE+36)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO	(V4L2_CID_CAMERA_CLASS_BASE+37)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE		(1 << 0)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK	(1 << 5)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION	(1 << 6)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY		(1 << 7)
 
 /* FM Modulator class control IDs */
 
-- 
2.36.0.550.gb090851708-goog

