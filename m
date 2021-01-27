Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5C4306500
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 21:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbhA0UWj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 15:22:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhA0UW3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 15:22:29 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E091C061573;
        Wed, 27 Jan 2021 12:21:49 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id b8so1656239plh.12;
        Wed, 27 Jan 2021 12:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+hzofQqaeoGNYCe45SBnaGoQ2vMeZ0xTF87uPiMOHFo=;
        b=ehBqk2cKFP47FSh36lcKYdIQ7FQwNm+nWdue8RxJbzWMUDAsaBzIw3U3jmpjsZJGkS
         ADstB+JqPho4IupDRfsSOw5Hl6xIbeTGLZZCv4sH7rQZ/DPQg224Bl6SC7wEoi1nHYey
         zYHmTKWyfCTKEV+CQVSVrcrh9zo1YhZfngT/ZVfQxH3MFtK1sPPPF+HrlyFCsy5XgunE
         PKqizqhUh1jIasQqbbZ0H/D8Efz6/A38i45XpNorFHZ/qKqC+7GsNS8Swe6/GRyuJZ85
         9HUqdcgjWgFDqqy+Pb6LKRZDqnDkD1lpJHuDppM3Ny2QImP9KIORvH7UA+UbdUssVNHW
         r1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+hzofQqaeoGNYCe45SBnaGoQ2vMeZ0xTF87uPiMOHFo=;
        b=TIEwEmFfb5/oKNf7nXXam0YTokdgIxC8I3BhrXJ5VPKarkRF/7vhGnqyMLZ47LDPIO
         +nrySUY6KK6AVxb5Ww2KCwWHl76flrZkT8+KDl0brOVkTMzM0chYt8soSK8Yd69xOK54
         8cPJTYrUV8djQfRRGTc3BcNpmnduQB3SOtUCbOZJg/944Uo6Pk76ClAiy8g6VXfM5tyO
         a6xZ81EbFA6Nk3x2Z9svc/jeFbCfy7TqV42tjxoYL6q4YA10AC4h8LyCztSB4Jnr+G16
         Wc5ltgPJLg8BAC8oMr7lMtm6a/fYQShbTVVQOhKYped4n53h8Gstx1Wm37kEAws6RSV4
         UA/g==
X-Gm-Message-State: AOAM533/W7VM66Ps3TutRtqEtRarEEHshxPUYrif5NX/8/WrL6EGWmDo
        6qlfPwunlksq/52h6URY4pk=
X-Google-Smtp-Source: ABdhPJy2tnLBcvXAqOMHFbdOndQtX/tERTcINJmus1YbktB7wIePSj3Rx/TdqMimPIXysMbx4hTg3w==
X-Received: by 2002:a17:902:a412:b029:db:cf5a:8427 with SMTP id p18-20020a170902a412b02900dbcf5a8427mr12888916plq.48.1611778908549;
        Wed, 27 Jan 2021 12:21:48 -0800 (PST)
Received: from google.com ([2620:15c:211:201:9dd5:b47b:bb84:dede])
        by smtp.gmail.com with ESMTPSA id e17sm2863806pjh.39.2021.01.27.12.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 12:21:47 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Wed, 27 Jan 2021 12:21:45 -0800
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
Message-ID: <YBHLWUvLlLzSnPI5@google.com>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-2-minchan@kernel.org>
 <20210125130701.GF827@dhcp22.suse.cz>
 <YA8fKgFLuOi/rSez@google.com>
 <20210126073808.GZ827@dhcp22.suse.cz>
 <YBBpjvBRtvi3Rl9F@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBBpjvBRtvi3Rl9F@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 26, 2021 at 11:12:14AM -0800, Minchan Kim wrote:
> On Tue, Jan 26, 2021 at 08:38:08AM +0100, Michal Hocko wrote:
> > On Mon 25-01-21 11:42:34, Minchan Kim wrote:
> > > On Mon, Jan 25, 2021 at 02:07:01PM +0100, Michal Hocko wrote:
> > > > On Thu 21-01-21 09:54:59, Minchan Kim wrote:
> > > > > The upcoming patch will introduce __GFP_NORETRY semantic
> > > > > in alloc_contig_range which is a failfast mode of the API.
> > > > > Instead of adding a additional parameter for gfp, replace
> > > > > no_warn with gfp flag.
> > > > > 
> > > > > To keep old behaviors, it follows the rule below.
> > > > > 
> > > > >   no_warn 			gfp_flags
> > > > > 
> > > > >   false         		GFP_KERNEL
> > > > >   true          		GFP_KERNEL|__GFP_NOWARN
> > > > >   gfp & __GFP_NOWARN		GFP_KERNEL | (gfp & __GFP_NOWARN)
> > > > > 
> > > > > Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> > > > > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > > > [...]
> > > > > diff --git a/mm/cma.c b/mm/cma.c
> > > > > index 0ba69cd16aeb..d50627686fec 100644
> > > > > --- a/mm/cma.c
> > > > > +++ b/mm/cma.c
> > > > > @@ -419,13 +419,13 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
> > > > >   * @cma:   Contiguous memory region for which the allocation is performed.
> > > > >   * @count: Requested number of pages.
> > > > >   * @align: Requested alignment of pages (in PAGE_SIZE order).
> > > > > - * @no_warn: Avoid printing message about failed allocation
> > > > > + * @gfp_mask: GFP mask to use during the cma allocation.
> > > > 
> > > > Call out supported gfp flags explicitly. Have a look at kvmalloc_node
> > > > for a guidance.
> > > 
> > > How about this?
> > > 
> > > 
> > > diff --git a/mm/cma.c b/mm/cma.c
> > > index d50627686fec..b94727b694d6 100644
> > > --- a/mm/cma.c
> > > +++ b/mm/cma.c
> > > @@ -423,6 +423,10 @@ static inline void cma_debug_show_areas(struct cma *cma) { }
> > >   *
> > >   * This function allocates part of contiguous memory on specific
> > >   * contiguous memory area.
> > > + *
> > > + * For gfp_mask, GFP_KERNEL and __GFP_NORETRY are supported. __GFP_NORETRY
> > > + * will avoid costly functions(e.g., waiting on page_writeback and locking)
> > > + * at current implementaion during the page migration.
> > 
> > rather than explicitly mentioning what the flag implies I think it would
> > be more useful to state the intended usecase. See how kvmalloc_node says
> > "__GFP_RETRY_MAYFAIL is supported, and it should be used only if kmalloc is
> > preferable to the vmalloc fallback, due to visible performance
> > drawbacks.
> > __GFP_NOWARN is also supported to suppress allocation failure messages."
> > 
> > This would help people not familiar with internals to see whether this
> > flag is a good fit for them.
> > 
> > In this case I woul go with
> > "
> > @flags: gfp mask. Must be compatible (superset) with GFP_KERNEL.
> > [...]
> > Reclaim modifiers (__GFP_RETRY_MAYFAIL, __GFP_NOFAIL) are not supported.
> > __GFP_NORETRY is supported, and it should be used for opportunistic
> > allocation attempts that should rather fail quickly when the caller has
> > a fallback strategy.
> > "
> > 
> > Obviously for this patch you will go with a simple statement that
> > Reclaim modifiers are not supported at all.
> 
> After more discussion for gfp_flags in thread of next patch, let me
> changes a bit more based on it.
> 
> Thanks for the suggestion, Michal.

Based on the discussion in other thread, I want to go with __GFP_NORETRY
to indicate "opportunistic-easy-to-fail attempt" so suggestion words
Michal is valid so I will carry it on next version.

Thank you.




