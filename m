Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0EF44FC2D
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 23:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbhKNW1T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Nov 2021 17:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbhKNW1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Nov 2021 17:27:17 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4603C061766;
        Sun, 14 Nov 2021 14:24:18 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id b1so32406558lfs.13;
        Sun, 14 Nov 2021 14:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LzfnJDYRPIbOYnQp6TazcGixcuXnMsld1zX3xBTAG/4=;
        b=Tu3DHxlSGfZYgLzq1BKOtWw+D8xZBCRnu5s2IBd9G5bdM5yJpKCKVVyMc6yYjrA0Mi
         WFw3hvBi3WNZ8AO4UfHT5xRTV77SfSfgAgK5mTjJdm9Hkg+Vhc04FXPSaNMlbkyODsHI
         1VOj+0ANS5tYI0Zdp/3Vxo54Q8mFduyLPvucPrhpAf5BrUVALgBzR57kaDpGPcWaOXpq
         4WZCj7IBNQ5BAVJGXkHl/Qin4oeuu1H8uWhAhtQrQj/ghbafSQBP1ZXPppb9fPWAPO2r
         DYEGTE7h3WzZ/HDcQROz42XOGCitd0aNxRy8i36VsEh7j9wWCLUbm89caLZdat4qeeSw
         /VCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LzfnJDYRPIbOYnQp6TazcGixcuXnMsld1zX3xBTAG/4=;
        b=LQQlSJHnyRLe9FWVxqw/EOVMQZS2LGUETCWjR+vYGF/hATlwwB8Rzv5bT4bGTxNec0
         jpMujTe4DLIUG3n2cI2QGV6Mjur7eVBq3Xtdz6D6wkvEzszX33HUC9gYRLKYh/JHpkx+
         ywG8vIVy5O1Vii0+Oxkft3OzKwvZYm3z4YqGsw2Wv8X9+lb/Jfo1icaFkJ1JrWaL/Guz
         KMXovfxEacEDQp7F2atZu3zeDtRGeFiqAg6cstVl7C8qZj6I+dSNdz8JrrA3jqHpgyG7
         Ugvh4BLXwBqdG8B4y0x0rpCoQ+qsGBHzuNeBYcgfClUwRjmtNhm4e9fLOio4pFZVfbaI
         F0UA==
X-Gm-Message-State: AOAM5312TG7qXT3oNqvmrCMOkf9i/TRk+pDFZCy5kLABbp3ClGEGdabS
        5xECiJM2V9if79pcrArgwmE=
X-Google-Smtp-Source: ABdhPJw4xMnJaOoDMfFen4/iR4euxDB7rJafPi3c/TWp5BwoS0xRps4qLkqO785pIFyyTZagtMK40A==
X-Received: by 2002:ac2:5615:: with SMTP id v21mr32118034lfd.112.1636928657147;
        Sun, 14 Nov 2021 14:24:17 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id d6sm1223339lfi.52.2021.11.14.14.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:24:16 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] media: staging: tegra-vde: Support reference picture marking
Date:   Mon, 15 Nov 2021 01:23:51 +0300
Message-Id: <20211114222353.22435-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114222353.22435-1-digetx@gmail.com>
References: <20211114222353.22435-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra114 and Tegra124 support reference picture marking, which will
cause BSEV to write picture marking data to SDRAM. Make sure there is
a valid destination address for that data to avoid error messages from
the memory controller.

[digetx@gmail.com: added BO support and moved secure BO allocation to kernel]
Tested-by: Anton Bambura <jenneron@protonmail.com> # T114 ASUS TF701T
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 120 +++++++++++++++++++++++++-
 drivers/staging/media/tegra-vde/vde.h |  18 ++++
 2 files changed, 137 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 859f60a70904..42da57f191ef 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -85,6 +85,92 @@ static int tegra_vde_wait_mbe(struct tegra_vde *vde)
 					  (tmp >= 0x10), 1, 100);
 }
 
+static struct tegra_vde_bo *
+tegra_vde_alloc_bo(struct tegra_vde *vde, enum dma_data_direction dma_dir,
+		   size_t size)
+{
+	struct device *dev = vde->miscdev.parent;
+	struct tegra_vde_bo *bo;
+	int err;
+
+	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
+	if (!bo)
+		return NULL;
+
+	bo->vde = vde;
+	bo->size = size;
+	bo->dma_dir = dma_dir;
+	bo->dma_attrs = DMA_ATTR_WRITE_COMBINE |
+			DMA_ATTR_NO_KERNEL_MAPPING;
+
+	if (!vde->domain)
+		bo->dma_attrs |= DMA_ATTR_FORCE_CONTIGUOUS;
+
+	bo->dma_cookie = dma_alloc_attrs(dev, bo->size, &bo->dma_handle,
+					 GFP_KERNEL, bo->dma_attrs);
+	if (!bo->dma_cookie) {
+		dev_err(dev, "Failed to allocate DMA buffer of size: %zu\n",
+			bo->size);
+		goto free_bo;
+	}
+
+	err = dma_get_sgtable_attrs(dev, &bo->sgt, bo->dma_cookie,
+				    bo->dma_handle, bo->size, bo->dma_attrs);
+	if (err) {
+		dev_err(dev, "Failed to get DMA buffer SG table: %d\n", err);
+		goto free_attrs;
+	}
+
+	err = dma_map_sgtable(dev, &bo->sgt, bo->dma_dir, bo->dma_attrs);
+	if (err) {
+		dev_err(dev, "Failed to map DMA buffer SG table: %d\n", err);
+		goto free_table;
+	}
+
+	if (vde->domain) {
+		err = tegra_vde_iommu_map(vde, &bo->sgt, &bo->iova, bo->size);
+		if (err) {
+			dev_err(dev, "Failed to map DMA buffer IOVA: %d\n", err);
+			goto unmap_sgtable;
+		}
+
+		bo->dma_addr = iova_dma_addr(&vde->iova, bo->iova);
+	} else {
+		bo->dma_addr = sg_dma_address(bo->sgt.sgl);
+	}
+
+	return bo;
+
+unmap_sgtable:
+	dma_unmap_sgtable(dev, &bo->sgt, bo->dma_dir, bo->dma_attrs);
+free_table:
+	sg_free_table(&bo->sgt);
+free_attrs:
+	dma_free_attrs(dev, bo->size, bo->dma_cookie, bo->dma_handle,
+		       bo->dma_attrs);
+free_bo:
+	kfree(bo);
+
+	return NULL;
+}
+
+static void tegra_vde_free_bo(struct tegra_vde_bo *bo)
+{
+	struct tegra_vde *vde = bo->vde;
+	struct device *dev = vde->miscdev.parent;
+
+	if (vde->domain)
+		tegra_vde_iommu_unmap(vde, bo->iova);
+
+	dma_unmap_sgtable(dev, &bo->sgt, bo->dma_dir, bo->dma_attrs);
+
+	sg_free_table(&bo->sgt);
+
+	dma_free_attrs(dev, bo->size, bo->dma_cookie, bo->dma_handle,
+		       bo->dma_attrs);
+	kfree(bo);
+}
+
 static int tegra_vde_setup_mbe_frame_idx(struct tegra_vde *vde,
 					 unsigned int refs_nb,
 					 bool setup_refs)
