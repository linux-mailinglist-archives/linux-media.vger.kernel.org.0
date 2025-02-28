Return-Path: <linux-media+bounces-27211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CA1A49730
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 11:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AF00165F58
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 10:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE5825F984;
	Fri, 28 Feb 2025 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P+Xm1NUN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD3D25F7B3
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738359; cv=none; b=SSWQlILD+orgHlELoLel9A17DKqX9KftF9H5EJxpxINwV8hW28kCljUSkoby0yaLyKbHzNVihLQ4l/b/XdMj3BwAL/fq5WX3K6fwRHfXsYVy9ZFubyGHnOoKy5P1zxIpHQ/l4dWm899is/KobVxstFJeoqLMcHD4iPvGvDRvxsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738359; c=relaxed/simple;
	bh=bnYGrNktnSSLWrDFtsq76cPCF2tBeDvXcfc8CAy88ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/MZflM2FfWBZ+nv6wH/HXYPpAm0sJ83JkAFO+LrHkx96PYoRlvhTIDHw0UQnRaribSqbeoB19t1UvFXRifsS4YtRI5Pe/SOBpmBrWggY5qFhomyUu9f9tjbgImc+X2wWfs96ukkbnDy9lWcfx1oERn9gsqzhs/VDpZewaYBYQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P+Xm1NUN; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so3200744a12.0
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 02:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740738354; x=1741343154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb9NUQhb3bplKyawSYK7wGLTz8Fx3itEvvEthZZH/DE=;
        b=P+Xm1NUNlgkPzFRH9NaMcnSgWOJ6aYAhI3g+dKDLmgQ7oGdKsa85r7eH5+DVt83pgH
         c8vHm+IQ9OHMQDORwITam5d8F1AhbKZJtYbZEDFE4q3uElFTnK1EO3tkgWN9rCIeUCu5
         weJ+73SXK8AtQK96any6ADEGh2twAgqswCkO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738354; x=1741343154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nb9NUQhb3bplKyawSYK7wGLTz8Fx3itEvvEthZZH/DE=;
        b=DJ/Vgz13uQ44nyuOozH6OOBjqYp4+dVykfNqMdQ4mCMeev5RdAXU/1d+Xc2d1oTOzH
         ijkErMDI014hAwhKVk2Tqi36MuzCUUr+gNf1U2Ac1nO20NrVgLX+x7lu1IaT7tt0XYh/
         6rHN1oK8IeKg5iAx9XOamKRdUyAU0KnYNitXtbqv8FdIK5Z0im+sgp0sCaC6Su5oI4Nq
         6/GHbIC83JGeVLZcIe9/G2/UyXvjf1uggrVPtfqT6VnlnoxzR2rSO5tfs+dZwAjtQXdm
         KAW7gheCqP99/Kc8pdfrtw38WXtXczwB8OSwOe/CCTiBaTtULrICHavWOYvDpHBn5b13
         Twcw==
X-Forwarded-Encrypted: i=1; AJvYcCV4oea7iT/1exGlhIx3NH25D1EvtLuWvmUiR4NfxLAY0PfKvMVbVbKu37qqZfwRHaylpNfkiJpEbsjbfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy3jed5fXSz6EjUauY595wSlKjx2LxIkghJILlC7I97Om9Y0K3
	8UBerCgEK0ZOyv7V5S29GKZOc8AXhjOaR1skGTZtofyhQycCHY8vHsRz7IlzNdQJ7R3XEGEv4XD
	s1g==
X-Gm-Gg: ASbGncsb2/jD1JesiHOGgF4lkca1wnn8LMAvx7Is8sE6E/mywCBQ1YTc/N+Ix609Y6A
	S2p1pZUfMNA/aoyqf46zN+pbkC0nK7IeTJm+NElBfEg3/a4zD8Rve16dBeC3WHtWlNzIqcgul8e
	RbBsD3isVFWAkE9xKtK9OSHA7XBwoBtIm3eOysFDvAZLeh/zN+uXNfq+xG8C9wUOh7SYpWfWlJ8
	W/19qS7brYaF2tFGfKSxHB4uAxNKPIdR0nNzvRoRxzUeX40Vq/4TJ42kRIXfn67ygNlouETuadY
	logrKqaWcqUByuKLBVTAFozKs2/DcR3PPycghqNSEFwjBQ7bEuVPYd41XwHNpg==
