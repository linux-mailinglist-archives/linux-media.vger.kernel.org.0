Return-Path: <linux-media+bounces-29562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0B8A7F1FA
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 03:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0110F17949F
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 01:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F5F24886D;
	Tue,  8 Apr 2025 01:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z8zj5bg9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF529CE6
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 01:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744074227; cv=none; b=t03iCBqaJG0ssGpVILl5ORZjMVxIymXKeQa1kY9XNtnHGubD1T8bhPL1ORvqw85f9BtWh4bWs0frwSsxlaLZN//CKHUPDQfqzNXpmhKSHfmGL83YfPaC4DbMS0Oi5N/cDdCOdOiJ1ofpvtOKsdYaw4PGKnoYWaSymMKdga0NTgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744074227; c=relaxed/simple;
	bh=N3NyAZWcqvz7fu/dk5KWmiijuV2cjTsspWnmvoi+M4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGyVYZJDdi1GYvuD3UCmF+1Z4KIOc4vxX1Dt0Yf/I11eHSk95xZB2HEQesv6gPVvG/+uldU6bxgeO3akHKNDBJGDFJzSkHjVTyiYs1u0vYNDQqW/OXtHZKW53feJFPjWizkzmHEAEzW5SC/u1Mq+EPyQbaXG2K5uaD/ztkWlURs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z8zj5bg9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ef83a6bfaso15325e9.1
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 18:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744074223; x=1744679023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3NyAZWcqvz7fu/dk5KWmiijuV2cjTsspWnmvoi+M4g=;
        b=Z8zj5bg9gJjmjGvBC+qCykB9SeKPntvtzCIx8EDw8oeD3G/4+Or/+5wk5WIhxfUMbs
         SP16Ad29j9lWKtW4x36H08sN8mlJTA200+0ARNW4Yzdo3iLrTX1eGctosCaRxeKLnvSC
         SdAQ+lUC4qMQCRlW2r6cRj9wixHPj61h37dEiB2uT7DvS7doSWaDarEPhlNnWdjJZxKn
         iCWY1GIw+uq2nkhwjl4haqMwYRwyQj0U3iVYY63X6nHpUgHFCHOrE3niZSVKd4vhZD9Q
         QUP2HV2pdzz8bTXqW/2hYOEzpyQoslENWm/tXjK1hOtZqeb2ChXfEN2a93WVmRYzygvD
         +GqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744074223; x=1744679023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3NyAZWcqvz7fu/dk5KWmiijuV2cjTsspWnmvoi+M4g=;
        b=OGBjQXa0Emmr41rkxuFZtYX86mjQiyNPAe5vtL1nyS0qza1A1g8II4pLrC1eBQKQsN
         1MychomIxCV8ifXEfHJObXfQtUVcK597AkmMwgHjfK0WW39GZlk2ROX7sKyGb4N/u964
         DNP/OMhx6+PxqQ8z9+1goJDQdgHrMJ38SuG/5ZLITJWnefXJZO7UUSGTqA7QEdUKelJR
         L0cCW6A3Kfk8Z5rRudrgpgHSRPWqQtEiw0vMYXi8jRvOREzWIRuixVTksDIMsLNa4e74
         44u03Kq0tPNcLCZVMgDwyT/5BhxRrowuNVimcdi+UL3Bn0/jFANSiHbS7G6JM6SgTDb8
         3GnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwiJ+zkxh112ije7oy7SMEYw28r8ltYoJrvpb59/cIvX3xyjzFOxGXDB+6Wa42/f6ycuvAS+UAQEmB7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw69EK21EImQ5zVlyYph3qR+mwM4M8+0uOXEIGEGk8KQcVh0PxS
	+1CKmQ0HYvpC+R9cuG5SK2Jrchygoiq1+IcWiZfvFEKObkeaUbbmsRKrHWmirJBu7yIYXJPkbb8
	kAcs9pQYswB4N/6oFI1/mvM6Is4RffnF1z6G2
