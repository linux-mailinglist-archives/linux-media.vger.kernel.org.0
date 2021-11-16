Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF1E453467
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 15:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237534AbhKPOmH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 09:42:07 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237488AbhKPOly (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 09:41:54 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id A99831F457C7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637073536; bh=6rLcj1IIg+lwQNzG+MUqi9j9BubttD570CB/lXjD2oE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ME7IYH7MjFvOSN+HD0Vbo7w0ySA2ik/h1RzuTZ7vE48Fj4y++cD9O/jiKKulGCks7
         vtVa872HF/dwBK0tu6PB/r/h5hkGyYPHVRAA07aQiQm00h0adpuax/kfxzhzEDFB+u
         eZdMpFfa5pc+qfF9QcA20i7YRMj4c4OcqbqoQLobAudkB9ePXdQaLXS994dsiwnwT4
         RC/ONw0p3izbkInrg44yNAhp62Rx1A8BMF6PLRP5TWQk+16KaeYQNeB5iuPEkj96Dk
         Q5JiJKPpdLuffiLTSQxvonHVnl7ulh2pjlp8rxPwboEtMOWEGFUO1sun2D2OHy9UPK
         MhOEMS22q5Ogg==
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com
Subject: [PATCH v8 09/12] media: hantro: Prepare for other G2 codecs
Date:   Tue, 16 Nov 2021 15:38:39 +0100
Message-Id: <20211116143842.75896-10-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116143842.75896-1-andrzej.p@collabora.com>
References: <20211116143842.75896-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VeriSilicon Hantro G2 core supports other codecs besides hevc.
Factor out some common code in preparation for vp9 support.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/hantro/Makefile         |  1 +
 drivers/staging/media/hantro/hantro.h         |  7 +++++
 drivers/staging/media/hantro/hantro_drv.c     |  5 +++
 drivers/staging/media/hantro/hantro_g2.c      | 27 ++++++++++++++++
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 31 -------------------
 drivers/staging/media/hantro/hantro_g2_regs.h |  7 +++++
 drivers/staging/media/hantro/hantro_hw.h      |  2 ++
 7 files changed, 49 insertions(+), 31 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_g2.c

diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index 90036831fec4..fe6d84871d07 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -12,6 +12,7 @@ hantro-vpu-y += \
 		hantro_g1_mpeg2_dec.o \
 		hantro_g2_hevc_dec.o \
 		hantro_g1_vp8_dec.o \
+		hantro_g2.o \
 		rockchip_vpu2_hw_jpeg_enc.o \
 		rockchip_vpu2_hw_h264_dec.o \
 		rockchip_vpu2_hw_mpeg2_dec.o \
diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index dd5e56765d4e..d91eb2b1c509 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -369,6 +369,13 @@ static inline void vdpu_write(struct hantro_dev *vpu, u32 val, u32 reg)
 	writel(val, vpu->dec_base + reg);
 }
 
