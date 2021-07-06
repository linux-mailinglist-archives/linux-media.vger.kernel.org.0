Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FB13BD8E0
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 16:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbhGFOug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 10:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232132AbhGFOue (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 10:50:34 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59705C0617AB
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 07:47:55 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id f12-20020a056830204cb029048bcf4c6bd9so9708416otp.8
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oa36JT6ZXXdeNbOW7MRMPItJC85KRkSUT3t0lipsRGE=;
        b=I3PSWk0qdtLFBmphAZxkzdBLbBanHnSZ0lDy0Hh/Ww45NThwfPWgOKeOhk0qySlDno
         N76byVhIjKXABiEeqkETac6DodkM4w9tLHdTxMThwhYfWv577ISzp1xMGs578F8PpfZ1
         q9Lvgwe7Uqz9k9WBl4dQSoOJQ0Uhiw8dS3XsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oa36JT6ZXXdeNbOW7MRMPItJC85KRkSUT3t0lipsRGE=;
        b=A3o6wdhxwiuVJrjAA9nDalW2qw4/TCTH8HPJ839oUuVQONvfu/NGVxkT+zxod2HxAN
         Iv0MGmvZijyn5KV7xKpQRUaiZruAOEDT+OwFMXnmeMY+ZLlgHOHdZq6ejJ2gpfS1zrBy
         ytW+8hbdQgwjZwlKicHaeMwkHqVMv8OiNrr75f/dkCEyTTksHDZTEw3/EzwNfjteFNpt
         5Ii51oToVg8cK7YIV4lgYxp2smJNqtlqGKcVpP+VHZZrAU9hZciEGBErZpdBma/3TQBY
         AakmYc5q39OLu2xDZi55UYQzzE3Tj0ksw/kGHRzbEx79+JR21LaegUnFWBP2ciCQ4Lka
         vzTw==
X-Gm-Message-State: AOAM532XKsAOSUWn3dX9VKJNK13I3Wn0AIzLv59Ktfs03Cj5KSPYoQU2
        j/Qjo0SkKZ/X6FAITlLLKimYO4MBtx3fl9gsDN5pvVEi6aQ=
X-Google-Smtp-Source: ABdhPJwzXN/NwcfTnIiFRue1K5cnhWHoor7mzX3yGgIo+ac7YSL8ymVa3l8VD8fedtiFTq2s+GtWnKhr2VvW4LOuy6E=
X-Received: by 2002:a05:6830:2366:: with SMTP id r6mr15034001oth.188.1625580576688;
 Tue, 06 Jul 2021 07:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210705130314.11519-1-ogabbay@kernel.org> <YOQXBWpo3whVjOyh@phenom.ffwll.local>
 <CAFCwf10_rTYL2Fy6tCRVAUCf4-6_TtcWCv5gEEkGnQ0KxqMUBg@mail.gmail.com>
 <CAKMK7uEAJZUHNLreBB839BZOfnTGNU4rCx-0k55+67Nbxtdx3A@mail.gmail.com>
 <CAKMK7uHpKFVm55O_NB=WYCsv0iUt92ZUn6eCzifH=unbhe3J8g@mail.gmail.com>
 <CAKMK7uFGr=ugyKj0H3ctbh28Jnr25vAgXPBaDBMmfErCxYVo3w@mail.gmail.com> <20210706134430.GL4604@ziepe.ca>
In-Reply-To: <20210706134430.GL4604@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 6 Jul 2021 16:09:25 +0200
Message-ID: <CAKMK7uFEZjp2_WBhtkVxSNQ-1WcBSr3NDotY0fjz0iLRw8Barw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Oded Gabbay <oded.gabbay@gmail.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Doug Ledford <dledford@redhat.com>,
        Dave Airlie <airlied@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Christoph Hellwig <hch@lst.de>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 6, 2021 at 3:44 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Jul 06, 2021 at 02:07:16PM +0200, Daniel Vetter wrote:
>
> > On the "rdma-core" idea, afaik rdma NIC do not have fully programmable
> > cores in their hw, for which you'd need some kind of compiler to make
> > use of the hardware and the interfaces the kernel provides? So not
> > really compareable, but also my understanding is that rdma-core does
> > actually allow you to reasonable use&drive all the hw features and
> > kernel interfaces fully.
>
> The whole HPC stack has speciality compilers of course. OpenMP, PGAS,
> etc. These compilers map onto library primitives that eventually boil
> down into rdma-core calls. Even the HW devices have various
> programmability that are being targetted with compilers now. People
> are making NIC devices with ARM cores/etc - P4 is emerging for some
> packet processing tasks.

Well it depends which compilers we're talking about here, and what
kind of features. Higher level compilers that break down some fancy
language like OpenMP into what that actually should do on a given
hardware like gpu, or rdma-connected cluster, or whatever, we really
don't care about. You don't need that to drive the hardware. Usually
that stuff works by breaking some of the code down into cpu compiler
IR (most of this is built on top of LLVM IR nowadays), interspersed
with library calls to the runtime.

Now the thing I care about here is if things doen't get compiled down
to cpu code, but to some other IR (SPIR-V is starting to win, but very
often ist still a hacked up version of LLVM IR), which then in a
hw-specific backend gets compiled down to instructions that run on the
hw. I had no idea that rdma NICs can do that, but it sounds like? I
guess maybe some openmpi operations could be done directly on the rdma
chip, but I'm not sure why you'd want a backend compiler here.

Anyway, for anything that works like a gpu accelerator, like 3d accel,
or parallel compute accel (aka gpgpu) or spatial compute accel (aka
NN/AI) or maybe even fpga accel most of the magic to use the hardware
is in this backend compiler, which translates from an IR into whatever
your accelerator consumes. That's the part we really care about for
modern accelerators because without that defacto the hardware is
useless. Generally these chips have full-blown, if special purpose
ISA, with register files, spilling, branches, loops and other control
flow (sometimes only execution masks on simpler hw).

> rdma-core can drive all the kernel interfaces with at least an ioctl
> wrapper, and it has a test suite that tries to cover this. It does not
> exercise the full HW capability, programmability, etc of every single
> device.
>
> I actually don't entirely know what everyone has built on top of
> rdma-core, or how I'd try to map it the DRI ideas you are trying to
> explain.
>
> Should we ban all Intel RDMA drivers because they are shipping
> proprietary Intel HPC compilers and proprietary Intel MPI which drives
> their RDMA HW? Or is that OK because there are open analogs for some
> of that stuff? And yes, the open versions are inferior in various
> metrics.
>
> Pragmatically what I want to see is enough RDMA common/open user space
> to understand the uAPI and thus more about how the kernel driver
> works. Forcing everyone into rdma-core has already prevented a number
> of uAPI mistakes in drivers that would have been bad - so at least
> this level really is valuable.
>
> > So we actually want less on dri-devel, because for compute/accel chips
> > we're currently happy with a vendor userspace. It just needs to be
> > functional and complete, and open in its entirety.
>
> In a sense yes: DRI doesn't insist on a single code base to act as the
> kernel interface, but that is actually the thing that has brought the
> most value to RDMA, IMHO.

So in practice we're not that different in DRI wrt userspace - if
there is an established cross-vendor project in the given area, we do
expect the userspace side to be merged there. And nowadays most of the
feature work is done that way, it's just that we don't have a single
project like rdma-core for this. We do still allow per-driver submit
interfaces because hw is just not standardized enough there, the
standards are at a higher level. Which is why it just doesn't make
sense to talk about a kernel driver as something that's useful
stand-alone at all.

> We've certainly had some interesting successes because of this. The
> first submission for AWS's EFA driver proposed to skip the rdma-core
> step, which was rejected. However since EFA has been in that ecosystem
> it has benefited greatly, I think.
>
> However, in another sense no: RDMA hasn't been blocking, say Intel,
> just because they have built proprietary stuff on top of our open
> stack.

Oh we allow this too. We only block the initial submission if the
proprietary stuff is the only thing out there.

> Honestly, I think GPU is approaching this backwards. Wayland should
> have been designed to prevent proprietary userspace stacks.

That's not possible without some serious cans of worms though. Wayland
is a protocol, and you can't forbid people from implementing it.
Otherwise all the compatible open implementations of closed protocols
wouldn't be possible either.

Now the implementation is a different thing, and there a few
compositors have succumbed to market pressure and enabled the nvidia
stack, as a mostly separate piece from supporting the open stack. And
that's largely because nvidia managed to completely kill the open
source r/e effort through firmware licensing and crypto-key based
verified loading, so unless you install the proprietary stack you
actually can't make use of the hardware at all - well display works
without the firmware, but 3d/compute just doesn't. So you just can't
use nvidia hw without accepting their proprietary driver licenses and
all that entails for the latest hardware.

So I'm not clear what you're suggesting here we should do different.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
