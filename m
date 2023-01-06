Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6582660569
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 18:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234997AbjAFRPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 12:15:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234746AbjAFRPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 12:15:41 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE1C27CBD4;
        Fri,  6 Jan 2023 09:15:38 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A8E61FB;
        Fri,  6 Jan 2023 09:16:20 -0800 (PST)
Received: from [10.57.75.231] (unknown [10.57.75.231])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAE933F71A;
        Fri,  6 Jan 2023 09:15:34 -0800 (PST)
Message-ID: <4fd1b194-29ef-621d-4059-a8336058f217@arm.com>
Date:   Fri, 6 Jan 2023 17:15:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/8] iommu: Add a gfp parameter to iommu_map()
Content-Language: en-GB
To:     Jason Gunthorpe <jgg@nvidia.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>
Cc:     Alex Williamson <alex.williamson@redhat.com>,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
        kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, nouveau@lists.freedesktop.org,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        virtualization@lists.linux-foundation.org
References: <1-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <1-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2023-01-06 16:42, Jason Gunthorpe wrote:
> The internal mechanisms support this, but instead of exposting the gfp to
> the caller it wrappers it into iommu_map() and iommu_map_atomic()
> 
> Fix this instead of adding more variants for GFP_KERNEL_ACCOUNT.

FWIW, since we *do* have two variants already, I think I'd have a mild 
preference for leaving the regular map calls as-is (i.e. implicit 
GFP_KERNEL), and just generalising the _atomic versions for the special 
cases.

However, echoing the recent activity over on the DMA API side of things, 
I think it's still worth proactively constraining the set of permissible 
flags, lest we end up with more weird problems if stuff that doesn't 
really make sense, like GFP_COMP or zone flags, manages to leak through 
(that may have been part of the reason for having the current wrappers 
rather than a bare gfp argument in the first place, I forget now).

