Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3053731D08E
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 19:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhBPS4j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 13:56:39 -0500
Received: from foss.arm.com ([217.140.110.172]:41486 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229937AbhBPS4g (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 13:56:36 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D39621042;
        Tue, 16 Feb 2021 10:55:49 -0800 (PST)
Received: from [10.57.48.219] (unknown [10.57.48.219])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D79A3F73B;
        Tue, 16 Feb 2021 10:55:48 -0800 (PST)
Subject: Re: [PATCH 4/7] dma-mapping: add a dma_alloc_noncontiguous API
To:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20210202095110.1215346-1-hch@lst.de>
 <20210202095110.1215346-5-hch@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <53a6c581-4d9f-c69a-80f5-2e95e810c4d1@arm.com>
Date:   Tue, 16 Feb 2021 18:55:39 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210202095110.1215346-5-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-02-02 09:51, Christoph Hellwig wrote:
> Add a new API that returns a potentiall virtually non-contigous sg_table
> and a DMA address.  This API is only properly implemented for dma-iommu
> and will simply return a contigious chunk as a fallback.
> 
> The intent is that media drivers can use this API if either:
> 
>   - no kernel mapping or only temporary kernel mappings are required.
>     That is as a better replacement for DMA_ATTR_NO_KERNEL_MAPPING
>   - a kernel mapping is required for cached and DMA mapped pages, but
>     the driver also needs the pages to e.g. map them to userspace.
>     In that sense it is a replacement for some aspects of the recently
>     removed and never fully implemented DMA_ATTR_NON_CONSISTENT
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   Documentation/core-api/dma-api.rst |  74 +++++++++++++++++++++
>   include/linux/dma-map-ops.h        |  18 +++++
>   include/linux/dma-mapping.h        |  31 +++++++++
>   kernel/dma/mapping.c               | 103 +++++++++++++++++++++++++++++
>   4 files changed, 226 insertions(+)
> 
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index 157a474ae54416..e24b2447f4bfe6 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -594,6 +594,80 @@ dev, size, dma_handle and dir must all be the same as those passed into
>   dma_alloc_noncoherent().  cpu_addr must be the virtual address returned by
>   dma_alloc_noncoherent().
>   
> +::
> +
> +	struct sg_table *
> +	dma_alloc_noncontiguous(struct device *dev, size_t size,
> +				enum dma_data_direction dir, gfp_t gfp)
> +
> +This routine allocates  <size> bytes of non-coherent and possibly non-contiguous
> +memory.  It returns a pointer to struct sg_table that describes the allocated
> +and DMA mapped memory, or NULL if the allocation failed. The resulting memory
> +can be used for struct page mapped into a scatterlist are suitable for.
> +
> +The return sg_table is guaranteed to have 1 single DMA mapped segment as
> +indicated by sgt->nents, but it might have multiple CPU side segments as
> +indicated by sgt->orig_nents.
> +
> +The dir parameter specified if data is read and/or written by the device,
> +see dma_map_single() for details.
> +
> +The gfp parameter allows the caller to specify the ``GFP_`` flags (see
> +kmalloc()) for the allocation, but rejects flags used to specify a memory
> +zone such as GFP_DMA or GFP_HIGHMEM.
> +
> +Before giving the memory to the device, dma_sync_sgtable_for_device() needs
> +to be called, and before reading memory written by the device,
> +dma_sync_sgtable_for_cpu(), just like for streaming DMA mappings that are
> +reused.
> +
> +::
> +
> +	void
> +	dma_free_noncontiguous(struct device *dev, size_t size,
> +			       struct sg_table *sgt,
> +			       enum dma_data_direction dir)
> +
> +Free memory previously allocated using dma_alloc_noncontiguous().  dev, size,
> +and dir must all be the same as those passed into dma_alloc_noncontiguous().
> +sgt must be the pointer returned by dma_alloc_noncontiguous().
> +
> +::
> +
> +	void *
> +	dma_vmap_noncontiguous(struct device *dev, size_t size,
> +		struct sg_table *sgt)
> +
> +Return a contiguous kernel mapping for an allocation returned from
> +dma_alloc_noncontiguous().  dev and size must be the same as those passed into
> +dma_alloc_noncontiguous().  sgt must be the pointer returned by
> +dma_alloc_noncontiguous().
> +
> +Once a non-contiguous allocation is mapped using this function, the
> +flush_kernel_vmap_range() and invalidate_kernel_vmap_range() APIs must be used
> +to manage the coherency of the kernel mapping.

Maybe say something like "coherency between the kernel mapping and any 
userspace mappings"? Otherwise people like me may be easily confused and 
think it's referring to coherency between the kernel mapping and the 
device, where in most cases those APIs won't help at all :)

> +
> +::
> +
> +	void
> +	dma_vunmap_noncontiguous(struct device *dev, void *vaddr)
> +
> +Unmap a kernel mapping returned by dma_vmap_noncontiguous().  dev must be the
> +same the one passed into dma_alloc_noncontiguous().  vaddr must be the pointer
> +returned by dma_vmap_noncontiguous().
> +
> +
> +::
> +
> +	int
> +	dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
> +			       size_t size, struct sg_table *sgt)
> +
> +Map an allocation returned from dma_alloc_noncontiguous() into a user address
> +space.  dev and size must be the same as those passed into
> +dma_alloc_noncontiguous().  sgt must be the pointer returned by
> +dma_alloc_noncontiguous().
> +
>   ::
>   
>   	int
> diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> index 11e02537b9e01b..fe46a41130e662 100644
> --- a/include/linux/dma-map-ops.h
> +++ b/include/linux/dma-map-ops.h
> @@ -22,6 +22,10 @@ struct dma_map_ops {
>   			gfp_t gfp);
>   	void (*free_pages)(struct device *dev, size_t size, struct page *vaddr,
>   			dma_addr_t dma_handle, enum dma_data_direction dir);
> +	struct sg_table *(*alloc_noncontiguous)(struct device *dev, size_t size,
> +			enum dma_data_direction dir, gfp_t gfp);
> +	void (*free_noncontiguous)(struct device *dev, size_t size,
> +			struct sg_table *sgt, enum dma_data_direction dir);
>   	int (*mmap)(struct device *, struct vm_area_struct *,
>   			void *, dma_addr_t, size_t, unsigned long attrs);
>   
> @@ -198,6 +202,20 @@ static inline int dma_mmap_from_global_coherent(struct vm_area_struct *vma,
>   }
>   #endif /* CONFIG_DMA_DECLARE_COHERENT */
>   
> +/*
> + * This is the actual return value from the ->alloc_noncontiguous method.
> + * The users of the DMA API should only care about the sg_table, but to make
> + * the DMA-API internal vmaping and freeing easier we stash away the page
> + * array as well (except for the fallback case).  This can go away any time,
> + * e.g. when a vmap-variant that takes a scatterlist comes along.
> + */
> +struct dma_sgt_handle {
> +	struct sg_table sgt;
> +	struct page **pages;
> +};
> +#define sgt_handle(sgt) \
> +	container_of((sgt), struct dma_sgt_handle, sgt)
> +
>   int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
>   		void *cpu_addr, dma_addr_t dma_addr, size_t size,
>   		unsigned long attrs);
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 4977a748cb9483..6f4d34739f5cc6 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -144,6 +144,15 @@ u64 dma_get_required_mask(struct device *dev);
>   size_t dma_max_mapping_size(struct device *dev);
>   bool dma_need_sync(struct device *dev, dma_addr_t dma_addr);
>   unsigned long dma_get_merge_boundary(struct device *dev);
> +struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t size,
> +		enum dma_data_direction dir, gfp_t gfp);
> +void dma_free_noncontiguous(struct device *dev, size_t size,
> +		struct sg_table *sgt, enum dma_data_direction dir);
> +void *dma_vmap_noncontiguous(struct device *dev, size_t size,
> +		struct sg_table *sgt);
> +void dma_vunmap_noncontiguous(struct device *dev, void *vaddr);
> +int dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
> +		size_t size, struct sg_table *sgt);
>   #else /* CONFIG_HAS_DMA */
>   static inline dma_addr_t dma_map_page_attrs(struct device *dev,
>   		struct page *page, size_t offset, size_t size,
> @@ -257,6 +266,28 @@ static inline unsigned long dma_get_merge_boundary(struct device *dev)
>   {
>   	return 0;
>   }
> +static inline struct sg_table *dma_alloc_noncontiguous(struct device *dev,
> +		size_t size, enum dma_data_direction dir, gfp_t gfp)
> +{
> +	return NULL;
> +}
> +static inline void dma_free_noncontiguous(struct device *dev, size_t size,
> +		struct sg_table *sgt, enum dma_data_direction dir)
> +{
> +}
> +static inline void *dma_vmap_noncontiguous(struct device *dev, size_t size,
> +		struct sg_table *sgt)
> +{
> +	return NULL;
> +}
> +static inline void dma_vunmap_noncontiguous(struct device *dev, void *vaddr)
> +{
> +}
> +static inline int dma_mmap_noncontiguous(struct device *dev,
> +		struct vm_area_struct *vma, size_t size, struct sg_table *sgt)
> +{
> +	return -EINVAL;
> +}
>   #endif /* CONFIG_HAS_DMA */
>   
>   struct page *dma_alloc_pages(struct device *dev, size_t size,
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 5e87dac6cc6d9a..5a62439ed483af 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -537,6 +537,109 @@ int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
>   }
>   EXPORT_SYMBOL_GPL(dma_mmap_pages);
>   
> +static struct sg_table *alloc_single_sgt(struct device *dev, size_t size,
> +		enum dma_data_direction dir, gfp_t gfp)
> +{
> +	struct sg_table *sgt;
> +	struct page *page;
> +
> +	sgt = kmalloc(sizeof(*sgt), gfp);

It might be nice to allocate a dma_sgt_handle here for consistency.

> +	if (!sgt)
> +		return NULL;
> +	if (sg_alloc_table(sgt, 1, gfp))
> +		goto out_free_sgt;
> +	page = __dma_alloc_pages(dev, size, &sgt->sgl->dma_address, dir, gfp);
> +	if (!page)
> +		goto out_free_table;
> +	sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
> +	sg_dma_len(sgt->sgl) = sgt->sgl->length;
> +	return sgt;
> +out_free_table:
> +	sg_free_table(sgt);
> +out_free_sgt:
> +	kfree(sgt);
> +	return NULL;
> +}
> +
> +struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t size,
> +		enum dma_data_direction dir, gfp_t gfp)
> +{
> +	const struct dma_map_ops *ops = get_dma_ops(dev);
> +	struct sg_table *sgt;
> +
> +	if (ops && ops->alloc_noncontiguous)
> +		sgt = ops->alloc_noncontiguous(dev, size, dir, gfp);
> +	else
> +		sgt = alloc_single_sgt(dev, size, dir, gfp);
> +
> +	if (sgt) {
> +		sgt->nents = 1;
> +		debug_dma_map_sg(dev, sgt->sgl, sgt->orig_nents, 1, dir);
> +	}
> +	return sgt;
> +}
> +EXPORT_SYMBOL_GPL(dma_alloc_noncontiguous);
> +
> +static void free_single_sgt(struct device *dev, size_t size,
> +		struct sg_table *sgt, enum dma_data_direction dir)
> +{
> +	__dma_free_pages(dev, size, sg_page(sgt->sgl), sgt->sgl->dma_address,
> +			 dir);
> +	sg_free_table(sgt);
> +	kfree(sgt);
> +}
> +
> +void dma_free_noncontiguous(struct device *dev, size_t size,
> +		struct sg_table *sgt, enum dma_data_direction dir)
> +{
> +	const struct dma_map_ops *ops = get_dma_ops(dev);
> +
> +	debug_dma_unmap_sg(dev, sgt->sgl, sgt->orig_nents, dir);
> +	if (ops && ops->free_noncontiguous)
> +		ops->free_noncontiguous(dev, size, sgt, dir);
> +	else
> +		free_single_sgt(dev, size, sgt, dir);
> +}
> +EXPORT_SYMBOL_GPL(dma_free_noncontiguous);
> +
> +void *dma_vmap_noncontiguous(struct device *dev, size_t size,
> +		struct sg_table *sgt)
> +{
> +	const struct dma_map_ops *ops = get_dma_ops(dev);
> +	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> +
> +	if (ops && ops->alloc_noncontiguous)
> +		return vmap(sgt_handle(sgt)->pages, count, VM_MAP, PAGE_KERNEL);
> +	return page_address(sg_page(sgt->sgl));

If the fallback case was consistent, you could simply look at whether 
sgt_handle(sgt)->pages was set and avoid having to poke at the ops at 
all. Or even better, just look at sgt->orig_nents, where if it's 1 you 
don't need to vmap either way, and if it's larger then you can assume 
pages is valid because it couldn't have come from the fallback case.

FWIW I still think this deserves to be a common sg_vmap_table() helper 
rather than pretending the operation is somehow exclusive to the DMA 
API. Even if it has to effectively perform sg_alloc_table_from_pages() 
in reverse, it's not like we don't have precedent for that sort of 
thing, e.g. dma_common_contiguous_remap(). That particular point is just 
a grumble though, and I'm not going to let it stand in the way of this 
series which I know is addressing actual issues :)

