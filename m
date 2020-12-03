Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22532CD4E2
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbgLCLsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:48:37 -0500
Received: from mx2.suse.de ([195.135.220.15]:51776 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726710AbgLCLsg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 06:48:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1606996070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WdKmdYnwmnj2SC50EKwyFiX7FW/+oQeHbUAT/XBMu74=;
        b=Z3WBmDj49gC8U1gp2kb3oi8QpP7B85jdgQlpkvQcvulESDp0PXpILM5nZz/hp5jw9+/afT
        8hPFNYJ5G4JqUUSMaYgIeXW6dYQHvyjSu2UDffeIr/zW/ADnaQ5faqZE9Uq4gJGgqTCaSQ
        kils5BbwPWFohjg0fKAXoMG9UqDj1mg=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D83D9AC75;
        Thu,  3 Dec 2020 11:47:49 +0000 (UTC)
Date:   Thu, 3 Dec 2020 12:47:48 +0100
From:   Michal Hocko <mhocko@suse.com>
To:     David Hildenbrand <david@redhat.com>
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
Subject: Re: [PATCH v2 2/4] mm: introduce cma_alloc_bulk API
Message-ID: <20201203114748.GB17338@dhcp22.suse.cz>
References: <8f006a4a-c21d-9db3-5493-fb1cc651b0cf@redhat.com>
 <20201202154915.GU17338@dhcp22.suse.cz>
 <X8e9tSwcsrEsAv1O@google.com>
 <20201202164834.GV17338@dhcp22.suse.cz>
 <X8fU1ddmsSfuV6sD@google.com>
 <20201202185107.GW17338@dhcp22.suse.cz>
 <X8fqU82GXmu57f7V@google.com>
 <f0e980cb-cc74-82e8-6ccf-09030a96103a@redhat.com>
 <20201203082810.GX17338@dhcp22.suse.cz>
 <c5209dce-dc30-6d8d-e8f8-c5412b072310@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5209dce-dc30-6d8d-e8f8-c5412b072310@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu 03-12-20 10:47:02, David Hildenbrand wrote:
> On 03.12.20 09:28, Michal Hocko wrote:
[...]
> > I think we should aim at easy and very highlevel behavior:
> > - GFP_NOWAIT - unsupported currently IIRC but something that something
> >   that should be possible to implement. Isolation is non blocking,
> >   migration could be skipped
> > - GFP_KERNEL - default behavior whatever that means
> > - GFP_NORETRY - opportunistic allocation as lightweight as we can get.
> >   Failures to be expected also for transient reasons.
> > - GFP_RETRY_MAYFAIL - try hard but not as hard as to trigger disruption
> >   (e.g. via oom killer).
> 
> I think we currently see demand for 3 modes for alloc_contig_range()
> 
> a) normal
> 
> As is. Try, but don't try too hard. E.g., drain LRU, drain PCP, retry a
> couple of times. Failures in some cases (short-term pinning, PCP races)
> are still possible and acceptable.
> 
> GFP_RETRY_MAYFAIL ?

normal shouldn't really require anybody to think about gfp flags hard.
That to most people really means GFP_KERNEL.

> E.g., "Allocations with this flag may fail, but only when there is
> genuinely little unused memory." - current description does not match at
> all. When allocating ranges things behave completely different.
> 
> 
> b) fast
> 
> Try, but fail fast. Leave optimizations that can improve the result to
> the caller. E.g., don't drain LRU, don't drain PCP, don't retry.
> Frequent failures are expected and acceptable.
> 
> __GFP_NORETRY ?
> 
> E.g., "The VM implementation will try only very lightweight memory
> direct reclaim to get some memory under memory pressure" - again, I
> think current description does not really match.

Agreed. As mentioned above this would be an opportunistic allocation
mode.

 
> c) hard
> 
> Try hard, E.g., temporarily disabling the PCP. Certainly not
> __GFP_NOFAIL, that would be highly dangerous. So no flags / GFP_KERNEL?

NOFAIL semantic is out of question. Should we have a mode to try harder
than the default? I dunno. Do we have users? I think RETRY_MAYFAIL is a
middle ground between the default and NORETRY which is just too easy to
fail. This is the case for the allocator as well. And from what I have
seen people are already using MAYFAIL in order to prevent oom killer so
this is a generally recognized pattern.

> > - __GFP_THIS_NODE - stick to a node without fallback
> > - we can support zone modifiers although there is no existing user.
> > - __GFP_NOWARN - obvious
> > 
> > And that is it. Or maybe I am seeing that oversimplified.
> > 
> 
> Again, I think most flags make sense for the migration target allocation
>  path and mainly deal with OOM situations and reclaim. For the migration
> path - which is specific to the alloc_contig_range() allocater - they
> don't really apply and create more confusion than they actually help - IMHO.

Migration is really an implementation detail of this interface. You
shouldn't be even thinking that there is a migration underneath not even
mention to actually trying to control it. But well, we might end up
disagreeing here. What actually matters is existing users of the
interface.

-- 
Michal Hocko
SUSE Labs
