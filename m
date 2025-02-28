Return-Path: <linux-media+bounces-27218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4FBA49839
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 12:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 246A11738CA
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 11:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A2026157C;
	Fri, 28 Feb 2025 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EQriPvYT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B023E261585
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740741598; cv=none; b=e8ggsu0QaBm9FUoB3MTznQYIoYKBXsAynH71pK3knYkqjab8/iCQuv46n6WhuA322wsWbul3QmMHpnSVzgVTrVQJ4BOoplsn5p9Md2slVdhdjgsXALSv9AKUZsWNCv4DRtNvN/AxancOhw0VnuYy7BBrF1KptmdVPJtGCqar2VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740741598; c=relaxed/simple;
	bh=OsXYM8ePl9dRXaykIjugDeDQ+GWuufEIdXvrBWmNtGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzpPzmwY6Gm01IUaGiSBRO3BAz3RAM/WuMaFjBepnLpHWfN8SWqryhKs3N2bQiubogmMkwQ801+IIhOZuf316abFlA4eUaxxmIlc/qXY1bGjPQGegpU+gxMbHn2bK/Y1MNJ4ojnhROjeLUmAQhuFJbY+gFuVkflEXeK2DrTv3C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EQriPvYT; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e04f2b1685so2618068a12.0
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 03:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740741594; x=1741346394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsXYM8ePl9dRXaykIjugDeDQ+GWuufEIdXvrBWmNtGQ=;
        b=EQriPvYT/+LXJaJP2L0Zfhk+ReX4rQoTQd5IUci1ukf/lyx+TBEZKv0Mitov007wQ9
         a29dFwDPgTp/rScqz53lt2lUMDCA5ign4LMEJlwx4ILWG4xUSENPXNweqQe1rWBAgSJd
         zhID/Yek5nFGoDwIF7F0C6F5laVhBHrCaGD10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740741594; x=1741346394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsXYM8ePl9dRXaykIjugDeDQ+GWuufEIdXvrBWmNtGQ=;
        b=Vzs9Fb3rTPvFbOpgt4zYVWEES/6b9rZqstn/emrifbA641DHkTpgJ2J4rqGV/qKVqc
         Xk783rgtMIMvAz9F6ibQD8WoJVwXJzPVUhGshdchTgXztH4y3gKn9bkGUqZBz6gEuoP3
         91X8MhOcbGoTQDQMN6lZPCTA5fygmpELidwgxVJUon1M9UaUACvcJAMTxemvVq1pXDu5
         XPTGC0fqTiLghxe89Zd7J9oGUa2jftXvO1wxrXn/lMkbmVehiL5W6HLgROgCZ86OL9qs
         uLYfNFKfJ2c4zX0et6jGKHVFtF5dCl0YS/g2cABsK0zLBcfa1AZQdbji6/aUPpo+cBtB
         9B+w==
X-Forwarded-Encrypted: i=1; AJvYcCWcfUZVeOipB+P37AHKISFhaHKmpfBu3UUY7kPEMeBtRVOTxSkiVJ2unaPUAJs4zz84UzZjTkcaHb3QKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKMSDdsbCt2hsDSmCjYmZ4e22zphFmHyMGk0rMuiQsb2pRx0Q9
	emC/OKgq0rEflxVmT6sthZxrZ40rc73NNiK9V+vQulKdcd3wnmkSa0rSa6gf4TLd8ojITvL8uLA
	k+g==
X-Gm-Gg: ASbGncvZXPccwKebhS7pIid4usNKOkmPTJIrZ6Lu/g8tBc4BvC+Wjit+ZBGIshBIG09
	6kxnd9Xh0i/uD+k65n47S/LrQ5A0gKf1mkkhtJNsTyQkTxFTkTXJAYslE9bY6J/cMwMfxingc1I
	IOivRizh+nXQRtRNoqgPvojUX8GZM78VK10m7skg/A88mKxgs9vK60saNAOzHxecxja2UD05C0a
	p1uPC2ru+HJGxglIOuOesKApQdshOBQiD074Ffl4kDJ6iaQdXqmepUVFSpJ88EvyyT+MCJ5KXti
	wFhb8eH3mPBF+wtjQYe+2ONyXyQkMVB/Yce0anqQOhZ9K8R/Qq469E0HX2WlcQ==
