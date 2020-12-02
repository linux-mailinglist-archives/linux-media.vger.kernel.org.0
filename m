Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5A72CC7B4
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 21:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731214AbgLBUYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 15:24:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48958 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731185AbgLBUYT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 15:24:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606940572;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VxTO3aciJZ2bU+jhahVsvyDtmGYNE3uq+gQ+8//dVvg=;
        b=FEkWgtWMc/uscC7LAX5h0yzRtVgFOWpJZs52mWnO1ddmx1b7yh+1mFz4QKha830aznQSCK
        9kbHxOsO2TpFmy++2x6zVi6935H7tKBtb/cBF69NSJUMDCu9nQTesnWRgmD2wUCPc9Ap77
        mTg0HLWB5UTm+bmxXYTq1g+xTfP5VoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-Ixn4TkeAOOycxeVYL8XwNQ-1; Wed, 02 Dec 2020 15:22:48 -0500
X-MC-Unique: Ixn4TkeAOOycxeVYL8XwNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62C97185E497;
        Wed,  2 Dec 2020 20:22:45 +0000 (UTC)
Received: from [10.36.114.61] (ovpn-114-61.ams2.redhat.com [10.36.114.61])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7BAEB5D6AC;
        Wed,  2 Dec 2020 20:22:40 +0000 (UTC)
Subject: Re: [PATCH v2 2/4] mm: introduce cma_alloc_bulk API
To:     Minchan Kim <minchan@kernel.org>, Michal Hocko <mhocko@suse.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
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
 <20201202154915.GU17338@dhcp22.suse.cz> <X8e9tSwcsrEsAv1O@google.com>
 <20201202164834.GV17338@dhcp22.suse.cz> <X8fU1ddmsSfuV6sD@google.com>
 <20201202185107.GW17338@dhcp22.suse.cz> <X8fqU82GXmu57f7V@google.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <f0e980cb-cc74-82e8-6ccf-09030a96103a@redhat.com>
Date:   Wed, 2 Dec 2020 21:22:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <X8fqU82GXmu57f7V@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02.12.20 20:26, Minchan Kim wrote:
> On Wed, Dec 02, 2020 at 07:51:07PM +0100, Michal Hocko wrote:
>> On Wed 02-12-20 09:54:29, Minchan Kim wrote:
>>> On Wed, Dec 02, 2020 at 05:48:34PM +0100, Michal Hocko wrote:
>>>> On Wed 02-12-20 08:15:49, Minchan Kim wrote:
>>>>> On Wed, Dec 02, 2020 at 04:49:15PM +0100, Michal Hocko wrote:
>>>> [...]
>>>>>> Well, what I can see is that this new interface is an antipatern to our
>>>>>> allocation routines. We tend to control allocations by gfp mask yet you
>>>>>> are introducing a bool parameter to make something faster... What that
>>>>>> really means is rather arbitrary. Would it make more sense to teach
>>>>>> cma_alloc resp. alloc_contig_range to recognize GFP_NOWAIT, GFP_NORETRY resp.
>>>>>> GFP_RETRY_MAYFAIL instead?
>>>>>
>>>>> If we use cma_alloc, that interface requires "allocate one big memory
>>>>> chunk". IOW, return value is just struct page and expected that the page
>>>>> is a big contiguos memory. That means it couldn't have a hole in the
>>>>> range.
>>>>> However the idea here, what we asked is much smaller chunk rather
>>>>> than a big contiguous memory so we could skip some of pages if they are
>>>>> randomly pinned(long-term/short-term whatever) and search other pages
>>>>> in the CMA area to avoid long stall. Thus, it couldn't work with exising
>>>>> cma_alloc API with simple gfp_mak.
>>>>
>>>> I really do not see that as something really alient to the cma_alloc
>>>> interface. All you should care about, really, is what size of the object
>>>> you want and how hard the system should try. If you have a problem with
>>>> an internal implementation of CMA and how it chooses a range and deal
>>>> with pinned pages then it should be addressed inside the CMA allocator.
>>>> I suspect that you are effectivelly trying to workaround those problems
>>>> by a side implementation with a slightly different API. Or maybe I still
>>>> do not follow the actual problem.
>>>>  
>>>>>> I am not deeply familiar with the cma allocator so sorry for a
>>>>>> potentially stupid question. Why does a bulk interface performs better
>>>>>> than repeated calls to cma_alloc? Is this because a failure would help
>>>>>> to move on to the next pfn range while a repeated call would have to
>>>>>> deal with the same range?
>>>>>
>>>>> Yub, true with other overheads(e.g., migration retrial, waiting writeback
>>>>> PCP/LRU draining IPI)
>>>>
>>>> Why cannot this be implemented in the cma_alloc layer? I mean you can
>>>> cache failed cases and optimize the proper pfn range search.
>>>
>>> So do you suggest this?
>>>
>>> enum cma_alloc_mode {
>>> 	CMA_ALLOC_NORMAL,
>>> 	CMA_ALLOC_FAIL_FAST,
>>> };
>>>
>>> struct page *cma_alloc(struct cma *cma, size_t count, unsigned int
>>> 	align, enum cma_alloc_mode mode);
>>>
>>> >From now on, cma_alloc will keep last failed pfn and then start to
>>> search from the next pfn for both CMA_ALLOC_NORMAL and
>>> CMA_ALLOC_FAIL_FAST if requested size from the cached pfn is okay
>>> within CMA area and then wraparound it couldn't find right pages
>>> from the cached pfn. Othewise, the cached pfn will reset to the zero
>>> so that it starts the search from the 0. I like the idea since it's
>>> general improvement, I think.
>>
>> Yes something like that. There are more options to be clever here - e.g.
>> track ranges etc. but I am not sure this is worth the complexity.
> 
> Agree. Just last pfn caching would be good enough as simple start.
> 
>>
>>> Furthemore, With CMA_ALLOC_FAIL_FAST, it could avoid several overheads
>>> at the cost of sacrificing allocation success ratio like GFP_NORETRY.
>>
>> I am still not sure a specific flag is a good interface. Really can this
>> be gfp_mask instead?
> 
> I am not strong(even, I did it with GFP_NORETRY) but David wanted to
> have special mode and I agreed when he mentioned ALLOC_CONTIG_HARD as
> one of options in future(it would be hard to indicate that mode with
> gfp flags).

I can't tell regarding the CMA interface, but for the alloc_contig()
interface I think modes make sense. Yes, it's different to other
allocaters, but the contig range allocater is different already. E.g.,
the CMA allocater mostly hides "which exact PFNs you try to allocate".

In the contig range allocater, gfp flags are currently used to express
how to allocate pages used as migration targets. I don't think mangling
in other gfp flags (or even overloading them) makes things a lot
clearer. E.g., GFP_NORETRY: don't retry to allocate migration targets?
don't retry to migrate pages? both?

As I said, other aspects might be harder to model (e.g., don't drain
LRU) and hiding them behind generic gfp flags (e.g., GFP_NORETRY) feels
wrong.

With the mode, we're expressing details for the necessary page
migration. Suggestions on how to model that are welcome.

-- 
Thanks,

David / dhildenb

