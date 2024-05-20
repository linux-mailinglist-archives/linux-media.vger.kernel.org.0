Return-Path: <linux-media+bounces-11633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF70A8C97DD
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 04:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6746281EF7
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 02:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139F7BA47;
	Mon, 20 May 2024 02:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cXeG85Vc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B9CC136
	for <linux-media@vger.kernel.org>; Mon, 20 May 2024 02:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716171580; cv=none; b=UHe2TAECDjTun519/aOBnNKL/Rd9m6FzsYXWEwO/J0qMUoy0XHwfaqn8aUmrmVuX7Ru7+NllELkLeEKTOyIqDlJ8qokbareYk6meLnKgRHeQ8H1+BJCYi95uj8/u5FUeAR1Ms1wuCPoT/fYXczj+sulYqiATljSJAO//n+1Vxb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716171580; c=relaxed/simple;
	bh=BOFRaQDBFx3P/MRvh5iVilFRRhIxfW7INdq7f4GJG1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bj0QTth/KYt0+RqYg7UzHRvUZzYNk0xIwzTTT1y7hZvdm9sCbjVdRUcHIuLSh2bQ3sCYIlLCLncVNmoINmyo7IUh9/+t/zBfXHgzHPDsqBRUnE2gTZMF1Vn98jDmLjZeBdsPqjgEM2zuphK8oNO05eLogM3jkrTha4IJNowHIw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cXeG85Vc; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-61be4b98766so23676327b3.3
        for <linux-media@vger.kernel.org>; Sun, 19 May 2024 19:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716171578; x=1716776378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1P/DREDYXRx2EMTca4Ha01OnzQYUpCfYl0ZgioFurIQ=;
        b=cXeG85VcxPZGK3BqdAI826j1LcBijYaWf3D+PnYFjE5vp3BU74NY2dZauRzhTU135a
         UoShRNuDSpnwXXKuwwArExjcJ5mdaJ29JWvlcDSjAlVcM2PIdRXCK51vbXpW0wufMqkO
         llAsdxXl8F44uCmg6pLu5ajRAeG9yBS5moYEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716171578; x=1716776378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1P/DREDYXRx2EMTca4Ha01OnzQYUpCfYl0ZgioFurIQ=;
        b=I6WWxvhoH/0nzMQ/3BCYAM+LAmNgs96u5On1cw4S13gtP8Ax1Uck5WTbiNmjRPfSuu
         6CqHxxy3rz7xvwohoQ8360ajLf+S/LaGoa3KvvCAp8qBxkA/JxPtK+SThs3u6YVYzqlF
         HXf/89nUP4fnQitfBIwEA9o0HJYkBkzmLgvEwA+bJVbCNK1kIm+43gn+GBCLG5TdPAeM
         r2kEjQewj+cW/uTWMr3r8umPY+dufwhGvi32HYAOIZRX75dx9V+qqXX5IfLoTmq3O1Mg
         wBFpC4R3Y8Kiu4rUH0BmcGW97PIUqwXpc+D5sCUsO0zDtRvSxpbpfUZNT42N9ievoFu/
         jAbg==
X-Forwarded-Encrypted: i=1; AJvYcCVj6YIxoCDAuGgvNOo4i0sgLhG+uO1QE2A9COaydbPgcScJTxMr5++2PV1DegI3JSby2zneEeLLRzz4/5FDJWOz++BiInUKqfEk9IU=
X-Gm-Message-State: AOJu0YzpwhUCea96SI9lsmHYzwfK/nnCkExPVQgLv+WruHSbZ+Au9YlZ
	FqCodYe0n6HEP9h9OyiSP+O9I9aUasAEs3s/0KCAmi3ALKimJ8R5fd7IlQyo6pnrW5cTlPHJdt5
	KUMOauOTmWvI3XE6pCIkaXAAPNK/K5OgFSlsW
X-Google-Smtp-Source: AGHT+IFL6lbEJDOvF5eCMK20C9yYaEz5ebF1AOYl6aW9MQDWvTLV5w4KHmwpvW553mz3fMb8iQMMzNTDypjpWcePmvc=
X-Received: by 2002:a05:690c:6902:b0:61a:c2fc:1128 with SMTP id
 00721157ae682-622aff9236amr303188497b3.28.1716171577919; Sun, 19 May 2024
 19:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403091306.1308878-1-yunkec@chromium.org> <20240403091306.1308878-4-yunkec@chromium.org>
 <pz7etaaqk2sxuchbnrcj3efc57pmprbi4amjkx3ltrsqaz4jpo@rws6xfkyoq7j>
