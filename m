Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3627305571
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 09:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234769AbhA0IRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 03:17:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:38672 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232896AbhA0IPE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 03:15:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1611735249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=E5AhEGs1fZHdUiGxkSymBk7PBZi4G6XOuFjXSG9Eq4o=;
        b=mej6njj16e/xkk21Dx/xEB1pgXTMf6sb6IneUutMWu6NULauH+X2idainwluKw5kdb5uVo
        cnfJSayyz1mlydC/QVOOa742m4v2mXUvJNigoop4fq7aX9g80y5KQUb5lST8ZCZZleG7Fe
        QwZ1ieA6PznUBPI95WrQItCnV8n757A=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 53A5FB73C;
        Wed, 27 Jan 2021 08:14:09 +0000 (UTC)
Date:   Wed, 27 Jan 2021 09:14:08 +0100
From:   Michal Hocko <mhocko@suse.com>
To:     Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, hyesoo.yu@samsung.com,
        david@redhat.com, surenb@google.com, pullip.cho@samsung.com,
        joaodias@google.com, hridya@google.com, john.stultz@linaro.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 2/4] mm: failfast mode with __GFP_NORETRY in
 alloc_contig_range
Message-ID: <20210127081408.GA827@dhcp22.suse.cz>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-3-minchan@kernel.org>
 <20210125131200.GG827@dhcp22.suse.cz>
 <YA8dEFSrHBb9muFr@google.com>
 <20210126074449.GA827@dhcp22.suse.cz>
 <YBBpGji3BJYHidHs@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBBpGji3BJYHidHs@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue 26-01-21 11:10:18, Minchan Kim wrote:
> On Tue, Jan 26, 2021 at 08:44:49AM +0100, Michal Hocko wrote:
> > On Mon 25-01-21 11:33:36, Minchan Kim wrote:
> > > On Mon, Jan 25, 2021 at 02:12:00PM +0100, Michal Hocko wrote:
> > > > On Thu 21-01-21 09:55:00, Minchan Kim wrote:
> > > > > Contiguous memory allocation can be stalled due to waiting
> > > > > on page writeback and/or page lock which causes unpredictable
> > > > > delay. It's a unavoidable cost for the requestor to get *big*
> > > > > contiguous memory but it's expensive for *small* contiguous
> > > > > memory(e.g., order-4) because caller could retry the request
> > > > > in different range where would have easy migratable pages
> > > > > without stalling.
> > > > > 
> > > > > This patch introduce __GFP_NORETRY as compaction gfp_mask in
> > > > > alloc_contig_range so it will fail fast without blocking
> > > > > when it encounters pages needed waiting.
> > > > 
> > > > I am not against controling how hard this allocator tries with gfp mask
> > > > but this changelog is rather void on any data and any user.
> > > > 
> > > > It is also rather dubious to have retries when then caller says to not
> > > > retry.
> > > 
> > > Since max_tries is 1 with ++tries, it shouldn't retry.
> > 
> > OK, I have missed that. This is a tricky code. ASYNC mode should be
> > completely orthogonal to the retries count. Those are different things.
> > Page allocator does an explicit bail out based on __GFP_NORETRY. You
> > should be doing the same.
> 
> A concern with __GFP_NOWAIT is regardless of flags passed to cma_alloc,
> internal implementation of alloc_contig_range inside will use blockable
> operation. See __alloc_contig_migrate_range.

Yes it is now. But nothing should prevent from making it non blockable.

> If we go with __GFP_NOWAIT, we should propagate the gfp_mask inside of
> __alloc_contig_migrate_range to make cma_alloc consistent with alloc_pages.

Absolutely. You should be doing that anyway. As I've said above you
shouldn't rely on side effects like ASYNC mode.

> (IIUC, that's what you want - make gfp_mask consistent between cma_alloc
> and alloc_pages) but I am worry about the direction will make complicate
> situation since cma invovles migration context as well as target page
> allocation context. Sometime, the single gfp flag could be trouble
> to express both contexts all at once. 

I am not sure I see your concern.

> > > > Also why didn't you consider GFP_NOWAIT semantic for non blocking mode?
> > > 
> > > GFP_NOWAIT seems to be low(specific) flags rather than the one I want to
> > > express. Even though I said only page writeback/lock in the description,
> > > the goal is to avoid costly operations we might find later so such
> > > "failfast", I thought GFP_NORETRY would be good fit.
> > 
> > I suspect you are too focused on implementation details here. Think
> > about the indended semantic. Callers of this functionality will not
> > think about those (I hope because if they rely on these details then the
> > whole thing will become unmaintainable because any change would require
> > an audit of all existing users). All you should be caring about is to
> > control how expensive the call can be. GFP_NOWAIT is not really low
> > level from that POV. It gives you a very lightweight non-sleeping
> > attempt to allocate. GFP_NORETRY will give you potentially sleeping but
> > an opportunistic-easy-to-fail attempt. And so on. See how that is
> > absolutely free of any page writeback or any specific locking.
> 
> With above reason I mentioned, I wanted to express __GFP_NORETRY as 
> "opportunistic-easy-to-fail attempt" to support cma_alloc as "failfast"
> for migration context.

Yes that is fine. And please note that I do not push for NOWAIT
semantic. If there is no user for that now then fine.
-- 
Michal Hocko
SUSE Labs
