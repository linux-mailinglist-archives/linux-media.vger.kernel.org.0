Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8F843C1AA
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 05:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391042AbfFKDyH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 23:54:07 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:19087 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2391027AbfFKDyG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 23:54:06 -0400
X-UUID: f63289e697fa405c9249647bf3651b50-20190611
X-UUID: f63289e697fa405c9249647bf3651b50-20190611
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 775983049; Tue, 11 Jun 2019 11:54:01 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Jun 2019 11:54:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Jun 2019 11:54:00 +0800
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     <tfiga@chromium.org>, <hverkuil@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <robh@kernel.org>,
        <sean.cheng@mediatek.com>, <sj.huang@mediatek.com>,
        <frederic.chen@mediatek.com>, <ryan.yu@mediatek.com>,
        <rynn.wu@mediatek.com>, <jungo.lin@mediatek.com>,
        <frankie.chiu@mediatek.com>
Subject: [RFC,v3 9/9] media: platform: Add Mediatek ISP P1 shared memory device
Date:   Tue, 11 Jun 2019 11:53:44 +0800
Message-ID: <20190611035344.29814-10-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190611035344.29814-1-jungo.lin@mediatek.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
Reply-To: <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: F12E07B93EAFA609DC7C0D7FC742FE10CD2D4D1AB945F72210C6651DCF160D492000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The purpose of this child device is to provide shared
memory management for exchanging tuning data between co-processor
and the Pass 1 unit of the camera ISP system, including cache
buffer handling.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
This patch depends on "Add support for mt8183 SCP"[1].

[1] https://patchwork.kernel.org/cover/10972143/
---
 .../platform/mtk-isp/isp_50/cam/Makefile      |   1 +
 .../mtk-isp/isp_50/cam/mtk_cam-smem.c         | 304 ++++++++++++++++++
 .../mtk-isp/isp_50/cam/mtk_cam-smem.h         |  18 ++
 3 files changed, 323 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.h

diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
index 95f0b1c8fa1c..d545ca6f09c5 100644
--- a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
@@ -4,5 +4,6 @@ mtk-cam-isp-objs += mtk_cam-ctrl.o
 mtk-cam-isp-objs += mtk_cam-v4l2-util.o
 mtk-cam-isp-objs += mtk_cam.o
 mtk-cam-isp-objs += mtk_cam-scp.o
+mtk-cam-isp-objs += mtk_cam-smem.o
 
 obj-$(CONFIG_VIDEO_MEDIATEK_ISP_PASS1) += mtk-cam-isp.o
