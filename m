Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6785B5B2
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 09:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfGAHZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 03:25:39 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34462 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbfGAHZj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 03:25:39 -0400
Received: by mail-pf1-f196.google.com with SMTP id c85so6120320pfc.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 00:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=31YZpUwGpcIWxXfunTU3YnlxSzOHcHbdXILjgQQWIsY=;
        b=Rk0sgGyrNiH2QhmgC33ugsXSCUWxLRG8ileCEjyYl9eT3xp6n8dv2Uo6b3XXF5R64m
         F29sjl9RkAdfDtZNKqCOj/rdTbAdcGub+uBvyyDzWkGDBvd0NHXCkev/POfZgzUSqFXs
         7LgTO5o5mx5dmRoPFgfvlvd2ko8PD3+vKT+S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=31YZpUwGpcIWxXfunTU3YnlxSzOHcHbdXILjgQQWIsY=;
        b=QHvEWT6Y8+84VZWhee5PL0rW8bSLd8nG58F/J+dTRz37yQlVYemCNB3qA4eWWX0UMu
         qk1mS4QwN22hNzizbr+c75rRmlmaasqYb+KwbpdWarBh7Q3xgdelYwDbn6ZKuz7udmsQ
         AtdPaoj7qmqIQEd83TKQm5pEzcObYXFuPzZF3xfH4ThdGM2WhUDu1rTBG3v7Xz+RG7lL
         h9/5iHXuAkTDBV6kw372Jc10oFCCwy6Qhdpl4qo6y97arXYqcbaRZjlWSvWHG9ARD/Ga
         90RrHsJVD9jEZhhEQtbmWIpLMyakd6Dm0pmSW+Qe301x1R2JwkMipJfClOPuzsb7H0LJ
         4QvQ==
X-Gm-Message-State: APjAAAVWj3vSf93xUDsZoSbLs9NX6kN5aRT/dJN/AnPiSTL2Je7j2Rf/
        jTIL/fWtTMGJOac0elE1gjCBjQ==
X-Google-Smtp-Source: APXvYqxWZ5ea3dRF89PSbb6SmUlfX9fNTMbMLqcspKfe3YESfKVtEKjWrcgEaL9fOLPpUnoHeFZYTg==
X-Received: by 2002:a63:89c7:: with SMTP id v190mr22486457pgd.299.1561965938371;
        Mon, 01 Jul 2019 00:25:38 -0700 (PDT)
Received: from chromium.org ([2401:fa00:4:4:6d27:f13:a0fa:d4b6])
        by smtp.gmail.com with ESMTPSA id a3sm9112379pff.122.2019.07.01.00.25.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 00:25:37 -0700 (PDT)
Date:   Mon, 1 Jul 2019 16:25:32 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jungo Lin <jungo.lin@mediatek.com>
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        matthias.bgg@gmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        srv_heupstream@mediatek.com, ddavenport@chromium.org,
        robh@kernel.org, sean.cheng@mediatek.com, sj.huang@mediatek.com,
        frederic.chen@mediatek.com, ryan.yu@mediatek.com,
        rynn.wu@mediatek.com, frankie.chiu@mediatek.com
Subject: Re: [RFC,v3 9/9] media: platform: Add Mediatek ISP P1 shared memory
 device
Message-ID: <20190701072532.GB137710@chromium.org>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-10-jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611035344.29814-10-jungo.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jungo,

On Tue, Jun 11, 2019 at 11:53:44AM +0800, Jungo Lin wrote:
> The purpose of this child device is to provide shared
> memory management for exchanging tuning data between co-processor
> and the Pass 1 unit of the camera ISP system, including cache
> buffer handling.
> 

Looks like we haven't really progressed on getting this replaced with
something that doesn't require so much custom code. Let me propose something
better then.

We already have a reserved memory mode in DT. If it has a compatible string
of "shared-dma-pool", it would be registered in the coherent DMA framework
[1]. That would make it available for consumer devices to look-up.

Now if we add a "memory-region" property to the SCP device node and point it
to our reserved memory node, the SCP driver could look it up and hook to the
DMA mapping API using of_reserved_mem_device_init_by_idx[2].

That basically makes any dma_alloc_*(), dma_map_*(), etc. calls on the SCP
struct device use the coherent DMA ops, which operate on the assigned memory
pool. With that, the P1 driver could just directly use those calls to
manage the memory, without any custom code.

There is an example how this setup works in the s5p-mfc driver[3], but it
needs to be noted that it creates child nodes, because it can have more than
1 DMA port, which may need its own memory pool. In our case, we wouldn't
need child nodes and could just use the SCP device directly.

