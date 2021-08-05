Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708923E1731
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 16:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242019AbhHEOp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 10:45:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59184 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241996AbhHEOnR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 10:43:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 56B761F440C8
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <elezegarcia@gmail.com>,
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
Subject: [PATCH v3 08/10] media: hantro: Prepare for other G2 codecs
Date:   Thu,  5 Aug 2021 16:42:44 +0200
Message-Id: <20210805144246.11998-9-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805144246.11998-1-andrzej.p@collabora.com>
References: <20210805144246.11998-1-andrzej.p@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VeriSilicon Hantro G2 core supports other codecs besides hevc.
Factor out some common code in preparation for vp9 support.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/staging/media/hantro/Makefile         |  1 +
 drivers/staging/media/hantro/hantro.h         |  7 +++++
 drivers/staging/media/hantro/hantro_g2.c      | 27 ++++++++++++++++
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 31 -------------------
 drivers/staging/media/hantro/hantro_g2_regs.h |  7 +++++
 drivers/staging/media/hantro/hantro_hw.h      |  2 ++
 6 files changed, 44 insertions(+), 31 deletions(-)
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
index 340efb57fd18..226cecda9495 100644
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
@@ -516,23 +502,6 @@ static void set_buffers(struct hantro_ctx *ctx)
 	hantro_write_addr(vpu, G2_TILE_BSD, ctx->hevc_dec.tile_bsd.dma);
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
index bb22fa921914..0ac0ba375e80 100644
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
index 4323e63dfbfc..42b3f3961f75 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -308,4 +308,6 @@ void hantro_vp8_dec_exit(struct hantro_ctx *ctx);
 void hantro_vp8_prob_update(struct hantro_ctx *ctx,
 			    const struct v4l2_ctrl_vp8_frame *hdr);
 
+void hantro_g2_check_idle(struct hantro_dev *vpu);
+
 #endif /* HANTRO_HW_H_ */
-- 
2.17.1

