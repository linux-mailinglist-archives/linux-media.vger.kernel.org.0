Return-Path: <linux-media+bounces-29864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34551A839E8
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60D7C8C0ADF
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843E52054E3;
	Thu, 10 Apr 2025 06:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdTw5jaV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F00204C3C
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267793; cv=none; b=arDDhiH3TSS9YdYhTX8uMG7xgC30JINFz5n0gDuFREntQDjgArxJ/+LWFFMbQXTXcV2AljYy/0wRLQx8M93lqnJAICcTkfRslgsw/lPkXCtJjEWXYbdqtrumRcZEgESAz+Z+YwRkmVVZlH2Kr65J4A7sSXPe9q/Pv4ZrodFxvEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267793; c=relaxed/simple;
	bh=qKsDk9EZ2dacQJ71qnkeU1d5QGUNiU0xLXDxuP55mBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qyrtslNFuo0ITvbe83c/SoQ7ciTdX+ZQ6bDN3OP/GQhqtdDaS6cKE0pb6Z05MtGdjefDgoOu8dYNX8bYKIMUjbWgs4sibHqPZ/m/UC/XXCgqY2I9l34LDpMYZBraZYf7Qsf284+6ACppYjvRDev3ehWEXnNNsdZSRdAGJkgNDZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YdTw5jaV; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so938474fac.0
        for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 23:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744267791; x=1744872591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpF7wEE+1cJWx9zAtKf9QlygCmnNGJM9CNsxuBDedRk=;
        b=YdTw5jaVbVvFDS+IIkiX5jXkIPFo9OSWKYMWyeu6FGDMlZO3wR/C3EkZmLkGpI4sAF
         cMaONnpmZiqZzp+v6Ck+pFBivMkJX3+gr5/x+0oLtyl6F2nKAmU+QKdPUqNWo8WQOwm+
         FBB0C8hMTOMdQz1lKqlnz0sethzBRjW1TBKI65ydbdTEtH9/le2M0iHBX2Ft6OrnsKHo
         L+Rc2C4OkaVaYiAa8b6qMNPvV2CLT/iuGjBv5u+Mb2ea2REKDLFFdmh8kWAd5p0Nov7f
         ZP3/Tk/6WiNifD16eKQM3qfkHJtL00CFl1OdWaViDMKzlx7rI4uumbPHFCoxwAx8mA4D
         U6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267791; x=1744872591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpF7wEE+1cJWx9zAtKf9QlygCmnNGJM9CNsxuBDedRk=;
        b=lixsbknZlWQqjYOdmIu75ZH43zgZvvxAqcQpE7uF8uXiaBHw/cHDpSEaWU9brZ+e9b
         cC9a9yCchZlB1AWCiJdPTdx3LipSCCGO21s+2jp5sZTRQzVLs9ebx946hErBu61fZ3rl
         tShJQMre7n4Ctxn1aS/Jt52KV2FNWH/bolxCk5Ojll1eWJFNPbSsW+xCdAa2NmJUmXZZ
         A58I+ga4TRXFsoYS2+gSfw1JKaLj3MPbhzucOBgD1zWGE4QVK+lCxR86SurSFYNbmXwu
         SEdOKjAJg61tfeuH2QiU7cJz6VuDWGns+cQn+RyRkRojwOR/F8KVNQGcmH2c96mPB1a6
         faMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5U1oW21uIjasMFsgCI6cxP/EI+Qvl28FnxQKwycyz+tqgWm7J0+vrFzylUaCaUjiemfDzjY3q+vZfMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjJJTelpBpMCV6xqKJr7162lOCnMCP9jS3T3pomjm6CQ0Eo+jJ
	bri/Q+7SzKAsaLhAe+irHfhRYOVgwvGqPDKrrn77SgQgqEsguzwQ1JAOHwZqNc79rWeC6ETwk7W
	MTK1p9jZ0vG8gOM7vUr6MKaBqB0MpFhNd645Jmg==
X-Gm-Gg: ASbGnctEhNakTLiQqLazka12zcb6veG/DKTJSafEa37KXnN8kM3wUSSmJ8kPWZ79VyI
	sblHpmQLplZsEkTkCCOgzf8O93nwW5A2WAKvG3vk710ZkktOEe2XU0kPryCzSf3n/pA08X6Li76
	pWYxx2RQcxC/2NWeQb86TK6gc=
X-Google-Smtp-Source: AGHT+IHI4FgOoH6eOg0ztL2Lx7hiXdosqXiiUD+d8J9IOEiCubchzZoLqMtVD0Mmvo3sJz+QQ7r84CVnm0uFw++DJDA=
X-Received: by 2002:a05:6871:4009:b0:2c4:1b1c:42c3 with SMTP id
 586e51a60fabf-2d0b3a2a298mr929589fac.9.1744267791101; Wed, 09 Apr 2025
 23:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org> <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
 <Z-ucuPzwz4IqVTgb@sumit-X1> <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
 <Z_To9V-JOKZ7ChhE@sumit-X1> <CAHUa44EGWuVPjoxpG-S66he=6dkvkwzxNewaGKVKXUxrO41ztg@mail.gmail.com>
 <Z_ZtDQQY4eouqBh8@sumit-X1>
