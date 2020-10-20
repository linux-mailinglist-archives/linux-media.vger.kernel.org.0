Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27FEE28A395
	for <lists+linux-media@lfdr.de>; Sun, 11 Oct 2020 01:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390237AbgJJW4u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Oct 2020 18:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731128AbgJJTxO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Oct 2020 15:53:14 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A0CC0613BA
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2020 04:56:12 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id m7so13224254oie.0
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2020 04:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kVkxIdHN6o3O+u6tSfedNSb1VzfwX2F8ZeWL/VdW1R0=;
        b=PmcQ6HnUaDFVR4ZG1jxYVR6Iy6yUiTRwMlYI1/tSbKPEa/kwoMlz7zfmOuI2hn6KYq
         V0dHtSf/LrEJbqhpaMjU8h/EJY/bF1jSwPEMaaWBwHAo1f9SuoP4vCo+L5gVrMpGB++A
         PnZ1b3eYUezb1GhvqoZ2KN7Thv1h+lAXB1upE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kVkxIdHN6o3O+u6tSfedNSb1VzfwX2F8ZeWL/VdW1R0=;
        b=I77cBKt0qhg5zlK7r/aDrRkz6wiSqBD7jY6up9k9TUqCZ4fwDTvpURaE/8YVaPAEs5
         uq/WbJdtuPBnQEtR6VzqXQlGgFUsnx1VYtcYgD1Inhcl/bQ9B6MEEbtr33y/vqfr+XsL
         /cslfT9t1QAvn/mDLsvyr8CFcIOK12a28/ZsKhRhoNO2JAmaVtR1qi+CfLojseqgOSXV
         h7Uiqo3Egy/FTtYMtg7EA34dG5r055bvLh46uLUMUQSswESBxdLnnbzJ6hZvYsy2EDh7
         svLbUnPAK5Sdh+oo9IP2QiO8LIcaevwiCnEqJ3txsVnv57gbYzkWnXJiqZtV0J3ZHPpQ
         CIwA==
X-Gm-Message-State: AOAM53389RP2ZCptdzge02vwRTs99alR2mUqbVLiq+Xr6nl+16/3098m
        1JGvf0wPgSXe+YSwzWT5eANfd9EBTJMF0jYqS83dSg==
X-Google-Smtp-Source: ABdhPJzKftVU1haFUl3kJpPXCXE2YEa9neFI+uGYsToCivJpyHsTIlVZins4yYKilYPHMWVOsn/OllhI0jrgavqKgKA=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr3655546oig.128.1602330971569;
 Sat, 10 Oct 2020 04:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch> <20201009123421.67a80d72@coco.lan>
 <20201009122111.GN5177@ziepe.ca> <20201009143723.45609bfb@coco.lan>
 <20201009124850.GP5177@ziepe.ca> <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
 <20201010112122.587f9945@coco.lan> <CAKMK7uEKP5UMKeQHkTHWYUJkp=mz-Hvh-fJZy1KP3kT2xHpHrg@mail.gmail.com>
 <20201010133929.746d0529@coco.lan>
In-Reply-To: <20201010133929.746d0529@coco.lan>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Sat, 10 Oct 2020 13:56:00 +0200
Message-ID: <CAKMK7uEwT0TBvHtVMHeSW2gwt2nhm7mpd2pNuUHUCz=EaYM3yw@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 10, 2020 at 1:39 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Sat, 10 Oct 2020 12:53:49 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> escreveu:
>
> > Hi Mauro,
> >
> > You might want to read the patches more carefully, because what you're
> > demanding is what my patches do. Short summary:
> >
> > - if STRICT_FOLLOW_PFN is set:
> > a) normal memory is handled as-is (i.e. your example works) through
> > the addition of FOLL_LONGTERM. This is the "pin the pages correctly"
> > approach you're demanding
> > b) for non-page memory (zerocopy sharing before dma-buf was upstreamed
> > is the only use-case for this) it is correctly rejected with -EINVAL
> >
> > - if you do have blobby userspace which requires the zero-copy using
> > userptr to work, and doesn't have any of the fallbacks implemented
> > that you describe, this would be a regression. That's why
> > STRICT_FOLLOW_PFN can be unset. And yes there's a real security issue
> > in this usage, Marek also confirmed that the removal of the vma copy
> > code a few years ago essentially broke even the weak assumptions that
> > made the code work 10+ years ago when it was merged.
> >
> > so tdlr; Everything you described will keep working even with the new
> > flag set, and everything you demand must be implemented _is_
> > implemented in this patch series.
> >
> > Also please keep in mind that we are _not_ talking about the general
> > userptr support that was merge ~20 years ago. This patch series here
> > is _only_ about the zerocpy userptr support merged with 50ac952d2263
> > ("[media] videobuf2-dma-sg: Support io userptr operations on io
> > memory") in 2013.
>
> Ok, now it is making more sense. Please update the comments for
> patch 10/17 to describe the above.

Will do.

> We need some time to test this though, in order to check if no
> regressions were added (except the ones due to changeset 50ac952d2263).

Yeah testing of the previous patches to switch to FOLL_LONGTERM would
be really good. I also need that for habanalabs and ideally exynos
too. All the userptr for normal memory should keep working, and with
FOLL_LONGTERM it should actually work better, since with that it
should now correctly interact with pagecache and fs code, not just
with anon memory from malloc.

Thanks, Daniel

> > Why this hack was merged in 2013 when we merged dma-buf almost 2 years
> > before that I have no idea about. Imo that patch simply should never
> > have landed, and instead dma-buf support prioritized.
>
> If I recall correctly, we didn't have any DMABUF support
> at the media subsystem, back on 2013.
>
> It took some time for the DMA-BUF to arrive at media, as this
> was not a top priority. Also, there aren't many developers that
> understand the memory model well enough to implement DMA-BUF support
> and touch the VB2 code, which is quite complex, as it supports
> lots of different ways for I/O, plus works with vmalloc, DMA
> contig and DMA scatter/gather.
>
> Changes there should carefully be tested against different
> drivers, in order to avoid regressions on it.
>
> > Cheers, Daniel
>
> Thanks,
> Mauro



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
