Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125A82CD2D8
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 10:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbgLCJsm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 04:48:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59626 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726070AbgLCJsl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 04:48:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606988834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nmv2c/m904JsV4MmCRDhQqX5isjeRuAKPuEeYSe68E0=;
        b=IP4lfzCn/FIkfBTJveoL8aMYxEI6kI4IsXEasM/zJGyjKdA8ziU0crm4jHJqBnVRBNH8wK
        1qFtNfchbjDM6GTLpf7yihn6TLD6iLK3IEaMPiQ8b6AWwPVRtq1Ol5yU+GVkOFbUHz/Fix
        B77es6hZmOqAq9/bNaEtty6hux60p0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-QzVy-pg6OUCfjbpkjQUCRA-1; Thu, 03 Dec 2020 04:47:10 -0500
X-MC-Unique: QzVy-pg6OUCfjbpkjQUCRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1A128042C6;
        Thu,  3 Dec 2020 09:47:07 +0000 (UTC)
Received: from [10.36.113.250] (ovpn-113-250.ams2.redhat.com [10.36.113.250])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CF75A189C4;
        Thu,  3 Dec 2020 09:47:03 +0000 (UTC)
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
 <20201202154915.GU17338@dhcp22.suse.cz> <X8e9tSwcsrEsAv1O@google.com>
 <20201202164834.GV17338@dhcp22.suse.cz> <X8fU1ddmsSfuV6sD@google.com>
 <20201202185107.GW17338@dhcp22.suse.cz> <X8fqU82GXmu57f7V@google.com>
 <f0e980cb-cc74-82e8-6ccf-09030a96103a@redhat.com>
 <20201203082810.GX17338@dhcp22.suse.cz>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <c5209dce-dc30-6d8d-e8f8-c5412b072310@redhat.com>
Date:   Thu, 3 Dec 2020 10:47:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203082810.GX17338@dhcp22.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03.12.20 09:28, Michal Hocko wrote:
> On Wed 02-12-20 21:22:36, David Hildenbrand wrote:
>> On 02.12.20 20:26, Minchan Kim wrote:
>>> On Wed, Dec 02, 2020 at 07:51:07PM +0100, Michal Hocko wrote:
> [...]
>>>> I am still not sure a specific flag is a good interface. Really can this
>>>> be gfp_mask instead?
>>>
>>> I am not strong(even, I did it with GFP_NORETRY) but David wanted to
>>> have special mode and I agreed when he mentioned ALLOC_CONTIG_HARD as
>>> one of options in future(it would be hard to indicate that mode with
>>> gfp flags).
>>
>> I can't tell regarding the CMA interface, but for the alloc_contig()
>> interface I think modes make sense. Yes, it's different to other
>> allocaters, but the contig range allocater is different already. E.g.,
>> the CMA allocater mostly hides "which exact PFNs you try to allocate".
> 
> Yes, alloc_contig_range is a low level API but it already has a gfp_mask
> parameter. Adding yet another allocation mode sounds like API
> convolution to me.

Well, if another parameter is a concern, we can introduce

alloc_contig_range_fast()

instead.

> 
>> In the contig range allocater, gfp flags are currently used to express
>> how to allocate pages used as migration targets. I don't think mangling
>> in other gfp flags (or even overloading them) makes things a lot
>> clearer. E.g., GFP_NORETRY: don't retry to allocate migration targets?
>> don't retry to migrate pages? both?
>>
>> As I said, other aspects might be harder to model (e.g., don't drain
>> LRU) and hiding them behind generic gfp flags (e.g., GFP_NORETRY) feels
>> wrong.
>>
>> With the mode, we're expressing details for the necessary page
>> migration. Suggestions on how to model that are welcome.
> 
> The question is whether the caller should really have such an intimate
> knowledge and control of the alloc_contig_range implementation. This all
> are implementation details. Should really anybody think about how many
> times migration retries or control LRU draining? Those can change in the

The question is not "how many times", rather "if at all". I can
understand the possible performance improvements by letting the caller
handle things (lru draining, pcp draining) like that when issuing
gazillions of alloc_contig_range() calls.

> future and I do not think we really want to go over all users grown over
> that time and try to deduce what was the intention behind.

That's why I think we need a clear mechanism to express the expected
behavior - something we can properly document and users can actually
understand to optimize for - and we can fix them up when the documented
behavior changes. Mangling this into somewhat-fitting gfp flags makes
the interface harder to use and more error-prone IMHO.

> 
> I think we should aim at easy and very highlevel behavior:
> - GFP_NOWAIT - unsupported currently IIRC but something that something
>   that should be possible to implement. Isolation is non blocking,
>   migration could be skipped
> - GFP_KERNEL - default behavior whatever that means
> - GFP_NORETRY - opportunistic allocation as lightweight as we can get.
>   Failures to be expected also for transient reasons.
> - GFP_RETRY_MAYFAIL - try hard but not as hard as to trigger disruption
>   (e.g. via oom killer).

I think we currently see demand for 3 modes for alloc_contig_range()

a) normal

As is. Try, but don't try too hard. E.g., drain LRU, drain PCP, retry a
couple of times. Failures in some cases (short-term pinning, PCP races)
are still possible and acceptable.

GFP_RETRY_MAYFAIL ?

E.g., "Allocations with this flag may fail, but only when there is
genuinely little unused memory." - current description does not match at
all. When allocating ranges things behave completely different.


b) fast

Try, but fail fast. Leave optimizations that can improve the result to
the caller. E.g., don't drain LRU, don't drain PCP, don't retry.
Frequent failures are expected and acceptable.

__GFP_NORETRY ?

E.g., "The VM implementation will try only very lightweight memory
direct reclaim to get some memory under memory pressure" - again, I
think current description does not really match.


c) hard

Try hard, E.g., temporarily disabling the PCP. Certainly not
__GFP_NOFAIL, that would be highly dangerous. So no flags / GFP_KERNEL?

> 
> - __GFP_THIS_NODE - stick to a node without fallback
> - we can support zone modifiers although there is no existing user.
> - __GFP_NOWARN - obvious
> 
> And that is it. Or maybe I am seeing that oversimplified.
> 

Again, I think most flags make sense for the migration target allocation
 path and mainly deal with OOM situations and reclaim. For the migration
path - which is specific to the alloc_contig_range() allocater - they
don't really apply and create more confusion than they actually help - IMHO.

-- 
Thanks,

David / dhildenb

