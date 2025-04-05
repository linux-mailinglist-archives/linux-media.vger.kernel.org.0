Return-Path: <linux-media+bounces-29426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C083A7C74E
	for <lists+linux-media@lfdr.de>; Sat,  5 Apr 2025 03:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D38B3BBE06
	for <lists+linux-media@lfdr.de>; Sat,  5 Apr 2025 01:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0FF25569;
	Sat,  5 Apr 2025 01:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="La/q+6ES"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED49C1BC2A
	for <linux-media@vger.kernel.org>; Sat,  5 Apr 2025 01:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743818260; cv=none; b=bwDSgMOcl/mu1lX1BWWYifXWp03CS272B7EBKHaobKglJreADe/eRbpd8G/AYhimNNW6AFMDZoJueiQ3zB4yxIgQJ8ZdPNxUzzCJQlsg+1ne+lgt2fX6UEvhPSWCrOh/9jVSVyfVxuqEgPSLEzHsyOgCkzL97RjxsG9WCO6Dm8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743818260; c=relaxed/simple;
	bh=OAoewxTDbadnGF1GAguojqOu/hTz+6xUWg05jevi4+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzXQffjwM1xkji66CKhcXWkhkphEiQbps6HuBR6u3tL645Dl8sa+3mHnPJCE0zS+Xrg4/pVSTFDNZ2YTYW477SNxsMOgjVhSrwE/uX2PM9JFGGvneAzKzA/mHMF3uyLYrtJA9hGXlv1fP9Acb2WB+Yqw+vL2Ah+QRcOdQc0MdPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=La/q+6ES; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4393ee912e1so12645e9.1
        for <linux-media@vger.kernel.org>; Fri, 04 Apr 2025 18:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743818257; x=1744423057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAoewxTDbadnGF1GAguojqOu/hTz+6xUWg05jevi4+Q=;
        b=La/q+6ESAJCdBnxXGPCM3hVWPLt3P10a8VOFaG/P0Mn/fgxSJpS1O9yrsd1Vb0cq1B
         OeGogdzMRYwmEtApp86F1BSFpd37LbtGW9HFJDuj7uRqM/V84PXR/DdBoqyNgwnMK/dO
         HC+uk+jr72HLdGWuBAD1AVtnqkRI5kf8XSwcx3b+sgIi7dI21QWbr8ybTQzeMaZyeUeh
         hUondTkDNHDJa7vIxWO+KDQ7ZeaERnW2NWBP7CID9z+a55U2Sa9mwWip87OoYaXQv3b9
         5ftL89jmIOpDceULmbFOiBUsXPShBvDEGS1YwtRs9Tyy2gJK1u0wHCsXEDkHGr7GUkOr
         vvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743818257; x=1744423057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAoewxTDbadnGF1GAguojqOu/hTz+6xUWg05jevi4+Q=;
        b=g4l2WWsFUt51FeoDWpqEgLPkyT1JJPbXtRYT9JQeRJpe9CK/VF0/hdfsgWzl4RKEHO
         wCzVv+3FolVZIwQfa+9E0pCymInEK2U4RqZEm+sGZSxldnGXj51ryX2+I4fup22nIsCP
         ZKKANn/p1r+7JnFh1uIcU+3bRbccOPtnyvBBgpmZH3pfZgQIuVIPlzLN4q02Eavi1o3s
         kHMWIW4fHRF8md52xv126iDjg79sYnQ/oZDdSYKVjpGWon+KjEJ3cmnygISQ7H02zkkk
         mDYTHgRq4ZfDQ7gvo20wnLHwz0XHIVmNsH4mBQEaeie0RK1ijWQ64bkfOrdmO9b6KuiY
         GiaA==
X-Forwarded-Encrypted: i=1; AJvYcCW/sM90igWS9HD5ixbT0TF30c70rJZuRtHskOqIDFVKM37Gp/zwuqo+Hd3IvAtMpxHRmQj6EDYjgy0BHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv4c7ZmXhkKFh9k1h5Q82CwLiAApkxg/GJcZ+R5309DLPJPzQg
	HSsr48WSl7IleN3rgRDzwFsphFgAsMi4shj3einjSf2k9AQGLzj3ycqlsE6nzc8NrAxLmNHdSbZ
	4wLKFq8CrVmFHdOzuIGJwt81V0NfqWgMOlE2M
X-Gm-Gg: ASbGncuwCM/3PvqEti8aXcz4wOMLtS3hbyB2wcjJiR14IbPFEnBlRrb3hH980CpERcd
	p7RGr8gEFBYk/SUuT3DeECS+sz2cm2fvdjeJ7HsVKQHqQnImpzcpZlfCyQpqMudiNUaB4BOH28m
	nhP41jp7gI+xQUxFvhClqbQZzX
