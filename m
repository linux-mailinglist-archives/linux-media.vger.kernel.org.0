Return-Path: <linux-media+bounces-26124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52534A348DD
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 17:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 969773A4D7B
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 15:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1E91CEEBB;
	Thu, 13 Feb 2025 15:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HPCowkA4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E59018A6C4
	for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462280; cv=none; b=SXUzT9oVkOtmSYvGtPNs8pvGliqWZfC1MyJaJZPRUjGXRlaKNflv4YvrfKTOelAXJvKo7gmYItNrVyUIN1IWqmCSa/AmiQEmLMHt6RurA109DQDE6dNb3FRmLY2skOZim8l3R6iqWT5BEGn9qzWcgwZ3nlsx7g4V1mc1qseu+94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462280; c=relaxed/simple;
	bh=689LjFK8hKatdZaSaF9r6CCqoaXyMdM1aN6KF4TBO24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7WfNEetVvCUyeHQA2rw0cXlPYAF0dqs0zESf6xyX78dvXVy1ojF6JYlnEGoRI6R5WLQfZEqTQQ4RFB6ECCdvXnr0/gb55LN1CjQ8aAun7SRV4v7feN3e+aUgOVg+C8tVN/7STQG7OXDlyAhtibdpKwFzh4FRN0sHuaVYk2b3PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HPCowkA4; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f3d9321dccso561854b6e.3
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739462278; x=1740067078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHtO1l0Sm3xnCkozanEaDdmWEvTg249bwN+Pta/EflE=;
        b=HPCowkA4a/oI6/25vr+EWCHaooAo/KFm2NwgXgk4wdf8hljv7TGFaUTwEO64M/cg/a
         U47pO+FQZi5aIa0bDDkJ1mr1ffJgbVEXD8QleQ+wp33Ij0J9O9HZQuPvfCcjQqtHir6E
         SkGY2vleJIy5y96XKyCdNZxW0jKuUtgdgqFVCO8L/unHUuz87khF68v1ZGo4TBf/eywh
         bsgeUvcMfgI5/dzeDpJraUdyxA1frkeHa0fdYV6QxDuKkgFCcK4lMLMuStwXPpzWeEoF
         0fieYcJGyj65RL5xgkYIUABTwQxUFhCYwK4nTNCz2r4JB9o0bDbZp/qlqdYQnXXNf5y8
         fCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739462278; x=1740067078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHtO1l0Sm3xnCkozanEaDdmWEvTg249bwN+Pta/EflE=;
        b=jX3L+I1rCtROKuAMcxS86WMBqHk92U59EkQvsYJkrudsoSx6XQkmnTnQqKJUW/41xc
         020D9lWmgq8NYCbbgWLbkTAkcimCs83EAg/wb7AtjRaRi3yXGnuHiLbBFFgu6S7hzLlu
         Hoy79hAyh4V8NuQtQhoebaHOtwJXzMR1JnR9JhScynMumUUYAtbiy9wEvUhfpiRGAKIE
         w1t5jGZO35FlakMi1G/tVImwRHqB4kkxGPYN4wQ39kDyYLTcqr8HxwlARlpJmt57gw7+
         +j5NS3IkzdvbmJgbBMXtz0NeVMg78bz0/zKUEZJky6gZ/vZDw2hWNiECnSS2VJcCj5Tv
         xZtA==
X-Forwarded-Encrypted: i=1; AJvYcCXG1P7+FigaT7yst86c73vrst73jeo/a7LqGQyEX3eJvUMxeGoMHJY/RgsKmwDcYmQVXEk8N/FYgF74aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZC+LmH1s3fw1F7DertmIahNIKaOPigqhre0vUVxBoHTL5Gf3
	ljJCC0xyP/6ecN0X/Io+QYJsEomNsO+8omi4WjCS5ECfqmN+RXN5BEbfWMjYTFYDJ1qYW+N1Acd
	h7xELPjZgvM2ZNokQj6tlNpifSGLfmf6xl6ppfQ==
X-Gm-Gg: ASbGncvCb0ezGFB7X8wlCuvIiKgwEDxdSQDz+6R6ogZ6DYsoYq0grA351i49K2sV+/e
	qa3/UtEJQyBbsXK7+n7FZ8dYe58L8YOVGjfuYNIeRQkLWDx7xJLBvmxt9KP7PdJmdbfABxBLXWA
	==
