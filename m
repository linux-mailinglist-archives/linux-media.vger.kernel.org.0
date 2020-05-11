Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0BD1CE666
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 23:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732357AbgEKVBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 17:01:48 -0400
Received: from v6.sk ([167.172.42.174]:52574 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732339AbgEKVBq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 17:01:46 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id BA2E6610D2;
        Mon, 11 May 2020 21:01:44 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 05/11] ASoC: mmp-sspa: Add support for soc-generic-dmaengine-pcm
Date:   Mon, 11 May 2020 23:01:28 +0200
Message-Id: <20200511210134.1224532-6-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511210134.1224532-1-lkundrak@v3.sk>
References: <20200511210134.1224532-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the driver usable with the mmp_tdma drier via
soc-generic-dmaengine-pcm. This is conditionalized on DT node (support
for DT is added by a later patch).

A custom mmap callback that creates a NC mapping is used instead of the
default WC one, because with write-combining some bytes don't seem to
make it through for reasons unknown to me.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 sound/soc/pxa/mmp-sspa.c | 57 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 421ffa9fa7b1..6e4b63d0c589 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -386,8 +386,54 @@ static struct snd_soc_dai_driver mmp_sspa_dai = {
 	.ops = &mmp_sspa_dai_ops,
 };
 
+#define MMP_PCM_INFO (SNDRV_PCM_INFO_MMAP |	\
+		SNDRV_PCM_INFO_MMAP_VALID |	\
+		SNDRV_PCM_INFO_INTERLEAVED |	\
+		SNDRV_PCM_INFO_PAUSE |		\
+		SNDRV_PCM_INFO_RESUME |		\
+		SNDRV_PCM_INFO_NO_PERIOD_WAKEUP)
+
+static const struct snd_pcm_hardware mmp_pcm_hardware[] = {
+	{
+		.info			= MMP_PCM_INFO,
+		.period_bytes_min	= 1024,
+		.period_bytes_max	= 2048,
+		.periods_min		= 2,
+		.periods_max		= 32,
+		.buffer_bytes_max	= 4096,
+		.fifo_size		= 32,
+	},
+	{
+		.info			= MMP_PCM_INFO,
+		.period_bytes_min	= 1024,
+		.period_bytes_max	= 2048,
+		.periods_min		= 2,
+		.periods_max		= 32,
+		.buffer_bytes_max	= 4096,
+		.fifo_size		= 32,
+	},
+};
+
+static const struct snd_dmaengine_pcm_config mmp_pcm_config = {
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+	.pcm_hardware = mmp_pcm_hardware,
+	.prealloc_buffer_size = 4096,
+};
+
+static int mmp_pcm_mmap(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream,
+			struct vm_area_struct *vma)
+{
+	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	return remap_pfn_range(vma, vma->vm_start,
+		substream->dma_buffer.addr >> PAGE_SHIFT,
+		vma->vm_end - vma->vm_start, vma->vm_page_prot);
+}
+
 static const struct snd_soc_component_driver mmp_sspa_component = {
 	.name		= "mmp-sspa",
+	.mmap		= mmp_pcm_mmap,
 };
 
 static int asoc_mmp_sspa_probe(struct platform_device *pdev)
@@ -425,10 +471,21 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 	priv->dai_fmt = (unsigned int) -1;
 	platform_set_drvdata(pdev, priv);
 
+	priv->playback_dma_data.maxburst = 4;
+	priv->capture_dma_data.maxburst = 4;
 	/* You know, these addresses are actually ignored. */
 	priv->playback_dma_data.addr = SSPA_TXD;
 	priv->capture_dma_data.addr = SSPA_RXD;
 
+	if (pdev->dev.of_node) {
+		int ret;
+
+		ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
+						      &mmp_pcm_config, 0);
+		if (ret)
+			return ret;
+	}
+
 	return devm_snd_soc_register_component(&pdev->dev, &mmp_sspa_component,
 					       &mmp_sspa_dai, 1);
 }
-- 
2.26.2