[1] https://elixir.bootlin.com/linux/v5.2-rc7/source/kernel/dma/coherent.c#L345
[2] https://elixir.bootlin.com/linux/v5.2-rc7/source/drivers/of/of_reserved_mem.c#L312
[3] https://elixir.bootlin.com/linux/v5.2-rc7/source/drivers/media/platform/s5p-mfc/s5p_mfc.c#L1075

Let me also post some specific comments below, in case we end up still
needing any of the code.

> Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
> ---
> This patch depends on "Add support for mt8183 SCP"[1].
> 
> [1] https://patchwork.kernel.org/cover/10972143/
> ---
>  .../platform/mtk-isp/isp_50/cam/Makefile      |   1 +
>  .../mtk-isp/isp_50/cam/mtk_cam-smem.c         | 304 ++++++++++++++++++
>  .../mtk-isp/isp_50/cam/mtk_cam-smem.h         |  18 ++
>  3 files changed, 323 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.h
> 
> diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
> index 95f0b1c8fa1c..d545ca6f09c5 100644
> --- a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
> +++ b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
> @@ -4,5 +4,6 @@ mtk-cam-isp-objs += mtk_cam-ctrl.o
>  mtk-cam-isp-objs += mtk_cam-v4l2-util.o
>  mtk-cam-isp-objs += mtk_cam.o
>  mtk-cam-isp-objs += mtk_cam-scp.o
> +mtk-cam-isp-objs += mtk_cam-smem.o
>  
>  obj-$(CONFIG_VIDEO_MEDIATEK_ISP_PASS1) += mtk-cam-isp.o
> \ No newline at end of file
> diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.c
> new file mode 100644
> index 000000000000..a9845668ce10
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-smem.c
> @@ -0,0 +1,304 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2018 MediaTek Inc.
> +
> +#include <asm/cacheflush.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/iommu.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/platform_data/mtk_scp.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "mtk_cam-smem.h"
> +
> +static struct dma_map_ops smem_dma_ops;
> +
> +struct mtk_cam_smem_dev {
> +	struct device *dev;
> +	struct sg_table sgt;
> +	struct page **smem_pages;
> +	dma_addr_t smem_base;
> +	dma_addr_t smem_dma_base;
> +	int smem_size;
> +};
> +
> +struct dma_coherent_mem {
> +	void		*virt_base;
> +	dma_addr_t	device_base;
> +	unsigned long	pfn_base;
> +	int		size;
> +	int		flags;
> +	unsigned long	*bitmap;
> +	spinlock_t	spinlock; /* dma_coherent_mem attributes protection */
> +	bool		use_dev_dma_pfn_offset;
> +};
> +
> +dma_addr_t mtk_cam_smem_iova_to_scp_addr(struct device *dev,
> +					 dma_addr_t iova)
> +{
> +	struct iommu_domain *domain;
> +	dma_addr_t addr, limit;
> +	struct mtk_cam_smem_dev *smem_dev = dev_get_drvdata(dev);
> +
> +	domain = iommu_get_domain_for_dev(dev);
> +	if (!domain) {
> +		dev_warn(dev, "No iommu group domain\n");
> +		return 0;
> +	}
> +
> +	addr = iommu_iova_to_phys(domain, iova);
> +	limit = smem_dev->smem_base + smem_dev->smem_size;
> +	if (addr < smem_dev->smem_base || addr >= limit) {
> +		dev_err(dev,
> +			"Unexpected scp_addr:%pad must >= %pad and < %pad)\n",
> +			&addr, &smem_dev->smem_base, &limit);
> +		return 0;
> +	}
> +	return addr;
> +}

This isn't correct. One could pass an IOVA that wasn't allocated for the SCP
and then the address wouldn't be valid, because it would point outside of
the address range allowed for SCP to access and also it would only point to
the first page backing the IOVA.

The correct approach would be to always carry SCP DMA address and IOVA
together in some kind of struct describing such buffers.

> +
> +static int mtk_cam_smem_get_sgtable(struct device *dev,
> +				    struct sg_table *sgt,
> +				    void *cpu_addr, dma_addr_t dma_addr,
> +				    size_t size, unsigned long attrs)
> +{
> +	struct mtk_cam_smem_dev *smem_dev = dev_get_drvdata(dev);
> +	size_t pages_count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> +	dma_addr_t scp_addr = mtk_cam_smem_iova_to_scp_addr(dev, dma_addr);
> +	u32 pages_start = (scp_addr - smem_dev->smem_base) >> PAGE_SHIFT;
> +
> +	dev_dbg(dev,
> +		"%s:page:%u va:%pK scp addr:%pad, aligned size:%zu pages:%zu\n",
> +		__func__, pages_start, cpu_addr, &scp_addr, size, pages_count);
> +
> +	return sg_alloc_table_from_pages(sgt,
> +		smem_dev->smem_pages + pages_start,
> +		pages_count, 0, size, GFP_KERNEL);
> +}

