Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA201304883
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388467AbhAZFod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:44:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:54924 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728596AbhAYNIU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:08:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1611580022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IhcDfMh/jgC3sT4h+BE3+sZhvOB29e/Mf8pMb+zJIT0=;
        b=pqbf9RDe5VxSZd9L0YIIOoOlPu/IynyL+x6JpR3MRCabAN3cLPy3Zjwo/H1rJHa9kRkA7A
        uA7NaxsuOURWeuXjI5lKxMjaCgFUU4QZiVqGL/HjT7bc4EWUeVa7RiuinVL2lnDRKNVHCr
        5xu4S2KojVAYad9KZN/+J6Lg/NCBAu8=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9BAE1AAC6;
        Mon, 25 Jan 2021 13:07:02 +0000 (UTC)
Date:   Mon, 25 Jan 2021 14:07:01 +0100
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
Subject: Re: [PATCH v4 1/4] mm: cma: introduce gfp flag in cma_alloc instead
 of no_warn
Message-ID: <20210125130701.GF827@dhcp22.suse.cz>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-2-minchan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121175502.274391-2-minchan@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu 21-01-21 09:54:59, Minchan Kim wrote:
> The upcoming patch will introduce __GFP_NORETRY semantic
> in alloc_contig_range which is a failfast mode of the API.
> Instead of adding a additional parameter for gfp, replace
> no_warn with gfp flag.
> 
> To keep old behaviors, it follows the rule below.
> 
>   no_warn 			gfp_flags
> 
>   false         		GFP_KERNEL
>   true          		GFP_KERNEL|__GFP_NOWARN
>   gfp & __GFP_NOWARN		GFP_KERNEL | (gfp & __GFP_NOWARN)
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>
[...]
> diff --git a/mm/cma.c b/mm/cma.c
> index 0ba69cd16aeb..d50627686fec 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -419,13 +419,13 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
>   * @cma:   Contiguous memory region for which the allocation is performed.
>   * @count: Requested number of pages.
>   * @align: Requested alignment of pages (in PAGE_SIZE order).
> - * @no_warn: Avoid printing message about failed allocation
> + * @gfp_mask: GFP mask to use during the cma allocation.

Call out supported gfp flags explicitly. Have a look at kvmalloc_node
for a guidance.
-- 
Michal Hocko
SUSE Labs
