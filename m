Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE5D1CE667
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 23:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732362AbgEKVBt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 17:01:49 -0400
Received: from v6.sk ([167.172.42.174]:52586 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732346AbgEKVBs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 17:01:48 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 524CE610D3;
        Mon, 11 May 2020 21:01:46 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 06/11] ASoC: mmp-sspa: Remove the embedded struct ssp_device
Date:   Mon, 11 May 2020 23:01:29 +0200
Message-Id: <20200511210134.1224532-7-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511210134.1224532-1-lkundrak@v3.sk>
References: <20200511210134.1224532-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "serial port" it represents is actually a SPI controller -- it's not
clear why would the audio serial interface embed it. We're only using
the mmio_base and clk fields.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 sound/soc/pxa/mmp-sspa.c | 129 ++++++++++++++++++---------------------
 1 file changed, 60 insertions(+), 69 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 6e4b63d0c589..7a706b1d2588 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -11,7 +11,6 @@
 #include <linux/delay.h>
 #include <linux/clk.h>
 #include <linux/slab.h>
-#include <linux/pxa2xx_ssp.h>
 #include <linux/io.h>
 #include <linux/dmaengine.h>
 
@@ -28,26 +27,27 @@
  * SSPA audio private data
  */
 struct sspa_priv {
-	struct ssp_device *sspa;
+	void __iomem *mmio_base;
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
+	struct clk *clk;
 	struct clk *audio_clk;
 	struct clk *sysclk;
 	int dai_fmt;
 	int running_cnt;
 };
 
-static void mmp_sspa_write_reg(struct ssp_device *sspa, u32 reg, u32 val)
+static void mmp_sspa_write_reg(struct sspa_priv *sspa, u32 reg, u32 val)
 {
 	__raw_writel(val, sspa->mmio_base + reg);
 }
 
-static u32 mmp_sspa_read_reg(struct ssp_device *sspa, u32 reg)
+static u32 mmp_sspa_read_reg(struct sspa_priv *sspa, u32 reg)
 {
 	return __raw_readl(sspa->mmio_base + reg);
 }
 
-static void mmp_sspa_tx_enable(struct ssp_device *sspa)
+static void mmp_sspa_tx_enable(struct sspa_priv *sspa)
 {
 	unsigned int sspa_sp;
 
@@ -57,7 +57,7 @@ static void mmp_sspa_tx_enable(struct ssp_device *sspa)
 	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa_sp);
 }
 
-static void mmp_sspa_tx_disable(struct ssp_device *sspa)
+static void mmp_sspa_tx_disable(struct sspa_priv *sspa)
 {
 	unsigned int sspa_sp;
 
@@ -67,7 +67,7 @@ static void mmp_sspa_tx_disable(struct ssp_device *sspa)
 	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa_sp);
 }
 
-static void mmp_sspa_rx_enable(struct ssp_device *sspa)
+static void mmp_sspa_rx_enable(struct sspa_priv *sspa)
 {
 	unsigned int sspa_sp;
 
@@ -77,7 +77,7 @@ static void mmp_sspa_rx_enable(struct ssp_device *sspa)
 	mmp_sspa_write_reg(sspa, SSPA_RXSP, sspa_sp);
 }
 
-static void mmp_sspa_rx_disable(struct ssp_device *sspa)
+static void mmp_sspa_rx_disable(struct sspa_priv *sspa)
 {
 	unsigned int sspa_sp;
 
@@ -90,10 +90,10 @@ static void mmp_sspa_rx_disable(struct ssp_device *sspa)
 static int mmp_sspa_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *dai)
 {
-	struct sspa_priv *priv = snd_soc_dai_get_drvdata(dai);
+	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
 
-	clk_enable(priv->sysclk);
-	clk_enable(priv->sspa->clk);
+	clk_enable(sspa->sysclk);
+	clk_enable(sspa->clk);
 
 	return 0;
 }
