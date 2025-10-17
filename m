Return-Path: <linux-media+bounces-44925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F96DBEA605
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 18:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 96E2035DBD7
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 16:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F95332914;
	Fri, 17 Oct 2025 15:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IE3inkyh";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FhUeDa/s"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED032F12B8
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760716782; cv=none; b=tPxgf9gzSVpc2mhtNK5a76okcU25065yyBsREuM3xoomxQEGGGbCFwrA5j/9b61kZ22MHY3TRtO/JWQZPg0IzvaibAj9AXDQZCrojuu+sXtqKa16I7SzTIPRO3INOAHrsnBXLcSMC8JEiqavIwcfjPq8aN6sAXxkxHA4S/Z0XCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760716782; c=relaxed/simple;
	bh=Nd8mAWkxW5amWFcLoMF+waaGuZMATpYYv3s8hI0Nfpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6ZveqKkbgQ00wK8B5FNqK8mxEFHa+wJhW5rsBWHqH+CiGMIRx/1T+i4EVV70SfxDdu+DUU5I0gHXrRY4QklTnwXH+Y3aNVGp7tH1BkWkwfeCUVRo/0P2Wa6doLWuhn8KMEF7lMpOYkKoZidRjHB6sHRgo9n8SCqLKuX/2lcziI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IE3inkyh; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FhUeDa/s; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp8f04jmrz9t8p;
	Fri, 17 Oct 2025 17:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760716776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f0pYqwJVWWzsYVFSkRioR45/eTDyY3UH5KaD3QRb1/M=;
	b=IE3inkyhV0nDnClnOUMb99gUxryTt+AyRrT2nRrS8DGom8Impg/8C7ERrNHF6wHI7kbKO1
	ZEsK9IPb2bYHBYtFI8nvIfz1pkDJgpZKlGIaR+YQlgVIDit0R3wDwSqAIkR/1YbjyabSl7
	j5pFxZ5MRTVfjfwE/9SsL77uGn7wkT5xa/9TghLakWg6T4vKZIyOnOVcKsmryONCXsGRS+
	MKn1aH+D3nzlTHJlSV4zHdgQzsEXSvNkUULw9+w4wT/p9kcaHVELwQftJBpPGgByhIoxbQ
	5acHsR/V+tN8tbPWeALHd+/Gnpp0ehC/D7PoXnw9xg9J9G6KiWsjtX0b5STE0Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="FhUeDa/s";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760716774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f0pYqwJVWWzsYVFSkRioR45/eTDyY3UH5KaD3QRb1/M=;
	b=FhUeDa/shTlWXd24SYP+fPccCuFqupxVYwGHW3XFF/6t3auI4lK3bjUVLYFeP569jqBeSc
	DJ0TFZu0r9y0buD4IwUizPZXQEiYRQ9GBihGgzYj83uW7ODvWCD0qpvUN2IuTVGIYeuEa9
	Y49JCMIxJaj2lDn6R/e0jhxTeStDwfgcHn5WkG6mytAPgCrVZO4XK06z57LhClX22Z61Vp
	Fkn6zuBpW7oT5WYUnUrkNaLKqbIzYJDlzLxjdFYW/aEDvLivbhrJEoR1Dmq9CLspMN+Qzd
	jJyhmZOTNiu99d0XbCB4IIWYCHzoqbbvhJygth9lbM0B+s8wYEptNuRfamSMcQ==
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] media: imx-jpeg: Add support for descriptor allocation from SRAM
Date: Fri, 17 Oct 2025 17:58:38 +0200
Message-ID: <20251017155912.109454-2-marek.vasut@mailbox.org>
In-Reply-To: <20251017155912.109454-1-marek.vasut@mailbox.org>
References: <20251017155912.109454-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0de76c55d45f1b8f442
X-MBO-RS-META: fcu4qcop6hfbnxiuqwbde37fppkdzmxn
X-Rspamd-Queue-Id: 4cp8f04jmrz9t8p

Add support for optional allocation of bitstream descriptors from SRAM
instead of DRAM. In case the encoder/decoder DT node contains 'sram'
property which points to 'mmio-sram', the driver will attempt to use
the SRAM instead of DRAM for descriptor allocation, which might improve
performance.

This also helps on i.MX95 rev.A with sporadic SLOTn_STATUS IMG_RD_ERR
bit 11 being triggered during JPEG encoding, which is caused by a bug
fixed on later SoC revisions. The bug occurs less often when using the
SRAM for descriptor storage, but is not entirely mitigated. The following
pipeline triggers the bug when descriptors get allocated from DRAM, the
pipeline often hangs after a few seconds and the encoder driver indicates
"timeout, cancel it":

gst-launch-1.0 videotestsrc ! \
               video/x-raw,width=256,height=256,format=YUY2 ! \
               queue ! v4l2jpegenc ! queue ! fakesink

Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ming Qian <ming.qian@oss.nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
---
V2: - Wrap lines to 100
    - Update commit message
V3: Add TB from Ming
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 70 +++++++++++--------
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  1 +
 2 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index df3ccdf767baf..a1e9878ec517f 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -44,6 +44,7 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/clk.h>
+#include <linux/genalloc.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -783,32 +784,40 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
 	return -1;
 }
 
+static void mxc_jpeg_free(struct mxc_jpeg_dev *jpeg, size_t size, void *addr, dma_addr_t handle)
+{
+	if (jpeg->sram_pool)
+		gen_pool_free(jpeg->sram_pool, (unsigned long)addr, size);
+	else
+		dma_free_coherent(jpeg->dev, size, addr, handle);
+}
+
 static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 {
 	/* free descriptor for decoding/encoding phase */
-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
-			  jpeg->slot_data.desc,
-			  jpeg->slot_data.desc_handle);
+	mxc_jpeg_free(jpeg, sizeof(struct mxc_jpeg_desc),
+		      jpeg->slot_data.desc,
+		      jpeg->slot_data.desc_handle);
 	jpeg->slot_data.desc = NULL;
 	jpeg->slot_data.desc_handle = 0;
 
 	/* free descriptor for encoder configuration phase / decoder DHT */
