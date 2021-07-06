Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C803BD670
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 14:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbhGFMdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 08:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245560AbhGFMM6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 08:12:58 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32616C09CE6F
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 05:07:28 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id x22-20020a9d6d960000b0290474a76f8bd4so19711041otp.5
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 05:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WcNmYFoVq/ChvnRLLz8y8GO0+i8J4bMWB+VjEQPLnks=;
        b=QVMHrhlmo2ibuidoQxhVz5hwgR1e05RHJ/DimP+nmrXG5MVnOYxKTWrOq/wxpPSWvA
         a5h6rRLQWWxW3mJRUTgnmqL+qZ7bF7rdk21SMW8Avw2cB4jHYdPjciERnvX32pr8VvEO
         Z5ZA96sJsf/kxb0WSNt9JNbRG5rVmuA8Tl8TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WcNmYFoVq/ChvnRLLz8y8GO0+i8J4bMWB+VjEQPLnks=;
        b=FxA3c46owLoCPoDMNr9bg/3mGOMNVsyvnvdA2k8Wy4j28TtgvZK34s8dDRkQolmqOd
         oBfLWZQCYnczPAOczSZVIArbGZAMe8GOEaHZh1QYvOosp5vRNOsqSr/Xy3mhBfp/NNxX
         wG5eLWrujx8TsbkNYJLwa3TlNaBRv4d4w4GOUJ7EKEvghnDejjbnMkjiK/1TiA77E0eu
         iwIgXAs3cSZHdoOcoIAHXOamYShSUA3AnkJIhdtI8pr4a86y9o6USmVvz8nsEjsTD/MZ
         58Wfe0f0Ytw/DNAx7BxCZQsQslpxHXlq0doJCPqws311eajehLFcRuZtkXJ8HFNwluq8
         yTnA==
X-Gm-Message-State: AOAM5330sUobPYYWKjqp90T/uqKV/7srBG0WGbCJz3bQ2uz+yZ2lGptj
        QznmpMWlkzlgLem3BlYs+NOaQ8Lfvq0RCKxX6ru4Mg==
X-Google-Smtp-Source: ABdhPJwsYN9q2cifnmDtRIZy3RgGdXbUzehpGTh80XUrZGM5+QnYXdLNwwHR8y5jrVFit4pnaIXnz2XDBGzy0FHJBNU=
X-Received: by 2002:a05:6830:2366:: with SMTP id r6mr14617354oth.188.1625573247505;
 Tue, 06 Jul 2021 05:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org> <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
 <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com> <CAKMK7uHpKFVm55O_NB=WYCsv0iUt92ZUn6eCzifH=unbhe3J8g@mail.gmail.com>
In-Reply-To: <CAKMK7uHpKFVm55O_NB=WYCsv0iUt92ZUn6eCzifH=unbhe3J8g@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 6 Jul 2021 14:07:16 +0200
Message-ID: <CAKMK7uFGr=ugyKj0H3ctbh28Jnr25vAgXPBaDBMmfErCxYVo3w@mail.gmail.com>
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

