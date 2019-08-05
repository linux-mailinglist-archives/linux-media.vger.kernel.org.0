Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5595815D6
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 11:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbfHEJsg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 05:48:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51552 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfHEJsg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 05:48:36 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4B2F628A4B5;
        Mon,  5 Aug 2019 10:48:33 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [RFC PATCH 4/5] media: v4l2: Provide helpers for H264 codecs
Date:   Mon,  5 Aug 2019 11:48:26 +0200
Message-Id: <20190805094827.11205-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805094827.11205-1-boris.brezillon@collabora.com>
References: <20190805094827.11205-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/media/v4l2-core/Kconfig               |   5 +
 drivers/media/v4l2-core/Makefile              |   1 +
 .../media/v4l2-core/v4l2-mem2mem-h264-codec.c |  47 ++++++++
 include/media/v4l2-mem2mem-h264-codec.h       | 100 ++++++++++++++++++
 4 files changed, 153 insertions(+)
 create mode 100644 drivers/media/v4l2-core/v4l2-mem2mem-h264-codec.c
 create mode 100644 include/media/v4l2-mem2mem-h264-codec.h

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 2ee185b58c72..3841df2d9ac2 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -49,6 +49,11 @@ config V4L2_MEM2MEM_CODEC
 	bool
 	depends on V4L2_MEM2MEM_DEV
 
+config V4L2_MEM2MEM_H264_CODEC
+	bool
+	depends on V4L2_MEM2MEM_DEV
+	select V4L2_MEM2MEM_CODEC
+
 # Used by LED subsystem flash drivers
 config V4L2_FLASH_LED_CLASS
 	tristate "V4L2 flash API for LED flash class devices"
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 9c18fed9ea5a..67672adf2b78 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_VIDEO_TUNER) += tuner.o
 
 v4l2-mem2mem-y = v4l2-mem2mem-core.o
 v4l2-mem2mem-$(CONFIG_V4L2_MEM2MEM_CODEC) += v4l2-mem2mem-codec.o
+v4l2-mem2mem-$(CONFIG_V4L2_MEM2MEM_H264_CODEC) += v4l2-mem2mem-h264-codec.o
 obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
 
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem-h264-codec.c b/drivers/media/v4l2-core/v4l2-mem2mem-h264-codec.c
new file mode 100644
index 000000000000..d53d69825646
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-mem2mem-h264-codec.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Memory-to-memory H264 codec framework for Video for Linux 2.
+ *
+ * Helper functions for H264 codec devices that use memory buffers for both
+ * source and destination.
+ *
+ * Copyright (c) 2019 Collabora Ltd.
+ *
+ * Author:
+ *      Boris Brezillon <boris.brezillon@collabora.com>
+ */
+
+#include <linux/types.h>
+#include <media/v4l2-mem2mem-h264-codec.h>
+
+/**
+ * v4l2_m2m_h264_decode_run_preamble() - H264 decode run preamble
+ * @ctx: the context this run is triggered on
+ * @run: the H264 decode run object
+ *
+ * Initialize all @run fields (controls and src/dst bufs attached to this run).
+ */
+void v4l2_m2m_h264_decode_run_preamble(struct v4l2_m2m_codec_ctx *ctx,
+				       struct v4l2_m2m_h264_decode_run *run)
+{
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
+	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
+	run->slices_params = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_MPEG_VIDEO_H264_SPS);
+	run->sps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_MPEG_VIDEO_H264_PPS);
+	run->pps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX);
+	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
+
+	v4l2_m2m_codec_run_preamble(ctx, &run->base);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_h264_decode_run_preamble);
diff --git a/include/media/v4l2-mem2mem-h264-codec.h b/include/media/v4l2-mem2mem-h264-codec.h
new file mode 100644
index 000000000000..922e75d682ed
--- /dev/null
+++ b/include/media/v4l2-mem2mem-h264-codec.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Memory-to-memory H264 codec framework for Video for Linux 2.
+ *
+ * Helper functions for H264 codec devices that use memory buffers for both
+ * source and destination.
+ *
+ * Copyright (c) 2019 Collabora Ltd.
+ *
+ * Author:
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ */
+
+#ifndef _MEDIA_V4L2_MEM2MEM_H264_CODEC_H
+#define _MEDIA_V4L2_MEM2MEM_H264_CODEC_H
+
+#include <media/h264-ctrls.h>
+#include <media/v4l2-mem2mem-codec.h>
+
+/**
+ * struct v4l2_m2m_h264_decode_run - H264 decode run
+ * @base: inherit from v4l2_m2m_codec_run
+ * @decode_params: H264 decode params for this run
+ * @slices_params: H264 slices params for this run
+ * @sps: H264 SPS params for this run
+ * @pps: H264 PPS params for this run
+ * @scaling_matrix: H264 scaling matrix params for this run
+ */
+struct v4l2_m2m_h264_decode_run {
+	struct v4l2_m2m_codec_run base;
+	const struct v4l2_ctrl_h264_decode_params *decode_params;
+	const struct v4l2_ctrl_h264_slice_params *slices_params;
+	const struct v4l2_ctrl_h264_sps *sps;
+	const struct v4l2_ctrl_h264_pps *pps;
+	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
+};
+
+void v4l2_m2m_h264_decode_run_preamble(struct v4l2_m2m_codec_ctx *ctx,
+				       struct v4l2_m2m_h264_decode_run *run);
+
+/**
+ * v4l2_m2m_h264_decode_run_postamble() - H264 decode postamble
+ * @ctx: the codex this run was triggered on
+ * @run: the H264 decode run object
+ *
+ * Finish the run.
+ */
+static inline void
+v4l2_m2m_h264_decode_run_postamble(struct v4l2_m2m_codec_ctx *ctx,
+				   struct v4l2_m2m_h264_decode_run *run)
+{
+	v4l2_m2m_codec_run_postamble(ctx, &run->base);
+}
+
+#define V4L2_M2M_H264_DEC_DECODE_PARAMS_CTRL				\
+	{								\
+		.per_request = true,					\
+		.mandatory = true,					\
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,	\
+	}
+
+#define V4L2_M2M_H264_DEC_SLICE_PARAMS_CTRL				\
+	{								\
+		.per_request = true,					\
+		.mandatory = true,					\
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,	\
+		.cfg.dims[0] = V4L2_H264_MAX_SLICES_PER_FRAME,		\
+	}
+
+#define V4L2_M2M_H264_DEC_SPS_CTRL					\
+	{								\
+		.per_request = true,					\
+		.mandatory = true,					\
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SPS,			\
+	}
+
+#define V4L2_M2M_H264_DEC_PPS_CTRL					\
+	{								\
+		.per_request = true,					\
+		.mandatory = true,					\
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PPS,			\
+	}
+
+#define V4L2_M2M_H264_DEC_SCALING_MATRIX_CTRL				\
+	{								\
+		.per_request = true,					\
+		.mandatory = true,					\
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,	\
+	}
+
+#define V4L2_M2M_H264_DEC_MODE_CTRL(_unsupported_modes, _default_mode)	\
+	{								\
+		.mandatory = true,					\
+		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE,	\
+		.cfg.max = V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING,	\
+		.cfg.menu_skip_mask = _unsupported_modes,		\
+		.cfg.def = _default_mode,				\
+	}
+
+#endif /* _MEDIA_V4L2_MEM2MEM_H264_CODEC_H */
-- 
2.21.0

