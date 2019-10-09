Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC215D0624
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 05:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbfJID4D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 23:56:03 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46128 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfJID4C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 23:56:02 -0400
Received: by mail-ed1-f68.google.com with SMTP id t3so665229edw.13
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 20:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y5YnTWb78NuPCzr7YfOxZSg25TdqjOEtY6nJ641vJyc=;
        b=VJPilnegXdH0sPfUyOVbb84kmsw2hViH78ft5LdmxGgBA59KUHIb9wZN2kPMXBLC1D
         /9A8QHIRRDHyvwEXah7gNA12hwMeIUIIoog5CJcJOZ0+gVni/Vpo8TKkSzFX6mwKGiio
         GspZTRbFeCLcg0bncYMU4AIMonkCAh7gr0XE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y5YnTWb78NuPCzr7YfOxZSg25TdqjOEtY6nJ641vJyc=;
        b=M92l3KQkOJtV46Cne/3E5KGAgdTGn/zd7QcpXYChZ8B42WXSotjrBVcx2QqCF0M4tK
         hhqn1DCVDD+n4qRbpGu+/rg+QwInjZbse6ytc8sRt3hseqWNT2iEvtNvdmpGvq4iN1Bq
         psr6t0vkcZscIUr+6eVUgPcF3r4CdJsyTa/ApMLwdWoR7TBsNMrLIHQVlinbpaUK36Qm
         9vsuFjsrB3ujkENSdvpOkVqN2Q4HNzISskLyN8ZdXDfpHbD1yBrhyQXj4iP1iHYETUwo
         btqaoVFnSv3kJhjP89dv+R3MDZ8ZWFLn4zTz/qsgQdiAdRFFx7N79HVhzWFMYhYyiSXK
         hpgg==
X-Gm-Message-State: APjAAAVhwe/mRwWl8+HXxxfZHPwNoIFX5Itkx3nR581K34oTcKQfJ0Vq
        YWv0Cv7jggq8SnLCFPp+jO3GDvCK0dW36w==
X-Google-Smtp-Source: APXvYqwlJStShodLjPJy27wiAWBmijk4Zn74dV67TY6sC2zcR2BPf8/jxVkvfx++Uz2sGBBH6yUF2Q==
X-Received: by 2002:a17:906:c78e:: with SMTP id cw14mr880483ejb.67.1570593359863;
        Tue, 08 Oct 2019 20:55:59 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id h38sm149721edh.13.2019.10.08.20.55.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 20:55:59 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id p7so654515wmp.4
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 20:55:58 -0700 (PDT)
X-Received: by 2002:a1c:e404:: with SMTP id b4mr889345wmh.90.1570593357873;
 Tue, 08 Oct 2019 20:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190919093404.182015-1-keiichiw@chromium.org>
 <2489202.SRFmCUqmCE@os-lin-dmo> <CAAFQd5DZbJfEZco_fXj+jPusmj1WaMQnai2kvbuv=ZSXAz93hw@mail.gmail.com>
 <4037801.MZecyecTDs@os-lin-dmo>
