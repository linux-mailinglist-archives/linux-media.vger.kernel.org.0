Return-Path: <linux-media+bounces-27223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD24DA49885
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 12:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D9E91887210
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 11:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEBD2620C3;
	Fri, 28 Feb 2025 11:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQdL2a/K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CA825D91B;
	Fri, 28 Feb 2025 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740743016; cv=none; b=rpG/ZzgrQ8EhjAPkGCASTKhKge0DaL0Ff0VkwMVSPH1fYIgrdIxJXjqgF0sxCuVnwtuFPhw7xMV/8fYevDqxuWSPcej8x61Wkb6ktizJxLEp1b6E2g81fUpD4W92mdYUQsgCOugXvOBdwnxBPxLXpH2R19dpwABolkFopzFRIzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740743016; c=relaxed/simple;
	bh=ISd+R1CNst8eSW/QMkr9HB7kac6KhiQiUPESNAvzryw=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=lWXWVvNrSDKUCymq+Wcr1iKdpCO5uJ/4RzRWoi8QfcG6D0I3GKzyF7YPKl6wU3znOR/aEHQTry5sIZa/hdQhKZJx/ofbTAeNRnJJrepV0UmVwRPptwZdOwb4f3I3LqPCdAKtBX5UN84lOgjPEM0hLHD9JT2381sPqEEzvF9fVMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQdL2a/K; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30613802a04so21383751fa.2;
        Fri, 28 Feb 2025 03:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740743012; x=1741347812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yky+MpWpSqBmuiHoH6G890ahUf3ki5Lz5PCO4fqT27Q=;
        b=lQdL2a/KVxYNHHskyDldLg2uv3DLVj7vXCJzldiQoMF1kpyfPgc10cBDuJyObgQFR9
         BfVfEbdIctzyYWNe460dkr8JXhoCMQOunUOprhvG6SATI9PsSBarVVGHC5AWPOroNGof
         rwdSxHK1+BX3kzYRcpZNnUqmjzXLttEaTU7IpnSHtuQt5twjN4qxlxnJgQL4uftKRJ0r
         r0xTwwlv8SPXLoHwf6t8aOBFc8wMkZ3KBWH5q44DQ1sKZ/NIZhgkfWSlAJDX05LwW7dq
         VEsnjWYIoIs4c/if35GasqjyxdNYELVwYfpR0AtQZWJWa6V+4/o7csmg7fbuG3D+Ra2T
         5jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740743012; x=1741347812;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yky+MpWpSqBmuiHoH6G890ahUf3ki5Lz5PCO4fqT27Q=;
        b=e7RWNCUYN4LBDc4GevP18rsrmGIsR9LcPZSNfBFACuKDYvAClcMvLrWHi47btARb1E
         AAbcwkQ4+5rULXiNji12IVme1UOBcRENxWtQC9InR5qpLR2vXktrKi+8De+R9PENWcWb
         dFE8jURMivYoF2hL3y3h+XTmXAsqP1O01BNMGDzIE3LJXSqxgvyZpfho+9miGUTCTV0D
         gwv9+Chj76KmQH4x+zVYEAvN15wWTVtdvEOQSU5+aYOdIBYd1PbZUY+vSFd1HOowE3UK
         AGhWqAxcrdLBS84w+9aJ63xlrEK/EDqdoA+OC9dtIahStTneJE/B7joSLFe1BhRBCVOq
         d7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTp4AqQhl1RfhIhi7VV5ezhtkEopw3r+6jxqNfBctbmqv8X4k50LZf9DeF1vc4vXRsFM4LC8M3mjyMk4s=@vger.kernel.org, AJvYcCVSWw2I5sUC6cvjcBTWHXxgNOvGZlvEhkPX8r2nnZdo2ZzgKFjTI/YzpVPBPeiVo1odZhODm8D8fhCcDnw=@vger.kernel.org, AJvYcCXwBv8BtvyqSbO0wxivRfd4lawOcmjWpKWKaSB2EIIy38AefQfIIYJ34I3nZoKPeiP8+A+bBM73@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2hwiU3wmhQnTi4OwlxIUyV3m3bnkll9gstqK+CtivZwzgWDCw
	mJrTbsn69JNK/1uN7TLqeKY0wNHg1ZCakxsPq1s5kERgzQw1embX6Egn951z
X-Gm-Gg: ASbGncsJJJQMe06Mudd4n4yqA0hBSjQWhVyX7qpaWJcv0WkKs4bH4Q30kHv7qfWPqLu
	imT8Kt/ToMZ3HVhw94tTTUT0t39muIu+AqCQgx9U7Dmu5j4qEgL+dIUMqPLk2j+1yf8OoCNEFyY
	VV7kufgjjGg/R103tOCEf3QxZidAtUqW0iEIyg8EkFa9GRX/+88bsFuEJ3ZNi56fdmZ4z3fE2Zl
	c5meh8nzlgLNeS0NTHfRcHNVKXPx0uHUy7yLW7KcUx1ld+wHhCtH/Pnv+imaMBiTK2F1HDef1cj
	A4YQqTo7Hw0fvi5eRjzymrEdmNzp1Bv6uHkVbWveJvQqbRElztGDffy16YtoBf9dWugNdTVJoM2
	GIwSTODDDiPI6hQ==
