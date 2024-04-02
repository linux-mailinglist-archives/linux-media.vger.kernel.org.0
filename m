Return-Path: <linux-media+bounces-8378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5276894FF5
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 12:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 004CCB22B69
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 10:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C435F87D;
	Tue,  2 Apr 2024 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oA6Qyair"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B65E5CDC9
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712053292; cv=none; b=KPHSJXAgwaepD+PCaU43MGBiBB0a0Rw0bCfR8Tiip6AOMd2R+OuOvPnl3hJisFTAaEVhMd/WrxeP8PvzJJ+29FpaMk/1gMQ1jZ+AxVPjugoxi/o01KwyEzhsYo/E8P13S1XEeiQEtQV9BJ0HPIfsEnYnP84DeUlkcxnpyM/EvXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712053292; c=relaxed/simple;
	bh=Y+Ul5/dIiT4LczORyqj00NqGK35SJesePPFqkQ+qgcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGybZsZk9Q+VsxDrkIF/ESk/mqxwfAkaznhOVLn5GV1Lr/ISvggMdi8Rny3MJM9o6fpzFTXORvD/zkZkC+5QnkbauE+AVgTLdp1R6KquQCxUEHxlGoVOGY51d1/EkGKvXiLzPP1xVHSSgNU1ygWfgjzpMsPTJnI/rnyWQcUZ4e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oA6Qyair; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d718efedb2so69844681fa.0
        for <linux-media@vger.kernel.org>; Tue, 02 Apr 2024 03:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712053288; x=1712658088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqt/OCFZ9jsjQ8iJFD6JDDHMLAmSh8O3eej/3HcYMAA=;
        b=oA6Qyair9Lqd9vYB6XkOdrUvB99iCvsbEMlpxUEuytb9eugHT+2Pk8CBctV8AzkK2J
         m1JdBWWnAYlBTJYBCiWlfH4dLuuA6jG3uIerTYdgdMRjr2WbsOrs8uR+XLHTVynkbU42
         yk5P2ag5tiVApS4wK5lEM0C9+uiVutDMi+k4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712053288; x=1712658088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqt/OCFZ9jsjQ8iJFD6JDDHMLAmSh8O3eej/3HcYMAA=;
        b=Nbn3F9O28KlG1y9w8KnAUMPm5ixYPtsMWcGts95MufMkJ9WpBCMLWxvphJ4opHdp9u
         xoHbw7XJzXMow+wTYdENxXarv30IALJSLinJWCY9hH4W4nWNsiAF7dXS9DLFIPqRbOmr
         NomfW1DEMg+2l58NIlO7uXP5wmuGehq6+5yeGLsug43ACtdHKoTId/hcmf/ywSSz/UNZ
         w1Dwk7hFQnv3Da+6y7yhbCNjTnAFrku0j28uHaEn1KbHcIiK1VrnKFcLPTh1yDFySTB8
         tlIBzOlC49jNQYjU/mGlDPYGLU2uCWeFJTm174T1jb8Ke63R7qsuQoIg6+O3bAqDa1kK
         9w5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8BDkm5QFTgJu7DcyYTHUvQQqqOz1J+JyNSX7KISYRiZD2vdj6+EswD8c52QvMLdSf7SXgXMqfymtM0YO+Vp+dkkKhn/eMhJ7vR50=
X-Gm-Message-State: AOJu0YxQpxUajaBRMiBLv8EHCdvBUd5ulMFfBXna/T8miooMcaAfwQgw
	5XnS7cr4oOn47wyRS0lrhpxCH1Xq4xLb0ZWw/OMGmg8SlmX0SxjgT+2clkHp4Mq7n+42nA3SGK8
	=
X-Google-Smtp-Source: AGHT+IEyAWLIm0Cg8akUsvkksRfoeRhM7foVIsYbao9XmXjKVm4dkaJBDpYyG64/wFU3rja4HqnC3g==
X-Received: by 2002:a05:651c:3c9:b0:2d4:5370:5e8a with SMTP id f9-20020a05651c03c900b002d453705e8amr966073ljp.22.1712053287474;
        Tue, 02 Apr 2024 03:21:27 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id wz4-20020a170906fe4400b00a4e253c8735sm6091110ejb.52.2024.04.02.03.21.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 03:21:26 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3417a3151c4so4609785f8f.3
        for <linux-media@vger.kernel.org>; Tue, 02 Apr 2024 03:21:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7U2uMybsJ1r6eOL07bkl3S8f4xAmy5uCSEvto88y2Q94syEBBsz3qL9HQKHFhNaW83LSGJZ3l+Xx1rFYybdAw8O8FOlZw0qA/K1U=
X-Received: by 2002:adf:fed1:0:b0:343:6551:935 with SMTP id
 q17-20020adffed1000000b0034365510935mr1024992wrs.66.1712053286313; Tue, 02
 Apr 2024 03:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401063500.680384-1-yunkec@chromium.org>
In-Reply-To: <20240401063500.680384-1-yunkec@chromium.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 2 Apr 2024 19:21:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ASNmUv30xeCChebonLcpemny=-U1G=8bK4iO1vTUyjbg@mail.gmail.com>
Message-ID: <CAAFQd5ASNmUv30xeCChebonLcpemny=-U1G=8bK4iO1vTUyjbg@mail.gmail.com>
Subject: Re: [RFC PATCH] media: videobuf2-core: attach once if multiple planes
 share the same dbuf
