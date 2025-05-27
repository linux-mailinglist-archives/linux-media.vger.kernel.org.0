Return-Path: <linux-media+bounces-33467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E70CBAC50BB
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 16:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A20113A5D68
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 14:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0812527876E;
	Tue, 27 May 2025 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ydimUZxf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF288253F3D
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355702; cv=none; b=kGMEnjQnfycMk+zmlVUNfeYbBnknSz6JLRfdffYmVB3YpPab16zyU9Ql7no1CZT63rvga1cFU+2KRbydqm19xJZFH6ew/vtjaApqmVUJRb2ATxXosE2szPKkMxrqKakH7NTopOQ4ZSlWeaxptKWVCw2AEPJH7Nnuma+LIVPMt5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355702; c=relaxed/simple;
	bh=CIpAbQ5tZU/9b/y93vCZiejAH1XRyfu6DUA9IGbLifI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0oNjDRJa8lkng8ZNqOE7FmaPu7TUqkmoDnqTggpu4HPn1ssIpLKDe6eA22IDw8Pi4KYhWyCpQKu9iF4fU5lVaL+qpXFackehB0z481Y3I9EcOcS3yPwhUvKerEup50dcB04S71AnWf82Gg/EzMEQBydwVYvo6iK1dRM1pi5K4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ydimUZxf; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72c173211feso885173a34.1
        for <linux-media@vger.kernel.org>; Tue, 27 May 2025 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748355699; x=1748960499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwr1gpmj/Y5xrm528qSwLq/tkBaVoA9zaC9zXNPG4sg=;
        b=ydimUZxfWoHD1FLHL3R1fYD2Wbp1hhSgv2ssLBfGPEijc91q711V3wzlKe0bRC9eJJ
         ylHqf+55yMEYnnrKTvDnsev8taf0duLgQJc3m1Lfw55RCxo4m3ZnFjqil1bgG1r/9bTj
         g028P8njdOHsmkCRhggS6g6Ssb5m30Ebrfe9PpEnnguaZoDzooyhtsW7OgfAwjMBhL2o
         ZHAAYbMDuBrU9c4Arxl+qXquSUnX57RQEz4wHlyiCQ4Gze92/Rrs9rvVPdhpWMRqsRnZ
         6VKxZFW/lElCBFDu61j7zhuvAKEkb3qCRTAikZAUJwAsH2NkrGHsUBMYycwkkxpX3NuT
         Nrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355699; x=1748960499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwr1gpmj/Y5xrm528qSwLq/tkBaVoA9zaC9zXNPG4sg=;
        b=LW6RK63O8JSsuhdLzwL9E08T4M2ZxYP1e3TyJN30qRXVJ+rfbtElQtfPfllvF3SmQ4
         jIGw/cGEDUE4YMUJ+6rqYnBn+7Lm9bTwzccU/wGaFI1Nt1JB0bvo5lVFmPb+OzlpXOeK
         V/46oQUrK4mohuDuBrPTTrtAxhABqKgVuZ5HKBn5aIy6R61X/ey+BRrsTYR0Pk4Z+jCz
         P4I+2gndSpSC+4Smw4uSCgw2n5uZH+5URcVD51CwUZGCjrvPFIwqKxliSBkbvObHpnJU
         Upr5wzelz/Dsy/wUpSTVrfKLiy07D8lUJbG0OeVl4N+OnDDJnd0cIImSNgSD+iOytEjf
         gT2w==
X-Forwarded-Encrypted: i=1; AJvYcCWIZ03+GoDp/AnBpwWWhXx/gWyG47/OG/frdVh04PeAnVu9/aOQSI/g+uyenmXIwTjEwRbsvwk1XLDDoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwQpritfkO5G62jcb7HqrnUO6g3N1bwD0cx+7CPDn1eceApcBO
	UyuXd6EWCk5n+eG8vGXcYRbrn9o0ZVoHqb7eH+peO+xNky0bRtyvvBC34B+qqUu0BLtDUZtuuHP
	MZeZcJTzHhBczHVEa4AB9sV6K9PAXcSSNs1nfX4F1xw==
X-Gm-Gg: ASbGnct+K5B0+Wv6Kcosvl7/9yQ4eiU6ntStGDz+UFPexdY540pjqfoJE6/Kob2fLvt
	awJcF6JPrDTJRXSiO5isJ5PJAP0uYaX2p1kIth5q20nos0FkbAHOyz3NgDW5Sq+j7a3NG6n3VDM
	AYgl71YqNlix3b4l1Nwx+kZGrhnk5TfEZsrA==