X-Gm-Gg: ASbGncseqo9tpniOJ7kGycCAunv5YndoMhostLIn6y4zisj7shTcIJqGQH35etTDabF
	EkyZyMjbT3KzOx5gVHSLab6ZVOM+zsFbS4OUxio2MFBWcx0qSREJJMhRy+8Fre5unN9nGc3VYrB
	y/9qdJnLYIjEHOKiRm5ZHP9b0r
X-Google-Smtp-Source: AGHT+IF8E+QG4m0isufZWPae8BywR8gPWm5THfralNVOJXPV/1TEOznb4Z/yFAFdMwZHDPMGruIUYT3jCRKLIcIGr/w=
X-Received: by 2002:a05:600c:512a:b0:439:961d:fc7d with SMTP id
 5b1f17b1804b1-43f108d2f14mr622335e9.6.1744074223271; Mon, 07 Apr 2025
 18:03:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com> <20250310-eccentric-wonderful-puffin-ddbb26@houat>
 <CAPM=9tzkLXOz=-3eujUbbjMHunR+_5JZ4oQaqNmbrWWF9WZJ0w@mail.gmail.com>
 <e08f10da-b0cd-444b-8e0b-11009b05b161@amd.com> <CAPM=9twgFt43OKqUY0TNopTmibnR_d891xmV=wFM91n604NUCw@mail.gmail.com>
 <5ed87c80-6fe3-4f8c-bb98-ca07f1db8c34@amd.com> <20250403-quick-salamander-of-charisma-cab289@houat>
 <202c3a58-97a3-489c-b3f2-b1fd2735bd19@amd.com> <CABdmKX2LhrcyDM0r1tytt2vKLuCLGsxZaGHgN+u1hUmEMXuGtw@mail.gmail.com>
 <86a12909-4d40-46ec-95cc-539c346914e4@amd.com>
In-Reply-To: <86a12909-4d40-46ec-95cc-539c346914e4@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 7 Apr 2025 18:03:31 -0700
X-Gm-Features: ATxdqUG1XcwuvWGPoKuoToYV-NskQlGn2cxAGlcz7gx_QBU2p615RFpmzdS5pyY
Message-ID: <CABdmKX1B9OS0GK51nx0NjYs3E_1UVwCDvmiZOA3UhFjDeZcuxg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 4:46=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 05.04.25 um 03:57 schrieb T.J. Mercier:
> > On Fri, Apr 4, 2025 at 1:47=E2=80=AFAM Christian K=C3=B6nig <christian.=
koenig@amd.com> wrote:
> >> Hi Maxime,
> >>
> >> Am 03.04.25 um 17:47 schrieb Maxime Ripard:
> >>> On Thu, Apr 03, 2025 at 09:39:52AM +0200, Christian K=C3=B6nig wrote:
> >>>>> For the UMA GPU case where there is no device memory or eviction
> >>>>> problem, perhaps a configurable option to just say account memory i=
n
> >>>>> memcg for all allocations done by this process, and state yes you c=
an
> >>>>> work around it with allocation servers or whatever but the behaviou=
r
> >>>>> for well behaved things is at least somewhat defined.
> >>>> We can have that as a workaround, but I think we should approach tha=
t
> >>>> differently.
> >>>>
> >>>> With upcoming CXL even coherent device memory is exposed to the core
> >>>> OS as NUMA memory with just a high latency.
> >>>>
> >>>> So both in the CXL and UMA case it actually doesn't make sense to
> >>>> allocate the memory through the driver interfaces any more. With
> >>>> AMDGPU for example we are just replicating mbind()/madvise() within
> >>>> the driver.
> >>>>
> >>>> Instead what the DRM subsystem should aim for is to allocate memory
> >>>> using the normal core OS functionality and then import it into the
> >>>> driver.
> >>>>
> >>>> AMD, NVidia and Intel have HMM working for quite a while now but it
> >>>> has some limitations, especially on the performance side.
> >>>>
> >>>> So for AMDGPU we are currently evaluating udmabuf as alternative. Th=
at
> >>>> seems to be working fine with different NUMA nodes, is perfectly mem=
cg
> >>>> accounted and gives you a DMA-buf which can be imported everywhere.
> >>>>
> >>>> The only show stopper might be the allocation performance, but even =
if
> >>>> that's the case I think the ongoing folio work will properly resolve
> >>>> that.
> >>> I mean, no, the showstopper to that is that using udmabuf has the
> >>> assumption that you have an IOMMU for every device doing DMA, which i=
s
> >>> absolutely not true on !x86 platforms.
> >>>
> >>> It might be true for all GPUs, but it certainly isn't for display
> >>> controllers, and it's not either for codecs, ISPs, and cameras.
> >>>
> >>> And then there's the other assumption that all memory is under the
> >>> memory allocator control, which isn't the case on most recent platfor=
ms
> >>> either.
> >>>
> >>> We *need* to take CMA into account there, all the carved-out, device
> >>> specific memory regions, and the memory regions that aren't even unde=
r
> >>> Linux supervision like protected memory that is typically handled by =
the
> >>> firmware and all you get is a dma-buf.
> >>>
> >>> Saying that it's how you want to workaround it on AMD is absolutely
> >>> fine, but DRM as a whole should certainly not aim for that, because i=
t
> >>> can't.
> >> A bunch of good points you bring up here but it sounds like you misund=
erstood me a bit.
> >>
> >> I'm certainly *not* saying that we should push for udmabuf for everyth=
ing, that is clearly use case specific.
> >>
> >> For use cases like CMA or protected carve-out the question what to do =
doesn't even arise in the first place.
> >>
> >> When you have CMA which dynamically steals memory from the core OS the=
n of course it should be accounted to memcg.
> >>
> >> When you have carve-out which the core OS memory management doesn't ev=
en know about then it should certainly be handled by dmem.
> >>
> >> The problematic use cases are the one where a buffer can sometimes be =
backed by system memory and sometime by something special. For this we don'=
t have a good approach what to do since every approach seems to have a draw=
 back for some use case.
> > This reminds me of memory.memsw in cgroup v1, where both resident and
> > swapped memory show up under the same memcg counter. In this dmem
> > scenario it's similar but across two different cgroup controllers
> > instead of two different types of system memory under the same
> > controller.
>
> Yeah, nailed it. Exactly that was one of the potential solutions I had in=
 mind as well.
>
> It's just that I abandoned that idea when I realized that it actually wou=
ldn't help.
>
> For example imagine you have 8GiB system and 8GiB local memory. So you se=
t your cgroup limit to 12GiB. But when an application tries to use full 12G=
iB as system instead of a combination of the two you still run into the OOM=
 killer.

Yup to solve this with kernel enforcement, we would need a counter
that includes both types. Then what if that system memory can be
swapped and exceeds a swap-only counter. Yet another counter? (dmem,
dmem+system, dmem+system+swap) :\

> > memsw doesn't exist in v2, and users are asking for it back. [1] I
> > tend to agree that a combined counter is useful as I don't see a great
> > way to apply meaningful limits to individual counters (or individual
> > controller limits in the dmem+memcg case) when multiple cgroups are
> > involved and eviction can cause memory to be transferred from one
> > place to another. Sorry I'm not really offering a solution to this,
> > but I feel like only transferring the charge between cgroups is a
> > partial solution since the enforcement by the kernel is independent
> > for each controller. So yeah as Dave and Sima said for accounting I
> > guess it works, and maybe that's good enough if you have userspace
> > enforcement that's smart enough to look in all the different places.
> > But then there are the folks asking for kernel enforcement. Maybe just
> > accounting as best we can is a good place to start?
>
> So we would account to memcg, but don't apply it's limits?

I was thinking just do the accounting independently for each resource
and not rely on the kernel for enforcement of combinations of
resources across controllers. (The status quo.) That shouldn't affect
how memcg enforces limits.

If we could compose a "synthetic" counter file in cgroupfs at runtime
that combines multiple arbitrary existing counters I think that'd help
address the enforcement side. It'd also conveniently solve the memsw
problem in v2 since you could combine memory.current and
memory.swap.current into something like memsw.current and set a
memsw.max, and only users who care about that combination would pay
the overhead for it.

> Mhm, that's a kind of interesting idea. It at least partially solves the =
problem.
>
> Regards,
> Christian.
>
> >
> > [1] https://lore.kernel.org/all/20250319064148.774406-5-jingxiangzeng.c=
as@gmail.com/
>

