Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F06F30255A
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 14:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbhAYNNB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 08:13:01 -0500
Received: from mx2.suse.de ([195.135.220.15]:37966 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728608AbhAYNMv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:12:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1611580322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gWGUX5BQka/TYr2ZK97IOPcurnLuL5UlU4w1UDBIDS0=;
        b=S+u9xiNJ/Y4QHOvsaNZi3Tr/iedHMRiBhIjW1BWvXuuMLQOIPa+GFfFxUJMPT7JjIGmHqB
        1DjahGJq23HDdtJO0cXw7I4Sa7DvBuH/47YZpWQLcYyJlOHyiaCSqr0q5s6Fmq0ZdLVmZc
        R/vSTXP1DwuGAf8EX7FBJrFNUYDo0HY=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1FD60AC45;
        Mon, 25 Jan 2021 13:12:02 +0000 (UTC)
Date:   Mon, 25 Jan 2021 14:12:00 +0100
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
Message-ID: <20210125131200.GG827@dhcp22.suse.cz>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-3-minchan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121175502.274391-3-minchan@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu 21-01-21 09:55:00, Minchan Kim wrote:
> Contiguous memory allocation can be stalled due to waiting
> on page writeback and/or page lock which causes unpredictable
> delay. It's a unavoidable cost for the requestor to get *big*
> contiguous memory but it's expensive for *small* contiguous
> memory(e.g., order-4) because caller could retry the request
> in different range where would have easy migratable pages
> without stalling.
> 
> This patch introduce __GFP_NORETRY as compaction gfp_mask in
> alloc_contig_range so it will fail fast without blocking
> when it encounters pages needed waiting.

I am not against controling how hard this allocator tries with gfp mask
but this changelog is rather void on any data and any user.

It is also rather dubious to have retries when then caller says to not
retry.

Also why didn't you consider GFP_NOWAIT semantic for non blocking mode?

> Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
>  mm/page_alloc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index b031a5ae0bd5..1cdc3ee0b22e 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -8491,12 +8491,16 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
>  	unsigned int nr_reclaimed;
>  	unsigned long pfn = start;
>  	unsigned int tries = 0;
> +	unsigned int max_tries = 5;
>  	int ret = 0;
>  	struct migration_target_control mtc = {
>  		.nid = zone_to_nid(cc->zone),
>  		.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
>  	};
>  
> +	if (cc->alloc_contig && cc->mode == MIGRATE_ASYNC)
> +		max_tries = 1;
> +
>  	migrate_prep();
>  
>  	while (pfn < end || !list_empty(&cc->migratepages)) {
> @@ -8513,7 +8517,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
>  				break;
>  			}
>  			tries = 0;
> -		} else if (++tries == 5) {
> +		} else if (++tries == max_tries) {
>  			ret = ret < 0 ? ret : -EBUSY;
>  			break;
>  		}
> @@ -8564,7 +8568,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
>  		.nr_migratepages = 0,
>  		.order = -1,
>  		.zone = page_zone(pfn_to_page(start)),
> -		.mode = MIGRATE_SYNC,
> +		.mode = gfp_mask & __GFP_NORETRY ? MIGRATE_ASYNC : MIGRATE_SYNC,
>  		.ignore_skip_hint = true,
>  		.no_set_skip_hint = true,
>  		.gfp_mask = current_gfp_context(gfp_mask),
> -- 
> 2.30.0.296.g2bfb1c46d8-goog

-- 
Michal Hocko
SUSE Labs
