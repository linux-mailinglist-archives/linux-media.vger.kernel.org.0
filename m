Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303D542A756
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 16:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237316AbhJLOiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 10:38:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53950 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237289AbhJLOiG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 10:38:06 -0400
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:4cb:a870:dcd8:9f87:c3be:dc06])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 572AA1F43BC9;
        Tue, 12 Oct 2021 15:36:03 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl,
        jc@kynesim.co.uk, ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 3/4] media: hantro: Use syscon instead of 'ctrl' register
Date:   Tue, 12 Oct 2021 16:35:51 +0200
Message-Id: <20211012143552.661751-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012143552.661751-1-benjamin.gaignard@collabora.com>
References: <20211012143552.661751-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to be able to share the control hardware block between
VPUs use a syscon instead a ioremap it in the driver.
To keep the compatibility with older DT if 'nxp,imx8mq-vpu-ctrl'
phandle is not found look at 'ctrl' reg-name.
With the method it becomes useless to provide a list of register
names so remove it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Please note that the only purpose of this commit is to allow to test
G2 hardware block for IMX8MQ until a proper solution isuing power domain
can be found. Do not merge it.

---
 drivers/staging/media/hantro/hantro.h       |  5 ++-
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 48 +++++++++++++--------
 2 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index c2e2dca38628..20478988a55e 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -13,6 +13,7 @@
 #define HANTRO_H_
 
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/videodev2.h>
 #include <linux/wait.h>
 #include <linux/clk.h>
@@ -170,7 +171,7 @@ hantro_vdev_to_func(struct video_device *vdev)
  * @reg_bases:		Mapped addresses of VPU registers.
  * @enc_base:		Mapped address of VPU encoder register for convenience.
  * @dec_base:		Mapped address of VPU decoder register for convenience.
- * @ctrl_base:		Mapped address of VPU control block.
+ * @ctrl_base:		Regmap of VPU control block.
  * @vpu_mutex:		Mutex to synchronize V4L2 calls.
  * @irqlock:		Spinlock to synchronize access to data structures
  *			shared with interrupt handlers.
@@ -189,7 +190,7 @@ struct hantro_dev {
 	void __iomem **reg_bases;
 	void __iomem *enc_base;
 	void __iomem *dec_base;
-	void __iomem *ctrl_base;
+	struct regmap *ctrl_base;
 
 	struct mutex vpu_mutex;	/* video_device lock */
 	spinlock_t irqlock;
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index ea919bfb9891..ec0b16d12b54 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/mfd/syscon.h>
 
 #include "hantro.h"
 #include "hantro_jpeg.h"
@@ -25,30 +26,28 @@
 #define CTRL_G1_PP_FUSE		0x0c
 #define CTRL_G2_DEC_FUSE	0x10
 
+static const struct regmap_config ctrl_regmap_ctrl = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 0x14,
+};
+
 static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
 {
-	u32 val;
-
 	/* Assert */
-	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
-	val &= ~reset_bits;
-	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
+	regmap_update_bits(vpu->ctrl_base, CTRL_SOFT_RESET, reset_bits, 0);
 
 	udelay(2);
 
 	/* Release */
-	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
-	val |= reset_bits;
-	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
+	regmap_update_bits(vpu->ctrl_base, CTRL_SOFT_RESET,
+			   reset_bits, reset_bits);
 }
 
 static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
 {
-	u32 val;
-
-	val = readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
-	val |= clock_bits;
-	writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
+	regmap_update_bits(vpu->ctrl_base, CTRL_CLOCK_ENABLE,
+			   clock_bits, clock_bits);
 }
 
 static int imx8mq_runtime_resume(struct hantro_dev *vpu)
@@ -65,9 +64,9 @@ static int imx8mq_runtime_resume(struct hantro_dev *vpu)
 	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2);
 
 	/* Set values of the fuse registers */
-	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
-	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
-	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
+	regmap_write(vpu->ctrl_base, CTRL_G1_DEC_FUSE, 0xffffffff);
+	regmap_write(vpu->ctrl_base, CTRL_G1_PP_FUSE, 0xffffffff);
+	regmap_write(vpu->ctrl_base, CTRL_G2_DEC_FUSE, 0xffffffff);
 
 	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
 
@@ -189,7 +188,22 @@ static irqreturn_t imx8m_vpu_g2_irq(int irq, void *dev_id)
 
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
-	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
+	struct device_node *np = vpu->dev->of_node;
+
+	vpu->ctrl_base = syscon_regmap_lookup_by_phandle(np, "nxp,imx8m-vpu-ctrl");
+	if (IS_ERR(vpu->ctrl_base)) {
+		struct resource *res;
+		void __iomem *ctrl;
+
+		res = platform_get_resource_byname(vpu->pdev, IORESOURCE_MEM, "ctrl");
+		ctrl = devm_ioremap_resource(vpu->dev, res);
+		if (IS_ERR(ctrl))
+			return PTR_ERR(ctrl);
+
+		vpu->ctrl_base = devm_regmap_init_mmio(vpu->dev, ctrl, &ctrl_regmap_ctrl);
+		if (IS_ERR(vpu->ctrl_base))
+			return PTR_ERR(vpu->ctrl_base);
+	}
 
 	return 0;
 }
-- 
2.30.2

