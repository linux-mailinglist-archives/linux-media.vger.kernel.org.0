Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DD02C0D38
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 15:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388892AbgKWOP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 09:15:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49036 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388870AbgKWOPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 09:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606140951;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qrhEgZWSM0CROI5Vz0uu9rwmyq7vhI6QnpKuTadBvHY=;
        b=eWB97NsFG7r6xMomdiIMxuSaT+iSNK1g6AJFJneVc43s4+4sd6NikxU7RAns9TEuA3YQMT
        Eyc/EUOp0uA3/NZv3MyO2McLnJdxS12yFHyfXwKjcayeT+6FBAy7+YacT20bjzOwKKvYZf
        E5tmsFU0KoctHNENrMXM9qxrnJASC9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-Hz5xVMq2PWqq9P4fJRRGJQ-1; Mon, 23 Nov 2020 09:15:46 -0500
X-MC-Unique: Hz5xVMq2PWqq9P4fJRRGJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45BAC100B713;
        Mon, 23 Nov 2020 14:15:43 +0000 (UTC)
Received: from [10.36.114.57] (ovpn-114-57.ams2.redhat.com [10.36.114.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1B3E35C1BD;
        Mon, 23 Nov 2020 14:15:38 +0000 (UTC)
Subject: Re: [PATCH 1/4] mm: introduce cma_alloc_bulk API
To:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        hyesoo.yu@samsung.com, willy@infradead.org, iamjoonsoo.kim@lge.com,
        vbabka@suse.cz, surenb@google.com, pullip.cho@samsung.com,
        joaodias@google.com, hridya@google.com, sumit.semwal@linaro.org,
        john.stultz@linaro.org, Brian.Starkey@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, christian.koenig@amd.com,
        linaro-mm-sig@lists.linaro.org
References: <20201117181935.3613581-1-minchan@kernel.org>
 <20201117181935.3613581-2-minchan@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <a2c33b8f-e4fb-1f1c-7ed0-496a1256ea09@redhat.com>
Date:   Mon, 23 Nov 2020 15:15:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117181935.3613581-2-minchan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17.11.20 19:19, Minchan Kim wrote:
> There is a need for special HW to require bulk allocation of
> high-order pages. For example, 4800 * order-4 pages, which
> would be minimum, sometimes, it requires more.
> 
> To meet the requirement, a option reserves 300M CMA area and
> requests the whole 300M contiguous memory. However, it doesn't
> work if even one of those pages in the range is long-term pinned
> directly or indirectly. The other option is to ask higher-order
> size (e.g., 2M) than requested order(64K) repeatedly until driver
> could gather necessary amount of memory. Basically, this approach
> makes the allocation very slow due to cma_alloc's function
> slowness and it could be stuck on one of the pageblocks if it
> encounters unmigratable page.
> 
> To solve the issue, this patch introduces cma_alloc_bulk.
> 
> 	int cma_alloc_bulk(struct cma *cma, unsigned int align,
> 		gfp_t gfp_mask, unsigned int order, size_t nr_requests,
> 		struct page **page_array, size_t *nr_allocated);
> 
> Most parameters are same with cma_alloc but it additionally passes
> vector array to store allocated memory. What's different with cma_alloc
> is it will skip pageblocks without waiting/stopping if it has unmovable
> page so that API continues to scan other pageblocks to find requested
> order page.
> 
> cma_alloc_bulk is best effort approach in that it skips some pageblocks
> if they have unmovable pages unlike cma_alloc. It doesn't need to be
> perfect from the beginning at the cost of performance. Thus, the API
> takes gfp_t to support __GFP_NORETRY which is propagated into
> alloc_contig_page to avoid significat overhead functions to inrecase
> CMA allocation success ratio(e.g., migration retrial, PCP, LRU draining
> per pageblock) at the cost of less allocation success ratio.
> If the caller couldn't allocate enough pages with __GFP_NORETRY, they
> could call it without __GFP_NORETRY to increase success ratio this time
> if they are okay to expense the overhead for the success ratio.

I'm not a friend of connecting __GFP_NORETRY  to PCP and LRU draining.
Also, gfp flags apply mostly to compaction (e.g., how to allocate free
pages for migration), so this seems a little wrong.

Can we instead introduce

enum alloc_contig_mode {
	/*
	 * Normal mode:
	 *
	 * Retry page migration 5 times, ... TBD
	 *
	 */
	ALLOC_CONTIG_NORMAL = 0,
	/*
	 * Fast mode: e.g., used for bulk allocations.
         *
	 * Don't retry page migration if it fails, don't drain PCP
         * lists, don't drain LRU.
	 */
	ALLOC_CONTIG_FAST,
};

To be extended by ALLOC_CONTIG_HARD in the future to be used e.g., by
virtio-mem (disable PCP, retry a couple of times more often ) ...

-- 
Thanks,

David / dhildenb