\ No newline at end of file
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.c
new file mode 100644
index 000000000000..a9845668ce10
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2018 MediaTek Inc.
+
+#include <asm/cacheflush.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iommu.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/platform_data/mtk_scp.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "mtk_cam-smem.h"
+
+static struct dma_map_ops smem_dma_ops;
+
+struct mtk_cam_smem_dev {
+	struct device *dev;
+	struct sg_table sgt;
+	struct page **smem_pages;
+	dma_addr_t smem_base;
+	dma_addr_t smem_dma_base;
+	int smem_size;
+};
+
+struct dma_coherent_mem {
+	void		*virt_base;
+	dma_addr_t	device_base;
+	unsigned long	pfn_base;
+	int		size;
+	int		flags;
+	unsigned long	*bitmap;
+	spinlock_t	spinlock; /* dma_coherent_mem attributes protection */
+	bool		use_dev_dma_pfn_offset;
+};
+
+dma_addr_t mtk_cam_smem_iova_to_scp_addr(struct device *dev,
+					 dma_addr_t iova)
+{
+	struct iommu_domain *domain;
+	dma_addr_t addr, limit;
+	struct mtk_cam_smem_dev *smem_dev = dev_get_drvdata(dev);
+
+	domain = iommu_get_domain_for_dev(dev);
+	if (!domain) {
+		dev_warn(dev, "No iommu group domain\n");
+		return 0;
+	}
+
+	addr = iommu_iova_to_phys(domain, iova);
+	limit = smem_dev->smem_base + smem_dev->smem_size;
+	if (addr < smem_dev->smem_base || addr >= limit) {
+		dev_err(dev,
+			"Unexpected scp_addr:%pad must >= %pad and < %pad)\n",
+			&addr, &smem_dev->smem_base, &limit);
+		return 0;
+	}
+	return addr;
+}
+
+static int mtk_cam_smem_get_sgtable(struct device *dev,
+				    struct sg_table *sgt,
+				    void *cpu_addr, dma_addr_t dma_addr,
+				    size_t size, unsigned long attrs)
+{
+	struct mtk_cam_smem_dev *smem_dev = dev_get_drvdata(dev);
+	size_t pages_count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	dma_addr_t scp_addr = mtk_cam_smem_iova_to_scp_addr(dev, dma_addr);
+	u32 pages_start = (scp_addr - smem_dev->smem_base) >> PAGE_SHIFT;
+
+	dev_dbg(dev,
+		"%s:page:%u va:%pK scp addr:%pad, aligned size:%zu pages:%zu\n",
+		__func__, pages_start, cpu_addr, &scp_addr, size, pages_count);
+
+	return sg_alloc_table_from_pages(sgt,
+		smem_dev->smem_pages + pages_start,
+		pages_count, 0, size, GFP_KERNEL);
+}
+
+static void *mtk_cam_smem_get_cpu_addr(struct mtk_cam_smem_dev *smem_dev,
+				       dma_addr_t addr)
+{
+	struct device *dev = smem_dev->dev;
+	struct dma_coherent_mem *dma_mem = dev->dma_mem;
+
+	if (addr < smem_dev->smem_base ||
+	    addr > smem_dev->smem_base + smem_dev->smem_size) {
+		dev_err(dev, "Invalid scp_addr %pad from sg\n", &addr);
+		return NULL;
+	}
+	return dma_mem->virt_base + (addr - smem_dev->smem_base);
+}
+
+static void mtk_cam_smem_sync_sg_for_cpu(struct device *dev,
+					 struct scatterlist *sgl, int nelems,
+					 enum dma_data_direction dir)
+{
+	struct mtk_cam_smem_dev *smem_dev = dev_get_drvdata(dev);
+	dma_addr_t scp_addr = sg_phys(sgl);
+	void *cpu_addr = mtk_cam_smem_get_cpu_addr(smem_dev, scp_addr);
+
+	dev_dbg(dev,
+		"__dma_unmap_area:scp_addr:%pad,vaddr:%pK,size:%d,dir:%d\n",
+		&scp_addr, cpu_addr, sgl->length, dir);
+	__dma_unmap_area(cpu_addr, sgl->length, dir);
+}
+
+static void mtk_cam_smem_sync_sg_for_device(struct device *dev,
+					    struct scatterlist *sgl,
+					    int nelems,
+					    enum dma_data_direction dir)
+{
+	struct mtk_cam_smem_dev *smem_dev = dev_get_drvdata(dev);
+	dma_addr_t scp_addr = sg_phys(sgl);
+	void *cpu_addr = mtk_cam_smem_get_cpu_addr(smem_dev, scp_addr);
+
+	dev_dbg(dev,
+		"__dma_map_area:scp_addr:%pad,vaddr:%pK,size:%d,dir:%d\n",
+		&scp_addr, cpu_addr, sgl->length, dir);
+	__dma_map_area(cpu_addr, sgl->length, dir);
+}
+
+static void mtk_cam_smem_setup_dma_ops(struct device *dev,
+				       struct dma_map_ops *smem_ops)
+{
+	memcpy((void *)smem_ops, dev->dma_ops, sizeof(*smem_ops));
+	smem_ops->get_sgtable = mtk_cam_smem_get_sgtable;
+	smem_ops->sync_sg_for_device = mtk_cam_smem_sync_sg_for_device;
+	smem_ops->sync_sg_for_cpu = mtk_cam_smem_sync_sg_for_cpu;
+	set_dma_ops(dev, smem_ops);
+}
+
+static int mtk_cam_reserved_drm_sg_init(struct mtk_cam_smem_dev *smem_dev)
+{
+	u32 size_align, n_pages;
+	struct device *dev = smem_dev->dev;
+	struct sg_table *sgt = &smem_dev->sgt;
+	struct page **pages;
+	dma_addr_t dma_addr;
+	unsigned int i;
+	int ret;
+
+	smem_dev->smem_base = scp_get_reserve_mem_phys(SCP_ISP_MEM2_ID);
+	smem_dev->smem_size = scp_get_reserve_mem_size(SCP_ISP_MEM2_ID);
+	if (!smem_dev->smem_base || !smem_dev->smem_size)
+		return -EPROBE_DEFER;
+
+	dev_info(dev, "%s dev:0x%pK base:%pad size:%u MiB\n",
+		 __func__,
+		 smem_dev->dev,
+		 &smem_dev->smem_base,
+		 (smem_dev->smem_size / SZ_1M));
+
+	size_align = PAGE_ALIGN(smem_dev->smem_size);
+	n_pages = size_align >> PAGE_SHIFT;
+
+	pages = kmalloc_array(n_pages, sizeof(struct page *), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	for (i = 0; i < n_pages; i++)
+		pages[i] = phys_to_page(smem_dev->smem_base + i * PAGE_SIZE);
+
+	ret = sg_alloc_table_from_pages(sgt, pages, n_pages, 0,
+					size_align, GFP_KERNEL);
+	if (ret) {
+		dev_err(dev, "failed to alloca sg table:%d\n", ret);
+		goto fail_table_alloc;
+	}
+	sgt->nents = dma_map_sg_attrs(dev, sgt->sgl, sgt->orig_nents,
+				      DMA_BIDIRECTIONAL,
+				      DMA_ATTR_SKIP_CPU_SYNC);
+	if (!sgt->nents) {
+		dev_err(dev, "failed to dma sg map\n");
+		goto fail_map;
+	}
+
+	dma_addr = sg_dma_address(sgt->sgl);
+	ret = dma_declare_coherent_memory(dev, smem_dev->smem_base,
+					  dma_addr, size_align,
+					  DMA_MEMORY_EXCLUSIVE);
+	if (ret) {
+		dev_err(dev, "Unable to declare smem  memory:%d\n", ret);
+		goto fail_map;
+	}
+
+	dev_info(dev, "Coherent mem pa:%pad/%pad, size:%d\n",
+		 &smem_dev->smem_base, &dma_addr, size_align);
+
+	smem_dev->smem_size = size_align;
+	smem_dev->smem_pages = pages;
+	smem_dev->smem_dma_base = dma_addr;
+
+	return 0;
+
+fail_map:
+	sg_free_table(sgt);
+fail_table_alloc:
+	while (n_pages--)
+		__free_page(pages[n_pages]);
+	kfree(pages);
+
+	return -ENOMEM;
+}
+
+/* DMA memory related helper functions */
+static void mtk_cam_memdev_release(struct device *dev)
+{
+	vb2_dma_contig_clear_max_seg_size(dev);
+}
+
+static struct device *mtk_cam_alloc_smem_dev(struct device *dev,
+					     const char *name)
+{
+	struct device *child;
+	int ret;
+
+	child = devm_kzalloc(dev, sizeof(*child), GFP_KERNEL);
+	if (!child)
+		return NULL;
+
+	child->parent = dev;
+	child->iommu_group = dev->iommu_group;
+	child->release = mtk_cam_memdev_release;
+	dev_set_name(child, name);
+	set_dma_ops(child, get_dma_ops(dev));
+	child->dma_mask = dev->dma_mask;
+	ret = dma_set_coherent_mask(child, DMA_BIT_MASK(32));
+	if (ret)
+		return NULL;
+
+	vb2_dma_contig_set_max_seg_size(child, DMA_BIT_MASK(32));
+
+	if (device_register(child)) {
+		device_del(child);
+		return NULL;
+	}
+
+	return child;
+}
+
+static int mtk_cam_composer_dma_init(struct mtk_isp_p1_ctx *isp_ctx)
+{
+	struct isp_p1_device *p1_dev = p1_ctx_to_dev(isp_ctx);
+	struct device *dev = &p1_dev->pdev->dev;
+	u32 size;
+	dma_addr_t addr;
+
+	isp_ctx->scp_mem_pa = scp_get_reserve_mem_phys(SCP_ISP_MEM_ID);
+	size = PAGE_ALIGN(scp_get_reserve_mem_size(SCP_ISP_MEM_ID));
+	if (!isp_ctx->scp_mem_pa || !size)
+		return -EPROBE_DEFER;
+
+	dev_info(dev, "scp addr:%pad size:0x%x\n", &isp_ctx->scp_mem_pa, size);
+
+	/* get iova address */
+	addr = dma_map_page_attrs(dev, phys_to_page(isp_ctx->scp_mem_pa), 0,
+				  size, DMA_BIDIRECTIONAL,
+				  DMA_ATTR_SKIP_CPU_SYNC);
+	if (dma_mapping_error(dev, addr)) {
+		isp_ctx->scp_mem_pa = 0;
+		dev_err(dev, "Failed to map scp iova\n");
+		return -ENOMEM;
+	}
+
+	isp_ctx->scp_mem_iova = addr;
+
+	return 0;
+}
+
+int mtk_cam_reserved_memory_init(struct isp_p1_device *p1_dev)
+{
+	struct device *dev = &p1_dev->pdev->dev;
+	struct mtk_cam_smem_dev *smem_dev;
+	int ret;
+
+	ret = mtk_cam_composer_dma_init(&p1_dev->isp_ctx);
+	if (ret)
+		return ret;
+
+	/* Allocate context */
+	smem_dev = devm_kzalloc(dev, sizeof(*smem_dev), GFP_KERNEL);
+	if (!smem_dev)
+		return -ENOMEM;
+
+	smem_dev->dev = mtk_cam_alloc_smem_dev(dev, "cam-smem");
+	if (!smem_dev->dev) {
+		dev_err(dev, "failed to alloc smem device\n");
+		return -ENODEV;
+	}
+	dev_set_drvdata(smem_dev->dev, smem_dev);
+	p1_dev->cam_dev.smem_dev = smem_dev->dev;
+
+	ret = mtk_cam_reserved_drm_sg_init(smem_dev);
+	if (ret)
+		return ret;
+
+	mtk_cam_smem_setup_dma_ops(smem_dev->dev, &smem_dma_ops);
+
+	return 0;
+}
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.h
new file mode 100644
index 000000000000..981d47178e99
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_ISP_SMEM_H
+#define __MTK_CAM_ISP_SMEM_H
+
+#include <linux/dma-mapping.h>
+
+#include "mtk_cam.h"
+
+int mtk_cam_reserved_memory_init(struct isp_p1_device *p1_dev);
+dma_addr_t mtk_cam_smem_iova_to_scp_addr(struct device *smem_dev,
+					 dma_addr_t iova);
+
+#endif
+
-- 
2.18.0