In-Reply-To: <pz7etaaqk2sxuchbnrcj3efc57pmprbi4amjkx3ltrsqaz4jpo@rws6xfkyoq7j>
From: Yunke Cao <yunkec@chromium.org>
Date: Mon, 20 May 2024 11:19:27 +0900
Message-ID: <CAEDqmY4tfzoAvGmqypaHjb8mdbe9zfgTZLcGBZ4A20MN=gYLaA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: videobuf2-core: attach once if multiple
 planes share the same dbuf
To: Tomasz Figa <tfiga@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomasz,

Thanks for the review.

On Fri, May 17, 2024 at 8:23=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> wr=
ote:
>
> On Wed, Apr 03, 2024 at 06:13:06PM +0900, Yunke Cao wrote:
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
> >  .../media/common/videobuf2/videobuf2-core.c   | 27 +++++++++++++++----
> >  include/media/videobuf2-core.h                |  3 +++
> >  2 files changed, 25 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/=
media/common/videobuf2/videobuf2-core.c
> > index a5368cef73bb..64fe3801b802 100644
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
>
> Side note: Now when I'm reading this code I'm starting to wonder if
> dbuf_mapped really add any value here. Can we even have a situation when =
we
> have p->dbuf !=3D NULL, but p->dbuf_mapped =3D=3D false?
>

Hmm, I think you are right. It seems we always do map_dmabuf after
attach_dma_buf.

> > +                     call_void_memop(vb, unmap_dmabuf, p->mem_priv);
> > +
> > +             call_void_memop(vb, detach_dmabuf, p->mem_priv);
> > +     }
> >
> > -     call_void_memop(vb, detach_dmabuf, p->mem_priv);
> >       dma_buf_put(p->dbuf);
> >       p->mem_priv =3D NULL;
> >       p->dbuf =3D NULL;
> > @@ -1327,7 +1330,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb=
)
> >       struct vb2_plane planes[VB2_MAX_PLANES];
> >       struct vb2_queue *q =3D vb->vb2_queue;
> >       void *mem_priv;
> > -     unsigned int plane;
> > +     unsigned int plane, i;
> >       int ret =3D 0;
> >       bool reacquired =3D vb->planes[0].mem_priv =3D=3D NULL;
> >
> > @@ -1380,6 +1383,19 @@ static int __prepare_dmabuf(struct vb2_buffer *v=
b)
> >               __vb2_buf_dmabuf_put(vb);
> >
> >               for (plane =3D 0; plane < vb->num_planes; ++plane) {
>
> Can we add a short comment here explaining that this is an optimization f=
or
> using the same DMA-buf for many planes?
>

Sure, I will add it in v3.

Best,
Yunke

> Best regards,
> Tomasz
>
> > +                     for (i =3D 0; i < plane; ++i) {
> > +                             if (planes[plane].dbuf =3D=3D vb->planes[=
i].dbuf) {
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
> > +                     /* There's no need to attach a duplicated dbuf. *=
/
> > +                     if (vb->planes[plane].dbuf_duplicated)
> > +                             continue;
> > +
> >                       /* Acquire each plane's memory */
> >                       mem_priv =3D call_ptr_memop(attach_dmabuf,
> >                                                 vb,
> > @@ -1392,6 +1408,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb=
)
> >                               goto err_put_dbuf;
> >                       }
> >
> > +                     vb->planes[plane].dbuf_duplicated =3D false;
> >                       vb->planes[plane].dbuf =3D planes[plane].dbuf;
> >                       vb->planes[plane].mem_priv =3D mem_priv;
> >               }
> > @@ -1406,7 +1423,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb=
)
> >        * userspace knows sooner rather than later if the dma-buf map fa=
ils.
> >        */
> >       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > -             if (vb->planes[plane].dbuf_mapped)
> > +             if (vb->planes[plane].dbuf_mapped || vb->planes[plane].db=
uf_duplicated)
> >                       continue;
> >
> >               ret =3D call_memop(vb, map_dmabuf, vb->planes[plane].mem_=
priv);
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-c=
ore.h
> > index 8b86996b2719..2484e7d2881d 100644
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
> > 2.44.0.478.gd926399ef9-goog
> >