X-Google-Smtp-Source: AGHT+IEZgBBuLcDuNWx/jFE8YY2SlwYmrCbwtiJPDyDgjgoOsHULjpV/CWiTVdB4+NcESAdkrCw+xWEHlXEt9xlkY4M=
X-Received: by 2002:a05:600c:3548:b0:43d:409c:6142 with SMTP id
 5b1f17b1804b1-43ee0e84029mr527915e9.0.1743818256732; Fri, 04 Apr 2025
 18:57:36 -0700 (PDT)
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
 <202c3a58-97a3-489c-b3f2-b1fd2735bd19@amd.com>
In-Reply-To: <202c3a58-97a3-489c-b3f2-b1fd2735bd19@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 4 Apr 2025 18:57:25 -0700
X-Gm-Features: ATxdqUG3Y0HIBufABo7xowgVhlloVVBpkM4JhVkK9QLhPMspK9dsEIobBZzLpG8
Message-ID: <CABdmKX2LhrcyDM0r1tytt2vKLuCLGsxZaGHgN+u1hUmEMXuGtw@mail.gmail.com>
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

On Fri, Apr 4, 2025 at 1:47=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Hi Maxime,
>
> Am 03.04.25 um 17:47 schrieb Maxime Ripard:
> > On Thu, Apr 03, 2025 at 09:39:52AM +0200, Christian K=C3=B6nig wrote:
> >>> For the UMA GPU case where there is no device memory or eviction
> >>> problem, perhaps a configurable option to just say account memory in
> >>> memcg for all allocations done by this process, and state yes you can
> >>> work around it with allocation servers or whatever but the behaviour
> >>> for well behaved things is at least somewhat defined.
> >> We can have that as a workaround, but I think we should approach that
> >> differently.
> >>
> >> With upcoming CXL even coherent device memory is exposed to the core
> >> OS as NUMA memory with just a high latency.
> >>
> >> So both in the CXL and UMA case it actually doesn't make sense to
> >> allocate the memory through the driver interfaces any more. With
> >> AMDGPU for example we are just replicating mbind()/madvise() within
> >> the driver.
> >>
> >> Instead what the DRM subsystem should aim for is to allocate memory
> >> using the normal core OS functionality and then import it into the
> >> driver.
> >>
> >> AMD, NVidia and Intel have HMM working for quite a while now but it
> >> has some limitations, especially on the performance side.
> >>
> >> So for AMDGPU we are currently evaluating udmabuf as alternative. That
> >> seems to be working fine with different NUMA nodes, is perfectly memcg
> >> accounted and gives you a DMA-buf which can be imported everywhere.
> >>
> >> The only show stopper might be the allocation performance, but even if
> >> that's the case I think the ongoing folio work will properly resolve
> >> that.
> > I mean, no, the showstopper to that is that using udmabuf has the
> > assumption that you have an IOMMU for every device doing DMA, which is
> > absolutely not true on !x86 platforms.
> >
> > It might be true for all GPUs, but it certainly isn't for display
> > controllers, and it's not either for codecs, ISPs, and cameras.
> >
> > And then there's the other assumption that all memory is under the
> > memory allocator control, which isn't the case on most recent platforms
> > either.
> >
> > We *need* to take CMA into account there, all the carved-out, device
> > specific memory regions, and the memory regions that aren't even under
> > Linux supervision like protected memory that is typically handled by th=
e
> > firmware and all you get is a dma-buf.
> >
> > Saying that it's how you want to workaround it on AMD is absolutely
> > fine, but DRM as a whole should certainly not aim for that, because it
> > can't.
>
> A bunch of good points you bring up here but it sounds like you misunders=
tood me a bit.
>
> I'm certainly *not* saying that we should push for udmabuf for everything=
, that is clearly use case specific.
>
> For use cases like CMA or protected carve-out the question what to do doe=
sn't even arise in the first place.
>
> When you have CMA which dynamically steals memory from the core OS then o=
f course it should be accounted to memcg.
>
> When you have carve-out which the core OS memory management doesn't even =
know about then it should certainly be handled by dmem.
>
> The problematic use cases are the one where a buffer can sometimes be bac=
ked by system memory and sometime by something special. For this we don't h=
ave a good approach what to do since every approach seems to have a draw ba=
ck for some use case.

This reminds me of memory.memsw in cgroup v1, where both resident and
swapped memory show up under the same memcg counter. In this dmem
scenario it's similar but across two different cgroup controllers
instead of two different types of system memory under the same
controller.

memsw doesn't exist in v2, and users are asking for it back. [1] I
tend to agree that a combined counter is useful as I don't see a great
way to apply meaningful limits to individual counters (or individual
controller limits in the dmem+memcg case) when multiple cgroups are
involved and eviction can cause memory to be transferred from one
place to another. Sorry I'm not really offering a solution to this,
but I feel like only transferring the charge between cgroups is a
partial solution since the enforcement by the kernel is independent
for each controller. So yeah as Dave and Sima said for accounting I
guess it works, and maybe that's good enough if you have userspace
enforcement that's smart enough to look in all the different places.
But then there are the folks asking for kernel enforcement. Maybe just
accounting as best we can is a good place to start?

[1] https://lore.kernel.org/all/20250319064148.774406-5-jingxiangzeng.cas@g=
mail.com/