> +}
> +EXPORT_SYMBOL_GPL(dma_vmap_noncontiguous);
> +
> +void dma_vunmap_noncontiguous(struct device *dev, void *vaddr)
> +{
> +	const struct dma_map_ops *ops = get_dma_ops(dev);
> +
> +	if (ops && ops->alloc_noncontiguous)

is_vmalloc_addr(vaddr) seems like an even more logical condition, and at 
that point it really becomes a very generic helper that could already be 
used in a few other places.

> +		vunmap(vaddr);
> +}
> +EXPORT_SYMBOL_GPL(dma_vunmap_noncontiguous);
> +
> +int dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
> +		size_t size, struct sg_table *sgt)
> +{
> +	const struct dma_map_ops *ops = get_dma_ops(dev);
> +
> +	if (ops && ops->alloc_noncontiguous) {
> +		unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> +
> +		if (vma->vm_pgoff >= count ||
> +		    vma_pages(vma) > count - vma->vm_pgoff)
> +			return -ENXIO;

If you're calling vm_map_pages() you shouldn't need to duplicate these 
checks.

> +		return vm_map_pages(vma, sgt_handle(sgt)->pages, count);
> +	}
> +	return dma_mmap_pages(dev, vma, size, sg_page(sgt->sgl));

Same comment about pages/orig_nents as above. Although does this 
function even need to have a split personality at all - how hard would 
it really be to call remap_pfn_range() in a for_each_sgtable_sg() loop? 
(Or perhaps for_each_sgtable_page()/vm_insert_page() would be even 
closer to what you already have here...)

Robin.

> +}
> +EXPORT_SYMBOL_GPL(dma_mmap_noncontiguous);
> +
>   int dma_supported(struct device *dev, u64 mask)
>   {
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
> 
