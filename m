Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E5E3BCA9A
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 12:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbhGFKuF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 06:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbhGFKuE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 06:50:04 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B2EC061574
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 03:47:26 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so21193436otl.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 03:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lv6Ntr7D81KS4AR+KaAWnlnh7V6npNorrES+y/On2Rg=;
        b=Q5HCTBbO9JpiY/l2YZJE7brhEw6G3QKvqcOdgPepaHpXhiMzqXKMNYiaCIJqCDELcL
         J9c3MTn//UEFCFwLMYMoBYs9K9SrOD56FbpPHV9BAZ0dh7HVLOupbFKoGro+T1YXQQ+4
         CgCPEPzG5KFeIFt+Rq1AqtMmG87oCEeWSc+JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lv6Ntr7D81KS4AR+KaAWnlnh7V6npNorrES+y/On2Rg=;
        b=XWpJi8W3/3stw/3xZOVu9oUBx/rNwH4XeCW++pf3nO9m1OEw6j+1jOouN2oiiMCjlE
         GMQgNjZ1fPpqgeL6vxwsg1kzOrWOZPVzIkvWXWmSfSMaqIx6u/Z98Tu1MltO48Zxtry/
         TSLfn0R2kG2lofYEZb6FvBDSeEirVxF5tU49ERZWcqwNgqf/tXiLm+yUkOJ4fo32ibki
         mHjX3m4hOG+Tr5bs+EgNkwKegzxq5dUuyPKEfz555ve7fBK7rXG+2NhyPr+4NLXEaMNI
         tfg1sbJsdoHFCmTAj6Un0Y7rVlrFza/qqbs/oM2Ito1LrIRouS3i8ufPnrvFErJZJnfV
         QSdA==
X-Gm-Message-State: AOAM533UFB4Y1JJLFifxOicrAaKqbOdIQm86Vqabx3xG+ezozmq+TjOD
        TkUsSzSAAhY6cQXJpta62BE7UMemopkWubuWp1JrrQ==
X-Google-Smtp-Source: ABdhPJzBiSZ9hh6t5IIo1KYEgABxRYyArfbO6EfkrDV7S7acAoT77yDKaO84/hQnSb2f1fjvsaWzwR0w30BWb4pZTuw=
X-Received: by 2002:a05:6830:2366:: with SMTP id r6mr14362057oth.188.1625568445595;
 Tue, 06 Jul 2021 03:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org> <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com> <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
In-Reply-To: <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 6 Jul 2021 12:47:14 +0200
Message-ID: <CAKMK7uHpKFVm55O_NB=WYCsv0iUt92ZUn6eCzifH=unbhe3J8g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
To:     Oded Gabbay <oded.gabbay@gmail.com>
Cc:     Oded Gabbay <ogabbay@kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Doug Ledford <dledford@redhat.com>,
        Dave Airlie <airlied@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Christoph Hellwig <hch@lst.de>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 6, 2021 at 12:36 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Tue, Jul 6, 2021 at 12:03 PM Oded Gabbay <oded.gabbay@gmail.com> wrote:
> >
> > On Tue, Jul 6, 2021 at 11:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, Jul 05, 2021 at 04:03:12PM +0300, Oded Gabbay wrote:
> > > > Hi,
> > > > I'm sending v4 of this patch-set following the long email thread.
> > > > I want to thank Jason for reviewing v3 and pointing out the errors, saving
> > > > us time later to debug it :)
> > > >
> > > > I consulted with Christian on how to fix patch 2 (the implementation) and
> > > > at the end of the day I shamelessly copied the relevant content from
> > > > amdgpu_vram_mgr_alloc_sgt() and amdgpu_dma_buf_attach(), regarding the
> > > > usage of dma_map_resource() and pci_p2pdma_distance_many(), respectively.
> > > >
> > > > I also made a few improvements after looking at the relevant code in amdgpu.
> > > > The details are in the changelog of patch 2.
> > > >
> > > > I took the time to write an import code into the driver, allowing me to
> > > > check real P2P with two Gaudi devices, one as exporter and the other as
> > > > importer. I'm not going to include the import code in the product, it was
> > > > just for testing purposes (although I can share it if anyone wants).
> > > >
> > > > I run it on a bare-metal environment with IOMMU enabled, on a sky-lake CPU
> > > > with a white-listed PCIe bridge (to make the pci_p2pdma_distance_many happy).
> > > >
> > > > Greg, I hope this will be good enough for you to merge this code.
> > >
> > > So we're officially going to use dri-devel for technical details review
> > > and then Greg for merging so we don't have to deal with other merge
> > > criteria dri-devel folks have?
> > I'm glad to receive any help or review, regardless of the subsystem
> > the person giving that help belongs to.
> >
> > >
> > > I don't expect anything less by now, but it does make the original claim
> > > that drivers/misc will not step all over accelerators folks a complete
> > > farce under the totally-not-a-gpu banner.
> > >
> > > This essentially means that for any other accelerator stack that doesn't
> > > fit the dri-devel merge criteria, even if it's acting like a gpu and uses
> > > other gpu driver stuff, you can just send it to Greg and it's good to go.
> >
> > What's wrong with Greg ??? ;)
> >
> > On a more serious note, yes, I do think the dri-devel merge criteria
> > is very extreme, and effectively drives-out many AI accelerator
> > companies that want to contribute to the kernel but can't/won't open
> > their software IP and patents.
> >
> > I think the expectation from AI startups (who are 90% of the deep
> > learning field) to cooperate outside of company boundaries is not
> > realistic, especially on the user-side, where the real IP of the
> > company resides.
> >
> > Personally I don't think there is a real justification for that at
> > this point of time, but if it will make you (and other people here)
> > happy I really don't mind creating a non-gpu accelerator subsystem
> > that will contain all the totally-not-a-gpu accelerators, and will
> > have a more relaxed criteria for upstreaming. Something along an
> > "rdma-core" style library looks like the correct amount of user-level
> > open source that should be enough.
> >
> > The question is, what will happen later ? Will it be sufficient to
> > "allow" us to use dmabuf and maybe other gpu stuff in the future (e.g.
> > hmm) ?
> >
> > If the community and dri-devel maintainers (and you among them) will
> > assure me it is good enough, then I'll happily contribute my work and
> > personal time to organize this effort and implement it.
>
> I think dri-devel stance is pretty clear and well known: We want the
> userspace to be open, because that's where most of the driver stack
> is. Without an open driver stack there's no way to ever have anything
> cross-vendor.
>
> And that includes the compiler and anything else you need to drive the hardware.
>
> Afaik linux cpu arch ports are also not accepted if there's no open
> gcc or llvm port around, because without that the overall stack just
> becomes useless.
>
> If that means AI companies don't want to open our their hw specs
> enough to allow that, so be it - all you get in that case is
> offloading the kernel side  of the stack for convenience, with zero
> long term prospects to ever make this into a cross vendor subsystem
> stack that does something useful. If the business case says you can't
> open up your hw enough for that, I really don't see the point in
> merging such a driver, it'll be an unmaintainable stack by anyone else
> who's not having access to those NDA covered specs and patents and
> everything.
>
> If the stack is actually cross vendor to begin with that's just bonus,
> but generally that doesn't happen voluntarily and needs a few years to
> decades to get there. So that's not really something we require.
>
> tldr; just a runtime isn't enough for dri-devel.
>
> Now Greg seems to be happy to merge kernel drivers that aren't useful
> with the open bits provided, so *shrug*.
>
> Cheers, Daniel
>
> PS: If requiring an actually useful open driver stack is somehow
> *extreme* I have no idea why we even bother with merging device
> drivers to upstream. Just make a stable driver api and done, vendors
> can then do whatever they feel like and protect their "valuable IP and
> patents" or whatever it is.

So perhaps this isn't clear, so let's explain this differently.

The deal when having a driver in upstream is that both the vendor and
upstream benefits:
- vendor gets their driver carried and adjusted in upstream, because
there's no stable uapi, and the benefit of being included everywhere
by default
- upstream gets the benefit to be able to hack around in more drivers,
which generally leads to a more robust subsystem and driver
architecture

Now what you want is to have the benefits for you, without giving the
wider community the benefit of actually being able to hack on your
driver stack. Because you prefer to keep critical pieces of it
protected and closed, which makes sure no one can create a new
cross-vendor stack without your permission. Or without investing a lot
of time into reverse-engineering the hardware. That's not extreme,
that's just preferring to have your cake and eat it too.

And frankly on dri-devel we don't take such a loopsided deal. Greg
otoh seems to be totally fine, or not really understand what it takes
to build an accelerator stack, or I dunno what, but he's happy merging
them.

Cheers, Daniel


> > Thanks,
> > oded
> >
> > >
> > > There's quite a lot of these floating around actually (and many do have
> > > semi-open runtimes, like habanalabs have now too, just not open enough to
> > > be actually useful). It's going to be absolutely lovely having to explain
> > > to these companies in background chats why habanalabs gets away with their
> > > stack and they don't.
> > >
> > > Or maybe we should just merge them all and give up on the idea of having
> > > open cross-vendor driver stacks for these accelerators.
> > >
> > > Thanks, Daniel
> > >
> > > >
> > > > Thanks,
> > > > Oded
> > > >
> > > > Oded Gabbay (1):
> > > >   habanalabs: define uAPI to export FD for DMA-BUF
> > > >
> > > > Tomer Tayar (1):
> > > >   habanalabs: add support for dma-buf exporter
> > > >
> > > >  drivers/misc/habanalabs/Kconfig             |   1 +
> > > >  drivers/misc/habanalabs/common/habanalabs.h |  26 ++
> > > >  drivers/misc/habanalabs/common/memory.c     | 480 +++++++++++++++++++-
> > > >  drivers/misc/habanalabs/gaudi/gaudi.c       |   1 +
> > > >  drivers/misc/habanalabs/goya/goya.c         |   1 +
> > > >  include/uapi/misc/habanalabs.h              |  28 +-
> > > >  6 files changed, 532 insertions(+), 5 deletions(-)
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