In-Reply-To: <Z_ZtDQQY4eouqBh8@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 10 Apr 2025 08:49:39 +0200
X-Gm-Features: ATxdqUEvXiuy3pdj5yJylN_i-qNjZAR_HHoPy2N2W57yI_8PinKhMCxfS6kRFGI
Message-ID: <CAHUa44GFzG8dr1Kbapbjy77c-wJb4gQVVom24eLLueOK=gCq=A@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
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
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 2:50=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Tue, Apr 08, 2025 at 03:28:45PM +0200, Jens Wiklander wrote:
> > On Tue, Apr 8, 2025 at 11:14=E2=80=AFAM Sumit Garg <sumit.garg@kernel.o=
rg> wrote:
> > >
> > > On Tue, Apr 01, 2025 at 10:33:04AM +0200, Jens Wiklander wrote:
> > > > On Tue, Apr 1, 2025 at 9:58=E2=80=AFAM Sumit Garg <sumit.garg@kerne=
l.org> wrote:
> > > > >
> > > > > On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > > > > > Hi Sumit,
> > > > > >
> > > > >
> > > > > <snip>
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > +
> > > > > > > > +#include "tee_private.h"
> > > > > > > > +
> > > > > > > > +struct tee_dma_heap {
> > > > > > > > +     struct dma_heap *heap;
> > > > > > > > +     enum tee_dma_heap_id id;
> > > > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > > > +     struct tee_device *teedev;
> > > > > > > > +     /* Protects pool and teedev above */
> > > > > > > > +     struct mutex mu;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +struct tee_heap_buffer {
> > > > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > > > +     struct tee_device *teedev;
> > > > > > > > +     size_t size;
> > > > > > > > +     size_t offs;
> > > > > > > > +     struct sg_table table;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +struct tee_heap_attachment {
> > > > > > > > +     struct sg_table table;
> > > > > > > > +     struct device *dev;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +struct tee_rstmem_static_pool {
> > > > > > > > +     struct tee_rstmem_pool pool;
> > > > > > > > +     struct gen_pool *gen_pool;
> > > > > > > > +     phys_addr_t pa_base;
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEA=
PS)
> > > > > > >
> > > > > > > Can this dependency rather be better managed via Kconfig?
> > > > > >
> > > > > > This was the easiest yet somewhat flexible solution I could fin=
d. If
> > > > > > you have something better, let's use that instead.
> > > > > >
> > > > >
> > > > > --- a/drivers/tee/optee/Kconfig
> > > > > +++ b/drivers/tee/optee/Kconfig
> > > > > @@ -5,6 +5,7 @@ config OPTEE
> > > > >         depends on HAVE_ARM_SMCCC
> > > > >         depends on MMU
> > > > >         depends on RPMB || !RPMB
> > > > > +       select DMABUF_HEAPS
> > > > >         help
> > > > >           This implements the OP-TEE Trusted Execution Environmen=
t (TEE)
> > > > >           driver.
> > > >
> > > > I wanted to avoid that since there are plenty of use cases where
> > > > DMABUF_HEAPS aren't needed.
> > >
> > > Yeah, but how the users will figure out the dependency to enable DMA
> > > heaps with TEE subsystem.
> >
> > I hope, without too much difficulty. They are after all looking for a
> > way to allocate memory from a DMA heap.
> >
> > > So it's better we provide a generic kernel
> > > Kconfig which enables all the default features.
> >
> > I disagree, it should be possible to configure without DMABUF_HEAPS if =
desired.
>
> It's hard to see a use-case for that additional compile time option. If
> you are worried about kernel size then those can be built as modules. On
> the other hand the benifit is that we avoid ifdefery and providing sane
> TEE defaults where features can be detected and enabled at runtime
> instead.

My primary concern isn't kernel size, even if it shouldn't be
irrelevant. It doesn't seem right to enable features that are not
asked for casually. In this case, it's not unreasonable or unexpected
that DMABUF_HEAPS must be explicitly enabled in the config if a heap
interface is needed. It's the same as before this patch set.

>
> >
> > >
> > > > This seems to do the job:
> > > > +config TEE_DMABUF_HEAP
> > > > + bool
> > > > + depends on TEE =3D y && DMABUF_HEAPS
> > > >
> > > > We can only use DMABUF_HEAPS if the TEE subsystem is compiled into =
the kernel.
> > >
> > > Ah, I see. So we aren't exporting the DMA heaps APIs for TEE subsyste=
m
> > > to use. We should do that such that there isn't a hard dependency to
> > > compile them into the kernel.
> >
> > I was saving that for a later patch set as a later problem. We may
> > save some time by not doing it now.
> >
>
> But I think it's not a correct way to just reuse internal APIs from DMA
> heaps subsystem without exporting them. It can be seen as a inter
> subsystem API contract breach. I hope it won't be an issue with DMA heap
> maintainers regarding export of those APIs.

Fair enough. I'll add a patch in the next patch set for that. I guess
the same goes for CMA.

Cheers,
Jens