In-Reply-To: <4037801.MZecyecTDs@os-lin-dmo>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 9 Oct 2019 12:55:45 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CfNK1oisDaOWaW+9NTQOLn1EHPrPzvxMPcSxLkBgv3Ww@mail.gmail.com>
Message-ID: <CAAFQd5CfNK1oisDaOWaW+9NTQOLn1EHPrPzvxMPcSxLkBgv3Ww@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
To:     Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Gerd Hoffmann <kraxel@redhat.com>, stevensd@chromium.org
Cc:     virtio-dev@lists.oasis-open.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 8, 2019 at 12:09 AM Dmitry Morozov
<dmitry.morozov@opensynergy.com> wrote:
>
> Hi Tomasz,
>
> On Montag, 7. Oktober 2019 16:14:13 CEST Tomasz Figa wrote:
> > Hi Dmitry,
> >
> > On Mon, Oct 7, 2019 at 11:01 PM Dmitry Morozov
> >
> > <dmitry.morozov@opensynergy.com> wrote:
> > > Hello,
> > >
> > > We at OpenSynergy are also working on an abstract paravirtualized video
> > > streaming device that operates input and/or output data buffers and can be
> > > used as a generic video decoder/encoder/input/output device.
> > >
> > > We would be glad to share our thoughts and contribute to the discussion.
> > > Please see some comments regarding buffer allocation inline.
> > >
> > > Best regards,
> > > Dmitry.
> > >
> > > On Samstag, 5. Oktober 2019 08:08:12 CEST Tomasz Figa wrote:
> > > > Hi Gerd,
> > > >
> > > > On Mon, Sep 23, 2019 at 5:56 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > > >   Hi,
> > > > >
> > > > > > Our prototype implementation uses [4], which allows the virtio-vdec
> > > > > > device to use buffers allocated by virtio-gpu device.
> > > > > >
> > > > > > [4] https://lkml.org/lkml/2019/9/12/157
> > > >
> > > > First of all, thanks for taking a look at this RFC and for valuable
> > > > feedback. Sorry for the late reply.
> > > >
> > > > For reference, Keiichi is working with me and David Stevens on
> > > > accelerated video support for virtual machines and integration with
> > > > other virtual devices, like virtio-gpu for rendering or our
> > > > currently-downstream virtio-wayland for display (I believe there is
> > > > ongoing work to solve this problem in upstream too).
> > > >
> > > > > Well.  I think before even discussing the protocol details we need a
> > > > > reasonable plan for buffer handling.  I think using virtio-gpu buffers
> > > > > should be an optional optimization and not a requirement.  Also the
> > > > > motivation for that should be clear (Let the host decoder write
> > > > > directly
> > > > > to virtio-gpu resources, to display video without copying around the
> > > > > decoded framebuffers from one device to another).
> > > >
> > > > Just to make sure we're on the same page, what would the buffers come
> > > > from if we don't use this optimization?
> > > >
> > > > I can imagine a setup like this;
> > > >
> > > >  1) host device allocates host memory appropriate for usage with host
> > > >
> > > > video decoder,
> > > >
> > > >  2) guest driver allocates arbitrary guest pages for storage
> > > >
> > > > accessible to the guest software,
> > > >
> > > >  3) guest userspace writes input for the decoder to guest pages,
> > > >  4) guest driver passes the list of pages for the input and output
> > > >
> > > > buffers to the host device
> > > >
> > > >  5) host device copies data from input guest pages to host buffer
> > > >  6) host device runs the decoding
> > > >  7) host device copies decoded frame to output guest pages
> > > >  8) guest userspace can access decoded frame from those pages; back to 3
> > > >
> > > > Is that something you have in mind?
> > >
> > > While GPU side allocations can be useful (especially in case of decoder),
> > > it could be more practical to stick to driver side allocations. This is
> > > also due to the fact that paravirtualized encoders and cameras are not
> > > necessarily require a GPU device.
> > >
> > > Also, the v4l2 framework already features convenient helpers for CMA and
> > > SG
> > > allocations. The buffers can be used in the same manner as in virtio-gpu:
> > > buffers are first attached to an already allocated buffer/resource
> > > descriptor and then are made available for processing by the device using
> > > a dedicated command from the driver.
> >
> > First of all, thanks a lot for your input. This is a relatively new
> > area of virtualization and we definitely need to collect various
> > possible perspectives in the discussion.
> >
> > From Chrome OS point of view, there are several aspects for which the
> > guest side allocation doesn't really work well:
> > 1) host-side hardware has a lot of specific low level allocation
> > requirements, like alignments, paddings, address space limitations and
> > so on, which is not something that can be (easily) taught to the guest
> > OS,
> I couldn't agree more. There are some changes by Greg to add support for
> querying GPU buffer metadata. Probably those changes could be integrated with
> 'a framework for cross-device buffer sharing' (something that Greg mentioned
> earlier in the thread and that would totally make sense).
>

Did you mean one of Gerd's proposals?

I think we need some clarification there, as it's not clear to me
whether the framework is host-side, guest-side or both. The approach I
suggested would rely on a host-side framework and guest-side wouldn't
need any special handling for sharing, because the memory would behave
as on bare metal.

However allocation would still need some special API to express high
level buffer parameters and delegate the exact allocation requirements
to the host. Currently virtio-gpu already has such interface and also
has a DRM driver, which were the 2 main reasons for us to use it as
the allocator in Chrome OS. (minigbm/cros_gralloc are implemented on
top of the Linux DRM API)

> > 2) allocation system is designed to be centralized, like Android
> > gralloc, because there is almost never a case when a buffer is to be
> > used only with 1 specific device. 99% of the cases are pipelines like
> > decoder -> GPU/display, camera -> encoder + GPU/display, GPU ->
> > encoder and so on, which means that allocations need to take into
> > account multiple hardware constraints.
> > 3) protected content decoding: the memory for decoded video frames
> > must not be accessible to the guest at all
> This looks like a valid use case. Would it also be possible for instance to
> allocate mem from a secure ION heap on the guest and then to provide the sgt
> to the device? We don't necessarily need to map that sgt for guest access.