@@ -425,6 +511,9 @@ static int tegra_vde_setup_hw_context(struct tegra_vde *vde,
 
 	tegra_vde_writel(vde, bitstream_data_addr, vde->sxe, 0x6C);
 
+	if (vde->soc->supports_ref_pic_marking)
+		tegra_vde_writel(vde, vde->secure_bo->dma_addr, vde->sxe, 0x7c);
+
 	value = 0x10000005;
 	value |= ctx->pic_width_in_mbs << 11;
 	value |= ctx->pic_height_in_mbs << 3;
@@ -994,6 +1083,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vde);
 
+	vde->soc = of_device_get_match_data(&pdev->dev);
+
 	vde->sxe = devm_platform_ioremap_resource_byname(pdev, "sxe");
 	if (IS_ERR(vde->sxe))
 		return PTR_ERR(vde->sxe);
@@ -1119,6 +1210,12 @@ static int tegra_vde_probe(struct platform_device *pdev)
 
 	pm_runtime_put(dev);
 
+	vde->secure_bo = tegra_vde_alloc_bo(vde, DMA_FROM_DEVICE, 4096);
+	if (!vde->secure_bo) {
+		dev_err(dev, "Failed to allocate secure BO\n");
+		goto err_pm_runtime;
+	}
+
 	return 0;
 
 err_pm_runtime:
@@ -1142,6 +1239,8 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	tegra_vde_free_bo(vde->secure_bo);
+
 	/*
 	 * As it increments RPM usage_count even on errors, we don't need to
 	 * check the returned code here.
@@ -1214,8 +1313,27 @@ static const struct dev_pm_ops tegra_vde_pm_ops = {
 				tegra_vde_pm_resume)
 };
 
+static const struct tegra_vde_soc tegra124_vde_soc = {
+	.supports_ref_pic_marking = true,
+};
+
+static const struct tegra_vde_soc tegra114_vde_soc = {
+	.supports_ref_pic_marking = true,
+};
+
+static const struct tegra_vde_soc tegra30_vde_soc = {
+	.supports_ref_pic_marking = false,
+};
+
+static const struct tegra_vde_soc tegra20_vde_soc = {
+	.supports_ref_pic_marking = false,
+};
+
 static const struct of_device_id tegra_vde_of_match[] = {
-	{ .compatible = "nvidia,tegra20-vde", },
+	{ .compatible = "nvidia,tegra124-vde", .data = &tegra124_vde_soc },
+	{ .compatible = "nvidia,tegra114-vde", .data = &tegra114_vde_soc },
+	{ .compatible = "nvidia,tegra30-vde", .data = &tegra30_vde_soc },
+	{ .compatible = "nvidia,tegra20-vde", .data = &tegra20_vde_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_vde_of_match);
diff --git a/drivers/staging/media/tegra-vde/vde.h b/drivers/staging/media/tegra-vde/vde.h
index 5561291b0c88..bbd42b8d9991 100644
--- a/drivers/staging/media/tegra-vde/vde.h
+++ b/drivers/staging/media/tegra-vde/vde.h
@@ -24,6 +24,22 @@ struct iommu_domain;
 struct reset_control;
 struct dma_buf_attachment;
 
+struct tegra_vde_soc {
+	bool supports_ref_pic_marking;
+};
+
+struct tegra_vde_bo {
+	struct iova *iova;
+	struct sg_table sgt;
+	struct tegra_vde *vde;
+	enum dma_data_direction dma_dir;
+	unsigned long dma_attrs;
+	dma_addr_t dma_handle;
+	dma_addr_t dma_addr;
+	void *dma_cookie;
+	size_t size;
+};
+
 struct tegra_vde {
 	void __iomem *sxe;
 	void __iomem *bsev;
@@ -48,6 +64,8 @@ struct tegra_vde {
 	struct iova_domain iova;
 	struct iova *iova_resv_static_addresses;
 	struct iova *iova_resv_last_page;
+	const struct tegra_vde_soc *soc;
+	struct tegra_vde_bo *secure_bo;
 	dma_addr_t iram_lists_addr;
 	u32 *iram;
 };
-- 
2.33.1

