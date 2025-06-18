Return-Path: <linux-media+bounces-35169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E5FADEB4E
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 14:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB0207AA548
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 12:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95E52BF01F;
	Wed, 18 Jun 2025 12:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="dZHM3y3m"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD47B285C87;
	Wed, 18 Jun 2025 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248327; cv=pass; b=hvVXnAK5MptdYt1M0o+xiyVoBBsuTch5Wa9E6SPw3jESwoxeihpB923qRds34Peeq4dbXX8rhAMZk6DBojFPiYe1otbEhLpg0yW7aPpFlZNSVsRZgP3pAyOYTctxvvJM+qJW8dxjH4cBg37E0I3Y4GcGOupFH+Y5b6nL8ZX7QIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248327; c=relaxed/simple;
	bh=HLTCgjBMjcVBC/TjdcNym1f49GnDVRGUT5u4rpDcCic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vb5g381OqrP1/IYVodOyJXyEk9+c3YZ3wespWXoAT15LRJPDdBwtaYY5P7Z6UEIcEct1dN/RhvGfWld8H6ugbtgv9cJ8VBj5/7XEO2aoAX/toTR6c0IvSjlPAJVT4jUuTY4xt/BnFtjYowiG74zxcoSjprXq4Xft3c0KBuSzBuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=dZHM3y3m; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1750248266; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RzZx55D2awi+fO2vkEHMWH9OOXJ32TdxQctGvr9yX9nPyH83ftFQemoHFHmrCJAzZKFlIzPlqXI9Y/pIPS39qdjOXGE2rfhvjqHK0FtrCzTsdmDBmTuOUtN2MRaHsV7n6s3LieS75ki/Vdw5PQs57e3ZboFFGrp6/ZfixJw2wx4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750248266; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wNS5dTEF+2i7jwZ235uXxOrvBy69u8K8AlvOKsVbO1k=; 
	b=j4lnktPmaR1nID6BIAnPS32tQUOqkHaZJZ8EKIKiNsi9aKI+7kEokVtw0vheCUK3Z89CCAodyzI0bJHmVYbIXxZBizdwx3THXcmsUw4doBg5U0TOswNjRJQRjRudDAPMmJLd2rYN5zzUwGd4m0TNLVK6GHmPaJNLj+3ZOAj9yqI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750248266;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wNS5dTEF+2i7jwZ235uXxOrvBy69u8K8AlvOKsVbO1k=;
	b=dZHM3y3mc88EBNV5fkDMwN4t4E2+Gk/gxR8lfkPPQxYyzHZiGwyPUC3nPKDsm+sC
	Nb2ywFBo7uAY2RuWS2A3hs5A8fts4yT4KaQUgu2/ZfwwH6iLR+vaZFFo8Wc1zDsqkjY
	CpqE98SKzBrOoaoLqhzTk37FIKVkcqqb37+4CrOE=
Received: by mx.zohomail.com with SMTPS id 1750248264710842.3799880621831;
	Wed, 18 Jun 2025 05:04:24 -0700 (PDT)
Message-ID: <ff32d7c1-d811-46b8-8d3d-458dfebd14f8@collabora.com>
Date: Wed, 18 Jun 2025 14:04:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] iommu: Add verisilicon IOMMU driver
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-4-benjamin.gaignard@collabora.com>
 <20250617163219.GF1376515@ziepe.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250617163219.GF1376515@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 17/06/2025 à 18:32, Jason Gunthorpe a écrit :
