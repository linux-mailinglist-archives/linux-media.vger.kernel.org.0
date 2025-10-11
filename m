Return-Path: <linux-media+bounces-44198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C3DBCFAD5
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 20:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DA431349A82
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 18:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E4628314D;
	Sat, 11 Oct 2025 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OVW0JGB/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hQonwEDb"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFD827B337
	for <linux-media@vger.kernel.org>; Sat, 11 Oct 2025 18:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760207627; cv=none; b=QCB9KoYoisWy1uMSJBWoC02oup4X5tcVUBSglosHfXspmc7ml9Wbs5cBE6ZfMSIPl/ltjQdEG61+3dB6+qFUcg4K7YgBPyvnIs4XgLi8/uxIX3bUh3EHQc85Q8FOg2c58KosR8KSWGWw9eZ+oHzmxkM9MhNeHVWe0XGTTvLvK4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760207627; c=relaxed/simple;
	bh=mUaE7SS1C4UBootxUbAWIADqYwiIzkPK8Oq3sH1Q1Po=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jteKWDkIVZSvxRC+EnWSfVCFmUbVqhPEg/iIFcEZg8CHcmjjsR2uSa7UiTT3J7R5UH9VZ/KsN2ka0Dxd0mirX+tA4Yevo1nJBTldmi8LfNkrZvOgxFGtZ6eGPm1UmHLh7GM1Itv5GVBNulKlDkFKFhlR9Tl7y3Xmiz0neJlnQ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OVW0JGB/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hQonwEDb; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ckXLb6RqTz9t8P;
	Sat, 11 Oct 2025 20:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760207623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiQAmyj2ZUuUzxjBP8hkUwvdrU9xi0TypULYAy8ZoA4=;
	b=OVW0JGB/ZKSWGeLNvZUq2g9XQ0NsxWk5neL05g+do93+YGshCrYZmTx8K+3obBSbGV3qd/
	iY8l4lyoRA5bbefmtvuNeyMrRi/HZ2h0cYSanQmELI46W6A7YNyJRycYa0+kP+jMlN1e13
	vhUFs+Q3TPCaEnbxM3H5r6zSVBMYkXMGYI/nkBHiEl/VFeEb3Krivicff5cwfrVo5KzH78
	u733KomW+3NE8Ig2XFQh4osSi5nm20m20vQy6AEZS5I9fh3drtaZQ9Z3Ht1RJ/4/hfaWhY
	S2lVccxxNe5wG//sZprKU5VoZXZK+xsRU53dCBGTQL7pMehWp5h5Sd1ZBOLxGQ==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760207621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiQAmyj2ZUuUzxjBP8hkUwvdrU9xi0TypULYAy8ZoA4=;
	b=hQonwEDbLw77FsuK9s379NR4Dm8FXVI8zP952488O8PaA2QsLE273syPxsqFQfag//Pw4b
	sScAp4Sfr0VzKWOCY0ihOXDZvE7EcnwOyAy1UehLJWqwtfuSu8PxdTXOFx57rJLirkCZGW
	keEzS3kIfYcy4Rj0ri01TMXuk5EwTuk7yjAPVK/TiEvnPivCTnoW4f2DGrKPMfV3D/7Tmg
	jwamJtgkrKPQwMrKsW8KkrmDOHe/7AevrwzxXXWafqV3v73esuUs7o6ZrLaCxSwHHSzvlm
	pNm3z2nmr3SZRa8DnLaUAZvUaIzZZvyLIVMjSl6GpRFP7fyM/BKDiKeuCNSvOg==
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
Subject: [PATCH v2 2/2] media: imx-jpeg: Add support for descriptor allocation from SRAM
Date: Sat, 11 Oct 2025 20:32:26 +0200
Message-ID: <20251011183306.163564-2-marek.vasut@mailbox.org>
In-Reply-To: <20251011183306.163564-1-marek.vasut@mailbox.org>
References: <20251011183306.163564-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 5651df3771ec20da4f6
X-MBO-RS-META: xomt5nkpeeqy9zscf3nk1tra1y5eoc5g

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


