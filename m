Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C3A4200F6
	for <lists+linux-media@lfdr.de>; Sun,  3 Oct 2021 11:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhJCJKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Oct 2021 05:10:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:57348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229785AbhJCJKm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 Oct 2021 05:10:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D3F861B3E;
        Sun,  3 Oct 2021 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633252135;
        bh=FTSW12Q325NMQiu1sjkINye8OJms+zGari3Brb9BsTc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RLaLbEWve/Ls8UrrrtefLmjT/2zWgvd/kDMNGNbMqSyFtuoF029G38Qqlp2GJPyUj
         WEwNkZB1ep1lau35Yf2k/yROqekMgQJ66ePq7loBBmJ0NA3q12q8MO6qe4V+9n5sV6
         TLDJaCFfDX6f9y11eh1XotCOtC3zAAIeT0SxrzM9LEJUjcCHbUTb2Qt0koaG+kxVGh
         Cn6Steg7w+SjLkM6dOIdRS/UmqKICUU1xVd3EbBvrGeMdgK1R3LeFq9VC596mLAuTe
         hYpPTIffZSelaNgD8ZyeeCWnHNxtXrdBDvedCBDbbCFYG0TVhi7rpqEHC+Wt2SN2BP
         YzMJ/q9z5GoVw==
From:   Oded Gabbay <ogabbay@kernel.org>
To:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        jgg@ziepe.ca, airlied@gmail.com
Cc:     christian.koenig@amd.com, daniel.vetter@ffwll.ch,
        galpress@amazon.com, sleybo@amazon.com,
        dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, dledford@redhat.com,
        alexander.deucher@amd.com, leonro@nvidia.com, hch@lst.de,
        amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH v7 2/2] habanalabs: add support for dma-buf exporter
Date:   Sun,  3 Oct 2021 12:07:56 +0300
Message-Id: <20211003090756.117809-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211003090756.117809-1-ogabbay@kernel.org>
References: <20211003090756.117809-1-ogabbay@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tomer Tayar <ttayar@habana.ai>

Implement the calls to the dma-buf kernel api to create a dma-buf
object backed by FD.

We block the option to mmap the DMA-BUF object because we don't support
DIRECT_IO and implicit P2P. We only implement support for explicit P2P
through importing the FD of the DMA-BUF.

In the export phase, we provide to the DMA-BUF object an array of pages
that represent the device's memory area. During the map callback,
we convert the array of pages into an SGT. We split/merge the pages
according to the dma max segment size of the importer.

To get the DMA address of the PCI bar, we use the dma_map_resources()
kernel API, because our device memory is not backed by page struct
and this API doesn't need page struct to map the physical address to
a DMA address.

We set the orig_nents member of the SGT to be 0, to indicate to other
drivers that we don't support CPU mappings.

Note that in Habanalabs's ASICs, the device memory is pinned and
immutable. Therefore, there is no need for dynamic mappings and pinning
callbacks.

Also note that in GAUDI we don't have an MMU towards the device memory
and the user works on physical addresses. Therefore, the user doesn't
pass through the kernel driver to allocate memory there. As a result,
only for GAUDI we receive from the user a device memory physical address
(instead of a handle) and a size.

We check the p2p distance using pci_p2pdma_distance_many() and refusing
to map dmabuf in case the distance doesn't allow p2p.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Gal Pressman <galpress@amazon.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
Changes in v7:
 - rename structure hl_dmabuf_wrapper to hl_dmabuf_priv
 - remove change that wasn't relevant to this patch
 - set orig_nents to 0 at end of alloc_sgt_from_device_pages()
   to avoid undoing that set in case of error
 - remove silent ignore of upper 32 bits of handle received
   from user in export_dmabuf_from_handle
 - replace all dev_err that triggered by user actions to dev_dbg
 - change alloc_sgt_from_device_pages() to return pointer to
   struct sg_table or ERR_PTR
 - add comment why we use DMA_ATTR_SKIP_CPU_SYNC in dmabuf unmap

 drivers/misc/habanalabs/Kconfig             |   1 +
 drivers/misc/habanalabs/common/habanalabs.h |  22 +
 drivers/misc/habanalabs/common/memory.c     | 514 +++++++++++++++++++-
 drivers/misc/habanalabs/gaudi/gaudi.c       |   1 +
 drivers/misc/habanalabs/goya/goya.c         |   1 +
 5 files changed, 536 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/habanalabs/Kconfig b/drivers/misc/habanalabs/Kconfig
