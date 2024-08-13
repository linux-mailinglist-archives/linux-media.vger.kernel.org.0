Return-Path: <linux-media+bounces-16167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D551294FD27
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 07:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C33D1F23A77
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 05:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF23E2374C;
	Tue, 13 Aug 2024 05:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nZHnbdSo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246F23B0
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 05:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723526395; cv=none; b=Hw31GTa67R5rDKBAaK+BCgJl8Kvtw34jitsxS4ynx3scBiL4ENqsEr55oQ3XGq5vo1WiB3tPzyY+sqrT+rm29rkHd0Fwcsk4FK9KSuUKbVmCnMXuWKRIKtsvEkBztjw3gTUXHRdyTnO0KrpSM/MjCPU7NId1rHMrScg/uwYQK24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723526395; c=relaxed/simple;
	bh=ZQoVNgBang1vc+d87psCjCNWACaEu+nmd1I8SDmxwj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvHo74gFp8/xFRLevrZ7HjhXZ3dFupl+cD32k4XG87HVbVl/J3J5kzdej/6ke1vkn8IMYhHZNPwPnJ5GtaamdoDyc0t/igBM+BhBU1Xwp5CkRUBjoN84Ca8A/45XVdrrRisY4H/vFL+CzE0Np//to0AtaYMpbEg1RFGnC8YBNnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nZHnbdSo; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-690aabe2600so43665147b3.0
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 22:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723526392; x=1724131192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81yXsL0yRR/fJMIQgxpQrvKh84InGeW/j5zqNjuepvw=;
        b=nZHnbdSokRtrDhLlC6G+RVuCb15WxWsvs4gpRCWcRc4Rqmx1lE/w675AqZDlrX2sPt
         ZwMATw1QO8hq1SgKwsw9L6HmaVrmJF2cO2Ecgazp8jzMYnW2Uzd7W8AKfFiEjGAojI5U
         +pDjGEJLhRK/Y26npk52wCHAnCCKIVgMPvqag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723526392; x=1724131192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81yXsL0yRR/fJMIQgxpQrvKh84InGeW/j5zqNjuepvw=;
        b=YEqnve9oov3ZCriE++7c7QDTIMTAlweVhKkoICiB4tMwrvl4AqoHPFTIaS5he0jcbK
         WL21JPWTtNrw6OjGROWisv8/qCR9WIGIryFKRTnzkbmxnMaaxRrNNvO3Wwat/C5m1LwK
         VnQe6okHGinhUXMONlB+VWhG/Rgmn6Ss5CnrpYnhDI1Yu/MAHLay5mtFw4zq9G3jsjQJ
         wiGVCCAGPUg7jQdb2h76isgSgHLQNyNCr96fr0ggG0qN9dr/pMjMVwv/sYRWQdUUes9O
         cQ/Lg6uqZYf8XI4YQ7cPEDwGn8ERwsYkZC3pRlGQHDsPLcHG6GmQd1p9wnXJ8LTBOckj
         W+yA==
X-Forwarded-Encrypted: i=1; AJvYcCXMo+wqRJeBCDa8I+zgUNDRjL6Z2z/Wve7p4RsiPE1qtPwMBS/w2JAOHfXAwNSiZ97R912awCNU2vRs7/0DxktdjfhRWh+BBhV66aI=
X-Gm-Message-State: AOJu0YzS8eodAaiu2TyGJeZKcLpWItT6jpgxn7rly0AN/jpD5GwnAMnj
	U4eNHAON/huF6HXFBqW3Au7yXkn0hSDIjaonEbLujE6mAO/vehjFTpoFaIIxivnRbXWA4MDJNUl
	s73BqWcoEmah34alTLijn3uu22tdTA9bncuq0
X-Google-Smtp-Source: AGHT+IGaTrha0l53Wo8dQ94+4Dy4kY8RtLxZcudoQneYIFVl6c3RiUXeaIsx8/ryHWdmYWcMAFV7cG3t0ew4oOWcqjw=
X-Received: by 2002:a05:690c:2e89:b0:63b:c16e:a457 with SMTP id
 00721157ae682-6a971ebae9emr28171147b3.13.1723526392346; Mon, 12 Aug 2024
 22:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614073702.316810-1-yunkec@chromium.org> <20240614073702.316810-5-yunkec@chromium.org>
 <9e48ebe4-d062-49b8-8b6c-6427f483e559@xs4all.nl>
In-Reply-To: <9e48ebe4-d062-49b8-8b6c-6427f483e559@xs4all.nl>
From: Yunke Cao <yunkec@chromium.org>
Date: Tue, 13 Aug 2024 14:19:41 +0900
Message-ID: <CAEDqmY65jpXEFh1B4ZDCQsByY6TC+Fqpa9Yvwba5FZBxL3Gvkw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] media: videobuf2-core: attach once if multiple
 planes share the same dbuf
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Mon, Aug 12, 2024 at 5:06=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 14/06/2024 09:37, Yunke Cao wrote:
> > When multiple planes use the same dma buf, each plane will have its own=
 dma
> > buf attachment and mapping. It is a waste of IOVA space.
> >
> > This patch adds a dbuf_duplicated boolean in vb2_plane. If a plane's db=
uf
> > is the same as an existing plane, do not create another attachment and
> > mapping.
>
> I'm getting two documentation warnings:
>
> include/media/videobuf2-core.h:194: warning: Function parameter or struct=
 member 'dbuf_duplicated' not described in 'vb2_plane'
> include/media/videobuf2-core.h:194: warning: Excess struct member 'duplic=
ated_dbuf' description in 'vb2_plane'
> 2 warnings as Errors
>
> Clearly a typo.
>
> So please post a v5 to fix this issue as well.

Oops sorry! I will send a v5 soon.

Thank you,
Yunke

>
> Regards,
>
>         Hans
>
> >
> > Signed-off-by: Yunke Cao <yunkec@chromium.org>
> > ---
> > v4
> > - Only set dbuf_duplicated when alloc_devs are equal.
> >
> > v3
> > - Adjust the patch according to the previous patches to resolve conflic=
ts.
> > - Add comment to explain the purpose of the change.
> >
> > v2
> > - Separate out the refactor changes out to previous patches.
> > - Fix mem_priv check.
> > ---
> >  .../media/common/videobuf2/videobuf2-core.c   | 30 ++++++++++++++++---
> >  include/media/videobuf2-core.h                |  3 ++
> >  2 files changed, 29 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/=
media/common/videobuf2/videobuf2-core.c
> > index cbc8928f0418..c19f1df3a4d2 100644
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
> > @@ -1427,6 +1431,24 @@ static int __prepare_dmabuf(struct vb2_buffer *v=
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
i].dbuf &&
> > +                                 q->alloc_devs[plane] =3D=3D q->alloc_=
devs[i]) {
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
>

