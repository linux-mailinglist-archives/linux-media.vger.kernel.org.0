Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E25325FC7
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 10:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhBZJN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 04:13:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbhBZJMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 04:12:24 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB3ADC061756;
        Fri, 26 Feb 2021 01:11:43 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:297a:447b:deb4:3f5c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 166A71F464D3;
        Fri, 26 Feb 2021 09:11:40 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, benjamin.gaignard@collabora.com
Subject: [PATCH v2 4/5] media: hantro: Use reset driver
Date:   Fri, 26 Feb 2021 10:11:27 +0100
Message-Id: <20210226091128.14379-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210226091128.14379-1-benjamin.gaignard@collabora.com>
References: <20210226091128.14379-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rather use a reset like feature inside the driver use the reset
controller API to get the same result.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/hantro/Kconfig        |  1 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 61 ++++-----------------
 2 files changed, 12 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
index 5b6cf9f62b1a..dd1d4dde2658 100644
--- a/drivers/staging/media/hantro/Kconfig
+++ b/drivers/staging/media/hantro/Kconfig
@@ -20,6 +20,7 @@ config VIDEO_HANTRO_IMX8M
 	bool "Hantro VPU i.MX8M support"
 	depends on VIDEO_HANTRO
 	depends on ARCH_MXC || COMPILE_TEST
+	select RESET_VPU_IMX8MQ
 	default y
 	help
 	  Enable support for i.MX8M SoCs.
diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index c222de075ef4..d5b4312b9391 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -7,49 +7,12 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/reset.h>
 
 #include "hantro.h"
 #include "hantro_jpeg.h"
 #include "hantro_g1_regs.h"
 
-#define CTRL_SOFT_RESET		0x00
-#define RESET_G1		BIT(1)
-#define RESET_G2		BIT(0)
-
-#define CTRL_CLOCK_ENABLE	0x04
-#define CLOCK_G1		BIT(1)
-#define CLOCK_G2		BIT(0)
-
-#define CTRL_G1_DEC_FUSE	0x08
-#define CTRL_G1_PP_FUSE		0x0c
-#define CTRL_G2_DEC_FUSE	0x10
-
-static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
-{
-	u32 val;
-
-	/* Assert */
-	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
-	val &= ~reset_bits;
-	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
-
-	udelay(2);
-
-	/* Release */
-	val = readl(vpu->ctrl_base + CTRL_SOFT_RESET);
-	val |= reset_bits;
-	writel(val, vpu->ctrl_base + CTRL_SOFT_RESET);
-}
-
-static void imx8m_clk_enable(struct hantro_dev *vpu, u32 clock_bits)
-{
-	u32 val;
-
-	val = readl(vpu->ctrl_base + CTRL_CLOCK_ENABLE);
-	val |= clock_bits;
-	writel(val, vpu->ctrl_base + CTRL_CLOCK_ENABLE);
-}
-
 static int imx8mq_runtime_resume(struct hantro_dev *vpu)
 {
 	int ret;
@@ -60,13 +23,10 @@ static int imx8mq_runtime_resume(struct hantro_dev *vpu)
 		return ret;
 	}
 
-	imx8m_soft_reset(vpu, RESET_G1 | RESET_G2);
-	imx8m_clk_enable(vpu, CLOCK_G1 | CLOCK_G2);
+	ret = device_reset(vpu->dev);
+	if (ret)
+		dev_err(vpu->dev, "Failed to reset Hantro VPU\n");
 
-	/* Set values of the fuse registers */
-	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_DEC_FUSE);
-	writel(0xffffffff, vpu->ctrl_base + CTRL_G1_PP_FUSE);
-	writel(0xffffffff, vpu->ctrl_base + CTRL_G2_DEC_FUSE);
 
 	clk_bulk_disable_unprepare(vpu->variant->num_clocks, vpu->clocks);
 
@@ -151,16 +111,17 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
 	vpu->dec_base = vpu->reg_bases[0];
-	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
 
 	return 0;
 }
 
-static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
+static void imx8mq_vpu_reset(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
+	int ret = device_reset(vpu->dev);
 
-	imx8m_soft_reset(vpu, RESET_G1);
+	if (ret)
+		dev_err(vpu->dev, "Failed to reset Hantro VPU\n");
 }
 
 /*
@@ -170,19 +131,19 @@ static void imx8m_vpu_g1_reset(struct hantro_ctx *ctx)
 static const struct hantro_codec_ops imx8mq_vpu_codec_ops[] = {
 	[HANTRO_MODE_MPEG2_DEC] = {
 		.run = hantro_g1_mpeg2_dec_run,
-		.reset = imx8m_vpu_g1_reset,
+		.reset = imx8mq_vpu_reset,
 		.init = hantro_mpeg2_dec_init,
 		.exit = hantro_mpeg2_dec_exit,
 	},
 	[HANTRO_MODE_VP8_DEC] = {
 		.run = hantro_g1_vp8_dec_run,
-		.reset = imx8m_vpu_g1_reset,
+		.reset = imx8mq_vpu_reset,
 		.init = hantro_vp8_dec_init,
 		.exit = hantro_vp8_dec_exit,
 	},
 	[HANTRO_MODE_H264_DEC] = {
 		.run = hantro_g1_h264_dec_run,
-		.reset = imx8m_vpu_g1_reset,
+		.reset = imx8mq_vpu_reset,
 		.init = hantro_h264_dec_init,
 		.exit = hantro_h264_dec_exit,
 	},
-- 
2.25.1