Thanks,
Robin.

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   arch/arm/mm/dma-mapping.c                       | 11 +++++++----
>   .../gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c |  3 ++-
>   drivers/gpu/drm/tegra/drm.c                     |  2 +-
>   drivers/gpu/host1x/cdma.c                       |  2 +-
>   drivers/infiniband/hw/usnic/usnic_uiom.c        |  4 ++--
>   drivers/iommu/dma-iommu.c                       |  2 +-
>   drivers/iommu/iommu.c                           | 17 ++++++-----------
>   drivers/iommu/iommufd/pages.c                   |  6 ++++--
>   drivers/media/platform/qcom/venus/firmware.c    |  2 +-
>   drivers/net/ipa/ipa_mem.c                       |  6 ++++--
>   drivers/net/wireless/ath/ath10k/snoc.c          |  2 +-
>   drivers/net/wireless/ath/ath11k/ahb.c           |  4 ++--
>   drivers/remoteproc/remoteproc_core.c            |  5 +++--
>   drivers/vfio/vfio_iommu_type1.c                 |  9 +++++----
>   drivers/vhost/vdpa.c                            |  2 +-
>   include/linux/iommu.h                           |  4 ++--
>   16 files changed, 43 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index c135f6e37a00ca..8bc01071474ab7 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -984,7 +984,8 @@ __iommu_create_mapping(struct device *dev, struct page **pages, size_t size,
>   
>   		len = (j - i) << PAGE_SHIFT;
>   		ret = iommu_map(mapping->domain, iova, phys, len,
> -				__dma_info_to_prot(DMA_BIDIRECTIONAL, attrs));
> +				__dma_info_to_prot(DMA_BIDIRECTIONAL, attrs),
> +				GFP_KERNEL);
>   		if (ret < 0)
>   			goto fail;
>   		iova += len;
> @@ -1207,7 +1208,8 @@ static int __map_sg_chunk(struct device *dev, struct scatterlist *sg,
>   
>   		prot = __dma_info_to_prot(dir, attrs);
>   
> -		ret = iommu_map(mapping->domain, iova, phys, len, prot);
> +		ret = iommu_map(mapping->domain, iova, phys, len, prot,
> +				GFP_KERNEL);
>   		if (ret < 0)
>   			goto fail;
>   		count += len >> PAGE_SHIFT;
> @@ -1379,7 +1381,8 @@ static dma_addr_t arm_iommu_map_page(struct device *dev, struct page *page,
>   
>   	prot = __dma_info_to_prot(dir, attrs);
>   
> -	ret = iommu_map(mapping->domain, dma_addr, page_to_phys(page), len, prot);
> +	ret = iommu_map(mapping->domain, dma_addr, page_to_phys(page), len,
> +			prot, GFP_KERNEL);
>   	if (ret < 0)
>   		goto fail;
>   
> @@ -1443,7 +1446,7 @@ static dma_addr_t arm_iommu_map_resource(struct device *dev,
>   
>   	prot = __dma_info_to_prot(dir, attrs) | IOMMU_MMIO;
>   
> -	ret = iommu_map(mapping->domain, dma_addr, addr, len, prot);
> +	ret = iommu_map(mapping->domain, dma_addr, addr, len, prot, GFP_KERNEL);
>   	if (ret < 0)
>   		goto fail;
>   
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> index 648ecf5a8fbc2a..a4ac94a2ab57fc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
> @@ -475,7 +475,8 @@ gk20a_instobj_ctor_iommu(struct gk20a_instmem *imem, u32 npages, u32 align,
>   		u32 offset = (r->offset + i) << imem->iommu_pgshift;
>   
>   		ret = iommu_map(imem->domain, offset, node->dma_addrs[i],
> -				PAGE_SIZE, IOMMU_READ | IOMMU_WRITE);
> +				PAGE_SIZE, IOMMU_READ | IOMMU_WRITE,
> +				GFP_KERNEL);
>   		if (ret < 0) {
>   			nvkm_error(subdev, "IOMMU mapping failure: %d\n", ret);
>   
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 7bd2e65c2a16c5..6ca9f396e55be4 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1057,7 +1057,7 @@ void *tegra_drm_alloc(struct tegra_drm *tegra, size_t size, dma_addr_t *dma)
>   
>   	*dma = iova_dma_addr(&tegra->carveout.domain, alloc);
>   	err = iommu_map(tegra->domain, *dma, virt_to_phys(virt),
> -			size, IOMMU_READ | IOMMU_WRITE);
> +			size, IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
>   	if (err < 0)
>   		goto free_iova;
>   
> diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
> index 103fda055394ab..4ddfcd2138c95b 100644
> --- a/drivers/gpu/host1x/cdma.c
> +++ b/drivers/gpu/host1x/cdma.c
> @@ -105,7 +105,7 @@ static int host1x_pushbuffer_init(struct push_buffer *pb)
>   
>   		pb->dma = iova_dma_addr(&host1x->iova, alloc);
>   		err = iommu_map(host1x->domain, pb->dma, pb->phys, size,
> -				IOMMU_READ);
> +				IOMMU_READ, GFP_KERNEL);
>   		if (err)
>   			goto iommu_free_iova;
>   	} else {
> diff --git a/drivers/infiniband/hw/usnic/usnic_uiom.c b/drivers/infiniband/hw/usnic/usnic_uiom.c
> index c301b3be9f303d..aeeaca65ace96a 100644
> --- a/drivers/infiniband/hw/usnic/usnic_uiom.c
> +++ b/drivers/infiniband/hw/usnic/usnic_uiom.c
> @@ -277,7 +277,7 @@ static int usnic_uiom_map_sorted_intervals(struct list_head *intervals,
>   				usnic_dbg("va 0x%lx pa %pa size 0x%zx flags 0x%x",
>   					va_start, &pa_start, size, flags);
>   				err = iommu_map(pd->domain, va_start, pa_start,
> -							size, flags);
> +						size, flags, GFP_KERNEL);
>   				if (err) {
>   					usnic_err("Failed to map va 0x%lx pa %pa size 0x%zx with err %d\n",
>   						va_start, &pa_start, size, err);
> @@ -294,7 +294,7 @@ static int usnic_uiom_map_sorted_intervals(struct list_head *intervals,
>   				usnic_dbg("va 0x%lx pa %pa size 0x%zx flags 0x%x\n",
>   					va_start, &pa_start, size, flags);
>   				err = iommu_map(pd->domain, va_start, pa_start,
> -						size, flags);
> +						size, flags, GFP_KERNEL);
>   				if (err) {
>   					usnic_err("Failed to map va 0x%lx pa %pa size 0x%zx with err %d\n",
>   						va_start, &pa_start, size, err);
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index f798c44e090337..8bdb65e7686ff9 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1615,7 +1615,7 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
>   	if (!iova)
>   		goto out_free_page;
>   
> -	if (iommu_map(domain, iova, msi_addr, size, prot))
> +	if (iommu_map(domain, iova, msi_addr, size, prot, GFP_KERNEL))
>   		goto out_free_iova;
>   
>   	INIT_LIST_HEAD(&msi_page->list);
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index de91dd88705bd3..fe29fc2140b132 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -930,7 +930,7 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
>   			if (map_size) {
>   				ret = iommu_map(domain, addr - map_size,
>   						addr - map_size, map_size,
> -						entry->prot);
> +						entry->prot, GFP_KERNEL);
>   				if (ret)
>   					goto out;
>   				map_size = 0;
> @@ -2360,31 +2360,26 @@ static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
>   	return ret;
>   }
>   
> -static int _iommu_map(struct iommu_domain *domain, unsigned long iova,
> -		      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
> +int iommu_map(struct iommu_domain *domain, unsigned long iova,
> +	      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	const struct iommu_domain_ops *ops = domain->ops;
>   	int ret;
>   
> +	might_sleep_if(gfpflags_allow_blocking(gfp));
> +
>   	ret = __iommu_map(domain, iova, paddr, size, prot, gfp);
>   	if (ret == 0 && ops->iotlb_sync_map)
>   		ops->iotlb_sync_map(domain, iova, size);
>   
>   	return ret;
>   }
> -
> -int iommu_map(struct iommu_domain *domain, unsigned long iova,
> -	      phys_addr_t paddr, size_t size, int prot)
> -{
> -	might_sleep();
> -	return _iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
> -}
>   EXPORT_SYMBOL_GPL(iommu_map);
>   
>   int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
>   	      phys_addr_t paddr, size_t size, int prot)
>   {
> -	return _iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
> +	return iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
>   }
>   EXPORT_SYMBOL_GPL(iommu_map_atomic);
>   
> diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
> index 1e1d3509efae5e..22cc3bb0c6c55a 100644
> --- a/drivers/iommu/iommufd/pages.c
> +++ b/drivers/iommu/iommufd/pages.c
> @@ -456,7 +456,8 @@ static int batch_iommu_map_small(struct iommu_domain *domain,
>   			size % PAGE_SIZE);
>   
>   	while (size) {
> -		rc = iommu_map(domain, iova, paddr, PAGE_SIZE, prot);
> +		rc = iommu_map(domain, iova, paddr, PAGE_SIZE, prot,
> +			       GFP_KERNEL);
>   		if (rc)
>   			goto err_unmap;
>   		iova += PAGE_SIZE;
> @@ -500,7 +501,8 @@ static int batch_to_domain(struct pfn_batch *batch, struct iommu_domain *domain,
>   		else
>   			rc = iommu_map(domain, iova,
>   				       PFN_PHYS(batch->pfns[cur]) + page_offset,
> -				       next_iova - iova, area->iommu_prot);
> +				       next_iova - iova, area->iommu_prot,
> +				       GFP_KERNEL);
>   		if (rc)
>   			goto err_unmap;
>   		iova = next_iova;
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 142d4c74017c04..07d4dceb5e72c7 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -158,7 +158,7 @@ static int venus_boot_no_tz(struct venus_core *core, phys_addr_t mem_phys,
>   	core->fw.mapped_mem_size = mem_size;
>   
>   	ret = iommu_map(iommu, VENUS_FW_START_ADDR, mem_phys, mem_size,
> -			IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV);
> +			IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
>   	if (ret) {
>   		dev_err(dev, "could not map video firmware region\n");
>   		return ret;
> diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
> index 9ec5af323f731d..991a7d39f06661 100644
> --- a/drivers/net/ipa/ipa_mem.c
> +++ b/drivers/net/ipa/ipa_mem.c
> @@ -466,7 +466,8 @@ static int ipa_imem_init(struct ipa *ipa, unsigned long addr, size_t size)
>   	size = PAGE_ALIGN(size + addr - phys);
>   	iova = phys;	/* We just want a direct mapping */
>   
> -	ret = iommu_map(domain, iova, phys, size, IOMMU_READ | IOMMU_WRITE);
> +	ret = iommu_map(domain, iova, phys, size, IOMMU_READ | IOMMU_WRITE,
> +			GFP_KERNEL);
>   	if (ret)
>   		return ret;
>   
> @@ -574,7 +575,8 @@ static int ipa_smem_init(struct ipa *ipa, u32 item, size_t size)
>   	size = PAGE_ALIGN(size + addr - phys);
>   	iova = phys;	/* We just want a direct mapping */
>   
> -	ret = iommu_map(domain, iova, phys, size, IOMMU_READ | IOMMU_WRITE);
> +	ret = iommu_map(domain, iova, phys, size, IOMMU_READ | IOMMU_WRITE,
> +			GFP_KERNEL);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index cfcb759a87deac..9a82f0336d9537 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1639,7 +1639,7 @@ static int ath10k_fw_init(struct ath10k *ar)
>   
>   	ret = iommu_map(iommu_dom, ar_snoc->fw.fw_start_addr,
>   			ar->msa.paddr, ar->msa.mem_size,
> -			IOMMU_READ | IOMMU_WRITE);
> +			IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
>   	if (ret) {
>   		ath10k_err(ar, "failed to map firmware region: %d\n", ret);
>   		goto err_iommu_detach;
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index d34a4d6325b2b4..df8fdc7067f99c 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -1021,7 +1021,7 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
>   
>   	ret = iommu_map(iommu_dom, ab_ahb->fw.msa_paddr,
>   			ab_ahb->fw.msa_paddr, ab_ahb->fw.msa_size,
> -			IOMMU_READ | IOMMU_WRITE);
> +			IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
>   	if (ret) {
>   		ath11k_err(ab, "failed to map firmware region: %d\n", ret);
>   		goto err_iommu_detach;
> @@ -1029,7 +1029,7 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
>   
>   	ret = iommu_map(iommu_dom, ab_ahb->fw.ce_paddr,
>   			ab_ahb->fw.ce_paddr, ab_ahb->fw.ce_size,
> -			IOMMU_READ | IOMMU_WRITE);
> +			IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
>   	if (ret) {
>   		ath11k_err(ab, "failed to map firmware CE region: %d\n", ret);
>   		goto err_iommu_unmap;
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 1cd4815a6dd197..80072b6b628358 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -643,7 +643,8 @@ static int rproc_handle_devmem(struct rproc *rproc, void *ptr,
>   	if (!mapping)
>   		return -ENOMEM;
>   
> -	ret = iommu_map(rproc->domain, rsc->da, rsc->pa, rsc->len, rsc->flags);
> +	ret = iommu_map(rproc->domain, rsc->da, rsc->pa, rsc->len, rsc->flags,
> +			GFP_KERNEL);
>   	if (ret) {
>   		dev_err(dev, "failed to map devmem: %d\n", ret);
>   		goto out;
> @@ -737,7 +738,7 @@ static int rproc_alloc_carveout(struct rproc *rproc,
>   		}
>   
>   		ret = iommu_map(rproc->domain, mem->da, dma, mem->len,
> -				mem->flags);
> +				mem->flags, GFP_KERNEL);
>   		if (ret) {
>   			dev_err(dev, "iommu_map failed: %d\n", ret);
>   			goto free_mapping;
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 23c24fe98c00d4..e14f86a8ef5258 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -1480,7 +1480,8 @@ static int vfio_iommu_map(struct vfio_iommu *iommu, dma_addr_t iova,
>   
>   	list_for_each_entry(d, &iommu->domain_list, next) {
>   		ret = iommu_map(d->domain, iova, (phys_addr_t)pfn << PAGE_SHIFT,
> -				npage << PAGE_SHIFT, prot | IOMMU_CACHE);
> +				npage << PAGE_SHIFT, prot | IOMMU_CACHE,
> +				GFP_KERNEL);
>   		if (ret)
>   			goto unwind;
>   
> @@ -1777,8 +1778,8 @@ static int vfio_iommu_replay(struct vfio_iommu *iommu,
>   				size = npage << PAGE_SHIFT;
>   			}
>   
> -			ret = iommu_map(domain->domain, iova, phys,
> -					size, dma->prot | IOMMU_CACHE);
> +			ret = iommu_map(domain->domain, iova, phys, size,
> +					dma->prot | IOMMU_CACHE, GFP_KERNEL);
>   			if (ret) {
>   				if (!dma->iommu_mapped) {
>   					vfio_unpin_pages_remote(dma, iova,
> @@ -1866,7 +1867,7 @@ static void vfio_test_domain_fgsp(struct vfio_domain *domain)
>   		return;
>   
>   	ret = iommu_map(domain->domain, 0, page_to_phys(pages), PAGE_SIZE * 2,
> -			IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE);
> +			IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE, GFP_KERNEL);
>   	if (!ret) {
>   		size_t unmapped = iommu_unmap(domain->domain, 0, PAGE_SIZE);
>   
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 166044642fd5cc..e555c3bd1c030b 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -777,7 +777,7 @@ static int vhost_vdpa_map(struct vhost_vdpa *v, struct vhost_iotlb *iotlb,
>   			r = ops->set_map(vdpa, asid, iotlb);
>   	} else {
>   		r = iommu_map(v->domain, iova, pa, size,
> -			      perm_to_iommu_flags(perm));
> +			      perm_to_iommu_flags(perm), GFP_KERNEL);
>   	}
>   	if (r) {
>   		vhost_iotlb_del_range(iotlb, iova, iova + size - 1);
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 46e1347bfa2286..d2020994f292db 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -467,7 +467,7 @@ extern int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
>   extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
>   extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
>   extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
> -		     phys_addr_t paddr, size_t size, int prot);
> +		     phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
>   extern int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
>   			    phys_addr_t paddr, size_t size, int prot);
>   extern size_t iommu_unmap(struct iommu_domain *domain, unsigned long iova,
> @@ -773,7 +773,7 @@ static inline struct iommu_domain *iommu_get_domain_for_dev(struct device *dev)
>   }
>   
>   static inline int iommu_map(struct iommu_domain *domain, unsigned long iova,
> -			    phys_addr_t paddr, size_t size, int prot)
> +			    phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>   {
>   	return -ENODEV;
>   }
