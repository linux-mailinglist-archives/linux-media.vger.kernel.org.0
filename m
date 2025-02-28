Return-Path: <linux-media+bounces-27212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A63FFA49759
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 11:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 281A53BA61F
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 10:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B40D25E441;
	Fri, 28 Feb 2025 10:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lb4pCnPa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9712125D550
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738547; cv=none; b=bK8YCd1L8h9Z3KwPfjCIp15lEJzeHBEbGroP5bWx6Su9+rZaynouRwMebVNjdgxAWvQDlHuASz6mXVCIgb9jnuwgpJXhVXIkurzcK5ylVg6pfBo6lPZxHIq/X+NGj+MFckrD2/7vMl1MJxupA+FNaeNxeaWM4bR5d5qxcunl5QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738547; c=relaxed/simple;
	bh=eKOibatLevSl1XiH80i2AKEABQeU0O7rPQC7Mx++//c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbTqg/RLU5+R8cBC/732Gj5WoVCiirrvLk5paEz0+keHQ0jBESIqaelVUQ42IUK//NW960EO+90ABJ5PahOKiZ5/ArMR50mhI5C0oTr4YxgYMAJyagdIAj0pFgmgGN5kzUKaDv0JKFOwpSvNd2+R2WB9OZ7uQN8QcO8TaB4emy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lb4pCnPa; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so3440510a12.0
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 02:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740738543; x=1741343343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKOibatLevSl1XiH80i2AKEABQeU0O7rPQC7Mx++//c=;
        b=lb4pCnPaFMO8lz+ePeSC8UHQiTyRuF1FQ8yBlqpZsfV/gCvsnrTBrk6+Z9Bw52gX77
         r+eqNbHraoLxsOnHmlnsWHCFn6XfW8LKilCcw7fq1kRUqKYX/UIfNstj4ciZre58WN27
         UxArHxNByzTMgdt6Smwzw+HXtQaFAB/VALV4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738543; x=1741343343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKOibatLevSl1XiH80i2AKEABQeU0O7rPQC7Mx++//c=;
        b=A+qmsjQ1LA9IQ3B7EQNZHe1xIgopibhjLuQLIWlMM844HMv5xHULHGFgsmn0sRc6/R
         ogPbZFPbLJmgs1Ts1v+SAnoMEIEqoUUPdvvQ4ojL6ol5DISjU2+BF3ycM6dZdBcvNAO2
         BTJkWiAAhxxrbbTRzNAtPejQZf3+CoosvqSEA7avGhE/bpGdnU3Q5ala5Z0ucd2XVc3c
         u+rUPjCRw6fzfMr682kc9uHSSPkZHcjPuKF98iocDxhv4TKRb9sEDIiuiX71XjbsZbJe
         RjqSeHmbkPT5WhNmCDCc/quW3r8GNhEeZTZBNB2sG0yIJz7Gx8KwodRXY8I6BA/YsUkL
         uz8g==
X-Forwarded-Encrypted: i=1; AJvYcCVhQTSVOqCWzbB/YDoT7Cij9b6hUh8aabBJ9daMkKxtqve9rFAVcMQ1v1XjYPjqzbECcVbEcENV1tA6ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWBf4jht3rZUHe2qDP6uPrI/jjHMf4wHQVMgIKM4BeDSMlC4Rx
	f/iCfwrYSCh+ug2pSqwzW6Ua2zXAKZ9xUTb5RD0MHwzdT2QhfLLuQmw/5h+X8CPYFyyu+wBr5Fm
	kng==
X-Gm-Gg: ASbGncvkjSyT0YUNxtvfldLsAwzTDRdDyRZ5TaOeQMUmgs75zemAb45rNBZq6abEBfb
	o2MAgEY02whsrafaA+F3231+xEl0D3/WmprfX5S4pGg6Zu8dmfULeocg+ImPoiOPKTXd0g6Rbj8
	/hTQC3GuowQbpmmB1zdF1blG2Hj1hu6rmiFuCB6u2Oy5k/XPEDzRhOYdDwOiFgJQMcipJm3o9IN
	cKnsFw6hUkAWp4b8P3g3kxIeyx27M+3ix9kpc9dEUb8zdPFh42D9oJTmwcsCKMYw4ZbWEMMsCQ1
	ylFTT1eocDlB4Vhsd+AutdwdbOnBy9PloVAiea7R3FsNdiBvWXzsEmJKy2sKfQ==
X-Google-Smtp-Source: AGHT+IHMr99GXsrMs4nuqo2xVwfGwSOJ273k7IA+UZ88+Te226z3qaGuhJSGNrPfnHDc84n7Pd/zAQ==
X-Received: by 2002:a17:907:97d5:b0:aba:246b:3954 with SMTP id a640c23a62f3a-abf268263f9mr244588066b.47.1740738542502;
        Fri, 28 Feb 2025 02:29:02 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6ed8d5sm271458266b.101.2025.02.28.02.29.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 02:29:01 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so8412a12.0
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 02:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwFi7NbycPABKIY880TyokYp0lr6pSGlsMJfEU/4XqsuwPvH38j2XYCZRPflnDwoeYIhhCSTHnz9/8ww==@vger.kernel.org
X-Received: by 2002:aa7:de02:0:b0:5e0:eaa6:a2b0 with SMTP id
 4fb4d7f45d1cf-5e4e5170fb5mr58690a12.5.1740738540504; Fri, 28 Feb 2025
 02:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com> <87bjw9s4s3.fsf@gmail.com>
 <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
 <CAAFQd5DS2x3sX59EdkTEMuO=eXc=Q0jD44EUwMisP6ocWz11qg@mail.gmail.com> <bgnkzjpegpmif7gohoijt42rku6jruovjsxscg75dprdz5ek2i@ntfh2yyjyiry>
