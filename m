Return-Path: <linux-media+bounces-40460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21216B2E250
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 18:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03A0E188B171
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3723322C61;
	Wed, 20 Aug 2025 16:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VhqdhUpN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JYM4aPen"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6536CDF3
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 16:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755707463; cv=none; b=Z7Vu5blEA+vDAel8vQAQRw+aGe4Muv+r0dMAWpaLEYocutWSVKU2oUnle9NGk3OvD98/vU6oK0LpEo/uxqtZ5Ebze85g8WYa1sMIYTLzIc2bqtIT0YVJCD0PZIUTk1W2oP9JQG/xmcVae9IYtbJ+fu1UakS1nH76GmfeQmQlDiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755707463; c=relaxed/simple;
	bh=n93RbmvdxXAXIsQY9cuLC067pGqgsNjXqIUU0JDRxqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5bmiA/Vf+R/LFIXoUG6VDkBTVu4qgLhjJ09iq0C+wfbSGtDR2uTGoW/8nWvQkg/El1+WfO4PFNQ7NemPqal+f5qLiPqTWEwbg6hWupry6M3dG8mvaw1/QVaa3toIjpsVr4u3pxnXz7HQswQflHG+HtHROlYnarTdvSFsyGRrcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VhqdhUpN; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JYM4aPen; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c6X4z71W5z9vMg;
	Wed, 20 Aug 2025 18:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755707460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kHX3BHOVyKDr1vkSjiBcFwyG72/E1SLSWwTaTy9ZuNQ=;
	b=VhqdhUpNPmGW+KEPWH6K5tDuGBxQhOK+BGOvOoemCrvixzTc2IRS57TWliX55pIxjryPUA
	DRu730wmT/NgWQ+9cKc4WOB+AZAeu4xPo3oxS5zy87i2aLWrfhOsXX8EjfaVM+3UPBo+dW
	xOi6+ULU0nrt560SEfgZnSi0zU3WujWWngNYUIn3fv5e3IQh/7ajFsDkxX0n7IKdgQZ7oM
	AhgGGLc+JYU5aryhs0PnUpAgFjwmBSSGKx7LiuWE+wFoaT2ebswnqdsPBpnDXGxvdUQKmc
	0dAkLnm5Sw9tlAVHRHMDB1uaGvCJeI3HCnkp+8t2y/2r0z8oVm7A72Fq/K1SAg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=JYM4aPen;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755707458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kHX3BHOVyKDr1vkSjiBcFwyG72/E1SLSWwTaTy9ZuNQ=;
	b=JYM4aPenlEoMXC6t6hOptefkWXAlhy0cTi+IJjzx2EvtnWkADM6mROMswJmluONAQUYC0O
	J+rEAqilgqXrl4BIsGSR7a3jQ/ubR4kCxAb/riipYolwzzUCBmc8WqiuZ7v1VNFivDHBcX
	JdLpcnMnqGwSRWZm2FgLT/135Qhyr/8zShtJR+NGDr2EnKm4s/1ObXNKM/6sNlAoHIJ8qh
	hB0m/nargpm2Br38aW4xGzCv6IASzd3g2Nt1xunc4sYkgliEtZ465HeIZvucscjmVr4cR5
	XlxLwbZUjaw4IsbJe21FZGOFNUo24BWVpmR14AJ/QfeuiNwtcZaeGN4nofnAZA==
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: imx-jpeg: Add support for descriptor allocation from SRAM
Date: Wed, 20 Aug 2025 18:29:53 +0200
Message-ID: <20250820163046.209917-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 533af5eeeb0adf48f1b
X-MBO-RS-META: it9z8mmorgymzt8d999x7urox1a7z8ws
X-Rspamd-Queue-Id: 4c6X4z71W5z9vMg

Add support for optional allocation of bitstream descriptors from SRAM
instead of DRAM. In case the encoder/decoder DT node contains 'sram'
property which points to 'mmio-sram', the driver will attempt to use
the SRAM instead of DRAM for descriptor allocation, which might improve
performance.

This however helps on i.MX95 with sporadic SLOTn_STATUS IMG_RD_ERR bit 11
being triggered during JPEG encoding. The following pipeline triggers the
problem when descriptors get allocated from DRAM, the pipeline often hangs
after a few seconds and the encoder driver indicates "timeout, cancel it" :

gst-launch-1.0 videotestsrc ! video/x-raw,width=256,height=256,format=YUY2 ! \
               queue ! v4l2jpegenc ! queue ! fakesink

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
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 69 +++++++++++--------
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  1 +
 2 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index aef1d6473eb8d..0095c2182ed39 100644
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
@@ -816,6 +825,14 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	jpeg->slot_data.used = false;
 }
 
+static struct mxc_jpeg_desc *mxc_jpeg_alloc(struct mxc_jpeg_dev *jpeg, size_t size, dma_addr_t *handle)
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
@@ -826,37 +843,29 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
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
 
@@ -2902,6 +2911,10 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
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
index 7f0910fc9b47e..311f2f2ac519f 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -142,6 +142,7 @@ struct mxc_jpeg_dev {
 	int				num_domains;
 	struct device			**pd_dev;
 	struct device_link		**pd_link;
+	struct gen_pool			*sram_pool;
 };
 
 /**
-- 
2.50.1


