Return-Path: <linux-media+bounces-27559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02DA4F87B
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9712F18903CE
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 08:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10901F4289;
	Wed,  5 Mar 2025 08:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eWgeGFu/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F741E5B9E
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741162376; cv=none; b=QVtOPVGyCCbUCyB6EP1luYy0FN1YSaWO5Na/0oXSBlsvkRz3XqybCdfNacfx2/fxuEjdvMPwEd0UlnFLFcZ3TUZMLBDY7A6BZC0aGrjHUIOHwt7MeDO+PbZW3CY7EJjoOn5nY5YWpHHl2sFraEoyi0AXdsKj8i3azL1SltNlvLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741162376; c=relaxed/simple;
	bh=C0/8hW1TkNk5j1MdVgSV3Ikl0qmLYuEJPKaklUIObiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTzNPyaGxTIXGc5/0rhYVSAa4WSM/3VNya8R8TyG6i/XIfyQ0Kg2rc2ngbA+tpV9AcZPdU5ewB3RPPg53gd5feAx7YMSvpjr1dxf+ftnzdwdTbfF8Y80nVQVnrs2VmsKUemykaglZEov+bpuK5zn/jZiptzQlWffRKnYyTR+j/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eWgeGFu/; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab771575040so99717266b.1
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 00:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741162372; x=1741767172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXA/TkGXM5NxtIFR0Rkc5MLIvPVEhtWeAVEIdjIqSAA=;
        b=eWgeGFu/1Kedmj4Kzd304QUXKg+sJRL+Bb06jsRnGMWCiid6NcX15byRJPQQlWAW9+
         hCdfYHmyrXaVnN7Oabe31N1Ou3jQQgoEmXKRHeKf6msvSwOqZqo6LMDK9rIOzOiu4JCn
         nRMgsWJd6sgosZvojlVX5UUmscTuiav8Lue1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162372; x=1741767172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXA/TkGXM5NxtIFR0Rkc5MLIvPVEhtWeAVEIdjIqSAA=;
        b=HlMmyl8pf4bUsxGo3hK+Pg8C6MyDoblE2vi6Cc7MfQY2f3PdNt+d3zjuVaKjAEFFIK
         TKfSJv33ybRkR17h4j7VJnuHlA9Ln3T1ug6D0aTtdCBMuxY6LZ5LDyST6YjMdfEsB3Y0
         xo/ZQ6CEQ/MWZfF1aUoA+FmT2AO6/8DQ+j2fYl9Duo2emt3bSG0toiZme88kYXhu/8+d
         Rrb+03GjIM0vv4JN7VQozFJUAtEvM2oXIjJex7ooPg0q6tN1BhTbdTF/boKVLuzjf3w6
         4GL2SkhLXG33ioCOXEvWFSSVNCdc4tdy/3ceV6I4KcKb4fOrajyz/7Nhkr4kU6uLR7cS
         fgrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0Y48lTXpEeRWW1AFl5vQGPSFhVEP6uFsRLYwbfT4Nd+nlQ0Sc9zGTBTgosKAsSAyHlJOAorfZTEJuuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQujLlZVOzi+P0KWPTjteMTqN9bNX7td9y8vT8zKGTPEB1tXts
	4OJ2U2Qx7EDhQ0hcrciE3ivq6RWgDRY+CzcyPZ+lFDtxqSHbJiWzte8kg9iB+0+8fX43XDgGxkx
	nGw==
X-Gm-Gg: ASbGncstJDnyL1QymEdhmOJ7nnYtr11Qyhi9yTWMgzLKWtMn5/w9SlgDYpIOk2nN2WO
	WULn3b5sYSozFe0l7EyEzEljz1Wrs155iIjEcvfO5bsVUvBNhJcWgIuu7fiwWfvoYB+hEzq1rK8
	VqQXHPGcTUOxWVsyERmXIH0KqJGU3WpFvLo2EYnkn/L8wp4wxJ4aNrdhegqnNwlo7FxuitBEHGr
	odf2lOZdWnUnM3ftZjHxdRmYgPcXJ2jgxdh/2mLw7uoWbVL1b6suEnGeJ0o4t1aBt5RNyDftxY1
	0+LMFIqvXDThX6zQP9EOrgBEoh8oxzMw01FPVUiJK0R9tcqCzFalziE4dOuTofkxuGXMaFIbISi
	rsd4U
