Return-Path: <linux-media+bounces-18539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB21985380
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 09:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43B0F2823D7
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 07:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB524155359;
	Wed, 25 Sep 2024 07:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K3x08vSL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36827154423
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248512; cv=none; b=tYhF82QqU90RDkzMOrMMxQ4mP4+wIIp6gur0Q3TXH9LH0lHlczvzcy20D8eDBqREn4l0R+GkZvdTywu0n/gN+efsO3xbJs/eLqIoRJgyG5ChCoqryEfCrF3PYBYHkvilwLUDz/Q3//06rjkMR7XfRZ/gt1NKosiBSaiQfW1MwkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248512; c=relaxed/simple;
	bh=YvH5CO/g/ZZSGTW6Ve+4KcjKGOqOYedFuS4vYOlaBCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtMa+n+ZOY7WLdO8dtkRU32wQzrdflMUB/mBFgjiFyPJhDFRWrmq7koR2o1WDOvuK62yVjDcDMFKb8D9ezhqyt97D6vJv2fn7B39qSTvUL8gU//6IpUlExY1GV27mBgYIyMJ7mZlU0n/FT2weniObus8cuZsFIyMNuEA1FEw0Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K3x08vSL; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a86e9db75b9so1001981766b.1
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 00:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727248508; x=1727853308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TDaNdhjF6czZwZ8GYJQ+xlqUWHjP+ROLSrQsWDOJZts=;
        b=K3x08vSLc2O2J/FoeZVxTfvniV8zz3At4298ho6IWsjEWLXrlrUbESVsXgrQ0npS3n
         kYNLLltJlJi7Dm3cYlfA8pGMAgMEnJ06L+jqf3IDJD8qhUrj0cpa3D8PXxHjVz3TEVKI
         xtBZwCZjrwWncn5stzABQEh/nEMYW+Uwmu0yi3YtjmLiOB42SskJY6fkMf0WDn+FgeZ8
         +0uBgT2Gu5PiqV92zWSonqKiL0s8qW1mlAdwineqvjPzsRj2kTV530R5gibC6JMAErjJ
         tJtjmcg33LngHrCNlbKQNsZCn0z+KeEJ/Yadomo5Mld1kZJxRL1Ka+vpUoh1xJKNQdH0
         f63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727248508; x=1727853308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDaNdhjF6czZwZ8GYJQ+xlqUWHjP+ROLSrQsWDOJZts=;
        b=py0voXNfIsAC/fYYGckOqasMZVnvePlRcFtpgrEQ1uRkIGYXO8n58q8H2PwAcFjOCN
         PK7mm0OWwSDis7iPEzgy/pFoBPG7X4EbVEpzImmsVW4uDHzpnACKqxiJ1sOnVy5H9TYa
         winbP2VGsdl6MXU7D3OAq6sc4ore6KbOpiCqtow4NOQHy1twq1mWx0mdTpcmr3g60G2Q
         +izgAB+YKxl0EQZ/lSeURWQx0U3rYhf44CK37oohvs7jAMiMZNIpTFpV6aEX0eb9Ss08
         UAr1xe4wV5OR36bZXJ3H5YcDJLD114NKoXCSP1gjenx+P24mAV+xlVcX5mQwxP1OXU7V
         u7dA==
X-Forwarded-Encrypted: i=1; AJvYcCWwX+8IfK0sq+mjxx5rq+y7Yv8ELl3OxnxdRs4TTqjmhFpyeYErbYXh2l7It/02jre8AI4R0KxOszgkhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/3pEEzShcQdGI+p+def8BD5HkdZ8jxRxUxUcDnvhWNSAFW5r
	cb9AVX8sFKns+z7l089gsSa5CZLHv6NlUzo5CLKT8qhRORw/lvNfh80VcCSfZdU=
X-Google-Smtp-Source: AGHT+IHv93X+9j84xZuTxFkaqtse2mqrU5kPecB2WQv7iIqPArSVbHN4jb/WWw/ItxeQzBtjVNzB3Q==
X-Received: by 2002:a17:907:e656:b0:a86:9644:2a60 with SMTP id a640c23a62f3a-a93a03200d0mr161368666b.6.1727248508395;
        Wed, 25 Sep 2024 00:15:08 -0700 (PDT)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9393138bd5sm174570466b.205.2024.09.25.00.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:15:06 -0700 (PDT)
