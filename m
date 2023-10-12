Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDBCF7C6224
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 03:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235242AbjJLBUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 21:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233990AbjJLBUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 21:20:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B508AB8;
        Wed, 11 Oct 2023 18:20:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D5C3115E;
        Thu, 12 Oct 2023 03:20:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697073610;
        bh=zG7RnJxnmWRmLrJ4A81/Ms67o6WpJQV9N23sdmmQBwY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hq8ZI9IfZiInCXlCPRQevPV9ytPTBSEH+fdgpc3Qf2Ev3zjs6/M2/80XnjIiM+cYO
         cKZLKBmysOhNI8H2f8GRpzcGDzmzVa5u3DmGB/xbVYlHLgErXuy0hv2MiT1P66QrbB
         HbBb+nIyZ+0MSabwER6EedC+Ckoy8f/ouy0Yy2EQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/3] media: uapi: Add controls for the THP7312 ISP
Date:   Thu, 12 Oct 2023 04:20:15 +0300
Message-ID: <20231012012016.11535-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
References: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The THP7312 is an external ISP from THine. As such, it implements a
large number of parameters to control all aspects of the image
processing. Many of those controls are already standard in V4L2, but
some are fairly device-specific.

Reserve a range of 32 controls for the device. The driver will implement
4 device-specific controls to start with, define and document them. 28
additional device-specific controls should be enough for future
development.

Co-developed-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/index.rst     |  1 +
 .../userspace-api/media/drivers/thp7312.rst   | 32 +++++++++++++++++++
 MAINTAINERS                                   |  2 ++
 include/uapi/linux/thp7312.h                  | 19 +++++++++++
 include/uapi/linux/v4l2-controls.h            |  6 ++++
 5 files changed, 60 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/thp7312.rst
 create mode 100644 include/uapi/linux/thp7312.h

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 1726f8ec86fa..6b62c818899f 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -41,4 +41,5 @@ For more details see the file COPYING in the source distribution of Linux.
 	npcm-video
 	omap3isp-uapi
 	st-vgxy61
+	thp7312
 	uvcvideo
diff --git a/Documentation/userspace-api/media/drivers/thp7312.rst b/Documentation/userspace-api/media/drivers/thp7312.rst
new file mode 100644
index 000000000000..7a40c42b1db9
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/thp7312.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+THine THP7312 ISP driver
+========================
+
+The THP7312 driver implements the following driver-specific controls:
+
+``V4L2_CID_THP7312_LOW_LIGHT_COMPENSATION``
+    Enable/Disable auto-adjustment, based on lighting conditions, of the frame
+    rate when auto-exposure is enabled.
+
+``V4L2_CID_THP7312_AUTO_FOCUS_METHOD``
+    Set method of auto-focus. Only takes effect when auto-focus is enabled.
+
+    .. flat-table::
+        :header-rows:  0
+        :stub-columns: 0
+        :widths:       1 4
+
+        * - ``0``
+          - Contrast-based auto focus
+        * - ``1``
+          - PDAF
+        * - ``2``
+          - Hybrid of contrast-based and PDAF
+
+``V4L2_CID_THP7312_NOISE_REDUCTION_AUTO``
+    Enable/Disable auto noise reduction.
+
+``V4L2_CID_THP7312_NOISE_REDUCTION_ABSOLUTE``
+    Set the noise reduction strength, where 0 is the weakest and 10 is the
+    strongest.
diff --git a/MAINTAINERS b/MAINTAINERS
index e7d0a4e47a4d..667026d44460 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21453,6 +21453,8 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
+F:	Documentation/userspace-api/media/drivers/thp7312.rst
+F:	include/uapi/linux/thp7312.h
 
 THUNDERBOLT DMA TRAFFIC TEST DRIVER
 M:	Isaac Hazan <isaac.hazan@intel.com>
diff --git a/include/uapi/linux/thp7312.h b/include/uapi/linux/thp7312.h
new file mode 100644
index 000000000000..2b629e05daf9
--- /dev/null
+++ b/include/uapi/linux/thp7312.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * THine THP7312 user space header file.
+ *
+ * Copyright (C) 2021 THine Electronics, Inc.
+ * Copyright (C) 2023 Ideas on Board Oy
+ */
+
+#ifndef __UAPI_THP7312_H_
+#define __UAPI_THP7312_H_
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_THP7312_LOW_LIGHT_COMPENSATION		(V4L2_CID_USER_THP7312_BASE + 0x01)
+#define V4L2_CID_THP7312_AUTO_FOCUS_METHOD		(V4L2_CID_USER_THP7312_BASE + 0x02)
+#define V4L2_CID_THP7312_NOISE_REDUCTION_AUTO		(V4L2_CID_USER_THP7312_BASE + 0x03)
+#define V4L2_CID_THP7312_NOISE_REDUCTION_ABSOLUTE	(V4L2_CID_USER_THP7312_BASE + 0x04)
+
+#endif /* __UAPI_THP7312_H_ */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 68db66d4aae8..99c3f5e99da7 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -209,6 +209,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_NPCM_BASE			(V4L2_CID_USER_BASE + 0x11b0)
 
+/*
+ * The base for THine THP7312 driver controls.
+ * We reserve 32 controls for this driver.
+ */
+#define V4L2_CID_USER_THP7312_BASE		(V4L2_CID_USER_BASE + 0x11c0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
Regards,

Laurent Pinchart