X-Google-Smtp-Source: AGHT+IHOs9vqantuNod90ERM5xB3i1bFO2RtYdojT8XjyxXMwXaQtOUpbPRNc5KFH73oqV4zi5nIyA==
X-Received: by 2002:ac2:4e14:0:b0:545:93b:30bf with SMTP id 2adb3069b0e04-5494c37d894mr1314384e87.41.1740743011725;
        Fri, 28 Feb 2025 03:43:31 -0800 (PST)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441740ffsm466848e87.50.2025.02.28.03.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 03:43:31 -0800 (PST)
References: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
 <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com>
 <25beec7ea929b624d845f5ba4abce6267974ed82.camel@ndufresne.ca>
 <CAAFQd5A4YOaSCn=xe7OM-hPKcUhqkD5hTiMUo5F9pwhKNFJ2Lg@mail.gmail.com>
User-agent: mu4e 1.10.9; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Dafna Hirschfeld
 <dafna@fastmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
Date: Fri, 28 Feb 2025 14:41:34 +0300
In-reply-to: <CAAFQd5A4YOaSCn=xe7OM-hPKcUhqkD5hTiMUo5F9pwhKNFJ2Lg@mail.gmail.com>
Message-ID: <87h64eb8gw.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 2025-02-28 at 19:25 +09, Tomasz Figa <tfiga@chromium.org> wrote:

> On Fri, Feb 28, 2025 at 12:30=E2=80=AFPM Nicolas Dufresne <nicolas@ndufre=
sne.ca> wrote:
>>
>> Le mardi 28 janvier 2025 =C3=A0 23:35 +0300, Mikhail Rudenko a =C3=A9cri=
t :
>> > When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
>> > commit 129134e5415d ("media: media/v4l2: remove
>> > V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
>> > vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
>> > no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
>> > introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
>> > V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
>> > no-ops, making cache maintenance for non-coherent dmabufs allocated
>> > by
>> > dma-contig impossible.
>> >
>> > Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
>> > {flush,invalidate}_kernel_vmap_range calls to
>> > vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
>> > buffers.
>> >
>> > Fixes: c0acf9cfeee0 ("media: videobuf2: handle
>> > V4L2_MEMORY_FLAG_NON_COHERENT flag")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>> > ---
>> >  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22
>> > ++++++++++++++++++++++
>> >  1 file changed, 22 insertions(+)
>> >
>> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> > b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> > index
>> > bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..146d7997a0da5989fb081a6f28c
>> > e0641fe726e63 100644
>> > --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> > @@ -427,6 +427,17 @@ static int
>> >  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>> >                                  enum dma_data_direction
>> > direction)
>> >  {
>> > +     struct vb2_dc_buf *buf =3D dbuf->priv;
>> > +     struct sg_table *sgt =3D buf->dma_sgt;
>> > +
>> > +     if (!buf->non_coherent_mem)
>> > +             return 0;
>> > +
>> > +     if (buf->vaddr)
>> > +             invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>>
>> Am I correct that this is mostly to prevent the kernel from reading
>> back old data from the cache after an application or other driver did
>> CPU writes ? If so, can't we restrict that to DMA_TO_DEVICE and
>> DMA_BIDIRECTIONAL ?
>
> Note that this function must also synchronize between the user-space
> and kernel mappings, where the DMA direction doesn't really matter.
> Also it's unlikely for it to be called when not needed - why would one
> begin a CPU access before the DMA, when the DMA is FROM_DEVICE?
>
>>
>> As for pending kernel writes, they should have been flushed before the
>> buffer is made available for dequeue.
>
> There is no implicit flushing for imported DMA-bufs. All the flushing
> needs to be executed directly by the CPU accessors by surrounding the
> access with begin and end CPU access, be it in the kernel or
> userspace.
>
>> And any access while a buffer is
>> queued is concurrent access, which is expected to have undefined
>> behaviour.
>>
>
> Correct.
>
>> > +
>> > +     dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>>
>> Isn't there a link to make between buf->dma_dir and direcction before
>> calling this ? Also, shouldn't we use direction insead of buf->dma_dir
>> to possibly limit the scope ?
>
> Oh, yes, that's a good catch.

Indeed, will fix this in v4.

> It should be |direction| passed here and
> not |buf->dma_dir|, since the former determines what CPU access will
> be done.
>
>>
>> > +
>> >       return 0;
>> >  }
>> >
>> > @@ -434,6 +445,17 @@ static int
>> >  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>> >                                enum dma_data_direction direction)
>> >  {
>> > +     struct vb2_dc_buf *buf =3D dbuf->priv;
>> > +     struct sg_table *sgt =3D buf->dma_sgt;
>> > +
>> > +     if (!buf->non_coherent_mem)
>> > +             return 0;
>> > +
>> > +     if (buf->vaddr)
>> > +             flush_kernel_vmap_range(buf->vaddr, buf->size);
>> > +
>> > +     dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>>
>> Similar questions for the end_cpu_access implementation.
>
> Yeah, same here.

Noted, will fix.

>>
>> Nicolas
>>
>> > +
>> >       return 0;
>> >  }
>> >
>> >
>>


--
Best regards,
Mikhail Rudenko

