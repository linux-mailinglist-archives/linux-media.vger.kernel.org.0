Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2671530704B
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 08:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhA1Hyc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 02:54:32 -0500
Received: from mx2.suse.de ([195.135.220.15]:49972 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232173AbhA1HyN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 02:54:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1611820406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xSK7HTq3+bwPr5/ZmeHgDam4Owbrz6XJGaTagKZ9+Sc=;
        b=JBFgrFCavxvgBNIvYnVReaCc/L1j5MxrQZNythF4AUSJ25X5TtF5VN1jumotZkagat0tSo
        pwk7RC9SU5eAz9zppnc8tAmzpbNjvBDAksxhBTmbk1WJs10RbLoc8ga6FwjNo1cFuEFnEU
        8lDAPhWlIxmT0d8GZB5YZZwLPPAeHoc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AD9F3AC45;
        Thu, 28 Jan 2021 07:53:26 +0000 (UTC)
Date:   Thu, 28 Jan 2021 08:53:25 +0100
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
Message-ID: <YBJtdT5Tf5mRsE9U@dhcp22.suse.cz>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-3-minchan@kernel.org>
 <20210125131200.GG827@dhcp22.suse.cz>
 <YA8dEFSrHBb9muFr@google.com>
 <20210126074449.GA827@dhcp22.suse.cz>
 <YBHQRY8kw8/wjFK8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBHQRY8kw8/wjFK8@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed 27-01-21 12:42:45, Minchan Kim wrote:
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
> Before sending next revision, let me check this part again.
> 
> I want to use __GFP_NORETRY to indicate "opportunistic-easy-to-fail attempt"
> and I want to use ASYNC migrate_mode to help the goal.
> 
> Do you see the problem?

No, as I've said. This is a normal NORETRY policy. And ASYNC migration
is a mere implementation detail you do not have bother your users about.
This is the semantic view. From the implementation POV it should be the
gfp mask to drive decisions rather than a random (ASYNC) flag to control
retries as you did here.

-- 
Michal Hocko
SUSE Labs