X-Google-Smtp-Source: AGHT+IHSldvXeMA/elq5GvdUeZXIE9U2qVSq25l+1UuvJ7nlZ4QemLu8hmu4wkxm84jlPfHrWshtHT5sVpyeKj3x5HU=
X-Received: by 2002:a05:6808:1b85:b0:402:ebf9:b770 with SMTP id
 5614622812f47-40646855c6dmr6484125b6e.28.1748355698671; Tue, 27 May 2025
 07:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-7-jens.wiklander@linaro.org> <aDQWt5Ck1Bo01Z_4@sumit-X1>
 <CAHUa44E4-z7-7DQjyGXYRiZDf6mRBKYZDuxWFGy+3JxtWO1ocg@mail.gmail.com> <aDQ1YR5jbcOFctty@sumit-X1>
In-Reply-To: <aDQ1YR5jbcOFctty@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 27 May 2025 16:21:27 +0200
X-Gm-Features: AX0GCFufndHj8dMt0PaaB1DfiHys-ZIzTuXpul-y9wKknnwSsO_zDsCVnQgE3aw
Message-ID: <CAHUa44HUzfWXEdLeAVimDM0DTFaTbCa4SSTcy8YPhDjWHR352Q@mail.gmail.com>
Subject: Re: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 11:33=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Mon, May 26, 2025 at 11:21:47AM +0200, Jens Wiklander wrote:
> > On Mon, May 26, 2025 at 9:22=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Tue, May 20, 2025 at 05:16:49PM +0200, Jens Wiklander wrote:
> > > > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > > > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM =
to
> > > > identify it as DMA memory. The allocated memory will later be lent =
to
> > > > the TEE to be used as protected memory.
> > > >
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > ---
> > > >  drivers/tee/tee_shm.c    | 74 ++++++++++++++++++++++++++++++++++++=
++--
> > > >  include/linux/tee_core.h |  5 +++
> > > >  2 files changed, 77 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > > index e1ed52ee0a16..92a6a35e1a1e 100644
> > > > --- a/drivers/tee/tee_shm.c
> > > > +++ b/drivers/tee/tee_shm.c
> > > > @@ -5,6 +5,8 @@
> > > >  #include <linux/anon_inodes.h>
> > > >  #include <linux/device.h>
> > > >  #include <linux/dma-buf.h>
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/highmem.h>
> > > >  #include <linux/idr.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/mm.h>
> > > > @@ -13,9 +15,14 @@
> > > >  #include <linux/tee_core.h>
> > > >  #include <linux/uaccess.h>
> > > >  #include <linux/uio.h>
> > > > -#include <linux/highmem.h>
> > > >  #include "tee_private.h"
> > > >
> > > > +struct tee_shm_dma_mem {
> > > > +     struct tee_shm shm;
> > > > +     dma_addr_t dma_addr;
> > > > +     struct page *page;
> > > > +};
> > > > +
> > > >  static void shm_put_kernel_pages(struct page **pages, size_t page_=
count)
> > > >  {
> > > >       size_t n;
> > > > @@ -49,7 +56,14 @@ static void tee_shm_release(struct tee_device *t=
eedev, struct tee_shm *shm)
> > > >       struct tee_shm *parent_shm =3D NULL;
> > > >       void *p =3D shm;
> > > >
> > > > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > > > +             struct tee_shm_dma_mem *dma_mem;
> > > > +
> > > > +             dma_mem =3D container_of(shm, struct tee_shm_dma_mem,=
 shm);
> > > > +             p =3D dma_mem;
> > > > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page=
,
> > > > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> > >
> > > Although the kernel bot already found a randconfig issue, it looks li=
ke
> > > we need to add Kconfig dependencies like HAS_DMA, DMA_CMA etc.
> > >
> > > Also, I was thinking if we should rather add a new TEE subsystem
> > > specific Kconfig option like: TEE_DMABUF_HEAPS which can then be used=
 to
> > > select whatever dependency is needed as well as act as a gating Kconf=
ig
> > > for relevant features.
> >
> > You mean something like this?
> >
> > --- a/drivers/tee/Kconfig
> > +++ b/drivers/tee/Kconfig
> > @@ -13,6 +13,14 @@ menuconfig TEE
> >
> >  if TEE
> >
> > +config TEE_DMABUF_HEAPS
> > +       bool
> > +       depends on HAS_DMA && DMABUF_HEAPS
>
> Yeah this looks fine to me but needs to be tested if DMA_CMA is a
> dependency here too.

Why? It can work without CMA for small allocations.

>
> > +
> > +config TEE_STATIC_PROTMEM_POOL
> > +       bool
> > +       depends on HAS_IOMEM && TEE_DMABUF_HEAPS
>
> The static and dynamic protected memory pools should get auto enabled if
> TEE_DMABUF_HEAPS is enabled since they are pre-requisite to provide the
> protected heaps support. Something like:
>
> +config TEE_STATIC_PROTMEM_POOL
> +       bool
> +       default y if TEE_DMABUF_HEAPS
> +       depends on HAS_IOMEM

Right, I'll update as needed.

Cheers,
Jens

