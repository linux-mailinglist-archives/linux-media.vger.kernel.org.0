Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133DD1CE663
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 23:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732345AbgEKVBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 17:01:46 -0400
Received: from v6.sk ([167.172.42.174]:52586 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732333AbgEKVBp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 17:01:45 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 37505610CF;
        Mon, 11 May 2020 21:01:43 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 04/11] ASoC: mmp-sspa: Get rid of dma_params and phys_base
Date:   Mon, 11 May 2020 23:01:27 +0200
Message-Id: <20200511210134.1224532-5-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511210134.1224532-1-lkundrak@v3.sk>
References: <20200511210134.1224532-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes things simpler. There's no reason not to just embed the struct
snd_dmaengine_dai_dma_data in struct sspa_priv and do away with an
unnecessary kmalloc(). While at that, we can initialize the
snd_dmaengine_dai_dma_data structures earlier.

Let's also stop offsetting the source/destination of the DMA transfer by
phys_base. Firstly, it's never set and is always zero. Secondly, the
hardware actually ignores it, at least on a MMP2 and MMP3.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 sound/soc/pxa/mmp-sspa.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 90a9bc81be80..421ffa9fa7b1 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -29,7 +29,8 @@
  */
 struct sspa_priv {
 	struct ssp_device *sspa;
-	struct snd_dmaengine_dai_dma_data *dma_params;
+	struct snd_dmaengine_dai_dma_data playback_dma_data;
+	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct clk *audio_clk;
 	struct clk *sysclk;
 	int dai_fmt;
@@ -250,11 +251,8 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct sspa_priv *sspa_priv = snd_soc_dai_get_drvdata(dai);
 	struct ssp_device *sspa = sspa_priv->sspa;
-	struct snd_dmaengine_dai_dma_data *dma_params;
 	u32 sspa_ctrl;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -293,11 +291,6 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 		mmp_sspa_write_reg(sspa, SSPA_RXFIFO_UL, 0x0);
 	}
 
-	dma_params = &sspa_priv->dma_params[substream->stream];
-	dma_params->addr = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
-				(sspa->phys_base + SSPA_TXD) :
-				(sspa->phys_base + SSPA_RXD);
-	snd_soc_dai_set_dma_data(cpu_dai, substream, dma_params);
 	return 0;
 }
 
@@ -351,6 +344,10 @@ static int mmp_sspa_probe(struct snd_soc_dai *dai)
 {
 	struct sspa_priv *priv = dev_get_drvdata(dai->dev);
 
+	snd_soc_dai_init_dma_data(dai,
+				&priv->playback_dma_data,
+				&priv->capture_dma_data);
+
 	snd_soc_dai_set_drvdata(dai, priv);
 	return 0;
 
@@ -407,12 +404,6 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 	if (priv->sspa == NULL)
 		return -ENOMEM;
 
-	priv->dma_params = devm_kcalloc(&pdev->dev,
-			2, sizeof(struct snd_dmaengine_dai_dma_data),
-			GFP_KERNEL);
-	if (priv->dma_params == NULL)
-		return -ENOMEM;
-
 	priv->sspa->mmio_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->sspa->mmio_base))
 		return PTR_ERR(priv->sspa->mmio_base);
@@ -434,6 +425,10 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 	priv->dai_fmt = (unsigned int) -1;
 	platform_set_drvdata(pdev, priv);
 
+	/* You know, these addresses are actually ignored. */
+	priv->playback_dma_data.addr = SSPA_TXD;
+	priv->capture_dma_data.addr = SSPA_RXD;
+
 	return devm_snd_soc_register_component(&pdev->dev, &mmp_sspa_component,
 					       &mmp_sspa_dai, 1);
 }
-- 
2.26.2

