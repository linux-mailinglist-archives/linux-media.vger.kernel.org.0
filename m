Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96FAEDA5B0
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 08:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392365AbfJQGkw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 02:40:52 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42699 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfJQGkv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 02:40:51 -0400
Received: by mail-ed1-f67.google.com with SMTP id y91so805308ede.9
        for <linux-media@vger.kernel.org>; Wed, 16 Oct 2019 23:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fN5cj8tY6ee1/l/G/O9/Nvmot1sjwBqddYJ9bLt2QzY=;
        b=f+DaEjyD5npzlKLSq+SBLVHK5QyE3ydFu8oGw+R62/Qh2nrrQfhIJI98/Y/6gN1vMZ
         XoTj1OLAFDfBWxc1DrRZq9WvyrPSIl/YHmUznzqUY6QVvXoKhoRHa3etaXK/CvmPgA5B
         o831KPzswVezVGVB+14XNhCD1xv9ZZEXrS3u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fN5cj8tY6ee1/l/G/O9/Nvmot1sjwBqddYJ9bLt2QzY=;
        b=JyxsaEAYrbYWS8Lxz9cxpbI6vYtmrAs0tGD+hzAUJ/Qa8E+xIOS9jYXQu4K1F3qnvE
         Zz+8XHFb6MoekCNRIWN8xmyD+TNJn7/l+zNxfmTveEv5SQVMZ50JnZ5u92FyiKmPqyJE
         FSl4KdVpGkKbqNSIEe+oez+mBzY9SiS7l5DqiJasOVlECv7aJ78Ov3vGEBPKTLg7Fc6c
         nsv8q6aDo3rMqD40Rq6oSb0rXo6fI0Qs40J4XWdwuIty91CzKDsy0sfMlulZUSr6z1h8
         PHh7PHSIeuvtxPJv3YFjeqzmxVtXbxJtGnryS/MzKaHWR2Rb7w+wYCT3rtPWMjMXW4UM
         S3Ag==
X-Gm-Message-State: APjAAAVOwQpvySRV60m4xuzKhFzUcHQOVSt/M9sM53pmYyi5+zsMWN1k
        3SXYM5cyJpc0WTCNXD/fFfDm/r3ixSSA+g==
X-Google-Smtp-Source: APXvYqykNvOmFVlsKA3uR6/vTSKYO/slFKBDfw48gRRTIXNYypZTVMvksr2UuTQnl/dTO67l14SVBw==
X-Received: by 2002:a05:6402:1687:: with SMTP id a7mr2086778edv.222.1571294448220;
        Wed, 16 Oct 2019 23:40:48 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id b12sm60574edq.75.2019.10.16.23.40.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2019 23:40:48 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id b9so934692wrs.0
        for <linux-media@vger.kernel.org>; Wed, 16 Oct 2019 23:40:47 -0700 (PDT)
X-Received: by 2002:adf:fc42:: with SMTP id e2mr1604487wrs.100.1571294447194;
 Wed, 16 Oct 2019 23:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190919093404.182015-1-keiichiw@chromium.org>
 <4037801.MZecyecTDs@os-lin-dmo> <CAAFQd5CfNK1oisDaOWaW+9NTQOLn1EHPrPzvxMPcSxLkBgv3Ww@mail.gmail.com>
 <15135216.K0K410U5qv@os-lin-dmo>
In-Reply-To: <15135216.K0K410U5qv@os-lin-dmo>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 17 Oct 2019 15:40:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DuChujakwmhtQ8v2CSLFqVYjLz9eGHuqrQnJ7apft+3Q@mail.gmail.com>
Message-ID: <CAAFQd5DuChujakwmhtQ8v2CSLFqVYjLz9eGHuqrQnJ7apft+3Q@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
To:     Dmitry Morozov <dmitry.morozov@opensynergy.com>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, stevensd@chromium.org,
        virtio-dev@lists.oasis-open.org,
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

