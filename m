Return-Path: <linux-media+bounces-35112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D97FADD7F3
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 18:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98D704A684E
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0ECD2F2341;
	Tue, 17 Jun 2025 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XO8lVH6E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253252EF2AD
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177944; cv=none; b=c8+WKBHRMJtPVtx+JwYkKe4GeBCOoyZ7GowNEzPFMsemVBgts4vuP5iQxcx9gyzg4UA3c8cRzU93ktuccwOCBuo+LjcpUAs8MqN03YcdxeNeni7Q2a0hLL1PIVVQVb+iy98jLwMT3nfflnEETCOUU7UbEs2/FvELqbaQJuZmyjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177944; c=relaxed/simple;
	bh=qvFO4rZP1vheikCq97E6JdYmCzgNrA/orS5E0K9O8kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+Lm3VdvtkBTsrngRRVXYWft4/oa7BW/LTHCiHYqG2MlhlalE0G68h9Zc/9ixPHfBDNSf0BlSTe1N734ayywP+4qFSpYhshUoNlHA9YoN/9B22jFdRdg4HZbqftIPXJ8LVCfnxnK/vSzxF8Pvtn6VbfNXb5gU51JgT4I6cPVNk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=XO8lVH6E; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fadb9a0325so50853456d6.2
        for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750177941; x=1750782741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nC7rm+Bwrl6nau/SPrD4L98tdg/BZZbxkCiAvlgkDgo=;
        b=XO8lVH6EQvFyCFjZfDyZVTjbIgV+hWrqrq3d6inZGpaTNWV/C72q1m0GNjAnAwY609
         L6rU33XFr3xwTOFFTCZn9f5ExUgBEkLbcJIhMdZs/+15CFZIayM5BIDTNshgK1eum7ef
         KGzQYzFPJc2vKqQ5Q23TLWbz7pGDCogBVVzl1LHJIRIyS+yKgdgTvuRpq+hti9pVhKge
         csySmV1sT67CtoWEdBFsrD/d7KnOpd9AbjUSz0Dw4ph2CP6wyPWESL4j+3sp62+XN4QU
         DcF1ruZvKg/6BAQTsUJhGCVDB1JBCQ+NOFHRX56tU+VWxVjMpC6I/5Wa0LxUGhHwuS9e
         RhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177941; x=1750782741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC7rm+Bwrl6nau/SPrD4L98tdg/BZZbxkCiAvlgkDgo=;
        b=duK6l1PBkq3QXNMkYIAJrXUxk9VMGrmUoio3akgrZsKAHgkRIf8/8rO00fcaOE5FbQ
         TiEq0+KkPzTGSrT/VXIB2RC7I5/BOEqm+w+AGNK9Qnd4zL2346htOzP8KqiZwzsz8MSU
         BTGSETDt86Q2UnTNdjElzGOmd0DpMYGzbAYMnTQ6jD4IhuqcS2bD7m5+BJ3UtMDsj9nT
         oktNOtKpxp7wBSIyYsgi7898NPrKwzv1O2Mkllsf0fTR/6FKjaMUINRwc23TiCXTmgFi
         hUEOk3HnJN8vskdLoIzKAmD0ct9DJ298GxBjIS4gvtSbxlHBtFP3Flab2GdnwblO8ZN2
         6XdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjms5AH5woqcxxjMKrm7cgm08hAKsMY+O+fB2Qjalezkom/YHzuqjtvTzCyGVD1IXKvwAhP9N7klbzGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Rbh3BO0NoH6PYLuOCYX8cnHwSxtf06s6Jljtr5zblUQ7fwiY
	XXR3l33N946x+nS+YYeXlMGtzouTg7QDwiYlWS7hiOXPq7zI22qIruPCILJTAEuARuI=
X-Gm-Gg: ASbGncscmcN+aBD+kgBFrpQ7+f8GgVY6f9y+PRUOXvKzcoe8ugvU57r5t0nvxj8Nk7s
	U9exKU7TJcPZxH1lImnf+5GV5p+oLz2W3MDuQJohiJMoy51AbC8MHxdJb/kpAhZWT6zBc4fItDy
	lxpJxfi3lBfRY6rNpbj7HNj1zQWmNy/GGyVbhZ63SvbI2NqgYyKbaJzqEeb2LMeY14fqJif8lAH
	SlR3MH9iJaUZDYuDe56gs/8VApNyXbb7pJ/PdqjVdnOu+Jlr52koFEEz8V+UrdR6aNDwRCplGMO
	5mBFZCyBZmE+K2u9puelGDoaIdF7Dxhlqe6r4Yyxpzo+Vp60Uw804SjKUPFc20zQvopXrvn+zUZ
	pbK58NA+/nNoYSITZkB6UNQbJSL6Hvzknm3qGow==