To: Yunke Cao <yunkec@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yunke,

On Mon, Apr 1, 2024 at 3:35=E2=80=AFPM Yunke Cao <yunkec@chromium.org> wrot=
e:
>
> When multiple planes use the same dma buf, each plane will have its own d=
ma
> buf attachment and mapping. It is a waste of IOVA space.
>
> This patch adds a duplicated_dbuf flag in vb2_plane. If a plane's dbuf
> is the same as an existing plane, do not create another attachment and
> mapping.
>
> Signed-off-by: Yunke Cao <yunkec@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 30 +++++++++++++++----
>  include/media/videobuf2-core.h                |  3 ++
>  2 files changed, 28 insertions(+), 5 deletions(-)
>

Thanks a lot for the patch! Please take a look at my comments inline.

> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/me=
dia/common/videobuf2/videobuf2-core.c
> index b6bf8f232f48..b03e058ef2b1 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -304,10 +304,13 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffe=
r *vb, struct vb2_plane *p)
>         if (!p->mem_priv)
>                 return;
>
> -       if (p->dbuf_mapped)
> -               call_void_memop(vb, unmap_dmabuf, p->mem_priv);
> +       if (!p->duplicated_dbuf) {
> +               if (p->dbuf_mapped)
> +                       call_void_memop(vb, unmap_dmabuf, p->mem_priv);
> +
> +               call_void_memop(vb, detach_dmabuf, p->mem_priv);

I wonder if we may want to reverse the iteration order in
__vb2_buf_dmabuf_put() so that we don't leave dangling pointers in
further planes when previous planes have their mem_priv freed.

> +       }
>
> -       call_void_memop(vb, detach_dmabuf, p->mem_priv);
>         dma_buf_put(p->dbuf);
>         p->mem_priv =3D NULL;
>         p->dbuf =3D NULL;
> @@ -1327,7 +1330,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>         struct vb2_plane planes[VB2_MAX_PLANES];
>         struct vb2_queue *q =3D vb->vb2_queue;
>         void *mem_priv;
> -       unsigned int plane;
> +       unsigned int plane, i;
>         int ret =3D 0;
>         bool reacquired =3D vb->planes[0].mem_priv =3D=3D NULL;
>
> @@ -1383,6 +1386,22 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>                 vb->planes[plane].m.fd =3D 0;
>                 vb->planes[plane].data_offset =3D 0;
>
> +               if (mem_priv && plane > 0) {

Is mem_priv the right thing to check for here? I think it would point
to the private data of the previous plane (i.e. plane - 1), but in the
loop below we may end up finding the match in an earlier plane (e.g.
plane - 2).

> +                       for (i =3D 0; i < plane; ++i) {
> +                               if (dbuf =3D=3D vb->planes[i].dbuf) {
> +                                       vb->planes[plane].duplicated_dbuf=
 =3D true;

I guess we can set ...[plane].mem_priv to [i].mem_priv here.

> +                                       break;
> +                               }
> +                       }
> +               }
> +
> +               /* There's no need to attach a duplicated dbuf. */
> +               if (vb->planes[plane].duplicated_dbuf) {
> +                       vb->planes[plane].dbuf =3D dbuf;
> +                       vb->planes[plane].mem_priv =3D mem_priv;

I think this mem_priv would be the one from planes[plane-1] and not
necessarily the one with matching dbuf.


> +                       continue;
> +               }
> +
>                 /* Acquire each plane's memory */
>                 mem_priv =3D call_ptr_memop(attach_dmabuf,
>                                           vb,
> @@ -1396,6 +1415,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>                         goto err;
>                 }
>
> +               vb->planes[plane].duplicated_dbuf =3D false;
>                 vb->planes[plane].dbuf =3D dbuf;
>                 vb->planes[plane].mem_priv =3D mem_priv;
>         }
> @@ -1406,7 +1426,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>          * userspace knows sooner rather than later if the dma-buf map fa=
ils.
>          */
>         for (plane =3D 0; plane < vb->num_planes; ++plane) {
> -               if (vb->planes[plane].dbuf_mapped)
> +               if (vb->planes[plane].dbuf_mapped || vb->planes[plane].du=
plicated_dbuf)
>                         continue;
>
>                 ret =3D call_memop(vb, map_dmabuf, vb->planes[plane].mem_=
priv);
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-cor=
e.h
> index 8b86996b2719..5db781da2ebc 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -154,6 +154,8 @@ struct vb2_mem_ops {
>   * @mem_priv:  private data with this plane.
>   * @dbuf:      dma_buf - shared buffer object.
>   * @dbuf_mapped:       flag to show whether dbuf is mapped or not
> + * @duplicated_dbuf:   boolean to show whether dbuf is duplicated with a
> + *             previous plane of the buffer.
>   * @bytesused: number of bytes occupied by data in the plane (payload).
>   * @length:    size of this plane (NOT the payload) in bytes. The maximu=
m
>   *             valid size is MAX_UINT - PAGE_SIZE.
> @@ -179,6 +181,7 @@ struct vb2_plane {
>         void                    *mem_priv;
>         struct dma_buf          *dbuf;
>         unsigned int            dbuf_mapped;
> +       bool                    duplicated_dbuf;

nit: We kind of seem to use the dbuf_ prefix already, so how about
dbuf_duplicated? Or maybe dbuf_reused? Hmm, naming is always hard...

Best regards,
Tomasz

