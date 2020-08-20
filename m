Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D077424C1AE
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 17:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbgHTPJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 11:09:36 -0400
Received: from foss.arm.com ([217.140.110.172]:41062 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728698AbgHTPJd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 11:09:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB83F1476;
        Thu, 20 Aug 2020 08:09:31 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 539A53F6CF;
        Thu, 20 Aug 2020 08:09:28 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     hch@lst.de, joro@8bytes.org, linux@armlinux.org.uk
Cc:     will@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, m.szyprowski@samsung.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, vdumpa@nvidia.com,
        digetx@gmail.com, matthias.bgg@gmail.com, yong.wu@mediatek.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, t-kristo@ti.com,
        s-anna@ti.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/18] iommu/msm: Add IOMMU_DOMAIN_DMA support
Date:   Thu, 20 Aug 2020 16:08:29 +0100
Message-Id: <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1597931875.git.robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that arch/arm is wired up for default domains and iommu-dma,
implement the corresponding driver-side support for DMA domains.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/msm_iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 3615cd6241c4..f34efcbb0b2b 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
+#include <linux/dma-iommu.h>
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/io-pgtable.h>
@@ -314,13 +315,16 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
 {
 	struct msm_priv *priv;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		goto fail_nomem;
 
+	if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&priv->domain))
+		goto fail_nomem;
+
 	INIT_LIST_HEAD(&priv->list_attached);
 
 	priv->domain.geometry.aperture_start = 0;
@@ -339,6 +343,7 @@ static void msm_iommu_domain_free(struct iommu_domain *domain)
 	struct msm_priv *priv;
 	unsigned long flags;
 
+	iommu_put_dma_cookie(domain);
 	spin_lock_irqsave(&msm_iommu_lock, flags);
 	priv = to_msm_priv(domain);
 	kfree(priv);
-- 
2.28.0.dirty