X-Google-Smtp-Source: AGHT+IEz/I5C0zQMc+vRRa8fHXiLy2X9dF1LDTWV4KJnrQpdvjSZvJZU2cnnjzf6fwfrIg3VWNTx6A==
X-Received: by 2002:a05:6402:847:b0:5e4:cd5c:50f6 with SMTP id 4fb4d7f45d1cf-5e4d6afaf1dmr2075740a12.18.1740738354326;
        Fri, 28 Feb 2025 02:25:54 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb58f7sm2272952a12.57.2025.02.28.02.25.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 02:25:53 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ded4a3bf0bso9487a12.0
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 02:25:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUWQHNzIOJ+hA98l8CMKniePnnR7DN7j6sqASTavacKC8kGkaiqtJWX3DG3ptY62kF7jEHAjfegtm2nZQ==@vger.kernel.org
X-Received: by 2002:a50:d7dd:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5e4d74dea39mr77472a12.4.1740738351014; Fri, 28 Feb 2025
 02:25:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
 <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com> <25beec7ea929b624d845f5ba4abce6267974ed82.camel@ndufresne.ca>
In-Reply-To: <25beec7ea929b624d845f5ba4abce6267974ed82.camel@ndufresne.ca>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 28 Feb 2025 19:25:33 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A4YOaSCn=xe7OM-hPKcUhqkD5hTiMUo5F9pwhKNFJ2Lg@mail.gmail.com>
X-Gm-Features: AQ5f1JoHaD84fv2X5fHk6A_BWpTZQNcf1bz4WEEDQ8FkApfINlkKzBEV-PkKHU4
Message-ID: <CAAFQd5A4YOaSCn=xe7OM-hPKcUhqkD5hTiMUo5F9pwhKNFJ2Lg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
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

On Fri, Feb 28, 2025 at 12:30=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresn=
e.ca> wrote:
>
> Le mardi 28 janvier 2025 =C3=A0 23:35 +0300, Mikhail Rudenko a =C3=A9crit=
 :
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
> > bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..146d7997a0da5989fb081a6f28c
> > e0641fe726e63 100644
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
> Am I correct that this is mostly to prevent the kernel from reading
> back old data from the cache after an application or other driver did
> CPU writes ? If so, can't we restrict that to DMA_TO_DEVICE and
> DMA_BIDIRECTIONAL ?

Note that this function must also synchronize between the user-space
and kernel mappings, where the DMA direction doesn't really matter.
Also it's unlikely for it to be called when not needed - why would one
begin a CPU access before the DMA, when the DMA is FROM_DEVICE?

>
> As for pending kernel writes, they should have been flushed before the
> buffer is made available for dequeue.

There is no implicit flushing for imported DMA-bufs. All the flushing
needs to be executed directly by the CPU accessors by surrounding the
access with begin and end CPU access, be it in the kernel or
userspace.

> And any access while a buffer is
> queued is concurrent access, which is expected to have undefined
> behaviour.
>

Correct.

> > +
> > +     dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>
> Isn't there a link to make between buf->dma_dir and direcction before
> calling this ? Also, shouldn't we use direction insead of buf->dma_dir
> to possibly limit the scope ?

Oh, yes, that's a good catch. It should be |direction| passed here and
not |buf->dma_dir|, since the former determines what CPU access will
be done.

>
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
> > +     dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>
> Similar questions for the end_cpu_access implementation.

Yeah, same here.

>
> Nicolas
>
> > +
> >       return 0;
> >  }
> >
> >
>

