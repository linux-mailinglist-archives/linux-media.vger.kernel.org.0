Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7248C283D44
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 19:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbgJER25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 13:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbgJER24 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 13:28:56 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07E7C0613A7
        for <linux-media@vger.kernel.org>; Mon,  5 Oct 2020 10:28:56 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id e7so10253649qtj.11
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2020 10:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y/b5RyjaEhoxKk2eHP6c3b/AJHv4kgCuakgmCNKfzEo=;
        b=otikT+4/1kDYRtQPc90pOcUt7CIquAj9yJbI9pGWzLjMgQp15bOu4C8rrRiUvNdnOM
         aKRgzlI7WytYj3mQeUdETfT2+hzXbe5sJLyntWHbz6yFOLgh0JBERO8IenWVpfWdziWs
         WCSUErfHWn/N+MdyHji8NEKT89KXjwOzmhehS1HW+4Q+imTf6kNnTLNjWgptms/pujrQ
         Cs4qofDbviM645imWY6iIc+WskHXh8ZHWNjxAeoh8PP9ubuzeqeWDGwds2B4Zvokpocd
         kBbjdsyPXICjJaDBzJyAwYhCl0nOW5eOiHuj+ykvdUWUFa45JKkh5b+vj9GDXv+um/B1
         H5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y/b5RyjaEhoxKk2eHP6c3b/AJHv4kgCuakgmCNKfzEo=;
        b=tPVC5uKCBsicTklg4jYNLNZWAYLGnirwyXdgAK7PaRXjNgv+PaDI8odmLmSJ2Xt8TE
         12QkIZbY+X1MIAS5Ai3EJosu1f0JkteGZBlgLGjSp3PemcdR9OF9TYgVp7++z38fc7JM
         ioKssuLf2MZeI3uZPYqZrpmkgpUTA+ozIVfU1fWM9w+HihVe9vBMM1qU2OKPm2osRoRd
         wCevm8Vg/XJGGVoJv07XvE0tJcqQKY0DkAfqKoDkPJ9H+6pG0MlRyqRYSXFmMfrslq9J
         IPJQR6QttYr/d8Fd3z80ANgzzOjdIMnS8BpAJMbNeTvCIep4pYmwntb6VCh+UzsCpylr
         8DOg==
X-Gm-Message-State: AOAM5321FIpdokf1WhvaGnhbRwTUDdLNDWNvj3YhPAqO+kbgSSE5XVQs
        yfuZNjMa+QfmLNsoW9KePnSdNQ==
X-Google-Smtp-Source: ABdhPJzLYTVlvik+5HWAkt3kwllBS/QK3mi+3CPtiiTll37dAN3y7eDgBNRLLSEhFG2/0i8k53ngjA==
X-Received: by 2002:aed:24c9:: with SMTP id u9mr939696qtc.292.1601918935717;
        Mon, 05 Oct 2020 10:28:55 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id t2sm279676qti.25.2020.10.05.10.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 10:28:55 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kPUIA-0001gW-6L; Mon, 05 Oct 2020 14:28:54 -0300
Date:   Mon, 5 Oct 2020 14:28:54 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201005172854.GA5177@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca>
 <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 04, 2020 at 06:09:29PM +0200, Daniel Vetter wrote:
> On Sun, Oct 4, 2020 at 2:51 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Sat, Oct 03, 2020 at 11:40:22AM +0200, Daniel Vetter wrote:
> >
> > > > That leaves the only interesting places as vb2_dc_get_userptr() and
> > > > vb2_vmalloc_get_userptr() which both completely fail to follow the
> > > > REQUIRED behavior in the function's comment about checking PTEs. It
> > > > just DMA maps them. Badly broken.
> > > >
> > > > Guessing this hackery is for some embedded P2P DMA transfer?
> > >
> > > Yeah, see also the follow_pfn trickery in
> > > videobuf_dma_contig_user_get(), I think this is fully intentional and
> > > userspace abi we can't break :-/
> >
> > We don't need to break uABI, it just needs to work properly in the
> > kernel:
> >
> >   vma = find_vma_intersection()
> >   dma_buf = dma_buf_get_from_vma(vma)
> >   sg = dma_buf_p2p_dma_map(dma_buf)
> >   [.. do dma ..]
> >   dma_buf_unmap(sg)
> >   dma_buf_put(dma_buf)
> >
> > It is as we discussed before, dma buf needs to be discoverable from a
> > VMA, at least for users doing this kind of stuff.
> 
> I'm not a big fan of magic behaviour like this, there's more to
> dma-buf buffer sharing than just "how do I get at the backing
> storage". Thus far we've done everything rather explicitly. Plus with
> exynos and habanalabs converted there's only v4l left over, and that
> has a proper dma-buf import path already.

Well, any VA approach like this has to access some backing refcount
via the VMA. Not really any way to avoid something like that

> > A VM flag doesn't help - we need to introduce some kind of lifetime,
> > and that has to be derived from the VMA. It needs data not just a flag
> 
> I don't want to make it work, I just want to make it fail. Rough idea
> I have in mind is to add a follow_pfn_longterm, for all callers which
> aren't either synchronized through mmap_sem or an mmu_notifier. 

follow_pfn() doesn't work outside the pagetable locks or mmu notifier
protection. Can't be fixed.

We only have a few users:

arch/s390/pci/pci_mmio.c:       ret = follow_pfn(vma, user_addr, pfn);
drivers/media/v4l2-core/videobuf-dma-contig.c:          ret = follow_pfn(vma, user_address, &this_pfn);
drivers/vfio/vfio_iommu_type1.c:        ret = follow_pfn(vma, vaddr, pfn);
drivers/vfio/vfio_iommu_type1.c:                ret = follow_pfn(vma, vaddr, pfn);
mm/frame_vector.c:                      err = follow_pfn(vma, start, &nums[ret]);
virt/kvm/kvm_main.c:    r = follow_pfn(vma, addr, &pfn);
virt/kvm/kvm_main.c:            r = follow_pfn(vma, addr, &pfn);

VFIO is broken like media, but I saw patches fixing the vfio cases
using the VMA and a vfio specific refcount.

media & frame_vector we are talking about here.

kvm is some similar hack added for P2P DMA, see commit
add6a0cd1c5ba51b201e1361b05a5df817083618. It might be protected by notifiers..

s390 looks broken too, needs to hold the page table locks.

So, the answer really is that s390 and media need fixing, and this API
should go away (or become kvm specific)

> If this really breaks anyone's use-case we can add a tainting kernel
> option which re-enables this (we've done something similar for
> phys_addr_t based buffer sharing in fbdev, entirely unfixable since
> the other driver has to just blindly trust that what userspace
> passes around is legit). This here isn't unfixable, but if v4l
> people want to keep it without a big "security hole here" sticker,
> they should do the work, not me :-)

This seems fairly reasonable..

So after frame_vec is purged and we have the one caller in media, move
all this stuff to media and taint the kernel if it goes down the
follow_pfn path

Jason