> On Mon, Jun 16, 2025 at 04:55:51PM +0200, Benjamin Gaignard wrote:
>
>> +static struct vsi_iommu *vsi_iommu_from_dev(struct device *dev)
>> +{
>> +	struct vsi_iommudata *data = dev_iommu_priv_get(dev);
>> +
>> +	return data ? data->iommu : NULL;
> It would be a serious bug if dev_iommu_priv_get() is null, don't check
> for it, let it crash.

Ok, I will simplify/merge the driver internal structure and remove this function.

>> +static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
>> +{
>> +	struct vsi_iommu_domain *vsi_domain;
>> +
>> +	if (!dma_dev)
>> +		return NULL;
>> +
>> +	vsi_domain = kzalloc(sizeof(*vsi_domain), GFP_KERNEL);
>> +	if (!vsi_domain)
>> +		return NULL;
>> +
>> +	/*
>> +	 * iommu use a 2 level pagetable.
>> +	 * Each level1 (dt) and level2 (pt) table has 1024 4-byte entries.
>> +	 * Allocate one 4 KiB page for each table.
>> +	 */
>> +	vsi_domain->dt = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
>> +					      SPAGE_SIZE);
>> +	if (!vsi_domain->dt)
>> +		goto err_free_domain;
>> +
>> +	vsi_domain->dt_dma = dma_map_single(dma_dev, vsi_domain->dt,
>> +					    SPAGE_SIZE, DMA_TO_DEVICE);
>> +	if (dma_mapping_error(dma_dev, vsi_domain->dt_dma)) {
>> +		dev_err(dma_dev, "DMA map error for DT\n");
>> +		goto err_free_dt;
>> +	}
>> +
>> +	vsi_domain->pta = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
>> +					       SPAGE_SIZE);
>> +	if (!vsi_domain->pta)
>> +		goto err_unmap_dt;
>> +
>> +	vsi_domain->pta_dma = dma_map_single(dma_dev, vsi_domain->pta,
>> +					     SPAGE_SIZE, DMA_TO_DEVICE);
>> +	if (dma_mapping_error(dma_dev, vsi_domain->pta_dma)) {
>> +		dev_err(dma_dev, "DMA map error for PTA\n");
>> +		goto err_free_pta;
>> +	}
>> +	vsi_domain->pta[0] = vsi_mk_pta(vsi_domain->dt_dma);
>> +
>> +	vsi_table_flush(vsi_domain, vsi_domain->pta_dma, 1024);
>> +	vsi_table_flush(vsi_domain, vsi_domain->dt_dma, NUM_DT_ENTRIES);
> dma_map_single already flushes, put things in the write order and no
> need to double flush.

I don't get your point here, for me it flush two different pieces of memory.

>
>> +	spin_lock_init(&vsi_domain->iommus_lock);
>> +	spin_lock_init(&vsi_domain->dt_lock);
>> +	INIT_LIST_HEAD(&vsi_domain->iommus);
>> +
>> +	vsi_domain->domain.geometry.aperture_start = 0;
>> +	vsi_domain->domain.geometry.aperture_end   = DMA_BIT_MASK(32);
>> +	vsi_domain->domain.geometry.force_aperture = true;
> Initialize domain.pgsize_bitmap here and remove this:
>
> +       .pgsize_bitmap = VSI_IOMMU_PGSIZE_BITMAP,
>
> It is going away.

Will be in v2.

