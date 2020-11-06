Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7BD2A9454
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 11:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgKFK2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 05:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbgKFK2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 05:28:12 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30CE5C0613CF
        for <linux-media@vger.kernel.org>; Fri,  6 Nov 2020 02:28:11 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id 9so862086oir.5
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2020 02:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GZSvjJXJ5NeS3xeVpOYrkTBUqUJmeylcGC99/vSxMgE=;
        b=bzj83Mf9zM2hSbE8EWsBjDPrQihAyugYzXs6/XtzMk42mlteKogf38yikrIVtP0YIp
         1PpqGJ83G8CMqUOSy0c+3J2x07vzzrc1y+f0AiA/gsD366OU8Q4TqDzYqRuPe+cWSz/V
         V9A5M3N3kUQY2mHkFVy5IQrEsMOk51+osCoGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GZSvjJXJ5NeS3xeVpOYrkTBUqUJmeylcGC99/vSxMgE=;
        b=Yf4wW7XXuiiEYJnkJ/WjivWcbAc0/C8WNNb3mdXfmwzQ62f8oQpWdwGzi+rH7V/sgp
         IqHFkNjIP7Ar1goxQ0dXwbRF12Lnd7zMhM/Bia+rhp6pF2cZDW8lc24Nl4j5kZDh6QFW
         3/WyESYyiHem6DQM5AUOFaxE1yCSSjRjsqlE0IPIPd4tWRKtZOExhKhigTezU8KqQn5r
         YS+KoQLN3Sn5ma/xRKBCD+1pATOJ86IXMlu1/mr63u5l65wsgrxqD/PTDCF10dhAxgiq
         8EJMzs8teYSgS+RD8kdWPAvNSK1qhmWrrrdrNapAvUA6ACM3lpdg9eZpRwbUMlsX0LQu
         lhBg==
X-Gm-Message-State: AOAM532a32EeXmaMHqi5z5w+y6xLZTCJyCleRLn1FqDsGOHCE8t0vWZj
        XCdI7Cr3jad84cdbByC4IEqdykoWN6z5YKv4GTqwhQ==
X-Google-Smtp-Source: ABdhPJxaH0jX6R8wLLVMSL6X5ZRgt3aYM2nGlRnlOOpo51kJ5ZLuq1XuS09rdAP7rLsL8i/ky1hkd4FCo7S1HBbLmlY=
X-Received: by 2002:aca:b141:: with SMTP id a62mr626467oif.101.1604658490602;
 Fri, 06 Nov 2020 02:28:10 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
 <20201104140023.GQ36674@ziepe.ca> <CAKMK7uH69hsFjYUkjg1aTh5f=q_3eswMSS5feFs6+ovz586+0A@mail.gmail.com>
 <20201104162125.GA13007@infradead.org> <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
 <20201104163758.GA17425@infradead.org> <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca> <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
 <20201105092524.GQ401619@phenom.ffwll.local> <20201105124950.GZ36674@ziepe.ca>
 <7ae3486d-095e-cf4e-6b0f-339d99709996@nvidia.com> <CAKMK7uGRw=xXE+D=JJsNeRav9+hdO4tcDSvDbAuWfc3T4VkoJw@mail.gmail.com>
In-Reply-To: <CAKMK7uGRw=xXE+D=JJsNeRav9+hdO4tcDSvDbAuWfc3T4VkoJw@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 6 Nov 2020 11:27:59 +0100
Message-ID: <CAKMK7uFb2uhfRCwe1y5Kafd-WWqE_F3_FfpHR9f8-X-aHhgjOQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
To:     John Hubbard <jhubbard@nvidia.com>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Christoph Hellwig <hch@infradead.org>,
        "J??r??me Glisse" <jglisse@redhat.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
        KVM list <kvm@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux MM <linux-mm@kvack.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 6, 2020 at 11:01 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Nov 6, 2020 at 5:08 AM John Hubbard <jhubbard@nvidia.com> wrote:
> >
> > On 11/5/20 4:49 AM, Jason Gunthorpe wrote:
> > > On Thu, Nov 05, 2020 at 10:25:24AM +0100, Daniel Vetter wrote:
> > >>> /*
> > >>>   * If we can't determine whether or not a pte is special, then fail immediately
> > >>>   * for ptes. Note, we can still pin HugeTLB and THP as these are guaranteed not
> > >>>   * to be special.
> > >>>   *
> > >>>   * For a futex to be placed on a THP tail page, get_futex_key requires a
> > >>>   * get_user_pages_fast_only implementation that can pin pages. Thus it's still
> > >>>   * useful to have gup_huge_pmd even if we can't operate on ptes.
> > >>>   */
> > >>
> > >> We support hugepage faults in gpu drivers since recently, and I'm not
> > >> seeing a pud_mkhugespecial anywhere. So not sure this works, but probably
> > >> just me missing something again.
> > >
> > > It means ioremap can't create an IO page PUD, it has to be broken up.
> > >
> > > Does ioremap even create anything larger than PTEs?
>
> gpu drivers also tend to use vmf_insert_pfn* directly, so we can do
> on-demand paging and move buffers around. From what I glanced for
> lowest level we to the pte_mkspecial correctly (I think I convinced
> myself that vm_insert_pfn does that), but for pud/pmd levels it seems
> just yolo.

So I dug around a bit more and ttm sets PFN_DEV | PFN_MAP to get past
the various pft_t_devmap checks (see e.g. vmf_insert_pfn_pmd_prot()).
x86-64 has ARCH_HAS_PTE_DEVMAP, and gup.c seems to handle these
specially, but frankly I got totally lost in what this does.

The comment above the pfn_t_devmap check makes me wonder whether doing
this is correct or not.

Also adding Thomas Hellstrom, who implemented the huge map support in ttm.
-Daniel

> remap_pfn_range seems to indeed split down to pte level always.
>
> >  From my reading, yes. See ioremap_try_huge_pmd().
>
> The ioremap here shouldn't matter, since this is for kernel-internal
> mappings. So that's all fine I think.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
