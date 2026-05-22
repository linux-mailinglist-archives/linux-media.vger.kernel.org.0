Return-Path: <linux-media+bounces-62558-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOI7HjDfD2rQQwYAu9opvQ
	(envelope-from <linux-media+bounces-62558-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 06:44:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DFD5AEBF7
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 06:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 170023022607
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 04:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8C035675E;
	Fri, 22 May 2026 04:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+4OywB6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67555258EFF;
	Fri, 22 May 2026 04:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779424782; cv=none; b=O6GWGZWtykF1DNu9NDj8iabZodDOuFw1WTQq2TPDVIMUjIrpb8dBmQ1DBQbPZVBcQBlLBGFrL8xKch2DhqLrDbk1JTDwU5hwLR5znowYhsFbZQYsWZ7JmX5+STb79FzCe9mHnu6mMort39ojTyzgG/QptwwLK7QSXVYfqMuoo2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779424782; c=relaxed/simple;
	bh=+dsgstTkfexVAOyHm1HibhXH9dt1eyexZo4iqkSC7jc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jHSVQJKhuJ+3CsVccglVk25LpDD7YrvsPgKDai5H8fxXTgp95n4dcnzHUhjlcoZTaelEjRouiHNq5tb3I4YU6EbTxamfgglLVajKF7SIyh2JVgaVTvd4SH0ZgeFSwmSo6Nml3x9sPeYbZWyIV8vxpg9jTTXGibBtmUQ0T9PboYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+4OywB6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E9D1F000E9;
	Fri, 22 May 2026 04:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779424781;
	bh=4R/ga3Po6rMY7/TfHCvcJNg7OZHy4BvhXq7wh2Ys9tU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=V+4OywB6Ij3jKYq4K1WppfdDnOGW/1nY5Q2/4SqgmZPpjVOBYUPJ+fTM2TVkk2e7f
	 MqQa0iuxW0neznyC2TdIWYM3VY+2AOBipiBvrDJk3zrJW56SjCy01RNAIJ7sKd/nIC
	 Qsna44aTeQ33uTJ5F8NfW6w7tqVUrOy84giORHypM4QjxS1pxiC2Oa9v+NWqa9FD+b
	 47gLjc36mPUK08epy/u9JaH5OaWahb/5Z8x/j+m21rtXOfj71sJ83rT6dF3VSxbzUf
	 aWpsvqN5tVEPYq0uB40EFHbnFS9d8aHalB+h7XUfZyS9JFcnA4RycYNrsTZvJ7jesF
	 Q/q1MiTqGtUaw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com, m.szyprowski@samsung.com,
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev,
	ptesarik@suse.com, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
In-Reply-To: <20260521175420.GA7702@ziepe.ca>
References: <20260325192352.437608-2-jiri@resnulli.us>
 <yq5atst6ywbl.fsf@kernel.org>
 <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
 <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
 <20260421121004.GA3611611@ziepe.ca> <yq5aik9jcpzm.fsf@kernel.org>
 <20260424225514.GE804026@ziepe.ca> <20260426130531.GF804026@ziepe.ca>
 <yq5azf1s6aic.fsf@kernel.org> <20260521175420.GA7702@ziepe.ca>
Date: Fri, 22 May 2026 10:09:26 +0530
Message-ID: <yq5aqzn45a81.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62558-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aneesh.kumar@kernel.org,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D0DFD5AEBF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Thu, May 21, 2026 at 09:05:39PM +0530, Aneesh Kumar K.V wrote:
>> I am wondering whether this is better
>> 
>> static inline dma_addr_t dma_direct_map_phys(struct device *dev,
>> 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
>> 		unsigned long attrs, bool flush)
>> {
>> 	dma_addr_t dma_addr;
>> 
>> 	/*
>> 	 * For a device requiring unencrypted DMA, MMIO memory is treated
>> 	 * as shared.
>> 	 */
>> 	if (force_dma_unencrypted(dev) && (attrs & DMA_ATTR_MMIO))
>> 		attrs |= DMA_ATTR_CC_SHARED;
>
> It is an option, I would be happier if we went and fixed the few
> callers to properly pass the shared. CC did this with the
> pgprot_decrypted() stuff, same reasoning:
>
> diff --git a/block/blk-mq-dma.c b/block/blk-mq-dma.c
> index bfdb9ed7074116..e77f6404caa3db 100644
> --- a/block/blk-mq-dma.c
> +++ b/block/blk-mq-dma.c
> @@ -90,7 +90,7 @@ static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
>  	unsigned int attrs = 0;
>  
>  	if (iter->p2pdma.map == PCI_P2PDMA_MAP_THRU_HOST_BRIDGE)
> -		attrs |= DMA_ATTR_MMIO;
> +		attrs |= iter->p2pdma.mem->dma_mapping_flags;
>  
>  	iter->addr = dma_map_phys(dma_dev, vec->paddr, vec->len,
>  			rq_dma_dir(req), attrs);
> @@ -115,7 +115,7 @@ static bool blk_rq_dma_map_iova(struct request *req, struct device *dma_dev,
>  	iter->len = dma_iova_size(state);
>  
>  	if (iter->p2pdma.map == PCI_P2PDMA_MAP_THRU_HOST_BRIDGE)
> -		attrs |= DMA_ATTR_MMIO;
> +		attrs |= iter->p2pdma.mem->dma_mapping_flags;
>  
>  	do {
>  		error = dma_iova_link(dma_dev, state, vec->paddr, mapped,
> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
> index 794acff2546a34..96022fadc48245 100644
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -147,7 +147,7 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
>  			ret = dma_iova_link(attach->dev, dma->state,
>  					    phys_vec[i].paddr, 0,
>  					    phys_vec[i].len, dir,
> -					    DMA_ATTR_MMIO);
> +					    provider->dma_mapping_flags);
>  			if (ret)
>  				goto err_unmap_dma;
>  
> @@ -155,7 +155,7 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
>  		} else {
>  			addr = dma_map_phys(attach->dev, phys_vec[i].paddr,
>  					    phys_vec[i].len, dir,
> -					    DMA_ATTR_MMIO);
> +					    provider->dma_mapping_flags);
>  			ret = dma_mapping_error(attach->dev, addr);
>  			if (ret)
>  				goto err_unmap_dma;
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index 7c898542af8d5e..e4229b4d35c767 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -282,6 +282,8 @@ int pcim_p2pdma_init(struct pci_dev *pdev)
>  			continue;
>  
>  		p2p->mem[i].owner = &pdev->dev;
> +		p2p->mem[i].dma_mapping_flags =
> +			DMA_ATTR_MMIO | DMA_ATTR_CC_SHARED;
>  		p2p->mem[i].bus_offset =
>  			pci_bus_address(pdev, i) - pci_resource_start(pdev, i);
>  	}
> diff --git a/include/linux/pci-p2pdma.h b/include/linux/pci-p2pdma.h
> index 873de20a224759..402dc5e5d62b0a 100644
> --- a/include/linux/pci-p2pdma.h
> +++ b/include/linux/pci-p2pdma.h
> @@ -21,10 +21,12 @@ struct scatterlist;
>   *
>   * A p2pdma provider is a range of MMIO address space available to the CPU.
>   * @owner: Device to which this provider belongs.
> + * @dma_mapping_flags: DMA attributes to use for host bridge mappings.
>   * @bus_offset: Bus offset for p2p communication.
>   */
>  struct p2pdma_provider {
>  	struct device *owner;
> +	unsigned long dma_mapping_flags;
>  	u64 bus_offset;
>  };
>  
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 5955f2f0c83db1..c3f445acddf873 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -811,7 +811,7 @@ dma_addr_t hmm_dma_map_pfn(struct device *dev, struct hmm_dma_map *map,
>  	case PCI_P2PDMA_MAP_NONE:
>  		break;
>  	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> -		attrs |= DMA_ATTR_MMIO;
> +		attrs |= p2pdma_state->mem->dma_mapping_flags;
>  		pfns[idx] |= HMM_PFN_P2PDMA;
>  		break;
>  	case PCI_P2PDMA_MAP_BUS_ADDR:

Can I convert this as an independent patch with your SOB?

-aneesh

