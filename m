Return-Path: <linux-media+bounces-58352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMH3AO6812mdSQgAu9opvQ
	(envelope-from <linux-media+bounces-58352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:51:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6303CC379
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 16:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60675300EAAF
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 14:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2294E3264FA;
	Thu,  9 Apr 2026 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="OMrhomFc"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2709115624B;
	Thu,  9 Apr 2026 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746175; cv=pass; b=cj34D06KMkwH0vNdRFE2KwBfVr5OtibTdXagFxG8Dr528pFH84Dka2JfBCCUmsQwN5XCEBXr9xsh2kKxlmhRQh7k317J1ixvAGFVb9QGhlUu6bqHqXDLQ+6zI1xJq/RHlHn1q4v45pamMX3Big4DPnPKqmIcDPut/GEOblaHFH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746175; c=relaxed/simple;
	bh=3zGpVaERqBzMwoPtmMop8EvJ9glewZiiHG0yNfu/iUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KauN9OX2H2jd0ve/5Klexo7ATfZXA0aczY/FTvZZWNqxzfAhoaNN3PudB5FPX3AebO/ppPj9pG/LpWmDt8L32VRfbQoY4urInFgEdOiX7LV8xH1bAfT1UnUNb9U+mOEO/UtoRM1qbO5U6taI44j3jQicrLFdmuEr++r46c0GQYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=OMrhomFc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1775746150; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FyjrxfSs10DNUXtp2oEHYFs+x2xKQ8PL/bNjEjVnYvjY/VhrzKYBHJX+axnbY+zEAVUkHcdpVuYnJw4Q/g39sk3s5OeFvw0P2FLS8d/QomWcda8gTRlqAepJmOMsRTSHUD/vz3P/G1aOSR4aPu789dzVIabWNDoY0XViC5aua+4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775746150; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CR9mAVgxszVB53Zvua2wkg88/t3SzJ3xM3rQRaf39VM=; 
	b=aO3NY/k4Vpuq1VWM8zTwvg+eQzaYOyzzebFTlxTGc5Qn8cjfw3id3CsCA4pCNeFrIe0O5zXzzyOFf3BGsUT+V3bADfyUKGSGX8c/OkKkVMJfg0J2zJcpfK/knx3JqYskMN6g8o+1U/qOsGIzt4TwjRvD7DxEuw5MyNAXwpDeZKE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775746150;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CR9mAVgxszVB53Zvua2wkg88/t3SzJ3xM3rQRaf39VM=;
	b=OMrhomFcpM42/enJAPw7i8P9Z0b8+sCp4adXXJMG2Lo15WJzx5/4y927au7K32Hv
	HhlMPripihSipxuNl/+Fup3Dao8Jh15qGEwNKY46ICj/Kj7MFkBYNoB1eNG7JZlkr9P
	kS35stIgCPM6UfuCNgza+5cz/5s+rSd5Jlf2a4Dk=
Received: by mx.zohomail.com with SMTPS id 177574614723085.36204229766054;
	Thu, 9 Apr 2026 07:49:07 -0700 (PDT)
Message-ID: <040f65ea-2559-4186-b733-3dc59a1ecc0b@collabora.com>
Date: Thu, 9 Apr 2026 10:49:05 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] media: rkvdec: Add multicore IOMMU support
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
 <20260409-rkvdec-multicore-v1-7-62b316abf0f7@collabora.com>
 <517dc6e9de0e284b3dc22952d9479616e6c8ec62.camel@collabora.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <517dc6e9de0e284b3dc22952d9479616e6c8ec62.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58352-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5F6303CC379
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nicolas,

