Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C2930472D
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 19:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbhAZRLj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 12:11:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:55270 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389499AbhAZHj3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 02:39:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1611646694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=M0mfPAgr5/mcN1gE3PCuv5bB2pgiXjtbaOMlL4p0sos=;
        b=dsN+HPpNY9OXHC9dhykB1ubNv7WY+/ssIg+VKsRreb5xETHkTsTy8aRfsyHDwwgKdOPzP0
        qKyX9kw9S0Bk0tz8DxM73Y+gzQhzQ+8sLd8bNWurnabNn6pNiENZhfoXXBGczpWSztCK9H
        QDqCpDzJ61X1KCI15VL6J8c5NJdRVsc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BF732AE56;
        Tue, 26 Jan 2021 07:38:14 +0000 (UTC)
Date:   Tue, 26 Jan 2021 08:38:08 +0100
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
Message-ID: <20210126073808.GZ827@dhcp22.suse.cz>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-2-minchan@kernel.org>
 <20210125130701.GF827@dhcp22.suse.cz>
 <YA8fKgFLuOi/rSez@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YA8fKgFLuOi/rSez@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon 25-01-21 11:42:34, Minchan Kim wrote:
> On Mon, Jan 25, 2021 at 02:07:01PM +0100, Michal Hocko wrote:
> > On Thu 21-01-21 09:54:59, Minchan Kim wrote:
> > > The upcoming patch will introduce __GFP_NORETRY semantic
> > > in alloc_contig_range which is a failfast mode of the API.
> > > Instead of adding a additional parameter for gfp, replace
> > > no_warn with gfp flag.
> > > 
> > > To keep old behaviors, it follows the rule below.
> > > 
> > >   no_warn 			gfp_flags
> > > 
> > >   false         		GFP_KERNEL
> > >   true          		GFP_KERNEL|__GFP_NOWARN
> > >   gfp & __GFP_NOWARN		GFP_KERNEL | (gfp & __GFP_NOWARN)
> > > 
> > > Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> > > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > [...]
> > > diff --git a/mm/cma.c b/mm/cma.c
> > > index 0ba69cd16aeb..d50627686fec 100644
> > > --- a/mm/cma.c
> > > +++ b/mm/cma.c
> > > @@ -419,13 +419,13 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
> > >   * @cma:   Contiguous memory region for which the allocation is performed.
> > >   * @count: Requested number of pages.
> > >   * @align: Requested alignment of pages (in PAGE_SIZE order).
> > > - * @no_warn: Avoid printing message about failed allocation
> > > + * @gfp_mask: GFP mask to use during the cma allocation.
> > 
> > Call out supported gfp flags explicitly. Have a look at kvmalloc_node
> > for a guidance.
> 
> How about this?
> 
> 
> diff --git a/mm/cma.c b/mm/cma.c
> index d50627686fec..b94727b694d6 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -423,6 +423,10 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
>   *
>   * This function allocates part of contiguous memory on specific
>   * contiguous memory area.
> + *
> + * For gfp_mask, GFP_KERNEL and __GFP_NORETRY are supported. __GFP_NORETRY
> + * will avoid costly functions(e.g., waiting on page_writeback and locking)
> + * at current implementaion during the page migration.

rather than explicitly mentioning what the flag implies I think it would
be more useful to state the intended usecase. See how kvmalloc_node says
"__GFP_RETRY_MAYFAIL is supported, and it should be used only if kmalloc is
preferable to the vmalloc fallback, due to visible performance
drawbacks.
__GFP_NOWARN is also supported to suppress allocation failure messages."

This would help people not familiar with internals to see whether this
flag is a good fit for them.

In this case I woul go with
"
@flags: gfp mask. Must be compatible (superset) with GFP_KERNEL.
[...]
Reclaim modifiers (__GFP_RETRY_MAYFAIL, __GFP_NOFAIL) are not supported.
__GFP_NORETRY is supported, and it should be used for opportunistic
allocation attempts that should rather fail quickly when the caller has
a fallback strategy.
"

Obviously for this patch you will go with a simple statement that
Reclaim modifiers are not supported at all.

>   */
>  struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
>                        gfp_t gfp_mask)
> 

-- 
Michal Hocko
SUSE Labs
