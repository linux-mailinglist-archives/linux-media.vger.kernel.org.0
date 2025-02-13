Return-Path: <linux-media+bounces-26109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F36A339CC
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 09:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1C6F1615F0
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 08:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94F520B7E8;
	Thu, 13 Feb 2025 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yK486yp5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF2013B29B
	for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 08:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434776; cv=none; b=ROEQEIVAuKP2HMb7i77WaXHvr54Dw8lMnsK7AkYrs3qlIF65yCWN2M1iKPAkqo0TVKW8R/iWNnU9ZL3CmPUMKJ4u1bOzGxFRHJwnalgnihZO/rB4Ptdd7Z7M4d1JvjkOtBcmSE+NmPebyAZejD/GIC9jWjnXSUySLEvB+nCfrIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434776; c=relaxed/simple;
	bh=Az9dQ23bPGQCJsqk2rNARA3D3DTwQa8JOi+/AGn2MB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFVAZ0HjCfmURAWbQhmveBDoJl5N/9/ysbQwEX7XrWGfgMnb3Z5/8zqX/c0QV0nXj44j/Ryg7QEXqQ9bv1ERB5ZNaPuLQPRJo4lNEOA48iEG4YQtiGTbU8PsX+wimR/b3g/fEmIP0OQm/pjQih2P75RsMp5Z6cJERcMOIDdEnrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yK486yp5; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2bc66e26179so9376fac.2
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 00:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739434773; x=1740039573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az9dQ23bPGQCJsqk2rNARA3D3DTwQa8JOi+/AGn2MB0=;
        b=yK486yp5l0hCbW4dxtpwxlWQtwbvWPch7dC6goztJ2044xsF3IH90UbN1R+QypYP8+
         lbI3B5NKlOo11tFCvOvjYtJJPOzsMMNkvayL+ZIfleTwzvdLT+OSDMUXB/5gEzuqEx/E
         O7LwWyxc5E/rn2EIbW/nqwCxDDytJh7MS+4T2bjzezgnddhFkAmYyot8prF1+27gtWy8
         83M2J2N45DMNedPwiUaCjipTD6P6dlpTQ6w2WYJqVD4lXkqelcKkCt3XNJg+IpY4PYJF
         dXPQj72vsQLQJEiZ/KM4qEDvjutLPgjiP8TAm9ThcTXwNTuUaTq+Zc7iFIkFx/+31W3u
         2TBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434773; x=1740039573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Az9dQ23bPGQCJsqk2rNARA3D3DTwQa8JOi+/AGn2MB0=;
        b=r6KV9RKJyLb0vJyI+V57u/mDWc/zUzUGZtMNk7Yl75imQ9giOUT580l/HTSBdmR01x
         J7uIRgytKGsrg/WUk+WClhwYWMboo1T73WbwmKjY393m2rvIAxyMEUjVEhZdrhXCJxw2
         nxBySswFOexiprjDOdL6DkqXYRF28CJdyPN7FQo3SD57gXcj+PU2p0YbYKmoz+1CJf+A
         43ThZsKPMe2RYYYY+GmAJ4KsLYbNlJGhTLn6QfL2EW5vWtewTZ03gsm17MDL1HXcnHWO
         Yew9h3GSR8SF08GiJ/gaDLrweu2xX/OXWmLGhOli64ba8dxBb+hZ08KiwD8JRJzHywsg
         yhfw==
X-Forwarded-Encrypted: i=1; AJvYcCWCe8fnSTsgSQ3JXRcDoJTfIn1KsSvemZGnkDg5SOLLr+8X9iAQXkuY92SzpCrqzhq3sAw3jsoL71wduA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNvuAd0q8EAA0YxEFIQ0Quhuqwi61jGEo81jl5HkQbkopAdiAe
	Emikt/G+yrI5NeXJUGfP9bJGBidgQKzFlh4n2NZDMOcOPeIyiYJALydSOUKEnvmw/5BhnjdvlE7
	Jzjg3Z+T+yPu6H4eYfuJAv5+aTQ1Cxzn4gBb6bA==