Date: Wed, 25 Sep 2024 09:15:04 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
Message-ID: <20240925071504.GA3519798@rayden>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>

On Mon, Sep 23, 2024 at 09:33:29AM +0300, Dmitry Baryshkov wrote:
> Hi,
> 
> On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
> > Hi,
> > 
> > This patch set is based on top of Yong Wu's restricted heap patch set [1].
> > It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
> > 
> > The Linaro restricted heap uses genalloc in the kernel to manage the heap
> > carvout. This is a difference from the Mediatek restricted heap which
> > relies on the secure world to manage the carveout.
> > 
> > I've tried to adress the comments on [2], but [1] introduces changes so I'm
> > afraid I've had to skip some comments.
> 
> I know I have raised the same question during LPC (in connection to
> Qualcomm's dma-heap implementation). Is there any reason why we are
> using generic heaps instead of allocating the dma-bufs on the device
> side?
> 
> In your case you already have TEE device, you can use it to allocate and
> export dma-bufs, which then get imported by the V4L and DRM drivers.
> 
> I have a feeling (I might be completely wrong here) that by using
> generic dma-buf heaps we can easily end up in a situation when the
> userspace depends heavily on the actual platform being used (to map the
> platform to heap names). I think we should instead depend on the
> existing devices (e.g. if there is a TEE device, use an IOCTL to
> allocate secured DMA BUF from it, otherwise check for QTEE device,
> otherwise check for some other vendor device).

That makes sense, it's similar to what we do with TEE_IOC_SHM_ALLOC
where we allocate from a carveout reserverd for shared memory with the
secure world. It was even based on dma-buf until commit dfd0743f1d9e
("tee: handle lookup of shm with reference count 0").

We should use a new TEE_IOC_*_ALLOC for these new dma-bufs to avoid
confusion and to have more freedom when designing the interface.

> 
> The mental experiment to check if the API is correct is really simple:
> Can you use exactly the same rootfs on several devices without
> any additional tuning (e.g. your QEMU, HiKey, a Mediatek board, Qualcomm
> laptop, etc)?

No, I don't think so.

> 
> > 
> > This can be tested on QEMU with the following steps:
> > repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
> >         -b prototype/sdp-v1
> > repo sync -j8
> > cd build
> > make toolchains -j4
> > make all -j$(nproc)
> > make run-only
> > # login and at the prompt:
> > xtest --sdp-basic
> > 
> > https://optee.readthedocs.io/en/latest/building/prerequisites.html
> > list dependencies needed to build the above.
> > 
> > The tests are pretty basic, mostly checking that a Trusted Application in
> > the secure world can access and manipulate the memory.
> 
> - Can we test that the system doesn't crash badly if user provides
>   non-secured memory to the users which expect a secure buffer?
> 
> - At the same time corresponding entities shouldn't decode data to the
>   buffers accessible to the rest of the sytem.

I'll a few tests along that.

Thanks,
Jens

> 
> > 
> > Cheers,
> > Jens
> > 
> > [1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
> > [2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/
> > 
> > Changes since Olivier's post [2]:
> > * Based on Yong Wu's post [1] where much of dma-buf handling is done in
> >   the generic restricted heap
> > * Simplifications and cleanup
> > * New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
> >   support"
> > * Replaced the word "secure" with "restricted" where applicable
> > 
> > Etienne Carriere (1):
> >   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> > 
> > Jens Wiklander (2):
> >   dma-buf: heaps: restricted_heap: add no_map attribute
> >   dma-buf: heaps: add Linaro restricted dmabuf heap support
> > 
> > Olivier Masse (1):
> >   dt-bindings: reserved-memory: add linaro,restricted-heap
> > 
> >  .../linaro,restricted-heap.yaml               |  56 ++++++
> >  drivers/dma-buf/heaps/Kconfig                 |  10 ++
> >  drivers/dma-buf/heaps/Makefile                |   1 +
> >  drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
> >  drivers/dma-buf/heaps/restricted_heap.h       |   2 +
> >  .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
> >  drivers/tee/tee_core.c                        |  38 ++++
> >  drivers/tee/tee_shm.c                         | 104 ++++++++++-
> >  include/linux/tee_drv.h                       |  11 ++
> >  include/uapi/linux/tee.h                      |  29 +++
> >  10 files changed, 426 insertions(+), 7 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
> >  create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

