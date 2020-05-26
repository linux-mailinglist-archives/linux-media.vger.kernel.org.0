Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2BAC1CE687
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 23:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732417AbgEKVC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 17:02:28 -0400
Received: from v6.sk ([167.172.42.174]:52682 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728544AbgEKVC2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 17:02:28 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 2ED03610D6;
        Mon, 11 May 2020 21:01:54 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 11/11] ASoC: mmp-sspa: Add Device Tree support
Date:   Mon, 11 May 2020 23:01:34 +0200
Message-Id: <20200511210134.1224532-12-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511210134.1224532-1-lkundrak@v3.sk>
References: <20200511210134.1224532-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes it possible to select CONFIG_SND_MMP_SOC_SSPA directly, as
opposed to via CONFIG_SND_MMP_SOC, and for the driver to bind to a device
tree node. That makes the driver useful on Device Tree based systems,
with audio-graph-card or simple-card.

The aforementioned card drivers control the master clock themselves and
don't call the set_dai_sysclk() or set_dai_pll(), thus the respective
handlers don't serve any purpose anymore. Instead, they return early and
the hw_params() handler sets the appropriate bitclk itself.

The register range is split into two -- for the RX block and for the TX
block. On a MMP2 there are two pairs of them; the first one has the
clock controller in the middle, while the second just has a hole:

  0xd42a0c00 - 0xd42a0c30 RX1
  0xd42a0c30 - 0xd42a0c40 Clocks
  0xd42a0c80 - 0xd42a0cb0 TX1
  0xd42a0d00 - 0xd42a0d30 RX2
  0xd42a0d80 - 0xd42a0cb0 TX2

For this reason, mmp_sspa_write_reg() and mmp_sspa_read_reg() are
replaced with direct calls to I/O routines.

Tested on a MMP2-based OLPC XO-1.75 laptop with rt5631 coded, mmp_tdma DMA
engine and MMP2 clock controller glued together with audio-graph-card.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 sound/soc/pxa/Kconfig    |  20 +++---
 sound/soc/pxa/mmp-sspa.c | 139 ++++++++++++++++++++++++++-------------
 sound/soc/pxa/mmp-sspa.h |  28 +++-----
 3 files changed, 113 insertions(+), 74 deletions(-)

diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index d4c0f580a565..7ad2fd7e653b 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -9,14 +9,8 @@ config SND_PXA2XX_SOC
 	  to select the audio interfaces to support below.
 
 config SND_MMP_SOC
-	bool "Soc Audio for Marvell MMP chips"
-	depends on ARCH_MMP
+	bool
 	select MMP_SRAM
-	select SND_SOC_GENERIC_DMAENGINE_PCM
-	select SND_ARM
-	help
-	  Say Y if you want to add support for codecs attached to
-	  the MMP SSPA interface.
 
 config SND_PXA2XX_AC97
 	tristate
@@ -39,7 +33,13 @@ config SND_PXA_SOC_SSP
 	select SND_PXA2XX_LIB
 
 config SND_MMP_SOC_SSPA
-	tristate
+	tristate "SoC Audio via MMP SSPA ports"
+	depends on ARCH_MMP
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select SND_ARM
+	help
+	  Say Y if you want to add support for codecs attached to
+	  the MMP SSPA interface.
 
 config SND_PXA2XX_SOC_CORGI
 	tristate "SoC Audio support for Sharp Zaurus SL-C7x0"
@@ -232,8 +232,8 @@ config SND_PXA2XX_SOC_IMOTE2
 
 config SND_MMP_SOC_BROWNSTONE
 	tristate "SoC Audio support for Marvell Brownstone"
-	depends on SND_MMP_SOC && MACH_BROWNSTONE && I2C
-	select SND_MMP_SOC_SSPA
+	depends on SND_MMP_SOC_SSPA && MACH_BROWNSTONE && I2C
+	select SND_MMP_SOC
 	select MFD_WM8994
 	select SND_SOC_WM8994
 	help
diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 86277471974a..b0accd49c89d 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -28,27 +28,20 @@
  * SSPA audio private data
  */
 struct sspa_priv {
-	void __iomem *mmio_base;
+	void __iomem *tx_base;
+	void __iomem *rx_base;
+
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct clk *clk;
 	struct clk *audio_clk;
 	struct clk *sysclk;
+
 	int running_cnt;
 	u32 sp;
 	u32 ctrl;
 };
 
