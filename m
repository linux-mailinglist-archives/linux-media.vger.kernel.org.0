Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D23DD649826
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 04:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbiLLDOM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Dec 2022 22:14:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbiLLDOL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Dec 2022 22:14:11 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B63E6336
        for <linux-media@vger.kernel.org>; Sun, 11 Dec 2022 19:14:10 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id ud5so24696575ejc.4
        for <linux-media@vger.kernel.org>; Sun, 11 Dec 2022 19:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OR3ECEq4DpTrqBq71Un3uBmBV/lkdaLrgzjqxIQcvV4=;
        b=B9ysF2MPrOB7F4BLyg3nbuS6hwyiY7NhMdcNy0KgxLZVHmr4TVEhTfpjJGVcM92sxt
         9ntTRY0JHLO5UEfpPTOgunFSU4OYpM5abaioHWUSI3+FifNss++EJ90IXoDh/uFSHu6O
         PNMQBVqDLHa45sqbI6mGT3o658/wk4zZ1+ZYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OR3ECEq4DpTrqBq71Un3uBmBV/lkdaLrgzjqxIQcvV4=;
        b=UT00kCMbEPQmLeYBalrlUWzcH/kTdzVfzKEjQ22WkqdmQZODaC0F518uxeB72uVdY3
         D2OGziYss+0e5w07YqLB1rB2nhSD131lY9P3bZ2GQZsl1/rxgQKU9eKol3fEj7nZ2z3L
         pNk7HaYv81PahctP9pmbALPyK3y42QUGD5/xgzKQbWcW9mbEHMbaOmT9lH0n+UB4Eq0+
         jZJzS8gDo5B+0f7d+DzGm0BaTXHDoXWP0rWgxuBllByhxy4UFdMAzTJCpK8vgEEXJPI3
         TMxsvgXCQzEp3hCVtmxm67nDuLjypjcmk5j6I8ceZlXTU8Jk9ynv3PVJ59gZfE8yv15M
         BI4w==
X-Gm-Message-State: ANoB5pnYOKFukin1qQKewTjRqiPL/xP+g2mDS5B/bSGMgthNvZ4kMta2
        6rjpJudb7Kf3IhlUJsPwDYfKwrnjFrxecsj6
X-Google-Smtp-Source: AA0mqf5U35l0x65ogqcxovVRJpg34XVdZjP1+bv5lZf1Rmkhs5unNDBHlf28ol6o1zWbz7TBzxhF5g==
X-Received: by 2002:a17:906:face:b0:7c0:e98d:b27 with SMTP id lu14-20020a170906face00b007c0e98d0b27mr14948808ejb.58.1670814848103;
        Sun, 11 Dec 2022 19:14:08 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id kx2-20020a170907774200b007a1d4944d45sm2771380ejc.142.2022.12.11.19.14.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Dec 2022 19:14:06 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id z92so11078384ede.1
        for <linux-media@vger.kernel.org>; Sun, 11 Dec 2022 19:14:06 -0800 (PST)
X-Received: by 2002:a05:6402:5149:b0:46f:c942:7775 with SMTP id
 n9-20020a056402514900b0046fc9427775mr387533edd.385.1670814846017; Sun, 11 Dec
 2022 19:14:06 -0800 (PST)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com> <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com> <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com> <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com> <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com> <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com> <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com> <CAAFQd5B7JQ4efCoVXEv_OQCmER6jPLPTyJdO7HrC2-Wfo+jMXQ@mail.gmail.com>
 <e2f8b6ff-c843-cc8a-a496-72e25608c223@amd.com> <CAAFQd5CJZ3RLTcS53=s81xAMZ=sG7A=CRUa6gKKuewbFG45Q8w@mail.gmail.com>
 <20221209113202.234b413a@eldfell>
In-Reply-To: <20221209113202.234b413a@eldfell>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 12 Dec 2022 12:13:54 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bbmx=3TLkcTDD+xkXur2RNDRYWAs_UGa6S5+i_7ohnyA@mail.gmail.com>
Message-ID: <CAAFQd5Bbmx=3TLkcTDD+xkXur2RNDRYWAs_UGa6S5+i_7ohnyA@mail.gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Stone <daniel@fooishbar.org>, sumit.semwal@linaro.org,
        daniel@ffwll.ch, robdclark@gmail.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 9, 2022 at 6:32 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Fri, 9 Dec 2022 17:26:06 +0900
