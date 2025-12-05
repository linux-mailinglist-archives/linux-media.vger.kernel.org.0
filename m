Return-Path: <linux-media+bounces-48322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 053C6CA78FA
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 13:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F004345AD3E
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 11:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6427C329E5C;
	Fri,  5 Dec 2025 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8EmBOts"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2AE32C31D
	for <linux-media@vger.kernel.org>; Fri,  5 Dec 2025 11:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933064; cv=none; b=hRInu6n5f13M8wvZ8r3qRpmIWxV6ld2fgYVgcYVFujKbp+mSCScoFG2w+se5BLgKmtQypG2UI0HhbMTWxBxZKgsKIeCzDD7+coxlORVBgWhW/EA2CE0TNw0vztQ/me9qShrV/PGXVLxK/YahzUPoUw3AzVuITwDRSX8D2nLE9gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933064; c=relaxed/simple;
	bh=pGopNyeHsvBW3go2mhsIpNS7bzOqTQ9RMlM6PkX0h+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gXmciu4o7TjupVSu30/k7zzn47EacB3ZomIttJfXZEBhecfxUXd45XhnRzYDFg4YxDTDtOXxZbH8yDUeXU4JjcP9A+fr7/pM/wWJfoKDBTdoSX3SMl/tQZ0KMCWNd52yKJ/2tvqmLF6l72yfprmpBSgRcW+ZUAETmvDcrvlaLw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8EmBOts; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764933054; x=1796469054;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=pGopNyeHsvBW3go2mhsIpNS7bzOqTQ9RMlM6PkX0h+Y=;
  b=T8EmBOtsyvShO+48CFevRe2gl8fUOqfvmA8X0oMLOJRzlT633RxbkN79
   OehK9EO4PrLj0GEmqYOEsktGRpw93eCdzCK+RlSPPXyzK8HJdbOz3U9Pc
   74IvZzVMIhpnkUKT+N0ytM32WM68Z0Gl18+TlpEAFgg7UPzM4dWOj3Aql
   wLln1w1jiQTak6CX/W9mELdUbVnCnid62qXMhIBk7cbTiHsXABoVPluAT
   42RWoriebk+meWm8DYdMGEwb40FukR+3z/L0NewC6OQJn7YSZP8IwB0DE
   O20BPxTme8GjMMYY+aOWjJ4Lo0mUgOKCvzcYuH/DLx4QzOThOz7MTsA5V
   g==;
X-CSE-ConnectionGUID: NcCJJiyMTTiw3xE4AxcH1w==
X-CSE-MsgGUID: vW46hHBqSvuxqvzJA/zxWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66689793"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="66689793"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 03:10:51 -0800
X-CSE-ConnectionGUID: cF6XzfUWQIilNYFQQ9wzQw==
X-CSE-MsgGUID: GbtHloDOSLy5SmLUPkF1Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="195706412"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.110]) ([10.245.244.110])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 03:10:50 -0800
Message-ID: <23d8391c-4568-4b31-acb3-9426b0bf085e@intel.com>
Date: Fri, 5 Dec 2025 11:10:47 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: improve sg_table debugging hack v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 simona.vetter@ffwll.ch
References: <20251204145952.7052-1-christian.koenig@amd.com>
 <3e09719d-af1b-4c5d-83fb-6ef5f41739b5@intel.com>
 <e21cc071-0133-4b07-a52f-67ed4d80cbcd@gmail.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <e21cc071-0133-4b07-a52f-67ed4d80cbcd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/12/2025 10:41, Christian König wrote:
> On 12/4/25 16:51, Matthew Auld wrote:
>> On 04/12/2025 14:59, Christian König wrote:
>>> This debugging hack is important to enforce the rule that importers
>>> should *never* touch the underlying struct page of the exporter.
>>>
>>> Instead of just mangling the page link create a copy of the sg_table
>>> but only copy over the DMA addresses and not the pages.
>>>
>>> This will cause a NULL pointer de-reference if the importer tries to
>>> touch the struct page. Still quite a hack but this at least allows the
>>> exporter to properly keeps it's sg_table intact while allowing the
>>> DMA-buf maintainer to find and fix misbehaving importers and finally
>>> switch over to using a different data structure in the future.
>>>
>>> v2: improve the hack further by using a wrapper structure and explaining
>>> the background a bit more in the commit message.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> (v1)
>>> ---
>>>    drivers/dma-buf/dma-buf.c | 72 +++++++++++++++++++++++++++++++--------
>>>    1 file changed, 58 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 2305bb2cc1f1..8c4afd360b72 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -35,6 +35,12 @@
>>>      #include "dma-buf-sysfs-stats.h"
>>>    +/* Wrapper to hide the sg_table page link from the importer */
>>> +struct dma_buf_sg_table_wrapper {
>>> +    struct sg_table *original;
>>> +    struct sg_table wrapper;
>>> +};
>>> +
>>>    static inline int is_dma_buf_file(struct file *);
>>>      static DEFINE_MUTEX(dmabuf_list_mutex);
>>> @@ -828,21 +834,57 @@ void dma_buf_put(struct dma_buf *dmabuf)
>>>    }
>>>    EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
>>>    -static void mangle_sg_table(struct sg_table *sg_table)
>>> +static int dma_buf_mangle_sg_table(struct sg_table **sg_table)
>>>    {
>>> -#ifdef CONFIG_DMABUF_DEBUG
>>> -    int i;
>>> -    struct scatterlist *sg;
>>> -
>>> -    /* To catch abuse of the underlying struct page by importers mix
>>> -     * up the bits, but take care to preserve the low SG_ bits to
>>> -     * not corrupt the sgt. The mixing is undone on unmap
>>> -     * before passing the sgt back to the exporter.
>>> +    struct scatterlist *to_sg, *from_sg;
>>> +    struct sg_table *from = *sg_table;
>>> +    struct dma_buf_sg_table_wrapper *to;
>>> +    int i, ret;
>>> +
>>> +    if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
>>> +        return 0;
>>> +
>>> +    /*
>>> +     * To catch abuse of the underlying struct page by importers copy the
>>> +     * sg_table without copying the page_link and give only the copy back to
>>> +     * the importer.
>>>         */
>>> -    for_each_sgtable_sg(sg_table, sg, i)
>>> -        sg->page_link ^= ~0xffUL;
>>> -#endif
>>> +    to = kzalloc(sizeof(*to), GFP_KERNEL);
>>> +    if (!to)
>>> +        return -ENOMEM;
>>> +
>>> +    ret = sg_alloc_table(&to->wrapper, from->nents, GFP_KERNEL);
>>> +    if (ret)
>>> +        goto free_to;
>>> +
>>> +    to_sg = to->wrapper.sgl;
>>> +    for_each_sgtable_dma_sg(from, from_sg, i) {
>>> +        sg_set_page(to_sg, NULL, 0, 0);
>>
>> Are we still allowed to pass NULL page here? There looks to be the recently added:
>>
>> VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PAGE_SIZE) / PAGE_SIZE));
>>
>> And if page_range_contiguous() does not just return true, it potentially wants to dereference the page, like with page_to_pfn()?
> 
> Good point.
> 
> It doesn't crash at the moment because page_to_pfn() also works with NULL as page, but it is clearly not the nicest thing to do.

There does look to be:

https://elixir.bootlin.com/linux/v6.18/source/include/asm-generic/memory_model.h#L56

So not completely sure it can't crash here?

> 
> I will switch over to using sg_assign_page() instead.
> 
>>
>>
>>> +                sg_dma_address(to_sg) = sg_dma_address(from_sg);
>>> +                sg_dma_len(to_sg) = sg_dma_len(from_sg);
>>
>> Nit: formatting looks off here.
> 
> Oh, indeed.
> 
> Thanks,
> Christian.
> 
>>
>>> +        to_sg = sg_next(to_sg);
>>> +    }
>>>    +    to->original = from;
>>> +    *sg_table = &to->wrapper;
>>> +    return 0;
>>> +
>>> +free_to:
>>> +    kfree(to);
>>> +    return ret;
>>> +}
>>> +
>>> +static void dma_buf_demangle_sg_table(struct sg_table **sg_table)
>>> +{
>>> +    struct dma_buf_sg_table_wrapper *copy;
>>> +
>>> +    if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
>>> +        return;
>>> +
>>> +    copy = container_of(*sg_table, typeof(*copy), wrapper);
>>> +    *sg_table = copy->original;
>>> +    sg_free_table(&copy->wrapper);
>>> +    kfree(copy);
>>>    }
>>>      static inline bool
>>> @@ -1139,7 +1181,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>>            if (ret < 0)
>>>                goto error_unmap;
>>>        }
>>> -    mangle_sg_table(sg_table);
>>> +    ret = dma_buf_mangle_sg_table(&sg_table);
>>> +    if (ret)
>>> +        goto error_unmap;
>>>          if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
>>>            struct scatterlist *sg;
>>> @@ -1220,7 +1264,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>>>          dma_resv_assert_held(attach->dmabuf->resv);
>>>    -    mangle_sg_table(sg_table);
>>> +    dma_buf_demangle_sg_table(&sg_table);
>>>        attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>>>          if (dma_buf_pin_on_map(attach))
>>
> 


