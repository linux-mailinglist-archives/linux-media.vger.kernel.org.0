Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 804932F68DA
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbhANSEw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbhANSEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:04:52 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79511C061757;
        Thu, 14 Jan 2021 10:04:11 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id c79so3829025pfc.2;
        Thu, 14 Jan 2021 10:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8odJ5Ie7ToqG86xlcAIvMtTg4Qjk76VUQrxBhxSFP9w=;
        b=KqQCOKjiLJiLiQqwtMYuTPhPw5CF0QxgEHNynmvelI5fjabtoMBGY3djLOvXx5It0t
         qaPYxThjlfWhP5EGs7o4xswci/ZIluAll1SNOkKP9pGvLSn1YPnpngCI80o4Ds1yVooa
         vIiZRQIojuqqDnI+/rXRiNk697Ae+YBgYbcWlfuJfYF9U9UlX04F/P82YOG7SvcMD9ne
         PPsDUEv6ogXeSKomJ1WHDMchwdg63akHJpmzlxq2vw/N/rJXmy+v2FYJLEMpuVF/pPWS
         IZ/xz9b5PA0a5yC+5yVqFVzhes6gq+Xoh/eJ57A1Z7zXo65wLwLveEdBL4YwClXHOKlg
         BrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=8odJ5Ie7ToqG86xlcAIvMtTg4Qjk76VUQrxBhxSFP9w=;
        b=qftBYCgYtce56oJkAEW+M1rgyYmnNUQfOWobkszqY3tNi3BmU89GzzwbqvPyKZ6Pfu
         +nFSgOt8Q7wdoF/4sQhSvEUuKj7UpH5S0T3sPmoUo39rzoZdw2ipVG2Rer2915bBUArC
         EQlB/1IVS3ku/EOmE00fGbL6T5Y9ZEFoQXbkYUYuezZqtgzDD7/b9Dv28Oe2LvQNRcdq
         nhLfvIFz2tF19KoU0vO2EgafFHf0LyqY5m1Gn7y+9SHhCICQ1bPyc/F4bKmLdp2XWqOs
         S1K7r4lYyYfmcIFOFnvmO7nquuARqIzMsX3hLNIKrFywWUOezJE4Dqtt7me4AEqMqIR3
         68+A==
X-Gm-Message-State: AOAM530KXXLSXbwYkHF8KKUU56P6gUE1Dz+qBG53fH6NvAkXtkzYK7mM
        A42j0Lq/c/+DbdBkoqpkafQ=
X-Google-Smtp-Source: ABdhPJwoNeFU6lwLeDKNvAWYiFtl2UOGPDfDpM4zGt/q0XPR8pdVQPV+E8PEIiPTuGm7rCuI3/aJQA==
X-Received: by 2002:a63:4f64:: with SMTP id p36mr8531861pgl.374.1610647451015;
        Thu, 14 Jan 2021 10:04:11 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id n15sm6074557pgl.31.2021.01.14.10.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 10:04:09 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Thu, 14 Jan 2021 10:04:07 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     David Hildenbrand <david@redhat.com>, mhocko@suse.com
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, hyesoo.yu@samsung.com,
        mhocko@suse.com, surenb@google.com, pullip.cho@samsung.com,
        joaodias@google.com, hridya@google.com, john.stultz@linaro.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 2/4] mm: failfast mode with __GFP_NORETRY in
 alloc_contig_range
Message-ID: <YACHlznVFEDvLila@google.com>
References: <20210113012143.1201105-1-minchan@kernel.org>
 <20210113012143.1201105-3-minchan@kernel.org>
 <723e935f-3aa4-2c55-8d69-fcaf71f4eb4c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <723e935f-3aa4-2c55-8d69-fcaf71f4eb4c@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 13, 2021 at 09:39:26AM +0100, David Hildenbrand wrote:
> On 13.01.21 02:21, Minchan Kim wrote:
> > Contiguous memory allocation can be stalled due to waiting
> > on page writeback and/or page lock which causes unpredictable
> > delay. It's a unavoidable cost for the requestor to get *big*
> > contiguous memory but it's expensive for *small* contiguous
> > memory(e.g., order-4) because caller could retry the request
> > in diffrent range where would have easy migratable pages
> > without stalling.
> 
> s/diffrent/different/
> 
> > 
> > This patch introduce __GFP_NORETRY as compaction gfp_mask in
> > alloc_contig_range so it will fail fast without blocking
> > when it encounters pages needed waitting.
> 
> s/waitting/waiting/

Fxed both. Thanks.
Let me resend once I get some review.

Michal, I appreciate if you could give an review before
next revision.

Thanks!

> 
> > 
> > Signed-off-by: Minchan Kim <minchan@kernel.org>
> > ---
> >  mm/page_alloc.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index 5b3923db9158..ff41ceb4db51 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -8489,12 +8489,16 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
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
> > @@ -8511,7 +8515,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
> >  				break;
> >  			}
> >  			tries = 0;
> > -		} else if (++tries == 5) {
> > +		} else if (++tries == max_tries) {
> >  			ret = ret < 0 ? ret : -EBUSY;
> >  			break;
> >  		}
> > @@ -8562,7 +8566,7 @@ int alloc_contig_range(unsigned long start, unsigned long end,
> >  		.nr_migratepages = 0,
> >  		.order = -1,
> >  		.zone = page_zone(pfn_to_page(start)),
> > -		.mode = MIGRATE_SYNC,
> > +		.mode = gfp_mask & __GFP_NORETRY ? MIGRATE_ASYNC : MIGRATE_SYNC,
> >  		.ignore_skip_hint = true,
> >  		.no_set_skip_hint = true,
> >  		.gfp_mask = current_gfp_context(gfp_mask),
> > 
> 
> I'm fine with using gfp flags (e.g., __GFP_NORETRY) as long as they
> don't enable other implicit behavior (e.g., move draining X to the
> caller) that's hard to get from the flag name.
> 
> IMHO, if we ever want to move draining to the caller, or change the
> behavior of alloc_contig_range() in different ways (e.g., disable PCP),
> we won't get around introducing a separate set of flags for
> alloc_contig_range().
> 
> Let's see what Michal thinks. Thanks!
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 
