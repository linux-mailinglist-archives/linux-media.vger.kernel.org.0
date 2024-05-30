Return-Path: <linux-media+bounces-12221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 753CD8D4471
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 06:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE2F7284C14
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 04:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B778143879;
	Thu, 30 May 2024 04:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XTNc6hIW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010DD1411E7
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 04:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717042406; cv=none; b=WJa4SSY7PW5n8hbD8hJOyRx80TmBaBqG0+o99R+6QgLdgohLFiGIOVotZ1T+lFAum220yPBJ3cNoAywQ3fyoHbAwsvItPlhaxt/9VIwkIQAzx9fD3sik0bUesJXZn2T74Mf4h2mGWmDh522+lswJgb5suJfOz/Dvl+3OP8uAheY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717042406; c=relaxed/simple;
	bh=enQqNxaANa2DixxrRw6YySYFLC4MqNMTr8oiFe+NVQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n610P+3hfJoJrkgb5DGnkFKCqUzVcsXf3gJZcL6ldmcVuhXdV3cMAilJoojY2KwvkKP/5AA1H8agoT0Z4W/nKe89t4dOumXycXIv8JphrmEaFPi/Oh1+i3pjxk5O8F01vG37FvlF2hqGcpX0GftZbIiQwVXH8GO22/NunQ2RPfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XTNc6hIW; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-df4e346e36fso416103276.1
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 21:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717042404; x=1717647204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCHk5EhoiGYB7t2tsVSQ58T7WGAAG7FmcqavwmSh1AQ=;
        b=XTNc6hIWaHPmxcKyO8kaYD6wOVd2QPyfXzgZpXVK6y8SgO7F+bjrzY+fyP+BT9WMmu
         /nGwOucN6ABdMx8dpjp/NgyNlpiwjkB0tA6kOci68REqAOvC+EplaKUAhrjko1JPxOw0
         LNYXwq6lF+bfuBwhRxQ0fkeNjtTUUQlKVBlpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717042404; x=1717647204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCHk5EhoiGYB7t2tsVSQ58T7WGAAG7FmcqavwmSh1AQ=;
        b=npHplEQ25jb4T/Fjcl3+oyJVowglOIQFnj0AttOVTatgTnipoWSsM0Mhrx2bh32P+b
         Da8hXJTGGYDKuR8KFgCiiKo8WkrokaU+bHRTWhDn0w1OjHPU/OeYdDw89vBKE2MiwCu3
         KgukwCmBitG4EELPaY5LlBE8K5uwSDZcMnxi+GsU7XeHwa4UMSKTLCoBsHTMsTrNuCr9
         UpsVbfJYZ17aKNhVveQ/Q9pdMDdRStob7a7RFRSIBO2xTABY9ZwNO6BTSWY4eENck02r
         4+7L8skm/RcPtGsJl+pkG0LihbEocTtRxDnEHvx6v2in+6z3/Ie8alGdXAwcs5Ku11bC
         Nu1w==
X-Forwarded-Encrypted: i=1; AJvYcCXlwepXqwIpgndIbtlTYpG8dNFGmh3aaHiGZIFmTw4XWJnhOgqbEYM0x94pK4wK24tbzwv/2qjGlQ7KGbo1t0MoRCqS93oeLtOg/8Y=
X-Gm-Message-State: AOJu0Yx9qZLSvTPS+RrGfImAdlSgtvEmUv59zV3jHbfYO8+rRXr1xITo
	kjI4RgT9o5Ww44mkUA8FL066GZFLo4CgHeKMnCpAfoUPS6+HS0vDQcLi8RiNXCDUsNlO2VULPcU
	ZzfNXdPFM9FTN0Xtysvgc2AMtoN/PfKkE0MGwc1638yej9HEc4g==
X-Google-Smtp-Source: AGHT+IFKX3zNP1I7v5CNvQIrmBKsIwCsbjQUs9pHM/g8k0nAZvePZfyfSWtYIpohLc29n8Mqgd1/qFhs349uBa8A3z4=
X-Received: by 2002:a5b:a44:0:b0:df4:d367:6bd6 with SMTP id
 3f1490d57ef6-dfa5a611ccbmr1178796276.29.1717042403904; Wed, 29 May 2024
 21:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403091306.1308878-1-yunkec@chromium.org> <20240403091306.1308878-2-yunkec@chromium.org>
 <idyreh3tm33dappbaoek43urhr75jhcu44l6d67qszos42yhcp@mqxlfmdmryto>
