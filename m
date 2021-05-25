Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2454B39064E
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 18:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbhEYQO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 12:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbhEYQO0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 12:14:26 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E0BC06138A;
        Tue, 25 May 2021 09:12:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id 2C18E1F4282D
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v11 6/9] media: uapi: Add a control for HANTRO driver
Date:   Tue, 25 May 2021 18:12:35 +0200
Message-Id: <20210525161238.1191168-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525161238.1191168-1-benjamin.gaignard@collabora.com>
References: <20210525161238.1191168-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The HEVC HANTRO driver needs to know the number of bits to skip at
the beginning of the slice header.
That is a hardware specific requirement so create a dedicated control
for this purpose.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../userspace-api/media/drivers/hantro.rst    | 19 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst     |  1 +
 include/media/hevc-ctrls.h                    | 13 +++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst

diff --git a/Documentation/userspace-api/media/drivers/hantro.rst b/Documentation/userspace-api/media/drivers/hantro.rst
new file mode 100644
index 000000000000..cd9754b4e005
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/hantro.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Hantro video decoder driver
+===========================
+
+The Hantro video decoder driver implements the following driver-specific controls:
+
+``V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (integer)``
+    Specifies to Hantro HEVC video decoder driver the number of data (in bits) to
+    skip in the slice segment header.
+    If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
+    to before syntax element "slice_temporal_mvp_enabled_flag".
+    If IDR, the skipped bits are just "pic_output_flag"
+    (separate_colour_plane_flag is not supported).
+
+.. note::
+
+        This control is not yet part of the public kernel API and
+        it is expected to change.
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 1a9038f5f9fa..12e3c512d718 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -33,6 +33,7 @@ For more details see the file COPYING in the source distribution of Linux.
 
 	ccs
 	cx2341x-uapi
+        hantro
 	imx-uapi
 	max2175
 	meye-uapi
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index e53666a1127f..dc964ff7cd29 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -225,4 +225,17 @@ struct v4l2_ctrl_hevc_decode_params {
 	__u64	flags;
 };
 
+/*  MPEG-class control IDs specific to the Hantro driver as defined by V4L2 */
+#define V4L2_CID_CODEC_HANTRO_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1200)
+/*
+ * V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP -
+ * the number of data (in bits) to skip in the
+ * slice segment header.
+ * If non-IDR, the bits to be skipped go from syntax element "pic_output_flag"
+ * to before syntax element "slice_temporal_mvp_enabled_flag".
+ * If IDR, the skipped bits are just "pic_output_flag"
+ * (separate_colour_plane_flag is not supported).
+ */
+#define V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP	(V4L2_CID_CODEC_HANTRO_BASE + 0)
+
 #endif
-- 
2.25.1

