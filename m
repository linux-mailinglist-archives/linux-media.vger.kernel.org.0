Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A0B24C1A8
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 17:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbgHTPLx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 11:11:53 -0400
Received: from foss.arm.com ([217.140.110.172]:41100 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728722AbgHTPJg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 11:09:36 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A704E1477;
        Thu, 20 Aug 2020 08:09:35 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 226C33F6CF;
        Thu, 20 Aug 2020 08:09:32 -0700 (PDT)
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
Subject: [PATCH 11/18] iommu/omap: Add IOMMU_DOMAIN_DMA support
Date:   Thu, 20 Aug 2020 16:08:30 +0100
Message-Id: <5ac3788f9f61f7698cfa9c5924d62714e230f678.1597931876.git.robin.murphy@arm.com>
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
 drivers/iommu/omap-iommu.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 71f29c0927fc..ea25c2fe0418 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -9,6 +9,7 @@
  *		Paul Mundt and Toshihiro Kobayashi
  */
 
+#include <linux/dma-iommu.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/slab.h>
@@ -1574,13 +1575,19 @@ static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
 {
 	struct omap_iommu_domain *omap_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	omap_domain = kzalloc(sizeof(*omap_domain), GFP_KERNEL);
 	if (!omap_domain)
 		return NULL;
 
+	if (type == IOMMU_DOMAIN_DMA &&
+	    iommu_get_dma_cookie(&omap_domain->domain)) {
+		kfree(omap_domain);
+		return NULL;
+	}
+
 	spin_lock_init(&omap_domain->lock);
 
 	omap_domain->domain.geometry.aperture_start = 0;
@@ -1601,6 +1608,7 @@ static void omap_iommu_domain_free(struct iommu_domain *domain)
 	if (omap_domain->dev)
 		_omap_iommu_detach_dev(omap_domain, omap_domain->dev);
 
+	iommu_put_dma_cookie(&omap_domain->domain);
 	kfree(omap_domain);
 }
 
@@ -1736,6 +1744,17 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 	return group;
 }
 
+static int omap_iommu_of_xlate(struct device *dev,
+			       struct of_phandle_args *args)
+{
+	/*
+	 * Logically, some of the housekeeping from _omap_iommu_add_device()
+	 * should probably move here, but the minimum we *need* is simply to
+	 * cooperate with of_iommu at all to let iommu-dma work.
+	 */
+	return 0;
+}
+
 static const struct iommu_ops omap_iommu_ops = {
 	.domain_alloc	= omap_iommu_domain_alloc,
 	.domain_free	= omap_iommu_domain_free,
@@ -1747,6 +1766,7 @@ static const struct iommu_ops omap_iommu_ops = {
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
+	.of_xlate	= omap_iommu_of_xlate,
 	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
 };
 
-- 
2.28.0.dirty