-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
-			  jpeg->slot_data.cfg_desc,
-			  jpeg->slot_data.cfg_desc_handle);
+	mxc_jpeg_free(jpeg, sizeof(struct mxc_jpeg_desc),
+		      jpeg->slot_data.cfg_desc,
+		      jpeg->slot_data.cfg_desc_handle);
 	jpeg->slot_data.cfg_desc_handle = 0;
 	jpeg->slot_data.cfg_desc = NULL;
 
 	/* free configuration stream */
-	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
-			  jpeg->slot_data.cfg_stream_vaddr,
-			  jpeg->slot_data.cfg_stream_handle);
+	mxc_jpeg_free(jpeg, MXC_JPEG_MAX_CFG_STREAM,
+		      jpeg->slot_data.cfg_stream_vaddr,
+		      jpeg->slot_data.cfg_stream_handle);
 	jpeg->slot_data.cfg_stream_vaddr = NULL;
 	jpeg->slot_data.cfg_stream_handle = 0;
 
-	dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
-			  jpeg->slot_data.cfg_dec_vaddr,
-			  jpeg->slot_data.cfg_dec_daddr);
+	mxc_jpeg_free(jpeg, jpeg->slot_data.cfg_dec_size,
+		      jpeg->slot_data.cfg_dec_vaddr,
+		      jpeg->slot_data.cfg_dec_daddr);
 	jpeg->slot_data.cfg_dec_size = 0;
 	jpeg->slot_data.cfg_dec_vaddr = NULL;
 	jpeg->slot_data.cfg_dec_daddr = 0;
@@ -816,6 +825,15 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	jpeg->slot_data.used = false;
 }
 
+static struct mxc_jpeg_desc *mxc_jpeg_alloc(struct mxc_jpeg_dev *jpeg, size_t size,
+					    dma_addr_t *handle)
+{
+	if (jpeg->sram_pool)
+		return gen_pool_dma_zalloc(jpeg->sram_pool, size, handle);
+	else
+		return dma_alloc_coherent(jpeg->dev, size, handle, GFP_ATOMIC);
+}
+
 static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 {
 	struct mxc_jpeg_desc *desc;
@@ -826,37 +844,29 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 		goto skip_alloc; /* already allocated, reuse it */
 
 	/* allocate descriptor for decoding/encoding phase */
-	desc = dma_alloc_coherent(jpeg->dev,
-				  sizeof(struct mxc_jpeg_desc),
-				  &jpeg->slot_data.desc_handle,
-				  GFP_ATOMIC);
+	desc = mxc_jpeg_alloc(jpeg, sizeof(struct mxc_jpeg_desc),
+			      &jpeg->slot_data.desc_handle);
 	if (!desc)
 		goto err;
 	jpeg->slot_data.desc = desc;
 
 	/* allocate descriptor for configuration phase (encoder only) */
-	cfg_desc = dma_alloc_coherent(jpeg->dev,
-				      sizeof(struct mxc_jpeg_desc),
-				      &jpeg->slot_data.cfg_desc_handle,
-				      GFP_ATOMIC);
+	cfg_desc = mxc_jpeg_alloc(jpeg, sizeof(struct mxc_jpeg_desc),
+				  &jpeg->slot_data.cfg_desc_handle);
 	if (!cfg_desc)
 		goto err;
 	jpeg->slot_data.cfg_desc = cfg_desc;
 
 	/* allocate configuration stream */
-	cfg_stm = dma_alloc_coherent(jpeg->dev,
-				     MXC_JPEG_MAX_CFG_STREAM,
-				     &jpeg->slot_data.cfg_stream_handle,
-				     GFP_ATOMIC);
+	cfg_stm = mxc_jpeg_alloc(jpeg, MXC_JPEG_MAX_CFG_STREAM,
+				 &jpeg->slot_data.cfg_stream_handle);
 	if (!cfg_stm)
 		goto err;
 	jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
 
 	jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * MXC_JPEG_PATTERN_HEIGHT * 2;
-	jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
-							   jpeg->slot_data.cfg_dec_size,
-							   &jpeg->slot_data.cfg_dec_daddr,
-							   GFP_ATOMIC);
+	jpeg->slot_data.cfg_dec_vaddr = mxc_jpeg_alloc(jpeg, jpeg->slot_data.cfg_dec_size,
+						       &jpeg->slot_data.cfg_dec_daddr);
 	if (!jpeg->slot_data.cfg_dec_vaddr)
 		goto err;
 
@@ -2888,6 +2898,10 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 	jpeg->dev = dev;
 	jpeg->mode = mode;
 
+	/* SRAM pool is optional */
+	jpeg->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+	dev_info(dev, "Using DMA descriptor pool in %cRAM\n", jpeg->sram_pool ? 'S' : 'D');
+
 	/* Get clocks */
 	ret = devm_clk_bulk_get_all(&pdev->dev, &jpeg->clks);
 	if (ret < 0) {
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 44e46face6d1d..9c5b4f053deda 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -141,6 +141,7 @@ struct mxc_jpeg_dev {
 	int				num_domains;
 	struct device			**pd_dev;
 	struct device_link		**pd_link;
+	struct gen_pool			*sram_pool;
 };
 
 /**
-- 
2.51.0


