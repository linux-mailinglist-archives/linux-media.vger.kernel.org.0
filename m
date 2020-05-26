Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E621CE678
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 23:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731957AbgEKVCJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 17:02:09 -0400
Received: from v6.sk ([167.172.42.174]:52586 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732365AbgEKVBv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 17:01:51 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 7BAB9610D4;
        Mon, 11 May 2020 21:01:49 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 08/11] ASoC: mmp-sspa: Add support for the runtime power management
Date:   Mon, 11 May 2020 23:01:31 +0200
Message-Id: <20200511210134.1224532-9-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511210134.1224532-1-lkundrak@v3.sk>
References: <20200511210134.1224532-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only turn on the Audio island when it's in use.

This requires keeping track of control register contents instead of
reloading them back from hardware, because they're lost when the power is
off.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 sound/soc/pxa/mmp-sspa.c | 126 ++++++++++++++++++++-------------------
 1 file changed, 66 insertions(+), 60 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index a66e594b1072..9cb17c4fb0c8 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/dmaengine.h>
+#include <linux/pm_runtime.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -33,8 +34,9 @@ struct sspa_priv {
 	struct clk *clk;
 	struct clk *audio_clk;
 	struct clk *sysclk;
-	int dai_fmt;
 	int running_cnt;
+	u32 sp;
+	u32 ctrl;
 };
 
 static void mmp_sspa_write_reg(struct sspa_priv *sspa, u32 reg, u32 val)
@@ -49,9 +51,9 @@ static u32 mmp_sspa_read_reg(struct sspa_priv *sspa, u32 reg)
 
 static void mmp_sspa_tx_enable(struct sspa_priv *sspa)
 {
-	unsigned int sspa_sp;
+	unsigned int sspa_sp = sspa->sp;
 
-	sspa_sp = mmp_sspa_read_reg(sspa, SSPA_TXSP);
+	sspa_sp &= ~SSPA_SP_MSL;
 	sspa_sp |= SSPA_SP_S_EN;
 	sspa_sp |= SSPA_SP_WEN;
 	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa_sp);
@@ -59,9 +61,9 @@ static void mmp_sspa_tx_enable(struct sspa_priv *sspa)
 
 static void mmp_sspa_tx_disable(struct sspa_priv *sspa)
 {
-	unsigned int sspa_sp;
+	unsigned int sspa_sp = sspa->sp;
 
-	sspa_sp = mmp_sspa_read_reg(sspa, SSPA_TXSP);
+	sspa_sp &= ~SSPA_SP_MSL;
 	sspa_sp &= ~SSPA_SP_S_EN;
 	sspa_sp |= SSPA_SP_WEN;
 	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa_sp);
@@ -69,9 +71,8 @@ static void mmp_sspa_tx_disable(struct sspa_priv *sspa)
 
 static void mmp_sspa_rx_enable(struct sspa_priv *sspa)
 {
-	unsigned int sspa_sp;
+	unsigned int sspa_sp = sspa->sp;
 
-	sspa_sp = mmp_sspa_read_reg(sspa, SSPA_RXSP);
 	sspa_sp |= SSPA_SP_S_EN;
 	sspa_sp |= SSPA_SP_WEN;
 	mmp_sspa_write_reg(sspa, SSPA_RXSP, sspa_sp);
@@ -79,9 +80,8 @@ static void mmp_sspa_rx_enable(struct sspa_priv *sspa)
 
 static void mmp_sspa_rx_disable(struct sspa_priv *sspa)
 {
-	unsigned int sspa_sp;
+	unsigned int sspa_sp = sspa->sp;
 
-	sspa_sp = mmp_sspa_read_reg(sspa, SSPA_RXSP);
 	sspa_sp &= ~SSPA_SP_S_EN;
 	sspa_sp |= SSPA_SP_WEN;
 	mmp_sspa_write_reg(sspa, SSPA_RXSP, sspa_sp);
@@ -160,35 +160,20 @@ static int mmp_sspa_set_dai_pll(struct snd_soc_dai *cpu_dai, int pll_id,
 }
 
 /*
- * Set up the sspa dai format. The sspa port must be inactive
- * before calling this function as the physical
- * interface format is changed.
+ * Set up the sspa dai format.
  */
 static int mmp_sspa_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 				 unsigned int fmt)
 {
 	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(cpu_dai);
-	u32 sspa_sp, sspa_ctrl;
-
-	/* check if we need to change anything at all */
-	if (sspa->dai_fmt == fmt)
-		return 0;
-
-	/* we can only change the settings if the port is not in use */
-	if ((mmp_sspa_read_reg(sspa, SSPA_TXSP) & SSPA_SP_S_EN) ||
-	    (mmp_sspa_read_reg(sspa, SSPA_RXSP) & SSPA_SP_S_EN)) {
-		dev_err(cpu_dai->dev,
-			"can't change hardware dai format: stream is in use\n");
-		return -EINVAL;
-	}
 
 	/* reset port settings */
-	sspa_sp   = SSPA_SP_WEN | SSPA_SP_S_RST | SSPA_SP_FFLUSH;
-	sspa_ctrl = 0;
+	sspa->sp   = SSPA_SP_WEN | SSPA_SP_S_RST | SSPA_SP_FFLUSH;
+	sspa->ctrl = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
-		sspa_sp |= SSPA_SP_MSL;
+		sspa->sp |= SSPA_SP_MSL;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM:
 		break;
@@ -198,7 +183,7 @@ static int mmp_sspa_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
-		sspa_sp |= SSPA_SP_FSP;
+		sspa->sp |= SSPA_SP_FSP;
 		break;
 	default:
 		return -EINVAL;
@@ -206,39 +191,18 @@ static int mmp_sspa_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
-		sspa_sp |= SSPA_TXSP_FPER(63);
-		sspa_sp |= SSPA_SP_FWID(31);
-		sspa_ctrl |= SSPA_CTL_XDATDLY(1);
+		sspa->sp |= SSPA_TXSP_FPER(63);
+		sspa->sp |= SSPA_SP_FWID(31);
+		sspa->ctrl |= SSPA_CTL_XDATDLY(1);
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa_sp);
-	mmp_sspa_write_reg(sspa, SSPA_RXSP, sspa_sp);
-
-	sspa_sp &= ~(SSPA_SP_S_RST | SSPA_SP_FFLUSH);
-	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa_sp);
-	mmp_sspa_write_reg(sspa, SSPA_RXSP, sspa_sp);
-
-	/*
-	 * FIXME: hw issue, for the tx serial port,
-	 * can not config the master/slave mode;
-	 * so must clean this bit.
-	 * The master/slave mode has been set in the
-	 * rx port.
-	 */
-	sspa_sp &= ~SSPA_SP_MSL;
-	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa_sp);
-
-	mmp_sspa_write_reg(sspa, SSPA_TXCTL, sspa_ctrl);
-	mmp_sspa_write_reg(sspa, SSPA_RXCTL, sspa_ctrl);
-
 	/* Since we are configuring the timings for the format by hand
 	 * we have to defer some things until hw_params() where we
 	 * know parameters like the sample size.
 	 */
