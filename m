Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 493DFD7087
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 09:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbfJOHyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 03:54:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59492 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727332AbfJOHyY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 03:54:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 17158BCFE2;
        Tue, 15 Oct 2019 07:54:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com [10.36.116.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2716C19C7F;
        Tue, 15 Oct 2019 07:54:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 47EDA11AAA; Tue, 15 Oct 2019 09:54:22 +0200 (CEST)
Date:   Tue, 15 Oct 2019 09:54:22 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Dmitry Morozov <dmitry.morozov@opensynergy.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, stevensd@chromium.org,
        virtio-dev@lists.oasis-open.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
Message-ID: <20191015075422.yeknnqlsy3nun44r@sirius.home.kraxel.org>
References: <20190919093404.182015-1-keiichiw@chromium.org>
 <15135216.K0K410U5qv@os-lin-dmo>
 <20191014123443.ey3yfdnr43kplqaq@sirius.home.kraxel.org>
 <12599990.jpbsygJuY9@os-lin-dmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12599990.jpbsygJuY9@os-lin-dmo>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 15 Oct 2019 07:54:24 +0000 (UTC)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 14, 2019 at 03:05:03PM +0200, Dmitry Morozov wrote:
> 
> On Montag, 14. Oktober 2019 14:34:43 CEST Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > My take on this (for a decoder) would be to allocate memory for output
> > > buffers from a secure ION heap, import in the v4l2 driver, and then to
> > > provide those to the device using virtio. The device side then uses the
> > > dmabuf framework to make the buffers accessible for the hardware. I'm not
> > > sure about that, it's just an idea.
> > 
> > Virtualization aside, how does the complete video decoding workflow
> > work?  I assume along the lines of ...
> > 
> >   (1) allocate buffer for decoded video frames (from ion).
> >   (2) export those buffers as dma-buf.
> >   (3) import dma-buf to video decoder.
> >   (4) import dma-buf to gpu.
> > 
> > ... to establish buffers shared between video decoder and gpu?
> > 
> > Then feed the video stream into the decoder, which decodes into the ion
> > buffers?  Ask the gpu to scanout the ion buffers to show the video?
> > 
> > cheers,
> >   Gerd
> 
> Yes, exactly.
> 
> [decoder]
> 1) Input buffers are allocated using  VIDIOC_*BUFS.

Ok.

> 2) Output buffers are allocated in a guest specific manner (ION, gbm).

Who decides whenever ION or gbm is used?  The phrase "secure ION heap"
used above sounds like using ION is required for decoding drm-protected
content.

So, do we have to worry about ION here?  Or can we just use gbm?

[ Note: don't know much about ion, other than that it is used by
        android, is in staging right now and patches to move it
        out of staging are floating around @ dri-devel ]

> 3) Both input and output buffers are exported as dma-bufs.
> 4) The backing storage of both inputs and outputs is made available to the 
> device.
> 5) Decoder hardware writes to output buffers directly.

As expected.

> 6) Back to the guest side, the output dma-bufs are used by (virtio-) gpu.

Ok.  So, virtio-gpu has support for dma-buf exports (in drm-misc-next,
should land upstream in kernel 5.5).  dma-buf imports are not that
simple unfortunately.  When using the gbm allocation route dma-buf
exports are good enough though.

The virtio-gpu resources have both a host buffer and a guest buffer[1]
Data can be copied using the DRM_IOCTL_VIRTGPU_TRANSFER_{FROM,TO}_HOST
ioctls.  The dma-buf export will export the guest buffer (which lives
in guest ram).

It would make sense for the decoded video to go directly to the host
buffer though.  First because we want avoid copying the video frames for
performance reasons, and second because we might not be able to copy
video frames (drm ...).

This is where the buffer registry idea comes in.  Attach a (host)
identifier to (guest) dma-bufs, which then allows host device emulation
share buffers, i.e. virtio-vdec device emulation could decode to a
dma-buf it got from virtio-gpu device emulation.

Alternatively we could use virtual ION (or whatever it becomes after
de-staging) for buffer management, with both virtio-vdec and virtio-gpu
importing dma-bufs from virtual ION on both guest and host side.

cheers,
  Gerd

[1] support for shared buffers is in progress.
