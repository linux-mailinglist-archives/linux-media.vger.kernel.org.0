Return-Path: <linux-media+bounces-20303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7EE9AFD6F
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 10:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91EBC280C48
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 08:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA3C1D4325;
	Fri, 25 Oct 2024 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="0NR+U2yC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027761C174E
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846773; cv=none; b=XyGGwAplYMbUwDIDcOqMCxZMgsjtMG2VG4rBivYDo/wgKA/gGX6CxLsU509eFcGhhI/fqKsag/+0nhfD/4OqlN+b88glwDHjUbbRcRwCAd9vvB7g5YEcLF/wLALDWkzu4jpHUZ9AdeRmCVYRnA2OfCVHnrOAS2YK2bh9wstLQ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846773; c=relaxed/simple;
	bh=LTTVrTyj+/s90lN9O7augaVWjCr6lCdoimAJoCUctr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IGPM9aKplFNlG6nV17hfnXdONJz3vwnj2FybHMcq7/ICp0wMkkKojD7TnM3N1/8w5SF8dtxW33tqUUzanTSiH9J4RPj1HCIMv8R1l27Azs0HIhsIbS5SRZ+tGZ1V2JQ3lcp/aKzoDqDhzWmH5Fxpil5grz7MVb4h0ToznMD2sZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=0NR+U2yC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so1205844f8f.1
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 01:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1729846769; x=1730451569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+vub8DEsJHEh2sL2JcVp3kQnAvq4yLrqztD79s8mVw=;
        b=0NR+U2yCSqObOFvzFSsBwQJ46hpq1sVXZqqFj/dOMZQiYspMmzgqcnpsoLrVPliuuR
         lAa4WEtyONc3KuTt973ih/VeQM28vszYSvY1K4wty4e1YIFIYipElqFgYsX22Ou+jhzt
         wIBcPSVISkFs3/BqURsTxSlgCMsg9+xuOXQMIVso7jjoy2fLMeUOVknWXSJTuy7vKhEk
         3PP+KeJ0ZwZyydLTk8gOHsNDV5RR0g0Xv/jmG++ywxsxa4c6Qg89FIJIugHQ5IurETHL
         PN5UK4BT3cyX+c7/Q9Mn69jzq5CXLT5YpSgktWGI/NLigsNtpWxW6FDW0I3UTK5OAfQh
         cShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729846769; x=1730451569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+vub8DEsJHEh2sL2JcVp3kQnAvq4yLrqztD79s8mVw=;
        b=mCI1X0VAV4ns8rObZzSH692am2RKt9YSbmkrcSdjM+0wgPK8cRoFFNGkHpcpGdPb9D
         4c4kWUYCryHNMR37Cl39clKy00hnW7u8BI5j6biPJY7hZXbtBlWWzhhKYiO8PlBhFYc8
         RU0u09LzBlkplv2/eNKpboQBr2fP0ibBEeqvIpqaAIRTqahx3f5Snwd6roy554qdTNzV
         S4g1pf4AAg617+SeedSSr5FqH/QxMV/LWW2CaKBwEgpJ9JDaHGP5jad1cAthRpHSmUUT
         /NNWjPS828rEg7tehsRhF6SHxwrIL0RIZPWCUEI69Qh/j8joZYaRE7UlS0VC2sAE6oJZ
         ZhNw==
X-Forwarded-Encrypted: i=1; AJvYcCVKMr48y8UFHCj+5+vWbubmiFv+gO3svD1N5XacAXKwt+RYcRJm9FVWl+tKrNHlIGq+v9OC0H+nfCdakw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaMzDrPnrBQhf28PLKSQozyNwCMpmgYjz4KWytp31vWCdTwCC3
	z7b5BHb8NLiN+tASwekvbpMel1QgDmidUW8ku30xUPBqBmfV30pO8vu9Fu8GTfU=
X-Google-Smtp-Source: AGHT+IHbXZsR/OXFr8glBMLCe8MNtBA2IUyahWn/Pderk0Aa1yBbmUqPLcYCBv6op8kG0w1MAFwcGQ==
X-Received: by 2002:a5d:4142:0:b0:37d:45c3:3459 with SMTP id ffacd0b85a97d-38045868631mr3385520f8f.21.1729846769101;
        Fri, 25 Oct 2024 01:59:29 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b46bffsm980247f8f.46.2024.10.25.01.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 01:59:28 -0700 (PDT)
Message-ID: <8d7bab43-d561-487d-bdc6-86fc230db655@ursulin.net>
Date: Fri, 25 Oct 2024 09:59:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20241024124159.4519-1-christian.koenig@amd.com>
 <20241024124159.4519-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20241024124159.4519-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24/10/2024 13:41, Christian König wrote:
> Reports indicates that some userspace applications try to merge more than
> 80k of fences into a single dma_fence_array leading to a warning from
> kzalloc() that the requested size becomes to big.
> 
> While that is clearly an userspace bug we should probably handle that case
> gracefully in the kernel.
> 
> So we can either reject requests to merge more than a reasonable amount of
> fences (64k maybe?) or we can start to use kvzalloc() instead of kzalloc().
> This patch here does the later.

Rejecting would potentially be safer, otherwise there is a path for 
userspace to trigger a warn in kvmalloc_node (see 0829b5bcdd3b 
("drm/i915: 2 GiB of relocations ought to be enough for anybody*")) and 
spam dmesg at will.

Question is what limit to set...

Regards,

Tvrtko

> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org
> ---
>   drivers/dma-buf/dma-fence-array.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 8a08ffde31e7..46ac42bcfac0 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -119,8 +119,8 @@ static void dma_fence_array_release(struct dma_fence *fence)
>   	for (i = 0; i < array->num_fences; ++i)
>   		dma_fence_put(array->fences[i]);
>   
> -	kfree(array->fences);
> -	dma_fence_free(fence);
> +	kvfree(array->fences);
> +	kvfree_rcu(fence, rcu);
>   }
>   
>   static void dma_fence_array_set_deadline(struct dma_fence *fence,
> @@ -153,7 +153,7 @@ struct dma_fence_array *dma_fence_array_alloc(int num_fences)
>   {
>   	struct dma_fence_array *array;
>   
> -	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> +	return kvzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
>   }
>   EXPORT_SYMBOL(dma_fence_array_alloc);
>   

