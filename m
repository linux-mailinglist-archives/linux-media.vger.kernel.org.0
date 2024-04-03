Return-Path: <linux-media+bounces-8467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8BD8963B0
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 06:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59F98285FAD
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 04:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D863F45973;
	Wed,  3 Apr 2024 04:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EBiCumq/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC1845941
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 04:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712119984; cv=none; b=qyMs1tt+ebCB3F+gaUbovnV4v7Yznwj74EvotOHAdxiIdqbjG94VoJGIbWd7Shlvr4OY1rPD4kwGYjMKSyfpP0GPA0imP/zGyRnQpLufjRFgMAzMEhvM7Bz7KcEOI8PvikQVc0JlaLQf4+s6zmWLx6Ev6tEqMJEPyGAINV2ZA3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712119984; c=relaxed/simple;
	bh=fT8vAtoeL4zAlzxYFw74qe1NW83Csq0MgosRBnB6/DI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jB/GUdxHbzvkxtc0cBjQ5m2cjpdDjbWpZtD3PmZce0WXvUXJX01Z6uZLcCVVjF42wDxU5i8JqSG8hhTfqTex6P8q4BrmDjYehUR7m4k8pHNriqOQ/TrVIOef4DaNLrVcrfYPPIl3q88Momg4PuH/3nP3WzLPlXZ+QQRf3MM08b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EBiCumq/; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6151e2d037dso16946347b3.3
        for <linux-media@vger.kernel.org>; Tue, 02 Apr 2024 21:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712119981; x=1712724781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnCnxRcBL3diixPhP1r9vIS96E6vsKh/coA8cXOBr0U=;
        b=EBiCumq/hSoRBC1NmNWuEaiPSSNy4BuABebAOebv7ucnHrZfns7Xfy+BtkterQ0ajr
         6VGA2KYzmN1OPvX/n59PvvvwTdMw+KW8KxzhcS2W9kZxZ2aUf7xZ368gOvSrXI/QV+7D
         be17aCqaf2go9VqZjupl28disKFd072t6Cnp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712119981; x=1712724781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnCnxRcBL3diixPhP1r9vIS96E6vsKh/coA8cXOBr0U=;
        b=ZA8B6MlGGaNiRfmOeXl8cKNI7MUJdFDT6oQmLm84Vpprotok3XlefaNGvKhQAIPwYH
         SG6izwxnqXvIYajClZyHlh/XTaisdnKxcDT5HRr0mMCRcuFEaj61wiu74T+GeRQq1ldV
         IqiEJY9VEl9wGKXUL9eN6VvrLomzqV7lJgFrNwfffEOhywh2qZN8QzWi5xWsuYWZLIZi
         7omHb5u8y4kOQ7+lKl5E5Fl05yfiEDFggQZC9jLWykN/VG4O0gtY2JxyNwufqNIuhJ9B
         MV0EWvLoxQylkU7XROnG1GeiDAYU1H+ojn3qCqS05HxPi8yEPYvR+sjl71LlXIhlIa88
         9pNw==
X-Forwarded-Encrypted: i=1; AJvYcCVFVmz4pCHvoDU5nQYpZg2qGK+j4sR+FmE/2rg7kWhXayF3r1iO9SockpxGY/MwAKjYihV3kARgWvNy8fBXqY359VZpM3HE5g9TI20=
X-Gm-Message-State: AOJu0YwpcccgsjcG3MnfcG5ZtKKmfyWz409B5ESrbsOdKvb2rba/JrDW
	RZXDcwThg5eswxxSBRPBDzOhW9trN+oXuuM4JUnDT959bjHmdlZeFOyvjDTCB3HoKPPjaK4N0q2
	i7Y3fHwAjRP/gz4l1GPL4gFDlyTlo2geoFMvF7BjKFk6nUywhEA==
X-Google-Smtp-Source: AGHT+IHkgdVVF5IawRhUFTnmWQbaiqXvo8tyIdAB8qTUNDsvSrh6uaiPMZgN1OkPHj/lFsdSRqrvx9qpGa9xEEB1CFQ=
X-Received: by 2002:a0d:d5c8:0:b0:615:3d71:b0ed with SMTP id
 x191-20020a0dd5c8000000b006153d71b0edmr2771796ywd.12.1712119981448; Tue, 02
 Apr 2024 21:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401063500.680384-1-yunkec@chromium.org> <CAAFQd5ASNmUv30xeCChebonLcpemny=-U1G=8bK4iO1vTUyjbg@mail.gmail.com>
In-Reply-To: <CAAFQd5ASNmUv30xeCChebonLcpemny=-U1G=8bK4iO1vTUyjbg@mail.gmail.com>
From: Yunke Cao <yunkec@chromium.org>
Date: Wed, 3 Apr 2024 13:52:50 +0900
Message-ID: <CAEDqmY5On01usBV7UmAqCrqaEs8sB47Oh3sWRou3WARK=LjJWg@mail.gmail.com>
Subject: Re: [RFC PATCH] media: videobuf2-core: attach once if multiple planes
 share the same dbuf
To: Tomasz Figa <tfiga@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomasz,

Thanks for the review!

On Tue, Apr 2, 2024 at 7:21=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> wro=
te:
>
> Hi Yunke,
>
> On Mon, Apr 1, 2024 at 3:35=E2=80=AFPM Yunke Cao <yunkec@chromium.org> wr=
ote:
> >
> > When multiple planes use the same dma buf, each plane will have its own=
 dma
