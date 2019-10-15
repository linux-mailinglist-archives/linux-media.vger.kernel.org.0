Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8B05D77FC
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 16:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732423AbfJOOGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 10:06:43 -0400
Received: from plasma6.jpberlin.de ([80.241.56.68]:47641 "EHLO
        plasma6.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732292AbfJOOGn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 10:06:43 -0400
Received: from spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117])
        by plasma.jpberlin.de (Postfix) with ESMTP id 7E66BA547F;
        Tue, 15 Oct 2019 16:06:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id EEjfXqOcFOqP; Tue, 15 Oct 2019 16:06:38 +0200 (CEST)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 764EAA05D5;
        Tue, 15 Oct 2019 16:06:37 +0200 (CEST)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.468.0; Tue, 15 Oct
 2019 16:06:36 +0200
From:   Dmitry Morozov <dmitry.morozov@opensynergy.com>
To:     Gerd Hoffmann <kraxel@redhat.com>
CC:     Tomasz Figa <tfiga@chromium.org>, <stevensd@chromium.org>,
        <virtio-dev@lists.oasis-open.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        <alexlau@chromium.org>, <dgreid@chromium.org>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode device specification
Date:   Tue, 15 Oct 2019 16:06:36 +0200
Message-ID: <9670471.GKRsIjc3Fr@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <20191015075422.yeknnqlsy3nun44r@sirius.home.kraxel.org>
References: <20190919093404.182015-1-keiichiw@chromium.org> <12599990.jpbsygJuY9@os-lin-dmo> <20191015075422.yeknnqlsy3nun44r@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Gerd,

On Dienstag, 15. Oktober 2019 09:54:22 CEST Gerd Hoffmann wrote:
> On Mon, Oct 14, 2019 at 03:05:03PM +0200, Dmitry Morozov wrote:
> > On Montag, 14. Oktober 2019 14:34:43 CEST Gerd Hoffmann wrote:
> > >   Hi,
> > >   
> > > > My take on this (for a decoder) would be to allocate memory for output
> > > > buffers from a secure ION heap, import in the v4l2 driver, and then to
> > > > provide those to the device using virtio. The device side then uses
> > > > the
> > > > dmabuf framework to make the buffers accessible for the hardware. I'm
> > > > not
> > > > sure about that, it's just an idea.
> > > 
> > > Virtualization aside, how does the complete video decoding workflow
> > > work?  I assume along the lines of ...
> > > 
> > >   (1) allocate buffer for decoded video frames (from ion).
> > >   (2) export those buffers as dma-buf.
> > >   (3) import dma-buf to video decoder.
> > >   (4) import dma-buf to gpu.
> > > 
> > > ... to establish buffers shared between video decoder and gpu?
> > > 
> > > Then feed the video stream into the decoder, which decodes into the ion
> > > buffers?  Ask the gpu to scanout the ion buffers to show the video?
> > > 
> > > cheers,
> > > 
> > >   Gerd
> > 
> > Yes, exactly.
> > 
> > [decoder]
> > 1) Input buffers are allocated using  VIDIOC_*BUFS.
> 
> Ok.
> 
> > 2) Output buffers are allocated in a guest specific manner (ION, gbm).
> 
> Who decides whenever ION or gbm is used?  The phrase "secure ION heap"
> used above sounds like using ION is required for decoding drm-protected
> content.

I mention the secure ION heap to address this Chrome OS related point:
> 3) protected content decoding: the memory for decoded video frames
> must not be accessible to the guest at all

There was an RFC to implement a secure memory allocation framework, but 
apparently it was not accepted: https://lwn.net/Articles/661549/.

In case of Android, it allocates GPU buffers for output frames, so it is the 
gralloc implementation who decides how to allocate memory. It can use some 
dedicated ION heap or can use libgbm. It can also be some proprietary 
implementation.

> 
> So, do we have to worry about ION here?  Or can we just use gbm?

If we replace vendor specific code in the Android guest and provide a way to 
communicate meatdata for buffer allocations from the device to the driver, we 
can use gbm. In the PC world it might be easier.

> 
> [ Note: don't know much about ion, other than that it is used by
>         android, is in staging right now and patches to move it
>         out of staging are floating around @ dri-devel ]
> 
> > 3) Both input and output buffers are exported as dma-bufs.
> > 4) The backing storage of both inputs and outputs is made available to the
> > device.
> > 5) Decoder hardware writes to output buffers directly.
> 
> As expected.
> 
> > 6) Back to the guest side, the output dma-bufs are used by (virtio-) gpu.
> 
> Ok.  So, virtio-gpu has support for dma-buf exports (in drm-misc-next,
> should land upstream in kernel 5.5).  dma-buf imports are not that
> simple unfortunately.  When using the gbm allocation route dma-buf
> exports are good enough though.
>
> The virtio-gpu resources have both a host buffer and a guest buffer[1]
> Data can be copied using the DRM_IOCTL_VIRTGPU_TRANSFER_{FROM,TO}_HOST
> ioctls.  The dma-buf export will export the guest buffer (which lives
> in guest ram).
> 
> It would make sense for the decoded video to go directly to the host
> buffer though.  First because we want avoid copying the video frames for
> performance reasons, and second because we might not be able to copy
> video frames (drm ...).
> 
> This is where the buffer registry idea comes in.  Attach a (host)
> identifier to (guest) dma-bufs, which then allows host device emulation
> share buffers, i.e. virtio-vdec device emulation could decode to a
> dma-buf it got from virtio-gpu device emulation.

Yes. Also, as I mentioned above, in case of gbm the buffers already can 
originate from GPU.

Best regards,
Dmitry.

> 
> Alternatively we could use virtual ION (or whatever it becomes after
> de-staging) for buffer management, with both virtio-vdec and virtio-gpu
> importing dma-bufs from virtual ION on both guest and host side.
> 
> cheers,
>   Gerd
> 
> [1] support for shared buffers is in progress.



