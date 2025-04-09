Return-Path: <linux-media+bounces-29727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407CA82194
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 12:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 248C67B8624
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F69425D54A;
	Wed,  9 Apr 2025 10:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HWHGLYfy"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1542B12CDAE
	for <linux-media@vger.kernel.org>; Wed,  9 Apr 2025 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192889; cv=none; b=QYiKtw43O3IoVJDYrnwJmitiGWJtMcmsIAwCH0K1cw/nXKBhx1Z0+W7U90EXqMQ8fVzzJ8xqNEYTnLIaXWPbsfRDs6RybCHcW4scp3WxZyCys2EvtRXj4Mu/AYF5zrNtgf2SPuXZknaOHt+Jw2KaYs++V+n1ysHNNebxA8txbr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192889; c=relaxed/simple;
	bh=f4T/qSy20URjIURUEkyydCM6csptsrsaveLdop33LOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPL/gBLoaGPYvVt4kAGPTrfJVPwfNX3NsDVo/Lq94fGdLFsTsU69sTEkRZe/dbU7+NhDMRdd2kHt6VdwUr6FW68xHwvrPbWy55cz0bJhMjZ5/cKqV7UGonLbe4EpguUCs4C8kHvdQ1RJIFnKoZamb/prcSXo119LqwCdOezQMBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HWHGLYfy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744192886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UhsomB+pGcZTr0xfC9JjN6JYuerG9YdUwBkaq9uXxH8=;
	b=HWHGLYfyb9jdKUrApiaNDPOyOqNukafgdndis0T1fRD4Y9RqZEjng39b34cOZpg9yOM92p
	p2Xn7UQSdraFQXWmM4W4ic7ERaqqYRdhkxfBH51p+kH5unvGlnDfjLjsac9E42y/WUaIrx
	rSkHlX1UUSV4I/46Hfw9AFtSAWvYOEU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-1ZhgRrrGMmCqRABF5nE3iw-1; Wed, 09 Apr 2025 06:01:25 -0400
X-MC-Unique: 1ZhgRrrGMmCqRABF5nE3iw-1
X-Mimecast-MFC-AGG-ID: 1ZhgRrrGMmCqRABF5nE3iw_1744192885
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3914bc0cc4aso3350873f8f.3
        for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 03:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744192884; x=1744797684;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UhsomB+pGcZTr0xfC9JjN6JYuerG9YdUwBkaq9uXxH8=;
        b=uACM+XG9afVlAGmSrgVii77sT3tqVsSmXdMwYBQxlTzbQv7yeDpPC/RGs6BpFOmKoW
         n3eNM7KMt3CjIjW/jAUPsDNb6xU56NzV/uVwI5AMAgaWmvRfUFOQ8xSvY3dAPOGIxt+A
         pbvzh2X8s8PQ2YB0uvQ+g8W41I7PpHrJkLyBlAuwd/P2BKp2Zc2X5IdricsW18V54xCx
         o0pefNPuiXVvID5VgHUyA5tot7DhjjznCFZ68qXeKjNPXZ8a/LQ4U2VKgyUABOPBsKUE
         Js38fHBvj98T+sk3YDsyWKEnt/YOg5eUWWUIiAwNl8VIOYe9hVKUcU5dFy5IgQm0vK5r
         +Wcw==
X-Forwarded-Encrypted: i=1; AJvYcCV9N2GjmUr7DAFc+Ue1Ygig7uH2p0jXC7MvzoxBOBGaKr7NnWq2n9Xhhge0LzGmB/y+M8QcbtWWOdYlug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlNNu60kz5cIPHX5jQgzuVWf2vBmKuxNmWfldH3KR4uyNoG/3L
	B4REZ7tAfPvi0qadCwC4WMrR/jV6S/gvHUcT7e7bDA64kKj0stYUbpMtuN8dhM0ZsYnw5uHJnTL
	ZP3VH7wAWCoGvQDoO8VDObMn4fxXowQNTz93WQIpk9n31f4bXna1/lEtEfh5A
