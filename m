Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183B92F46AD
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 09:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbhAMIlD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 03:41:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51728 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726262AbhAMIlD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 03:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610527176;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wz/Vy/Cnya8aaX6TmCcBs5toJJRTuy9G5Pgif1Zbaps=;
        b=h98sz9t6B5XlKDXYzMezig8mfJLuMuyHyw9EzYVLsOSfweWkJ0VPwX2lXNRFyXFFTbgxdK
        e/wrHk5WNr3wur0LP0DjbMdyVQAgvAY057s/t4jBrj/refCFCLRKGkWVaJvSQE3zrrtfwj
        vvkIeVPXF/W0Mm23X+ftAqqY4SihtmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-5ykmI9XhN-2xGAaPK57QBw-1; Wed, 13 Jan 2021 03:39:32 -0500
X-MC-Unique: 5ykmI9XhN-2xGAaPK57QBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2490115720;
        Wed, 13 Jan 2021 08:39:30 +0000 (UTC)
Received: from [10.36.114.135] (ovpn-114-135.ams2.redhat.com [10.36.114.135])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F389560BF1;
        Wed, 13 Jan 2021 08:39:26 +0000 (UTC)
Subject: Re: [PATCH v3 2/4] mm: failfast mode with __GFP_NORETRY in
 alloc_contig_range
To:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        hyesoo.yu@samsung.com, mhocko@suse.com, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20210113012143.1201105-1-minchan@kernel.org>
 <20210113012143.1201105-3-minchan@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <723e935f-3aa4-2c55-8d69-fcaf71f4eb4c@redhat.com>
Date:   Wed, 13 Jan 2021 09:39:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210113012143.1201105-3-minchan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13.01.21 02:21, Minchan Kim wrote:
> Contiguous memory allocation can be stalled due to waiting
> on page writeback and/or page lock which causes unpredictable
> delay. It's a unavoidable cost for the requestor to get *big*
> contiguous memory but it's expensive for *small* contiguous
> memory(e.g., order-4) because caller could retry the request
> in diffrent range where would have easy migratable pages
> without stalling.

s/diffrent/different/

> 
> This patch introduce __GFP_NORETRY as compaction gfp_mask in
> alloc_contig_range so it will fail fast without blocking
> when it encounters pages needed waitting.

s/waitting/waiting/

> 
> Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
>  mm/page_alloc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 5b3923db9158..ff41ceb4db51 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -8489,12 +8489,16 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
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
> @@ -8511,7 +8515,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
>  				break;
>  			}
>  			tries = 0;
> -		} else if (++tries == 5) {
> +		} else if (++tries == max_tries) {
>  			ret = ret < 0 ? ret : -EBUSY;
>  			break;
>  		}
> @@ -8562,7 +8566,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
>  		.nr_migratepages = 0,
>  		.order = -1,
>  		.zone = page_zone(pfn_to_page(start)),
> -		.mode = MIGRATE_SYNC,
> +		.mode = gfp_mask & __GFP_NORETRY ? MIGRATE_ASYNC : MIGRATE_SYNC,
>  		.ignore_skip_hint = true,
>  		.no_set_skip_hint = true,
>  		.gfp_mask = current_gfp_context(gfp_mask),
> 

I'm fine with using gfp flags (e.g., __GFP_NORETRY) as long as they
don't enable other implicit behavior (e.g., move draining X to the
caller) that's hard to get from the flag name.

IMHO, if we ever want to move draining to the caller, or change the
behavior of alloc_contig_range() in different ways (e.g., disable PCP),
we won't get around introducing a separate set of flags for
alloc_contig_range().

Let's see what Michal thinks. Thanks!

-- 
Thanks,

David / dhildenb

