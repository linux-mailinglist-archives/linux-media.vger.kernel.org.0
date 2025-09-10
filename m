Return-Path: <linux-media+bounces-42238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F156AB522D7
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 22:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1B0A083E4
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 20:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBA22FB604;
	Wed, 10 Sep 2025 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W+Woafyj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C51340DA6
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 20:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757537102; cv=none; b=RfxWmqfkxhRWlFV2w+HFabqCJIB48mT75xJXfznacVC4KkwUnk6sKR+Zqi7advX/Nzw/anyQ/GFgbt5eGsp440n9rKRJJ37d5uqVHigqD9CQDJ+ee6hG3rOskh49KO7i7fxQIewAmf9oVhBbGX6V+q5gZRxx5I2fUP6WDVcesAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757537102; c=relaxed/simple;
	bh=zdj+uOiXuiIXzM1Vn3fcDOOxGOrxrCVtY7jUVpK65ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HB4wpnkhPYanqrkULBjnoJXwYlG7ajA9woL6dqi7RYR1CoJNIUu60DqtJW4f3vO8pDLP7qtbHeEhiEpGNl1lGkXm2I1R0C/8/usdLhDjiaodnAsEmbARyeAXKst+Q8WuvL4yG7mhj5EuXO/ifx3LidoDCVejhRMrokfMKQ6MpII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W+Woafyj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45dd9d72f61so26675e9.0
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 13:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757537098; x=1758141898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdj+uOiXuiIXzM1Vn3fcDOOxGOrxrCVtY7jUVpK65ZI=;
        b=W+WoafyjcJ5f2BosdXGeB215pCNhmz3t7tMobUPuB0dVxY/NYaJ2bx0FVDbHiRtmUZ
         YzFJiw5SVtE4Fge0ZdUATuSKhjrpnniZFwZ7Rhya7BjupBEtaKG3P0Nv+fKJh/4BjosP
         DVcR4yH2rvo3giZomGQkK4RzUNGDzzPaPqUO3eYD0UWZKuLhig0GoE5Ag6O8UP3yfrVA
         wmDU6jyIhXhzr8ZpZHhJC4CHbx+coJAGSBVaanVSNw7L3IoK0fk01iJv5OV0XZPUHbiw
         iR0h+WGGBVG94nne2WlsOFnRpk+0Oguur2ePJ+zlm635Mm2UybciFV+lDDVzBI+BZwo7
         Le7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757537098; x=1758141898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdj+uOiXuiIXzM1Vn3fcDOOxGOrxrCVtY7jUVpK65ZI=;
        b=WigBXIYlZgnqtr3Jo43EhDOu5LCnO5wsii8IbLR3lbsa+ej/DJODiGn4fgkzeVlXbB
         X8UW7AQy+0DiGmtiZ640KT4FouayRgJ7NJk+Tls0V7+ikUWqYE/ry9YMTrCAeY4ApBEP
         RUUH2IjX7mDhEqgk6YSMAQp7Xpc/M47LYN99C1YWfvhHvCX6VcSh6ul6I1PxdB10e6JH
         alsWwkT2/6xSxwym4ii4ndQ+AFeED/2I+Hnnlgpuv0ru2dQ8CPs4d67QyB2cfnPdZF28
         8Eo6zDcLmzQfQyDm2FZfkN9Uf1TUI7WEsA/6uRIBJWMgH7eO/wuPbn69Cwnfr6xTEpr+
         Ly0A==
X-Forwarded-Encrypted: i=1; AJvYcCVU8z0CLHu2vAdlYolGGlRaLoJyF9oJtG0aqXodTtadg5LElT6EKkO/8BQMpUjPHspxQWuJlJ5bgC1wmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOLh2DVurJUpnyUGQb9fuE93hMGu9rezrjP5m5ULBGa9Ya7PQH
	7N76R4xmjRfA5EtswHSzfjX1aU8u3DQOGr4T/N9YPhSZetVLTApJ4CtaZ3NRLRNnBiCyXc1BXaj
	Lo0XwmYR1aORTzxbvIDCC+ttxoK8WqwSd0rJAkWcY
X-Gm-Gg: ASbGnctfJ1hr0G/rJfngbaZX7A3S37WChMql1vDVVef439Ty7+wIbT/YDLPunK1hXPa
	HbKR38XJj4Wo4o3BnYhhY+sHSAEN03FWj9FCS9GNSG96t29AcDTHyyqRy2JZYgjAoQ4yqOj0/rI
	p2e1DTqB/JsR9EgZP/AM4FCwtUHsDFcHqV5Up8TI5QAl/T5BYrVBu+CCUf6mXDaaO+89g0vGXxv
	WYvumJLdsR6442xYsNj3kEm90krm6/YIeLyYQmr/iKJQWydfU8ZWsY=