Could you elaborate on how that would work? Would the secure ION heap
implementation use some protocol to request the allocation from the
host?

Another aspect is that on Chrome OS we don't support pre-reserved
carveout heaps, so we need this memory to be allocated by the host
dynamically.

>
> Best regards,
> Dmitry.
>
> >
> > That said, the common desktop Linux model bases on allocating from the
> > producer device (which is why videobuf2 has allocation capability) and
> > we definitely need to consider this model, even if we just think about
> > Linux V4L2 compliance. That's why I'm suggesting the unified memory
> > handling based on guest physical addresses, which would handle both
> > guest-allocated and host-allocated memory.
> >
> > Best regards,
> > Tomasz
> >
> > > > > Referencing virtio-gpu buffers needs a better plan than just re-using
> > > > > virtio-gpu resource handles.  The handles are device-specific.  What
> > > > > if
> > > > > there are multiple virtio-gpu devices present in the guest?
> > > > >
> > > > > I think we need a framework for cross-device buffer sharing.  One
> > > > > possible option would be to have some kind of buffer registry, where
> > > > > buffers can be registered for cross-device sharing and get a unique
> > > > > id (a uuid maybe?).  Drivers would typically register buffers on
> > > > > dma-buf export.
> > > >
> > > > This approach could possibly let us handle this transparently to
> > > > importers, which would work for guest kernel subsystems that rely on
> > > > the ability to handle buffers like native memory (e.g. having a
> > > > sgtable or DMA address) for them.
> > > >
> > > > How about allocating guest physical addresses for memory corresponding
> > > > to those buffers? On the virtio-gpu example, that could work like
> > > >
> > > > this:
> > > >  - by default a virtio-gpu buffer has only a resource handle,
> > > >  - VIRTIO_GPU_RESOURCE_EXPORT command could be called to have the
> > > >
> > > > virtio-gpu device export the buffer to a host framework (inside the
> > > > VMM) that would allocate guest page addresses for it, which the
> > > > command would return in a response to the guest,
> > > >
> > > >  - virtio-gpu driver could then create a regular DMA-buf object for
> > > >
> > > > such memory, because it's just backed by pages (even though they may
> > > > not be accessible to the guest; just like in the case of TrustZone
> > > > memory protection on bare metal systems),
> > > >
> > > >  - any consumer would be able to handle such buffer like a regular
> > > >
> > > > guest memory, passing low-level scatter-gather tables to the host as
> > > > buffer descriptors - this would nicely integrate with the basic case
> > > > without buffer sharing, as described above.
> > > >
> > > > Another interesting side effect of the above approach would be the
> > > > ease of integration with virtio-iommu. If the virtio master device is
> > > > put behind a virtio-iommu, the guest page addresses become the input
> > > > to iommu page tables and IOVA addresses go to the host via the virtio
> > > > master device protocol, inside the low-level scatter-gather tables.
> > > >
> > > > What do you think?
> > > >

I was recently thinking about emulating real devices, like a USB
camera (via an emulated USB host controller) and realized that this
approach would also make it possible for such hardware to share
buffers with virtio (or paravirtualized in general) devices in a
zero-copy manner, because the memory would be described as on a native
system, using a scatter-gather list of DMA addresses.

Best regards,
Tomasz

> > > > Best regards,
> > > > Tomasz
> > > >
> > > > > Another option would be to pass around both buffer handle and buffer
> > > > > owner, i.e. instead of "u32 handle" have something like this:
> > > > >
> > > > > struct buffer_reference {
> > > > >
> > > > >         enum device_type; /* pci, virtio-mmio, ... */
> > > > >         union device_address {
> > > > >
> > > > >                 struct pci_address pci_addr;
> > > > >                 u64 virtio_mmio_addr;
> > > > >                 [ ... ]
> > > > >
> > > > >         };
> > > > >         u64 device_buffer_handle; /* device-specific, virtio-gpu could
> > > > >         use
> > > > >         resource ids here */>
> > > > >
> > > > > };
> > > > >
> > > > > cheers,
> > > > >
> > > > >   Gerd
> > > >
> > > > ---------------------------------------------------------------------
> > > > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > > > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> --
>
> Dmitry Morozov
> Senior Software Engineer
>
> OpenSynergy GmbH
> Rotherstr. 20, 10245 Berlin
>
> Phone:    +49 30 60 98 54 0 - 910
> Fax:      +49 30 60 98 54 0 - 99
>
>
