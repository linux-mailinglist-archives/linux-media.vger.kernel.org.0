Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09E313129E7
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 06:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhBHFT4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 00:19:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbhBHFTy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 00:19:54 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15919C061788;
        Sun,  7 Feb 2021 21:19:14 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id z9so8113603pjl.5;
        Sun, 07 Feb 2021 21:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R/cys4fKGzGYJ+TE5kF+dhLs7puKNz2YuqBkYhaB6Lc=;
        b=gNyMr6ocMASJX/9vzRW0FISKHYAR7frYmmvHqoZbdrJjlkhGihKWeI8smzu27GUF0y
         fYMydjl5IQqlwHUEU0pG1+NMCOMZZwX9NaSr0cYWY/HPmql2ixYwOIqhhGf+ysfhZ8pL
         m/KkxJKvYeWrxljoCM0iOx/213UUjPmVn3qvhcQq1df8WRjoo3B2szmHCrmR/fPLFyvb
         XJ/liTt3qvtItNEkQAO4YL/Mi4K0oMJv2YuoB7AL2GMq6tHT1FXfzj/JmBHzpFrvEwlC
         zhUk2khsZMWQbMXEdx8P8umn/SFFAAXIXyJ4TkBonev3t7XMYVl2q7OhZsxU1V5cLj8M
         N8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R/cys4fKGzGYJ+TE5kF+dhLs7puKNz2YuqBkYhaB6Lc=;
        b=DDF7zATocu49EE/T/E/wlRvjPjWwgs0d4n/c/h47D2IsHNtjCZFoZ0l8ScZzCNUDeu
         f7fllTWFey3ilbuzPFP2wICAzSMQXNixFv21P6NlidI/Tr7Fy2vv3RlpsZqse3NvYNQ7
         5jpgswfblkYrYpW2QRK9XZSKHR+np8Q23yKKk38cZh17UeziFE8Cuby3HbCJ/fZ8lnje
         V8kcanvUBmd5hez6MDhlx0o+BSS9vrVZij+4gPfiUY8lJnbZQn+8ECR9Gu28m0pyWgyc
         ckIlWO5JdHsUVkdQqomHJC22pHegR2p6v7JQ6SOGoCq/pNGtvuriosw9mGI7mmbRsdLq
         DP/A==
X-Gm-Message-State: AOAM532GBXMPos09cgQ/w4aQFRz1JiG9O1KZlXEnlC4Q+KFoOYllzADh
        pcD9DZJelmj8f/0peV3GlIk=
X-Google-Smtp-Source: ABdhPJzRYuvnZ+/Y2XiRdFxX6bQQybPGTtOwKxZf2rdf6Ugk5JalSjfAVzeSW7/PBUSL+GOMvjF6Fw==
X-Received: by 2002:a17:902:778e:b029:de:b475:c430 with SMTP id o14-20020a170902778eb02900deb475c430mr14697382pll.53.1612761553582;
        Sun, 07 Feb 2021 21:19:13 -0800 (PST)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id 1sm14644458pjk.34.2021.02.07.21.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 21:19:12 -0800 (PST)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        sergey.senozhatsky@gmail.com,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 2/3] media: uvcvideo: add ROI auto controls
Date:   Mon,  8 Feb 2021 14:17:48 +0900
Message-Id: <20210208051749.1785246-3-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

This patch adds support for Region of Interest bmAutoControls.

ROI control is a compound data type:
  Control Selector     CT_REGION_OF_INTEREST_CONTROL
  Mandatory Requests   SET_CUR, GET_CUR, GET_MIN, GET_MAX, GET_DEF
  wLength 10
  Offset   Field            Size
  0        wROI_Top         2
  2        wROI_Left        2
  4        wROI_Bottom      2
  6        wROI_Right       2
  8        bmAutoControls   2       (Bitmap)

uvc_control_mapping, however, can handle only s32 data type at the
moment: ->get() returns s32 value, ->set() accepts s32 value; while
v4l2_ctrl maximum/minimum/default_value can hold only s64 values.

Hence ROI control handling is split into two patches:
a) bmAutoControls is handled via uvc_control_mapping as V4L2_CTRL_TYPE_MENU
b) ROI rectangle (SET_CUR, GET_CUR, GET_DEF) handling is implemented
   separately, by the means of selection API.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/v4l/ext-ctrls-camera.rst            | 25 +++++++++++++++++++
 drivers/media/usb/uvc/uvc_ctrl.c              | 19 ++++++++++++++
 include/uapi/linux/usb/video.h                |  1 +
 include/uapi/linux/v4l2-controls.h            |  9 +++++++
 4 files changed, 54 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index c05a2d2c675d..1593c999c8e2 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -653,6 +653,31 @@ enum v4l2_scene_mode -
                           |                    |
                           +--------------------+
 
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
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIXATION``
+      - Image Stabilization.
+    * - ``V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
+      - Higher Quality.
+
 
 .. [#f1]
    This control may be changed to a menu control in the future, if more
diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index b3dde98499f4..5502fe540519 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -355,6 +355,15 @@ static const struct uvc_control_info uvc_ctrls[] = {
 		.flags		= UVC_CTRL_FLAG_GET_CUR
 				| UVC_CTRL_FLAG_AUTO_UPDATE,
 	},
+	{
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.index		= 21,
+		.size		= 10,
+		.flags		= UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_CUR
+				| UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX
+				| UVC_CTRL_FLAG_GET_DEF
+	},
 };
 
 static const struct uvc_menu_info power_line_frequency_controls[] = {
@@ -753,6 +762,16 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
+	{
+		.id		= V4L2_CID_REGION_OF_INTEREST_AUTO,
+		.name		= "Region of Interest (auto)",
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_REGION_OF_INTEREST_CONTROL,
+		.size		= 16,
+		.offset		= 64,
+		.v4l2_type	= V4L2_CTRL_TYPE_BITMASK,
+		.data_type	= UVC_CTRL_DATA_TYPE_BITMASK,
+	},
 };
 
 /* ------------------------------------------------------------------------
diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
index d854cb19c42c..c87624962896 100644
--- a/include/uapi/linux/usb/video.h
+++ b/include/uapi/linux/usb/video.h
@@ -104,6 +104,7 @@
 #define UVC_CT_ROLL_ABSOLUTE_CONTROL			0x0f
 #define UVC_CT_ROLL_RELATIVE_CONTROL			0x10
 #define UVC_CT_PRIVACY_CONTROL				0x11
+#define UVC_CT_REGION_OF_INTEREST_CONTROL		0x14
 
 /* A.9.5. Processing Unit Control Selectors */
 #define UVC_PU_CONTROL_UNDEFINED			0x00
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 039c0d7add1b..6a3dac481cb4 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -976,6 +976,15 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
 #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO	(V4L2_CID_CAMERA_CLASS_BASE+34)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE		(1 << 0)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK	(1 << 5)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_IMAGE_STABILIXATION	(1 << 6)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY	(1 << 7)
 
 #define V4L2_CID_CAMERA_ORIENTATION		(V4L2_CID_CAMERA_CLASS_BASE+34)
 #define V4L2_CAMERA_ORIENTATION_FRONT		0
-- 
2.30.0