index 293d79811372..c82d2e7b2035 100644
--- a/drivers/misc/habanalabs/Kconfig
+++ b/drivers/misc/habanalabs/Kconfig
@@ -8,6 +8,7 @@ config HABANA_AI
 	depends on PCI && HAS_IOMEM
 	select GENERIC_ALLOCATOR
 	select HWMON
+	select DMA_SHARED_BUFFER
 	help
 	  Enables PCIe card driver for Habana's AI Processors (AIP) that are
 	  designed to accelerate Deep Learning inference and training workloads.
diff --git a/drivers/misc/habanalabs/common/habanalabs.h b/drivers/misc/habanalabs/common/habanalabs.h
index f8e23ca18a57..ba5a424a4f3e 100644
--- a/drivers/misc/habanalabs/common/habanalabs.h
+++ b/drivers/misc/habanalabs/common/habanalabs.h
@@ -26,6 +26,7 @@
 #include <linux/sched/signal.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/coresight.h>
+#include <linux/dma-buf.h>
 
 #define HL_NAME				"habanalabs"
 
@@ -1352,6 +1353,23 @@ struct hl_cs_counters_atomic {
 	atomic64_t validation_drop_cnt;
 };
 
+/**
+ * struct hl_dmabuf_priv - a dma-buf private object.
+ * @dmabuf: pointer to dma-buf object.
+ * @ctx: pointer to the dma-buf owner's context.
+ * @phys_pg_pack: pointer to physical page pack if the dma-buf was exported for
+ *                memory allocation handle.
+ * @device_address: physical address of the device's memory. Relevant only
+ *                  if phys_pg_pack is NULL (dma-buf was exported from address).
+ *                  The total size can be taken from the dmabuf object.
+ */
+struct hl_dmabuf_priv {
+	struct dma_buf			*dmabuf;
+	struct hl_ctx			*ctx;
+	struct hl_vm_phys_pg_pack	*phys_pg_pack;
+	uint64_t			device_address;
+};
+
 /**
  * struct hl_ctx - user/kernel context.
  * @mem_hash: holds mapping from virtual address to virtual memory area
@@ -1662,6 +1680,7 @@ struct hl_vm_hw_block_list_node {
  * @npages: num physical pages in the pack.
  * @total_size: total size of all the pages in this list.
  * @mapping_cnt: number of shared mappings.
+ * @exporting_cnt: number of dma-buf exporting.
  * @asid: the context related to this list.
  * @page_size: size of each page in the pack.
  * @flags: HL_MEM_* flags related to this list.
@@ -1676,6 +1695,7 @@ struct hl_vm_phys_pg_pack {
 	u64			npages;
 	u64			total_size;
 	atomic_t		mapping_cnt;
+	u32			exporting_cnt;
 	u32			asid;
 	u32			page_size;
 	u32			flags;
@@ -2396,6 +2416,7 @@ struct multi_cs_data {
  *                          the error will be ignored by the driver during
  *                          device initialization. Mainly used to debug and
  *                          workaround firmware bugs
+ * @dram_pci_bar_start: start bus address of PCIe bar towards DRAM.
  * @last_successful_open_jif: timestamp (jiffies) of the last successful
  *                            device open.
  * @last_open_session_duration_jif: duration (jiffies) of the last device open
@@ -2537,6 +2558,7 @@ struct hl_device {
 	u64				max_power;
 	u64				clock_gating_mask;
 	u64				boot_error_status_mask;
+	u64				dram_pci_bar_start;
 	u64				last_successful_open_jif;
 	u64				last_open_session_duration_jif;
 	u64				open_counter;
diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index 33986933aa9e..c026e005403d 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 /*
- * Copyright 2016-2019 HabanaLabs, Ltd.
+ * Copyright 2016-2021 HabanaLabs, Ltd.
  * All Rights Reserved.
  */
 
