Return-Path: <linux-media+bounces-48319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 729EBCA736F
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 11:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C600C3014D9A
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 10:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D42314A9F;
	Fri,  5 Dec 2025 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Alg9etr9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF602F5A13
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931293; cv=none; b=TB8FyZ6ywRMfxI1XQxWQVdYymMaPunWMUQcC4GGGHMHqb8aMXiYiEZrPwD2EfXrwQ4oWyQRSOQ+eVDCC8F4g/bM7JSOcj98kY9SxPTk4QTlGdoKV3UB2EfGTgm6NuFwS9Rfqvfcwspjo4RjJp/c6B3IFRTUpor+YWy/m5SyL+tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931293; c=relaxed/simple;
	bh=bqhoOTyz15yD3oPlksJpvlrqoSpVWqqu2OGgwvJ2w2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ougzCTIBjzuhTILwzXCQy1AbOVgK4PG789Yyy2admxijZLQelIWe7Xpw47OpSM42S8cJg3tK4ZLxsv/yixAaAV8D9SSWDwsCtiqhuatyDMMVhZ0Y5T9S+FVRR3x2IBoUxbg0ALVE+R4P7Xq5ljjGm8DsXfLBFfD8ivBhbGxhsYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Alg9etr9; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88059c28da1so17628406d6.2
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 02:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764931289; x=1765536089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pl0KZsEEFyvHk530kg5eqVspRdfF3HFp7SF4AM4hfeM=;
        b=Alg9etr9gJ5bBz2dJJyDD5i9b0Z78/5zOZhADcDOxSPZCZ7t69sCUseQqKMDqN7t69
         1Q/wvAMaEELtOaI8/Ts3H9wPIn0oeXqItmVbJ9DXWj7ghfL2Occ79hYGn29fsNQHNqfj
         saF+ouELJOI7iy5k0MrNmU1AkIOEXkKwH6AiEtCfV54nblYYNu3IRp8oHjO6aKOeYm58
         4VdNuuV9wwOZTy9Ir3uJpYTxuSLM4xJD3nG0wERIMLFGG0u2ftU4Ltj2UNNtnOtmmTxv
         ixUSVQ3uFma/VF2JX8C1hqlMVJ4zcmu1PYRao0IoxTvawHKHsDUGvAIWOQz4vPBVRniF
         rrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764931289; x=1765536089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pl0KZsEEFyvHk530kg5eqVspRdfF3HFp7SF4AM4hfeM=;
        b=hARo2ZRU7c+F6LTZfGbKnH2uWthbuL/w+P4J8qa1Di4HTZmpEB8SJCSUMC1XzGosTX
         jLyYubZ8scE8MwwA8knP4+lxibwZLzct2TYhtdwmkdYvh5yV2C8mVFwQsGin+oaN0JMj
         feKDuoTF7oti9shd1mRqUFNTOmOOzcknWDr2DEgTH3I2wnUtPX5i1WjdefJMwvfWzB2K
         JjSXOwQnKXRb+/ZtVmSqRHposF4guPadF/oMpU8Cu1tMUBSM9RdrCKrvyDe2jkOjNVG2
         Xa09lGfog3RE7UQZwx+8HLxktb9TqomQz/tu2/n1B4G90Sh+4geBE+4Bh7Cg5694UJa/
         Ol4A==
X-Forwarded-Encrypted: i=1; AJvYcCXoP6retlhoTWuINo6UfOlUgdCok++R1yq026yOUezhfSS3mMPd2WgAH5C09JpdK+mz4UO6WGR2RBP5UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCcBhvG98aWxNXAKFFZIyyldtR2RMKqoxycAq4nMznGknhCVFe
	gySqsWToufMYjeR42w1q/YqmG5tkL/RG44EfdGQGeZUCthmbIQUYkjbm
X-Gm-Gg: ASbGncuLGecUD/kRhE3VwZS0HMG+cbQQRRzcYyr3j29iKrlLqAhwMcYMiY3/HvjKh/K
	FKAkP54iF8WU7xDccmJkO0LGYSzaZJqgM3RRbP7SDcu2ltPbeTgJ/TszAl/XccB5wpEqKpbdPyl
	fhmvVljijnBYz+l8UYjDyyTWDGyXR7wrkvTQjGusHCuebm5D9kWZToUh6YVEGychR+jjTLLtUOg
	4sNT3XPFcoxlBvxiZApxq5yR0eal6TVxA8zb19ff1qHPimOaQjxUHucH05Tw+5r5+kVf1iFEaxX
	/Gqo2z3VAJpnobDMQjg7cMi8+iqkf9QqwxsR6hPWXR+mSH1yxk9fMLRe7xde92p5Bk5kZjlRL21
	p/YiGnaMRwmVGIPvCzS3zKlcojDPrg5cZ95NhW8bC6kG3ZEFIXVfU7T01Fsi606Ce4NmuobJ50g
	cgpgLxldhw5l2xO5WDh4FD+tvm6cX4NCzxGZr3mau/pA==
X-Google-Smtp-Source: AGHT+IHNxqFp5G2R7gNMuG1VWImXhi2+k99kfXSMAJ0YiDtIklgT1SoXMb9r1YrkoI4/X88XYCBQTw==
X-Received: by 2002:a05:6214:33c9:b0:882:6797:3a67 with SMTP id 6a1803df08f44-888194838a2mr123350926d6.13.1764931288868;
        Fri, 05 Dec 2025 02:41:28 -0800 (PST)
