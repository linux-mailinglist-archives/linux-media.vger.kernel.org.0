Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C98C321698
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 13:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbhBVM0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 07:26:34 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57638 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbhBVMZM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 07:25:12 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:5956:412c:4850:9073])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 808641F44FF1;
        Mon, 22 Feb 2021 12:24:20 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 3/9] media: hantro: Add a field to distinguish the hardware versions
Date:   Mon, 22 Feb 2021 13:24:00 +0100
Message-Id: <20210222122406.41782-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
References: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Decoders hardware blocks could exist in multiple versions: add
a field to distinguish them at runtime.
G2 hardware block doesn't have postprocessor hantro_needs_postproc
function should always returns false in for this hardware.
hantro_needs_postproc function becoming to much complex to
stay inline in .h file move it to .c file.

Keep the default behavoir to be G1 hardware.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 2:
- squash this commit with the post processor change
to show one usage of core_hw_dec_rev

 drivers/staging/media/hantro/hantro.h          | 13 +++++++------
 drivers/staging/media/hantro/hantro_drv.c      |  2 ++
 drivers/staging/media/hantro/hantro_postproc.c | 17 +++++++++++++++++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index bde65231f22f..352930bd49fc 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -36,6 +36,9 @@ struct hantro_codec_ops;
 #define HANTRO_H264_DECODER	BIT(18)
 #define HANTRO_DECODERS		0xffff0000
 
+#define HANTRO_G1_REV		0x6731
+#define HANTRO_G2_REV		0x6732
+
 /**
  * struct hantro_irq - irq handler and name
  *
@@ -170,6 +173,7 @@ hantro_vdev_to_func(struct video_device *vdev)
  * @enc_base:		Mapped address of VPU encoder register for convenience.
  * @dec_base:		Mapped address of VPU decoder register for convenience.
  * @ctrl_base:		Mapped address of VPU control block.
+ * @core_hw_dec_rev	Runtime detected HW decoder core revision
  * @vpu_mutex:		Mutex to synchronize V4L2 calls.
  * @irqlock:		Spinlock to synchronize access to data structures
  *			shared with interrupt handlers.
@@ -189,6 +193,7 @@ struct hantro_dev {
 	void __iomem *enc_base;
 	void __iomem *dec_base;
 	void __iomem *ctrl_base;
+	u32 core_hw_dec_rev;
 
 	struct mutex vpu_mutex;	/* video_device lock */
 	spinlock_t irqlock;
@@ -411,12 +416,8 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
 	return v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 }
 
-static inline bool
-hantro_needs_postproc(const struct hantro_ctx *ctx,
-		      const struct hantro_fmt *fmt)
-{
-	return !ctx->is_encoder && fmt->fourcc != V4L2_PIX_FMT_NV12;
-}
+bool hantro_needs_postproc(const struct hantro_ctx *ctx,
+			   const struct hantro_fmt *fmt);
 
 static inline dma_addr_t
 hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index d86e322a5980..0a62beb0bfbd 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -834,6 +834,8 @@ static int hantro_probe(struct platform_device *pdev)
 	}
 	vpu->enc_base = vpu->reg_bases[0] + vpu->variant->enc_offset;
 	vpu->dec_base = vpu->reg_bases[0] + vpu->variant->dec_offset;
+	/* by default decoder is G1 */
+	vpu->core_hw_dec_rev = HANTRO_G1_REV;
 
 	ret = dma_set_coherent_mask(vpu->dev, DMA_BIT_MASK(32));
 	if (ret) {
diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index 6d2a8f2a8f0b..050880f720d6 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -50,6 +50,23 @@ const struct hantro_postproc_regs hantro_g1_postproc_regs = {
 	.display_width = {G1_REG_PP_DISPLAY_WIDTH, 0, 0xfff},
 };
 
+bool hantro_needs_postproc(const struct hantro_ctx *ctx,
+			   const struct hantro_fmt *fmt)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	if (ctx->is_encoder)
+		return false;
+
+	if (vpu->core_hw_dec_rev == HANTRO_G1_REV)
+		return fmt->fourcc != V4L2_PIX_FMT_NV12;
+
+	if (vpu->core_hw_dec_rev == HANTRO_G2_REV)
+		return false;
+
+	return false;
+}
+
 void hantro_postproc_enable(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
-- 
2.25.1

