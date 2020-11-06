Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC162A9394
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 11:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgKFKCK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 05:02:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgKFKCJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 05:02:09 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63884C0613CF
        for <linux-media@vger.kernel.org>; Fri,  6 Nov 2020 02:02:09 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id j14so766181ots.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2020 02:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pk2kOuIDyNkJ29R6DHQ3ZwTfwhAfAev58wxOeRlEcVQ=;
        b=JxYI6LDoYBIyKAFkO0mmU5GO0vKXW+XCgfB3nhMPB/96K75h8XEzFsF5vfwoI9o4Aa
         YXO5ScRni4mdNnVG7TEPzZnkXGbky0dU2v6WgMTgqxnDpBRtAtlXHbhIcZNyR+EoGosa
         88KCvZizdR0CJdRqQAGfzd4+9xfkExbEg2qoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pk2kOuIDyNkJ29R6DHQ3ZwTfwhAfAev58wxOeRlEcVQ=;
        b=qJ94DCrW3P76HbNzhQAvwA2oO6jh7Jh+f8WNM8mqZfIYY0DmEsfZb76lR0Hqip/l0U
         /dUWDwRjQ59U2BmrdFeY1mGMYCXmAgUO2urnV9XRdtZcsLLTTrEOiZNtQy88Yp0qqphm
         urswMEdFYReAs9msI1DIu5LB8w+6VJ6NoQRHXCgotrOs8jGtBb7Py1p+AAF30MHgdYD2
         1rwCvXcPbaaF6KOlZvPZN0SD3IewJ6BdlFTm7i6Ew8uV1r6pYZVB7ofFQMpIp5n7veMK
         X5UYhsa/Tifp0MOtGdlLLxs0/vS6lZDxAxS93yYKmjLRoQ6m9pODnaXAZJUCTRepGbaW
         sp9Q==
X-Gm-Message-State: AOAM533X3bukYx8XiaA8DjL9JWSttwBq79kVHubHzmpz7HbOf5TSeCKB
        JnljtB1uXoUx5yLnVJsPBvteh8aethx8jmr679+vyQ==
X-Google-Smtp-Source: ABdhPJy9+JOeNi7tvqFhbCecRqz/u5D2Qj576z0eBlCGtTEM4NmQBII1FIZeWz8GCbRUxBcA/Ididy+MZpD88l6oJcg=
X-Received: by 2002:a9d:6a19:: with SMTP id g25mr586779otn.303.1604656928858;
 Fri, 06 Nov 2020 02:02:08 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
 <20201104140023.GQ36674@ziepe.ca> <CAKMK7uH69hsFjYUkjg1aTh5f=q_3eswMSS5feFs6+ovz586+0A@mail.gmail.com>
 <20201104162125.GA13007@infradead.org> <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
 <20201104163758.GA17425@infradead.org> <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca> <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
 <20201105092524.GQ401619@phenom.ffwll.local> <20201105124950.GZ36674@ziepe.ca>
 <7ae3486d-095e-cf4e-6b0f-339d99709996@nvidia.com>
In-Reply-To: <7ae3486d-095e-cf4e-6b0f-339d99709996@nvidia.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 6 Nov 2020 11:01:57 +0100
Message-ID: <CAKMK7uGRw=xXE+D=JJsNeRav9+hdO4tcDSvDbAuWfc3T4VkoJw@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
To:     John Hubbard <jhubbard@nvidia.com>
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

On Fri, Nov 6, 2020 at 5:08 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 11/5/20 4:49 AM, Jason Gunthorpe wrote:
> > On Thu, Nov 05, 2020 at 10:25:24AM +0100, Daniel Vetter wrote:
> >>> /*
> >>>   * If we can't determine whether or not a pte is special, then fail immediately
> >>>   * for ptes. Note, we can still pin HugeTLB and THP as these are guaranteed not
> >>>   * to be special.
> >>>   *
> >>>   * For a futex to be placed on a THP tail page, get_futex_key requires a
> >>>   * get_user_pages_fast_only implementation that can pin pages. Thus it's still
> >>>   * useful to have gup_huge_pmd even if we can't operate on ptes.
> >>>   */
> >>
> >> We support hugepage faults in gpu drivers since recently, and I'm not
> >> seeing a pud_mkhugespecial anywhere. So not sure this works, but probably
> >> just me missing something again.
> >
> > It means ioremap can't create an IO page PUD, it has to be broken up.
> >
> > Does ioremap even create anything larger than PTEs?

gpu drivers also tend to use vmf_insert_pfn* directly, so we can do
on-demand paging and move buffers around. From what I glanced for
lowest level we to the pte_mkspecial correctly (I think I convinced
myself that vm_insert_pfn does that), but for pud/pmd levels it seems
just yolo.

remap_pfn_range seems to indeed split down to pte level always.

>  From my reading, yes. See ioremap_try_huge_pmd().

The ioremap here shouldn't matter, since this is for kernel-internal
mappings. So that's all fine I think.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