In-Reply-To: <idyreh3tm33dappbaoek43urhr75jhcu44l6d67qszos42yhcp@mqxlfmdmryto>
From: Yunke Cao <yunkec@chromium.org>
Date: Thu, 30 May 2024 13:13:13 +0900
Message-ID: <CAEDqmY4Tyz33qv7U_r87EgfxXq0dJiUGPHggoeU2F4XVVNm9Zw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: videobuf2-core: release all planes first in __prepare_dmabuf()
To: Tomasz Figa <tfiga@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomasz,

Thanks for the review.

On Fri, May 17, 2024 at 8:11=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> wr=
ote:
>
> Hi Yunke,
>
> On Wed, Apr 03, 2024 at 06:13:04PM +0900, Yunke Cao wrote:
> > The existing implementation, validating planes, checking if the planes
> > changed, releasing previous planes and reaquiring new planes all happen=
s in
> > the same for loop.
> >
> > Split the for loop into 3 parts
> > 1. In the first for loop, validate planes and check if planes changed.
> > 2. Call __vb2_buf_dmabuf_put() to release all planes.
> > 3. In the second for loop, reaquire new planes.
> >
> > Signed-off-by: Yunke Cao <yunkec@chromium.org>
> > ---
> >  .../media/common/videobuf2/videobuf2-core.c   | 64 ++++++++++---------
> >  1 file changed, 34 insertions(+), 30 deletions(-)
> >
>
> Thanks for the second revision and sorry for the delay. Please check my
> comments inline.
>
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/=
media/common/videobuf2/videobuf2-core.c
> > index b6bf8f232f48..702f7b6f783a 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -1341,11 +1341,13 @@ static int __prepare_dmabuf(struct vb2_buffer *=
vb)
> >       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> >               struct dma_buf *dbuf =3D dma_buf_get(planes[plane].m.fd);
> >
> > +             planes[plane].dbuf =3D dbuf;
> > +
> >               if (IS_ERR_OR_NULL(dbuf)) {
> >                       dprintk(q, 1, "invalid dmabuf fd for plane %d\n",
> >                               plane);
> >                       ret =3D -EINVAL;
> > -                     goto err;
> > +                     goto err_put_dbuf;
>
> nit: Maybe err_put_planes, since we're cleaning up the planes[] array?
>

err_put_planes sounds good to me.

> >               }
> >
> >               /* use DMABUF size if length is not provided */
> > @@ -1356,17 +1358,14 @@ static int __prepare_dmabuf(struct vb2_buffer *=
vb)
> >                       dprintk(q, 1, "invalid dmabuf length %u for plane=
 %d, minimum length %u\n",
> >                               planes[plane].length, plane,
> >                               vb->planes[plane].min_length);
> > -                     dma_buf_put(dbuf);
> >                       ret =3D -EINVAL;
> > -                     goto err;
> > +                     goto err_put_dbuf;
> >               }
> >
> >               /* Skip the plane if already verified */
> >               if (dbuf =3D=3D vb->planes[plane].dbuf &&
> > -                     vb->planes[plane].length =3D=3D planes[plane].len=
gth) {
> > -                     dma_buf_put(dbuf);
> > +                 vb->planes[plane].length =3D=3D planes[plane].length)
> >                       continue;
> > -             }
> >
> >               dprintk(q, 3, "buffer for plane %d changed\n", plane);
> >
> > @@ -1375,29 +1374,30 @@ static int __prepare_dmabuf(struct vb2_buffer *=
vb)
> >                       vb->copied_timestamp =3D 0;
> >                       call_void_vb_qop(vb, buf_cleanup, vb);
>
> Would it make sense to also move these two to the if (reacquired) part
> below, since they are done once for the entire vb?
>

Yes, Will do in the next version.

> >               }
> > +     }
> >
> > -             /* Release previously acquired memory if present */
> > -             __vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
> > -             vb->planes[plane].bytesused =3D 0;
> > -             vb->planes[plane].length =3D 0;
> > -             vb->planes[plane].m.fd =3D 0;
> > -             vb->planes[plane].data_offset =3D 0;
>
> I don't see the code below setting the 4 fields above to zero. Is it
> intended?
>

I thought these were not necessary anymore.
But now that I look more carefully, it is useful when there is an error bel=
ow.
I will add them back in the next version. Thanks for catching this!