On Tue, Jul 6, 2021 at 12:47 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Tue, Jul 6, 2021 at 12:36 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Tue, Jul 6, 2021 at 12:03 PM Oded Gabbay <oded.gabbay@gmail.com> wrote:
> > >
> > > On Tue, Jul 6, 2021 at 11:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Mon, Jul 05, 2021 at 04:03:12PM +0300, Oded Gabbay wrote:
> > > > > Hi,
> > > > > I'm sending v4 of this patch-set following the long email thread.
> > > > > I want to thank Jason for reviewing v3 and pointing out the errors, saving
> > > > > us time later to debug it :)
> > > > >
> > > > > I consulted with Christian on how to fix patch 2 (the implementation) and
> > > > > at the end of the day I shamelessly copied the relevant content from
> > > > > amdgpu_vram_mgr_alloc_sgt() and amdgpu_dma_buf_attach(), regarding the
> > > > > usage of dma_map_resource() and pci_p2pdma_distance_many(), respectively.
> > > > >
> > > > > I also made a few improvements after looking at the relevant code in amdgpu.
> > > > > The details are in the changelog of patch 2.
> > > > >
> > > > > I took the time to write an import code into the driver, allowing me to
> > > > > check real P2P with two Gaudi devices, one as exporter and the other as
> > > > > importer. I'm not going to include the import code in the product, it was
> > > > > just for testing purposes (although I can share it if anyone wants).
> > > > >
> > > > > I run it on a bare-metal environment with IOMMU enabled, on a sky-lake CPU
> > > > > with a white-listed PCIe bridge (to make the pci_p2pdma_distance_many happy).
> > > > >
> > > > > Greg, I hope this will be good enough for you to merge this code.
> > > >
> > > > So we're officially going to use dri-devel for technical details review
> > > > and then Greg for merging so we don't have to deal with other merge
> > > > criteria dri-devel folks have?
> > > I'm glad to receive any help or review, regardless of the subsystem
> > > the person giving that help belongs to.
> > >
> > > >
> > > > I don't expect anything less by now, but it does make the original claim
> > > > that drivers/misc will not step all over accelerators folks a complete
> > > > farce under the totally-not-a-gpu banner.
> > > >
> > > > This essentially means that for any other accelerator stack that doesn't
> > > > fit the dri-devel merge criteria, even if it's acting like a gpu and uses
> > > > other gpu driver stuff, you can just send it to Greg and it's good to go.
> > >
> > > What's wrong with Greg ??? ;)
> > >
> > > On a more serious note, yes, I do think the dri-devel merge criteria
> > > is very extreme, and effectively drives-out many AI accelerator
> > > companies that want to contribute to the kernel but can't/won't open
> > > their software IP and patents.
> > >
> > > I think the expectation from AI startups (who are 90% of the deep
> > > learning field) to cooperate outside of company boundaries is not
> > > realistic, especially on the user-side, where the real IP of the
> > > company resides.
> > >
> > > Personally I don't think there is a real justification for that at
> > > this point of time, but if it will make you (and other people here)
> > > happy I really don't mind creating a non-gpu accelerator subsystem
> > > that will contain all the totally-not-a-gpu accelerators, and will
> > > have a more relaxed criteria for upstreaming. Something along an
> > > "rdma-core" style library looks like the correct amount of user-level
> > > open source that should be enough.

On the "rdma-core" idea, afaik rdma NIC do not have fully programmable
cores in their hw, for which you'd need some kind of compiler to make
use of the hardware and the interfaces the kernel provides? So not
really compareable, but also my understanding is that rdma-core does
actually allow you to reasonable use&drive all the hw features and
kernel interfaces fully.

So we actually want less on dri-devel, because for compute/accel chips
we're currently happy with a vendor userspace. It just needs to be
functional and complete, and open in its entirety.

Now if there's going to be a AI/NN/spatial compute core runtime with
all the things included that's cross-vendor that's obviously going to
be great, but that's strictly a bonus. And eventually the long-term
goal, once we have a few open stacks from various vendors. But atm we
have 0 open stacks, so one thing at a time.

