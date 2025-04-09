Return-Path: <linux-media+bounces-29740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9409A82542
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 14:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3F717B1202
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 12:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C76262D1D;
	Wed,  9 Apr 2025 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnoGH7/S"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE9D262D29;
	Wed,  9 Apr 2025 12:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203032; cv=none; b=bMfNNee1a00yDB2rZ0Xxa6Jukyh8xAmKwITFrjjSfMTOfrZu+8uTWrEmnplraOkVxLBxdMeSKrdY88uKMD96MNs8E6HGf6zgDl7eNv8pfX6Y6P6zAAFm78QA0fBMP9iWuVufIzduZadWnB23RETuHDLi/69awZE3VlfsDwYGleU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203032; c=relaxed/simple;
	bh=/jW9B44kyqNV8gjRORD3bHRgIUAe308jn00yw2IwXDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRvWhsgeGwdK9vmIk2KIV7+Ph3ae9W+fLwnFeOfYASV+2zeOkBDtS3cbi+LuVa++4bbChlm2sstsUQ1rM5M8O0n/qGFYQQh20zSQHkaK59PEpJKyZ2uhzB8vGIg2a/wpc0YVkAiQejPoZe5QP4hnL+VhN/YIR6cKv92o/X6CaDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnoGH7/S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F78C4CEE3;
	Wed,  9 Apr 2025 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744203032;
	bh=/jW9B44kyqNV8gjRORD3bHRgIUAe308jn00yw2IwXDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MnoGH7/So9vd/9bpPO03vMLSZNhWbekAYvl+BCmmbTLqGQSlJFJqS1PdM3P8y5Wyy
	 yu16DR8o9W8yUb7HCTLY/WAx7vMerpZygbwYzDGFD6QyfzHi7sAzFYVNni2gxOjuLA
	 nh2oLbhT54uQPNQtanuMpZEbkqyQx2bpm/8foNQEyaAl0ZegA32hKwCncxgV0d/MFj
	 W3UUEG9gYWm2vYrBhZz19jSvTXA/PU6n0qvnRXatLAbwWyDpCCuI0JwJcvD02O3Rzd
	 JCNLumTwG0/c3mNIXIvMwQtuJGhgODmSlZABTMFyzs7WmdY5KjjuHHmubf7rnF26iD
	 VaIWwvtYKojGg==
Date: Wed, 9 Apr 2025 18:20:21 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
Message-ID: <Z_ZtDQQY4eouqBh8@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org>
 <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
 <Z-ucuPzwz4IqVTgb@sumit-X1>
 <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
 <Z_To9V-JOKZ7ChhE@sumit-X1>
 <CAHUa44EGWuVPjoxpG-S66he=6dkvkwzxNewaGKVKXUxrO41ztg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44EGWuVPjoxpG-S66he=6dkvkwzxNewaGKVKXUxrO41ztg@mail.gmail.com>

On Tue, Apr 08, 2025 at 03:28:45PM +0200, Jens Wiklander wrote:
> On Tue, Apr 8, 2025 at 11:14 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Tue, Apr 01, 2025 at 10:33:04AM +0200, Jens Wiklander wrote:
> > > On Tue, Apr 1, 2025 at 9:58 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> > > >
> > > > On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > > > > Hi Sumit,
> > > > >
> > > >
> > > > <snip>
> > > >
> > > > >
> > > > > >
> > > > > > > +
> > > > > > > +#include "tee_private.h"
> > > > > > > +
> > > > > > > +struct tee_dma_heap {
> > > > > > > +     struct dma_heap *heap;
> > > > > > > +     enum tee_dma_heap_id id;
> > > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > > +     struct tee_device *teedev;
> > > > > > > +     /* Protects pool and teedev above */
> > > > > > > +     struct mutex mu;
> > > > > > > +};
> > > > > > > +
> > > > > > > +struct tee_heap_buffer {
> > > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > > +     struct tee_device *teedev;
> > > > > > > +     size_t size;
> > > > > > > +     size_t offs;
> > > > > > > +     struct sg_table table;
> > > > > > > +};
> > > > > > > +
> > > > > > > +struct tee_heap_attachment {
> > > > > > > +     struct sg_table table;
> > > > > > > +     struct device *dev;
> > > > > > > +};
> > > > > > > +
> > > > > > > +struct tee_rstmem_static_pool {
> > > > > > > +     struct tee_rstmem_pool pool;
> > > > > > > +     struct gen_pool *gen_pool;
> > > > > > > +     phys_addr_t pa_base;
> > > > > > > +};
> > > > > > > +
> > > > > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > > > > >
> > > > > > Can this dependency rather be better managed via Kconfig?
> > > > >
> > > > > This was the easiest yet somewhat flexible solution I could find. If
> > > > > you have something better, let's use that instead.
> > > > >
> > > >
> > > > --- a/drivers/tee/optee/Kconfig
> > > > +++ b/drivers/tee/optee/Kconfig
> > > > @@ -5,6 +5,7 @@ config OPTEE
> > > >         depends on HAVE_ARM_SMCCC
> > > >         depends on MMU
> > > >         depends on RPMB || !RPMB
> > > > +       select DMABUF_HEAPS
> > > >         help
> > > >           This implements the OP-TEE Trusted Execution Environment (TEE)
> > > >           driver.
> > >
> > > I wanted to avoid that since there are plenty of use cases where
> > > DMABUF_HEAPS aren't needed.
> >
> > Yeah, but how the users will figure out the dependency to enable DMA
> > heaps with TEE subsystem.
> 
> I hope, without too much difficulty. They are after all looking for a
> way to allocate memory from a DMA heap.
> 
> > So it's better we provide a generic kernel
> > Kconfig which enables all the default features.
> 
> I disagree, it should be possible to configure without DMABUF_HEAPS if desired.

It's hard to see a use-case for that additional compile time option. If
you are worried about kernel size then those can be built as modules. On
the other hand the benifit is that we avoid ifdefery and providing sane
TEE defaults where features can be detected and enabled at runtime
instead.

> 
> >
> > > This seems to do the job:
> > > +config TEE_DMABUF_HEAP
> > > + bool
> > > + depends on TEE = y && DMABUF_HEAPS
> > >
> > > We can only use DMABUF_HEAPS if the TEE subsystem is compiled into the kernel.
> >
> > Ah, I see. So we aren't exporting the DMA heaps APIs for TEE subsystem
> > to use. We should do that such that there isn't a hard dependency to
> > compile them into the kernel.
> 
> I was saving that for a later patch set as a later problem. We may
> save some time by not doing it now.
>

But I think it's not a correct way to just reuse internal APIs from DMA
heaps subsystem without exporting them. It can be seen as a inter
subsystem API contract breach. I hope it won't be an issue with DMA heap
maintainers regarding export of those APIs.

-Sumit

