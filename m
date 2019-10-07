Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 709E1CE4B1
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 16:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbfJGOIL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 10:08:11 -0400
Received: from plasma31.jpberlin.de ([80.241.56.82]:20575 "EHLO
        plasma31.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfJGOIL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 10:08:11 -0400
X-Greylist: delayed 431 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Oct 2019 10:08:09 EDT
Received: from spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122])
        by plasma.jpberlin.de (Postfix) with ESMTP id 899B7100ED7;
        Mon,  7 Oct 2019 16:00:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.76])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id aOzxezL2vd9M; Mon,  7 Oct 2019 16:00:53 +0200 (CEST)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 66A5110067A;
        Mon,  7 Oct 2019 16:00:52 +0200 (CEST)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 7 Oct 2019
 16:00:50 +0200
From:   Dmitry Morozov <dmitry.morozov@opensynergy.com>
To:     <virtio-dev@lists.oasis-open.org>
CC:     Tomasz Figa <tfiga@chromium.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        <alexlau@chromium.org>, <dgreid@chromium.org>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>, <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode device specification
Date:   Mon, 7 Oct 2019 16:00:46 +0200
Message-ID: <2489202.SRFmCUqmCE@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <CAAFQd5Ba-REZU9=rdm3J6NRqqeAUFdCV7SJ_WdO2BHyKNBN7TQ@mail.gmail.com>
References: <20190919093404.182015-1-keiichiw@chromium.org> <20190923085637.bsaevedklweijgya@sirius.home.kraxel.org> <CAAFQd5Ba-REZU9=rdm3J6NRqqeAUFdCV7SJ_WdO2BHyKNBN7TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

We at OpenSynergy are also working on an abstract paravirtualized video 
streaming device that operates input and/or output data buffers and can be used 
as a generic video decoder/encoder/input/output device.

We would be glad to share our thoughts and contribute to the discussion. 
Please see some comments regarding buffer allocation inline.

Best regards,
Dmitry.

On Samstag, 5. Oktober 2019 08:08:12 CEST Tomasz Figa wrote:
> Hi Gerd,
> 
> On Mon, Sep 23, 2019 at 5:56 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >   Hi,
> >   
> > > Our prototype implementation uses [4], which allows the virtio-vdec
> > > device to use buffers allocated by virtio-gpu device.
> > > 
> > > [4] https://lkml.org/lkml/2019/9/12/157
> 
> First of all, thanks for taking a look at this RFC and for valuable
> feedback. Sorry for the late reply.
> 
> For reference, Keiichi is working with me and David Stevens on
> accelerated video support for virtual machines and integration with
> other virtual devices, like virtio-gpu for rendering or our
> currently-downstream virtio-wayland for display (I believe there is
> ongoing work to solve this problem in upstream too).
> 
> > Well.  I think before even discussing the protocol details we need a
> > reasonable plan for buffer handling.  I think using virtio-gpu buffers
> > should be an optional optimization and not a requirement.  Also the
> > motivation for that should be clear (Let the host decoder write directly
> > to virtio-gpu resources, to display video without copying around the
> > decoded framebuffers from one device to another).
> 
> Just to make sure we're on the same page, what would the buffers come
> from if we don't use this optimization?
> 
> I can imagine a setup like this;
>  1) host device allocates host memory appropriate for usage with host
> video decoder,
>  2) guest driver allocates arbitrary guest pages for storage
> accessible to the guest software,
>  3) guest userspace writes input for the decoder to guest pages,
>  4) guest driver passes the list of pages for the input and output
> buffers to the host device
>  5) host device copies data from input guest pages to host buffer
>  6) host device runs the decoding
>  7) host device copies decoded frame to output guest pages
>  8) guest userspace can access decoded frame from those pages; back to 3
> 
> Is that something you have in mind?
While GPU side allocations can be useful (especially in case of decoder), it 
could be more practical to stick to driver side allocations. This is also due 
to the fact that paravirtualized encoders and cameras are not necessarily 
require a GPU device.

Also, the v4l2 framework already features convenient helpers for CMA and SG 
allocations. The buffers can be used in the same manner as in virtio-gpu: 
buffers are first attached to an already allocated buffer/resource descriptor and 
then are made available for processing by the device using a dedicated command 
from the driver.
> 
> > Referencing virtio-gpu buffers needs a better plan than just re-using
> > virtio-gpu resource handles.  The handles are device-specific.  What if
> > there are multiple virtio-gpu devices present in the guest?
> > 
> > I think we need a framework for cross-device buffer sharing.  One
> > possible option would be to have some kind of buffer registry, where
> > buffers can be registered for cross-device sharing and get a unique
> > id (a uuid maybe?).  Drivers would typically register buffers on
> > dma-buf export.
> 
> This approach could possibly let us handle this transparently to
> importers, which would work for guest kernel subsystems that rely on
> the ability to handle buffers like native memory (e.g. having a
> sgtable or DMA address) for them.
> 
> How about allocating guest physical addresses for memory corresponding
> to those buffers? On the virtio-gpu example, that could work like
> this:
>  - by default a virtio-gpu buffer has only a resource handle,
>  - VIRTIO_GPU_RESOURCE_EXPORT command could be called to have the
> virtio-gpu device export the buffer to a host framework (inside the
> VMM) that would allocate guest page addresses for it, which the
> command would return in a response to the guest,
>  - virtio-gpu driver could then create a regular DMA-buf object for
> such memory, because it's just backed by pages (even though they may
> not be accessible to the guest; just like in the case of TrustZone
> memory protection on bare metal systems),
>  - any consumer would be able to handle such buffer like a regular
> guest memory, passing low-level scatter-gather tables to the host as
> buffer descriptors - this would nicely integrate with the basic case
> without buffer sharing, as described above.
> 
> Another interesting side effect of the above approach would be the
> ease of integration with virtio-iommu. If the virtio master device is
> put behind a virtio-iommu, the guest page addresses become the input
> to iommu page tables and IOVA addresses go to the host via the virtio
> master device protocol, inside the low-level scatter-gather tables.
> 
> What do you think?
> 
> Best regards,
> Tomasz
> 
> > Another option would be to pass around both buffer handle and buffer
> > owner, i.e. instead of "u32 handle" have something like this:
> > 
> > struct buffer_reference {
> > 
> >         enum device_type; /* pci, virtio-mmio, ... */
> >         union device_address {
> >         
> >                 struct pci_address pci_addr;
> >                 u64 virtio_mmio_addr;
> >                 [ ... ]
> >         
> >         };
> >         u64 device_buffer_handle; /* device-specific, virtio-gpu could use
> >         resource ids here */> 
> > };
> > 
> > cheers,
> > 
> >   Gerd
> 
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org


