Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D2A611A6C
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 20:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiJ1Sre (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 14:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbiJ1Srd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 14:47:33 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41285244C40
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 11:47:32 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id x26so4046241qki.0
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lIeCqF9MC1plkMaa8w3RYpUvhtv+mOsM3E0K5wP3Sw=;
        b=QB/yJvyFQct+2OJbnZIA/tDX8ajG1aNWWKiALtUocG5OcgRfSj5xC/jy/KZ58XFRBS
         BuoopZQTNYIml8YK2WaVS/dNg8od+ainUFxbQl6SXGED3Nc9ESxGIPeys4mFokbGBqoA
         X1k2vWg4GAnIGwJ2Gt7YFwUtKfcY3CDZkF209ennLJQCEkW96pisjBSBPF6GYq+Gdefv
         KKz8QAwRWbcDupJKAReMBeisQrYQpSJOO28tUcYJh1Cj0o3ra+lMi4nYhuGOIh1lk23I
         j0EWoC9xafzFiHR4YkSr35aAzSooNnEeyGZo5mMEie8ckTJuvwP1LFbcr9ublWnwKDa/
         pr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lIeCqF9MC1plkMaa8w3RYpUvhtv+mOsM3E0K5wP3Sw=;
        b=LZG3++cklIu1zibm/isFVRpWC+O/prm/X5lJPvmeBuW74VYhGAgiqtEolWundUkYWe
         dNLB0rG59UozaymtCPFk9EI0vvBql6qtCsia9oc/2TlLNef5vxodMVbpUeAUet4p+gBS
         AWNAe8wZQxoIiGqZCVEsJVQEbMXE4W1FVIU6tq4az7Yr0qOdzR6MlO6MWpNFw6iQRFWM
         CqtZbV1XFDQLn4uqWDqbF7dFPX+GNth/WbP1l5cFc2NiYkS3exHluKZY+oogLNJCMozM
         jzBnIf0lKvLF7KJBBqkdHB/YiH9mBZymn7quEChXAgGyosYTdb5UIhIEiyNo4IW6OVZz
         3zIQ==
X-Gm-Message-State: ACrzQf2+6D2Inj/4lB3Wxj3UVrfvZYcf3Wfkst45s6KPFNiDsl4iobMB
        lD+E2mlcWDE6iU3Mklo0fhoKRG0sTplxg0ZerkVUFw==
X-Google-Smtp-Source: AMsMyM56bLx8Jr1GOVzvxC6aqvYl/bq/OQWL5kJiTLnKCGyRYb9J4lp/fpUvOmNQDxGiQRuDo8iXQIlZVHQScew44u4=
X-Received: by 2002:a05:620a:2496:b0:6ee:76ce:4b3e with SMTP id
 i22-20020a05620a249600b006ee76ce4b3emr561552qkn.370.1666982851307; Fri, 28
 Oct 2022 11:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com> <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com> <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
In-Reply-To: <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Fri, 28 Oct 2022 19:47:19 +0100
Message-ID: <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Lucas Stach <l.stach@pengutronix.de>, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian,

On Fri, 28 Oct 2022 at 18:50, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 28.10.22 um 17:46 schrieb Nicolas Dufresne:
> > Though, its not generically possible to reverse these roles. If you wan=
t to do
> > so, you endup having to do like Android (gralloc) and ChromeOS (minigbm=
),
> > because you will have to allocate DRM buffers that knows about importer=
 specific
> > requirements. See link [1] for what it looks like for RK3399, with Moti=
on Vector
> > size calculation copied from the kernel driver into a userspace lib (ar=
guably
> > that was available from V4L2 sizeimage, but this is technically difficu=
lt to
> > communicate within the software layers). If you could let the decoder e=
xport
> > (with proper cache management) the non-generic code would not be needed=
.
>
> Yeah, but I can also reverse the argument:
>
> Getting the parameters for V4L right so that we can share the image is
> tricky, but getting the parameters so that the stuff is actually
> directly displayable by GPUs is even trickier.
>
> Essentially you need to look at both sides and interference to get to a
> common ground, e.g. alignment, pitch, width/height, padding, etc.....
>
> Deciding from which side to allocate from is just one step in this
> process. For example most dGPUs can't display directly from system
> memory altogether, but it is possible to allocate the DMA-buf through
> the GPU driver and then write into device memory with P2P PCI transfers.
>
> So as far as I can see switching importer and exporter roles and even
> having performant extra fallbacks should be a standard feature of userspa=
ce.
>
> > Another case where reversing the role is difficult is for case where yo=
u need to
> > multiplex the streams (let's use a camera to illustrate) and share that=
 with
> > multiple processes. In these uses case, the DRM importers are volatile,=
 which
> > one do you abuse to do allocation from ? In multimedia server like Pipe=
Wire, you
> > are not really aware if the camera will be used by DRM or not, and if s=
omething
> > "special" is needed in term of role inversion. It is relatively easy to=
 deal
> > with matching modifiers, but using downstream (display/gpu) as an expor=
ter is
> > always difficult (and require some level of abuse and guessing).
>
> Oh, very good point! Yeah we do have use cases for this where an input
> buffer is both displayed as well as encoded.

This is the main issue, yeah.

For a standard media player, they would try to allocate through V4L2
and decode through that into locally-allocated buffers. All they know
is that there's a Wayland server at the other end of a socket
somewhere which will want to import the FD. The server does give you
some hints along the way: it will tell you that importing into a
particular GPU target device is necessary as the ultimate fallback,
and importing into a particular KMS device is preferable as the
optimal path to hit an overlay.

So let's say that the V4L2 client does what you're proposing: it
allocates a buffer chain, schedules a decode into that buffer, and
passes it along to the server to import. The server fails to import
the buffer into the GPU, and tells the client this. The client then
... well, it doesn't know that it needs to allocate within the GPU
instead, but it knows that doing so might be one thing which would
make the request succeed.

But the client is just a video player. It doesn't understand how to
allocate BOs for Panfrost or AMD or etnaviv. So without a universal
allocator (again ...), 'just allocate on the GPU' isn't a useful
response to the client.

I fully understand your point about APIs like Vulkan not sensibly
allowing bracketing, and that's fine. On the other hand, a lot of
extant usecases (camera/codec -> GPU/display, GPU -> codec, etc) on
Arm just cannot fulfill complete coherency. On a lot of these
platforms, despite what you might think about the CPU/GPU
capabilities, the bottleneck is _always_ memory bandwidth, so
mandating extra copies is an absolute non-starter, and would instantly
cripple billions of devices. Lucas has been pretty gentle, but to be
more clear, this is not an option and won't be for at least the next
decade.

So we obviously need a third way at this point, because 'all devices
must always be coherent' vs. 'cache must be an unknown' can't work.
How about this as a suggestion: we have some unused flags in the PRIME
ioctls. Can we add a flag for 'import must be coherent'?

That flag wouldn't be set for the existing ecosystem
Lucas/Nicolas/myself are talking about, where we have explicit
handover points and users are fully able to perform cache maintenance.
For newer APIs where it's not possible to properly express that
bracketing, they would always set that flag (unless we add an API
carve-out where the client promises to do whatever is required to
maintain that).

Would that be viable?

Cheers,
Daniel