> > buf attachment and mapping. It is a waste of IOVA space.
> >
> > This patch adds a duplicated_dbuf flag in vb2_plane. If a plane's dbuf
> > is the same as an existing plane, do not create another attachment and
> > mapping.
> >
> > Signed-off-by: Yunke Cao <yunkec@chromium.org>
> > ---
> >  .../media/common/videobuf2/videobuf2-core.c   | 30 +++++++++++++++----
> >  include/media/videobuf2-core.h                |  3 ++
> >  2 files changed, 28 insertions(+), 5 deletions(-)
> >
>
> Thanks a lot for the patch! Please take a look at my comments inline.
>
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/=
media/common/videobuf2/videobuf2-core.c
> > index b6bf8f232f48..b03e058ef2b1 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -304,10 +304,13 @@ static void __vb2_plane_dmabuf_put(struct vb2_buf=
fer *vb, struct vb2_plane *p)
> >         if (!p->mem_priv)
> >                 return;
> >
> > -       if (p->dbuf_mapped)
> > -               call_void_memop(vb, unmap_dmabuf, p->mem_priv);
> > +       if (!p->duplicated_dbuf) {
> > +               if (p->dbuf_mapped)
> > +                       call_void_memop(vb, unmap_dmabuf, p->mem_priv);
> > +
> > +               call_void_memop(vb, detach_dmabuf, p->mem_priv);
>
> I wonder if we may want to reverse the iteration order in
> __vb2_buf_dmabuf_put() so that we don't leave dangling pointers in
> further planes when previous planes have their mem_priv freed.
>

The loop in __prepare_dmabuf() is of the same iteration order, so the
same will happen.
Is it still necessary to reverse the order in __vb2_buf_dmabuf_put()?

> > +       }
> >
> > -       call_void_memop(vb, detach_dmabuf, p->mem_priv);
> >         dma_buf_put(p->dbuf);
> >         p->mem_priv =3D NULL;
> >         p->dbuf =3D NULL;
> > @@ -1327,7 +1330,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb=
)
> >         struct vb2_plane planes[VB2_MAX_PLANES];
> >         struct vb2_queue *q =3D vb->vb2_queue;
> >         void *mem_priv;
> > -       unsigned int plane;
> > +       unsigned int plane, i;
> >         int ret =3D 0;
> >         bool reacquired =3D vb->planes[0].mem_priv =3D=3D NULL;
> >
> > @@ -1383,6 +1386,22 @@ static int __prepare_dmabuf(struct vb2_buffer *v=
b)
> >                 vb->planes[plane].m.fd =3D 0;
> >                 vb->planes[plane].data_offset =3D 0;
> >
> > +               if (mem_priv && plane > 0) {
>
> Is mem_priv the right thing to check for here? I think it would point
> to the private data of the previous plane (i.e. plane - 1), but in the
> loop below we may end up finding the match in an earlier plane (e.g.
> plane - 2).
>
> > +                       for (i =3D 0; i < plane; ++i) {
> > +                               if (dbuf =3D=3D vb->planes[i].dbuf) {
> > +                                       vb->planes[plane].duplicated_db=
uf =3D true;
>
> I guess we can set ...[plane].mem_priv to [i].mem_priv here.
>
> > +                                       break;
> > +                               }
> > +                       }
> > +               }
> > +
> > +               /* There's no need to attach a duplicated dbuf. */
> > +               if (vb->planes[plane].duplicated_dbuf) {
> > +                       vb->planes[plane].dbuf =3D dbuf;
> > +                       vb->planes[plane].mem_priv =3D mem_priv;
>
> I think this mem_priv would be the one from planes[plane-1] and not
> necessarily the one with matching dbuf.

Thanks for catching the error. Will fix it in the next version.

>
>
> > +                       continue;
> > +               }
> > +
> >                 /* Acquire each plane's memory */
> >                 mem_priv =3D call_ptr_memop(attach_dmabuf,
> >                                           vb,
> > @@ -1396,6 +1415,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb=
)
> >                         goto err;
> >                 }
> >
> > +               vb->planes[plane].duplicated_dbuf =3D false;
> >                 vb->planes[plane].dbuf =3D dbuf;
> >                 vb->planes[plane].mem_priv =3D mem_priv;
> >         }
> > @@ -1406,7 +1426,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb=
)
> >          * userspace knows sooner rather than later if the dma-buf map =
fails.
> >          */
> >         for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > -               if (vb->planes[plane].dbuf_mapped)
> > +               if (vb->planes[plane].dbuf_mapped || vb->planes[plane].=
duplicated_dbuf)
> >                         continue;
> >
> >                 ret =3D call_memop(vb, map_dmabuf, vb->planes[plane].me=
m_priv);
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-c=
ore.h
> > index 8b86996b2719..5db781da2ebc 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -154,6 +154,8 @@ struct vb2_mem_ops {
> >   * @mem_priv:  private data with this plane.
> >   * @dbuf:      dma_buf - shared buffer object.
> >   * @dbuf_mapped:       flag to show whether dbuf is mapped or not
> > + * @duplicated_dbuf:   boolean to show whether dbuf is duplicated with=
 a
> > + *             previous plane of the buffer.
> >   * @bytesused: number of bytes occupied by data in the plane (payload)=
.
> >   * @length:    size of this plane (NOT the payload) in bytes. The maxi=
mum
> >   *             valid size is MAX_UINT - PAGE_SIZE.
> > @@ -179,6 +181,7 @@ struct vb2_plane {
> >         void                    *mem_priv;
> >         struct dma_buf          *dbuf;
> >         unsigned int            dbuf_mapped;
> > +       bool                    duplicated_dbuf;
>
> nit: We kind of seem to use the dbuf_ prefix already, so how about
> dbuf_duplicated? Or maybe dbuf_reused? Hmm, naming is always hard...
>

dbuf_duplicated sounds good to me.

Best,
Yunke

> Best regards,
> Tomasz

