Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9508ACE4DD
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 16:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfJGOOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 10:14:30 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39465 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfJGOO3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 10:14:29 -0400
Received: by mail-ed1-f65.google.com with SMTP id a15so12601205edt.6
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 07:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SncV7BleFJci83GlqrX9VeGx3BXz4gqYS9kQYvaqREE=;
        b=dluAuxY659aFjDzBUz/Pbh/6QrunRLArVN0zfRVnsuovNlbSKuauMTC7iGzFOs63uh
         ZxwMG2R/qhz80IQ1dtmMIhU8nJGVFd/j9jO39sscdpFqzGeH7qjSQNiY22MvE5ZMfuk9
         oOgSFun7tiKAy0bY26AP3U4m2ye4sRU4qfavI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SncV7BleFJci83GlqrX9VeGx3BXz4gqYS9kQYvaqREE=;
        b=E7U7MXy4vABjyHB2tfnE/9Bt18+WbDeUCbcdK6zun/1DVNS6C/zQzDY3RAxLyOD0/x
         nm6FhpxwUIyQSqxRlA4QK/pGhTf/7QPq/3HZoqJBFubIHQ2p1AeC3lKyZoMeivT7sYwX
         bz+9HgWkxxPqkwoSoTzg3uZ6HguGe+qJk50jri9TdI/Ef0iRXqPWKjzC/VcKMkAr6g5O
         FjXjbNDQFP/ewEULppqXFmijP5KsQuFwoJdO/1Pd2BpV2CXOPevuzcq5pVw2ts2/OXyi
         B5m0nJwPWQwjfDmgoo5cF1s4hkZ7DP/CMwtCl+Y9kIwvAJb4sjy49lHZ2B3k3hv3nGbP
         WTNw==
X-Gm-Message-State: APjAAAWQUBphA/4ojDoUYT0TJBS7HCi/23jlmybl2Tr7Qs6BcyAGL2N7
        Kyu9JidbR4SWzl8+FL3syx7q4zPIyFj1GQ==
X-Google-Smtp-Source: APXvYqxlLIiUGBZM7JAKC3v0aNg0YyCG7CKFHtFpBLiD5h3r/qbXS9p+OwVB8b4jFN+nde0QHhMnwg==
X-Received: by 2002:a17:906:4b47:: with SMTP id j7mr23902494ejv.63.1570457667516;
        Mon, 07 Oct 2019 07:14:27 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id i7sm3318268edk.42.2019.10.07.07.14.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2019 07:14:26 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id m18so12540433wmc.1
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 07:14:25 -0700 (PDT)
X-Received: by 2002:a7b:c404:: with SMTP id k4mr22346765wmi.90.1570457665333;
 Mon, 07 Oct 2019 07:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190919093404.182015-1-keiichiw@chromium.org>
 <20190923085637.bsaevedklweijgya@sirius.home.kraxel.org> <CAAFQd5Ba-REZU9=rdm3J6NRqqeAUFdCV7SJ_WdO2BHyKNBN7TQ@mail.gmail.com>
 <2489202.SRFmCUqmCE@os-lin-dmo>
In-Reply-To: <2489202.SRFmCUqmCE@os-lin-dmo>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 7 Oct 2019 23:14:13 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DZbJfEZco_fXj+jPusmj1WaMQnai2kvbuv=ZSXAz93hw@mail.gmail.com>
Message-ID: <CAAFQd5DZbJfEZco_fXj+jPusmj1WaMQnai2kvbuv=ZSXAz93hw@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
To:     Dmitry Morozov <dmitry.morozov@opensynergy.com>
Cc:     virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>, stevensd@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

On Mon, Oct 7, 2019 at 11:01 PM Dmitry Morozov
<dmitry.morozov@opensynergy.com> wrote:
>
> Hello,
>
> We at OpenSynergy are also working on an abstract paravirtualized video
> streaming device that operates input and/or output data buffers and can be used
> as a generic video decoder/encoder/input/output device.
>
> We would be glad to share our thoughts and contribute to the discussion.
> Please see some comments regarding buffer allocation inline.
>
> Best regards,
> Dmitry.
>
> On Samstag, 5. Oktober 2019 08:08:12 CEST Tomasz Figa wrote:
> > Hi Gerd,
> >
> > On Mon, Sep 23, 2019 at 5:56 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >   Hi,
> > >
> > > > Our prototype implementation uses [4], which allows the virtio-vdec
> > > > device to use buffers allocated by virtio-gpu device.
> > > >
> > > > [4] https://lkml.org/lkml/2019/9/12/157
> >
> > First of all, thanks for taking a look at this RFC and for valuable
> > feedback. Sorry for the late reply.
> >
> > For reference, Keiichi is working with me and David Stevens on
> > accelerated video support for virtual machines and integration with
> > other virtual devices, like virtio-gpu for rendering or our
> > currently-downstream virtio-wayland for display (I believe there is
> > ongoing work to solve this problem in upstream too).
> >
> > > Well.  I think before even discussing the protocol details we need a
> > > reasonable plan for buffer handling.  I think using virtio-gpu buffers
> > > should be an optional optimization and not a requirement.  Also the
> > > motivation for that should be clear (Let the host decoder write directly
> > > to virtio-gpu resources, to display video without copying around the
> > > decoded framebuffers from one device to another).
> >
> > Just to make sure we're on the same page, what would the buffers come
> > from if we don't use this optimization?
> >
> > I can imagine a setup like this;
> >  1) host device allocates host memory appropriate for usage with host
> > video decoder,
> >  2) guest driver allocates arbitrary guest pages for storage
> > accessible to the guest software,
> >  3) guest userspace writes input for the decoder to guest pages,
> >  4) guest driver passes the list of pages for the input and output
> > buffers to the host device
> >  5) host device copies data from input guest pages to host buffer
> >  6) host device runs the decoding
> >  7) host device copies decoded frame to output guest pages
> >  8) guest userspace can access decoded frame from those pages; back to 3
> >
> > Is that something you have in mind?
> While GPU side allocations can be useful (especially in case of decoder), it
> could be more practical to stick to driver side allocations. This is also due
> to the fact that paravirtualized encoders and cameras are not necessarily
> require a GPU device.
>
> Also, the v4l2 framework already features convenient helpers for CMA and SG
> allocations. The buffers can be used in the same manner as in virtio-gpu:
> buffers are first attached to an already allocated buffer/resource descriptor and
> then are made available for processing by the device using a dedicated command
> from the driver.

