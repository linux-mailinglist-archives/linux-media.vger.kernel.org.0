Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB64248057
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 10:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgHRIST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 04:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgHRISS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 04:18:18 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB00AC061342
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 01:18:17 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 13EAB29900B
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v6 1/6] media: Documentation: v4l: move table of v4l2_pix_format(_mplane) flags to pixfmt-v4l2.rst
Date:   Tue, 18 Aug 2020 10:18:01 +0200
Message-Id: <20200818081807.23134-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818081807.23134-1-dafna.hirschfeld@collabora.com>
References: <20200818081807.23134-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The table of the flags of the structs
v4l2_pix_format(_mplane) is currently in pixfmt-reserved.rst
which is wrong, it should be in pixfmt-v4l2.rst

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../userspace-api/media/v4l/pixfmt-reserved.rst | 17 -----------------
 .../userspace-api/media/v4l/pixfmt-v4l2.rst     | 17 +++++++++++++++++
 .../media/videodev2.h.rst.exceptions            |  2 +-
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 59b9e7238f90..74ab6b5ce294 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -263,20 +263,3 @@ please make a proposal on the linux-media mailing list.
 	of tiles, resulting in 32-aligned resolutions for the luminance plane
 	and 16-aligned resolutions for the chrominance plane (with 2x2
 	subsampling).
-
-.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
-
-.. _format-flags:
-
-.. flat-table:: Format Flags
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       3 1 4
-
-    * - ``V4L2_PIX_FMT_FLAG_PREMUL_ALPHA``
-      - 0x00000001
-      - The color values are premultiplied by the alpha channel value. For
-	example, if a light blue pixel with 50% transparency was described
-	by RGBA values (128, 192, 255, 128), the same pixel described with
-	premultiplied colors would be described by RGBA values (64, 96,
-	128, 128)
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst b/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
index e0ee2823ab1f..56a2952de873 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst
@@ -174,3 +174,20 @@ Single-planar format structure
         This information supplements the ``colorspace`` and must be set by
 	the driver for capture streams and by the application for output
 	streams, see :ref:`colorspaces`.
+
+.. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
+
+.. _format-flags:
+
+.. flat-table:: Format Flags
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 4
+
+    * - ``V4L2_PIX_FMT_FLAG_PREMUL_ALPHA``
+      - 0x00000001
+      - The color values are premultiplied by the alpha channel value. For
+        example, if a light blue pixel with 50% transparency was described
+	by RGBA values (128, 192, 255, 128), the same pixel described with
+	premultiplied colors would be described by RGBA values (64, 96,
+	128, 128)
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index ca05e4e126b2..659799cc1eca 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -180,7 +180,7 @@ replace define V4L2_CAP_IO_MC device-capabilities
 
 # V4L2 pix flags
 replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
-replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA reserved-formats
+replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA format-flags
 
 # V4L2 format flags
 replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
-- 
2.17.1