On 4/9/26 10:19, Nicolas Dufresne wrote:
> Le jeudi 09 avril 2026 à 09:50 -0400, Detlev Casanova a écrit :
>> As each core has its own IOMMU core, buffers must be mapped in each
>> core's IOMMU so that any run() call can use any core without having to
>> remap everything.
>>
>> To do that, we use rockchip iommu domain's iommu devices list.
>> With that, one IOMMU domain can be mapped on multiple devices, meaning
>> that each call to iommu_map() will flush the new mapping on all devices
>> in the list.
>>
>> The IOMMU domain that will have all devices in its list is the first
>> core's default domain.
>>
>> Another domain cannot be used because VB2 allocates buffers through the
>> DMA engine, which uses iommu_get_dma_domain() to find the domain to map
>> buffers through.
>>
>> The IOMMU restore function can still work as before, but needs to be more
>> explicit in what domain to attach the device to.
>> That is because detaching the empty domain will reattach the core's default
>> domain, which is wrong (except for the first "main" core).
>>
>> The RCB temporary buffers are allocated in a dedicated SRAM, each
>> core has its own SRAM, so the mapping for each core's SRAM is added in the
>> global domain.
>>
>> Everything else is mapped through the first core's default domain, making
>> the driver write the mappings on both IOMMU cores.
> Just raising an issue with the patch ordering here. I'm worried in a git bisect,
> the driver will be broken until we apply this last patch. Can we make sure that
> the driver bisects ? (or tell me if I'm wrong)
No, you're right. That's also why I mentioned it in the cover letter. 
This commit is also not too big, so I'll merge the last 3 commits and 
adapt the commit message to keep the information from the 3 (the commit 
messages are why I wanted to keep them separate, but there is no good 
way to keep them that way)

Detlev.
>
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>   .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    | 21 ++++++-------
>>   .../media/platform/rockchip/rkvdec/rkvdec-rcb.h    |  6 ++--
>>   drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 35 +++++++++++++++++-----
>>   drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  2 +-
>>   4 files changed, 44 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
>> index 190fb7438e8c..977e37cf209b 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
>> @@ -57,7 +57,7 @@ bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx)
>>   	return ret;
>>   }
>>   
>> -void rkvdec_free_rcb(struct rkvdec_core *core)
>> +void rkvdec_free_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core)
>>   {
>>   	struct rkvdec_rcb_config *cfg = core->rcb_config;
>>   	unsigned long virt_addr;
>> @@ -76,12 +76,12 @@ void rkvdec_free_rcb(struct rkvdec_core *core)
>>   		case RKVDEC_ALLOC_SRAM:
>>   			virt_addr = (unsigned long)cfg->rcb_bufs[i].cpu;
>>   
>> -			if (core->iommu_domain)
>> -				iommu_unmap(core->iommu_domain, virt_addr, rcb_size);
>> +			if (rkvdec->iommu_global_domain)
>> +				iommu_unmap(rkvdec->iommu_global_domain, virt_addr, rcb_size);
>>   			gen_pool_free(core->sram_pool, virt_addr, rcb_size);
>>   			break;
>>   		case RKVDEC_ALLOC_DMA:
>> -			dma_free_coherent(core->dev,
>> +			dma_free_coherent(rkvdec->main_core->dev,
>>   					  rcb_size,
>>   					  cfg->rcb_bufs[i].cpu,
>>   					  cfg->rcb_bufs[i].dma);
>> @@ -97,7 +97,8 @@ void rkvdec_free_rcb(struct rkvdec_core *core)
>>   	core->rcb_config = NULL;
>>   }
>>   
>> -int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
>> +int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core,
>> +			u32 width, u32 height,
>>   			const struct rcb_size_info *size_info,
>>   			size_t rcb_count)
>>   {
>> @@ -132,7 +133,7 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
>>   
>>   		/* Try allocating an SRAM buffer */
>>   		if (core->sram_pool) {
>> -			if (core->iommu_domain)
>> +			if (rkvdec->iommu_global_domain)
>>   				rcb_size = ALIGN(rcb_size, SZ_4K);
>>   
>>   			cpu = gen_pool_dma_zalloc_align(core->sram_pool,
>> @@ -142,11 +143,11 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
>>   		}
>>   
>>   		/* If an IOMMU is used, map the SRAM address through it */
>> -		if (cpu && core->iommu_domain) {
>> +		if (cpu && rkvdec->iommu_global_domain) {
>>   			unsigned long virt_addr = (unsigned long)cpu;
>>   			phys_addr_t phys_addr = dma;
>>   
>> -			ret = iommu_map(core->iommu_domain, virt_addr, phys_addr,
>> +			ret = iommu_map(rkvdec->iommu_global_domain, virt_addr, phys_addr,
>>   					rcb_size, IOMMU_READ | IOMMU_WRITE, 0);
>>   			if (ret) {
>>   				gen_pool_free(core->sram_pool,
>> @@ -166,7 +167,7 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
>>   ram_fallback:
>>   		/* Fallback to RAM */
>>   		if (!cpu) {
>> -			cpu = dma_alloc_coherent(core->dev,
>> +			cpu = dma_alloc_coherent(rkvdec->main_core->dev,
>>   						 rcb_size,
>>   						 &dma,
>>   						 GFP_KERNEL);
>> @@ -189,7 +190,7 @@ int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
>>   	return 0;
>>   
>>   err_alloc:
>> -	rkvdec_free_rcb(core);
>> +	rkvdec_free_rcb(rkvdec, core);
>>   
>>   	return ret;
>>   }
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
>> index a12af9b7dc2b..d1149afe7fda 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include <linux/types.h>
>>   
>> +struct rkvdec_dev;
>>   struct rkvdec_ctx;
>>   struct rkvdec_core;
>>   
>> @@ -21,11 +22,12 @@ struct rcb_size_info {
>>   	enum rcb_axis axis;
>>   };
>>   
>> -int rkvdec_allocate_rcb(struct rkvdec_core *core, u32 width, u32 height,
>> +int rkvdec_allocate_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core,
>> +			u32 width, u32 height,
>>   			const struct rcb_size_info *size_info,
>>   			size_t rcb_count);
>>   dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id);
>>   size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id);
>>   int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
>>   bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx);
>> -void rkvdec_free_rcb(struct rkvdec_core *core);
>> +void rkvdec_free_rcb(struct rkvdec_dev *rkvdec, struct rkvdec_core *core);
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index c2818f1575ef..2930e9b64906 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -1204,9 +1204,9 @@ static void rkvdec_device_run(void *priv)
>>   	}
>>   
>>   	if (!rkvdec_rcb_buf_validate_size(ctx)) {
>> -		rkvdec_free_rcb(ctx->core);
>> +		rkvdec_free_rcb(ctx->dev, ctx->core);
>>   
>> -		ret = rkvdec_allocate_rcb(ctx->core,
>> +		ret = rkvdec_allocate_rcb(ctx->dev, ctx->core,
>>   					  ctx->decoded_fmt.fmt.pix_mp.width,
>>   					  ctx->decoded_fmt.fmt.pix_mp.height,
>>   					  ctx->dev->variant->rcb_sizes,
>> @@ -1486,6 +1486,7 @@ static void rkvdec_v4l2_cleanup(struct rkvdec_dev *rkvdec)
>>   
>>   static void rkvdec_iommu_restore(struct rkvdec_core *core)
>>   {
>> +	int ret;
>>   	if (core->empty_domain) {
>>   		/*
>>   		 * To rewrite mapping into the attached IOMMU core, attach a new empty domain that
>> @@ -1494,8 +1495,14 @@ static void rkvdec_iommu_restore(struct rkvdec_core *core)
>>   		 * This is safely done in this interrupt handler to make sure no memory get mapped
>>   		 * through the IOMMU while the empty domain is attached.
>>   		 */
>> -		iommu_attach_device(core->empty_domain, core->dev);
>> +		iommu_detach_device(core->curr_ctx->dev->iommu_global_domain, core->dev);
>> +		ret = iommu_attach_device(core->empty_domain, core->dev);
>> +		if (ret)
>> +			dev_warn(core->dev, "Cannot attach empty domain: %d\n", ret);
>>   		iommu_detach_device(core->empty_domain, core->dev);
>> +		ret = iommu_attach_device(core->curr_ctx->dev->iommu_global_domain, core->dev);
>> +		if (ret)
>> +			dev_warn(core->dev, "Cannot attach global domain: %d\n", ret);
>>   	}
>>   }
>>   
>> @@ -1858,6 +1865,8 @@ static int rkvdec_probe(struct platform_device *pdev)
>>   
>>   	core = &rkvdec->cores[rkvdec->core_count++];
>>   
>> +	core->id = rkvdec->core_count - 1;
>> +
>>   	platform_set_drvdata(pdev, rkvdec);
>>   	core->dev = &pdev->dev;
>>   	INIT_DELAYED_WORK(&core->watchdog_work, rkvdec_watchdog_func);
>> @@ -1883,12 +1892,24 @@ static int rkvdec_probe(struct platform_device *pdev)
>>   			return PTR_ERR(core->link);
>>   	}
>>   
>> -	core->iommu_domain = iommu_get_domain_for_dev(&pdev->dev);
>> -	if (core->iommu_domain) {
>> +	if (iommu_get_domain_for_dev(&pdev->dev)) {
>>   		core->empty_domain = iommu_paging_domain_alloc(core->dev);
>>   
>> -		if (!core->empty_domain)
>> +		if (IS_ERR(core->empty_domain))
>>   			dev_warn(core->dev, "cannot alloc new empty domain\n");
>> +
>> +		if (!rkvdec->iommu_global_domain) {
>> +			rkvdec->iommu_global_domain = iommu_get_domain_for_dev(core->dev);
>> +
>> +			if (IS_ERR(rkvdec->iommu_global_domain)) {
>> +				rkvdec->iommu_global_domain = NULL;
>> +				dev_warn_once(core->dev, "cannot alloc new global domain\n");
>> +			}
>> +		}
>> +
>> +		ret = iommu_attach_device(rkvdec->iommu_global_domain, core->dev);
>> +		if (ret)
>> +			dev_warn(core->dev, "cannot attach global domain to core %d\n", core->id);
>>   	}
>>   
>>   	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
>> @@ -1961,7 +1982,7 @@ static void rkvdec_remove(struct platform_device *pdev)
>>   		if (rkvdec->cores[i].empty_domain)
>>   			iommu_domain_free(rkvdec->cores[i].empty_domain);
>>   
>> -		rkvdec_free_rcb(&rkvdec->cores[i]);
>> +		rkvdec_free_rcb(rkvdec, &rkvdec->cores[i]);
>>   	}
>>   }
>>   
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> index 4f042a367dc0..ccd766b220c7 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> @@ -135,7 +135,6 @@ struct rkvdec_core {
>>   	void __iomem *link;
>>   	struct delayed_work watchdog_work;
>>   	struct gen_pool *sram_pool;
>> -	struct iommu_domain *iommu_domain;
>>   	struct iommu_domain *empty_domain;
>>   	struct rkvdec_rcb_config *rcb_config;
>>   	struct rkvdec_ctx *curr_ctx;
>> @@ -155,6 +154,7 @@ struct rkvdec_dev {
>>   	unsigned int available_core_count;
>>   	spinlock_t cores_lock; /* serializes core list access */
>>   	struct rkvdec_core *main_core;
>> +	struct iommu_domain *iommu_global_domain;
>>   };
>>   
>>   struct rkvdec_ctx {


