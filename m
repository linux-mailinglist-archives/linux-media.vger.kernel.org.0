Return-Path: <linux-media+bounces-42367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77513B5384C
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 17:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85522AC01CA
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0340D3568E2;
	Thu, 11 Sep 2025 15:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lyVGzEBJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17481322536
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 15:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757605964; cv=none; b=g48PeZmpnqEVl4QFFtajDxxFCbx+zkjyCE92Gr5xxBx87nW46t+rWxLL7FMjwXIY+MLsR2IQEypu4KBYAOw0GskD39BFAXJ9YqPFZbeb7FUkLH3bTNdho/pmydf2MbL2iV6yMDLUcSGE9i7tyUHJY9JvFS31uCplCI1jqlqTsY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757605964; c=relaxed/simple;
	bh=foMaJCpT5aQB0DVDGayrfvczYmTKtjYQaxnfqBcxeQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9R6Xe1yrYK6mdC8ZSyLxF3q39k6jcV+OQLfhsrHUmIicDOrmNFapClOQ9M4YHdQPMzrgNzImDMxNWNTJA8IzSTmYua3QLQ2wD/uupvQVyYrehPKgme2/KmH2S3nFESEqWw2MOVax6krWBokYd556WK6mRu3P7CTuIGkxEbo0bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lyVGzEBJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dd9d72f61so103205e9.0
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 08:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757605959; x=1758210759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foMaJCpT5aQB0DVDGayrfvczYmTKtjYQaxnfqBcxeQk=;
        b=lyVGzEBJZWsKaIbB3apC5mC2zHl9kkzUAsPP9DKFYnMfWl8Kcl75ils8I25fa0jEdL
         wVV3/oXxepXtxPJmiTrVkTGXe5sYtv7fyOObJ18tjr3cfnSkwOKj1doCSU+/pLI1tW6n
         itrLyT7f9zzoVLe+e/v1sGtkT6AAn827J6GzKgp/VYcwEvoxLPEHJ418lc0pu3Omu1O1
         Oe/mUBIjm7uc4x/erbCsV3twb4BJeAy3iik0acxe63mkytm0cPvVNc4B6iHxBFNl2bmc
         3p7C9socHqRpVDsc8lgiFrcuCKVoSItNFESV4e2SD3IEW7qhfQtPXgCtPVDWzhYsoDFW
         mtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757605959; x=1758210759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foMaJCpT5aQB0DVDGayrfvczYmTKtjYQaxnfqBcxeQk=;
        b=a+qmfBgrbgDiokkef6pzO6jdtAbvCV97HykmhstY7hFijSO8KtyubOJDS7U1Pp5Axp
         apTXHeBcPQfDHINVRoreH45AVMrjQUt/2l2/b//667TCxlRGqPjX3s02z3Jfs0sUHJmR
         L04BXcZ9Geq6g02YK0yAgEDpbE5RGc1u3KxLx54i4jCd3H1b3xTB3sLII3GE3h+UMJdL
         ZVdgNGuhFLLDKDnNwxZ/R6ceJCpCSa94JHoIGGOOO1qM9ywGljU5brdcLggxNZTegBMV
         NShvtRzRssmmwyXb4uaCycKoVO6QPAXKkt9PnFBestk9rEVUkUZTuoF2q5aivsUYRW5p
         m8rw==
X-Forwarded-Encrypted: i=1; AJvYcCUvwDzO5DVJyYU7wbanEizsSDyoBhuRSak8qc6sH0gND4GYfjCYIyOOOS8WKraQ/rTPEfwue4o1Ci7ATg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+/9GIbL165T7bgAH59wIcYW5IK8EPYr/v7EtD2JLQYu6YTMNW
	xytB2TA/UgHB72F4rY7MFJ8OI6iX+yaVJDQqrJVO5LDlGM85H4vzmeIt6LTBC0pw/sOMkhCSWCk
	mnFPJiSfZmsjIzcBu3ug67AYuzsA4VJsod1Cy7BO/
X-Gm-Gg: ASbGnctYUXvRFYz91EbdMPm8ozcnT27YvrLb2pB7IHfZBhusE1MEG97n/VkXBGMQd6q
	WcIQQ/R27kZ12wgISkaW3HQ7J8JYxFFaNMeDg5OXPQOV46iIX3VudaBxVFYn0CDY1s/CjIuFdTs
	GyV0l5CZxg7dQ3qCCmgdLc9+LtSbYNoNS1jbZgbY6N8rLxyayS4b6W9Dg65hwieeh6bkSC0FAx6
	oqrpMHo8ItIrxDtfIiGov6K2Y8wfq3oiNiIQ/7E9KM=
X-Google-Smtp-Source: AGHT+IFPtXGS3xfleXOqxUh4NB8MIkaUyVVSq3pObyoX2WKiKcEimPgaW/wvhaqmwPl3cn8wFgGAwaPg27+INgq99jg=
X-Received: by 2002:a05:600c:4193:b0:45c:b621:9199 with SMTP id
 5b1f17b1804b1-45df821ead8mr2846075e9.7.1757605959182; Thu, 11 Sep 2025
 08:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
 <20250826-vagabond-catfish-of-courtesy-cbfa76@houat> <20250910-vigorous-attractive-gorilla-af6fec@houat>
 <CABdmKX29ftpNro+d=Ce6JGoMaG0UQeBbzL7DXiBkGkC0nwacTQ@mail.gmail.com> <20250911-didactic-authentic-cockle-e6d5fc@houat>