> Tomasz Figa <tfiga@chromium.org> wrote:
>
> > On Mon, Dec 5, 2022 at 5:29 PM Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > Am 05.12.22 um 07:41 schrieb Tomasz Figa:
> > > > [SNIP]
> > > >> In other words explicit ownership transfer is not something we wou=
ld
> > > >> want as requirement in the framework, cause otherwise we break ton=
s of
> > > >> use cases which require concurrent access to the underlying buffer=
.
> > > >>
> > > >> When a device driver needs explicit ownership transfer it's perfec=
tly
> > > >> possible to implement this using the dma_fence objects mentioned a=
bove.
> > > >> E.g. drivers can already look at who is accessing a buffer current=
ly and
> > > >> can even grab explicit ownership of it by adding their own dma_fen=
ce
> > > >> objects.
> > > >>
> > > >> The only exception is CPU based access, e.g. when something is wri=
tten
> > > >> with the CPU a cache flush might be necessary and when something i=
s read
> > > >> with the CPU a cache invalidation might be necessary.
> > > >>
> > > > Okay, that's much clearer now, thanks for clarifying this. So we
> > > > should be covered for the cache maintenance needs originating from =
CPU
> > > > accesses already, +/- the broken cases which don't call the begin/e=
nd
> > > > CPU access routines that I mentioned above.
> > > >
> > > > Similarly, for any ownership transfer between different DMA engines=
,
> > > > we should be covered either by the userspace explicitly flushing th=
e
> > > > hardware pipeline or attaching a DMA-buf fence to the buffer.
> > > >
> > > > But then, what's left to be solved? :) (Besides the cases of missin=
g
> > > > begin/end CPU access calls.)
> > >
> > > Well there are multiple problems here:
> > >
> > > 1. A lot of userspace applications/frameworks assume that it can
> > > allocate the buffer anywhere and it just works.
> > >
> > > This isn't true at all, we have tons of cases where device can only
> > > access their special memory for certain use cases.
> > > Just look at scanout for displaying on dGPU, neither AMD nor NVidia
> > > supports system memory here. Similar cases exists for audio/video cod=
ecs
> > > where intermediate memory is only accessible by certain devices becau=
se
> > > of content protection.
> >
> > Ack.
> >
> > Although I think the most common case on mainstream Linux today is
> > properly allocating for device X (e.g. V4L2 video decoder or DRM-based
> > GPU) and hoping that other devices would accept the buffers just fine,
> > which isn't a given on most platforms (although often it's just about
> > pixel format, width/height/stride alignment, tiling, etc. rather than
> > the memory itself). That's why ChromiumOS has minigbm and Android has
> > gralloc that act as the central point of knowledge on buffer
> > allocation.
>
> Hi,
>
> as an anecdote, when I was improving Mutter's cross-DRM-device handling
> (for DisplayLink uses) a few years ago, I implemented several different
> approaches of where to allocate, to try until going for the slowest but
> guaranteed to work case of copying every update into and out of sysram.
>
> It seems there are two different approaches in general for allocation
> and sharing:
>
> 1. Try different things until it works or you run out of options
>
> pro:
> - no need for a single software component to know everything about
>   every device in the system
>
> con:
> - who bothers with fallbacks, if the first try works on my system for
>   my use case I test with? I.e. cost of code in users.
> - trial-and-error can be very laborious (allocate, share with all
>   devices, populate, test)
> - the search space might be huge
>
>
> 2. Have a central component that knows what to do
>
> pro:
> - It might work on the first attempt, so no fallbacks in users.
> - It might be optimal.
>
> con:
> - You need a software component that knows everything about every
>   single combination of hardware in existence, multiplied by use cases.
>
>
> Neither seems good, which brings us back to https://github.com/cubanismo/=
allocator .
>

I need to refresh my memory on how far we went with that and what the
stoppers were, but it really sounds like we need it to make things
really work on a mainstream Linux system.

