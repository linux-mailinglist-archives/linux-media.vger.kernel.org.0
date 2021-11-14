Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDD444FC53
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 23:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234850AbhKNWvn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Nov 2021 17:51:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbhKNWvX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Nov 2021 17:51:23 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CC8C061766;
        Sun, 14 Nov 2021 14:48:28 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 207so31318060ljf.10;
        Sun, 14 Nov 2021 14:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yHGzOys1VwrqOWwxAdMDnBSuseyJ+I3mvne9462m4Wc=;
        b=kunQ9WI6b4U60DFOUoFQm2z+CNUQPIsJBRzfE+5MBBVv43wFGCe5vzTNvPGMMWAk4S
         KdxujxEhV8fQHEn0ruMUx/IctNiE7DkPmHIB2tEBycJCGXXd88j2gl5XjMGYtEcMRxBV
         oL3PkcmX+GLY3JaebUwaRyDRMxFty6E8QkhyTXVg30r7DViM2DSh+rPwM+2L166gwweX
         4um7k+IIYZGrbrXfa8awb2RwHAu+VPZGRwBPmrd8NKUUceQTDvC/KWGRHuwbGKtH5U+M
         JAhEvp4/fHAV94KEjKxWmbmKdUo0EMnR6gwCI94de0jDfkwwWqszWTlb45oVSA/DPlvR
         ASGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yHGzOys1VwrqOWwxAdMDnBSuseyJ+I3mvne9462m4Wc=;
        b=hQvPz5mVyG+Wrru26heDFiHGhozn00woZfSr43CJdCuOn7KmHuzPCzJ/TEY4e6Km7f
         0TcvQbrHtpEoSv9mrl8ntJ3/tzhZigmVSK8fgia0/Sxm4dg1QxL2wKNO8J4Muqa02niK
         A7H/aq+xRUEWPVsGgRynLij2FkFMVjbYP71yMCygwl0Ex3W6drr0I2QXMOBUNAJH7da0
         0SLOHwwLDQ7Xbl1RBTJYu6dvwbjkjdoolYxr9UJZ29F4Pxt8PGMnEn9pfIjNH4lN2C00
         eyDp4770nkKeY50kklwbLVWxOwZ5Q04y1HkxnR9Zp5mXc+cdQza+fvd6C+p8+Mb0CHAu
         Nn0g==
X-Gm-Message-State: AOAM530WuxAYuj1zbIxib2x7xQlkIXGLPmg9qD+jOqJQ5cyn+auZDE8I
        xqPB0GkIgTMMfDEE+6RSGHU=
X-Google-Smtp-Source: ABdhPJwPrQW6OU37D3o3Ayti5f11fIVA/8tY1OuPhnjTwnQq0M7CxX8/SJpeEJeMLaw/9xNNbTUiyQ==
X-Received: by 2002:a2e:a706:: with SMTP id s6mr34237631lje.370.1636930107272;
        Sun, 14 Nov 2021 14:48:27 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id h1sm1228591lfu.277.2021.11.14.14.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:48:27 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] media: staging: tegra-vde: Support reference picture marking
Date:   Mon, 15 Nov 2021 01:47:30 +0300
Message-Id: <20211114224732.11550-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114224732.11550-1-digetx@gmail.com>
References: <20211114224732.11550-1-digetx@gmail.com>
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
Co-developed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 124 +++++++++++++++++++++++++-
 drivers/staging/media/tegra-vde/vde.h |  18 ++++
 2 files changed, 141 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index 859f60a70904..81f3e9e7e4d6 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -85,6 +85,96 @@ static int tegra_vde_wait_mbe(struct tegra_vde *vde)
 					  (tmp >= 0x10), 1, 100);
 }
 
+static int tegra_vde_alloc_bo(struct tegra_vde *vde,
+			      struct tegra_vde_bo **ret_bo,
+			      enum dma_data_direction dma_dir,
+			      size_t size)
+{
+	struct device *dev = vde->miscdev.parent;
+	struct tegra_vde_bo *bo;
+	int err;
+
+	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
+	if (!bo)
+		return -ENOMEM;
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
+		err = -ENOMEM;
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
+	*ret_bo = bo;
+
+	return 0;
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
+	return err;
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
@@ -425,6 +515,9 @@ static int tegra_vde_setup_hw_context(struct tegra_vde *vde,
 
 	tegra_vde_writel(vde, bitstream_data_addr, vde->sxe, 0x6C);
 
+	if (vde->soc->supports_ref_pic_marking)
+		tegra_vde_writel(vde, vde->secure_bo->dma_addr, vde->sxe, 0x7c);
+
 	value = 0x10000005;
 	value |= ctx->pic_width_in_mbs << 11;
 	value |= ctx->pic_height_in_mbs << 3;
@@ -994,6 +1087,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vde);
 
+	vde->soc = of_device_get_match_data(&pdev->dev);
+
 	vde->sxe = devm_platform_ioremap_resource_byname(pdev, "sxe");
 	if (IS_ERR(vde->sxe))
 		return PTR_ERR(vde->sxe);
@@ -1119,6 +1214,12 @@ static int tegra_vde_probe(struct platform_device *pdev)
 
 	pm_runtime_put(dev);
 
+	err = tegra_vde_alloc_bo(vde, &vde->secure_bo, DMA_FROM_DEVICE, 4096);
+	if (err) {
+		dev_err(dev, "Failed to allocate secure BO: %d\n", err);
+		goto err_pm_runtime;
+	}
+
 	return 0;
 
 err_pm_runtime:
@@ -1142,6 +1243,8 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	tegra_vde_free_bo(vde->secure_bo);
+
 	/*
 	 * As it increments RPM usage_count even on errors, we don't need to
 	 * check the returned code here.
@@ -1214,8 +1317,27 @@ static const struct dev_pm_ops tegra_vde_pm_ops = {
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

