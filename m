Return-Path: <linux-media+bounces-24749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDFCA11C04
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 09:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6299B1881C05
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 08:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A862D23F28F;
	Wed, 15 Jan 2025 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SsOkEGel"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773223F28E
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736929926; cv=none; b=uU9jNKHwqvIqKU3Uu0C6H3I/heOwG3DSGCpzd9u9PhLLE4ScH/L2VIzpNNxtoI/0Cnzlgt2pvD0HaOkpT5An0/xZSaJtgproeBcZmLSXStsx2QdTHWRElCFNrPCtqNAQBNcuHipJ6+2lK2FiwqumrBRjG2i2hKQ7lA0NhlOFadI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736929926; c=relaxed/simple;
	bh=e/vmzoS0u/8ccSmr3RVub0XbT2dTO7nfDBGpXZSEEes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iV4X4kBk06LfYtF0EJjYjWom8B7CAfhmUaGxl3l1gz/HFmisada4EKikjAWwVvcQnlYSF0kwa5O7+Yp6vv0s+RXCAFi0y0bSabXk85jatMk6TCS7qd4PFmY7ISNKFQoRooC5vVsUdL3mcIgc9/1MUh+iaYuo7y1GkAeLDbVa/GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SsOkEGel; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so9440584a12.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 00:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736929922; x=1737534722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/vmzoS0u/8ccSmr3RVub0XbT2dTO7nfDBGpXZSEEes=;
        b=SsOkEGelppRj0MbklfxGfOTV13BFsw8R5/zmQgqWhypDt6GI2pTsC6wbUtfvsb/p/n
         qDhw2mYrqDuAxZe5LANfzfKfgd/F0XiSYnV15KudThUWfLveliUFQ9zBg7nVTHSx8erO
         OL0UCMyepiWt6RiiS9wnIW7lEcdBOrbqupLUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736929922; x=1737534722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/vmzoS0u/8ccSmr3RVub0XbT2dTO7nfDBGpXZSEEes=;
        b=guOZ8TepQDn0K1kD4kna1FNZKkZQAzWXaagTpXV98YE6exIeRyatgWxgzuP/AOzwIO
         2vvStHWAzp9B5+sVSIJHNEbbTP5Uq4DWaqyzqqROyBG6s4lv+5MjL/Fa8dNUw7YeVLYY
         gTdfpYSBbZqj/eRnPBsKQVG+V3sAcRjoJqQVEdbJLagHxhEA3SamKpVVMqRWfnaQIgSc
         SRjDVqZjcdBlFehsWkUqUDaTgIRpnlhSqvUnplaNJ0zbfrFsGhrESPKnvwnNmx7p5kRi
         7YpEnLKyOt9BfBVRQy32UABNoEvmR4ecB6IC0wOKUulJAY0hdPZgHHILL9Pzj9gjOAdL
         sqdw==
X-Forwarded-Encrypted: i=1; AJvYcCXVD86gpVLdqOzGWSYfEkQA6JW2EH63o7LXufpk657ZrUs5Er2iGCa6DGwK2G39YFrKjgUWD/y6czm0PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX9pxmsYA9xI7j6LC1E+IsSBqhAsBBY4DAyMKt+zAgtf4HZ/hH
	Ms6O4cljVhtBlElOgSKKQG2U/0o7WuDglGl8FsV8+RGBtSepT6pjTFZl/P+jI5u1wVg+XHYXFef
	pPMV0
X-Gm-Gg: ASbGncuvEbvLQswcak2ymURbB8fadFMElBQmS0rCM+6y8gEpsWzZNCUT67TRZK+H3DG
	YzbgVJsbjNXkANDYzlb9VYgv2URwZaX63Z/VxW1PHDRHR/CoMUOi3pCWNKk+eTI5a2FSyKxMe2B
	M0lT7rGf8UOqDNUMZZG5UMrCG7X7HJZ5yPF9YPC9LnYehEuKASEmU+h5OnRDeij618EA1nNbdSj
	SLctqifGzRMwkiWt4XSZNq8GIG67RYpLokwyHPV9rPkgy44AK0FejEPTuIiU+1HxnGJDCICyh2Y
	IFq0zK/P+yMrEWuc