X-Google-Smtp-Source: AGHT+IFP5g43bicIDLt/S4uI2Sk6WesrFKEkZAgRcsR6UVnbplWcWySy+Pe58g7cxxxYF2yjdv9hpHSaFgfwFOWE+Ow=
X-Received: by 2002:a05:6870:f112:b0:2b8:84d7:ddd5 with SMTP id
 586e51a60fabf-2b8d68c6af2mr4406581fac.39.1739462278059; Thu, 13 Feb 2025
 07:57:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com> <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
In-Reply-To: <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Feb 2025 16:57:42 +0100
X-Gm-Features: AWEUYZmgVASDSvu5hsJWJHBSSPIof2Z6xxr-T5u2MSp4prWGrnjV2aHs43vhfXo
Message-ID: <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Sumit Garg <sumit.garg@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooishbar.org>=
 wrote:
>
> Hi,
>
> On Thu, 13 Feb 2025 at 12:40, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> > On Thu, 13 Feb 2025 14:46:01 +0530 Sumit Garg <sumit.garg@linaro.org> w=
rote:
> > > Yeah but all the prior vendor specific secure/restricted DMA heaps
> > > relied on DT information.
> >
> > Right, but there's nothing in the DMA heap provider API forcing that.
>
> Yeah. DMA heaps are just a way to allocate memory from a specific
> place. It allows people to settle on having a single way to do
> allocations from weird platform-specific places; the only weird
> platform-specific part userspace needs to deal with is figuring out
> the name to use. The rest is at least a unified API: the point of
> dma-heaps was exactly to have a single coherent API for userspace, not
> to create one API for ZONE_CMA and DT ranges and everyone else doing
> their own thing.
>
> > > Rather than that it's better
> > > for the user to directly ask the TEE device to allocate restricted
> > > memory without worrying about how the memory restriction gets
> > > enforced.
> >
> > If the consensus is that restricted/protected memory allocation should
> > always be routed to the TEE, sure, but I had the feeling this wasn't as
> > clear as that. OTOH, using a dma-heap to expose the TEE-SDP
> > implementation provides the same benefits, without making potential
> > future non-TEE based implementations a pain for users. The dma-heap
> > ioctl being common to all implementations, it just becomes a
> > configuration matter if we want to change the heap we rely on for
> > protected/restricted buffer allocation. And because heaps have
> > unique/well-known names, users can still default to (or rely solely on)
> > the TEE-SPD implementation if they want.
> >
> > > There have been several attempts with DMA heaps in the past which all
> > > resulted in a very vendor specific vertically integrated solution. Bu=
t
> > > the solution with TEE subsystem aims to make it generic and vendor
> > > agnostic.
> >
> > Just because all previous protected/restricted dma-heap effort
> > failed to make it upstream, doesn't mean dma-heap is the wrong way of
> > exposing this feature IMHO.
>
> To be fair, having a TEE implementation does give us a much better
> chance of having a sensible cross-vendor plan. And the fact it's
> already (sort of accidentally and only on one platform AFAICT) ready
> for a 'test' interface, where we can still exercise protected
> allocation paths but without having to go through all the
> platform-specific setup that is inaccessible to most people, is also
> really great! That's probably been the biggest barrier to having this
> tested outside of IHVs and OEMs.
>
> But just because TEE is one good backend implementation, doesn't mean
> it should be the userspace ABI. Why should userspace care that TEE has
> mediated the allocation instead of it being a predefined range within
> DT?

The TEE may very well use a predefined range that part is abstracted
with the interface.

> How does userspace pick which TEE device to use?

There's normally only one and even if there is more than one it should
be safe to assume that only one of them should be used when allocating
restricted memory (TEE_GEN_CAP_RSTMEM from TEE_IOC_VERSION).

>  What advantage
> does userspace get from having to have a different codepath to get a
> different handle to memory? What about x86?
>
> I think this proposal is looking at it from the wrong direction.
> Instead of working upwards from the implementation to userspace, start
> with userspace and work downwards. The interesting property to focus
> on is allocating memory, not that EL1 is involved behind the scenes.

From what I've gathered from earlier discussions, it wasn't much of a
problem for userspace to handle this. If the kernel were to provide it
via a different ABI, how would it be easier to implement in the
kernel? I think we need an example to understand your suggestion.

Cheers,
Jens