X-Gm-Gg: ASbGnctsxwVOEBmVfuWdclgh1J4wdVDa4NQvd4OAdFLvXBHi97Dz679Bl2PD9DHEe4E
	murxbqhj8y+dD3pNrN2qZFFFBPEP65VfCBlTivsanyZTLBWO7qvPHrE1h/RVLYEM37m7REjM/Yg
	==
X-Google-Smtp-Source: AGHT+IEYwaXtzSb6L2iPNq96UiAe3ghkX0HNZgeRMU3vnnuVEV+oTgkHvrSkTnrpbFNibYdT1xw/IZq62i2DSoq0Et4=
X-Received: by 2002:a05:6870:3c13:b0:29e:20c4:2217 with SMTP id
 586e51a60fabf-2b8f8e8f47emr1365637fac.33.1739434773165; Thu, 13 Feb 2025
 00:19:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
In-Reply-To: <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Feb 2025 09:19:21 +0100
X-Gm-Features: AWEUYZmAZ7muu4Y0CkS4aHUGrjFZdjBtSwN3vjBgPnCfnhs0YPXrZruLf1ATUM8
Message-ID: <CAHUa44FtXA8bOS1-BAGSrCFLxu_FRd2TaEtxGNdkzKua_-wNUQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 13, 2025 at 7:42=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org> =
wrote:
>
> Hi Boris,
>
> On Thu, 13 Feb 2025 at 01:26, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > +Florent, who's working on protected-mode support in Panthor.
> >
> > Hi Jens,
> >
> > On Tue, 17 Dec 2024 11:07:36 +0100
> > Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > > Hi,
> > >
> > > This patch set allocates the restricted DMA-bufs via the TEE subsyste=
m.
> >
> > We're currently working on protected-mode support for Panthor [1] and i=
t
> > looks like your series (and the OP-TEE implementation that goes with
> > it) would allow us to have a fully upstream/open solution for the
> > protected content use case we're trying to support. I need a bit more
> > time to play with the implementation but this looks very promising
> > (especially the lend rstmem feature, which might help us allocate our
> > FW sections that are supposed to execute code accessing protected
> > content).
>
> Glad to hear that, if you can demonstrate an open source use case
> based on this series then it will help to land it. We really would
> love to see support for restricted DMA-buf consumers be it GPU, crypto
> accelerator, media pipeline etc.

I'm preparing a demo based on GStreamer to share. It helps with more
real-world examples to see that APIs etc work.

>
> >
> > >
> > > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up =
the
> > > restrictions for the memory used for the DMA-bufs.
> > >
> > > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restric=
ted
> > > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to c=
hoose
> > > how to allocate the restricted physical memory.
> >
> > I'll probably have more questions soon, but here's one to start: any
> > particular reason you didn't go for a dma-heap to expose restricted
> > buffer allocation to userspace? I see you already have a cdev you can
> > take ioctl()s from, but my understanding was that dma-heap was the
> > standard solution for these device-agnostic/central allocators.
>
> This series started with the DMA heap approach only here [1] but later
> discussions [2] lead us here. To point out specifically:
>
> - DMA heaps require reliance on DT to discover static restricted
> regions carve-outs whereas via the TEE implementation driver (eg.
> OP-TEE) those can be discovered dynamically.
> - Dynamic allocation of buffers and making them restricted requires
> vendor specific driver hooks with DMA heaps whereas the TEE subsystem
> abstracts that out with underlying TEE implementation (eg. OP-TEE)
> managing the dynamic buffer restriction.
> - TEE subsystem already has a well defined user-space interface for
> managing shared memory buffers with TEE and restricted DMA buffers
> will be yet another interface managed along similar lines.
>
> [1] https://lore.kernel.org/lkml/mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5=
dfsqiehaxk@u67fcarhm6ge/T/
> [2] https://lore.kernel.org/lkml/CAFA6WYPtp3H5JhxzgH9=3Dz2EvNL7Kdku3EmG1a=
DkTS-gjFtNZZA@mail.gmail.com/

Thanks for the good summary. :-)

Cheers,
Jens

>
> -Sumit
>
> >
> > Regards,
> >
> > Boris
> >
> > [1]https://lwn.net/ml/all/cover.1738228114.git.florent.tomasin@arm.com/=
#t