-static void mmp_sspa_write_reg(struct sspa_priv *sspa, u32 reg, u32 val)
-{
-	__raw_writel(val, sspa->mmio_base + reg);
-}
-
-static u32 mmp_sspa_read_reg(struct sspa_priv *sspa, u32 reg)
-{
-	return __raw_readl(sspa->mmio_base + reg);
-}
-
 static void mmp_sspa_tx_enable(struct sspa_priv *sspa)
 {
 	unsigned int sspa_sp = sspa->sp;
@@ -56,7 +49,7 @@ static void mmp_sspa_tx_enable(struct sspa_priv *sspa)
 	sspa_sp &= ~SSPA_SP_MSL;
 	sspa_sp |= SSPA_SP_S_EN;
 	sspa_sp |= SSPA_SP_WEN;
-	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa_sp);
+	__raw_writel(sspa_sp, sspa->tx_base + SSPA_SP);
 }
 
 static void mmp_sspa_tx_disable(struct sspa_priv *sspa)
@@ -66,7 +59,7 @@ static void mmp_sspa_tx_disable(struct sspa_priv *sspa)
 	sspa_sp &= ~SSPA_SP_MSL;
 	sspa_sp &= ~SSPA_SP_S_EN;
 	sspa_sp |= SSPA_SP_WEN;
-	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa_sp);
+	__raw_writel(sspa_sp, sspa->tx_base + SSPA_SP);
 }
 
 static void mmp_sspa_rx_enable(struct sspa_priv *sspa)
@@ -75,7 +68,7 @@ static void mmp_sspa_rx_enable(struct sspa_priv *sspa)
 
 	sspa_sp |= SSPA_SP_S_EN;
 	sspa_sp |= SSPA_SP_WEN;
-	mmp_sspa_write_reg(sspa, SSPA_RXSP, sspa_sp);
+	__raw_writel(sspa_sp, sspa->rx_base + SSPA_SP);
 }
 
 static void mmp_sspa_rx_disable(struct sspa_priv *sspa)
@@ -84,7 +77,7 @@ static void mmp_sspa_rx_disable(struct sspa_priv *sspa)
 
 	sspa_sp &= ~SSPA_SP_S_EN;
 	sspa_sp |= SSPA_SP_WEN;
