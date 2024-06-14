Return-Path: <linux-media+bounces-13250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26590853C
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AB021F267CA
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 07:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87FA61494DE;
	Fri, 14 Jun 2024 07:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dlPFcJlI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B42114659D
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350910; cv=none; b=k3LRa5jMCMg5cq0CsD3ff6AkQ8Z1UD2KFfYXfxhM6fhKH5lRYTy8ozoi5O/y4WI3GgYynB5jFd/cnGbNIXaDo0gj8kjBFQAZAPBHolnwEw86KokrR8BHXc7rO2SvQWEwk1SozirEWiUD2I4vTnLQpLLBmgGghEOQve4GG+EbsuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350910; c=relaxed/simple;
	bh=/28A050dKbV6gFE3mAzZPuX+Y5P3G0oJLPvKyDp4ZR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFZ4uLYjs7L3NkfWiLPidhXX+Xa/591Ha14sHZ97Q0rbMdJosbajWa7472yx3hTU6ufv2N6cV00+C9R3JEq726WNXN5fHI65FYa0hKmOWH/RfthM24piWC08naLK+r7Jk5WKfMUOqBGcP2tGhoWD/atRBY+FWpLStbZt4kLIgVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dlPFcJlI; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-632597a42b5so4268597b3.3
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 00:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718350907; x=1718955707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvWKc6/joyQ4E80yWn/Q+ANvkgmcQUyP6OQcWOu9zBM=;
        b=dlPFcJlIs+AzfJl5Zuo9CzTtvVcXS8NCxMpkCSDKbMxns3trBhNkvYDAZ88KHaof3N
         quahxFuUM9vh6ejNpZWMPdW/2VUglAJuu9RyRqRNZo1gPyFUMqJ1y+2WPqgO9m1YSpEW
         4c5gisK4vl9C/wf4oPY8Rqx6p/QKUlIktXGeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350907; x=1718955707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvWKc6/joyQ4E80yWn/Q+ANvkgmcQUyP6OQcWOu9zBM=;
        b=sIJBV4a6dzU5fm6e0p6SQt4IWzdKadenHtaECaGaLFUBcp0sQ5g23iRI9F+MXIzqi8
         DwYt/6RdX05+cHbaQ50SfdFxq+VxHIHtvG7iW6uA84saucMqyrmzd2AuJkY3zS8s0wXD
         orBbo0kNJ+Q/368tGIs5W1Q+x7oBxGcFRWoLv5sn/hpuDzU3pEedB5Gyh1DMIxiWJ0Kt
         NX5wUathO6vsN+ZyRBHqHVAfrGsno4VS9aMburdH3MVs5FfOeBq6ZqGThQk01pq2XwKF
         AF4bHPvv0VypGnX32xaoeL7lHLiJjI+DJuG9t9BrqwpTQrrGnBLZS8Hp0vKOM5sddZm+
         SLWg==
X-Forwarded-Encrypted: i=1; AJvYcCUlMmuHdbwcUUuBmT3PhrUrcyFBm63j+VaVlL1pPS7uauTedcWBm/u/gL0cNi3Q926RVCJpt4QCyyQFoP72rqa86TOrjSqdsaC/Pfg=
X-Gm-Message-State: AOJu0YwFyrv2YF5BBrQFv9QlEw+3Ss6nKAh9jHKXPAJpEJicdyt5G7qo
	TsQp5B54viguLWoQztK8xRQM4LvkLUm75RI+YNdktP9qbe3DR3bT7ZjsR0slPoIpZYYxKTzapiu
	1RfE7lnLGyvWWv/0h4X9sL2FCHFwDLxfIUrhM
X-Google-Smtp-Source: AGHT+IGzZcuDufsR2+dtPbdCrvRb2ylrcMi7Ptm5TVeJbfXdHm9DRx5fvh2yYFMyXI85EcntYRVJNLP0qRGjLfJsrzk=
X-Received: by 2002:a81:ec04:0:b0:630:451c:d9da with SMTP id
 00721157ae682-63224feb4bdmr15133307b3.52.1718350907288; Fri, 14 Jun 2024
 00:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605074035.2620140-1-yunkec@chromium.org> <20240605074035.2620140-5-yunkec@chromium.org>
 <uvha4aeqwjo4q6pfkifxiu22i46rjlft5tob3j5lywiekfwyjn@zijbzqjxx76d>
In-Reply-To: <uvha4aeqwjo4q6pfkifxiu22i46rjlft5tob3j5lywiekfwyjn@zijbzqjxx76d>
From: Yunke Cao <yunkec@chromium.org>
Date: Fri, 14 Jun 2024 16:41:36 +0900
Message-ID: <CAEDqmY5tRhRVXW31kXZO94Swyb4GBEDhzeG+zbn==LmHcAdR2w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] media: videobuf2-core: attach once if multiple
 planes share the same dbuf
To: Tomasz Figa <tfiga@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks! I didn't know alloc_devs can be different within a vb2 buffer.
Updated in v4.

Best,
Yunke