-	sspa->dai_fmt = fmt;
 	return 0;
 }
 
@@ -251,12 +215,7 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct sspa_priv *sspa = snd_soc_dai_get_drvdata(dai);
-	u32 sspa_ctrl;
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		sspa_ctrl = mmp_sspa_read_reg(sspa, SSPA_TXCTL);
-	else
-		sspa_ctrl = mmp_sspa_read_reg(sspa, SSPA_RXCTL);
+	u32 sspa_ctrl = sspa->ctrl;
 
 	sspa_ctrl &= ~SSPA_CTL_XFRLEN1_MASK;
 	sspa_ctrl |= SSPA_CTL_XFRLEN1(params_channels(params) - 1);
@@ -427,9 +386,55 @@ static int mmp_pcm_mmap(struct snd_soc_component *component,
 		vma->vm_end - vma->vm_start, vma->vm_page_prot);
 }
 
+static int mmp_sspa_open(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream)
+{
+	struct sspa_priv *sspa = snd_soc_component_get_drvdata(component);
+
+	pm_runtime_get_sync(component->dev);
+
+	/* we can only change the settings if the port is not in use */
+	if ((mmp_sspa_read_reg(sspa, SSPA_TXSP) & SSPA_SP_S_EN) ||
+	    (mmp_sspa_read_reg(sspa, SSPA_RXSP) & SSPA_SP_S_EN)) {
+		dev_err(component->dev,
+			"can't change hardware dai format: stream is in use\n");
+		return -EBUSY;
+	}
+
+	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa->sp);
+	mmp_sspa_write_reg(sspa, SSPA_RXSP, sspa->sp);
+
+	sspa->sp &= ~(SSPA_SP_S_RST | SSPA_SP_FFLUSH);
+	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa->sp);
+	mmp_sspa_write_reg(sspa, SSPA_RXSP, sspa->sp);
+
+	/*
+	 * FIXME: hw issue, for the tx serial port,
+	 * can not config the master/slave mode;
+	 * so must clean this bit.
+	 * The master/slave mode has been set in the
+	 * rx port.
+	 */
+	mmp_sspa_write_reg(sspa, SSPA_TXSP, sspa->sp & ~SSPA_SP_MSL);
+
+	mmp_sspa_write_reg(sspa, SSPA_TXCTL, sspa->ctrl);
+	mmp_sspa_write_reg(sspa, SSPA_RXCTL, sspa->ctrl);
+
+	return 0;
+}
+
+static int mmp_sspa_close(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream)
+{
+	pm_runtime_put_sync(component->dev);
+	return 0;
+}
+
 static const struct snd_soc_component_driver mmp_sspa_component = {
 	.name		= "mmp-sspa",
 	.mmap		= mmp_pcm_mmap,
+	.open		= mmp_sspa_open,
+	.close		= mmp_sspa_close,
 };
 
 static int asoc_mmp_sspa_probe(struct platform_device *pdev)
@@ -458,8 +463,8 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 		clk_put(sspa->audio_clk);
 		return PTR_ERR(sspa->sysclk);
 	}
+	pm_runtime_enable(&pdev->dev);
 	clk_prepare_enable(sspa->audio_clk);
-	sspa->dai_fmt = (unsigned int) -1;
 	platform_set_drvdata(pdev, sspa);
 
 	sspa->playback_dma_data.maxburst = 4;
@@ -486,6 +491,7 @@ static int asoc_mmp_sspa_remove(struct platform_device *pdev)
 	struct sspa_priv *sspa = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(sspa->audio_clk);
+	pm_runtime_disable(&pdev->dev);
 	clk_put(sspa->audio_clk);
 	clk_put(sspa->sysclk);
 	return 0;
-- 
2.26.2