-	mmp_sspa_write_reg(sspa, SSPA_RXSP, sspa_sp);
+	__raw_writel(sspa_sp, sspa->rx_base + SSPA_SP);
 }
 
 static int mmp_sspa_startup(struct snd_pcm_substream *substream,
@@ -105,7 +98,6 @@ static void mmp_sspa_shutdown(struct snd_pcm_substream *substream,
 
 	clk_disable_unprepare(sspa->clk);
 	clk_disable_unprepare(sspa->sysclk);
-
 }
 
 /*
@@ -115,8 +107,12 @@ static int mmp_sspa_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 				    int clk_id, unsigned int freq, int dir)
 {
 	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = cpu_dai->component->dev;
 	int ret = 0;
 
+	if (dev->of_node)
+		return -ENOTSUPP;
+
 	switch (clk_id) {
 	case MMP_SSPA_CLK_AUDIO:
 		ret = clk_set_rate(sspa->audio_clk, freq);
@@ -139,8 +135,12 @@ static int mmp_sspa_set_dai_pll(struct snd_soc_dai *cpu_dai, int pll_id,
 				 unsigned int freq_out)
 {
 	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = cpu_dai->component->dev;
 	int ret = 0;
 
+	if (dev->of_node)
+		return -ENOTSUPP;
+
 	switch (pll_id) {
 	case MMP_SYSCLK:
 		ret = clk_set_rate(sspa->sysclk, freq_out);
@@ -213,6 +213,7 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
+	struct device *dev = dai->component->dev;
 	u32 sspa_ctrl = sspa->ctrl;
 	int bits;
 	int bitval;
@@ -238,7 +239,7 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (params_channels(params) == 2)
+	if (dev->of_node || params_channels(params) == 2)
 		sspa_ctrl |= SSPA_CTL_XPH;
 
 	sspa_ctrl &= ~SSPA_CTL_XWDLEN1_MASK;
@@ -256,12 +257,17 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 	sspa->sp &= ~SSPA_TXSP_FPER_MASK;
 	sspa->sp |= SSPA_TXSP_FPER(bits * 2 - 1);
 
+	if (dev->of_node) {
+		clk_set_rate(sspa->clk, params_rate(params) *
+					params_channels(params) * bits);
+	}
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		mmp_sspa_write_reg(sspa, SSPA_TXCTL, sspa_ctrl);
-		mmp_sspa_write_reg(sspa, SSPA_TXFIFO_LL, 0x1);
+		__raw_writel(sspa_ctrl, sspa->tx_base + SSPA_CTL);
+		__raw_writel(0x1, sspa->tx_base + SSPA_FIFO_UL);
 	} else {
-		mmp_sspa_write_reg(sspa, SSPA_RXCTL, sspa_ctrl);
-		mmp_sspa_write_reg(sspa, SSPA_RXFIFO_UL, 0x0);
+		__raw_writel(sspa_ctrl, sspa->rx_base + SSPA_CTL);
+		__raw_writel(0x0, sspa->rx_base + SSPA_FIFO_UL);
 	}
 
 	return 0;
@@ -410,19 +416,19 @@ static int mmp_sspa_open(struct snd_soc_component *component,
 	pm_runtime_get_sync(component->dev);
 
 	/* we can only change the settings if the port is not in use */
-	if ((mmp_sspa_read_reg(sspa, SSPA_TXSP) & SSPA_SP_S_EN) ||
-	    (mmp_sspa_read_reg(sspa, SSPA_RXSP) & SSPA_SP_S_EN)) {
+	if ((__raw_readl(sspa->tx_base + SSPA_SP) & SSPA_SP_S_EN) ||
+	    (__raw_readl(sspa->rx_base + SSPA_SP) & SSPA_SP_S_EN)) {
 		dev_err(component->dev,
 			"can't change hardware dai format: stream is in use\n");
 		return -EBUSY;
 	}
 
-	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa->sp);
-	mmp_sspa_write_reg(sspa, SSPA_RXSP, sspa->sp);
+	__raw_writel(sspa->sp, sspa->tx_base + SSPA_SP);
+	__raw_writel(sspa->sp, sspa->rx_base + SSPA_SP);
 
 	sspa->sp &= ~(SSPA_SP_S_RST | SSPA_SP_FFLUSH);
-	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa->sp);
-	mmp_sspa_write_reg(sspa, SSPA_RXSP, sspa->sp);
+	__raw_writel(sspa->sp, sspa->tx_base + SSPA_SP);
+	__raw_writel(sspa->sp, sspa->rx_base + SSPA_SP);
 
 	/*
 	 * FIXME: hw issue, for the tx serial port,
@@ -431,10 +437,10 @@ static int mmp_sspa_open(struct snd_soc_component *component,
 	 * The master/slave mode has been set in the
 	 * rx port.
 	 */
-	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa->sp & ~SSPA_SP_MSL);
+	__raw_writel(sspa->sp & ~SSPA_SP_MSL, sspa->tx_base + SSPA_SP);
 
-	mmp_sspa_write_reg(sspa, SSPA_TXCTL, sspa->ctrl);
-	mmp_sspa_write_reg(sspa, SSPA_RXCTL, sspa->ctrl);
+	__raw_writel(sspa->ctrl, sspa->tx_base + SSPA_CTL);
+	__raw_writel(sspa->ctrl, sspa->rx_base + SSPA_CTL);
 
 	return 0;
 }
@@ -462,22 +468,51 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 	if (!sspa)
 		return -ENOMEM;
 
-	sspa->mmio_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(sspa->mmio_base))
-		return PTR_ERR(sspa->mmio_base);
+	if (pdev->dev.of_node) {
+		sspa->rx_base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(sspa->rx_base))
+			return PTR_ERR(sspa->rx_base);
 
-	sspa->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(sspa->clk))
-		return PTR_ERR(sspa->clk);
+		sspa->tx_base = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(sspa->tx_base))
+			return PTR_ERR(sspa->tx_base);
 
-	sspa->audio_clk = clk_get(NULL, "mmp-audio");
-	if (IS_ERR(sspa->audio_clk))
-		return PTR_ERR(sspa->audio_clk);
+		sspa->clk = devm_clk_get(&pdev->dev, "bitclk");
+		if (IS_ERR(sspa->clk))
+			return PTR_ERR(sspa->clk);
 