This should be just dma_get_sgtable_attrs(), in the approach I suggested at
the top.

> +
> +static void *mtk_cam_smem_get_cpu_addr(struct mtk_cam_smem_dev *smem_dev,
> +				       dma_addr_t addr)
> +{
> +	struct device *dev = smem_dev->dev;
> +	struct dma_coherent_mem *dma_mem = dev->dma_mem;
> +
> +	if (addr < smem_dev->smem_base ||
> +	    addr > smem_dev->smem_base + smem_dev->smem_size) {

This is off by one, should be >=.

Also, this wouldn't really guarantee the CPU access the caller is going to
do is valid, because it doesn't consider the access operation size.

Generally I'd suggest designing the code so that it doesn't have to convert
offset addresses between different address spaces.

> +		dev_err(dev, "Invalid scp_addr %pad from sg\n", &addr);
> +		return NULL;
> +	}
> +	return dma_mem->virt_base + (addr - smem_dev->smem_base);
> +}
> +
> +static void mtk_cam_smem_sync_sg_for_cpu(struct device *dev,
> +					 struct scatterlist *sgl, int nelems,
> +					 enum dma_data_direction dir)
> +{
> +	struct mtk_cam_smem_dev *smem_dev = dev_get_drvdata(dev);
> +	dma_addr_t scp_addr = sg_phys(sgl);
> +	void *cpu_addr = mtk_cam_smem_get_cpu_addr(smem_dev, scp_addr);
> +
> +	dev_dbg(dev,
> +		"__dma_unmap_area:scp_addr:%pad,vaddr:%pK,size:%d,dir:%d\n",
> +		&scp_addr, cpu_addr, sgl->length, dir);
> +	__dma_unmap_area(cpu_addr, sgl->length, dir);

It's not allowed to use this function anywhere outside of the DMA API
internals. See the comment [4].

[4] https://elixir.bootlin.com/linux/v5.2-rc7/source/arch/arm64/include/asm/cacheflush.h#L112

> +}
> +
> +static void mtk_cam_smem_sync_sg_for_device(struct device *dev,
> +					    struct scatterlist *sgl,
> +					    int nelems,
> +					    enum dma_data_direction dir)
> +{
> +	struct mtk_cam_smem_dev *smem_dev = dev_get_drvdata(dev);
> +	dma_addr_t scp_addr = sg_phys(sgl);
> +	void *cpu_addr = mtk_cam_smem_get_cpu_addr(smem_dev, scp_addr);
> +
> +	dev_dbg(dev,
> +		"__dma_map_area:scp_addr:%pad,vaddr:%pK,size:%d,dir:%d\n",
> +		&scp_addr, cpu_addr, sgl->length, dir);
> +	__dma_map_area(cpu_addr, sgl->length, dir);

Ditto.

> +}
> +
> +static void mtk_cam_smem_setup_dma_ops(struct device *dev,
> +				       struct dma_map_ops *smem_ops)
> +{
> +	memcpy((void *)smem_ops, dev->dma_ops, sizeof(*smem_ops));
> +	smem_ops->get_sgtable = mtk_cam_smem_get_sgtable;
> +	smem_ops->sync_sg_for_device = mtk_cam_smem_sync_sg_for_device;
> +	smem_ops->sync_sg_for_cpu = mtk_cam_smem_sync_sg_for_cpu;
> +	set_dma_ops(dev, smem_ops);
> +}
> +
> +static int mtk_cam_reserved_drm_sg_init(struct mtk_cam_smem_dev *smem_dev)
> +{
> +	u32 size_align, n_pages;
> +	struct device *dev = smem_dev->dev;
> +	struct sg_table *sgt = &smem_dev->sgt;
> +	struct page **pages;
> +	dma_addr_t dma_addr;
> +	unsigned int i;
> +	int ret;
> +
> +	smem_dev->smem_base = scp_get_reserve_mem_phys(SCP_ISP_MEM2_ID);
> +	smem_dev->smem_size = scp_get_reserve_mem_size(SCP_ISP_MEM2_ID);
> +	if (!smem_dev->smem_base || !smem_dev->smem_size)
> +		return -EPROBE_DEFER;
> +
> +	dev_info(dev, "%s dev:0x%pK base:%pad size:%u MiB\n",
> +		 __func__,
> +		 smem_dev->dev,
> +		 &smem_dev->smem_base,
> +		 (smem_dev->smem_size / SZ_1M));
> +
> +	size_align = PAGE_ALIGN(smem_dev->smem_size);
> +	n_pages = size_align >> PAGE_SHIFT;
> +
> +	pages = kmalloc_array(n_pages, sizeof(struct page *), GFP_KERNEL);
> +	if (!pages)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < n_pages; i++)
> +		pages[i] = phys_to_page(smem_dev->smem_base + i * PAGE_SIZE);
> +
> +	ret = sg_alloc_table_from_pages(sgt, pages, n_pages, 0,
> +					size_align, GFP_KERNEL);
> +	if (ret) {
> +		dev_err(dev, "failed to alloca sg table:%d\n", ret);
> +		goto fail_table_alloc;
> +	}
> +	sgt->nents = dma_map_sg_attrs(dev, sgt->sgl, sgt->orig_nents,
> +				      DMA_BIDIRECTIONAL,
> +				      DMA_ATTR_SKIP_CPU_SYNC);
> +	if (!sgt->nents) {
> +		dev_err(dev, "failed to dma sg map\n");
> +		goto fail_map;
> +	}
> +
> +	dma_addr = sg_dma_address(sgt->sgl);
> +	ret = dma_declare_coherent_memory(dev, smem_dev->smem_base,
> +					  dma_addr, size_align,
> +					  DMA_MEMORY_EXCLUSIVE);
> +	if (ret) {
> +		dev_err(dev, "Unable to declare smem  memory:%d\n", ret);
> +		goto fail_map;
> +	}
> +
> +	dev_info(dev, "Coherent mem pa:%pad/%pad, size:%d\n",
> +		 &smem_dev->smem_base, &dma_addr, size_align);
> +
> +	smem_dev->smem_size = size_align;
> +	smem_dev->smem_pages = pages;
> +	smem_dev->smem_dma_base = dma_addr;
> +
> +	return 0;
> +
> +fail_map:
> +	sg_free_table(sgt);
> +fail_table_alloc:
> +	while (n_pages--)
> +		__free_page(pages[n_pages]);
> +	kfree(pages);
> +
> +	return -ENOMEM;
> +}
> +
> +/* DMA memory related helper functions */
> +static void mtk_cam_memdev_release(struct device *dev)
> +{
> +	vb2_dma_contig_clear_max_seg_size(dev);
> +}
> +
> +static struct device *mtk_cam_alloc_smem_dev(struct device *dev,
> +					     const char *name)
> +{
> +	struct device *child;
> +	int ret;
> +
> +	child = devm_kzalloc(dev, sizeof(*child), GFP_KERNEL);
> +	if (!child)
> +		return NULL;
> +
> +	child->parent = dev;
> +	child->iommu_group = dev->iommu_group;

This isn't something that can be set explicitly. It's an internal field of
the IOMMU subsystem.

> +	child->release = mtk_cam_memdev_release;
> +	dev_set_name(child, name);
> +	set_dma_ops(child, get_dma_ops(dev));
> +	child->dma_mask = dev->dma_mask;
> +	ret = dma_set_coherent_mask(child, DMA_BIT_MASK(32));
> +	if (ret)
> +		return NULL;
> +
> +	vb2_dma_contig_set_max_seg_size(child, DMA_BIT_MASK(32));
> +
> +	if (device_register(child)) {
> +		device_del(child);
> +		return NULL;
> +	}
> +
> +	return child;
> +}

We shouldn't need child devices, just one SCP device, as I mentioned above.

> +
> +static int mtk_cam_composer_dma_init(struct mtk_isp_p1_ctx *isp_ctx)
> +{
> +	struct isp_p1_device *p1_dev = p1_ctx_to_dev(isp_ctx);
> +	struct device *dev = &p1_dev->pdev->dev;
> +	u32 size;
> +	dma_addr_t addr;
> +
> +	isp_ctx->scp_mem_pa = scp_get_reserve_mem_phys(SCP_ISP_MEM_ID);
> +	size = PAGE_ALIGN(scp_get_reserve_mem_size(SCP_ISP_MEM_ID));
> +	if (!isp_ctx->scp_mem_pa || !size)
> +		return -EPROBE_DEFER;
> +
> +	dev_info(dev, "scp addr:%pad size:0x%x\n", &isp_ctx->scp_mem_pa, size);

This isn't something that deserves the "info" log level. Should be "dbg"
or removed.

Best regards,
Tomasz