X-Google-Smtp-Source: AGHT+IF/Fz2Y5nk02badGqITxY1/tzo4lRqGZ2Zao4nfkcXFZyjJgtYYuI6B/Fj3L639UAHyqOxbIJ21cF9JPLUpaI8=
X-Received: by 2002:a05:600c:1502:b0:45b:7d8f:4bd4 with SMTP id
 5b1f17b1804b1-45df74f81cemr1873365e9.4.1757537098041; Wed, 10 Sep 2025
 13:44:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
 <20250826-vagabond-catfish-of-courtesy-cbfa76@houat> <20250910-vigorous-attractive-gorilla-af6fec@houat>
In-Reply-To: <20250910-vigorous-attractive-gorilla-af6fec@houat>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 10 Sep 2025 13:44:45 -0700
X-Gm-Features: AS18NWDgBu3edPeSCZERO8HncQFGrRuZvzuC8yXw-tqKPcuIWCidg2bFxSYLb0U
Message-ID: <CABdmKX29ftpNro+d=Ce6JGoMaG0UQeBbzL7DXiBkGkC0nwacTQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
To: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
	Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 12:33=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> On Tue, Aug 26, 2025 at 09:36:03AM +0200, Maxime Ripard wrote:
> > Hi,
> >
> > On Mon, Jul 21, 2025 at 01:17:29PM +0200, Maxime Ripard wrote:
> > > Here's another attempt at supporting user-space allocations from a
> > > specific carved-out reserved memory region.
> > >
> > > The initial problem we were discussing was that I'm currently working=
 on
> > > a platform which has a memory layout with ECC enabled. However, enabl=
ing
> > > the ECC has a number of drawbacks on that platform: lower performance=
,
> > > increased memory usage, etc. So for things like framebuffers, the
> > > trade-off isn't great and thus there's a memory region with ECC disab=
led
> > > to allocate from for such use cases.
> > >
> > > After a suggestion from John, I chose to first start using heap
> > > allocations flags to allow for userspace to ask for a particular ECC
> > > setup. This is then backed by a new heap type that runs from reserved
> > > memory chunks flagged as such, and the existing DT properties to spec=
ify
> > > the ECC properties.
> > >
> > > After further discussion, it was considered that flags were not the
> > > right solution, and relying on the names of the heaps would be enough=
 to
> > > let userspace know the kind of buffer it deals with.
> > >
> > > Thus, even though the uAPI part of it had been dropped in this second
> > > version, we still needed a driver to create heaps out of carved-out m=
emory
> > > regions. In addition to the original usecase, a similar driver can be
> > > found in BSPs from most vendors, so I believe it would be a useful
> > > addition to the kernel.
> > >
> > > Some extra discussion with Rob Herring [1] came to the conclusion tha=
t
> > > some specific compatible for this is not great either, and as such an
> > > new driver probably isn't called for either.
> > >
> > > Some other discussions we had with John [2] also dropped some hints t=
hat
> > > multiple CMA heaps might be a good idea, and some vendors seem to do
> > > that too.
> > >
> > > So here's another attempt that doesn't affect the device tree at all =
and
> > > will just create a heap for every CMA reserved memory region.
> > >
> > > It also falls nicely into the current plan we have to support cgroups=
 in
> > > DRM/KMS and v4l2, which is an additional benefit.
> > >
> > > Let me know what you think,
> > > Maxime
> >
> > Any chance we can get this merged?
>
> Guys, can we move forward on this?
>
> Maxime

Hi Maxime,

Sorry I've been MIA the last couple of months.

The docs for the "reusable" property say, "device driver(s) owning the
region need to be able to reclaim it back", but how can a driver
reclaim memory backing a dmabuf, since pages allocated for a dmabuf
aren't necessarily movable. Couldn't a user allocate all of it, and
refuse to close those dmabufs?

I backported this to 6.6 and ran it on a Pixel. While there are
already similar out-of-tree dmabuf heap drivers that expose heaps for
these reserved regions, they do more than just cma_alloc (multiple
flavors of buffer securing, use case specific alignment and padding,
and slightly different allocation strategies) so I don't think this
series would allow us to completely drop the custom heap code, but
it's a nice start. Does the cgroup part come in because the plan is to
add charging in cma_heap.c?

Thanks,
T.J.

