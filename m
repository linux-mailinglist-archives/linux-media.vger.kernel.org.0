Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937243F69A5
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 21:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbhHXTQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 15:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234048AbhHXTQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 15:16:50 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11219C0613C1;
        Tue, 24 Aug 2021 12:16:06 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u14so21631692ejf.13;
        Tue, 24 Aug 2021 12:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nHaCO738eRY3VKzEPuj4xZFKwDtJiNbUNiFDzNRpKZo=;
        b=t8gf/7kUasiYGAIsMopT1DNWVh0UN1WeILXUmcb00QRCv4VYb7O99j1XNuqUs5PBB4
         kqnEUmFesIW4WOu2Des5gq1Bx5D6cjXkFwBQbi5yqzcfglKnOGDntcE5FNBZr1p8D5Fm
         gZd2G3nIztk1j+RuIuZVDqeOBLKNb60iq0U97P45JDjg4UeM+J4AnL5rZqrMWYa6ubvs
         nVCVkhg2sxQjZTnQ2EVL1n4Vp2XiwCTfuaxcYNVObU1r9qpDGD3q7zgQS7AWqZslWk/o
         O1rHLo14ryyLILgPSnW/9C64wVGtiNmdeg73Iug5PIj5pHU93cT8OMNEnGMlmlLEQcXQ
         yI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nHaCO738eRY3VKzEPuj4xZFKwDtJiNbUNiFDzNRpKZo=;
        b=pHQ7a8WZYjFvSxSOkUIZ6xDyOJ1Upq6rDbm+NCEsGAbPsKM3IsvcyuRxHaobFIKx0E
         xrNZgLATMFAgGmB0QnxbrPQPz/4rNk6KSJ5O6sb/ey4GdnJSsnqsCOaE0Z2rxxbE7dTx
         wXzT0u2nffcubvcZ2Oel7MXiFbsPqDWmjcivjppeSXeBLRdnL5ZQBm8Cr+CFE0eKAdpt
         E8Ebnj0/d6qV3xYqTBPRcoonP2BlO5XSkOQZ6qce6j+Nj13TsDwOnlZr+zLGlaS5wSR2
         NMTAChsbzfMThyv73F9HYsTvzQ9fhpf0+5t6NdQ3UaxkAmHaucP8+uygqz5YJvoMqw1R
         XJ7Q==
X-Gm-Message-State: AOAM532bb/dp6b82chS//qB7ZXAedB6/lHVxMd2ItnRrbaNQKO2rH2CP
        GvZ7HVRgu82MzpCLj3hOIStttZJuNfRUJtDQJl8=
X-Google-Smtp-Source: ABdhPJyCNShBNLWvuFOzEmpzfFUdPdq/6RvkIsKtioRscMIq8wMIfZWLko3uoEdih/EWNcLLnGVJytmbs2oosRQInrw=
X-Received: by 2002:a17:907:35d0:: with SMTP id ap16mr41990765ejc.456.1629832564485;
 Tue, 24 Aug 2021 12:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210819230602.GU543798@ziepe.ca> <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
 <20210820123316.GV543798@ziepe.ca> <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
 <20210820143248.GX543798@ziepe.ca> <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com> <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com> <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca> <1d1bd2d0-f467-4808-632b-1cca1174cfd9@nvidia.com>
In-Reply-To: <1d1bd2d0-f467-4808-632b-1cca1174cfd9@nvidia.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Wed, 25 Aug 2021 05:15:52 +1000
Message-ID: <CAPM=9txd71fisvZ1Es5Fv2mwR2vWfHJarya7oeKOm2aq6tH0HQ@mail.gmail.com>
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Gal Pressman <galpress@amazon.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Doug Ledford <dledford@redhat.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Oded Gabbay <ogabbay@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Yossi Leybovich <sleybo@amazon.com>,
        Alexander Matushevsky <matua@amazon.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 25 Aug 2021 at 03:36, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 8/24/21 10:32 AM, Jason Gunthorpe wrote:
> ...
> >>> And yes at least for the amdgpu driver we migrate the memory to host
> >>> memory as soon as it is pinned and I would expect that other GPU drivers
> >>> do something similar.
> >>
> >> Well...for many topologies, migrating to host memory will result in a
> >> dramatically slower p2p setup. For that reason, some GPU drivers may
> >> want to allow pinning of video memory in some situations.
> >>
> >> Ideally, you've got modern ODP devices and you don't even need to pin.
> >> But if not, and you still hope to do high performance p2p between a GPU
> >> and a non-ODP Infiniband device, then you would need to leave the pinned
> >> memory in vidmem.
> >>
> >> So I think we don't want to rule out that behavior, right? Or is the
> >> thinking more like, "you're lucky that this old non-ODP setup works at
> >> all, and we'll make it work by routing through host/cpu memory, but it
> >> will be slow"?
> >
> > I think it depends on the user, if the user creates memory which is
> > permanently located on the GPU then it should be pinnable in this way
> > without force migration. But if the memory is inherently migratable
> > then it just cannot be pinned in the GPU at all as we can't
> > indefinately block migration from happening eg if the CPU touches it
> > later or something.
> >
>
> OK. I just want to avoid creating any API-level assumptions that dma_buf_pin()
> necessarily implies or requires migrating to host memory.

I'm not sure we should be allowing dma_buf_pin at all on
non-migratable memory, what's to stop someone just pinning all the
VRAM and making the GPU unuseable?

I understand not considering more than a single user in these
situations is enterprise thinking, but I do worry about pinning is
always fine type of thinking when things are shared or multi-user.

My impression from this is we've designed hardware that didn't
consider the problem, and now to let us use that hardware in horrible
ways we should just allow it to pin all the things.

Dave.
