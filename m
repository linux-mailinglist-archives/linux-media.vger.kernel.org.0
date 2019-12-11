Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71D0711A3A6
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 06:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfLKFIW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 00:08:22 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33479 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfLKFIW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 00:08:22 -0500
Received: by mail-qk1-f193.google.com with SMTP id d71so10649904qkc.0
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2019 21:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=13NpB549RTiez4xpnMDT0FGVuUUTjC2Z6ZWN3TT4Vxw=;
        b=fQhbo4CZTZAKQQi+k4zC2vXK+P/7YfcBdIbGqWp+n3T84MYmrEQN8S5jjxuYUQixxm
         ZsN5Yo/+TueJH+arp4tchOKiSc3RoqDtbaucWLigYyUZ4lmKlWsv8syyzuYdjOfdS/qc
         0oU6lnSXOTVAbhh3i0ED9CDobfxWBaQqzqBww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=13NpB549RTiez4xpnMDT0FGVuUUTjC2Z6ZWN3TT4Vxw=;
        b=ap1td/PibNl4cO2bytzEB+RJaXU/Iab6qnxRvIoyWN6ooMHXG0OaUgRqpKBoZndlOu
         M/x/yxfZ+cAk+0BzjQTYMmiQ0XWza/G0emhF2RanZNc1K8B/cZjLRnDeYcyqoe9627f2
         +HVfwYzBDQlNE9pUrYOizhqwt7ydOukXWcKKfVmKvNB/Bzf5KpR+VY9LqQD3930mnLMm
         MHnMm5VhJ/TX2ejHd72AQYM/uOEDdu1B2XDe91dGMAWSOLvnagCmxtJKwv0ggxcGOP9y
         LYZ1uIQ6QnefAi+E+yF7ijIV3W6d0d8arIwY3JC69X2xG6HIv15novca2H3pFnKyseGM
         ccRw==
X-Gm-Message-State: APjAAAV6sNjs3KCB805pCUKv00wF+/U6gLGNCHx4XMZp/hAkZEtmiSFM
        CcgeSv/bwpqz+jKYBK3LFkLTuDKGWI2ea1KV5i9Y9g==
X-Google-Smtp-Source: APXvYqxgElEEBnxsuMOS8vYNVs3ziV7cgJhHrroNDr9xuYZhJF+2TSpKtR6UBQgzp3nGIhuQ8EWaol/dHsfhtQK+opk=
X-Received: by 2002:a37:a68f:: with SMTP id p137mr1246162qke.328.1576040900973;
 Tue, 10 Dec 2019 21:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <CAD=HUj7EsxrkSubmY6HE4aYJOykVKtmGXjMjeGqnoJw1KZUc5Q@mail.gmail.com>
 <20191106124101.fsfxibdkypo4rswv@sirius.home.kraxel.org> <72712fe048af1489368f7416faa92c45@hostfission.com>
 <CAAFQd5Cpb=3HRL3NbgxP+S259nkNEuA=u75ew1JQTzvVUU5NeQ@mail.gmail.com>
 <d65bec5074eda5f389668e28922c1609@hostfission.com> <CAAFQd5AWqYaNWfYQ2hepjg7OD8y8ehHn0guusAR8JYefc+BNaw@mail.gmail.com>
 <CAEUnVG77y2DrV5kLTHDy1xio+yzMGv9j=M0c4388vH_LUaiXLg@mail.gmail.com>
In-Reply-To: <CAEUnVG77y2DrV5kLTHDy1xio+yzMGv9j=M0c4388vH_LUaiXLg@mail.gmail.com>
From:   David Stevens <stevensd@chromium.org>
Date:   Wed, 11 Dec 2019 14:08:10 +0900
Message-ID: <CAD=HUj40Jb2cy8EP=24coO-CPUvq6ib+01bvXHn1G9GD8KuenA@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To:     Dylan Reid <dgreid@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Geoffrey McRae <geoff@hostfission.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are three issues being discussed here that aren't being clearly
delineated: sharing guest allocated memory with the host, sharing host
allocated memory with the guest, and sharing buffers between devices.

Right now, guest allocated memory can be shared with the host through
the virtqueues or by passing a scatterlist in the virtio payload (i.e.
what virtio-gpu does). Host memory can be shared with the guest using
the new shared memory regions. As far as I can tell, these mechanisms
should be sufficient for sharing memory between the guest and host and
vice versa.

Where things are not sufficient is when we talk about sharing buffers
between devices. For starters, a 'buffer' as we're discussing here is
not something that is currently defined by the virtio spec. The
original proposal defines a buffer as a generic object that is guest
ram+id+metadata, and is created by a special buffer allocation device.
With this approach, buffers can be cleanly shared between devices.

An alternative that Tomasz suggested would be to avoid defining a
generic buffer object, and instead state that the scatterlist which
virtio-gpu currently uses is the 'correct' way for virtio device
protocols to define buffers. With this approach, sharing buffers
between devices potentially requires the host to map different
scatterlists back to a consistent representation of a buffer.

None of the proposals directly address the use case of sharing host
allocated buffers between devices, but I think they can be extended to
support it. Host buffers can be identified by the following tuple:
(transport type enum, transport specific device address, shmid,
offset). I think this is sufficient even for host-allocated buffers
that aren't visible to the guest (e.g. protected memory, vram), since
they can still be given address space in some shared memory region,
even if those addresses are actually inaccessible to the guest. At
this point, the host buffer identifier can simply be passed in place
of the guest ram scatterlist with either proposed buffer sharing
mechanism.

