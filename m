Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73AC304CC7
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 23:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730723AbhAZWzI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391674AbhAZTM7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 14:12:59 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF05CC06174A;
        Tue, 26 Jan 2021 11:12:18 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id g15so12046980pgu.9;
        Tue, 26 Jan 2021 11:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z+Elf6KN7gCVxKH5y5v8VFFxpAzRjoRyqfE2dK5dzCQ=;
        b=CzMop3FhOdFGtWBkHlk/GUz/sqkCJ9tRBC/4jNGcxWNawh9ndTJDO/q315ne2lbJ0R
         gk+2ZghnnXjkzlDQN1M9uTa6WRDOsyuI+rFitPzUAGAAZS0s5nYP5yFboFjQyoEy6ybq
         ufGydHojAu8poq6x5fWLpp8DbYktqiIJmV9B7pWfV9m24uS9iM8BYVCCaB2ex21Dzhj9
         5HB5LEZ4IQsmd9mKZDv7xX0AwcXHhRSEtzdZ9i+raHscQXLTaBqz5W32bLsR6DH661ak
         f5+olSkBh+BJ82RaHyOpZP/vYklYI7PsrBeNo5NUDxFmiRoa2BTB4qpk4X1JDOwTXOCm
         HPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=z+Elf6KN7gCVxKH5y5v8VFFxpAzRjoRyqfE2dK5dzCQ=;
        b=GoGygaWuQxRgFJbPtyhQ20FjL+/ci15fRbas/o8HIBgYlOXX2W+g+DAdOQ7hDdeLQv
         7wcWQWpVjM059U757/ikS0iNePM6cFak+twsklYuTAiQEefAJAQ6D90/MU2guCIZCaZ8
         5pHYvuJw5ZhQd7j9hJahD3BMjhoKg56VRXcDyWRyRY7BZEAsPHrlFPst+xG93fKNKzPV
         Hfp4oV9yobFvo7TbSZI4C1ZAGdot93HfNrUdbZMLp/unrPE75qMGUKwYcmmEiNbe+Kuj
         alAFTKjyK65zBAjlM1+1F4KbgGfN+WFoL114IyX0VTAPN/Jrn5JYKUrsMOdsXIQfftwu
         VLoA==
X-Gm-Message-State: AOAM530tAK3BQ63MBsrlAPN6QQo3T2cHZJ0zcfdaaQk4xLxdA9k2IY5U
        /UqxKCmcGtbuCte53GioNhY=
X-Google-Smtp-Source: ABdhPJzAeJ2VBQP8Ty12PWfHYgZ3qBVMPcowpow+95wbsOdOdX7sQMm9xF9YxgnjsVF1aa+ITIH1ug==
X-Received: by 2002:a62:7d03:0:b029:1bb:5919:6dec with SMTP id y3-20020a627d030000b02901bb59196decmr6759692pfc.76.1611688338278;
        Tue, 26 Jan 2021 11:12:18 -0800 (PST)
Received: from google.com ([2620:15c:211:201:9dd5:b47b:bb84:dede])
        by smtp.gmail.com with ESMTPSA id b14sm3091649pju.14.2021.01.26.11.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 11:12:17 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 26 Jan 2021 11:12:14 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     Michal Hocko <mhocko@suse.com>
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
Message-ID: <YBBpjvBRtvi3Rl9F@google.com>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-2-minchan@kernel.org>
 <20210125130701.GF827@dhcp22.suse.cz>
 <YA8fKgFLuOi/rSez@google.com>
 <20210126073808.GZ827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126073808.GZ827@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 26, 2021 at 08:38:08AM +0100, Michal Hocko wrote:
> On Mon 25-01-21 11:42:34, Minchan Kim wrote:
> > On Mon, Jan 25, 2021 at 02:07:01PM +0100, Michal Hocko wrote:
> > > On Thu 21-01-21 09:54:59, Minchan Kim wrote:
> > > > The upcoming patch will introduce __GFP_NORETRY semantic
> > > > in alloc_contig_range which is a failfast mode of the API.
> > > > Instead of adding a additional parameter for gfp, replace
> > > > no_warn with gfp flag.
> > > > 
> > > > To keep old behaviors, it follows the rule below.
> > > > 
> > > >   no_warn 			gfp_flags
> > > > 
> > > >   false         		GFP_KERNEL
> > > >   true          		GFP_KERNEL|__GFP_NOWARN
> > > >   gfp & __GFP_NOWARN		GFP_KERNEL | (gfp & __GFP_NOWARN)
> > > > 
> > > > Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> > > > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > > [...]
> > > > diff --git a/mm/cma.c b/mm/cma.c
> > > > index 0ba69cd16aeb..d50627686fec 100644
> > > > --- a/mm/cma.c
> > > > +++ b/mm/cma.c
> > > > @@ -419,13 +419,13 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
> > > >   * @cma:   Contiguous memory region for which the allocation is performed.
> > > >   * @count: Requested number of pages.
> > > >   * @align: Requested alignment of pages (in PAGE_SIZE order).
> > > > - * @no_warn: Avoid printing message about failed allocation
> > > > + * @gfp_mask: GFP mask to use during the cma allocation.
> > > 
> > > Call out supported gfp flags explicitly. Have a look at kvmalloc_node
> > > for a guidance.
> > 
> > How about this?
> > 
> > 
> > diff --git a/mm/cma.c b/mm/cma.c
> > index d50627686fec..b94727b694d6 100644
> > --- a/mm/cma.c
> > +++ b/mm/cma.c
> > @@ -423,6 +423,10 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
> >   *
> >   * This function allocates part of contiguous memory on specific
> >   * contiguous memory area.
> > + *
> > + * For gfp_mask, GFP_KERNEL and __GFP_NORETRY are supported. __GFP_NORETRY
> > + * will avoid costly functions(e.g., waiting on page_writeback and locking)
> > + * at current implementaion during the page migration.
> 
> rather than explicitly mentioning what the flag implies I think it would
> be more useful to state the intended usecase. See how kvmalloc_node says
> "__GFP_RETRY_MAYFAIL is supported, and it should be used only if kmalloc is
> preferable to the vmalloc fallback, due to visible performance
> drawbacks.
> __GFP_NOWARN is also supported to suppress allocation failure messages."
> 
> This would help people not familiar with internals to see whether this
> flag is a good fit for them.
> 
> In this case I woul go with
> "
> @flags: gfp mask. Must be compatible (superset) with GFP_KERNEL.
> [...]
> Reclaim modifiers (__GFP_RETRY_MAYFAIL, __GFP_NOFAIL) are not supported.
> __GFP_NORETRY is supported, and it should be used for opportunistic
> allocation attempts that should rather fail quickly when the caller has
> a fallback strategy.
> "
> 
> Obviously for this patch you will go with a simple statement that
> Reclaim modifiers are not supported at all.

After more discussion for gfp_flags in thread of next patch, let me
changes a bit more based on it.

Thanks for the suggestion, Michal.
