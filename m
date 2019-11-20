Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 704191039C4
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 13:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbfKTMNg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 07:13:36 -0500
Received: from mail-ed1-f51.google.com ([209.85.208.51]:38098 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728251AbfKTMNg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 07:13:36 -0500
Received: by mail-ed1-f51.google.com with SMTP id s10so20067853edi.5
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 04:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mGcmhF1AeGlRclaIsN+R7xnqH8qeuJyrlBhHK9eKZzE=;
        b=kAUV3zjbKnavIr46v61GGUitObrj1k4aJWZWZL08fkeRNDfTi4HxKZ6wOpMLrmUehd
         LZGpxuQx6PaBWD4GLhQ4UsPy4/HULeEbqBj+rmZN48r5ucBqQ2BVPRO7We5q8uAFhsnv
         6ao+GGaWWzRmK1un6Cw+h4cvU2UpePizNCNMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mGcmhF1AeGlRclaIsN+R7xnqH8qeuJyrlBhHK9eKZzE=;
        b=TRczEEd48DkTwoJwsve/SwRWOlTuVu+cjLJjAg8lRv6kA7UHRS5+b6i7iRrpuZcxMs
         Msi8A/EdXG0lmaB0JMOI+l3KITl2Q7Rzyc4IyuA9yo98ncLig6fKZ4yV+YvU/Euebans
         hy/164LWV62iCfy3hOWzan2AM9CTnGxwZ2FAOfWijPBiTHMVXnDHYgx9t3Esz7VwOyfQ
         6r2sfskgbRTHdudAlad4oksm6M8xtEGw3rW2Eerkq0JEua4vQihUxdomJq5c1WTit2+b
         yJ1M2JQ4Dm3EiTisfD96Fmyy9zbHLmx6LtMn0LqY2p+ayJ4tEZuTlFALt1gWqqPdMArw
         kACA==
X-Gm-Message-State: APjAAAUokpExDgPoqMH51IvNpkJPdpId2VjJ1SjhGoFqMuD6fG4KqIYi
        7HQefAWjtX8useQtiuHUpeYsYgb5+N8GYw==
X-Google-Smtp-Source: APXvYqzUTg2cP11MYCt+zh7EaVLheybvJaC7Orb8wmcNEJqCwbP6IV0/WGlDk/bIYJoyvHeaGjX9og==
X-Received: by 2002:a17:906:f209:: with SMTP id gt9mr4985864ejb.241.1574252013454;
        Wed, 20 Nov 2019 04:13:33 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id r22sm1159577edt.47.2019.11.20.04.13.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 04:13:32 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id b3so27870089wrs.13
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 04:13:32 -0800 (PST)
X-Received: by 2002:a05:6000:1206:: with SMTP id e6mr2899864wrx.113.1574252011420;
 Wed, 20 Nov 2019 04:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <CAD=HUj7EsxrkSubmY6HE4aYJOykVKtmGXjMjeGqnoJw1KZUc5Q@mail.gmail.com>
 <20191106124101.fsfxibdkypo4rswv@sirius.home.kraxel.org> <72712fe048af1489368f7416faa92c45@hostfission.com>
In-Reply-To: <72712fe048af1489368f7416faa92c45@hostfission.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 20 Nov 2019 21:13:18 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cpb=3HRL3NbgxP+S259nkNEuA=u75ew1JQTzvVUU5NeQ@mail.gmail.com>
Message-ID: <CAAFQd5Cpb=3HRL3NbgxP+S259nkNEuA=u75ew1JQTzvVUU5NeQ@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To:     Geoffrey McRae <geoff@hostfission.com>
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        David Stevens <stevensd@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
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

Hi Geoffrey,

On Thu, Nov 7, 2019 at 7:28 AM Geoffrey McRae <geoff@hostfission.com> wrote:
>
>
>
> On 2019-11-06 23:41, Gerd Hoffmann wrote:
> > On Wed, Nov 06, 2019 at 05:36:22PM +0900, David Stevens wrote:
> >> > (1) The virtio device
> >> > =====================
> >> >
> >> > Has a single virtio queue, so the guest can send commands to register
> >> > and unregister buffers.  Buffers are allocated in guest ram.  Each buffer
> >> > has a list of memory ranges for the data. Each buffer also has some
> >>
> >> Allocating from guest ram would work most of the time, but I think
> >> it's insufficient for many use cases. It doesn't really support things
> >> such as contiguous allocations, allocations from carveouts or <4GB,
> >> protected buffers, etc.
> >
> > If there are additional constrains (due to gpu hardware I guess)
> > I think it is better to leave the buffer allocation to virtio-gpu.
>
> The entire point of this for our purposes is due to the fact that we can
> not allocate the buffer, it's either provided by the GPU driver or
> DirectX. If virtio-gpu were to allocate the buffer we might as well
> forget
> all this and continue using the ivshmem device.

I don't understand why virtio-gpu couldn't allocate those buffers.
Allocation doesn't necessarily mean creating new memory. Since the
virtio-gpu device on the host talks to the GPU driver (or DirectX?),
why couldn't it return one of the buffers provided by those if
BIND_SCANOUT is requested?

>
> Our use case is niche, and the state of things may change if vendors
> like
> AMD follow through with their promises and give us SR-IOV on consumer
> GPUs, but even then we would still need their support to achieve the
> same
> results as the same issue would still be present.
>
> Also don't forget that QEMU already has a non virtio generic device
> (IVSHMEM). The only difference is, this device doesn't allow us to
> attain
> zero-copy transfers.
>
> Currently IVSHMEM is used by two projects that I am aware of, Looking
> Glass and SCREAM. While Looking Glass is solving a problem that is out
> of
> scope for QEMU, SCREAM is working around the audio problems in QEMU that
> have been present for years now.
>
> While I don't agree with SCREAM being used this way (we really need a
> virtio-sound device, and/or intel-hda needs to be fixed), it again is an
> example of working around bugs/faults/limitations in QEMU by those of us
> that are unable to fix them ourselves and seem to have low priority to
> the
> QEMU project.
>
> What we are trying to attain is freedom from dual boot Linux/Windows
> systems, not migrate-able enterprise VPS configurations. The Looking
> Glass project has brought attention to several other bugs/problems in
> QEMU, some of which were fixed as a direct result of this project (i8042
> race, AMD NPT).
>
> Unless there is another solution to getting the guest GPUs frame-buffer
> back to the host, a device like this will always be required. Since the
> landscape could change at any moment, this device should not be a LG
> specific device, but rather a generic device to allow for other
> workarounds like LG to be developed in the future should they be
> required.
>
> Is it optimal? no
> Is there a better solution? not that I am aware of
>
> >
> > virtio-gpu can't do that right now, but we have to improve virtio-gpu
> > memory management for vulkan support anyway.
> >
> >> > properties to carry metadata, some fixed (id, size, application), but
> >>
> >> What exactly do you mean by application?
> >
> > Basically some way to group buffers.  A wayland proxy for example would
> > add a "application=wayland-proxy" tag to the buffers it creates in the
> > guest, and the host side part of the proxy could ask qemu (or another
> > vmm) to notify about all buffers with that tag.  So in case multiple
> > applications are using the device in parallel they don't interfere with
> > each other.
> >
> >> > also allow free form (name = value, framebuffers would have
> >> > width/height/stride/format for example).
> >>
> >> Is this approach expected to handle allocating buffers with
> >> hardware-specific constraints such as stride/height alignment or
> >> tiling? Or would there need to be some alternative channel for
> >> determining those values and then calculating the appropriate buffer
> >> size?
> >
> > No parameter negotiation.
> >
> > cheers,
> >   Gerd
