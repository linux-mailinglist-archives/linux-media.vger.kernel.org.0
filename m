Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160EA2CC194
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 17:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgLBQCS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 11:02:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33257 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726405AbgLBQCR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 11:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606924850;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9epFRfRlyqDO4VIS+nw8KbJEIlpQNa+kkCSbPKuCRGk=;
        b=H1zReMm4dqqnHx7HM3dXp1r4ni+HAVvFo2nbmoJDItE2/utr2OWGXKlYNgrmCCnFuCBsNp
        jXXrlUriJ5AddHoT4xhvikWN6UadGcTTlVsjC5fHDjo8xslckIMOu2DfTCo2Z9xmpZlHik
        k6Bw4WVx+xOTU72ArudCqRqMf4eLwkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-kOJKmdxQPV6-toI8ButT6w-1; Wed, 02 Dec 2020 11:00:47 -0500
X-MC-Unique: kOJKmdxQPV6-toI8ButT6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C33378144F7;
        Wed,  2 Dec 2020 16:00:42 +0000 (UTC)
Received: from [10.36.114.61] (ovpn-114-61.ams2.redhat.com [10.36.114.61])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 35EEB60C6B;
        Wed,  2 Dec 2020 16:00:37 +0000 (UTC)
Subject: Re: [PATCH v2 2/4] mm: introduce cma_alloc_bulk API
To:     Michal Hocko <mhocko@suse.com>
Cc:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, hyesoo.yu@samsung.com,
        willy@infradead.org, iamjoonsoo.kim@lge.com, vbabka@suse.cz,
        surenb@google.com, pullip.cho@samsung.com, joaodias@google.com,
        hridya@google.com, sumit.semwal@linaro.org, john.stultz@linaro.org,
        Brian.Starkey@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org
References: <20201201175144.3996569-1-minchan@kernel.org>
 <20201201175144.3996569-3-minchan@kernel.org>
 <8f006a4a-c21d-9db3-5493-fb1cc651b0cf@redhat.com>
 <20201202154915.GU17338@dhcp22.suse.cz>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <4c2f67a2-e5b4-ed7e-3d1b-45626e2f254b@redhat.com>
Date:   Wed, 2 Dec 2020 17:00:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202154915.GU17338@dhcp22.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02.12.20 16:49, Michal Hocko wrote:
> On Wed 02-12-20 10:14:41, David Hildenbrand wrote:
>> On 01.12.20 18:51, Minchan Kim wrote:
>>> There is a need for special HW to require bulk allocation of
>>> high-order pages. For example, 4800 * order-4 pages, which
>>> would be minimum, sometimes, it requires more.
>>>
>>> To meet the requirement, a option reserves 300M CMA area and
>>> requests the whole 300M contiguous memory. However, it doesn't
>>> work if even one of those pages in the range is long-term pinned
>>> directly or indirectly. The other option is to ask higher-order
>>
>> My latest knowledge is that pages in the CMA area are never long term
>> pinned.
>>
>> https://lore.kernel.org/lkml/20201123090129.GD27488@dhcp22.suse.cz/
>>
>> "gup already tries to deal with long term pins on CMA regions and migrate
>> to a non CMA region. Have a look at __gup_longterm_locked."
>>
>> We should rather identify ways how that is still possible and get rid of
>> them.
>>
>>
>> Now, short-term pinnings and PCP are other issues where
>> alloc_contig_range() could be improved (e.g., in contrast to a FAST
>> mode, a HARD mode which temporarily disables the PCP, ...).
> 
> Agreed!
> 
>>> size (e.g., 2M) than requested order(64K) repeatedly until driver
>>> could gather necessary amount of memory. Basically, this approach
>>> makes the allocation very slow due to cma_alloc's function
>>> slowness and it could be stuck on one of the pageblocks if it
>>> encounters unmigratable page.
>>>
>>> To solve the issue, this patch introduces cma_alloc_bulk.
>>>
>>> 	int cma_alloc_bulk(struct cma *cma, unsigned int align,
>>> 		bool fast, unsigned int order, size_t nr_requests,
>>> 		struct page **page_array, size_t *nr_allocated);
>>>
>>> Most parameters are same with cma_alloc but it additionally passes
>>> vector array to store allocated memory. What's different with cma_alloc
>>> is it will skip pageblocks without waiting/stopping if it has unmovable
>>> page so that API continues to scan other pageblocks to find requested
>>> order page.
>>>
>>> cma_alloc_bulk is best effort approach in that it skips some pageblocks
>>> if they have unmovable pages unlike cma_alloc. It doesn't need to be
>>> perfect from the beginning at the cost of performance. Thus, the API
>>> takes "bool fast parameter" which is propagated into alloc_contig_range to
>>> avoid significat overhead functions to inrecase CMA allocation success
>>> ratio(e.g., migration retrial, PCP, LRU draining per pageblock)
>>> at the cost of less allocation success ratio. If the caller couldn't
>>> allocate enough, they could call it with "false" to increase success ratio
>>> if they are okay to expense the overhead for the success ratio.
>>
>> Just so I understand what the idea is:
>>
>> alloc_contig_range() sometimes fails on CMA regions when trying to
>> allocate big chunks (e.g., 300M). Instead of tackling that issue, you
>> rather allocate plenty of small chunks, and make these small allocations
>> fail faster/ make the allocations less reliable. Correct?
>>
>> I don't really have a strong opinion on that. Giving up fast rather than
>> trying for longer sounds like a useful thing to have - but I wonder if
>> it's strictly necessary for the use case you describe.
>>
>> I'd like to hear Michals opinion on that.
> 
> Well, what I can see is that this new interface is an antipatern to our
> allocation routines. We tend to control allocations by gfp mask yet you
> are introducing a bool parameter to make something faster... What that
> really means is rather arbitrary. Would it make more sense to teach
> cma_alloc resp. alloc_contig_range to recognize GFP_NOWAIT, GFP_NORETRY resp.
> GFP_RETRY_MAYFAIL instead?

Minchan did that before, but I disliked gluing things like "don't drain
lru, don't drain pcp" to GFP_NORETRY and shifting responsibility to the
user.


-- 
Thanks,

David / dhildenb

