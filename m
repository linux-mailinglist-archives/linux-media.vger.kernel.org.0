Return-Path: <linux-media+bounces-24792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6147A12670
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 15:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E51583A568F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 14:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928E286351;
	Wed, 15 Jan 2025 14:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WE+809zS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCD64594D
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 14:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736952394; cv=none; b=F4rZ1Pt2GDyFW8QMBpq2ls9I0eBMilzwQMLVUXA/QESQTThGRtdvPX92ionNvRj7YiTbgM+MBJ9dNXKr6BmJHT4OHQY+wdcZZ9cXu/1Rkh2kpoLGU2V5FD4C+oBGtUgbBuVCJ3ABNll3OR7IR3BIq2NX1CP+GbaB8hGQjh23U6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736952394; c=relaxed/simple;
	bh=MEk1wzatFckv+XFBb9mVlks+BhEPxcZKbCKJsmOb7yQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2r2eQZgqrj/TkNFyNw0tAAEJuuPCRUYlxpdrxCHIRZ9DXSRs7envso69T1nrCho2Z7QeL3JSNcHUGx6S2aJ+rpyYpyBadG992Fyeu3gXGupL5j9nwTQwO7QtThFw/itLMooK4RPx1a8BW1E9AQh+AAW0QURb/N8HkAICQzCsHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WE+809zS; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9e44654ae3so1085965366b.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 06:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736952390; x=1737557190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEk1wzatFckv+XFBb9mVlks+BhEPxcZKbCKJsmOb7yQ=;
        b=WE+809zSrMXKtY9RJy8jcoc7MEnr5n+DdF6fWxUZobSbFzEu/SQtjF+6G9uh51Cgch
         syeFM/yKchOFY8eUmlm565p5mdQBu0IBESdStTRchb8wsXzRvmIpE4amdV8hIdbjc3Yw
         /T97GFvddZS2S7IA4IUdFpGi/9PxYLMdZLFlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736952390; x=1737557190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEk1wzatFckv+XFBb9mVlks+BhEPxcZKbCKJsmOb7yQ=;
        b=xNFeKwPLgxcwNzEWKuU9DGfY7j+EYmfG3to0iUA2LyimTxl8byOO9w90r2HBXfXz/a
         SFyLkCkppomubEjOTOnlO5hOPpTrNp91wpJtUu4p/9V1IYmM5Qat4B0FkBCWyLnTouPA
         hlYofL6FPDCy5gZ1E02mAabjW8Rfe/G0+2TYPZvMI+TooV01BfJs3JmheFVMfsVs7071
         TEgQSounJnNgnshVesfOk01gUR5kFf6eMqRCf7mnEqROpK19+OF4wrnhcMKMO8pdQN/e
         fEwqudu5FSkytBeXmmZbAl1gWOC2aYakOjW+oFR2t0mrq4YfC4IF6eTSpa4lrFfBs5wX
         HJzg==
X-Forwarded-Encrypted: i=1; AJvYcCXQUeVU83w+NH5YiNnHpc39E+/eaMoYrj66DMFS9+prHDVpmRknENp9E5XDFRpMre8lLB8OsJov1shaBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtEf2rA9MvpNXvenhpCViwpB4eD+7aKX294Jd3Ic5YlMMaA/5Z
	3YKiqU+NWecMNNsxDslCnLE3C1oYbGbJdS8sC61MsTD7te85jjQd5pH5LxDZFx8iO+1YsCJXXbk
	vKDdB
X-Gm-Gg: ASbGncsbcY0xtAXMEHqzKiSCat4VR0ocBCc5jKDQ1of15/hELfVR9tANUzCmN7xA1Em
	1vfobvwtC3ccbwlolVyOUCv//d47UFrQ4A1/pIcnWCH8y4gF9aoSS/Nk6rssXpF3EumJtw0CIVS
	XyiiwCbfD1tfMqpsbvYWjoapa4WNpsh2vyGdrARcQNB4913srr244VrJhtKyCJ8I2HLRnc+p+sg
	19IoNdrVhCIu+OPudqmXpewV+hsyOI6KEZt20RIymzlW2cG604XWNHz0ID+ytsJ9OMu5PwKU97C
	pY66Bp6MSLkKcm/J
