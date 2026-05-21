Return-Path: <linux-media+bounces-62539-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEskLNZGD2ptIgYAu9opvQ
	(envelope-from <linux-media+bounces-62539-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 19:54:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E07C5AAA18
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 19:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9C30300382F
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 17:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC7D3EFD14;
	Thu, 21 May 2026 17:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="aTBaSejp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6E33E1719
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386064; cv=none; b=VY5K472rA3fLbWHcxTbQl6BEdiJ80PvMmE6eDDOXhqkhrPcrgc2NiIADuC8DqdQipzD50AJCGP/PQGo+XcggGnVdU1VaXKj0z2HDgiUlpRAvFnSTZ+DLfQ/byvrx89WQ7AK3rCFq52SeZ7lbtk/qIa4xS/EvGGH53q/hlrCSnzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386064; c=relaxed/simple;
	bh=n2LNy9P3hRcmCt1g1+q+u9azF2YECAgiA8jjB7pwYI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+11iu6wQ9hz3Fk1y4ra0AgZ3SyWYMShAbfzCJuPffDIOoltyh5zZ6u9wYOZY/46XTRYNUw1fol/vs2ZLueTkUXi4SY5Np8GDfVj3z5GCXQLIs4JTjAk8GkY75V0h04hmWOO9bN5geEgnCQXkuIDwD57BDV5pgKxk3TFzVhME8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=aTBaSejp; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8b5cda2dab9so72053776d6.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 10:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779386062; x=1779990862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EC6XWlOYSm7qj75HyHmp0T60BsFS50VL7KHJNUynWLU=;
        b=aTBaSejplNI8Uwuo+z562d97c38z6DwKLQ/I9NSqO5tydjWxCD+B4s94D/vGU10FF5
         3sMH18Brf/Qq1XTkRvxYw9eOuiUAYj+JXCfO3DnNRiWherUc34Wy5KCAYKFET6GcfkLc
         bCgWL5PH2dpC5thD/8ikL1wyDdsTSahu/FPmMXBFuEVvB9fb2eQDqDcYvJc1idAby/pD
         f6M8SPSCVkYAv2KgHpVX6f2hdjForzuxwX6uo9UCG+CdthMMII2vbYQ64OmYPZ5Haim4
         M6vkoICDwezpNASZQyfDqQBDm5NHX8lRUWDPyKA/ZF1trWCuUAGnTgnAd0k4gf4pgKRq
         xPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779386062; x=1779990862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EC6XWlOYSm7qj75HyHmp0T60BsFS50VL7KHJNUynWLU=;
        b=mW7Yad6APA26eUUj+DgqVqCxMm5tpOcGckS2gnT9b8V8bMhqwQLZGJkxTiSV1ORqQ5
         60oxi87s0vi9d/uSGcFSoFKieftQ26hYh1mvd7JisuHFI/CGhcUxLaok3yiYDzYGelkg
         tAViSR7Aybpfo7mruFfISJIqwNAxC6FLzEo0UcsM7MXhJAcA9EnWkvYpdqbFdd83X6Rc
         CU8raNdPtWntQpQuyE2hRtl7YhXxYbrrQkSaA7wXntt921m8wZd0mC5kNEbVNuJkdKfr
         zB5ngVGtdnnE+cFcZ7ZBtEW5zU+8GpUy5Ni/AJNB3Dz6nu8xoPxK1uOSbl5bY7TwpcbB
         n33A==
X-Forwarded-Encrypted: i=1; AFNElJ+16eyvnyv9AdzXmYRUVuMd85J2A3dsG56xXnm0dtxrEYLsVkygUr0B3mno8RwbfX96W0VViSyDK2yfvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/NDFd4afPf2vLO6+LERwaMa0faljw1A9n6WHZSQRN6JfRD3j4
	kG1tujoGo2qAGdWUIBOdOtbmu2O1wp5+uwKf1w+5ilmygHvky3XvlTzY14ZdPqUjG8Q=
X-Gm-Gg: Acq92OGV4940IawVoBzfRtB1HyLvAuYqpuTQGxnOzePN7IsOx3bTacI9LWYXj4SZvop
	PpV8KICElfuX1VD7KsVtEg9H1kN00c9JL5tM2wc22qBtyaz4VcQ8t3ky1Gd+ybqEFGjtd81Zl9V
	MhfZfIFIyCQ76dIpxxoClz0W2lFQ0bCnRPJ1ugYQJUl7RlO/iMu0RNQ21UGtTNVQVEry+Qwp1h5
	05D0/iWbIFmr2oq0BSQVN5EUhoXRq4J9oeecIKSjjNuM1dxdT1tkLom9k3dPkfkxh4lqInXYBzJ
	a3IZErCSR/S6SvpLEFp3Tk6GsuVMbsjM9CEOaw9rOaLbADjmqddJ17y2ync5ONYMXBHw3D3uEoP
	Cb5KAcMINNYEIGOkctEXOHt46GTHx7jIUbl34JFv5BRxAMbfuRa5UVomxCeOzr29XcXbBhX7pt9
	0bmcJHAVPqcNkd1oLo0WyRs7XWS9PpMv8SKcV8And7YRXP1SMcwMQuQH51c0uQV01PMet/IPptT
	104MA==
X-Received: by 2002:a05:6214:1c4e:b0:8ca:1e71:c5fb with SMTP id 6a1803df08f44-8cc6e91f389mr49249796d6.7.1779386061667;
        Thu, 21 May 2026 10:54:21 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc768b6fc2sm11374296d6.6.2026.05.21.10.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:54:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wQ7bA-000000020Ak-1yKK;
	Thu, 21 May 2026 14:54:20 -0300
Date: Thu, 21 May 2026 14:54:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 1/2] dma-mapping: introduce DMA_ATTR_CC_SHARED for
 shared memory