In-Reply-To: <20250911-didactic-authentic-cockle-e6d5fc@houat>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 11 Sep 2025 08:52:27 -0700
X-Gm-Features: AS18NWAeBqzBQ72YMefW3bpdVUuxd7DtaUCa6fSUYA3My40EoN0I9-kxEb7x3sc
Message-ID: <CABdmKX1RhwgHb1EizSHUE0PHnxgXib7C8=ZWuVeCi6QetQgGSw@mail.gmail.com>
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

On Thu, Sep 11, 2025 at 12:01=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> Hi TJ,
>
> On Wed, Sep 10, 2025 at 01:44:45PM -0700, T.J. Mercier wrote:
> > On Wed, Sep 10, 2025 at 12:33=E2=80=AFAM Maxime Ripard <mripard@kernel.=
org> wrote:
> > >
> > > On Tue, Aug 26, 2025 at 09:36:03AM +0200, Maxime Ripard wrote:
> > > > Hi,
> > > >
> > > > On Mon, Jul 21, 2025 at 01:17:29PM +0200, Maxime Ripard wrote:
> > > > > Here's another attempt at supporting user-space allocations from =
a
> > > > > specific carved-out reserved memory region.
> > > > >
> > > > > The initial problem we were discussing was that I'm currently wor=
king on
> > > > > a platform which has a memory layout with ECC enabled. However, e=
nabling
> > > > > the ECC has a number of drawbacks on that platform: lower perform=
ance,
> > > > > increased memory usage, etc. So for things like framebuffers, the
> > > > > trade-off isn't great and thus there's a memory region with ECC d=
isabled
> > > > > to allocate from for such use cases.
> > > > >
> > > > > After a suggestion from John, I chose to first start using heap
> > > > > allocations flags to allow for userspace to ask for a particular =
ECC
> > > > > setup. This is then backed by a new heap type that runs from rese=
rved
> > > > > memory chunks flagged as such, and the existing DT properties to =
specify
> > > > > the ECC properties.
> > > > >
> > > > > After further discussion, it was considered that flags were not t=
he
> > > > > right solution, and relying on the names of the heaps would be en=
ough to
> > > > > let userspace know the kind of buffer it deals with.
> > > > >
> > > > > Thus, even though the uAPI part of it had been dropped in this se=
cond
> > > > > version, we still needed a driver to create heaps out of carved-o=
ut memory
> > > > > regions. In addition to the original usecase, a similar driver ca=
n be
> > > > > found in BSPs from most vendors, so I believe it would be a usefu=
l
> > > > > addition to the kernel.
> > > > >
> > > > > Some extra discussion with Rob Herring [1] came to the conclusion=
 that
> > > > > some specific compatible for this is not great either, and as suc=
h an
> > > > > new driver probably isn't called for either.
> > > > >
> > > > > Some other discussions we had with John [2] also dropped some hin=
ts that
> > > > > multiple CMA heaps might be a good idea, and some vendors seem to=
 do
> > > > > that too.
> > > > >
> > > > > So here's another attempt that doesn't affect the device tree at =
all and
> > > > > will just create a heap for every CMA reserved memory region.
> > > > >
> > > > > It also falls nicely into the current plan we have to support cgr=
oups in
> > > > > DRM/KMS and v4l2, which is an additional benefit.
> > > > >
> > > > > Let me know what you think,
> > > > > Maxime
> > > >
> > > > Any chance we can get this merged?
> > >
> > > Guys, can we move forward on this?
> > >
> > > Maxime
> >
> > Hi Maxime,
> >
> > Sorry I've been MIA the last couple of months.
> >
> > The docs for the "reusable" property say, "device driver(s) owning the
> > region need to be able to reclaim it back", but how can a driver
> > reclaim memory backing a dmabuf, since pages allocated for a dmabuf
> > aren't necessarily movable. Couldn't a user allocate all of it, and
> > refuse to close those dmabufs?
>
> I guess, but how is that any different than what we're doing on the
> default allocator already?

Yeah fair, it's not. I'm thinking that makes determining a size for a
reusable driver-specified region that's always exposed to userspace a
bit fuzzy. The requirements for the driver can probably be known, but
for potentially unrelated allocations from userspace? The default
ownership / file permissions for the heap would have to be changed to
allow those non-reclaimable allocations, so maybe that's enough of an
opt-in for such regions.

> It also has to be reusable, and will not be able to reclaim any memory
> allocated through the heap.
>
> > I backported this to 6.6 and ran it on a Pixel. While there are
> > already similar out-of-tree dmabuf heap drivers that expose heaps for
> > these reserved regions, they do more than just cma_alloc (multiple
> > flavors of buffer securing, use case specific alignment and padding,
> > and slightly different allocation strategies) so I don't think this
> > series would allow us to completely drop the custom heap code, but
> > it's a nice start.
>
> Thanks for testing, and I totally expect more heaps coming for things
> like protected memory, but it should indeed reduce the number of heap
> drivers needed going forward.
>
> > Does the cgroup part come in because the plan is to add charging in
> > cma_heap.c?
>
> Yes, and the system heap as well.
>
> Maxime

Thanks,

Reviewed-by: T.J. Mercier <tjmercier@google.com>