Received: from [10.254.120.97] (mkmvpn.amd.com. [165.204.54.211])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f332a7sm31835936d6.5.2025.12.05.02.41.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:41:28 -0800 (PST)
Message-ID: <e21cc071-0133-4b07-a52f-67ed4d80cbcd@gmail.com>
Date: Fri, 5 Dec 2025 11:41:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: improve sg_table debugging hack v2
To: Matthew Auld <matthew.auld@intel.com>, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, simona.vetter@ffwll.ch
References: <20251204145952.7052-1-christian.koenig@amd.com>
 <3e09719d-af1b-4c5d-83fb-6ef5f41739b5@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <3e09719d-af1b-4c5d-83fb-6ef5f41739b5@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/4/25 16:51, Matthew Auld wrote:
> On 04/12/2025 14:59, Christian König wrote:
>> This debugging hack is important to enforce the rule that importers
>> should *never* touch the underlying struct page of the exporter.
>>
>> Instead of just mangling the page link create a copy of the sg_table
>> but only copy over the DMA addresses and not the pages.
>>
>> This will cause a NULL pointer de-reference if the importer tries to
>> touch the struct page. Still quite a hack but this at least allows the
>> exporter to properly keeps it's sg_table intact while allowing the
>> DMA-buf maintainer to find and fix misbehaving importers and finally
>> switch over to using a different data structure in the future.
>>
>> v2: improve the hack further by using a wrapper structure and explaining
>> the background a bit more in the commit message.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> (v1)
>> ---
>>   drivers/dma-buf/dma-buf.c | 72 +++++++++++++++++++++++++++++++--------
>>   1 file changed, 58 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 2305bb2cc1f1..8c4afd360b72 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -35,6 +35,12 @@
>>     #include "dma-buf-sysfs-stats.h"
>>   +/* Wrapper to hide the sg_table page link from the importer */
>> +struct dma_buf_sg_table_wrapper {
>> +    struct sg_table *original;
>> +    struct sg_table wrapper;
>> +};
>> +
>>   static inline int is_dma_buf_file(struct file *);
>>     static DEFINE_MUTEX(dmabuf_list_mutex);
>> @@ -828,21 +834,57 @@ void dma_buf_put(struct dma_buf *dmabuf)
>>   }
>>   EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
>>   -static void mangle_sg_table(struct sg_table *sg_table)
>> +static int dma_buf_mangle_sg_table(struct sg_table **sg_table)
>>   {
>> -#ifdef CONFIG_DMABUF_DEBUG
>> -    int i;
>> -    struct scatterlist *sg;
>> -
>> -    /* To catch abuse of the underlying struct page by importers mix
>> -     * up the bits, but take care to preserve the low SG_ bits to
>> -     * not corrupt the sgt. The mixing is undone on unmap
>> -     * before passing the sgt back to the exporter.
>> +    struct scatterlist *to_sg, *from_sg;
>> +    struct sg_table *from = *sg_table;
>> +    struct dma_buf_sg_table_wrapper *to;
>> +    int i, ret;
>> +
>> +    if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
>> +        return 0;
>> +
>> +    /*
>> +     * To catch abuse of the underlying struct page by importers copy the
>> +     * sg_table without copying the page_link and give only the copy back to
>> +     * the importer.
>>        */
>> -    for_each_sgtable_sg(sg_table, sg, i)
>> -        sg->page_link ^= ~0xffUL;
>> -#endif
>> +    to = kzalloc(sizeof(*to), GFP_KERNEL);
>> +    if (!to)
>> +        return -ENOMEM;
>> +
>> +    ret = sg_alloc_table(&to->wrapper, from->nents, GFP_KERNEL);
>> +    if (ret)
>> +        goto free_to;
>> +
>> +    to_sg = to->wrapper.sgl;
>> +    for_each_sgtable_dma_sg(from, from_sg, i) {
>> +        sg_set_page(to_sg, NULL, 0, 0);
> 
> Are we still allowed to pass NULL page here? There looks to be the recently added:
> 
> VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PAGE_SIZE) / PAGE_SIZE));
> 
> And if page_range_contiguous() does not just return true, it potentially wants to dereference the page, like with page_to_pfn()?

Good point.

It doesn't crash at the moment because page_to_pfn() also works with NULL as page, but it is clearly not the nicest thing to do.

I will switch over to using sg_assign_page() instead.

> 
> 
>> +                sg_dma_address(to_sg) = sg_dma_address(from_sg);
>> +                sg_dma_len(to_sg) = sg_dma_len(from_sg);
> 
> Nit: formatting looks off here.

Oh, indeed.

Thanks,
Christian.

> 
>> +        to_sg = sg_next(to_sg);
>> +    }
>>   +    to->original = from;
>> +    *sg_table = &to->wrapper;
>> +    return 0;
>> +
>> +free_to:
>> +    kfree(to);
>> +    return ret;
>> +}
>> +
>> +static void dma_buf_demangle_sg_table(struct sg_table **sg_table)
>> +{
>> +    struct dma_buf_sg_table_wrapper *copy;
>> +
>> +    if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
>> +        return;
>> +
>> +    copy = container_of(*sg_table, typeof(*copy), wrapper);
>> +    *sg_table = copy->original;
>> +    sg_free_table(&copy->wrapper);
>> +    kfree(copy);
>>   }
>>     static inline bool
>> @@ -1139,7 +1181,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>           if (ret < 0)
>>               goto error_unmap;
>>       }
>> -    mangle_sg_table(sg_table);
>> +    ret = dma_buf_mangle_sg_table(&sg_table);
>> +    if (ret)
>> +        goto error_unmap;
>>         if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
>>           struct scatterlist *sg;
>> @@ -1220,7 +1264,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>>         dma_resv_assert_held(attach->dmabuf->resv);
>>   -    mangle_sg_table(sg_table);
>> +    dma_buf_demangle_sg_table(&sg_table);
>>       attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>>         if (dma_buf_pin_on_map(attach))
> 


