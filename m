Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD1F12CD148
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 09:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388288AbgLCI26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 03:28:58 -0500
Received: from mx2.suse.de ([195.135.220.15]:40186 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387930AbgLCI26 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 03:28:58 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1606984091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lvqlZ6j4ecvpz5CpignKdj4ZIJADyOQ2v3MpOCK6bm4=;
        b=St3RQ130psFTUyJlyc8XSrCsmDBeEM1F183b9mOeuZotTvFO7HnHD1mdVPcI6lG7CacWKI
        IipKBLVK7E0Q26hzFh3RuvzQIOeONMKhAU1LsULVaGui25rRegjHVXgs/OAvIc7mweQX3f
        QhOg895yWbRkGhKgnM89jW7UqKie5gQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 577A2ACC2;
        Thu,  3 Dec 2020 08:28:11 +0000 (UTC)
Date:   Thu, 3 Dec 2020 09:28:10 +0100
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
Message-ID: <20201203082810.GX17338@dhcp22.suse.cz>
References: <20201201175144.3996569-1-minchan@kernel.org>
 <20201201175144.3996569-3-minchan@kernel.org>
 <8f006a4a-c21d-9db3-5493-fb1cc651b0cf@redhat.com>
 <20201202154915.GU17338@dhcp22.suse.cz>
 <X8e9tSwcsrEsAv1O@google.com>
 <20201202164834.GV17338@dhcp22.suse.cz>
 <X8fU1ddmsSfuV6sD@google.com>
 <20201202185107.GW17338@dhcp22.suse.cz>
 <X8fqU82GXmu57f7V@google.com>
 <f0e980cb-cc74-82e8-6ccf-09030a96103a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0e980cb-cc74-82e8-6ccf-09030a96103a@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed 02-12-20 21:22:36, David Hildenbrand wrote:
> On 02.12.20 20:26, Minchan Kim wrote:
> > On Wed, Dec 02, 2020 at 07:51:07PM +0100, Michal Hocko wrote:
[...]
> >> I am still not sure a specific flag is a good interface. Really can this
> >> be gfp_mask instead?
> > 
> > I am not strong(even, I did it with GFP_NORETRY) but David wanted to
> > have special mode and I agreed when he mentioned ALLOC_CONTIG_HARD as
> > one of options in future(it would be hard to indicate that mode with
> > gfp flags).
> 
> I can't tell regarding the CMA interface, but for the alloc_contig()
> interface I think modes make sense. Yes, it's different to other
> allocaters, but the contig range allocater is different already. E.g.,
> the CMA allocater mostly hides "which exact PFNs you try to allocate".

Yes, alloc_contig_range is a low level API but it already has a gfp_mask
parameter. Adding yet another allocation mode sounds like API
convolution to me.

> In the contig range allocater, gfp flags are currently used to express
> how to allocate pages used as migration targets. I don't think mangling
> in other gfp flags (or even overloading them) makes things a lot
> clearer. E.g., GFP_NORETRY: don't retry to allocate migration targets?
> don't retry to migrate pages? both?
>
> As I said, other aspects might be harder to model (e.g., don't drain
> LRU) and hiding them behind generic gfp flags (e.g., GFP_NORETRY) feels
> wrong.
> 
> With the mode, we're expressing details for the necessary page
> migration. Suggestions on how to model that are welcome.

The question is whether the caller should really have such an intimate
knowledge and control of the alloc_contig_range implementation. This all
are implementation details. Should really anybody think about how many
times migration retries or control LRU draining? Those can change in the
future and I do not think we really want to go over all users grown over
that time and try to deduce what was the intention behind.

I think we should aim at easy and very highlevel behavior:
- GFP_NOWAIT - unsupported currently IIRC but something that something
  that should be possible to implement. Isolation is non blocking,
  migration could be skipped
- GFP_KERNEL - default behavior whatever that means
- GFP_NORETRY - opportunistic allocation as lightweight as we can get.
  Failures to be expected also for transient reasons.
- GFP_RETRY_MAYFAIL - try hard but not as hard as to trigger disruption
  (e.g. via oom killer).

- __GFP_THIS_NODE - stick to a node without fallback
- we can support zone modifiers although there is no existing user.
- __GFP_NOWARN - obvious

And that is it. Or maybe I am seeing that oversimplified.
-- 
Michal Hocko
SUSE Labs
