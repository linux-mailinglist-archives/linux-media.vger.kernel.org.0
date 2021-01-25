Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E5B30484C
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388772AbhAZFqC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:46:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729835AbhAYTeU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 14:34:20 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D693BC061573;
        Mon, 25 Jan 2021 11:33:40 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id jx18so240511pjb.5;
        Mon, 25 Jan 2021 11:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YmWxybprGkUlor/mN/GWW2ybyHD5q29LT4+P3EdRmnA=;
        b=EBNKjZuKHxW5GWIdGLvLCZ7chWb4KO0MKVIhKt3fRdJvaAs9jxM6ETrjqjFSG+hOcx
         h5S+VpQyEwXNQ8VtntSyf/SQoUXVvLP4lUyC58rkfp3tgs9J+paSQXGcEKa52yXy7J4O
         kP52t1kBs6KlnhOIj6WaHmbBC1YtPBk5SI8JsAOBaK2UaPtHDIWJRnLdul8swrqRHAcZ
         AMC+FX2sapcUnJovE0Mkmu6G5Nfa+gorBVc9MhFr6aALhEtVlXPUhBsjEg9FbMWzpXCR
         o6nmbgOPQmeO7kXntbtATshiWQQcq3s3uvWEcDnIj69e25CCDifde3FwVj+PJJZx9BRN
         1kUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=YmWxybprGkUlor/mN/GWW2ybyHD5q29LT4+P3EdRmnA=;
        b=gVe9ZHO1X8TW5z8BrRz6Aofs1OITyH0hgNZ+JAHNBHNfjTUsvD1blRum1GoV6n6fuX
         kGa5AGAnAnqYNkUdHCaorqO+ZZYp1pIdIU17i5N73iwjD/sqpIgYNkMZQKzOAcC89sKQ
         ev62Mpy+yVptBQ18PBWqr0M1Y/zAyYEC9EdoBUel6jdZ2UsT2GG9CfGezEsrGhHhSxir
         rCnGj1dtlb+znBKAiA8ceogvITjMr69Sz2TWjFr7CQfNhPkFk5VZZIl2HTKbrkmBMiAe
         sY/+ElODlmH+Uv/5NPtHyF8F3cEFJ5PURco1i+NqBrp11xxogDaURSH57bHXsv7xf00n
         +A4w==
X-Gm-Message-State: AOAM531uaQZwr3hIBGA22GTmifO8X4XJL5TIQgrxj3PpoHjoDr/EAjsC
        x5FAJXQOZJ+WNp5A7XphMJw=
X-Google-Smtp-Source: ABdhPJzWAbofIoJoeR7THVK7Sebi8NYFmGlVyxvi0QBQ4bvwgYBN/qHKMW2JhCbBaw0rqz/r5kDC9g==
X-Received: by 2002:a17:90a:be10:: with SMTP id a16mr1817662pjs.78.1611603220402;
        Mon, 25 Jan 2021 11:33:40 -0800 (PST)
Received: from google.com ([2620:15c:211:201:e8b4:4688:79de:94f3])
        by smtp.gmail.com with ESMTPSA id w19sm17535415pgf.23.2021.01.25.11.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 11:33:38 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Mon, 25 Jan 2021 11:33:36 -0800
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
Subject: Re: [PATCH v4 2/4] mm: failfast mode with __GFP_NORETRY in
 alloc_contig_range
Message-ID: <YA8dEFSrHBb9muFr@google.com>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-3-minchan@kernel.org>
 <20210125131200.GG827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125131200.GG827@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 25, 2021 at 02:12:00PM +0100, Michal Hocko wrote:
> On Thu 21-01-21 09:55:00, Minchan Kim wrote:
> > Contiguous memory allocation can be stalled due to waiting
> > on page writeback and/or page lock which causes unpredictable
> > delay. It's a unavoidable cost for the requestor to get *big*
> > contiguous memory but it's expensive for *small* contiguous
> > memory(e.g., order-4) because caller could retry the request
> > in different range where would have easy migratable pages
> > without stalling.
> > 
> > This patch introduce __GFP_NORETRY as compaction gfp_mask in
> > alloc_contig_range so it will fail fast without blocking
> > when it encounters pages needed waiting.
> 
> I am not against controling how hard this allocator tries with gfp mask
> but this changelog is rather void on any data and any user.
> 
> It is also rather dubious to have retries when then caller says to not
> retry.

Since max_tries is 1 with ++tries, it shouldn't retry.

> 
> Also why didn't you consider GFP_NOWAIT semantic for non blocking mode?

GFP_NOWAIT seems to be low(specific) flags rather than the one I want to
express. Even though I said only page writeback/lock in the description,
the goal is to avoid costly operations we might find later so such
"failfast", I thought GFP_NORETRY would be good fit.

> 
> > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > ---
> >  mm/page_alloc.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index b031a5ae0bd5..1cdc3ee0b22e 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -8491,12 +8491,16 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
> >  	unsigned int nr_reclaimed;
> >  	unsigned long pfn = start;
> >  	unsigned int tries = 0;
> > +	unsigned int max_tries = 5;
> >  	int ret = 0;
> >  	struct migration_target_control mtc = {
> >  		.nid = zone_to_nid(cc->zone),
> >  		.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
> >  	};
> >  
> > +	if (cc->alloc_contig && cc->mode == MIGRATE_ASYNC)
> > +		max_tries = 1;
> > +
> >  	migrate_prep();
> >  
> >  	while (pfn < end || !list_empty(&cc->migratepages)) {
> > @@ -8513,7 +8517,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
> >  				break;
> >  			}
> >  			tries = 0;
> > -		} else if (++tries == 5) {
> > +		} else if (++tries == max_tries) {
> >  			ret = ret < 0 ? ret : -EBUSY;
> >  			break;
> >  		}
> > @@ -8564,7 +8568,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
> >  		.nr_migratepages = 0,
> >  		.order = -1,
> >  		.zone = page_zone(pfn_to_page(start)),
> > -		.mode = MIGRATE_SYNC,
> > +		.mode = gfp_mask & __GFP_NORETRY ? MIGRATE_ASYNC : MIGRATE_SYNC,
> >  		.ignore_skip_hint = true,
> >  		.no_set_skip_hint = true,
> >  		.gfp_mask = current_gfp_context(gfp_mask),
> > -- 
> > 2.30.0.296.g2bfb1c46d8-goog
> 
> -- 
> Michal Hocko
> SUSE Labs