Message-ID: <20260521175420.GA7702@ziepe.ca>
References: <20260325192352.437608-2-jiri@resnulli.us>
 <yq5atst6ywbl.fsf@kernel.org>
 <4qdizkkoeke3cvkcf35upa7p7ick6s654eqlrizmi7ozkw5eze@tnpk2e34xgwl>
 <yq5awly0d504.fsf@kernel.org>
 <tteiecxfqy4k24wnzvp6ocxnuopyhmqtne2xwh5htwldlbzjnp@o6cbzdlurxld>
 <20260421121004.GA3611611@ziepe.ca>
 <yq5aik9jcpzm.fsf@kernel.org>
 <20260424225514.GE804026@ziepe.ca>
 <20260426130531.GF804026@ziepe.ca>
 <yq5azf1s6aic.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5azf1s6aic.fsf@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62539-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:mid,ziepe.ca:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5E07C5AAA18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 09:05:39PM +0530, Aneesh Kumar K.V wrote:
> I am wondering whether this is better
> 
> static inline dma_addr_t dma_direct_map_phys(struct device *dev,
> 		phys_addr_t phys, size_t size, enum dma_data_direction dir,
> 		unsigned long attrs, bool flush)
> {
> 	dma_addr_t dma_addr;
> 
> 	/*
> 	 * For a device requiring unencrypted DMA, MMIO memory is treated
> 	 * as shared.
> 	 */
> 	if (force_dma_unencrypted(dev) && (attrs & DMA_ATTR_MMIO))
> 		attrs |= DMA_ATTR_CC_SHARED;

It is an option, I would be happier if we went and fixed the few
callers to properly pass the shared. CC did this with the
pgprot_decrypted() stuff, same reasoning:

diff --git a/block/blk-mq-dma.c b/block/blk-mq-dma.c
index bfdb9ed7074116..e77f6404caa3db 100644
--- a/block/blk-mq-dma.c
+++ b/block/blk-mq-dma.c
@@ -90,7 +90,7 @@ static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
 	unsigned int attrs = 0;
 
 	if (iter->p2pdma.map == PCI_P2PDMA_MAP_THRU_HOST_BRIDGE)
-		attrs |= DMA_ATTR_MMIO;
+		attrs |= iter->p2pdma.mem->dma_mapping_flags;
 
 	iter->addr = dma_map_phys(dma_dev, vec->paddr, vec->len,
 			rq_dma_dir(req), attrs);
@@ -115,7 +115,7 @@ static bool blk_rq_dma_map_iova(struct request *req, struct device *dma_dev,
 	iter->len = dma_iova_size(state);
 
 	if (iter->p2pdma.map == PCI_P2PDMA_MAP_THRU_HOST_BRIDGE)
-		attrs |= DMA_ATTR_MMIO;
+		attrs |= iter->p2pdma.mem->dma_mapping_flags;
 
 	do {
 		error = dma_iova_link(dma_dev, state, vec->paddr, mapped,
diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 794acff2546a34..96022fadc48245 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -147,7 +147,7 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 			ret = dma_iova_link(attach->dev, dma->state,
 					    phys_vec[i].paddr, 0,
 					    phys_vec[i].len, dir,
-					    DMA_ATTR_MMIO);
+					    provider->dma_mapping_flags);
 			if (ret)
 				goto err_unmap_dma;
 
@@ -155,7 +155,7 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 		} else {
 			addr = dma_map_phys(attach->dev, phys_vec[i].paddr,
 					    phys_vec[i].len, dir,
-					    DMA_ATTR_MMIO);
+					    provider->dma_mapping_flags);
 			ret = dma_mapping_error(attach->dev, addr);
 			if (ret)
 				goto err_unmap_dma;
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 7c898542af8d5e..e4229b4d35c767 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -282,6 +282,8 @@ int pcim_p2pdma_init(struct pci_dev *pdev)
 			continue;
 
 		p2p->mem[i].owner = &pdev->dev;
+		p2p->mem[i].dma_mapping_flags =
+			DMA_ATTR_MMIO | DMA_ATTR_CC_SHARED;
 		p2p->mem[i].bus_offset =
 			pci_bus_address(pdev, i) - pci_resource_start(pdev, i);
 	}
diff --git a/include/linux/pci-p2pdma.h b/include/linux/pci-p2pdma.h
index 873de20a224759..402dc5e5d62b0a 100644
--- a/include/linux/pci-p2pdma.h
+++ b/include/linux/pci-p2pdma.h
@@ -21,10 +21,12 @@ struct scatterlist;
  *
  * A p2pdma provider is a range of MMIO address space available to the CPU.
  * @owner: Device to which this provider belongs.
+ * @dma_mapping_flags: DMA attributes to use for host bridge mappings.
  * @bus_offset: Bus offset for p2p communication.
  */
 struct p2pdma_provider {
 	struct device *owner;
+	unsigned long dma_mapping_flags;
 	u64 bus_offset;
 };
 
diff --git a/mm/hmm.c b/mm/hmm.c
index 5955f2f0c83db1..c3f445acddf873 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -811,7 +811,7 @@ dma_addr_t hmm_dma_map_pfn(struct device *dev, struct hmm_dma_map *map,
 	case PCI_P2PDMA_MAP_NONE:
 		break;
 	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
-		attrs |= DMA_ATTR_MMIO;
+		attrs |= p2pdma_state->mem->dma_mapping_flags;
 		pfns[idx] |= HMM_PFN_P2PDMA;
 		break;
 	case PCI_P2PDMA_MAP_BUS_ADDR:

