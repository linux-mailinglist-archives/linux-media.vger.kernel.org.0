Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EED53CC28
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 14:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389177AbfFKMvI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 08:51:08 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47437 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388464AbfFKMvF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 08:51:05 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hagEx-00077w-1h; Tue, 11 Jun 2019 14:51:03 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v4 10/10] media: hantro: add initial i.MX8MM support (untested)
Date:   Tue, 11 Jun 2019 14:50:58 +0200
Message-Id: <20190611125058.13470-11-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611125058.13470-1-p.zabel@pengutronix.de>
References: <20190611125058.13470-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This should enable MPEG-2 decoding on the Hantro G1 and JPEG encoding on
the Hantro H1 on i.MX8MM.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/hantro/hantro_drv.c   |   1 +
 drivers/staging/media/hantro/hantro_hw.h    |   1 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 139 ++++++++++++++++++++
 3 files changed, 141 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 1829e35113a0..1187a6ca68be 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -422,6 +422,7 @@ static const struct of_device_id of_hantro_match[] = {
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_IMX8M
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
+	{ .compatible = "nxp,imx8mm-vpu", .data = &imx8mm_vpu_variant, },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index fd6ad017a1cf..1c69669dba54 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -82,6 +82,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
 extern const struct hantro_variant imx8mq_vpu_variant;
+extern const struct hantro_variant imx8mm_vpu_variant;
 
 void hantro_watchdog(struct work_struct *work);
 void hantro_run(struct hantro_ctx *ctx);
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 85a4ecf70392..6e344dc1ddae 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -11,18 +11,22 @@
 #include "hantro.h"
 #include "hantro_jpeg.h"
 #include "hantro_g1_regs.h"
+#include "hantro_h1_regs.h"
 
 #define CTRL_SOFT_RESET		0x00
 #define RESET_G1		BIT(1)
 #define RESET_G2		BIT(0)
+#define RESET_H1		BIT(2)
 
 #define CTRL_CLOCK_ENABLE	0x04
 #define CLOCK_G1		BIT(1)
 #define CLOCK_G2		BIT(0)
+#define CLOCK_H1		BIT(2)
 
 #define CTRL_G1_DEC_FUSE	0x08
 #define CTRL_G1_PP_FUSE		0x0c
 #define CTRL_G2_DEC_FUSE	0x10
+#define CTRL_H1_ENC_FUSE	0x14
 
 static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
 {
@@ -73,6 +77,30 @@ static int imx8mq_runtime_resume(struct hantro_dev *vpu)
 	return 0;
 }
 
+static int imx8mm_runtime_resume(struct hantro_dev *vpu)
+{
+	int ret;
+
+	ret = clk_bulk_prepare_enable(vpu->variant->num_clocks, vpu->clocks);
+	if (ret) {
+		dev_err(vpu->dev, "Failed to enable clocks\n");
+		return ret;
+	}
+
+	imx8m_soft_reset(vpu, RESET_G1 | RESET_G2 | RESET_H1);
+	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2 | RESET_H1);
+
+	/* Set values of the fuse registers */
+	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
+	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
+	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
+	writel(0xffffffff, vpu->ctrl_base + CTRL_H1_ENC_FUSE);
+
+	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
+
+	return 0;
+}
+
 /*
  * Supported formats.
  */
@@ -97,6 +125,43 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 	},
 };
 