> > > The question is, what will happen later ? Will it be sufficient to
> > > "allow" us to use dmabuf and maybe other gpu stuff in the future (e.g.
> > > hmm) ?
> > >
> > > If the community and dri-devel maintainers (and you among them) will
> > > assure me it is good enough, then I'll happily contribute my work and
> > > personal time to organize this effort and implement it.
> >
> > I think dri-devel stance is pretty clear and well known: We want the
> > userspace to be open, because that's where most of the driver stack
> > is. Without an open driver stack there's no way to ever have anything
> > cross-vendor.
> >
> > And that includes the compiler and anything else you need to drive the hardware.
> >
> > Afaik linux cpu arch ports are also not accepted if there's no open
> > gcc or llvm port around, because without that the overall stack just
> > becomes useless.
> >
> > If that means AI companies don't want to open our their hw specs
> > enough to allow that, so be it - all you get in that case is
> > offloading the kernel side  of the stack for convenience, with zero
> > long term prospects to ever make this into a cross vendor subsystem
> > stack that does something useful. If the business case says you can't
> > open up your hw enough for that, I really don't see the point in
> > merging such a driver, it'll be an unmaintainable stack by anyone else
> > who's not having access to those NDA covered specs and patents and
> > everything.
> >
> > If the stack is actually cross vendor to begin with that's just bonus,
> > but generally that doesn't happen voluntarily and needs a few years to
> > decades to get there. So that's not really something we require.
> >
> > tldr; just a runtime isn't enough for dri-devel.
> >
> > Now Greg seems to be happy to merge kernel drivers that aren't useful
> > with the open bits provided, so *shrug*.
> >
> > Cheers, Daniel
> >
> > PS: If requiring an actually useful open driver stack is somehow
> > *extreme* I have no idea why we even bother with merging device
> > drivers to upstream. Just make a stable driver api and done, vendors
> > can then do whatever they feel like and protect their "valuable IP and
> > patents" or whatever it is.
>
> So perhaps this isn't clear, so let's explain this differently.
>
> The deal when having a driver in upstream is that both the vendor and
> upstream benefits:
> - vendor gets their driver carried and adjusted in upstream, because
> there's no stable uapi, and the benefit of being included everywhere

s/uapi/kernel driver api/ ofc, but I got it right in the first reply at least.
-Daniel

> by default
> - upstream gets the benefit to be able to hack around in more drivers,
> which generally leads to a more robust subsystem and driver
> architecture
>
> Now what you want is to have the benefits for you, without giving the
> wider community the benefit of actually being able to hack on your
> driver stack. Because you prefer to keep critical pieces of it
> protected and closed, which makes sure no one can create a new
> cross-vendor stack without your permission. Or without investing a lot
> of time into reverse-engineering the hardware. That's not extreme,
> that's just preferring to have your cake and eat it too.
>
> And frankly on dri-devel we don't take such a loopsided deal. Greg
> otoh seems to be totally fine, or not really understand what it takes
> to build an accelerator stack, or I dunno what, but he's happy merging
> them.
>
> Cheers, Daniel
>
>
> > > Thanks,
> > > oded
> > >
> > > >
> > > > There's quite a lot of these floating around actually (and many do have
> > > > semi-open runtimes, like habanalabs have now too, just not open enough to
> > > > be actually useful). It's going to be absolutely lovely having to explain
> > > > to these companies in background chats why habanalabs gets away with their
> > > > stack and they don't.
> > > >
> > > > Or maybe we should just merge them all and give up on the idea of having
> > > > open cross-vendor driver stacks for these accelerators.
> > > >
> > > > Thanks, Daniel
> > > >
> > > > >
> > > > > Thanks,
> > > > > Oded
> > > > >
> > > > > Oded Gabbay (1):
> > > > >   habanalabs: define uAPI to export FD for DMA-BUF
> > > > >
> > > > > Tomer Tayar (1):
> > > > >   habanalabs: add support for dma-buf exporter
> > > > >
> > > > >  drivers/misc/habanalabs/Kconfig             |   1 +
> > > > >  drivers/misc/habanalabs/common/habanalabs.h |  26 ++
> > > > >  drivers/misc/habanalabs/common/memory.c     | 480 +++++++++++++++++++-
> > > > >  drivers/misc/habanalabs/gaudi/gaudi.c       |   1 +
> > > > >  drivers/misc/habanalabs/goya/goya.c         |   1 +
> > > > >  include/uapi/misc/habanalabs.h              |  28 +-
> > > > >  6 files changed, 532 insertions(+), 5 deletions(-)
> > > > >
> > > > > --
> > > > > 2.25.1
> > > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
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
