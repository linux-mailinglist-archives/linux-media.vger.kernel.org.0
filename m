Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF87438310
	for <lists+linux-media@lfdr.de>; Sat, 23 Oct 2021 12:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhJWKNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 06:13:13 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:52632 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbhJWKNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 06:13:12 -0400
Received: from pop-os.home ([92.140.161.106])
        by smtp.orange.fr with ESMTPA
        id eDzFmzdx8niuxeDzFmn8rc; Sat, 23 Oct 2021 12:10:52 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 23 Oct 2021 12:10:52 +0200
X-ME-IP: 92.140.161.106
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     a.hajda@samsung.com, mchehab@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: s5p-mfc: Use 'bitmap_zalloc()' when applicable
Date:   Sat, 23 Oct 2021 12:10:48 +0200
Message-Id: <065fd81346699cc8fda251d91227381f7e26740d.1634983722.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'mfc_dev->mem_bitmap' is a bitmap. So use 'bitmap_zalloc()' to simplify
code and improve the semantic.

Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
consistency.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/s5p-mfc/s5p_mfc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index fc85e4e2d020..f6732f031e96 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -1185,7 +1185,6 @@ static int s5p_mfc_configure_common_memory(struct s5p_mfc_dev *mfc_dev)
 {
 	struct device *dev = &mfc_dev->plat_dev->dev;
 	unsigned long mem_size = SZ_4M;
-	unsigned int bitmap_size;
 
 	if (IS_ENABLED(CONFIG_DMA_CMA) || exynos_is_iommu_available(dev))
 		mem_size = SZ_8M;
@@ -1193,16 +1192,14 @@ static int s5p_mfc_configure_common_memory(struct s5p_mfc_dev *mfc_dev)
 	if (mfc_mem_size)
 		mem_size = memparse(mfc_mem_size, NULL);
 
-	bitmap_size = BITS_TO_LONGS(mem_size >> PAGE_SHIFT) * sizeof(long);
-
-	mfc_dev->mem_bitmap = kzalloc(bitmap_size, GFP_KERNEL);
+	mfc_dev->mem_bitmap = bitmap_zalloc(mem_size >> PAGE_SHIFT, GFP_KERNEL);
 	if (!mfc_dev->mem_bitmap)
 		return -ENOMEM;
 
 	mfc_dev->mem_virt = dma_alloc_coherent(dev, mem_size,
 					       &mfc_dev->mem_base, GFP_KERNEL);
 	if (!mfc_dev->mem_virt) {
-		kfree(mfc_dev->mem_bitmap);
+		bitmap_free(mfc_dev->mem_bitmap);
 		dev_err(dev, "failed to preallocate %ld MiB for the firmware and context buffers\n",
 			(mem_size / SZ_1M));
 		return -ENOMEM;
@@ -1241,7 +1238,7 @@ static void s5p_mfc_unconfigure_common_memory(struct s5p_mfc_dev *mfc_dev)
 
 	dma_free_coherent(dev, mfc_dev->mem_size, mfc_dev->mem_virt,
 			  mfc_dev->mem_base);
-	kfree(mfc_dev->mem_bitmap);
+	bitmap_free(mfc_dev->mem_bitmap);
 	vb2_dma_contig_clear_max_seg_size(dev);
 }
 
-- 
2.30.2

