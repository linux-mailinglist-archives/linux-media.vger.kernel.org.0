Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A153C23457D
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 14:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733168AbgGaMMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 08:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732863AbgGaMMx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 08:12:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FEBBC061574
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2020 05:12:53 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 808FB299281
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 1/2] media: pixfmt-meta-rkisp1.rst: add description of rkisp1 metadata formats in pixfmt-meta-rkisp1.rst
Date:   Fri, 31 Jul 2020 14:12:42 +0200
Message-Id: <20200731121243.25882-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731121243.25882-1-dafna.hirschfeld@collabora.com>
References: <20200731121243.25882-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The metadata formats V4L2_META_FMT_IPU3_PARAMS, V4L2_META_FMT_IPU3_3A
are currently described in two files under
drivers/staging/media/rkisp1/Documentation/media/uapi/v4l

This patch moves the description to one file:
Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
The patch also extends the description and adds the rst file to
toctree.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../userspace-api/media/v4l/meta-formats.rst  |  1 +
 .../media/v4l/pixfmt-meta-rkisp1.rst          | 49 +++++++++++++++++++
 .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    | 23 ---------
 .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      | 22 ---------
 4 files changed, 50 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
 delete mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
 delete mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst

diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 7dcc4bacbb0c..55a635534bc9 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -21,6 +21,7 @@ These formats are used for the :ref:`metadata` interface only.
 
     pixfmt-meta-d4xx
     pixfmt-meta-intel-ipu3
+    pixfmt-meta-rkisp1
     pixfmt-meta-uvc
     pixfmt-meta-vsp1-hgo
     pixfmt-meta-vsp1-hgt
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
new file mode 100644
index 000000000000..c8effdfd27bf
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _v4l2-meta-fmt-params-rkisp1:
+.. _v4l2-meta-fmt-stat-rkisp1:
+
+*****************************************************************************
+V4L2_META_FMT_RK_ISP1_PARAMS ('rk1p'), V4L2_META_FMT_RK_ISP1_STAT_3A ('rk1s')
+*****************************************************************************
+
+.. rkisp1_stat_buffer
+
+3A and histogram statistics
+===========================
+
+The ISP1 device collects different statistics over an input Bayer frame.
+Those statistics are obtained from the :ref:`rkisp1_stats <rkisp1_stats>` metadata capture video node,
+using the :c:type:`v4l2_meta_format` interface. The buffer contains a single instance of
+the C structure :c:type:`rkisp1_stat_buffer` defined in ``rkisp1-config.h``.
+So the structure can be obtained from the buffer by:
+
+.. code-block:: c
+
+	struct rkisp1_stat_buffer *stats = (struct rkisp1_stat_buffer*) buffer;
+
+The statistics collected are Exposure, AWB (Auto-white balance), Histogram and
+AF (Auto-focus). See :c:type:`rkisp1_stat_buffer` for details of the statistics.
+
+.. ipu3_uapi_params
+
+Configuration parameters
+========================
+
+The configuration parameters are passed to the :ref:`rkisp1_params <rkisp1_params>` metadata
+output video node, using the :c:type:`v4l2_meta_format` interface. The buffer contains
+a single instance of the C structure :c:type:`rkisp1_params_cfg` defined in
+``rkisp1-config.h``. So the structure can be obtained from the buffer by:
+
+.. code-block:: c
+
+	struct rkisp1_params_cfg *stats = (struct rkisp1_params_cfg*) buffer;
+
+The 3A statistics and configuration parameters described here are usually consumed
+and produced by dedicated user space libraries that comprise the important tuning
+tools using software control loop.
+
+rkisp1 uAPI data types
+======================
+
+.. kernel-doc:: drivers/staging/media/rkisp1/uapi/rkisp1-config.h
diff --git a/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst b/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
deleted file mode 100644
index 32034e481357..000000000000
--- a/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
+++ /dev/null
@@ -1,23 +0,0 @@
-.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-
-.. _v4l2-meta-fmt-rkisp1-params:
-
-============================
-V4L2_META_FMT_RK_ISP1_PARAMS
-============================
-
-Rockchip ISP1 Parameters Data
-
-Description
-===========
-
-This format describes input parameters for the Rockchip ISP1.
-
-It uses c-struct :c:type:`rkisp1_params_cfg`, which is defined in
-the ``linux/rkisp1-config.h`` header file.
-
-The parameters consist of multiple modules.
-The module won't be updated if the corresponding bit was not set in module_*_update.
-
-.. kernel-doc:: include/uapi/linux/rkisp1-config.h
-   :functions: rkisp1_params_cfg
diff --git a/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst b/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
deleted file mode 100644
index 4ad303f96421..000000000000
--- a/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
+++ /dev/null
@@ -1,22 +0,0 @@
-.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-
-.. _v4l2-meta-fmt-rkisp1-stat:
-
-=============================
-V4L2_META_FMT_RK_ISP1_STAT_3A
-=============================
-
-
-Rockchip ISP1 Statistics Data
-
-Description
-===========
-
-This format describes image color statistics information generated by the Rockchip
-ISP1.
-
-It uses c-struct :c:type:`rkisp1_stat_buffer`, which is defined in
-the ``linux/rkisp1-config.h`` header file.
-
-.. kernel-doc:: include/uapi/linux/rkisp1-config.h
-   :functions: rkisp1_stat_buffer
-- 
2.17.1

