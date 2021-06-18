Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7C83ACBDF
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 15:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbhFRNRt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 09:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbhFRNRs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 09:17:48 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4674FC061574;
        Fri, 18 Jun 2021 06:15:39 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:141f:c87a:873e:7b6f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EE6C21F448CD;
        Fri, 18 Jun 2021 14:15:35 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 1/8] media: hantro: Trace hevc hw cycles performance register
Date:   Fri, 18 Jun 2021 15:15:19 +0200
Message-Id: <20210618131526.566762-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After each hevc decoded frame trace the hardware performance.
It provides the number of hw cycles spend per decoded macroblock.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 3:
 - Change trace file name to hantro_trace.h

 drivers/staging/media/hantro/hantro_drv.c     |  3 ++
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 16 ++++++++
 drivers/staging/media/hantro/hantro_g2_regs.h |  1 +
 drivers/staging/media/hantro/hantro_hw.h      |  1 +
 drivers/staging/media/hantro/hantro_trace.h   | 39 +++++++++++++++++++
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  1 +
 6 files changed, 61 insertions(+)
 create mode 100644 drivers/staging/media/hantro/hantro_trace.h

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index dbc69ee0b562..24a654a936ae 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -28,6 +28,9 @@
 #include "hantro.h"
 #include "hantro_hw.h"
 
+#define CREATE_TRACE_POINTS
+#include "hantro_trace.h"
+
 #define DRIVER_NAME "hantro-vpu"
 
 int hantro_debug;
diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index 340efb57fd18..fef16d1724da 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -7,6 +7,7 @@
 
 #include "hantro_hw.h"
 #include "hantro_g2_regs.h"
+#include "hantro_trace.h"
 
 #define HEVC_DEC_MODE	0xC
 
@@ -22,6 +23,21 @@ static inline void hantro_write_addr(struct hantro_dev *vpu,
 	vdpu_write(vpu, addr & 0xffffffff, offset);
 }
 
+void hantro_g2_hevc_dec_done(struct hantro_ctx *ctx)
+{
+	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
+	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
+	struct hantro_dev *vpu = ctx->dev;
+	u32 hw_cycles = 0;
+	u32 mbs = (sps->pic_width_in_luma_samples *
+		   sps->pic_height_in_luma_samples) >> 8;
+
+	if (mbs)
+		hw_cycles = vdpu_read(vpu, G2_HW_PERFORMANCE) / mbs;
+
+	trace_hantro_hevc_perf(ctx, hw_cycles);
+}
+
 static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
index bb22fa921914..17d84ec9c5c2 100644
--- a/drivers/staging/media/hantro/hantro_g2_regs.h
+++ b/drivers/staging/media/hantro/hantro_g2_regs.h
@@ -177,6 +177,7 @@
 #define G2_REG_CONFIG_DEC_CLK_GATE_E		BIT(16)
 #define G2_REG_CONFIG_DEC_CLK_GATE_IDLE_E	BIT(17)
 
+#define G2_HW_PERFORMANCE	(G2_SWREG(63))
 #define G2_ADDR_DST		(G2_SWREG(65))
 #define G2_REG_ADDR_REF(i)	(G2_SWREG(67)  + ((i) * 0x8))
 #define G2_ADDR_DST_CHR		(G2_SWREG(99))
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 5737a7707944..8fa0aacb61cd 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -240,6 +240,7 @@ void hantro_h264_dec_exit(struct hantro_ctx *ctx);
 int hantro_hevc_dec_init(struct hantro_ctx *ctx);
 void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
 int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
+void hantro_g2_hevc_dec_done(struct hantro_ctx *ctx);
 int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
 dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, int poc);
 void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx);
diff --git a/drivers/staging/media/hantro/hantro_trace.h b/drivers/staging/media/hantro/hantro_trace.h
new file mode 100644
index 000000000000..e07d03a5ccdf
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_trace.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#if !defined(__HANTRO_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
+#define __HANTRO_TRACE_H__
+
+#include <linux/tracepoint.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "hantro.h"
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM hantro
+#define TRACE_INCLUDE_FILE hantro_trace
+
+TRACE_EVENT(hantro_hevc_perf,
+	TP_PROTO(struct hantro_ctx *ctx, u32 hw_cycles),
+
+	TP_ARGS(ctx, hw_cycles),
+
+	TP_STRUCT__entry(
+		__field(int, minor)
+		__field(u32, hw_cycles)
+	),
+
+	TP_fast_assign(
+		__entry->minor = ctx->fh.vdev->minor;
+		__entry->hw_cycles = hw_cycles;
+	),
+
+	TP_printk("minor = %d, %8d cycles / mb",
+		  __entry->minor, __entry->hw_cycles)
+);
+
+#endif /* __HANTRO_TRACE_H__ */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../../drivers/staging/media/hantro
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index c3e616fd4e85..ab6ac620f0d0 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -253,6 +253,7 @@ static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
 		.reset = imx8m_vpu_g2_reset,
 		.init = hantro_hevc_dec_init,
 		.exit = hantro_hevc_dec_exit,
+		.done = hantro_g2_hevc_dec_done,
 	},
 };
 
-- 
2.25.1