When I was still participating in the discussions, I remember the idea
was to have an API exposed by various components, like EGL, Vulkan,
etc. to describe the constraints. Maybe to simplify the problem,
instead of having this complex negotiation between different APIs, we
could have a plugin-based library and plugins would be installed
together with the various API implementations (e.g. even proprietary
Nvidia drivers could provide an open source allocation plugin to tell
the central allocator library about its requirements)?

I also recall we were stopped by lack of a generic DMA-buf allocation
functionality exposed to the userspace, but that now exists as DMA-buf
heaps.

>
> > > 2. We don't properly communicate allocation requirements to userspace=
.
> > >
> > > E.g. even if you allocate from DMA-Heaps userspace can currently only
> > > guess if normal, CMA or even device specific memory is needed.
> >
> > DMA-buf heaps actually make it even more difficult for the userspace,
> > because now it needs to pick the right heap. With allocation built
> > into the specific UAPI (like V4L2), it's at least possible to allocate
> > for one specific device without having any knowledge about allocation
> > constraints in the userspace.
> >
> > >
> > > 3. We seem to lack some essential parts of those restrictions in the
> > > documentation.
> > >
> >
> > Ack.
> >
> > > >>>> So if a device driver uses cached system memory on an architectu=
re which
> > > >>>> devices which can't access it the right approach is clearly to r=
eject
> > > >>>> the access.
> > > >>> I'd like to accent the fact that "requires cache maintenance" !=
=3D "can't access".
> > > >> Well that depends. As said above the exporter exports the buffer a=
s it
> > > >> was allocated.
> > > >>
> > > >> If that means the the exporter provides a piece of memory which re=
quires
> > > >> CPU cache snooping to access correctly then the best thing we can =
do is
> > > >> to prevent an importer which can't do this from attaching.
> > > > Could you elaborate more about this case? Does it exist in practice=
?
> > > > Do I assume correctly that it's about sharing a buffer between one =
DMA
> > > > engine that is cache-coherent and another that is non-coherent, whe=
re
> > > > the first one ends up having its accesses always go through some ki=
nd
> > > > of a cache (CPU cache, L2/L3/... cache, etc.)?
> > >
> > > Yes, exactly that. What happens in this particular use case is that o=
ne
> > > device driver wrote to it's internal buffer with the CPU (so some cac=
he
> > > lines where dirty) and then a device which couldn't deal with that tr=
ied
> > > to access it.
> >
> > If so, shouldn't that driver surround its CPU accesses with
> > begin/end_cpu_access() in the first place?
> >
> > The case that I was suggesting was of a hardware block that actually
> > sits behind the CPU cache and thus dirties it on writes, not the
> > driver doing that. (I haven't personally encountered such a system,
> > though.)
> >
> > >
> > > We could say that all device drivers must always look at the coherenc=
y
> > > of the devices which want to access their buffers. But that would
> > > horrible complicate things for maintaining the drivers because then
> > > drivers would need to take into account requirements from other drive=
rs
> > > while allocating their internal buffers.
> >
> > I think it's partially why we have the allocation part of the DMA
> > mapping API, but currently it's only handling requirements of one
> > device. And we don't have any information from the userspace what
> > other devices the buffer would be used with...
> >
> > Actually, do we even have such information in the userspace today?
> > Let's say I do a video call in a web browser on a typical Linux
> > system. I have a V4L2 camera, VAAPI video encoder and X11 display. The
> > V4L2 camera fills in buffers with video frames and both encoder and
> > display consume them. Do we have a central place which would know that
> > a buffer needs to be allocated that works with the producer and all
> > consumers?
>
> I have a vague belief that many, many years ago, in the early days of
> dmabuf development, there was the idea of the sequence:
> - create a dmabuf handle
> - share the handle with all devices that would need access
> - *then* do the allocation with kernel-internal negotiation to fill all
>   devices' needs, if at all possible

Yeah, I had such a recollection as well. I think the difficulty is to
get the userspace to tell the kernel about all the devices before the
buffer needs to be allocated.

>
> Obviously that didn't happen. I think today's dmabuf Wayland protocol
> would support this though.
>
> Anyway, Wayland can tell the app which DRM devices a buffer
> needs to work with as a GPU texture and potentially on same/another
> DRM device as a KMS framebuffer, so theoretically the app could know.
>

Good to know, thanks.

Best regards,
Tomasz