> > +     if (reacquired) {
> > +             __vb2_buf_dmabuf_put(vb);
> > +
> > +             for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > +                     /* Acquire each plane's memory */
> > +                     mem_priv =3D call_ptr_memop(attach_dmabuf,
> > +                                               vb,
> > +                                               q->alloc_devs[plane] ? =
: q->dev,
> > +                                               planes[plane].dbuf,
> > +                                               planes[plane].length);
> > +                     if (IS_ERR(mem_priv)) {
> > +                             dprintk(q, 1, "failed to attach dmabuf\n"=
);
> > +                             ret =3D PTR_ERR(mem_priv);
> > +                             goto err_put_dbuf;
>
> Hmm, I think in this case we need to also clean up the partially acquired
> planes of vb.
>
> > +                     }
> >
> > -             /* Acquire each plane's memory */
> > -             mem_priv =3D call_ptr_memop(attach_dmabuf,
> > -                                       vb,
> > -                                       q->alloc_devs[plane] ? : q->dev=
,
> > -                                       dbuf,
> > -                                       planes[plane].length);
> > -             if (IS_ERR(mem_priv)) {
> > -                     dprintk(q, 1, "failed to attach dmabuf\n");
> > -                     ret =3D PTR_ERR(mem_priv);
> > -                     dma_buf_put(dbuf);
> > -                     goto err;
> > +                     vb->planes[plane].dbuf =3D planes[plane].dbuf;
> > +                     vb->planes[plane].mem_priv =3D mem_priv;
> >               }
> > -
> > -             vb->planes[plane].dbuf =3D dbuf;
> > -             vb->planes[plane].mem_priv =3D mem_priv;
> > +     } else {
> > +             for (plane =3D 0; plane < vb->num_planes; ++plane)
> > +                     dma_buf_put(planes[plane].dbuf);
> >       }
> >
> >       /*
> > @@ -1413,7 +1413,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb=
)
> >               if (ret) {
> >                       dprintk(q, 1, "failed to map dmabuf for plane %d\=
n",
> >                               plane);
> > -                     goto err;
> > +                     goto err_put_vb2_buf;
> >               }
> >               vb->planes[plane].dbuf_mapped =3D 1;
> >       }
>
> I think this entire loop can also go under the (reacquired) case, since
> (!reacquired) means that all the planes were identical (and thus are
> alreday mapped). Given that now we release all the planes in one go, we
> could even simplify it by dropping the dbuf_mapped check from the loop.
>
> > @@ -1437,7 +1437,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb=
)
> >               ret =3D call_vb_qop(vb, buf_init, vb);
> >               if (ret) {
> >                       dprintk(q, 1, "buffer initialization failed\n");
> > -                     goto err;
> > +                     goto err_put_vb2_buf;
> >               }
> >       }
>
> Same for this block.
>
> >
> > @@ -1445,11 +1445,15 @@ static int __prepare_dmabuf(struct vb2_buffer *=
vb)
> >       if (ret) {
> >               dprintk(q, 1, "buffer preparation failed\n");
> >               call_void_vb_qop(vb, buf_cleanup, vb);
> > -             goto err;
> > +             goto err_put_vb2_buf;
> >       }
> >
> >       return 0;
> > -err:
> > +
> > +err_put_dbuf:
> > +     for (plane =3D 0; plane < vb->num_planes; ++plane)
>
> dma_buf_put() will throw a warning if the dmabuf pointer is NULL and just
> plain crash if IS_ERR(), so we shouldn't call it on array elements that w=
e
> didn't succeed for.
>

I see. Will do in the next version.

> > +             dma_buf_put(planes[plane].dbuf);
> > +err_put_vb2_buf:
> >       /* In case of errors, release planes that were already acquired *=
/
> >       __vb2_buf_dmabuf_put(vb);
>
> Actually, would it make sense to invert the order of clean-up steps here?
> In case if only the first loop fails, we don't really need to do anything=
 with
> vb. Or am I missing something?
>

It seems the original implementation will call __vb2_buf_dmabuf_put(vb)
whenever dma_buf_get() returns err or length < min_length. I was trying
to keep the same behavior here. Do you have any preference?

Also, if "call_vb_qop(vb, buf_prepare, vb);" fails, I think we only need
__vb2_buf_dmabuf_put(), but not dma_buf_put().

Best,
Yunke

> Best regards,
> Tomasz