X-Google-Smtp-Source: AGHT+IEn/8UILucmSUjm3Ghk3vbiODu7JZ3ElN7VeLJXr7Tqd6s5+YqK3eHc6OVfIyOPTPJQFQWeeQ==
X-Received: by 2002:a05:6214:2344:b0:6fa:bd17:32a with SMTP id 6a1803df08f44-6fb47798100mr185358346d6.29.1750177940786;
        Tue, 17 Jun 2025 09:32:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb5f63431bsm8459256d6.43.2025.06.17.09.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:32:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRZER-00000006X8g-3Ob6;
	Tue, 17 Jun 2025 13:32:19 -0300
Date: Tue, 17 Jun 2025 13:32:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250617163219.GF1376515@ziepe.ca>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616145607.116639-4-benjamin.gaignard@collabora.com>

On Mon, Jun 16, 2025 at 04:55:51PM +0200, Benjamin Gaignard wrote:

> +static struct vsi_iommu *vsi_iommu_from_dev(struct device *dev)
> +{
> +	struct vsi_iommudata *data = dev_iommu_priv_get(dev);
> +
> +	return data ? data->iommu : NULL;

It would be a serious bug if dev_iommu_priv_get() is null, don't check
for it, let it crash.

> +static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
> +{
> +	struct vsi_iommu_domain *vsi_domain;
> +
> +	if (!dma_dev)
> +		return NULL;
> +
> +	vsi_domain = kzalloc(sizeof(*vsi_domain), GFP_KERNEL);
> +	if (!vsi_domain)
> +		return NULL;
> +
> +	/*
> +	 * iommu use a 2 level pagetable.
> +	 * Each level1 (dt) and level2 (pt) table has 1024 4-byte entries.
> +	 * Allocate one 4 KiB page for each table.
> +	 */
> +	vsi_domain->dt = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
> +					      SPAGE_SIZE);
> +	if (!vsi_domain->dt)
> +		goto err_free_domain;
> +
> +	vsi_domain->dt_dma = dma_map_single(dma_dev, vsi_domain->dt,
> +					    SPAGE_SIZE, DMA_TO_DEVICE);
> +	if (dma_mapping_error(dma_dev, vsi_domain->dt_dma)) {
> +		dev_err(dma_dev, "DMA map error for DT\n");
> +		goto err_free_dt;
> +	}
> +
> +	vsi_domain->pta = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
> +					       SPAGE_SIZE);
> +	if (!vsi_domain->pta)
> +		goto err_unmap_dt;
> +
> +	vsi_domain->pta_dma = dma_map_single(dma_dev, vsi_domain->pta,
> +					     SPAGE_SIZE, DMA_TO_DEVICE);
> +	if (dma_mapping_error(dma_dev, vsi_domain->pta_dma)) {
> +		dev_err(dma_dev, "DMA map error for PTA\n");
> +		goto err_free_pta;
> +	}
> +	vsi_domain->pta[0] = vsi_mk_pta(vsi_domain->dt_dma);

> +
> +	vsi_table_flush(vsi_domain, vsi_domain->pta_dma, 1024);
> +	vsi_table_flush(vsi_domain, vsi_domain->dt_dma, NUM_DT_ENTRIES);

dma_map_single already flushes, put things in the write order and no
need to double flush.

> +	spin_lock_init(&vsi_domain->iommus_lock);
> +	spin_lock_init(&vsi_domain->dt_lock);
> +	INIT_LIST_HEAD(&vsi_domain->iommus);
> +
> +	vsi_domain->domain.geometry.aperture_start = 0;
> +	vsi_domain->domain.geometry.aperture_end   = DMA_BIT_MASK(32);
> +	vsi_domain->domain.geometry.force_aperture = true;

Initialize domain.pgsize_bitmap here and remove this:

+       .pgsize_bitmap = VSI_IOMMU_PGSIZE_BITMAP,

It is going away.