+static inline void hantro_write_addr(struct hantro_dev *vpu,
+				     unsigned long offset,
+				     dma_addr_t addr)
+{
+	vdpu_write(vpu, addr & 0xffffffff, offset);
+}
+
 static inline u32 vdpu_read(struct hantro_dev *vpu, u32 reg)
 {
 	u32 val = readl(vpu->dec_base + reg);
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index fb82b9297a2b..bb72e5e208b7 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -907,6 +907,11 @@ static int hantro_probe(struct platform_device *pdev)
 	vpu->enc_base = vpu->reg_bases[0] + vpu->variant->enc_offset;
 	vpu->dec_base = vpu->reg_bases[0] + vpu->variant->dec_offset;
 
+	/**
+	 * TODO: Eventually allow taking advantage of full 64-bit address space.
+	 * Until then we assume the MSB portion of buffers' base addresses is
+	 * always 0 due to this masking operation.
+	 */
 	ret = dma_set_coherent_mask(vpu->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(vpu->dev, "Could not set DMA coherent mask.\n");
diff --git a/drivers/staging/media/hantro/hantro_g2.c b/drivers/staging/media/hantro/hantro_g2.c
new file mode 100644
index 000000000000..5f7bb27913de
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_g2.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (C) 2021 Collabora Ltd, Andrzej Pietrasiewicz <andrzej.p@collabora.com>
+ */
+
+#include "hantro_hw.h"
+#include "hantro_g2_regs.h"
+
+void hantro_g2_check_idle(struct hantro_dev *vpu)
+{
+	int i;
+
+	for (i = 0; i < 3; i++) {
+		u32 status;
+
+		/* Make sure the VPU is idle */
+		status = vdpu_read(vpu, G2_REG_INTERRUPT);
+		if (status & G2_REG_INTERRUPT_DEC_E) {
+			dev_warn(vpu->dev, "device still running, aborting");
+			status |= G2_REG_INTERRUPT_DEC_ABORT_E | G2_REG_INTERRUPT_DEC_IRQ_DIS;
+			vdpu_write(vpu, status, G2_REG_INTERRUPT);
+		}
+	}
+}
+
diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index abae36f9b418..f62608b0b408 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -8,20 +8,6 @@
 #include "hantro_hw.h"
 #include "hantro_g2_regs.h"
 
-#define HEVC_DEC_MODE	0xC
-
-#define BUS_WIDTH_32		0
-#define BUS_WIDTH_64		1
-#define BUS_WIDTH_128		2
-#define BUS_WIDTH_256		3
-
-static inline void hantro_write_addr(struct hantro_dev *vpu,
-				     unsigned long offset,
-				     dma_addr_t addr)
-{
-	vdpu_write(vpu, addr & 0xffffffff, offset);
-}
-
 static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -566,23 +552,6 @@ static void prepare_scaling_list_buffer(struct hantro_ctx *ctx)
 	hantro_write_addr(vpu, G2_HEVC_SCALING_LIST_ADDR, ctx->hevc_dec.scaling_lists.dma);
 }
 
-static void hantro_g2_check_idle(struct hantro_dev *vpu)
-{
-	int i;
-
-	for (i = 0; i < 3; i++) {
-		u32 status;
-
-		/* Make sure the VPU is idle */
-		status = vdpu_read(vpu, G2_REG_INTERRUPT);
-		if (status & G2_REG_INTERRUPT_DEC_E) {
-			dev_warn(vpu->dev, "device still running, aborting");
-			status |= G2_REG_INTERRUPT_DEC_ABORT_E | G2_REG_INTERRUPT_DEC_IRQ_DIS;
-			vdpu_write(vpu, status, G2_REG_INTERRUPT);
-		}
-	}
-}
-
 int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
index 24b18f839ff8..136ba6d98a1f 100644
--- a/drivers/staging/media/hantro/hantro_g2_regs.h
+++ b/drivers/staging/media/hantro/hantro_g2_regs.h
@@ -27,6 +27,13 @@
 #define G2_REG_INTERRUPT_DEC_IRQ_DIS	BIT(4)
 #define G2_REG_INTERRUPT_DEC_E		BIT(0)
 
+#define HEVC_DEC_MODE			0xc
+
+#define BUS_WIDTH_32			0
+#define BUS_WIDTH_64			1
+#define BUS_WIDTH_128			2
+#define BUS_WIDTH_256			3
+
 #define g2_strm_swap		G2_DEC_REG(2, 28, 0xf)
 #define g2_dirmv_swap		G2_DEC_REG(2, 20, 0xf)
 
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 2f85430682d8..1d869abf90b2 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -312,4 +312,6 @@ void hantro_vp8_dec_exit(struct hantro_ctx *ctx);
 void hantro_vp8_prob_update(struct hantro_ctx *ctx,
 			    const struct v4l2_ctrl_vp8_frame *hdr);
 
+void hantro_g2_check_idle(struct hantro_dev *vpu);
+
 #endif /* HANTRO_HW_H_ */
-- 
2.25.1