First of all, thanks a lot for your input. This is a relatively new
area of virtualization and we definitely need to collect various
possible perspectives in the discussion.

From Chrome OS point of view, there are several aspects for which the
guest side allocation doesn't really work well:
1) host-side hardware has a lot of specific low level allocation
requirements, like alignments, paddings, address space limitations and
so on, which is not something that can be (easily) taught to the guest
OS,
2) allocation system is designed to be centralized, like Android
gralloc, because there is almost never a case when a buffer is to be
used only with 1 specific device. 99% of the cases are pipelines like
decoder -> GPU/display, camera -> encoder + GPU/display, GPU ->
encoder and so on, which means that allocations need to take into
account multiple hardware constraints.
3) protected content decoding: the memory for decoded video frames
must not be accessible to the guest at all

That said, the common desktop Linux model bases on allocating from the
producer device (which is why videobuf2 has allocation capability) and
we definitely need to consider this model, even if we just think about
Linux V4L2 compliance. That's why I'm suggesting the unified memory
handling based on guest physical addresses, which would handle both
guest-allocated and host-allocated memory.

Best regards,
Tomasz

> >
> > > Referencing virtio-gpu buffers needs a better plan than just re-using
> > > virtio-gpu resource handles.  The handles are device-specific.  What if
> > > there are multiple virtio-gpu devices present in the guest?
> > >
> > > I think we need a framework for cross-device buffer sharing.  One
> > > possible option would be to have some kind of buffer registry, where
> > > buffers can be registered for cross-device sharing and get a unique
> > > id (a uuid maybe?).  Drivers would typically register buffers on
> > > dma-buf export.
> >
> > This approach could possibly let us handle this transparently to
> > importers, which would work for guest kernel subsystems that rely on
> > the ability to handle buffers like native memory (e.g. having a
> > sgtable or DMA address) for them.
> >
> > How about allocating guest physical addresses for memory corresponding
> > to those buffers? On the virtio-gpu example, that could work like
> > this:
> >  - by default a virtio-gpu buffer has only a resource handle,
> >  - VIRTIO_GPU_RESOURCE_EXPORT command could be called to have the
> > virtio-gpu device export the buffer to a host framework (inside the
> > VMM) that would allocate guest page addresses for it, which the
> > command would return in a response to the guest,
> >  - virtio-gpu driver could then create a regular DMA-buf object for
> > such memory, because it's just backed by pages (even though they may
> > not be accessible to the guest; just like in the case of TrustZone
> > memory protection on bare metal systems),
> >  - any consumer would be able to handle such buffer like a regular
> > guest memory, passing low-level scatter-gather tables to the host as
> > buffer descriptors - this would nicely integrate with the basic case
> > without buffer sharing, as described above.
> >
> > Another interesting side effect of the above approach would be the
> > ease of integration with virtio-iommu. If the virtio master device is
> > put behind a virtio-iommu, the guest page addresses become the input
> > to iommu page tables and IOVA addresses go to the host via the virtio
> > master device protocol, inside the low-level scatter-gather tables.
> >
> > What do you think?
> >
> > Best regards,
> > Tomasz
> >
> > > Another option would be to pass around both buffer handle and buffer
> > > owner, i.e. instead of "u32 handle" have something like this:
> > >
> > > struct buffer_reference {
> > >
> > >         enum device_type; /* pci, virtio-mmio, ... */
> > >         union device_address {
> > >
> > >                 struct pci_address pci_addr;
> > >                 u64 virtio_mmio_addr;
> > >                 [ ... ]
> > >
> > >         };
> > >         u64 device_buffer_handle; /* device-specific, virtio-gpu could use
> > >         resource ids here */>
> > > };
> > >
> > > cheers,
> > >
> > >   Gerd
> >
> > ---------------------------------------------------------------------
> > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
>