@@ -101,10 +101,10 @@ static int mmp_sspa_startup(struct snd_pcm_substream *substream,
 static void mmp_sspa_shutdown(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *dai)
 {
-	struct sspa_priv *priv = snd_soc_dai_get_drvdata(dai);
+	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
 
-	clk_disable(priv->sspa->clk);
-	clk_disable(priv->sysclk);
+	clk_disable(sspa->clk);
+	clk_disable(sspa->sysclk);
 
 }
 
@@ -114,12 +114,12 @@ static void mmp_sspa_shutdown(struct snd_pcm_substream *substream,
 static int mmp_sspa_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 				    int clk_id, unsigned int freq, int dir)
 {
-	struct sspa_priv *priv = snd_soc_dai_get_drvdata(cpu_dai);
+	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret = 0;
 
 	switch (clk_id) {
 	case MMP_SSPA_CLK_AUDIO:
-		ret = clk_set_rate(priv->audio_clk, freq);
+		ret = clk_set_rate(sspa->audio_clk, freq);
 		if (ret)
 			return ret;
 		break;
@@ -138,17 +138,17 @@ static int mmp_sspa_set_dai_pll(struct snd_soc_dai *cpu_dai, int pll_id,
 				 int source, unsigned int freq_in,
 				 unsigned int freq_out)
 {
-	struct sspa_priv *priv = snd_soc_dai_get_drvdata(cpu_dai);
+	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret = 0;
 
 	switch (pll_id) {
 	case MMP_SYSCLK:
-		ret = clk_set_rate(priv->sysclk, freq_out);
+		ret = clk_set_rate(sspa->sysclk, freq_out);
 		if (ret)
 			return ret;
 		break;
 	case MMP_SSPA_CLK:
-		ret = clk_set_rate(priv->sspa->clk, freq_out);
+		ret = clk_set_rate(sspa->clk, freq_out);
 		if (ret)
 			return ret;
 		break;
@@ -167,18 +167,17 @@ static int mmp_sspa_set_dai_pll(struct snd_soc_dai *cpu_dai, int pll_id,
 static int mmp_sspa_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 				 unsigned int fmt)
 {
-	struct sspa_priv *sspa_priv = snd_soc_dai_get_drvdata(cpu_dai);
-	struct ssp_device *sspa = sspa_priv->sspa;
+	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
 	u32 sspa_sp, sspa_ctrl;
 
 	/* check if we need to change anything at all */
-	if (sspa_priv->dai_fmt == fmt)
+	if (sspa->dai_fmt == fmt)
 		return 0;
 
 	/* we can only change the settings if the port is not in use */
 	if ((mmp_sspa_read_reg(sspa, SSPA_TXSP) & SSPA_SP_S_EN) ||
 	    (mmp_sspa_read_reg(sspa, SSPA_RXSP) & SSPA_SP_S_EN)) {
-		dev_err(sspa->dev,
+		dev_err(cpu_dai->dev,
 			"can't change hardware dai format: stream is in use\n");
 		return -EINVAL;
 	}
@@ -239,7 +238,7 @@ static int mmp_sspa_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 	 * we have to defer some things until hw_params() where we
 	 * know parameters like the sample size.
 	 */
-	sspa_priv->dai_fmt = fmt;
+	sspa->dai_fmt = fmt;
 	return 0;
 }
 
@@ -251,8 +250,7 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
 {
-	struct sspa_priv *sspa_priv = snd_soc_dai_get_drvdata(dai);
-	struct ssp_device *sspa = sspa_priv->sspa;
+	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
 	u32 sspa_ctrl;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -297,8 +295,7 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 static int mmp_sspa_trigger(struct snd_pcm_substream *substream, int cmd,
 			     struct snd_soc_dai *dai)
 {
-	struct sspa_priv *sspa_priv = snd_soc_dai_get_drvdata(dai);
-	struct ssp_device *sspa = sspa_priv->sspa;
+	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
 	int ret = 0;
 
 	switch (cmd) {
@@ -311,25 +308,25 @@ static int mmp_sspa_trigger(struct snd_pcm_substream *substream, int cmd,
 		 * enabled or not; if has been enabled by another
 		 * stream, do not enable again.
 		 */
-		if (!sspa_priv->running_cnt)
+		if (!sspa->running_cnt)
 			mmp_sspa_rx_enable(sspa);
 
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			mmp_sspa_tx_enable(sspa);
 
-		sspa_priv->running_cnt++;
+		sspa->running_cnt++;
 		break;
 
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		sspa_priv->running_cnt--;
+		sspa->running_cnt--;
 
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			mmp_sspa_tx_disable(sspa);
 
 		/* have no capture stream, disable rx port */
-		if (!sspa_priv->running_cnt)
+		if (!sspa->running_cnt)
 			mmp_sspa_rx_disable(sspa);
 		break;
 
@@ -342,15 +339,14 @@ static int mmp_sspa_trigger(struct snd_pcm_substream *substream, int cmd,
 
 static int mmp_sspa_probe(struct snd_soc_dai *dai)
 {
-	struct sspa_priv *priv = dev_get_drvdata(dai->dev);
+	struct sspa_priv *sspa = dev_get_drvdata(dai->dev);
 
 	snd_soc_dai_init_dma_data(dai,
-				&priv->playback_dma_data,
-				&priv->capture_dma_data);
+				&sspa->playback_dma_data,
+				&sspa->capture_dma_data);
 
-	snd_soc_dai_set_drvdata(dai, priv);
+	snd_soc_dai_set_drvdata(dai, sspa);
 	return 0;
-
 }
 
 #define MMP_SSPA_RATES SNDRV_PCM_RATE_8000_192000
@@ -438,44 +434,39 @@ static const struct snd_soc_component_driver mmp_sspa_component = {
 
 static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 {
-	struct sspa_priv *priv;
+	struct sspa_priv *sspa;
 
-	priv = devm_kzalloc(&pdev->dev,
+	sspa = devm_kzalloc(&pdev->dev,
 				sizeof(struct sspa_priv), GFP_KERNEL);
-	if (!priv)
+	if (!sspa)
 		return -ENOMEM;
 
-	priv->sspa = devm_kzalloc(&pdev->dev,
-				sizeof(struct ssp_device), GFP_KERNEL);
-	if (priv->sspa == NULL)
-		return -ENOMEM;
+	sspa->mmio_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sspa->mmio_base))
+		return PTR_ERR(sspa->mmio_base);
 
-	priv->sspa->mmio_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->sspa->mmio_base))
-		return PTR_ERR(priv->sspa->mmio_base);
+	sspa->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(sspa->clk))
+		return PTR_ERR(sspa->clk);
 
-	priv->sspa->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(priv->sspa->clk))
-		return PTR_ERR(priv->sspa->clk);
+	sspa->audio_clk = clk_get(NULL, "mmp-audio");
+	if (IS_ERR(sspa->audio_clk))
+		return PTR_ERR(sspa->audio_clk);
 
-	priv->audio_clk = clk_get(NULL, "mmp-audio");
-	if (IS_ERR(priv->audio_clk))
-		return PTR_ERR(priv->audio_clk);
-
-	priv->sysclk = clk_get(NULL, "mmp-sysclk");
-	if (IS_ERR(priv->sysclk)) {
-		clk_put(priv->audio_clk);
-		return PTR_ERR(priv->sysclk);
+	sspa->sysclk = clk_get(NULL, "mmp-sysclk");
+	if (IS_ERR(sspa->sysclk)) {
+		clk_put(sspa->audio_clk);
+		return PTR_ERR(sspa->sysclk);
 	}
-	clk_enable(priv->audio_clk);
-	priv->dai_fmt = (unsigned int) -1;
-	platform_set_drvdata(pdev, priv);
+	clk_enable(sspa->audio_clk);
+	sspa->dai_fmt = (unsigned int) -1;
+	platform_set_drvdata(pdev, sspa);
 
-	priv->playback_dma_data.maxburst = 4;
-	priv->capture_dma_data.maxburst = 4;
+	sspa->playback_dma_data.maxburst = 4;
+	sspa->capture_dma_data.maxburst = 4;
 	/* You know, these addresses are actually ignored. */
-	priv->playback_dma_data.addr = SSPA_TXD;
-	priv->capture_dma_data.addr = SSPA_RXD;
+	sspa->playback_dma_data.addr = SSPA_TXD;
+	sspa->capture_dma_data.addr = SSPA_RXD;
 
 	if (pdev->dev.of_node) {
 		int ret;
@@ -492,11 +483,11 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 
 static int asoc_mmp_sspa_remove(struct platform_device *pdev)
 {
-	struct sspa_priv *priv = platform_get_drvdata(pdev);
+	struct sspa_priv *sspa = platform_get_drvdata(pdev);
 
-	clk_disable(priv->audio_clk);
-	clk_put(priv->audio_clk);
-	clk_put(priv->sysclk);
+	clk_disable(sspa->audio_clk);
+	clk_put(sspa->audio_clk);
+	clk_put(sspa->sysclk);
 	return 0;
 }
 
-- 
2.26.2