X-Google-Smtp-Source: AGHT+IENrjWGQ1iD1znmQc3NRPkHX1bfFONBPnBw1GKz3C4CgBWR8SWCn99lb0bakxfjdPkqj+ue5A==
X-Received: by 2002:a05:6402:2746:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5d972e1c54emr71249430a12.17.1736929920699;
        Wed, 15 Jan 2025 00:32:00 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b2181sm726218366b.162.2025.01.15.00.31.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 00:31:59 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so14991a12.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 00:31:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUO4o1n/Irkv2HmzSwyYM4mu7HOqHUmlhrYQw5e4x9nVaCrRGJLBVTEiMNjYxu/VRyQo9NpqgMjSyuApA==@vger.kernel.org
X-Received: by 2002:a05:6402:4c3:b0:5d0:acf3:e3a6 with SMTP id
 4fb4d7f45d1cf-5da0dd676femr51506a12.1.1736929919103; Wed, 15 Jan 2025
 00:31:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com> <87bjw9s4s3.fsf@gmail.com>
In-Reply-To: <87bjw9s4s3.fsf@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 15 Jan 2025 17:31:42 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ACseSBg4WZnUnbtwh+i63xcKMBFKnfc4_Aqfmnz0s=7A@mail.gmail.com>
X-Gm-Features: AbW1kvaBA4VZ7jIsEwQbxJoMrVzvOgL53cb9RAbkq1doElWIr6HOcvTWYI_kM7k
Message-ID: <CAAFQd5ACseSBg4WZnUnbtwh+i63xcKMBFKnfc4_Aqfmnz0s=7A@mail.gmail.com>
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikhail and Laurent,

On Wed, Jan 15, 2025 at 2:07=E2=80=AFAM Mikhail Rudenko <mike.rudenko@gmail=
.com> wrote:
>
>
> Hi Laurent,
>
> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonboa=
rd.com> wrote:
>
> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> >> Currently, the rkisp1 driver always uses coherent DMA allocations for
> >> video capture buffers. However, on some platforms, using non-coherent
> >> buffers can improve performance, especially when CPU processing of
> >> MMAP'ed video buffers is required.
> >>
> >> For example, on the Rockchip RK3399 running at maximum CPU frequency,
> >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
> >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
> >> non-coherent DMA allocation. CPU usage also decreases accordingly.
> >
> > What's the time taken by the cache management operations ?
>
> Sorry for the late reply, your question turned out a little more
> interesting than I expected initially. :)
>
> When capturing using Yavta with MMAP buffers under the conditions mention=
ed
> in the commit message, ftrace gives 437.6 +- 1.1 us for
> dma_sync_sgtable_for_cpu and 409 +- 14 us for
> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> buffers in this case is more CPU-efficient even when considering cache
> management overhead.
>
> When trying to do the same measurements with libcamera, I failed. In a
> typical libcamera use case when MMAP buffers are allocated from a
> device, exported as dmabufs and then used for capture on the same device
> with DMABUF memory type, cache management in kernel is skipped [1]
> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
> DMA_BUF_IOCTL_SYNC from userspace does not work either.

Oops, so I believe this is a bug. When an MMAP buffer is allocated in
the non-coherent mode, those ops should perform proper cache
maintenance.

Let me send a patch to fix this in a couple of days unless someone
does it earlier.

Best regards,
Tomasz

>
> So it looks like to make this change really useful, the above issue of
> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
> solved. I'm not an expert in this area, so any advice is kindly welcome. =
:)
>
> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426
>
> --
> Best regards,
> Mikhail Rudenko
>