-	sspa->sysclk = clk_get(NULL, "mmp-sysclk");
-	if (IS_ERR(sspa->sysclk)) {
-		clk_put(sspa->audio_clk);
-		return PTR_ERR(sspa->sysclk);
+		sspa->audio_clk = devm_clk_get(&pdev->dev, "audio");
+		if (IS_ERR(sspa->audio_clk))
+			return PTR_ERR(sspa->audio_clk);
+	} else {
+		struct resource *res;
+
+		res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+		if (res == NULL)
+			return -ENODEV;
+
+		sspa->rx_base = devm_ioremap(&pdev->dev, res->start, 0x30);
+		if (IS_ERR(sspa->rx_base))
+			return PTR_ERR(sspa->rx_base);
+
+		sspa->tx_base = devm_ioremap(&pdev->dev,
+					     res->start + 0x80, 0x30);
+		if (IS_ERR(sspa->tx_base))
+			return PTR_ERR(sspa->tx_base);
+
+		sspa->clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(sspa->clk))
+			return PTR_ERR(sspa->clk);
+
+		sspa->audio_clk = clk_get(NULL, "mmp-audio");
+		if (IS_ERR(sspa->audio_clk))
+			return PTR_ERR(sspa->audio_clk);
+
+		sspa->sysclk = clk_get(NULL, "mmp-sysclk");
+		if (IS_ERR(sspa->sysclk)) {
+			clk_put(sspa->audio_clk);
+			return PTR_ERR(sspa->sysclk);
+		}
 	}
 	pm_runtime_enable(&pdev->dev);
 	clk_prepare_enable(sspa->audio_clk);
@@ -486,8 +521,8 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 	sspa->playback_dma_data.maxburst = 4;
 	sspa->capture_dma_data.maxburst = 4;
 	/* You know, these addresses are actually ignored. */
-	sspa->playback_dma_data.addr = SSPA_TXD;
-	sspa->capture_dma_data.addr = SSPA_RXD;
+	sspa->capture_dma_data.addr = SSPA_D;
+	sspa->playback_dma_data.addr = 0x80 + SSPA_D;
 
 	if (pdev->dev.of_node) {
 		int ret;
@@ -508,14 +543,28 @@ static int asoc_mmp_sspa_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(sspa->audio_clk);
 	pm_runtime_disable(&pdev->dev);
+
+	if (pdev->dev.of_node)
+		return 0;
+
 	clk_put(sspa->audio_clk);
 	clk_put(sspa->sysclk);
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id mmp_sspa_of_match[] = {
+	{ .compatible = "marvell,mmp-sspa" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mmp_sspa_of_match);
+#endif
+
 static struct platform_driver asoc_mmp_sspa_driver = {
 	.driver = {
 		.name = "mmp-sspa-dai",
+		.of_match_table = of_match_ptr(mmp_sspa_of_match),
 	},
 	.probe = asoc_mmp_sspa_probe,
 	.remove = asoc_mmp_sspa_remove,
diff --git a/sound/soc/pxa/mmp-sspa.h b/sound/soc/pxa/mmp-sspa.h
index 328969b57ad1..938ef2f667e3 100644
--- a/sound/soc/pxa/mmp-sspa.h
+++ b/sound/soc/pxa/mmp-sspa.h
@@ -10,25 +10,15 @@
 /*
  * SSPA Registers
  */
-#define SSPA_RXD		(0x00)
-#define SSPA_RXID		(0x04)
-#define SSPA_RXCTL		(0x08)
-#define SSPA_RXSP		(0x0c)
-#define SSPA_RXFIFO_UL		(0x10)
-#define SSPA_RXINT_MASK		(0x14)
-#define SSPA_RXC		(0x18)
-#define SSPA_RXFIFO_NOFS	(0x1c)
-#define SSPA_RXFIFO_SIZE	(0x20)
-
-#define SSPA_TXD		(0x80)
-#define SSPA_TXID		(0x84)
-#define SSPA_TXCTL		(0x88)
-#define SSPA_TXSP		(0x8c)
-#define SSPA_TXFIFO_LL		(0x90)
-#define SSPA_TXINT_MASK		(0x94)
-#define SSPA_TXC		(0x98)
-#define SSPA_TXFIFO_NOFS	(0x9c)
-#define SSPA_TXFIFO_SIZE	(0xa0)
+#define SSPA_D			(0x00)
+#define SSPA_ID			(0x04)
+#define SSPA_CTL		(0x08)
+#define SSPA_SP			(0x0c)
+#define SSPA_FIFO_UL		(0x10)
+#define SSPA_INT_MASK		(0x14)
+#define SSPA_C			(0x18)
+#define SSPA_FIFO_NOFS		(0x1c)
+#define SSPA_FIFO_SIZE		(0x20)
 
 /* SSPA Control Register */
 #define	SSPA_CTL_XPH		(1 << 31)	/* Read Phase */
-- 
2.26.2

