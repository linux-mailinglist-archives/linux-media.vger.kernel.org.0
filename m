Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B0C3B169D
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 11:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhFWJRr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 05:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhFWJRq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 05:17:46 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CAEC061760;
        Wed, 23 Jun 2021 02:15:28 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id q10so2586520oij.5;
        Wed, 23 Jun 2021 02:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=quouQNx98OeM2JWkzBIUm3+vF8x4xm+zxWV/raoo3aQ=;
        b=Fmu2kU2I9U/tO77+2EI8nnRLVsm1KZns9poRXkmFydncMdpd17HRS7jmpP6eSA7e9H
         BPhqm28O6C2qLsEb6KXrV189fkUkVFRIdy10NA3Zi3UnajXBIYCYWRgiAEw+pfjA+jIR
         Gd+28Lw0bfeU/z2KQNu9rTF9lSNYnw+7oQjwznJh9yhwQHK7meHufl25CdQfhM7NkSrV
         x1wKS5LkejWdl4ftXDvaM7DGGXNZ15lP1fphbHDmeeUCuMuhLeLzYsDj20mIjg9ujadC
         +W1Of5Blo0JBXkv/cliU89T7B/mKdUdRC+M3luCI7hIv9SUyco0iL10gFoVPIYistGGv
         pC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=quouQNx98OeM2JWkzBIUm3+vF8x4xm+zxWV/raoo3aQ=;
        b=LZwPIIajNlKq7A4HUTDu59V1+/QzizxdpUv0KqKynRA4TgyjzhWZwvSRyhd/f7XxX7
         A0bWtqXAwhSAw8wMwoIRA1ySICDhzRP0IdpDoJLMQu8nwvOMdP8cBz03Cw6RpgtNMD71
         ZdxEBn0T+iqem8Yw4UnCIbE4XUGBbrWj6kmGxJKwcEFb9+Ab+lTvVvv7/NdsxRx1h/tv
         PKxzzJUAifm3vH9C8+KqzNTNOfF5nh0RPaJ5q+v6VVmiW2YUkJBf4Km3nql3bgMIjbTe
         9zeabWOG/7pVCvYHaX+5dh+gwWUGDqH/oIM5qYAO612Gnf9GrbhY4VEpKS0P6cA3GC3U
         A2Qg==
X-Gm-Message-State: AOAM530qQQyuHFc+H4qtCua1fATn5lXn4ifkj18th6AFRf3YmkCYmmfl
        pEJ0BcdNoYBf8STHw2/Kee5mUk4zFotlR/f0LKE=
X-Google-Smtp-Source: ABdhPJxlh6DW0WITP5HCozbR6iBRVIh8Cgnl5UHJUnk65FQPQ/9TS+t8xXDV2Gmdxn5HNi4XWlqIrc32l0TnSWanVgI=
X-Received: by 2002:aca:3bc3:: with SMTP id i186mr2375999oia.102.1624439727422;
 Wed, 23 Jun 2021 02:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf11jOnewkbLuxUESswCJpyo7C0ovZj80UrnwUOZkPv2JYQ@mail.gmail.com>
 <20210621232912.GK1096940@ziepe.ca> <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca> <d497b0a2-897e-adff-295c-cf0f4ff93cb4@amd.com>
 <20210622152343.GO1096940@ziepe.ca> <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
 <20210622154027.GS1096940@ziepe.ca> <09df4a03-d99c-3949-05b2-8b49c71a109e@amd.com>
 <20210622160538.GT1096940@ziepe.ca> <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
In-Reply-To: <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
From:   Oded Gabbay <oded.gabbay@gmail.com>
Date:   Wed, 23 Jun 2021 12:14:59 +0300
Message-ID: <CAFCwf12JXQ6XnQEPM6wa2ut8dV8VBLTJE_popZT2GTVVra5CLQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Oded Gabbay <ogabbay@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Doug Ledford <dledford@redhat.com>,
        Tomer Tayar <ttayar@habana.ai>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 23, 2021 at 11:57 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 22.06.21 um 18:05 schrieb Jason Gunthorpe:
> > On Tue, Jun 22, 2021 at 05:48:10PM +0200, Christian K=C3=B6nig wrote:
> >> Am 22.06.21 um 17:40 schrieb Jason Gunthorpe:
> >>> On Tue, Jun 22, 2021 at 05:29:01PM +0200, Christian K=C3=B6nig wrote:
> >>>> [SNIP]
> >>>> No absolutely not. NVidia GPUs work exactly the same way.
> >>>>
> >>>> And you have tons of similar cases in embedded and SoC systems where
> >>>> intermediate memory between devices isn't directly addressable with =
the CPU.
> >>> None of that is PCI P2P.
> >>>
> >>> It is all some specialty direct transfer.
> >>>
> >>> You can't reasonably call dma_map_resource() on non CPU mapped memory
> >>> for instance, what address would you pass?
> >>>
> >>> Do not confuse "I am doing transfers between two HW blocks" with PCI
> >>> Peer to Peer DMA transfers - the latter is a very narrow subcase.
> >>>
> >>>> No, just using the dma_map_resource() interface.
> >>> Ik, but yes that does "work". Logan's series is better.
> >> No it isn't. It makes devices depend on allocating struct pages for th=
eir
> >> BARs which is not necessary nor desired.
> > Which dramatically reduces the cost of establishing DMA mappings, a
> > loop of dma_map_resource() is very expensive.
>
> Yeah, but that is perfectly ok. Our BAR allocations are either in chunks
> of at least 2MiB or only a single 4KiB page.
>
> Oded might run into more performance problems, but those DMA-buf
> mappings are usually set up only once.
>
> >> How do you prevent direct I/O on those pages for example?
> > GUP fails.
>
> At least that is calming.
>
> >> Allocating a struct pages has their use case, for example for exposing=
 VRAM
> >> as memory for HMM. But that is something very specific and should not =
limit
> >> PCIe P2P DMA in general.
> > Sure, but that is an ideal we are far from obtaining, and nobody wants
> > to work on it prefering to do hacky hacky like this.
> >
> > If you believe in this then remove the scatter list from dmabuf, add a
> > new set of dma_map* APIs to work on physical addresses and all the
> > other stuff needed.
>
> Yeah, that's what I totally agree on. And I actually hoped that the new
> P2P work for PCIe would go into that direction, but that didn't
> materialized.
>
> But allocating struct pages for PCIe BARs which are essentially
> registers and not memory is much more hacky than the dma_resource_map()
> approach.
>
> To re-iterate why I think that having struct pages for those BARs is a
> bad idea: Our doorbells on AMD GPUs are write and read pointers for ring
> buffers.
>
> When you write to the BAR you essentially tell the firmware that you
> have either filled the ring buffer or read a bunch of it. This in turn
> then triggers an interrupt in the hardware/firmware which was eventually
> asleep.
>
> By using PCIe P2P we want to avoid the round trip to the CPU when one
> device has filled the ring buffer and another device must be woken up to
> process it.
>
> Think of it as MSI-X in reverse and allocating struct pages for those
> BARs just to work around the shortcomings of the DMA API makes no sense
> at all to me.
We would also like to do that *in the future*.
In Gaudi it will never be supported (due to security limitations) but
I definitely see it happening in future ASICs.

Oded

>
>
> We also do have the VRAM BAR, and for HMM we do allocate struct pages
> for the address range exposed there. But this is a different use case.
>
> Regards,
> Christian.
>
> >
> > Otherwise, we have what we have and drivers don't get to opt out. This
> > is why the stuff in AMDGPU was NAK'd.
> >
> > Jason
>