In-Reply-To: <bgnkzjpegpmif7gohoijt42rku6jruovjsxscg75dprdz5ek2i@ntfh2yyjyiry>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 28 Feb 2025 19:28:43 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BihpFYgqvKta7ULMAVSMTy3kd6iR6Mo4ea9Ci935EFMA@mail.gmail.com>
X-Gm-Features: AQ5f1JqDA8fCcluEWQ8PbLmXiOugq2U0_Riaa619CBxdwyIQsImrMMMyouCy8M0
Message-ID: <CAAFQd5BihpFYgqvKta7ULMAVSMTy3kd6iR6Mo4ea9Ci935EFMA@mail.gmail.com>
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 7:18=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Tomasz
>
> On Fri, Feb 28, 2025 at 07:00:57PM +0900, Tomasz Figa wrote:
> > Hi Jacopo,
> >
> > On Fri, Feb 28, 2025 at 2:11=E2=80=AFAM Jacopo Mondi
> > <jacopo.mondi@ideasonboard.com> wrote:
> > >
> > > Hi Mikhail
> > >
> > > On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
> > > >
> > > > Hi Laurent,
> > > >
> > > > On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@idea=
sonboard.com> wrote:
> > > >
> > > > > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> > > > >> Currently, the rkisp1 driver always uses coherent DMA allocation=
s for
> > > > >> video capture buffers. However, on some platforms, using non-coh=
erent
> > > > >> buffers can improve performance, especially when CPU processing =
of
> > > > >> MMAP'ed video buffers is required.
> > > > >>
> > > > >> For example, on the Rockchip RK3399 running at maximum CPU frequ=
ency,
> > > > >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer=
 to a
> > > > >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when =
using
> > > > >> non-coherent DMA allocation. CPU usage also decreases accordingl=
y.
> > > > >
> > > > > What's the time taken by the cache management operations ?
> > > >
> > > > Sorry for the late reply, your question turned out a little more
> > > > interesting than I expected initially. :)
> > > >
> > > > When capturing using Yavta with MMAP buffers under the conditions m=
entioned
> > > > in the commit message, ftrace gives 437.6 +- 1.1 us for
> > > > dma_sync_sgtable_for_cpu and 409 +- 14 us for
> > > > dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> > > > buffers in this case is more CPU-efficient even when considering ca=
che
> > > > management overhead.
> > > >
> > > > When trying to do the same measurements with libcamera, I failed. I=
n a
> > > > typical libcamera use case when MMAP buffers are allocated from a
> > > > device, exported as dmabufs and then used for capture on the same d=
evice
> > > > with DMABUF memory type, cache management in kernel is skipped [1]
> > > > [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3],=
 so
> > > > DMA_BUF_IOCTL_SYNC from userspace does not work either.
> > > >
> > > > So it looks like to make this change really useful, the above issue=
 of
> > > > cache management for libcamera/DMABUF/videobuf2-dma-contig has to b=
e
> > > > solved. I'm not an expert in this area, so any advice is kindly wel=
come. :)
> > >
> > > It would be shame if we let this discussion drop dead.. cache
> > > management policies are relevant for performances, specifically for
> > > cpu access, and your above 7.7ms vs 1.1 ms test clearly shows that.
> > >
> > > >
> > > > [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/vid=
eobuf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> > >
> > > I would like to know from Hans if the decision to disallow cache-hint=
s
> > > for dmabuf importers is a design choice or is deeply rooted in other
> > > reasons I might be missing.
> >
> > When DMA-buf is used, the responsibility for cache management is
> > solely on the CPU users' side, so cache-hints don't really apply. It's
> > the exporter (=3Dallocator) who determines the mapping policy of the
> > buffer and provides necessary DMA_BUF_SYNC operations (can be no-op if
> > the buffer is coherent).
>
> This all makes sense.
>
> I take it as, for libcamera, users of the FrameBufferAllocator helper
> (which first exports MMAP buffers from the video device and the
> imports them back as DMABUF) won't be able to control the cache
> policies.
>
> Now, in the long term, we want FrameBufferAllocator to go away and
> have either buffers exported by the consumer (likely DRM) or by a
> system wide buffer allocator (when we'll have one) and have the video
> devices operate as pure importers. But for the time being the
> "first export then import" use case is possibile and valid so I wonder
> if we should consider measures to allow controlling caching policies
> for this use case too.

Hmm, I may be missing something, but if FrameBufferAllocator does the
allocation internally in libcamera, why couldn't it use the
V4L2_MEMORY_FLAG_NON_COHERENT REQBUFS/CREATE_BUFS flag?

Note that however, once the buffer is allocated and mapped once, on
many architectures it must keep the same mapping attributes across the
different mappings, due to how the memory hierarchy works. (Not sure
if this is what you are asking for here, though.)

>
> >
> > Best regards,
> > Tomasz
> >
> > >
> > > I'm asking because the idea is for libcamera to act solely as dma-buf
> > > importer, the current alloc-export-then-import trick is an helper for
> > > applications to work around the absence of a system allocator.
> > >
> > > If the requirement to disable cache-hints for importers cannot be
> > > lifted, for libcamera it means we would not be able to use it.
> > >
> > >
> > > > [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/vid=
eobuf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> > > > [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/vid=
eobuf2/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d=
#n426
> > > >
> > > > --
> > > > Best regards,
> > > > Mikhail Rudenko
> > > >
> > >