>
>> +	return &vsi_domain->domain;
>> +
>> +err_free_pta:
>> +	iommu_free_pages(vsi_domain->pta);
>> +err_unmap_dt:
>> +	dma_unmap_single(dma_dev, vsi_domain->dt_dma,
>> +			 SPAGE_SIZE, DMA_TO_DEVICE);
>> +err_free_dt:
>> +	iommu_free_pages(vsi_domain->dt);
>> +err_free_domain:
>> +	kfree(vsi_domain);
>> +
>> +	return NULL;
>> +}
>> +
>> +static phys_addr_t vsi_iommu_iova_to_phys(struct iommu_domain *domain,
>> +					  dma_addr_t iova)
>> +{
>> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
>> +	unsigned long flags;
>> +	phys_addr_t pt_phys, phys = 0;
>> +	u32 dte, pte;
>> +	u32 *page_table;
>> +
>> +	spin_lock_irqsave(&vsi_domain->dt_lock, flags);
> No locking should be here. Drivers are supposed to use cmpxchg to set
> the new tables to avoid races, however there is complexity around the
> cache flushing that this locking solves.
>
> IDK, you might be better to use the new iommupt stuff since all these
> algorithms including the complicated lockless cache flushing
> optmization are sorted out there.
>
> https://lore.kernel.org/linux-iommu/0-v3-a93aab628dbc+521-iommu_pt_jgg@nvidia.com/

This series is not merged on mainline (at least I don't see it) so I will keep
it like it is for the moment.

>
>> +	dte_index = vsi_iova_dte_index(iova);
>> +	dte_addr = &vsi_domain->dt[dte_index];
>> +	dte = *dte_addr;
>> +	if (vsi_dte_is_pt_valid(dte))
>> +		goto done;
>> +
>> +	page_table = (u32 *)get_zeroed_page(GFP_ATOMIC | GFP_DMA32);
>> +	if (!page_table)
>> +		return ERR_PTR(-ENOMEM);
> Don't use get_zeroed_page for page table memory.

I will use kmem_cache in v2

>
>> +
>> +	pt_dma = dma_map_single(dma_dev, page_table, SPAGE_SIZE, DMA_TO_DEVICE);
>> +	if (dma_mapping_error(dma_dev, pt_dma)) {
>> +		dev_err(dma_dev, "DMA mapping error while allocating page table\n");
>> +		free_page((unsigned long)page_table);
>> +		return ERR_PTR(-ENOMEM);
>> +	}
>> +
>> +	dte = vsi_mk_dte(pt_dma);
>> +	*dte_addr = dte;
>> +
>> +	vsi_table_flush(vsi_domain, pt_dma, NUM_PT_ENTRIES);
>> +	vsi_table_flush(vsi_domain,
>> +			vsi_domain->dt_dma + dte_index * sizeof(u32), 1);
> Double flushing again.

Same here, for me I flushing two different memory area.

>
>> +static int vsi_iommu_map_iova(struct vsi_iommu_domain *vsi_domain, u32 *pte_addr,
>> +			      dma_addr_t pte_dma, dma_addr_t iova,
>> +			      phys_addr_t paddr, size_t size, int prot)
>> +{
>> +	unsigned int pte_count;
>> +	unsigned int pte_total = size / SPAGE_SIZE;
>> +	phys_addr_t page_phys;
>> +
>> +	assert_spin_locked(&vsi_domain->dt_lock);
>> +
>> +	for (pte_count = 0; pte_count < pte_total; pte_count++) {
>> +		u32 pte = pte_addr[pte_count];
>> +
>> +		if (vsi_pte_is_page_valid(pte))
>> +			goto unwind;
>> +
>> +		pte_addr[pte_count] = vsi_mk_pte(paddr, prot);
> So why is this:
>
> #define VSI_IOMMU_PGSIZE_BITMAP 0x007ff000
>
> If the sizes don't become encoded in the PTE? The bits beyond 4k
> should reflect actual ability to store those sizes in PTEs, eg using
> contiguous bits or something.

The iommu use arrays to store up to 1024 4k pages indexes so the size
isn't coded in the PTE bits but the numbers of used indexes for each arrays.

>
>> +		paddr += SPAGE_SIZE;
>> +	}
>> +
>> +	vsi_table_flush(vsi_domain, pte_dma, pte_total);
>> +
>> +	return 0;
>> +unwind:
>> +	/* Unmap the range of iovas that we just mapped */
>> +	vsi_iommu_unmap_iova(vsi_domain, pte_addr, pte_dma,
>> +			     pte_count * SPAGE_SIZE);
>> +
>> +	iova += pte_count * SPAGE_SIZE;
>> +	page_phys = vsi_pte_page_address(pte_addr[pte_count]);
>> +	pr_err("iova: %pad already mapped to %pa cannot remap to phys: %pa prot: %#x\n",
>> +	       &iova, &page_phys, &paddr, prot);
> No pr_errs prints on normal errors.

I will remove it in v2

>
>> +static void vsi_iommu_detach_device(struct iommu_domain *domain,
>> +				    struct device *dev)
>> +{
>> +	struct vsi_iommu *iommu;
>> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
>> +	unsigned long flags;
>> +	int ret;
>> +
>> +	/* Allow 'virtual devices' (eg drm) to detach from domain */
>> +	iommu = vsi_iommu_from_dev(dev);
>> +	if (WARN_ON(!iommu))
>> +		return;
>> +
>> +	dev_dbg(dev, "Detaching from iommu domain\n");
>> +
>> +	if (!iommu->domain)
>> +		return;
>> +
>> +	spin_lock_irqsave(&vsi_domain->iommus_lock, flags);
>> +	list_del_init(&iommu->node);
>> +	spin_unlock_irqrestore(&vsi_domain->iommus_lock, flags);
> The list del should probably be after the vsi_iommu_disable()? We
> expect invalidations to continue to keep the IOTLB consistent until
> the HW is no longer walking the page table.

I will do that in v2.

>
>> +static struct iommu_device *vsi_iommu_probe_device(struct device *dev)
>> +{
>> +	struct vsi_iommudata *data;
>> +	struct vsi_iommu *iommu;
>> +
>> +	data = dev_iommu_priv_get(dev);
>> +	if (!data)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	iommu = vsi_iommu_from_dev(dev);
>> +
>> +	pr_info("%s,%d, consumer : %s, supplier : %s\n",
>> +		__func__, __LINE__, dev_name(dev), dev_name(iommu->dev));
> No prints
>
>> +	/*
>> +	 * link will free by platform_device_del(master) via
>> +	 * BUS_NOTIFY_REMOVED_DEVICE
>> +	 */
>> +	data->link = device_link_add(dev, iommu->dev,
>> +				     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
>> +
>> +	/* set max segment size for dev, needed for single chunk map */
>> +	if (!dev->dma_parms)
>> +		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
>> +	if (!dev->dma_parms)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> I'm not sure this should be in an iommu driver??? Doesn't dma-iommu.c
> deal with this stuff

You are right, I will remove it.

>
>> +static void vsi_iommu_release_device(struct device *dev)
>> +{
>> +	struct vsi_iommudata *data = dev_iommu_priv_get(dev);
>> +
>> +	device_link_del(data->link);
> Leaking data..

I will change the driver internal structures and remove data->link.

>
>> +static int vsi_iommu_of_xlate(struct device *dev,
>> +			      const struct of_phandle_args *args)
>> +{
>> +	struct platform_device *iommu_dev;
>> +	struct vsi_iommudata *data;
>> +
>> +	data = devm_kzalloc(dma_dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	dev_info(dev, "%s,%d\n", __func__, __LINE__);
>> +	iommu_dev = of_find_device_by_node(args->np);
>> +
>> +	data->iommu = platform_get_drvdata(iommu_dev);
>> +
>> +	dev_iommu_priv_set(dev, data);
> Can you use iommu_fwspec_add_ids() instead of this?
>
> The only thing 'data' is doing here is to pass the iommu_dev, it is
> much better if you can get that from the fwspec in probe, like say ARM
> does it:
>
> 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>
> 	smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
>
> And then don't allocate memory in the of_xlate.

I will rework driver probe and the internal structure to avoid allocate here.

>
>> +static struct iommu_ops vsi_iommu_ops = {
>> +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
>> +	.probe_device = vsi_iommu_probe_device,
>> +	.release_device = vsi_iommu_release_device,
>> +	.device_group = generic_single_device_group,
>> +	.pgsize_bitmap = VSI_IOMMU_PGSIZE_BITMAP,
> move pgsize_bitmap to alloc paging

ok

>
>
>> +static int vsi_iommu_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct vsi_iommu *iommu;
>> +	struct resource *res;
>> +	int num_res = pdev->num_resources;
>> +	int err, i;
>> +
>> +	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
>> +	if (!iommu)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, iommu);
> This should be done last after the function can't fail

sure I will fix it.

>
>> +
>> +	iommu->group = iommu_group_alloc();
>> +	if (IS_ERR(iommu->group)) {
>> +		err = PTR_ERR(iommu->group);
>> +		goto err_unprepare_clocks;
>> +	}
> This should not be in iommu drivers. I'm guessing you want
> generic_single_device_group() ?

I will remove it.

>
>> +	/*
>> +	 * use the first registered sysmmu device for performing
>> +	 * dma mapping operations on iommu page tables (cpu cache flush)
>> +	 */
>> +	if (!dma_dev)
>> +		dma_dev = &pdev->dev;
> Huh? This is racey, and why? What is the reason not to use the current
> device always? Put the dev in the iommu_domain during
> domain_alloc_paging and get it from  dev->iommu->iommu_dev->dev.

I will change that too.

>
>> +
>> +	pm_runtime_enable(dev);
>> +
>> +	err = iommu_device_sysfs_add(&iommu->iommu, dev, NULL, dev_name(dev));
>> +	if (err)
>> +		goto err_put_group;
>> +
>> +	err = iommu_device_register(&iommu->iommu, &vsi_iommu_ops, dev);
>> +	if (err)
>> +		goto err_remove_sysfs;
> Register should usually be last.
>
>> +	for (i = 0; i < iommu->num_irq; i++) {
>> +		int irq = platform_get_irq(pdev, i);
>> +
>> +		if (irq < 0)
>> +			return irq;
>> +
>> +		err = devm_request_irq(iommu->dev, irq, vsi_iommu_irq,
>> +				       IRQF_SHARED, dev_name(dev), iommu);
>> +		if (err)
>> +			goto err_unregister;
>> +	}
> Why allocate interrupts after registration?

I will rework probe function to fix all that.

Thanks for your remarks.
Benjamin

>
> Jason
>

