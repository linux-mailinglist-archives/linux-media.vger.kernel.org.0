Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE8A2D99B
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 11:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfE2Jyg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 05:54:36 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48709 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfE2Jyd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 05:54:33 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hVvHz-0002DF-IV; Wed, 29 May 2019 11:54:31 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v2 9/9] media: hantro: add initial i.MX8MM support (untested)
Date:   Wed, 29 May 2019 11:54:24 +0200
Message-Id: <20190529095424.23614-10-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529095424.23614-1-p.zabel@pengutronix.de>
References: <20190529095424.23614-1-p.zabel@pengutronix.de>
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
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 134 ++++++++++++++++++++
 3 files changed, 136 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 5f77df980ec3..b80d22796bda 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -419,6 +419,7 @@ static const struct of_device_id of_hantro_match[] = {
 	{ .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
 	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
 	{ .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
+	{ .compatible = "nxp,imx8mm-vpu", .data = &imx8mm_vpu_variant, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_hantro_match);
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
index 2d62bf415cdc..8f5c105743f0 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -15,14 +15,17 @@
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
@@ -73,6 +76,30 @@ static int imx8mq_runtime_resume(struct hantro_dev *vpu)
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
@@ -97,6 +124,43 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
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
@@ -115,6 +179,25 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t imx8mm_vpu_h1_irq(int irq, void *dev_id)
+{
+	struct hantro_dev *vpu = dev_id;
+	enum vb2_buffer_state state;
+	u32 status, bytesused;
+
+	status = vepu_read(vpu, VEPU_REG_INTERRUPT);
+	bytesused = vepu_read(vpu, VEPU_REG_STR_BUF_LIMIT) / 8;
+	state = (status & VEPU_REG_INTERRUPT_FRAME_RDY) ?
+		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
+	vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
+
+	hantro_irq_done(vpu, bytesused, state);
+
+	return IRQ_HANDLED;
+}
+
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
 	vpu->dec_base = vpu->base[0];
@@ -123,6 +206,15 @@ static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 	return 0;
 }
 
+static int imx8mm_vpu_hw_init(struct hantro_dev *vpu)
+{
+	vpu->dec_base = vpu->base[0];
+	vpu->enc_base = vpu->base[2];
+	vpu->ctrl_base = vpu->base[vpu->variant->num_regs - 1];
+
+	return 0;
+}
+
 static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
@@ -130,6 +222,13 @@ static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
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
@@ -143,6 +242,21 @@ static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] = {
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
@@ -165,3 +279,23 @@ const struct hantro_variant imx8mq_vpu_variant = {
 	.reg_names = { "g1", "g2", "ctrl" },
 	.num_regs = 3,
 };
+
+const struct hantro_variant imx8mm_vpu_variant = {
+	.dec_fmts = imx8m_vpu_dec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
+	.codec = HANTRO_MPEG2_DECODER,
+	.codec_ops = imx8mm_vpu_codec_ops,
+	.init = imx8mm_vpu_hw_init,
+	.runtime_resume = imx8mm_runtime_resume,
+	.irq_handlers = {
+		imx8m_vpu_g1_irq,
+		NULL, /* TODO: imx8m_vpu_g2_irq */
+		imx8mm_vpu_h1_irq
+	},
+	.irq_names = { "g1", "g2", "h1" },
+	.num_irqs = 3,
+	.clk_names = { "g1", "g2", "h1", "bus" },
+	.num_clocks = 4,
+	.reg_names = { "g1", "g2", "h1", "ctrl" },
+	.num_regs = 4,
+};
-- 
2.20.1