I think the main question here is whether or not the complexity of
generic buffers and a buffer sharing device is worth it compared to
the more implicit definition of buffers. Personally, I lean towards
the implicit definition of buffers, since a buffer sharing device
brings a lot of complexity and there aren't any clear clients of the
buffer metadata feature.

Cheers,
David

On Thu, Dec 5, 2019 at 7:22 AM Dylan Reid <dgreid@chromium.org> wrote:
>
> On Thu, Nov 21, 2019 at 4:59 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > On Thu, Nov 21, 2019 at 6:41 AM Geoffrey McRae <geoff@hostfission.com> wrote:
> > >
> > >
> > >
> > > On 2019-11-20 23:13, Tomasz Figa wrote:
> > > > Hi Geoffrey,
> > > >
> > > > On Thu, Nov 7, 2019 at 7:28 AM Geoffrey McRae <geoff@hostfission.com>
> > > > wrote:
> > > >>
> > > >>
> > > >>
> > > >> On 2019-11-06 23:41, Gerd Hoffmann wrote:
> > > >> > On Wed, Nov 06, 2019 at 05:36:22PM +0900, David Stevens wrote:
> > > >> >> > (1) The virtio device
> > > >> >> > =====================
> > > >> >> >
> > > >> >> > Has a single virtio queue, so the guest can send commands to register
> > > >> >> > and unregister buffers.  Buffers are allocated in guest ram.  Each buffer
> > > >> >> > has a list of memory ranges for the data. Each buffer also has some
> > > >> >>
> > > >> >> Allocating from guest ram would work most of the time, but I think
> > > >> >> it's insufficient for many use cases. It doesn't really support things
> > > >> >> such as contiguous allocations, allocations from carveouts or <4GB,
> > > >> >> protected buffers, etc.
> > > >> >
> > > >> > If there are additional constrains (due to gpu hardware I guess)
> > > >> > I think it is better to leave the buffer allocation to virtio-gpu.
> > > >>
> > > >> The entire point of this for our purposes is due to the fact that we
> > > >> can
> > > >> not allocate the buffer, it's either provided by the GPU driver or
> > > >> DirectX. If virtio-gpu were to allocate the buffer we might as well
> > > >> forget
> > > >> all this and continue using the ivshmem device.
> > > >
> > > > I don't understand why virtio-gpu couldn't allocate those buffers.
> > > > Allocation doesn't necessarily mean creating new memory. Since the
> > > > virtio-gpu device on the host talks to the GPU driver (or DirectX?),
> > > > why couldn't it return one of the buffers provided by those if
> > > > BIND_SCANOUT is requested?
> > > >
> > >
> > > Because in our application we are a user-mode application in windows
> > > that is provided with buffers that were allocated by the video stack in
> > > windows. We are not using a virtual GPU but a physical GPU via vfio
> > > passthrough and as such we are limited in what we can do. Unless I have
> > > completely missed what virtio-gpu does, from what I understand it's
> > > attempting to be a virtual GPU in its own right, which is not at all
> > > suitable for our requirements.
> >
> > Not necessarily. virtio-gpu in its basic shape is an interface for
> > allocating frame buffers and sending them to the host to display.
> >
> > It sounds to me like a PRIME-based setup similar to how integrated +
> > discrete GPUs are handled on regular systems could work for you. The
> > virtio-gpu device would be used like the integrated GPU that basically
> > just drives the virtual screen. The guest component that controls the
> > display of the guest (typically some sort of a compositor) would
> > allocate the frame buffers using virtio-gpu and then import those to
> > the vfio GPU when using it for compositing the parts of the screen.
> > The parts of the screen themselves would be rendered beforehand by
> > applications into local buffers managed fully by the vfio GPU, so
> > there wouldn't be any need to involve virtio-gpu there. Only the
> > compositor would have to be aware of it.
> >
> > Of course if your guest is not Linux, I have no idea if that can be
> > handled in any reasonable way. I know those integrated + discrete GPU
> > setups do work on Windows, but things are obviously 100% proprietary,
> > so I don't know if one could make them work with virtio-gpu as the
> > integrated GPU.
> >
> > >
> > > This discussion seems to have moved away completely from the original
> > > simple feature we need, which is to share a random block of guest
> > > allocated ram with the host. While it would be nice if it's contiguous
> > > ram, it's not an issue if it's not, and with udmabuf (now I understand
> > > it) it can be made to appear contigous if it is so desired anyway.
> > >
> > > vhost-user could be used for this if it is fixed to allow dynamic
> > > remapping, all the other bells and whistles that are virtio-gpu are
> > > useless to us.
> > >
> >
> > As far as I followed the thread, my impression is that we don't want
> > to have an ad-hoc interface just for sending memory to the host. The
> > thread was started to look for a way to create identifiers for guest
> > memory, which proper virtio devices could use to refer to the memory
> > within requests sent to the host.
> >
> > That said, I'm not really sure if there is any benefit of making it
> > anything other than just the specific virtio protocol accepting
> > scatterlist of guest pages directly.
> >
> > Putting the ability to obtain the shared memory itself, how do you
> > trigger a copy from the guest frame buffer to the shared memory?
>
> Adding Zach for more background on virtio-wl particular use cases.