X-Gm-Gg: ASbGncuc6okHpQ0oQ/DMiUbckfloC3wd9MyCjVH/E4OCi2GloD30rtPpr87G9Y19ha5
	FiMqfjWxFMWdOE6yvjSxjAe7Ct81hs3DyREv/aS+vDyOG/x3+xuWP3FWAFWFnEbLtYlWBtikK1P
	XlbkXBL8I47PPU0ZPkuKL7aUQqhem9j6yGRxn+El6xaXOb8AqzTG5/0yAQWJn91/cOiISZVqquI
	49xragVZL399BincdlG72R8rQHJEWvbQSyVsvSVx0UHImZhYmJATljMqYT0y9otmOOTKK40ue5K
	WPq1tls1eUP6VCZWjOd+hoUTnEuOYCgqjR8Tzl/qOCl656vsG4ufc4x3wCYK+DbByEUkTr2ilHl
	DKR0y5d6W9oz09LZyKrPtQILrgNShQy9AQw==
X-Received: by 2002:a5d:5f46:0:b0:39c:30f9:1e57 with SMTP id ffacd0b85a97d-39d87aa7b48mr1850971f8f.18.1744192884565;
        Wed, 09 Apr 2025 03:01:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGn9dm8e0cNTFadjdThfqm79abD8ZcW9cyIWghyoWetdqCNs3giSGCfAB7zcy8vbdovna6ymg==
