Return-Path: <linux-media+bounces-31594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E41EAA744A
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EABAD4A2F05
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 13:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E5B255F49;
	Fri,  2 May 2025 13:59:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DF1255F25;
	Fri,  2 May 2025 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194390; cv=none; b=T4mT3kYJ6VEn1aqjUPAk0BQshf6aut3s3uKhtzSYyVh4ET08cuHGmrFZJXrG84xlc+BJhwxwjzp+mFEkZp03Tm1z8SH+D+W0iKqDOv9s0gaEkfBdbRcGVEU7vB1UaKPW8T+pMdVomdhQl1pR3qnFeJpfrRuV1BwB8bYIKNoE1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194390; c=relaxed/simple;
	bh=hG3hp6agnM+x8dzzswp4S2fUNWXzPjMHX8B5indITHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJcnmu5dPiAfxt4pPZLka0auZcGF8Cm8i0VjWWHPzffQaGjech1uvOEoX3F7GjSns4DnHHSLeM9cWYkZu3TDAoLA3QkKOPcKJ/1X/+sOwONvKS1I78bckLg7klFyGEObGUqEeyqM4PNoLx6qkGqaL1x3vIcfG7B1Zriy0lPAWr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9830A1688;
	Fri,  2 May 2025 06:59:38 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D14073F673;
	Fri,  2 May 2025 06:59:41 -0700 (PDT)
Message-ID: <6a33e85f-6b60-4260-993d-974dd29cf8e6@arm.com>
Date: Fri, 2 May 2025 14:59:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/14] tee: implement protected DMA-heap
To: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-7-jens.wiklander@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250502100049.1746335-7-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2025 10:59 am, Jens Wiklander wrote:
> Implement DMA heap for protected DMA-buf allocation in the TEE
> subsystem.
> 
> Restricted memory refers to memory buffers behind a hardware enforced
> firewall. It is not accessible to the kernel during normal circumstances
> but rather only accessible to certain hardware IPs or CPUs executing in
> higher or differently privileged mode than the kernel itself. This
> interface allows to allocate and manage such protected memory buffers
> via interaction with a TEE implementation.
> 
> The protected memory is allocated for a specific use-case, like Secure
> Video Playback, Trusted UI, or Secure Video Recording where certain
> hardware devices can access the memory.
> 
> The DMA-heaps are enabled explicitly by the TEE backend driver. The TEE
> backend drivers needs to implement protected memory pool to manage the
> protected memory.

[...]> +static struct sg_table *
> +tee_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> +		     enum dma_data_direction direction)
> +{
> +	struct tee_heap_attachment *a = attachment->priv;
> +	int ret;
> +
> +	ret = dma_map_sgtable(attachment->dev, &a->table, direction,
> +			      DMA_ATTR_SKIP_CPU_SYNC);

If the memory is inaccessible to the kernel, what does this DMA mapping 
even mean? What happens when it tries to perform cache maintenance or 
bounce-buffering on inaccessible memory (which presumably doesn't even 
have a VA if it's not usable as normal kernel memory)?

If we're simply housekeeping the TEE's resources on its behalf, and 
giving it back some token to tell it which resource to go do its thing 
with, then that's really not "DMA" as far as the kernel is concerned.

[...]
> +static int protmem_pool_op_static_alloc(struct tee_protmem_pool *pool,
> +					struct sg_table *sgt, size_t size,
> +					size_t *offs)
> +{
> +	struct tee_protmem_static_pool *stp = to_protmem_static_pool(pool);
> +	phys_addr_t pa;
> +	int ret;
> +
> +	pa = gen_pool_alloc(stp->gen_pool, size);
> +	if (!pa)
> +		return -ENOMEM;
> +
> +	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
> +	if (ret) {
> +		gen_pool_free(stp->gen_pool, pa, size);
> +		return ret;
> +	}
> +
> +	sg_set_page(sgt->sgl, phys_to_page(pa), size, 0);

Where does "pa" come from here (i.e. what's the provenance of the 
initial "paddr" passed to tee_protmem_static_pool_alloc())? In general 
we can't call {phys,pfn}_to_page() an arbitrary addresses without 
checking pfn_valid() first. A bogus address might even crash 
__pfn_to_page() itself under CONFIG_SPARSEMEM.

Thanks,
Robin.

> +	*offs = pa - stp->pa_base;
> +
> +	return 0;
> +}

