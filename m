Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C03282A62
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 13:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgJDLWO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 07:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbgJDLUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Oct 2020 07:20:44 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CE5C0613D0
        for <linux-media@vger.kernel.org>; Sun,  4 Oct 2020 04:20:43 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id m12so5881015otr.0
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2020 04:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F1P39aVq/hZE1a/ZNFpkwqSichMZqIMoJHAVD0hctIo=;
        b=f5dd3MrkYcy8/aD7b+pp4n3Qd4ummEslPZLTRt6CmyxxeMAlfleGd5Dfp874p+qUpY
         j6kAiBeOvNPrJhgZA8ZwL8CfE9QHGJf7l9mEUa3q3twT+o7VwA7yWSbyIEkatqa7DjKZ
         2o7kSRHm9MLEBW4gDBATa2dJOssUGc4hiGwFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F1P39aVq/hZE1a/ZNFpkwqSichMZqIMoJHAVD0hctIo=;
        b=AC9WN3S5vxQlYHDNla0WkQ+zRHN6IijMB1/1a7CSxKN4qnovEkLHHRQ+LLTmhCmOxD
         vdXz3FmOCOu6C0uRYF8ZwomSROX4J8JFTzjUnzP5V/QIL7CL7Qzct8PJcY59xyKkLUyb
         JW6wYEGQHi0fzTZXWYT3jyHUjnly8CTmi8MzO02uz1zomru6PJhK45hof4R4WBUosjTC
         ikxfPepsIzf5CWqq103OT7/2dFTPnS/GvXiMdG7jCEcg5gotouCgF9imwL8xfdc0dMTq
         rADM+jHLfWgwcoJhSxR8Zkf0GzZ7GnrfNG4wYgNyWytREFoLh4sgBQdAso8v38loqRK1
         zFjg==
X-Gm-Message-State: AOAM532P3MJJeQMNj9cPNINvmux9x1lj+MeG7g8SrsvLWEE9PxYFjaFk
        IGT0+sNyxCRl0vfuBQd5DA7WphSe9kuN2casbgrmdA==
X-Google-Smtp-Source: ABdhPJzk4utKZUHKkD2Pntaa4TtV+H5VfSo7BOy9dlnzPXQ7sPmOEnfTjNGZnPb4bUQ2llmVT9XDHSXvI1R3pQKQgMQ=
X-Received: by 2002:a05:6830:1647:: with SMTP id h7mr777182otr.281.1601810442219;
 Sun, 04 Oct 2020 04:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch> <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
 <CAKMK7uGzZ2dBe040vP1BJmQ7cuhj_OQHL0ncyz5XyUcb=bPjmg@mail.gmail.com>
 <f5130c7f-eebe-7b21-62b8-68f08212b106@nvidia.com> <20201003232441.GO9916@ziepe.ca>
In-Reply-To: <20201003232441.GO9916@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Sun, 4 Oct 2020 13:20:31 +0200
Message-ID: <CAKMK7uFjGDiWMD+KeEFziY-nqWy_FtCpn0rekb70yVLaxzJHjA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 4, 2020 at 1:24 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Sat, Oct 03, 2020 at 03:52:32PM -0700, John Hubbard wrote:
> > On 10/3/20 2:45 AM, Daniel Vetter wrote:
> > > On Sat, Oct 3, 2020 at 12:39 AM John Hubbard <jhubbard@nvidia.com> wrote:
> > > >
> > > > On 10/2/20 10:53 AM, Daniel Vetter wrote:
> > > > > For $reasons I've stumbled over this code and I'm not sure the change
> > > > > to the new gup functions in 55a650c35fea ("mm/gup: frame_vector:
> > > > > convert get_user_pages() --> pin_user_pages()") was entirely correct.
> > > > >
> > > > > This here is used for long term buffers (not just quick I/O) like
> > > > > RDMA, and John notes this in his patch. But I thought the rule for
> > > > > these is that they need to add FOLL_LONGTERM, which John's patch
> > > > > didn't do.
> > > >
> > > > Yep. The earlier gup --> pup conversion patches were intended to not
> > > > have any noticeable behavior changes, and FOLL_LONGTERM, with it's
> > > > special cases and such, added some risk that I wasn't ready to take
> > > > on yet. Also, FOLL_LONGTERM rules are only *recently* getting firmed
> > > > up. So there was some doubt at least in my mind, about which sites
> > > > should have it.
> > > >
> > > > But now that we're here, I think it's really good that you've brought
> > > > this up. It's definitely time to add FOLL_LONGTERM wherever it's missing.
> > >
> > > So should I keep this patch, or will it collide with a series you're working on?
> >
> > It doesn't collide with anything on my end yet, because I've been slow to
> > pick up on the need for changing callsites to add FOLL_LONGTERM. :)
> >
> > And it looks like that's actually a problem, because:
> >
> > >
> > > Also with the firmed up rules, correct that I can also drop the
> > > vma_is_fsdax check when the FOLL_LONGTERM flag is set?
> >
> > That's the right direction to go *in general*, but I see that the
> > pin_user_pages code is still a bit stuck in the past. And this patch
> > won't actually work, with or without that vma_is_fsdax() check.
> > Because:
> >
> > get_vaddr_frames(FOLL_LONGTERM)
> >    pin_user_pages_locked()
> >       if (WARN_ON_ONCE(gup_flags & FOLL_LONGTERM))
> >               return -EINVAL;
>
> There is no particular reason this code needs to have the mm sem at
> that point.
>
> It should call pin_user_pages_fast() and only if that fails get the mmap
> lock and extract the VMA to do broken hackery.

Yeah I think that works. I tried understanding gup.c code a bit more,
and it looks like FOLL_LONGTERM only works for the pup_fast variant
right now? All others seem to have this comment that it's somehow
incompatible with FAULT_FLAG_ALLOW_RETRY and daxfs. But grepping
around for that didn't show up anything, at least not nearby dax code.
For my understanding of all this, what's the hiccup there?

For plans, I only started this for a bit of my own learning, but I
think I'll respin with the following changes:
- convert exynos and habanalabs to pin_user_pages_fast directly,
instead of going through this frame-vector detour
- move the locking and convert get_vaddr_frames to pup_fast as Jason suggested
- hack up some truly gross rfc to plug the follow_pfn hole

Cheers, Daniel

--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
