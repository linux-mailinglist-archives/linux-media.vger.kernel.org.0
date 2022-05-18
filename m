Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3661452B26F
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 08:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbiERGYn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 02:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbiERGYm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 02:24:42 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46BFD029B
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 23:24:41 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2fecc57ec14so12087387b3.11
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 23:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Xfvt1LaVaO+T3m/5lCLIEq9AbZw96kCNK23AJ/3Wj+c=;
        b=qUyd+mH67n7xtiP9ghaNJERRUyDiOrDZfrnsT+9tpAnN6btycm5UtBpzq4a4LbsTB9
         gExfiazysG01ttrm7NvMrhI51fgmdxV6Rm8biRK4uaeYyV1IhAGvsMur6zJO4OujdcKY
         iDMhHi+iEjKVp14xLmOwEGXRnMqywF+gE9WzAxOxQSBzcfAJm45bBGC/fEwNp7G3Pf/f
         WBHS+4fWlin6S6NDcB8q3/RWgg9NyiDXTcNAU8gFNCUeji3sCqR3i3YgT9WXmg7qT0/x
         896ABlesPKaFoU3/BU1KLEFlvAc7QlUwayigjXW4HH8gbwcZ2/glwX0IoqRI6U9HxFH9
         mMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Xfvt1LaVaO+T3m/5lCLIEq9AbZw96kCNK23AJ/3Wj+c=;
        b=ZZZ8mconiVcKRbYR4RmWdWI4B1aDNguGKyFLZs3kQEczKFeTpjqzH11bDq8HgXk2po
         8LFS2hv0CsRMpAmycCQs68lU2nal5X6TzaUL1vpkY1TeQgGxnSZNYHClBRHRsucAvoM5
         w6OWEaFbN2Elm102nb/ngEuO7FZOBM+4PRrwyVj9N8rPbrwhGJgSzPfBo5HeG5EKCIpv
         tgVst6odxaDrzIDHI5gH4zXKDJCDr2P90vEiVNoovqFYmTh5beKULunBcuP3349f3ZpF
         F234M3MRDsjBK1dZUVlSSMxbB5X+VZ6/MMmV+pGtUDke/UPVVyVnS0zMAzcbZDJ6mtP6
         5VVQ==
X-Gm-Message-State: AOAM531ENbxqP+Tje5TM3XkUhz5/IyjsbJJDaotLUVosFxccaxpc291h
        eJan7W8Aj9sdRn8sAQ00/r2eWsLMuaQ=
X-Google-Smtp-Source: ABdhPJxdG1afxcQ1dsYjxqM2FzHAkaFZ2zgzKst/7A22+uc8etBxOX9Is4ZDipk/WzKHrR4jG7bQAihOqUQ=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d4d4:2a73:fa69:7d32])
 (user=yunkec job=sendgmr) by 2002:a81:4fd4:0:b0:2ff:2c4c:a687 with SMTP id
 d203-20020a814fd4000000b002ff2c4ca687mr6317148ywb.500.1652855080882; Tue, 17
 May 2022 23:24:40 -0700 (PDT)
Date:   Wed, 18 May 2022 15:24:08 +0900
In-Reply-To: <20220518062412.2375586-1-yunkec@google.com>
Message-Id: <20220518062412.2375586-3-yunkec@google.com>
Mime-Version: 1.0
References: <20220518062412.2375586-1-yunkec@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [PATCH v3 2/6] media: v4l2_ctrl: Add region of interest auto control
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
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

Follows the UVC v1.5 class specification.

Signed-off-by: Yunke Cao <yunkec@google.com>
---
Changelog since v2:
- Better documentation.
- Rename V4L2_CID_REGION_OF_INTEREST_AUTO_EXPOSURE to
  V4L2_REGION_OF_INTEREST_AUTO_EXPOSURE, etc. The bit masks shouldn't
  have "CID" in it.

 .../media/v4l/ext-ctrls-camera.rst            | 39 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  3 ++
 include/uapi/linux/v4l2-controls.h            |  9 +++++
 3 files changed, 51 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index c988a72b97b2..c26c28cfcf6a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -671,3 +671,42 @@ enum v4l2_scene_mode -
    Setting a region of interest allows the camera to optimize the capture for
    the region. The value of ``V4L2_CID_REGION_OF_INTEREST_AUTO`` control
    determines the detailed behavior.
+
+``V4L2_CID_REGION_OF_INTEREST_AUTO (bitmask)``
+    This determines which, if any, on board features should track to the
+    Region of Interest specified by the current value of
+    ``V4L2_CID_REGION_OF_INTEREST_RECT``.
+
+    Max value is a mask indicating all supported Auto
+    Controls.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_EXPOSURE``
+      - Setting this to true enables automatic exposure time for the specified
+  	region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_IRIS``
+      - Setting this to true enables automatic iris aperture for the specified
+	region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_WHITE_BALANCE``
+      - Setting this to true enables automatic white balance adjustment for the
+	specified region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_FOCUS``
+      - Setting this to true enables automatic focus adjustment for the
+	specified region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_FACE_DETECT``
+      - Setting this to true enables automatic face detection for the
+	specified region.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK``
+      - Setting this to true enables automatic detection and tracking. The
+	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
+	the firmware.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION``
+      - Setting this to true enables automatic image stabilization. The
+	current value of ``V4L2_CID_REGION_OF_INTEREST_RECT`` may be updated by
+	the firmware.
+    * - ``V4L2_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY``
+      - Setting this to true enables automatically capture the specified region
+	with higher quality if possible.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 95f39a2d2ad2..220afc4d5244 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1043,6 +1043,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
 	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
 	case V4L2_CID_REGION_OF_INTEREST_RECT:  return "Region Of Interest Rectangle";
+	case V4L2_CID_REGION_OF_INTEREST_AUTO:  return "Region Of Interest Auto Controls";
+
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1415,6 +1417,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_JPEG_ACTIVE_MARKER:
 	case V4L2_CID_3A_LOCK:
 	case V4L2_CID_AUTO_FOCUS_STATUS:
+	case V4L2_CID_REGION_OF_INTEREST_AUTO:
 	case V4L2_CID_DV_TX_HOTPLUG:
 	case V4L2_CID_DV_TX_RXSENSE:
 	case V4L2_CID_DV_TX_EDID_PRESENT:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 499fcddb6254..13db0638533c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1009,6 +1009,15 @@ enum v4l2_auto_focus_range {
 #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
 
 #define V4L2_CID_REGION_OF_INTEREST_RECT	(V4L2_CID_CAMERA_CLASS_BASE+36)
+#define V4L2_CID_REGION_OF_INTEREST_AUTO	(V4L2_CID_CAMERA_CLASS_BASE+37)
+#define V4L2_REGION_OF_INTEREST_AUTO_EXPOSURE			(1 << 0)
+#define V4L2_REGION_OF_INTEREST_AUTO_IRIS			(1 << 1)
+#define V4L2_REGION_OF_INTEREST_AUTO_WHITE_BALANCE		(1 << 2)
+#define V4L2_REGION_OF_INTEREST_AUTO_FOCUS			(1 << 3)
+#define V4L2_REGION_OF_INTEREST_AUTO_FACE_DETECT		(1 << 4)
+#define V4L2_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK		(1 << 5)
+#define V4L2_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION	(1 << 6)
+#define V4L2_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY		(1 << 7)
 
 /* FM Modulator class control IDs */
 
-- 
2.36.0.550.gb090851708-goog