> +	return &vsi_domain->domain;
> +
> +err_free_pta:
> +	iommu_free_pages(vsi_domain->pta);
> +err_unmap_dt:
> +	dma_unmap_single(dma_dev, vsi_domain->dt_dma,
> +			 SPAGE_SIZE, DMA_TO_DEVICE);
> +err_free_dt:
> +	iommu_free_pages(vsi_domain->dt);
> +err_free_domain:
> +	kfree(vsi_domain);
> +
> +	return NULL;
> +}
> +
> +static phys_addr_t vsi_iommu_iova_to_phys(struct iommu_domain *domain,
> +					  dma_addr_t iova)
> +{
> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +	unsigned long flags;
> +	phys_addr_t pt_phys, phys = 0;
> +	u32 dte, pte;
> +	u32 *page_table;
> +
> +	spin_lock_irqsave(&vsi_domain->dt_lock, flags);

No locking should be here. Drivers are supposed to use cmpxchg to set
the new tables to avoid races, however there is complexity around the
cache flushing that this locking solves.

IDK, you might be better to use the new iommupt stuff since all these
algorithms including the complicated lockless cache flushing
optmization are sorted out there.

https://lore.kernel.org/linux-iommu/0-v3-a93aab628dbc+521-iommu_pt_jgg@nvidia.com/

> +	dte_index = vsi_iova_dte_index(iova);
> +	dte_addr = &vsi_domain->dt[dte_index];
> +	dte = *dte_addr;
> +	if (vsi_dte_is_pt_valid(dte))
> +		goto done;
> +
> +	page_table = (u32 *)get_zeroed_page(GFP_ATOMIC | GFP_DMA32);
> +	if (!page_table)
> +		return ERR_PTR(-ENOMEM);

Don't use get_zeroed_page for page table memory.

> +
> +	pt_dma = dma_map_single(dma_dev, page_table, SPAGE_SIZE, DMA_TO_DEVICE);
> +	if (dma_mapping_error(dma_dev, pt_dma)) {
> +		dev_err(dma_dev, "DMA mapping error while allocating page table\n");
> +		free_page((unsigned long)page_table);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	dte = vsi_mk_dte(pt_dma);
> +	*dte_addr = dte;
> +
> +	vsi_table_flush(vsi_domain, pt_dma, NUM_PT_ENTRIES);
> +	vsi_table_flush(vsi_domain,
> +			vsi_domain->dt_dma + dte_index * sizeof(u32), 1);

Double flushing again.

> +static int vsi_iommu_map_iova(struct vsi_iommu_domain *vsi_domain, u32 *pte_addr,
> +			      dma_addr_t pte_dma, dma_addr_t iova,
> +			      phys_addr_t paddr, size_t size, int prot)
> +{
> +	unsigned int pte_count;
> +	unsigned int pte_total = size / SPAGE_SIZE;
> +	phys_addr_t page_phys;
> +
> +	assert_spin_locked(&vsi_domain->dt_lock);
> +
> +	for (pte_count = 0; pte_count < pte_total; pte_count++) {
> +		u32 pte = pte_addr[pte_count];
> +
> +		if (vsi_pte_is_page_valid(pte))
> +			goto unwind;
> +
> +		pte_addr[pte_count] = vsi_mk_pte(paddr, prot);

So why is this:

#define VSI_IOMMU_PGSIZE_BITMAP 0x007ff000

If the sizes don't become encoded in the PTE? The bits beyond 4k
should reflect actual ability to store those sizes in PTEs, eg using
contiguous bits or something.

> +		paddr += SPAGE_SIZE;
> +	}
> +
> +	vsi_table_flush(vsi_domain, pte_dma, pte_total);
> +
> +	return 0;
> +unwind:
> +	/* Unmap the range of iovas that we just mapped */
> +	vsi_iommu_unmap_iova(vsi_domain, pte_addr, pte_dma,
> +			     pte_count * SPAGE_SIZE);
> +
> +	iova += pte_count * SPAGE_SIZE;
> +	page_phys = vsi_pte_page_address(pte_addr[pte_count]);
> +	pr_err("iova: %pad already mapped to %pa cannot remap to phys: %pa prot: %#x\n",
> +	       &iova, &page_phys, &paddr, prot);

No pr_errs prints on normal errors.

> +static void vsi_iommu_detach_device(struct iommu_domain *domain,
> +				    struct device *dev)
> +{
> +	struct vsi_iommu *iommu;
> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +	unsigned long flags;
> +	int ret;
> +
> +	/* Allow 'virtual devices' (eg drm) to detach from domain */
> +	iommu = vsi_iommu_from_dev(dev);
> +	if (WARN_ON(!iommu))
> +		return;
> +
> +	dev_dbg(dev, "Detaching from iommu domain\n");
> +
> +	if (!iommu->domain)
> +		return;
> +
> +	spin_lock_irqsave(&vsi_domain->iommus_lock, flags);
> +	list_del_init(&iommu->node);
> +	spin_unlock_irqrestore(&vsi_domain->iommus_lock, flags);

The list del should probably be after the vsi_iommu_disable()? We
expect invalidations to continue to keep the IOTLB consistent until
the HW is no longer walking the page table.

> +static struct iommu_device *vsi_iommu_probe_device(struct device *dev)
> +{
> +	struct vsi_iommudata *data;
> +	struct vsi_iommu *iommu;
> +
> +	data = dev_iommu_priv_get(dev);
> +	if (!data)
> +		return ERR_PTR(-ENODEV);
> +
> +	iommu = vsi_iommu_from_dev(dev);
> +
> +	pr_info("%s,%d, consumer : %s, supplier : %s\n",
> +		__func__, __LINE__, dev_name(dev), dev_name(iommu->dev));

No prints

> +	/*
> +	 * link will free by platform_device_del(master) via
> +	 * BUS_NOTIFY_REMOVED_DEVICE
> +	 */
> +	data->link = device_link_add(dev, iommu->dev,
> +				     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +
> +	/* set max segment size for dev, needed for single chunk map */
> +	if (!dev->dma_parms)
> +		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
> +	if (!dev->dma_parms)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));

I'm not sure this should be in an iommu driver??? Doesn't dma-iommu.c
deal with this stuff

> +static void vsi_iommu_release_device(struct device *dev)
> +{
> +	struct vsi_iommudata *data = dev_iommu_priv_get(dev);
> +
> +	device_link_del(data->link);

Leaking data..

> +static int vsi_iommu_of_xlate(struct device *dev,
> +			      const struct of_phandle_args *args)
> +{
> +	struct platform_device *iommu_dev;
> +	struct vsi_iommudata *data;
> +
> +	data = devm_kzalloc(dma_dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	dev_info(dev, "%s,%d\n", __func__, __LINE__);
> +	iommu_dev = of_find_device_by_node(args->np);
> +
> +	data->iommu = platform_get_drvdata(iommu_dev);
> +
> +	dev_iommu_priv_set(dev, data);

Can you use iommu_fwspec_add_ids() instead of this?

The only thing 'data' is doing here is to pass the iommu_dev, it is
much better if you can get that from the fwspec in probe, like say ARM
does it:

	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);

	smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);

And then don't allocate memory in the of_xlate.

> +static struct iommu_ops vsi_iommu_ops = {
> +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
> +	.probe_device = vsi_iommu_probe_device,
> +	.release_device = vsi_iommu_release_device,
> +	.device_group = generic_single_device_group,
> +	.pgsize_bitmap = VSI_IOMMU_PGSIZE_BITMAP,

move pgsize_bitmap to alloc paging


> +static int vsi_iommu_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct vsi_iommu *iommu;
> +	struct resource *res;
> +	int num_res = pdev->num_resources;
> +	int err, i;
> +
> +	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
> +	if (!iommu)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, iommu);

This should be done last after the function can't fail

> +
> +	iommu->group = iommu_group_alloc();
> +	if (IS_ERR(iommu->group)) {
> +		err = PTR_ERR(iommu->group);
> +		goto err_unprepare_clocks;
> +	}

This should not be in iommu drivers. I'm guessing you want
generic_single_device_group() ?

> +	/*
> +	 * use the first registered sysmmu device for performing
> +	 * dma mapping operations on iommu page tables (cpu cache flush)
> +	 */
> +	if (!dma_dev)
> +		dma_dev = &pdev->dev;

Huh? This is racey, and why? What is the reason not to use the current
device always? Put the dev in the iommu_domain during
domain_alloc_paging and get it from  dev->iommu->iommu_dev->dev.

> +
> +	pm_runtime_enable(dev);
> +
> +	err = iommu_device_sysfs_add(&iommu->iommu, dev, NULL, dev_name(dev));
> +	if (err)
> +		goto err_put_group;
> +
> +	err = iommu_device_register(&iommu->iommu, &vsi_iommu_ops, dev);
> +	if (err)
> +		goto err_remove_sysfs;

Register should usually be last.

> +	for (i = 0; i < iommu->num_irq; i++) {
> +		int irq = platform_get_irq(pdev, i);
> +
> +		if (irq < 0)
> +			return irq;
> +
> +		err = devm_request_irq(iommu->dev, irq, vsi_iommu_irq,
> +				       IRQF_SHARED, dev_name(dev), iommu);
> +		if (err)
> +			goto err_unregister;
> +	}

Why allocate interrupts after registration?

Jason

