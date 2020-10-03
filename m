Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256AE282760
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 01:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgJCXYo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 19:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgJCXYo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Oct 2020 19:24:44 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1921EC0613E7
        for <linux-media@vger.kernel.org>; Sat,  3 Oct 2020 16:24:44 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id o21so6121413qtp.2
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2020 16:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g/bWRDC83HBwg01UsDzSfM2jl4/c+/+0WDuMbz3L3vY=;
        b=Wt75KKGYlyB3SVZh+R6kN1ac9Vs1rLb3FsriPknSZPm+rurem+iWpgZgJn4OjhxTGZ
         9UwOdbqn0IcWxz+SXlFiwb4+rjtb+FIwhhqFqQCCHCvfa+S2U6Kl8NLkXIpYAhA/a10W
         r/rLG3s+ms3GT5JJgD+ISxGasTSiyNYlo6eShkO1GzrSNpTK/YeaG5lgDrFWf6poASEm
         HB67uKceG7Zv3GOVEaWOpYkegB/R/AxePvPSKebeq4LE2/szG8/0SQsD2yphB471fLtE
         A3BPhFHCM7s2bOPhwoXpknrKjY/J2CP+KFTRaSIylcr9nsqahczax8dmHfThNO+XSHbg
         6rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g/bWRDC83HBwg01UsDzSfM2jl4/c+/+0WDuMbz3L3vY=;
        b=sNqfXn7qbfJyeit8+vKOOkbox5HLT7sRps1Z7YRh0ad+sFLljQNQAkWqudaefr7V5v
         EBhdPCIOkbRAtYY74reF25KmpCJ1z02GkmZ3zEwRfI59X/pA3WKrT+E/o+gfl6zgnFTO
         MsJdRQxfa7TpZZX4SE11OnsVhdHG3MRIuf/5UVSm1bBo+qBDucKvTUPGc9TY//wcBn+O
         GFKC8Lp0Latg3v3OoEOw4TfjbD3oHu7UZuAvo8h8fz5S2rEBcG5+6hWz4QuLO7E5NVOu
         l02r4jqatuURbXzmBln7PWrOu2Hd1q7pBEpDkDMYt6deZpjWrhmMjsTquByqFCBoiSgd
         taTA==
X-Gm-Message-State: AOAM532RWVlm7G/92eQeK/7f+5NWQ1pKPJcWv+BcUqDk+5jjaVscrsB8
        EaI8stn+2QKO7rb2FsJU5yNhRA==
X-Google-Smtp-Source: ABdhPJz+EnEtdlsIy9dnMqFENsfi2yM5N7tbJ9Hj1Iht+h6SFBydHWolNKH2FPE4uwkGjBxQdXBxaQ==
X-Received: by 2002:aed:3b72:: with SMTP id q47mr2051233qte.347.1601767483069;
        Sat, 03 Oct 2020 16:24:43 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id a52sm4343504qtc.22.2020.10.03.16.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 16:24:42 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kOqtN-0075j4-EX; Sat, 03 Oct 2020 20:24:41 -0300
Date:   Sat, 3 Oct 2020 20:24:41 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201003232441.GO9916@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
 <CAKMK7uGzZ2dBe040vP1BJmQ7cuhj_OQHL0ncyz5XyUcb=bPjmg@mail.gmail.com>
 <f5130c7f-eebe-7b21-62b8-68f08212b106@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5130c7f-eebe-7b21-62b8-68f08212b106@nvidia.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 03, 2020 at 03:52:32PM -0700, John Hubbard wrote:
> On 10/3/20 2:45 AM, Daniel Vetter wrote:
> > On Sat, Oct 3, 2020 at 12:39 AM John Hubbard <jhubbard@nvidia.com> wrote:
> > > 
> > > On 10/2/20 10:53 AM, Daniel Vetter wrote:
> > > > For $reasons I've stumbled over this code and I'm not sure the change
> > > > to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
> > > > convert get_user_pages() --> pin_user_pages()") was entirely correct.
> > > > 
> > > > This here is used for long term buffers (not just quick I/O) like
> > > > RDMA, and John notes this in his patch. But I thought the rule for
> > > > these is that they need to add FOLL_LONGTERM, which John's patch
> > > > didn't do.
> > > 
> > > Yep. The earlier gup --> pup conversion patches were intended to not
> > > have any noticeable behavior changes, and FOLL_LONGTERM, with it's
> > > special cases and such, added some risk that I wasn't ready to take
> > > on yet. Also, FOLL_LONGTERM rules are only *recently* getting firmed
> > > up. So there was some doubt at least in my mind, about which sites
> > > should have it.
> > > 
> > > But now that we're here, I think it's really good that you've brought
> > > this up. It's definitely time to add FOLL_LONGTERM wherever it's missing.
> > 
> > So should I keep this patch, or will it collide with a series you're working on?
> 
> It doesn't collide with anything on my end yet, because I've been slow to
> pick up on the need for changing callsites to add FOLL_LONGTERM. :)
> 
> And it looks like that's actually a problem, because:
> 
> > 
> > Also with the firmed up rules, correct that I can also drop the
> > vma_is_fsdax check when the FOLL_LONGTERM flag is set?
> 
> That's the right direction to go *in general*, but I see that the
> pin_user_pages code is still a bit stuck in the past. And this patch
> won't actually work, with or without that vma_is_fsdax() check.
> Because:
> 
> get_vaddr_frames(FOLL_LONGTERM)
>    pin_user_pages_locked()
> 	if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
> 		return -EINVAL;

There is no particular reason this code needs to have the mm sem at
that point.

It should call pin_user_pages_fast() and only if that fails get the mmap
lock and extract the VMA to do broken hackery.

Jason