@@ -11,12 +11,14 @@
 
 #include <linux/uaccess.h>
 #include <linux/slab.h>
+#include <linux/pci-p2pdma.h>
 
 #define HL_MMU_DEBUG	0
 
 /* use small pages for supporting non-pow2 (32M/40M/48M) DRAM phys page sizes */
 #define DRAM_POOL_PAGE_SIZE SZ_8M
 
+
 /*
  * The va ranges in context object contain a list with the available chunks of
  * device virtual memory.
@@ -347,6 +349,12 @@ static int free_device_memory(struct hl_ctx *ctx, struct hl_mem_in *args)
 			return -EINVAL;
 		}
 
+		if (phys_pg_pack->exporting_cnt) {
+			dev_dbg(hdev->dev, "handle %u is exported, cannot free\n", handle);
+			spin_unlock(&vm->idr_lock);
+			return -EINVAL;
+		}
+
 		/*
 		 * must remove from idr before the freeing of the physical
 		 * pages as the refcount of the pool is also the trigger of the
@@ -1487,13 +1495,487 @@ int hl_hw_block_mmap(struct hl_fpriv *hpriv, struct vm_area_struct *vma)
 	return 0;
 }
 
+static int set_dma_sg(struct scatterlist *sg, u64 bar_address, u64 chunk_size,
+			struct device *dev, enum dma_data_direction dir)
+{
+	dma_addr_t addr;
+	int rc;
+
+	addr = dma_map_resource(dev, bar_address, chunk_size, dir,
+				DMA_ATTR_SKIP_CPU_SYNC);
+	rc = dma_mapping_error(dev, addr);
+	if (rc)
+		return rc;
+
+	sg_set_page(sg, NULL, chunk_size, 0);
+	sg_dma_address(sg) = addr;
+	sg_dma_len(sg) = chunk_size;
+
+	return 0;
+}
+
+static struct sg_table *alloc_sgt_from_device_pages(struct hl_device *hdev, u64 *pages, u64 npages,
+						u64 page_size, struct device *dev,
+						enum dma_data_direction dir)
+{
+	u64 chunk_size, bar_address, dma_max_seg_size;
+	struct asic_fixed_properties *prop;
+	int rc, i, j, nents, cur_page;
+	struct scatterlist *sg;
+	struct sg_table *sgt;
+
+	prop = &hdev->asic_prop;
+
+	dma_max_seg_size = dma_get_max_seg_size(dev);
+
+	/* We would like to align the max segment size to PAGE_SIZE, so the
+	 * SGL will contain aligned addresses that can be easily mapped to
+	 * an MMU
+	 */
+	dma_max_seg_size = ALIGN_DOWN(dma_max_seg_size, PAGE_SIZE);
+	if (dma_max_seg_size < PAGE_SIZE) {
+		dev_err_ratelimited(hdev->dev,
+				"dma_max_seg_size %llu can't be smaller than PAGE_SIZE\n",
+				dma_max_seg_size);
+		return ERR_PTR(-EINVAL);
+	}
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	/* If the size of each page is larger than the dma max segment size,
+	 * then we can't combine pages and the number of entries in the SGL
+	 * will just be the
+	 * <number of pages> * <chunks of max segment size in each page>
+	 */
+	if (page_size > dma_max_seg_size)
+		nents = npages * DIV_ROUND_UP_ULL(page_size, dma_max_seg_size);
+	else
+		/* Get number of non-contiguous chunks */
+		for (i = 1, nents = 1, chunk_size = page_size ; i < npages ; i++) {
+			if (pages[i - 1] + page_size != pages[i] ||
+					chunk_size + page_size > dma_max_seg_size) {
+				nents++;
+				chunk_size = page_size;
+				continue;
+			}
+
+			chunk_size += page_size;
+		}
+
+	rc = sg_alloc_table(sgt, nents, GFP_KERNEL | __GFP_ZERO);
+	if (rc)
+		goto error_free;
+
+	cur_page = 0;
+
+	if (page_size > dma_max_seg_size) {
+		u64 size_left, cur_device_address = 0;
+
+		size_left = page_size;
+
+		/* Need to split each page into the number of chunks of
+		 * dma_max_seg_size
+		 */
+		for_each_sgtable_dma_sg(sgt, sg, i) {
+			if (size_left == page_size)
+				cur_device_address =
+					pages[cur_page] - prop->dram_base_address;
+			else
+				cur_device_address += dma_max_seg_size;
+
+			chunk_size = min(size_left, dma_max_seg_size);
+
+			bar_address = hdev->dram_pci_bar_start + cur_device_address;
+
+			rc = set_dma_sg(sg, bar_address, chunk_size, dev, dir);
+			if (rc)
+				goto error_unmap;
+
+			if (size_left > dma_max_seg_size) {
+				size_left -= dma_max_seg_size;
+			} else {
+				cur_page++;
+				size_left = page_size;
+			}
+		}
+	} else {
+		/* Merge pages and put them into the scatterlist */
+		for_each_sgtable_dma_sg(sgt, sg, i) {
+			chunk_size = page_size;
+			for (j = cur_page + 1 ; j < npages ; j++) {
+				if (pages[j - 1] + page_size != pages[j] ||
+						chunk_size + page_size > dma_max_seg_size)
+					break;
+
+				chunk_size += page_size;
+			}
+
+			bar_address = hdev->dram_pci_bar_start +
+					(pages[cur_page] - prop->dram_base_address);
+
+			rc = set_dma_sg(sg, bar_address, chunk_size, dev, dir);
+			if (rc)
+				goto error_unmap;
+
+			cur_page = j;
+		}
+	}
+
+	/* Because we are not going to include a CPU list we want to have some
+	 * chance that other users will detect this by setting the orig_nents
+	 * to 0 and using only nents (length of DMA list) when going over the
+	 * sgl
+	 */
+	sgt->orig_nents = 0;
+
+	return sgt;
+
+error_unmap:
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		if (!sg_dma_len(sg))
+			continue;
+
+		dma_unmap_resource(dev, sg_dma_address(sg),
+					sg_dma_len(sg), dir,
+					DMA_ATTR_SKIP_CPU_SYNC);
+	}
+
+	sg_free_table(sgt);
+
+error_free:
+	kfree(sgt);
+	return ERR_PTR(rc);
+}
+
+static int hl_dmabuf_attach(struct dma_buf *dmabuf,
+				struct dma_buf_attachment *attachment)
+{
+	struct hl_dmabuf_priv *hl_dmabuf;
+	struct hl_device *hdev;
+	int rc;
+
+	hl_dmabuf = dmabuf->priv;
+	hdev = hl_dmabuf->ctx->hdev;
+
+	rc = pci_p2pdma_distance_many(hdev->pdev, &attachment->dev, 1, true);
+
+	if (rc < 0)
+		attachment->peer2peer = false;
+	return 0;
+}
+
+static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
+					enum dma_data_direction dir)
+{
+	struct dma_buf *dma_buf = attachment->dmabuf;
+	struct hl_vm_phys_pg_pack *phys_pg_pack;
+	struct hl_dmabuf_priv *hl_dmabuf;
+	struct hl_device *hdev;
+	struct sg_table *sgt;
+
+	hl_dmabuf = dma_buf->priv;
+	hdev = hl_dmabuf->ctx->hdev;
+	phys_pg_pack = hl_dmabuf->phys_pg_pack;
+
+	if (!attachment->peer2peer) {
+		dev_dbg(hdev->dev, "Failed to map dmabuf because p2p is disabled\n");
+		return ERR_PTR(-EPERM);
+	}
+
+	if (phys_pg_pack)
+		sgt = alloc_sgt_from_device_pages(hdev,
+						phys_pg_pack->pages,
+						phys_pg_pack->npages,
+						phys_pg_pack->page_size,
+						attachment->dev,
+						dir);
+	else
+		sgt = alloc_sgt_from_device_pages(hdev,
+						&hl_dmabuf->device_address,
+						1,
+						hl_dmabuf->dmabuf->size,
+						attachment->dev,
+						dir);
+
+	if (IS_ERR(sgt))
+		dev_err(hdev->dev, "failed (%ld) to initialize sgt for dmabuf\n", PTR_ERR(sgt));
+
+	return sgt;
+}
+
+static void hl_unmap_dmabuf(struct dma_buf_attachment *attachment,
+				  struct sg_table *sgt,
+				  enum dma_data_direction dir)
+{
+	struct scatterlist *sg;
+	int i;
+
+	/* The memory behind the dma-buf has *always* resided on the device itself, i.e. it lives
+	 * only in the 'device' domain (after all, it maps a PCI bar address which points to the
+	 * device memory).
+	 *
+	 * Therefore, it was never in the 'CPU' domain and hence, there is no need to perform
+	 * a sync of the memory to the CPU's cache, as it never resided inside that cache.
+	 */
+	for_each_sgtable_dma_sg(sgt, sg, i)
+		dma_unmap_resource(attachment->dev, sg_dma_address(sg),
+					sg_dma_len(sg), dir,
+					DMA_ATTR_SKIP_CPU_SYNC);
+
+	/* Need to restore orig_nents because sg_free_table use that field */
+	sgt->orig_nents = sgt->nents;
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
+static void hl_release_dmabuf(struct dma_buf *dmabuf)
+{
+	struct hl_dmabuf_priv *hl_dmabuf = dmabuf->priv;
+	struct hl_ctx *ctx = hl_dmabuf->ctx;
+	struct hl_device *hdev = ctx->hdev;
+	struct hl_vm *vm = &hdev->vm;
+
+	if (hl_dmabuf->phys_pg_pack) {
+		spin_lock(&vm->idr_lock);
+		hl_dmabuf->phys_pg_pack->exporting_cnt--;
+		spin_unlock(&vm->idr_lock);
+	}
+
+	hl_ctx_put(hl_dmabuf->ctx);
+
+	kfree(hl_dmabuf);
+}
+
+static const struct dma_buf_ops habanalabs_dmabuf_ops = {
+	.attach = hl_dmabuf_attach,
+	.map_dma_buf = hl_map_dmabuf,
+	.unmap_dma_buf = hl_unmap_dmabuf,
+	.release = hl_release_dmabuf,
+};
+
+static int export_dmabuf_common(struct hl_ctx *ctx,
+				struct hl_dmabuf_priv *hl_dmabuf,
+				u64 total_size, int flags, int *dmabuf_fd)
+{
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct hl_device *hdev = ctx->hdev;
+	int rc, fd;
+
+	exp_info.ops = &habanalabs_dmabuf_ops;
+	exp_info.size = total_size;
+	exp_info.flags = flags;
+	exp_info.priv = hl_dmabuf;
+
+	hl_dmabuf->dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(hl_dmabuf->dmabuf)) {
+		dev_err(hdev->dev, "failed to export dma-buf\n");
+		return PTR_ERR(hl_dmabuf->dmabuf);
+	}
+
+	fd = dma_buf_fd(hl_dmabuf->dmabuf, flags);
+	if (fd < 0) {
+		dev_err(hdev->dev, "failed to get a file descriptor for a dma-buf\n");
+		rc = fd;
+		goto err_dma_buf_put;
+	}
+
+	hl_dmabuf->ctx = ctx;
+	hl_ctx_get(hdev, hl_dmabuf->ctx);
+
+	*dmabuf_fd = fd;
+
+	return 0;
+
+err_dma_buf_put:
+	dma_buf_put(hl_dmabuf->dmabuf);
+	return rc;
+}
+
+/**
+ * export_dmabuf_from_addr() - export a dma-buf object for the given memory
+ *                             address and size.
+ * @ctx: pointer to the context structure.
+ * @device_addr:  device memory physical address.
+ * @size: size of device memory.
+ * @flags: DMA-BUF file/FD flags.
+ * @dmabuf_fd: pointer to result FD that represents the dma-buf object.
+ *
+ * Create and export a dma-buf object for an existing memory allocation inside
+ * the device memory, and return a FD which is associated with the dma-buf
+ * object.
+ *
+ * Return: 0 on success, non-zero for failure.
+ */
+static int export_dmabuf_from_addr(struct hl_ctx *ctx, u64 device_addr,
+					u64 size, int flags, int *dmabuf_fd)
+{
+	struct hl_dmabuf_priv *hl_dmabuf;
+	struct hl_device *hdev = ctx->hdev;
+	struct asic_fixed_properties *prop;
+	u64 bar_address;
+	int rc;
+
+	prop = &hdev->asic_prop;
+
+	if (!IS_ALIGNED(device_addr, PAGE_SIZE)) {
+		dev_dbg(hdev->dev,
+			"exported device memory address 0x%llx should be aligned to 0x%lx\n",
+			device_addr, PAGE_SIZE);
+		return -EINVAL;
+	}
+
+	if (size < PAGE_SIZE) {
+		dev_dbg(hdev->dev,
+			"exported device memory size %llu should be equal to or greater than %lu\n",
+			size, PAGE_SIZE);
+		return -EINVAL;
+	}
+
+	if (device_addr < prop->dram_user_base_address ||
+				device_addr + size > prop->dram_end_address ||
+				device_addr + size < device_addr) {
+		dev_dbg(hdev->dev,
+			"DRAM memory range 0x%llx (+0x%llx) is outside of DRAM boundaries\n",
+			device_addr, size);
+		return -EINVAL;
+	}
+
+	bar_address = hdev->dram_pci_bar_start +
+			(device_addr - prop->dram_base_address);
+
+	if (bar_address + size >
+			hdev->dram_pci_bar_start + prop->dram_pci_bar_size ||
+			bar_address + size < bar_address) {
+		dev_dbg(hdev->dev,
+			"DRAM memory range 0x%llx (+0x%llx) is outside of PCI BAR boundaries\n",
+			device_addr, size);
+		return -EINVAL;
+	}
+
+	hl_dmabuf = kzalloc(sizeof(*hl_dmabuf), GFP_KERNEL);
+	if (!hl_dmabuf)
+		return -ENOMEM;
+
+	hl_dmabuf->device_address = device_addr;
+
+	rc = export_dmabuf_common(ctx, hl_dmabuf, size, flags, dmabuf_fd);
+	if (rc)
+		goto err_free_dmabuf_wrapper;
+
+	return 0;
+
+err_free_dmabuf_wrapper:
+	kfree(hl_dmabuf);
+	return rc;
+}
+
+/**
+ * export_dmabuf_from_handle() - export a dma-buf object for the given memory
+ *                               handle.
+ * @ctx: pointer to the context structure.
+ * @handle: device memory allocation handle.
+ * @flags: DMA-BUF file/FD flags.
+ * @dmabuf_fd: pointer to result FD that represents the dma-buf object.
+ *
+ * Create and export a dma-buf object for an existing memory allocation inside
+ * the device memory, and return a FD which is associated with the dma-buf
+ * object.
+ *
+ * Return: 0 on success, non-zero for failure.
+ */
+static int export_dmabuf_from_handle(struct hl_ctx *ctx, u64 handle, int flags,
+					int *dmabuf_fd)
+{
+	struct hl_vm_phys_pg_pack *phys_pg_pack;
+	struct hl_dmabuf_priv *hl_dmabuf;
+	struct hl_device *hdev = ctx->hdev;
+	struct asic_fixed_properties *prop;
+	struct hl_vm *vm = &hdev->vm;
+	u64 bar_address;
+	int rc, i;
+
+	prop = &hdev->asic_prop;
+
+	if (upper_32_bits(handle)) {
+		dev_dbg(hdev->dev, "no match for handle 0x%llx\n", handle);
+		return -EINVAL;
+	}
+
+	spin_lock(&vm->idr_lock);
+
+	phys_pg_pack = idr_find(&vm->phys_pg_pack_handles, (u32) handle);
+	if (!phys_pg_pack) {
+		spin_unlock(&vm->idr_lock);
+		dev_dbg(hdev->dev, "no match for handle 0x%x\n", (u32) handle);
+		return -EINVAL;
+	}
+
+	/* increment now to avoid freeing device memory while exporting */
+	phys_pg_pack->exporting_cnt++;
+
+	spin_unlock(&vm->idr_lock);
+
+	if (phys_pg_pack->vm_type != VM_TYPE_PHYS_PACK) {
+		dev_dbg(hdev->dev, "handle 0x%llx does not represent DRAM memory\n", handle);
+		rc = -EINVAL;
+		goto err_dec_exporting_cnt;
+	}
+
+	for (i = 0 ; i < phys_pg_pack->npages ; i++) {
+
+		bar_address = hdev->dram_pci_bar_start +
+						(phys_pg_pack->pages[i] -
+						prop->dram_base_address);
+
+		if (bar_address + phys_pg_pack->page_size >
+			hdev->dram_pci_bar_start + prop->dram_pci_bar_size ||
+			bar_address + phys_pg_pack->page_size < bar_address) {
+
+			dev_dbg(hdev->dev,
+				"DRAM memory range 0x%llx (+0x%x) is outside of PCI BAR boundaries\n",
+				phys_pg_pack->pages[i],
+				phys_pg_pack->page_size);
+
+			rc = -EINVAL;
+			goto err_dec_exporting_cnt;
+		}
+	}
+
+	hl_dmabuf = kzalloc(sizeof(*hl_dmabuf), GFP_KERNEL);
+	if (!hl_dmabuf) {
+		rc = -ENOMEM;
+		goto err_dec_exporting_cnt;
+	}
+
+	hl_dmabuf->phys_pg_pack = phys_pg_pack;
+
+	rc = export_dmabuf_common(ctx, hl_dmabuf, phys_pg_pack->total_size,
+				flags, dmabuf_fd);
+	if (rc)
+		goto err_free_dmabuf_wrapper;
+
+	return 0;
+
+err_free_dmabuf_wrapper:
+	kfree(hl_dmabuf);
+
+err_dec_exporting_cnt:
+	spin_lock(&vm->idr_lock);
+	phys_pg_pack->exporting_cnt--;
+	spin_unlock(&vm->idr_lock);
+
+	return rc;
+}
+
 static int mem_ioctl_no_mmu(struct hl_fpriv *hpriv, union hl_mem_args *args)
 {
 	struct hl_device *hdev = hpriv->hdev;
 	struct hl_ctx *ctx = hpriv->ctx;
 	u64 block_handle, device_addr = 0;
 	u32 handle = 0, block_size;
-	int rc;
+	int rc, dmabuf_fd = -EBADF;
 
 	switch (args->in.op) {
 	case HL_MEM_OP_ALLOC:
@@ -1542,6 +2024,16 @@ static int mem_ioctl_no_mmu(struct hl_fpriv *hpriv, union hl_mem_args *args)
 		args->out.block_size = block_size;
 		break;
 
+	case HL_MEM_OP_EXPORT_DMABUF_FD:
+		rc = export_dmabuf_from_addr(ctx,
+				args->in.export_dmabuf_fd.handle,
+				args->in.export_dmabuf_fd.mem_size,
+				args->in.flags,
+				&dmabuf_fd);
+		memset(args, 0, sizeof(*args));
+		args->out.fd = dmabuf_fd;
+		break;
+
 	default:
 		dev_err(hdev->dev, "Unknown opcode for memory IOCTL\n");
 		rc = -ENOTTY;
@@ -1560,7 +2052,7 @@ int hl_mem_ioctl(struct hl_fpriv *hpriv, void *data)
 	struct hl_ctx *ctx = hpriv->ctx;
 	u64 block_handle, device_addr = 0;
 	u32 handle = 0, block_size;
-	int rc;
+	int rc, dmabuf_fd = -EBADF;
 
 	if (!hl_device_operational(hdev, &status)) {
 		dev_warn_ratelimited(hdev->dev,
@@ -1651,6 +2143,22 @@ int hl_mem_ioctl(struct hl_fpriv *hpriv, void *data)
 		args->out.block_size = block_size;
 		break;
 
+	case HL_MEM_OP_EXPORT_DMABUF_FD:
+		if (hdev->asic_prop.dram_supports_virtual_memory)
+			rc = export_dmabuf_from_handle(ctx,
+					args->in.export_dmabuf_fd.handle,
+					args->in.flags,
+					&dmabuf_fd);
+		else
+			rc = export_dmabuf_from_addr(ctx,
+					args->in.export_dmabuf_fd.handle,
+					args->in.export_dmabuf_fd.mem_size,
+					args->in.flags,
+					&dmabuf_fd);
+		memset(args, 0, sizeof(*args));
+		args->out.fd = dmabuf_fd;
+		break;
+
 	default:
 		dev_err(hdev->dev, "Unknown opcode for memory IOCTL\n");
 		rc = -ENOTTY;
diff --git a/drivers/misc/habanalabs/gaudi/gaudi.c b/drivers/misc/habanalabs/gaudi/gaudi.c
index 14da87b38e83..8c34898e13d1 100644
--- a/drivers/misc/habanalabs/gaudi/gaudi.c
+++ b/drivers/misc/habanalabs/gaudi/gaudi.c
@@ -795,6 +795,7 @@ static int gaudi_early_init(struct hl_device *hdev)
 	}
 
 	prop->dram_pci_bar_size = pci_resource_len(pdev, HBM_BAR_ID);
+	hdev->dram_pci_bar_start = pci_resource_start(pdev, HBM_BAR_ID);
 
 	/* If FW security is enabled at this point it means no access to ELBI */
 	if (hdev->asic_prop.fw_security_enabled) {
diff --git a/drivers/misc/habanalabs/goya/goya.c b/drivers/misc/habanalabs/goya/goya.c
index 031c1849da14..65e4a4bb9323 100644
--- a/drivers/misc/habanalabs/goya/goya.c
+++ b/drivers/misc/habanalabs/goya/goya.c
@@ -622,6 +622,7 @@ static int goya_early_init(struct hl_device *hdev)
 	}
 
 	prop->dram_pci_bar_size = pci_resource_len(pdev, DDR_BAR_ID);
+	hdev->dram_pci_bar_start = pci_resource_start(pdev, DDR_BAR_ID);
 
 	/* If FW security is enabled at this point it means no access to ELBI */
 	if (hdev->asic_prop.fw_security_enabled) {
-- 
2.17.1