On Fri, Oct 11, 2019 at 5:54 PM Dmitry Morozov
<dmitry.morozov@opensynergy.com> wrote:
>
> Hi Tomasz,
>
> On Mittwoch, 9. Oktober 2019 05:55:45 CEST Tomasz Figa wrote:
> > On Tue, Oct 8, 2019 at 12:09 AM Dmitry Morozov
> >
> > <dmitry.morozov@opensynergy.com> wrote:
> > > Hi Tomasz,
> > >
> > > On Montag, 7. Oktober 2019 16:14:13 CEST Tomasz Figa wrote:
> > > > Hi Dmitry,
> > > >
> > > > On Mon, Oct 7, 2019 at 11:01 PM Dmitry Morozov
> > > >
> > > > <dmitry.morozov@opensynergy.com> wrote:
> > > > > Hello,
> > > > >
> > > > > We at OpenSynergy are also working on an abstract paravirtualized
> > > > > video
> > > > > streaming device that operates input and/or output data buffers and
> > > > > can be
> > > > > used as a generic video decoder/encoder/input/output device.
> > > > >
> > > > > We would be glad to share our thoughts and contribute to the
> > > > > discussion.
> > > > > Please see some comments regarding buffer allocation inline.
> > > > >
> > > > > Best regards,
> > > > > Dmitry.
> > > > >
> > > > > On Samstag, 5. Oktober 2019 08:08:12 CEST Tomasz Figa wrote:
> > > > > > Hi Gerd,
> > > > > >
> > > > > > On Mon, Sep 23, 2019 at 5:56 PM Gerd Hoffmann <kraxel@redhat.com>
> wrote:
> > > > > > >   Hi,
> > > > > > >
> > > > > > > > Our prototype implementation uses [4], which allows the
> > > > > > > > virtio-vdec
> > > > > > > > device to use buffers allocated by virtio-gpu device.
> > > > > > > >
> > > > > > > > [4] https://lkml.org/lkml/2019/9/12/157
> > > > > >
> > > > > > First of all, thanks for taking a look at this RFC and for valuable
> > > > > > feedback. Sorry for the late reply.
> > > > > >
> > > > > > For reference, Keiichi is working with me and David Stevens on
> > > > > > accelerated video support for virtual machines and integration with
> > > > > > other virtual devices, like virtio-gpu for rendering or our
> > > > > > currently-downstream virtio-wayland for display (I believe there is
> > > > > > ongoing work to solve this problem in upstream too).
> > > > > >
> > > > > > > Well.  I think before even discussing the protocol details we need
> > > > > > > a
> > > > > > > reasonable plan for buffer handling.  I think using virtio-gpu
> > > > > > > buffers
> > > > > > > should be an optional optimization and not a requirement.  Also
> > > > > > > the
> > > > > > > motivation for that should be clear (Let the host decoder write
> > > > > > > directly
> > > > > > > to virtio-gpu resources, to display video without copying around
> > > > > > > the
> > > > > > > decoded framebuffers from one device to another).
> > > > > >
> > > > > > Just to make sure we're on the same page, what would the buffers
> > > > > > come
> > > > > > from if we don't use this optimization?
> > > > > >
> > > > > > I can imagine a setup like this;
> > > > > >
> > > > > >  1) host device allocates host memory appropriate for usage with
> > > > > >  host
> > > > > >
> > > > > > video decoder,
> > > > > >
> > > > > >  2) guest driver allocates arbitrary guest pages for storage
> > > > > >
> > > > > > accessible to the guest software,
> > > > > >
> > > > > >  3) guest userspace writes input for the decoder to guest pages,
> > > > > >  4) guest driver passes the list of pages for the input and output
> > > > > >
> > > > > > buffers to the host device
> > > > > >
> > > > > >  5) host device copies data from input guest pages to host buffer
> > > > > >  6) host device runs the decoding
> > > > > >  7) host device copies decoded frame to output guest pages
> > > > > >  8) guest userspace can access decoded frame from those pages; back
> > > > > >  to 3
> > > > > >
> > > > > > Is that something you have in mind?
> > > > >
> > > > > While GPU side allocations can be useful (especially in case of
> > > > > decoder),
> > > > > it could be more practical to stick to driver side allocations. This
> > > > > is
> > > > > also due to the fact that paravirtualized encoders and cameras are not
> > > > > necessarily require a GPU device.
> > > > >
> > > > > Also, the v4l2 framework already features convenient helpers for CMA
> > > > > and
> > > > > SG
> > > > > allocations. The buffers can be used in the same manner as in
> > > > > virtio-gpu:
> > > > > buffers are first attached to an already allocated buffer/resource
> > > > > descriptor and then are made available for processing by the device
> > > > > using
> > > > > a dedicated command from the driver.
> > > >
> > > > First of all, thanks a lot for your input. This is a relatively new
> > > > area of virtualization and we definitely need to collect various
> > > > possible perspectives in the discussion.
> > > >
> > > > From Chrome OS point of view, there are several aspects for which the
> > > > guest side allocation doesn't really work well:
> > > > 1) host-side hardware has a lot of specific low level allocation
> > > > requirements, like alignments, paddings, address space limitations and
> > > > so on, which is not something that can be (easily) taught to the guest
> > > > OS,
> > >
> > > I couldn't agree more. There are some changes by Greg to add support for
> > > querying GPU buffer metadata. Probably those changes could be integrated
> > > with 'a framework for cross-device buffer sharing' (something that Greg
> > > mentioned earlier in the thread and that would totally make sense).
> >
> > Did you mean one of Gerd's proposals?
> >
> > I think we need some clarification there, as it's not clear to me
> > whether the framework is host-side, guest-side or both. The approach I
> > suggested would rely on a host-side framework and guest-side wouldn't
> > need any special handling for sharing, because the memory would behave
> > as on bare metal.
> >
> > However allocation would still need some special API to express high
> > level buffer parameters and delegate the exact allocation requirements
> > to the host. Currently virtio-gpu already has such interface and also
> > has a DRM driver, which were the 2 main reasons for us to use it as
> > the allocator in Chrome OS. (minigbm/cros_gralloc are implemented on
> > top of the Linux DRM API)
> >
> Yes, it was about Gerd's proposals. To be honest, I was considering guest
> allocations only. The operation flow in that case might look in more or less
> the same way: the driver (GPU, Codec/Camera) first allocates a resource
> descriptor on the host side. Than the driver uses the framework from above (so
> support on both sides might be required) to request buffer metadata and does
> allocations on the guest side accordingly. Then it attaches backing storage to
> the host resource.
> > > > 2) allocation system is designed to be centralized, like Android
> > > > gralloc, because there is almost never a case when a buffer is to be
> > > > used only with 1 specific device. 99% of the cases are pipelines like
> > > > decoder -> GPU/display, camera -> encoder + GPU/display, GPU ->
> > > > encoder and so on, which means that allocations need to take into
> > > > account multiple hardware constraints.
> > > > 3) protected content decoding: the memory for decoded video frames
> > > > must not be accessible to the guest at all
> > >
> > > This looks like a valid use case. Would it also be possible for instance
> > > to
> > > allocate mem from a secure ION heap on the guest and then to provide the
> > > sgt to the device? We don't necessarily need to map that sgt for guest
> > > access.
> > Could you elaborate on how that would work? Would the secure ION heap
> > implementation use some protocol to request the allocation from the
> > host?
> >
> > Another aspect is that on Chrome OS we don't support pre-reserved
> > carveout heaps, so we need this memory to be allocated by the host
> > dynamically.
> >
> My take on this (for a decoder) would be to allocate memory for output buffers
> from a secure ION heap, import in the v4l2 driver, and then to provide those
> to the device using virtio. The device side then uses the dmabuf framework to
> make the buffers accessible for the hardware. I'm not sure about that, it's
> just an idea.

Where is the secure ION heap implemented? On the host or on the guest?
If the latter, how is it ensured that it's really secure?

That said, Chrome OS would use a similar model, except that we don't
use ION. We would likely use minigbm backed by virtio-gpu to allocate
appropriate secure buffers for us and then import them to the V4L2
driver.

Best regards,
Tomasz