X-Google-Smtp-Source: AGHT+IGJIQYD46EmphkiQtq1eT9vNZ9HA/3bOliYkRas0r2OcBYWjjNq8aTdi6KSZsQJhjM9jXklRA==
X-Received: by 2002:a17:906:6a15:b0:ac1:ea5c:870e with SMTP id a640c23a62f3a-ac20f013ec9mr190370666b.29.1741162371881;
        Wed, 05 Mar 2025 00:12:51 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1ea18e32csm304489366b.137.2025.03.05.00.12.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:12:50 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so7225a12.0
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 00:12:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5AE1o+4+Aw6tJ5p3xrq1Q1biGg/TYX7F2+9gEbB7rUqlWAOBM9cOG2lhxMj5b8CBHk9S226Jq/aYWMA==@vger.kernel.org
X-Received: by 2002:a05:6402:682:b0:5e0:8003:67a7 with SMTP id
 4fb4d7f45d1cf-5e59f582d2bmr77034a12.0.1741162370247; Wed, 05 Mar 2025
 00:12:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
 <20250303-b4-rkisp-noncoherent-v4-1-e32e843fb6ef@gmail.com> <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
In-Reply-To: <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 5 Mar 2025 17:12:31 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CMsgjs9t3Lp-r3rqHG1dFJV5bFEFciWmKU+vq=TtAOvA@mail.gmail.com>
X-Gm-Features: AQ5f1JqMbRJjwTyn4eHWZnhmp3yyPL8Rgkfmk3Wh029t14UkPKDmnySUbUDhBgc
Message-ID: <CAAFQd5CMsgjs9t3Lp-r3rqHG1dFJV5bFEFciWmKU+vq=TtAOvA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 12:24=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Hi Mikhail,
>
> Le lundi 03 mars 2025 =C3=A0 14:40 +0300, Mikhail Rudenko a =C3=A9crit :
> > When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
> > commit 129134e5415d ("media: media/v4l2: remove
> > V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
> > vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
> > no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
> > introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
> > V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
> > no-ops, making cache maintenance for non-coherent dmabufs allocated
> > by
> > dma-contig impossible.
> >
> > Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
> > {flush,invalidate}_kernel_vmap_range calls to
> > vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
> > buffers.
> >
> > Fixes: c0acf9cfeee0 ("media: videobuf2: handle
> > V4L2_MEMORY_FLAG_NON_COHERENT flag")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> > ---
> >  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22
> > ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > index
> > a13ec569c82f6da2d977222b94af32e74c6c6c82..d41095fe5bd21faf815d6b035d7
> > bc888a84a95d5 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > @@ -427,6 +427,17 @@ static int
> >  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> >                                  enum dma_data_direction
> > direction)
> >  {
> > +     struct vb2_dc_buf *buf =3D dbuf->priv;
> > +     struct sg_table *sgt =3D buf->dma_sgt;
> > +
> > +     if (!buf->non_coherent_mem)
> > +             return 0;
> > +
> > +     if (buf->vaddr)
> > +             invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>
> What would make me a lot more confortable with this change is if you
> enable kernel mappings for one test. This will ensure you cover the
> call to "invalidate" in your testing. I'd like to know about the
> performance impact. With this implementation it should be identical to
> the VB2 one.

I agree that it would be good to test that path as well. I wonder if
we could somehow do it with one of the vi* drivers...

>
> What I was trying to say in previous comments, is that my impression is
> that we can skip this for CPU read access, since we don't guaranty
> concurrent access anyway. Both address space can keep their cache in
> that case. Though, I see RKISP does not use kernel mapping plus I'm not
> reporting a bug, but checking if we should leave a comment for possible
> users of kernel mapping in the future ?

We can't skip it for CPU read access, because it may be the first read
after the DMA writing to the buffer, so we need to invalidate the
caches.

That said, on majority of systems this will be a no-op, because it
only applies to VIVT and VIPT aliasing caches + only when the kernel
mapping is actually used (the buf->vaddr mapping is created on
demand).

>
> > +
> > +     dma_sync_sgtable_for_cpu(buf->dev, sgt, direction);
> > +
> >       return 0;
> >  }
> >
> > @@ -434,6 +445,17 @@ static int
> >  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
> >                                enum dma_data_direction direction)
> >  {
> > +     struct vb2_dc_buf *buf =3D dbuf->priv;
> > +     struct sg_table *sgt =3D buf->dma_sgt;
> > +
> > +     if (!buf->non_coherent_mem)
> > +             return 0;
> > +
> > +     if (buf->vaddr)
> > +             flush_kernel_vmap_range(buf->vaddr, buf->size);
> > +
> > +     dma_sync_sgtable_for_device(buf->dev, sgt, direction);
> > +
> >       return 0;
> >  }
> >
> >
>

