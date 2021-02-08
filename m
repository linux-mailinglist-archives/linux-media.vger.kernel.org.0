Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8003129E5
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 06:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbhBHFTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 00:19:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbhBHFTu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 00:19:50 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7684DC061786;
        Sun,  7 Feb 2021 21:19:10 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id e12so7195223pls.4;
        Sun, 07 Feb 2021 21:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tqO60tUqU9nr/XMWsc6/Nywy5Se8rNTmCzmhTijHWqw=;
        b=EyjSoTUlvvCBWWcYTD5qORfML23WNYrePGcDk9Skk4+7Mt9Eucactnh8SBiixe6crI
         h4AZp5VpxHyYxHJ99oYxrvagzkVTCPN90jOrFGBSMgoDuYFiNhO5K+Abz+u4OVvt7Sh8
         mSCdh5iG6OwEDP+N92CjnhmLhQ6W4hNTVX5mWXbHQMXzLetHk3pVJvVhbGOpnQAzeEXE
         rp39Q+kLjazS0YEwb9K18FUzWgh1I5yW/XFsI9UD1e2d4B5aVlWZpKqxfTmWQ8O6V713
         Z7caLQtAQSH2KekybAU1meulj2X9ZJgBpINBfo/yzJvcKpB2mykiScbKNJMQoJZ/G6iz
         TV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tqO60tUqU9nr/XMWsc6/Nywy5Se8rNTmCzmhTijHWqw=;
        b=NlzTUrGH3pMkVb1Vk9YPEftJGV6/qNZN5lTqWHz9wfYcn11AQXQsTifpQ+//BY6mmH
         +8i5WF0SDCke8cBdaVKGk+Sstv42HCgtnr4mlvCzSBrq0Y+koGGtYlsweULNrK5/Zygf
         1ybLApf5e50JZpXNE576zZOTm/NnFBhipRhJBZ2MdZSNF6ewmCwZ5DbLO5pYoKFFVDTF
         ij7zm8B9z4KT5YoH5ra9v5cBV6j8O0zWaxnVoOY00cUIwb07VI+V9fsjEOQZ4PuLCnnm
         AfezI6b76TIJHPkdWJq3g+0+HWPSkrjNN2MlbZH2waY13uaXvv8r3yzUD1JuGvSaTaya
         kEsA==
X-Gm-Message-State: AOAM533qth50goL5n0i+KkZnCl6JjKtDoOONuR9ebfM8QvgYgPQSEY4M
        RM2loUlmeMxDGNwhl8ZrIeY=
X-Google-Smtp-Source: ABdhPJyZEbLLoLgU1W8k6pSQYnLWWjWewiSfuvEx0NMO4jvbGSkY/ErOBSlqFP2PvKWKRqYJ9fgUmw==
X-Received: by 2002:a17:90a:4548:: with SMTP id r8mr15489260pjm.16.1612761549914;
        Sun, 07 Feb 2021 21:19:09 -0800 (PST)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id 1sm14644458pjk.34.2021.02.07.21.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 21:19:09 -0800 (PST)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        sergey.senozhatsky@gmail.com,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 1/3] media: v4l UAPI docs: document ROI selection targets
Date:   Mon,  8 Feb 2021 14:17:47 +0900
Message-Id: <20210208051749.1785246-2-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

Document new v4l2-selection target which will be used for the
Region of Interest v4l2 control.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/v4l/selection-api-configuration.rst | 23 +++++++++++++++++++
 .../media/v4l/v4l2-selection-targets.rst      | 21 +++++++++++++++++
 include/uapi/linux/v4l2-common.h              |  8 +++++++
 3 files changed, 52 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/selection-api-configuration.rst b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
index fee49bf1a1c0..9f69d71803f6 100644
--- a/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
+++ b/Documentation/userspace-api/media/v4l/selection-api-configuration.rst
@@ -135,3 +135,26 @@ and the height of rectangles obtained using ``V4L2_SEL_TGT_CROP`` and
 ``V4L2_SEL_TGT_COMPOSE`` targets. If these are not equal then the
 scaling is applied. The application can compute the scaling ratios using
 these values.
+
+Configuration of Region of Interest (ROI)
+=========================================
+
+The range of coordinates of the top left corner, width and height of
+areas that can be ROI is given by the ``V4L2_SEL_TGT_ROI_BOUNDS`` target.
+It is recommended for the driver developers to put the top/left corner
+at position ``(0,0)``. The rectangle's coordinates are in global sensor
+coordinates. The units are in pixels and independent of the field of view.
+They are not impacted by any cropping or scaling that is currently being
+used.
+
+The top left corner, width and height of the Region of Interest area
+currently being employed by the device is given by the
+``V4L2_SEL_TGT_ROI_CURRENT`` target. It uses the same coordinate system
+as ``V4L2_SEL_TGT_ROI_BOUNDS``.
+
+In order to change active ROI top left, width and height coordinates
+use ``V4L2_SEL_TGT_ROI`` target.
+
+Each capture device has a default ROI rectangle, given by the
+``V4L2_SEL_TGT_ROI_DEFAULT`` target. Drivers shall set the ROI rectangle
+to the default when the driver is first loaded, but not later.
diff --git a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
index e877ebbdb32e..cb3809418fa6 100644
--- a/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst
@@ -69,3 +69,24 @@ of the two interfaces they are used.
 	modified by hardware.
       - Yes
       - No
+    * - ``V4L2_SEL_TGT_ROI_CURRENT``
+      - 0x0200
+      - Current Region of Interest rectangle.
+      - Yes
+      - No
+    * - ``V4L2_SEL_TGT_ROI_DEFAULT``
+      - 0x0201
+      - Suggested Region of Interest rectangle.
+      - Yes
+      - No
+    * - ``V4L2_SEL_TGT_ROI_BOUNDS``
+      - 0x0202
+      - Bounds of the Region of Interest rectangle. All valid ROI rectangles fit
+	inside the ROI bounds rectangle.
+      - Yes
+      - No
+    * - ``V4L2_SEL_TGT_ROI``
+      - 0x0203
+      - Sets the new Region of Interest rectangle.
+      - Yes
+      - No
diff --git a/include/uapi/linux/v4l2-common.h b/include/uapi/linux/v4l2-common.h
index 7d21c1634b4d..d0c108fba638 100644
--- a/include/uapi/linux/v4l2-common.h
+++ b/include/uapi/linux/v4l2-common.h
@@ -78,6 +78,14 @@
 #define V4L2_SEL_TGT_COMPOSE_BOUNDS	0x0102
 /* Current composing area plus all padding pixels */
 #define V4L2_SEL_TGT_COMPOSE_PADDED	0x0103
+/* Current Region of Interest area */
+#define V4L2_SEL_TGT_ROI_CURRENT	0x0200
+/* Default Region of Interest area */
+#define V4L2_SEL_TGT_ROI_DEFAULT	0x0201
+/* Region of Interest bounds */
+#define V4L2_SEL_TGT_ROI_BOUNDS	0x0202
+/* Set Region of Interest area */
+#define V4L2_SEL_TGT_ROI		0x0203
 
 /* Selection flags */
 #define V4L2_SEL_FLAG_GE		(1 << 0)
-- 
2.30.0