X-Google-Smtp-Source: AGHT+IFIop/3OW960gQJaMGE17+zZPU4LFQNfUV43D8bF21pdrn1ZoYuao0i5cPOCtJCRUmBgc7g2w==
X-Received: by 2002:a17:907:3e9f:b0:aae:bd4c:22c0 with SMTP id a640c23a62f3a-ab2ab70aeccmr2598819966b.19.1736952389946;
        Wed, 15 Jan 2025 06:46:29 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90da0casm771611766b.61.2025.01.15.06.46.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 06:46:29 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so17913a12.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 06:46:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEwl64C8I7dxNp75sHwpZ9XC4R1J0g2sWNVBrEq1iGpeaJ98BK4E1I7ccmcDBVwDLRLxOHJnqaAlwF9Q==@vger.kernel.org
X-Received: by 2002:aa7:da0c:0:b0:5d0:84a6:f1a1 with SMTP id
 4fb4d7f45d1cf-5da0c33b80emr97185a12.6.1736952388478; Wed, 15 Jan 2025
 06:46:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com> <87bjw9s4s3.fsf@gmail.com>
 <CAAFQd5ACseSBg4WZnUnbtwh+i63xcKMBFKnfc4_Aqfmnz0s=7A@mail.gmail.com> <877c6wryqn.fsf@gmail.com>
In-Reply-To: <877c6wryqn.fsf@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 15 Jan 2025 23:46:11 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C89M1TtpaCoK56Jd2Kq+h6+z552KY6cAqiDjMjDCFdWQ@mail.gmail.com>
X-Gm-Features: AbW1kvZL1qQQyr3bOi9vf1QLnv5SEz_sbYFAD3t65ooPIchi1WTeTxOdFsa8n5U
Message-ID: <CAAFQd5C89M1TtpaCoK56Jd2Kq+h6+z552KY6cAqiDjMjDCFdWQ@mail.gmail.com>
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 10:30=E2=80=AFPM Mikhail Rudenko <mike.rudenko@gmai=
l.com> wrote:
>
> Hi Tomasz,
>
> On 2025-01-15 at 17:31 +09, Tomasz Figa <tfiga@chromium.org> wrote:
>
> > Hi Mikhail and Laurent,
> >
> > On Wed, Jan 15, 2025 at 2:07=E2=80=AFAM Mikhail Rudenko <mike.rudenko@g=
mail.com> wrote:
> >>
> >>
> >> Hi Laurent,
> >>
> >> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideason=
board.com> wrote:
> >>
> >> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> >> >> Currently, the rkisp1 driver always uses coherent DMA allocations f=
or
> >> >> video capture buffers. However, on some platforms, using non-cohere=
nt
> >> >> buffers can improve performance, especially when CPU processing of
> >> >> MMAP'ed video buffers is required.
> >> >>
> >> >> For example, on the Rockchip RK3399 running at maximum CPU frequenc=
y,
> >> >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to=
 a
> >> >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when usi=
ng
> >> >> non-coherent DMA allocation. CPU usage also decreases accordingly.
> >> >
> >> > What's the time taken by the cache management operations ?
> >>
> >> Sorry for the late reply, your question turned out a little more
> >> interesting than I expected initially. :)
> >>
> >> When capturing using Yavta with MMAP buffers under the conditions ment=
ioned
> >> in the commit message, ftrace gives 437.6 +- 1.1 us for
> >> dma_sync_sgtable_for_cpu and 409 +- 14 us for
> >> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> >> buffers in this case is more CPU-efficient even when considering cache
> >> management overhead.
> >>
> >> When trying to do the same measurements with libcamera, I failed. In a
> >> typical libcamera use case when MMAP buffers are allocated from a
> >> device, exported as dmabufs and then used for capture on the same devi=
ce
> >> with DMABUF memory type, cache management in kernel is skipped [1]
> >> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
> >> DMA_BUF_IOCTL_SYNC from userspace does not work either.
> >
> > Oops, so I believe this is a bug. When an MMAP buffer is allocated in
> > the non-coherent mode, those ops should perform proper cache
> > maintenance.
>
> Thanks for pointing this out!
>
> > Let me send a patch to fix this in a couple of days unless someone
> > does it earlier.
>
> Now that we know that this is a bug, not an API misuse from my side, I
> can fix this myself and send a v2. Would this be okay for you?

I'd be more than happy :)

>
> > Best regards,
> > Tomasz
> >
> >>
> >> So it looks like to make this change really useful, the above issue of
> >> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
> >> solved. I'm not an expert in this area, so any advice is kindly welcom=
e. :)
> >>
> >> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videob=
uf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> >> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videob=
uf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> >> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videob=
uf2/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n4=
26
> >>
> >> --
> >> Best regards,
> >> Mikhail Rudenko
> >>
>
>
> --
> Best regards,
> Mikhail Rudenko