+static const struct hantro_fmt imx8mm_vpu_enc_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_YUV420M,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420P,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = RK3288_VPU_ENC_FMT_YUV420SP,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = RK3288_VPU_ENC_FMT_YUYV422,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.codec_mode = HANTRO_MODE_NONE,
+		.enc_fmt = RK3288_VPU_ENC_FMT_UYVY422,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_JPEG,
+		.codec_mode = HANTRO_MODE_JPEG_ENC,
+		.max_depth = 2,
+		.header_size = JPEG_HEADER_SIZE,
+		.frmsize = {
+			.min_width = 96,
+			.max_width = 8192,
+			.step_width = JPEG_MB_DIM,
+			.min_height = 32,
+			.max_height = 8192,
+			.step_height = JPEG_MB_DIM,
+		},
+	},
+};
+
 static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
 {
 	struct hantro_dev *vpu = dev_id;
@@ -115,6 +180,25 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t imx8mm_vpu_h1_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status, bytesused;
+
+	status = vepu_read(vpu, H1_REG_INTERRUPT);
+	bytesused = vepu_read(vpu, H1_REG_STR_BUF_LIMIT) / 8;
+	state = (status & H1_REG_INTERRUPT_FRAME_RDY) ?
+		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	vepu_write(vpu, 0, H1_REG_INTERRUPT);
+	vepu_write(vpu, 0, H1_REG_AXI_CTRL);
+
+	hantro_irq_done(vpu, bytesused, state);
+
+	return IRQ_HANDLED;
+}
+
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
 	vpu->dec_base = vpu->reg_bases[0];
@@ -123,6 +207,15 @@ static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 	return 0;
 }
 
+static int imx8mm_vpu_hw_init(struct hantro_dev *vpu)
+{
+	vpu->dec_base = vpu->reg_bases[0];
+	vpu->enc_base = vpu->reg_bases[2];
+	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
+
+	return 0;
+}
+
 static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -130,6 +223,13 @@ static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
 	imx8m_soft_reset(vpu, RESET_G1);
 }
 
+static void imx8mm_vpu_h1_reset(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	imx8m_soft_reset(vpu, RESET_H1);
+}
+
 /*
  * Supported codec ops.
  */
@@ -143,6 +243,21 @@ static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] = {
 	},
 };
 
+static const struct hantro_codec_ops imx8mm_vpu_codec_ops[] = {
+	[HANTRO_MODE_MPEG2_DEC] = {
+		.run = hantro_g1_mpeg2_dec_run,
+		.reset = imx8m_vpu_g1_reset,
+		.init = hantro_mpeg2_dec_init,
+		.exit = hantro_mpeg2_dec_exit,
+	},
+	[HANTRO_MODE_JPEG_ENC] = {
+		.run = hantro_h1_jpeg_enc_run,
+		.reset = imx8mm_vpu_h1_reset,
+		.init = hantro_jpeg_enc_init,
+		.exit = hantro_jpeg_enc_exit,
+	},
+};
+
 /*
  * VPU variants.
  */
@@ -170,3 +285,27 @@ const struct hantro_variant imx8mq_vpu_variant = {
 	.reg_names = imx8mq_reg_names,
 	.num_regs = ARRAY_SIZE(imx8mq_reg_names)
 };
+
+static const struct hantro_irq imx8mm_irqs[] = {
+	{ "g1", imx8m_vpu_g1_irq },
+	{ "g2", NULL /* TODO: imx8m_vpu_g2_irq */ },
+	{ "h1", imx8mm_vpu_h1_irq },
+};
+
+static const char * const imx8mm_clk_names[] = { "g1", "g2", "h1", "bus" };
+static const char * const imx8mm_reg_names[] = { "g1", "g2", "h1", "ctrl" };
+
+const struct hantro_variant imx8mm_vpu_variant = {
+	.dec_fmts = imx8m_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
+	.codec = HANTRO_MPEG2_DECODER,
+	.codec_ops = imx8mm_vpu_codec_ops,
+	.init = imx8mm_vpu_hw_init,
+	.runtime_resume = imx8mm_runtime_resume,
+	.irqs = imx8mm_irqs,
+	.num_irqs = ARRAY_SIZE(imx8mm_irqs),
+	.clk_names = imx8mm_clk_names,
+	.num_clocks = ARRAY_SIZE(imx8mm_clk_names),
+	.reg_names = imx8mm_reg_names,
+	.num_regs = ARRAY_SIZE(imx8mm_reg_names)
+};
-- 
2.20.1