X-Google-Smtp-Source: AGHT+IF4l/op2VDLWohPeVTmoyEQ63kAhFzmJXpPkTp0VZz/eeE0lLOeTf1oCd5VZMuuR+GoYmmfgg==
X-Received: by 2002:a05:6402:13ca:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5e4d6af43famr6241329a12.17.1740741586705;
        Fri, 28 Feb 2025 03:19:46 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9ab5sm273592166b.32.2025.02.28.03.19.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 03:19:45 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5ded4a3bf0bso10133a12.0
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 03:19:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIjdfg8zFAAcMZvPiVsTtPgT7tM7ikWG7e+iU1k3LIH//Mwri6vBpPXLELpgyUOonFfPw72+KjIY3nqA==@vger.kernel.org
X-Received: by 2002:aa7:c593:0:b0:5dc:5ae8:7e1 with SMTP id
 4fb4d7f45d1cf-5e4d74de7ecmr78282a12.6.1740741584369; Fri, 28 Feb 2025
 03:19:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com> <87bjw9s4s3.fsf@gmail.com>
 <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
 <CAAFQd5DS2x3sX59EdkTEMuO=eXc=Q0jD44EUwMisP6ocWz11qg@mail.gmail.com>
 <bgnkzjpegpmif7gohoijt42rku6jruovjsxscg75dprdz5ek2i@ntfh2yyjyiry>
 <CAAFQd5BihpFYgqvKta7ULMAVSMTy3kd6iR6Mo4ea9Ci935EFMA@mail.gmail.com> <aw6hhc5x7lycbmckbc57ke5whksem5lasfkufcxrcuou5vhoyo@ylggg6tdzcnq>
In-Reply-To: <aw6hhc5x7lycbmckbc57ke5whksem5lasfkufcxrcuou5vhoyo@ylggg6tdzcnq>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 28 Feb 2025 20:19:27 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BEu_i8JeKkFSCqCNDEs75k3=vOjnAYzSBv9yhPJNvCsA@mail.gmail.com>
X-Gm-Features: AQ5f1Jo4iuYuE-WQ5kGFMC-K7_2dFm6wcUIvZdWnUkigr4hSv-4tmouuVXKBwk8
Message-ID: <CAAFQd5BEu_i8JeKkFSCqCNDEs75k3=vOjnAYzSBv9yhPJNvCsA@mail.gmail.com>
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 7:48=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Tomasz
>
> On Fri, Feb 28, 2025 at 07:28:43PM +0900, Tomasz Figa wrote:
> > On Fri, Feb 28, 2025 at 7:18=E2=80=AFPM Jacopo Mondi
> > <jacopo.mondi@ideasonboard.com> wrote:
> > >
> > > Hi Tomasz
> > >
> > > On Fri, Feb 28, 2025 at 07:00:57PM +0900, Tomasz Figa wrote:
> > > > Hi Jacopo,
> > > >
> > > > On Fri, Feb 28, 2025 at 2:11=E2=80=AFAM Jacopo Mondi
> > > > <jacopo.mondi@ideasonboard.com> wrote:
> > > > >
> > > > > Hi Mikhail
> > > > >
> > > > > On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
> > > > > >
> > > > > > Hi Laurent,
> > > > > >
> > > > > > On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@=
ideasonboard.com> wrote:
> > > > > >
> > > > > > > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wro=
te:
> > > > > > >> Currently, the rkisp1 driver always uses coherent DMA alloca=
tions for
> > > > > > >> video capture buffers. However, on some platforms, using non=
-coherent
> > > > > > >> buffers can improve performance, especially when CPU process=
ing of
> > > > > > >> MMAP'ed video buffers is required.
> > > > > > >>
> > > > > > >> For example, on the Rockchip RK3399 running at maximum CPU f=
requency,
> > > > > > >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed bu=
ffer to a
> > > > > > >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms w=
hen using
> > > > > > >> non-coherent DMA allocation. CPU usage also decreases accord=
ingly.
> > > > > > >
> > > > > > > What's the time taken by the cache management operations ?
> > > > > >
> > > > > > Sorry for the late reply, your question turned out a little mor=
e
> > > > > > interesting than I expected initially. :)
> > > > > >
> > > > > > When capturing using Yavta with MMAP buffers under the conditio=
ns mentioned
> > > > > > in the commit message, ftrace gives 437.6 +- 1.1 us for
> > > > > > dma_sync_sgtable_for_cpu and 409 +- 14 us for
> > > > > > dma_sync_sgtable_for_device. Thus, it looks like using non-cohe=
rent
> > > > > > buffers in this case is more CPU-efficient even when considerin=
g cache
> > > > > > management overhead.
> > > > > >
> > > > > > When trying to do the same measurements with libcamera, I faile=
d. In a
> > > > > > typical libcamera use case when MMAP buffers are allocated from=
 a
