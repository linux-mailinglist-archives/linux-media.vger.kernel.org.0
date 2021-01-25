Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C854303174
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 02:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729149AbhAZBZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 20:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731549AbhAYTnS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 14:43:18 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44755C061573;
        Mon, 25 Jan 2021 11:42:38 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id h15so5817742pli.8;
        Mon, 25 Jan 2021 11:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5fVcl4vKZHTggDm2blzFERgcHQ62HSz/1Q2cJ06nrTg=;
        b=LL0FJhwoQrn7tUXdzpAdVeTxvpcnKljV3FZHqFh2MW1Nn7kU9DyudKg56dc5WEr9b6
         ELm2u/F2CynFbqQtnbVH2jrvb8lb1owWggFXMi984iR8HTHAcY72RwkpQdyg8kYvD0M1
         RisgAaxjOP+vvR3/e714JnzZEN1qwfV0D1os8EX74vck3vQUmCO2GgBK9koYeN27koOW
         Oq/LfzpLUKcvcfMc32E+juzk5/cvnCxX4FrhUoAcKQP0Bjh2fnlHpW4kRlYQMjxX55tt
         +nQ1Esa8G7u99N3yLi5Bo5MB2j6DnvTMZuy699sUzV5zcXDX1JNVbLcKFO77mPxxlt2v
         2tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=5fVcl4vKZHTggDm2blzFERgcHQ62HSz/1Q2cJ06nrTg=;
        b=i03k0fd5SFCR/P2q+aG2QbMbCD8RKiJUHNGbuyFrbAm6++jmxQe1ZRmU2eeeghOan5
         vy6ZzLvsgil6LRMwKmJMXAznPxEzQJJRwwZtfflmpQ/zDILFxQqF+uw4JZPOAsOQhdjH
         hrkXRPGUcmmlnySOqQRTh+L928sYPFBhh7GDoRmaCKJ0PXyCaGm59tYNxMYpFJ0NYcDV
         mj+sJJUwtZBbMDfgcNM7TfQJ8uDmDE3XJtEIcJn1Z3vfmZTkciQE2pwFbpCsFZHVcFNb
         i/9k33YRAqM83VsIhiuqVJXM1O4uTDsMxE/eE7mIzi4UByLtv3nLA2LCXljuB5fEBr28
         REAg==
X-Gm-Message-State: AOAM532LhUvSpwFa+3riBkTuRtv0iHP9331HZalQvq6Cq+EHHZjg3VKr
        mhXPnppKPqmZ/u45M6dUks4=
X-Google-Smtp-Source: ABdhPJwT/YZ72o8PzSOo3q/xaeqNAkBX8xQi8IOdnfyF1Y2kFh41Roa9xrm8PNLtM8E9l0D9llOWOA==
X-Received: by 2002:a17:90a:7e90:: with SMTP id j16mr1784454pjl.163.1611603757872;
        Mon, 25 Jan 2021 11:42:37 -0800 (PST)
Received: from google.com ([2620:15c:211:201:e8b4:4688:79de:94f3])
        by smtp.gmail.com with ESMTPSA id h6sm17733599pfr.47.2021.01.25.11.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 11:42:36 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Mon, 25 Jan 2021 11:42:34 -0800
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
Message-ID: <YA8fKgFLuOi/rSez@google.com>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-2-minchan@kernel.org>
 <20210125130701.GF827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125130701.GF827@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 25, 2021 at 02:07:01PM +0100, Michal Hocko wrote:
> On Thu 21-01-21 09:54:59, Minchan Kim wrote:
> > The upcoming patch will introduce __GFP_NORETRY semantic
> > in alloc_contig_range which is a failfast mode of the API.
> > Instead of adding a additional parameter for gfp, replace
> > no_warn with gfp flag.
> > 
> > To keep old behaviors, it follows the rule below.
> > 
> >   no_warn 			gfp_flags
> > 
> >   false         		GFP_KERNEL
> >   true          		GFP_KERNEL|__GFP_NOWARN
> >   gfp & __GFP_NOWARN		GFP_KERNEL | (gfp & __GFP_NOWARN)
> > 
> > Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> > Signed-off-by: Minchan Kim <minchan@kernel.org>
> [...]
> > diff --git a/mm/cma.c b/mm/cma.c
> > index 0ba69cd16aeb..d50627686fec 100644
> > --- a/mm/cma.c
> > +++ b/mm/cma.c
> > @@ -419,13 +419,13 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
> >   * @cma:   Contiguous memory region for which the allocation is performed.
> >   * @count: Requested number of pages.
> >   * @align: Requested alignment of pages (in PAGE_SIZE order).
> > - * @no_warn: Avoid printing message about failed allocation
> > + * @gfp_mask: GFP mask to use during the cma allocation.
> 
> Call out supported gfp flags explicitly. Have a look at kvmalloc_node
> for a guidance.

How about this?


diff --git a/mm/cma.c b/mm/cma.c
index d50627686fec..b94727b694d6 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -423,6 +423,10 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
  *
  * This function allocates part of contiguous memory on specific
  * contiguous memory area.
+ *
+ * For gfp_mask, GFP_KERNEL and __GFP_NORETRY are supported. __GFP_NORETRY
+ * will avoid costly functions(e.g., waiting on page_writeback and locking)
+ * at current implementaion during the page migration.
  */
 struct page *cma_alloc(struct cma *cma, size_t count, unsigned int align,
                       gfp_t gfp_mask)