On Wed, Jun 12, 2024 at 3:36=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> wr=
ote:
>
> On Wed, Jun 05, 2024 at 04:40:35PM +0900, Yunke Cao wrote:
> > When multiple planes use the same dma buf, each plane will have its own=
 dma
> > buf attachment and mapping. It is a waste of IOVA space.
> >
> > This patch adds a dbuf_duplicated boolean in vb2_plane. If a plane's db=
uf
> > is the same as an existing plane, do not create another attachment and
> > mapping.
> >
> > Signed-off-by: Yunke Cao <yunkec@chromium.org>
> > ---
> > v3
> > - Adjust the patch according to the previous patches to resolve conflic=
ts.
> > - Add comment to explain the purpose of the change.
> >
> > v2
> > - Separate out the refactor changes out to previous patches.
> > - Fix mem_priv check.
> > ---
> >  .../media/common/videobuf2/videobuf2-core.c   | 29 ++++++++++++++++---
> >  include/media/videobuf2-core.h                |  3 ++
> >  2 files changed, 28 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/=
media/common/videobuf2/videobuf2-core.c
> > index cbc8928f0418..90b65bf6c463 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -304,10 +304,13 @@ static void __vb2_plane_dmabuf_put(struct vb2_buf=
fer *vb, struct vb2_plane *p)
> >       if (!p->mem_priv)
> >               return;
> >
> > -     if (p->dbuf_mapped)
> > -             call_void_memop(vb, unmap_dmabuf, p->mem_priv);
> > +     if (!p->dbuf_duplicated) {
> > +             if (p->dbuf_mapped)
> > +                     call_void_memop(vb, unmap_dmabuf, p->mem_priv);
> > +
> > +             call_void_memop(vb, detach_dmabuf, p->mem_priv);
> > +     }
> >
> > -     call_void_memop(vb, detach_dmabuf, p->mem_priv);
> >       dma_buf_put(p->dbuf);
> >       p->mem_priv =3D NULL;
> >       p->dbuf =3D NULL;
> > @@ -316,6 +319,7 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffe=
r *vb, struct vb2_plane *p)
> >       p->length =3D 0;
> >       p->m.fd =3D 0;
> >       p->data_offset =3D 0;
> > +     p->dbuf_duplicated =3D false;
> >  }
> >
> >  /*
> > @@ -1374,7 +1378,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb=
)
> >       struct vb2_plane planes[VB2_MAX_PLANES];
> >       struct vb2_queue *q =3D vb->vb2_queue;
> >       void *mem_priv;
> > -     unsigned int plane;
> > +     unsigned int plane, i;
> >       int ret =3D 0;
> >       bool reacquired =3D vb->planes[0].mem_priv =3D=3D NULL;
> >
> > @@ -1427,6 +1431,23 @@ static int __prepare_dmabuf(struct vb2_buffer *v=
b)
> >               }
> >
> >               for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > +                     /*
> > +                      * This is an optimization to reduce dma_buf atta=
chment/mapping.
> > +                      * When the same dma_buf is used for multiple pla=
nes, there is no need
> > +                      * to create duplicated attachments.
> > +                      */
> > +                     for (i =3D 0; i < plane; ++i) {
> > +                             if (planes[plane].dbuf =3D=3D vb->planes[=
i].dbuf) {
>
> Oops, I just realized that we forgot about one thing. vb_queue has
> alloc_devs[] array with per-plane struct device used for DMA mapping
> API. If those are different, we can't reuse the attachment, so we need
> to check them here too...
>
> Best regards,
> Tomasz
>
> > +                                     vb->planes[plane].dbuf_duplicated=
 =3D true;
> > +                                     vb->planes[plane].dbuf =3D vb->pl=
anes[i].dbuf;
> > +                                     vb->planes[plane].mem_priv =3D vb=
->planes[i].mem_priv;
> > +                                     break;
> > +                             }
> > +                     }
> > +
> > +                     if (vb->planes[plane].dbuf_duplicated)
> > +                             continue;
> > +
> >                       /* Acquire each plane's memory */
> >                       mem_priv =3D call_ptr_memop(attach_dmabuf,
> >                                                 vb,
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-c=
ore.h
> > index 955237ac503d..053ced60595f 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -154,6 +154,8 @@ struct vb2_mem_ops {
> >   * @mem_priv:        private data with this plane.
> >   * @dbuf:    dma_buf - shared buffer object.
> >   * @dbuf_mapped:     flag to show whether dbuf is mapped or not
> > + * @duplicated_dbuf: boolean to show whether dbuf is duplicated with a
> > + *           previous plane of the buffer.
> >   * @bytesused:       number of bytes occupied by data in the plane (pa=
yload).
> >   * @length:  size of this plane (NOT the payload) in bytes. The maximu=
m
> >   *           valid size is MAX_UINT - PAGE_SIZE.
> > @@ -179,6 +181,7 @@ struct vb2_plane {
> >       void                    *mem_priv;
> >       struct dma_buf          *dbuf;
> >       unsigned int            dbuf_mapped;
> > +     bool                    dbuf_duplicated;
> >       unsigned int            bytesused;
> >       unsigned int            length;
> >       unsigned int            min_length;
> > --
> > 2.45.1.288.g0e0cd299f1-goog
> >