X-Received: by 2002:a5d:5f46:0:b0:39c:30f9:1e57 with SMTP id ffacd0b85a97d-39d87aa7b48mr1850925f8f.18.1744192884148;
        Wed, 09 Apr 2025 03:01:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70d:8400:ed9b:a3a:88e5:c6a? (p200300cbc70d8400ed9b0a3a88e50c6a.dip0.t-ipconnect.de. [2003:cb:c70d:8400:ed9b:a3a:88e5:c6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fe28fsm1161542f8f.96.2025.04.09.03.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 03:01:23 -0700 (PDT)
Message-ID: <561d6050-e24f-4643-806f-8a520e324d11@redhat.com>
Date: Wed, 9 Apr 2025 12:01:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] optee: FF-A: dynamic restricted memory
 allocation
To: Sumit Garg <sumit.garg@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, akpm@linux-foundation.org,
 rppt@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>, linux-mm@kvack.org
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-10-jens.wiklander@linaro.org>
 <Z-JePo6yGlUgrZkw@sumit-X1>
 <CAHUa44H1MzBLBM+Oeawca52C8PF3uAT0ggbL-zRdnBqj4LYrZg@mail.gmail.com>
 <Z-u8MWNVNy9lLbkK@sumit-X1>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z-u8MWNVNy9lLbkK@sumit-X1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01.04.25 12:13, Sumit Garg wrote:
> + MM folks to seek guidance here.
> 
> On Thu, Mar 27, 2025 at 09:07:34AM +0100, Jens Wiklander wrote:
>> Hi Sumit,
>>
>> On Tue, Mar 25, 2025 at 8:42 AM Sumit Garg <sumit.garg@kernel.org> wrote:
>>>
>>> On Wed, Mar 05, 2025 at 02:04:15PM +0100, Jens Wiklander wrote:
>>>> Add support in the OP-TEE backend driver dynamic restricted memory
>>>> allocation with FF-A.
>>>>
>>>> The restricted memory pools for dynamically allocated restrict memory
>>>> are instantiated when requested by user-space. This instantiation can
>>>> fail if OP-TEE doesn't support the requested use-case of restricted
>>>> memory.
>>>>
>>>> Restricted memory pools based on a static carveout or dynamic allocation
>>>> can coexist for different use-cases. We use only dynamic allocation with
>>>> FF-A.
>>>>
>>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>>> ---
>>>>   drivers/tee/optee/Makefile        |   1 +
>>>>   drivers/tee/optee/ffa_abi.c       | 143 ++++++++++++-
>>>>   drivers/tee/optee/optee_private.h |  13 +-
>>>>   drivers/tee/optee/rstmem.c        | 329 ++++++++++++++++++++++++++++++
>>>>   4 files changed, 483 insertions(+), 3 deletions(-)
>>>>   create mode 100644 drivers/tee/optee/rstmem.c
>>>>
> 
> <snip>
> 
>>>> diff --git a/drivers/tee/optee/rstmem.c b/drivers/tee/optee/rstmem.c
>>>> new file mode 100644
>>>> index 000000000000..ea27769934d4
>>>> --- /dev/null
>>>> +++ b/drivers/tee/optee/rstmem.c
>>>> @@ -0,0 +1,329 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2025, Linaro Limited
>>>> + */
>>>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>>> +
>>>> +#include <linux/errno.h>
>>>> +#include <linux/genalloc.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/string.h>
>>>> +#include <linux/tee_core.h>
>>>> +#include <linux/types.h>
>>>> +#include "optee_private.h"
>>>> +
>>>> +struct optee_rstmem_cma_pool {
>>>> +     struct tee_rstmem_pool pool;
>>>> +     struct gen_pool *gen_pool;
>>>> +     struct optee *optee;
>>>> +     size_t page_count;
>>>> +     u16 *end_points;
>>>> +     u_int end_point_count;
>>>> +     u_int align;
>>>> +     refcount_t refcount;
>>>> +     u32 use_case;
>>>> +     struct tee_shm *rstmem;
>>>> +     /* Protects when initializing and tearing down this struct */
>>>> +     struct mutex mutex;
>>>> +};
>>>> +
>>>> +static struct optee_rstmem_cma_pool *
>>>> +to_rstmem_cma_pool(struct tee_rstmem_pool *pool)
>>>> +{
>>>> +     return container_of(pool, struct optee_rstmem_cma_pool, pool);
>>>> +}
>>>> +
>>>> +static int init_cma_rstmem(struct optee_rstmem_cma_pool *rp)
>>>> +{
>>>> +     int rc;
>>>> +
>>>> +     rp->rstmem = tee_shm_alloc_cma_phys_mem(rp->optee->ctx, rp->page_count,
>>>> +                                             rp->align);
>>>> +     if (IS_ERR(rp->rstmem)) {
>>>> +             rc = PTR_ERR(rp->rstmem);
>>>> +             goto err_null_rstmem;
>>>> +     }
>>>> +
>>>> +     /*
>>>> +      * TODO unmap the memory range since the physical memory will
>>>> +      * become inaccesible after the lend_rstmem() call.
>>>> +      */
>>>
>>> What's your plan for this TODO? I think we need a CMA allocator here
>>> which can allocate un-mapped memory such that any cache speculation
>>> won't lead to CPU hangs once the memory restriction comes into picture.
>>
>> What happens is platform-specific. For some platforms, it might be
>> enough to avoid explicit access. Yes, a CMA allocator with unmapped
>> memory or where memory can be unmapped is one option.
> 
> Did you get a chance to enable real memory protection on RockPi board?
> This will atleast ensure that mapped restricted memory without explicit
> access works fine. Since otherwise once people start to enable real
> memory restriction in OP-TEE, there can be chances of random hang ups
> due to cache speculation.
> 
> MM folks,
> 
> Basically what we are trying to achieve here is a "no-map" DT behaviour
> [1] which is rather dynamic in  nature. The use-case here is that a memory
> block allocated from CMA can be marked restricted at runtime where we
> would like the Linux not being able to directly or indirectly (cache
> speculation) access it. Once memory restriction use-case has been
> completed, the memory block can be marked as normal and freed for
> further CMA allocation.
> 
> It will be apprciated if you can guide us regarding the appropriate APIs
> to use for un-mapping/mamping CMA allocations for this use-case.

Can we get some more information why that is even required, so we can 
decide if that is even the right thing to do? :)

Who would mark the memory block as restricted and for which purpose?

In arch/powerpc/platforms/powernv/memtrace.c we have some arch-specific 
code to remove the directmap after alloc_contig_pages(). See 
memtrace_alloc_node(). But it's very arch-specific ...

-- 
Cheers,

David / dhildenb