> > > > > > device, exported as dmabufs and then used for capture on the sa=
me device
> > > > > > with DMABUF memory type, cache management in kernel is skipped =
[1]
> > > > > > [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops =
[3], so
> > > > > > DMA_BUF_IOCTL_SYNC from userspace does not work either.
> > > > > >
> > > > > > So it looks like to make this change really useful, the above i=
ssue of
> > > > > > cache management for libcamera/DMABUF/videobuf2-dma-contig has =
to be
> > > > > > solved. I'm not an expert in this area, so any advice is kindly=
 welcome. :)
> > > > >
> > > > > It would be shame if we let this discussion drop dead.. cache
> > > > > management policies are relevant for performances, specifically f=
or
> > > > > cpu access, and your above 7.7ms vs 1.1 ms test clearly shows tha=
t.
> > > > >
> > > > > >
> > > > > > [1] https://git.linuxtv.org/media.git/tree/drivers/media/common=
/videobuf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n=
411
> > > > >
> > > > > I would like to know from Hans if the decision to disallow cache-=
hints
> > > > > for dmabuf importers is a design choice or is deeply rooted in ot=
her
> > > > > reasons I might be missing.
> > > >
> > > > When DMA-buf is used, the responsibility for cache management is
> > > > solely on the CPU users' side, so cache-hints don't really apply. I=
t's
> > > > the exporter (=3Dallocator) who determines the mapping policy of th=
e
> > > > buffer and provides necessary DMA_BUF_SYNC operations (can be no-op=
 if
> > > > the buffer is coherent).
> > >
> > > This all makes sense.
> > >
> > > I take it as, for libcamera, users of the FrameBufferAllocator helper
> > > (which first exports MMAP buffers from the video device and the
> > > imports them back as DMABUF) won't be able to control the cache
> > > policies.
> > >
> > > Now, in the long term, we want FrameBufferAllocator to go away and
> > > have either buffers exported by the consumer (likely DRM) or by a
> > > system wide buffer allocator (when we'll have one) and have the video
> > > devices operate as pure importers. But for the time being the
> > > "first export then import" use case is possibile and valid so I wonde=
r
> > > if we should consider measures to allow controlling caching policies
> > > for this use case too.
> >
> > Hmm, I may be missing something, but if FrameBufferAllocator does the
> > allocation internally in libcamera, why couldn't it use the
> > V4L2_MEMORY_FLAG_NON_COHERENT REQBUFS/CREATE_BUFS flag?
>
> -I- might be missing something, but reading the below links that
> Mikhail reported in a previous email
> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
>
> it seems to me that yes, when first exporting you can hint to tell
> vb2 to allocate from non-coherent/non-contiguous memory, but then when
> switching the device to importer mode (and import the same buffers it
> previously exported) the cache sync point would then
> be skipped, leading to possible synchronization issues between the cpu
> consumer and the device.

Yeah, and that is 100% expected. As I said in my previous reply, in
the DMA-buf world, it's the responsibility of the users doing the CPU
accesses to ensure the correct synchronization (aka explicit sync).

>
> >
> > Note that however, once the buffer is allocated and mapped once, on
> > many architectures it must keep the same mapping attributes across the
> > different mappings, due to how the memory hierarchy works. (Not sure
> > if this is what you are asking for here, though.)
> >
> > >
> > > >
> > > > Best regards,
> > > > Tomasz
> > > >
> > > > >
> > > > > I'm asking because the idea is for libcamera to act solely as dma=
-buf
> > > > > importer, the current alloc-export-then-import trick is an helper=
 for
> > > > > applications to work around the absence of a system allocator.
> > > > >
> > > > > If the requirement to disable cache-hints for importers cannot be
> > > > > lifted, for libcamera it means we would not be able to use it.
> > > > >
> > > > >
> > > > > > [2] https://git.linuxtv.org/media.git/tree/drivers/media/common=
/videobuf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n=
829
> > > > > > [3] https://git.linuxtv.org/media.git/tree/drivers/media/common=
/videobuf2/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c=
437d#n426
> > > > > >
> > > > > > --
> > > > > > Best regards,
> > > > > > Mikhail Rudenko
> > > > > >
> > > > >

