Return-Path: <linux-media+bounces-20827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E239BC4A5
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 06:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC2751C2165B
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 05:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2781B6539;
	Tue,  5 Nov 2024 05:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bu8gAC16"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D461383
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 05:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730784284; cv=none; b=ueQPC6GhKBZIsjk0HKeqnSpaHWh8GwPYPo/WLpH/Z1TtANis4vYsX150vPkkdO9LUh7PQtg7MmhN6+agFnPU6GSW9HL3TOjaG3jB2s3CgJAbcEQyoV7QVNnUD0E+vBYf/6jQ6xUDEV5oUjJ0R1QtR4Roj6PvKLiW600Eeajvt6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730784284; c=relaxed/simple;
	bh=4DtPGViv9kF+P0NsXbIJNdJPAbr4vfBtMnxLHNMuoR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nj9J767GnNK1zV7wC4sCDXhz4J+vLHPG2CIqp+K9PBWKHZaVrTOrai2oXNr2E6qW1RGluV32RU29DB64Lef78D5DnCp4k4GrH3MrKyHNcrOGH1gneXBOYJjjvd1OF4TLx3YB7hVtKAAdAuUFnCNHU7qMemV5bCGW2mS2SaZuvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bu8gAC16; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20c8b557f91so51615675ad.2
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 21:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730784282; x=1731389082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFhu+Ehh9YM596pjmb7Dh2hs5sKhuAIb9PMq8+bdxxU=;
        b=bu8gAC16GTMqt/MxjDZ7bGgOOeCjPGJ6Vm5c1Gc8lndQbntpwmz/KL4OZ6JHWtgpUg
         oeBwK3q+DMlixjayJaMiyWScLQvJjcA2puUzl2g3hP0lYBWc8Ph4wkG895accIO4aHFX
         2tWTe4QuTS/20qGGpKftm68qL4LAGWJrvQu/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730784282; x=1731389082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFhu+Ehh9YM596pjmb7Dh2hs5sKhuAIb9PMq8+bdxxU=;
        b=o6vUsoUbduVHlLd4jdxO/SMQzsnQ7ur/EYKNLILSwBppbvhhv3YhrloolLdiDQNL7z
         BX3XE0/42hBubWEkmmsFr6BKn4lrtUIBOqIJRbsJUSF+QfnQmuHARPeNExa1q4riZUZb
         swRRYPc4K8/J9gf7PGMEeEDMmZxTAr7iK/0T1UEruSo1+K58zVgEwRPo+pzi4SnDV472
         JnlgDIPvk0kkB6qWIXey4cdkxvPRvdhfWYPtse9IYtJaJpFKU6LSZLoMxYu6jQYDABpA
         FAkxXMWCBvt5K5kMHx9UqNhRm9sqts8ys27ueQg2QYtY4qFX5XDxShuolAEH9J3rPUmS
         suPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUkDctbfG/1a2iQLVWdq1EgHtFVFu4++c7j46gs6GBPOL/3+I/9VdyExivrDF2a20W6M5Y9Od1o7WnJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwlAIeSfoPQDTJTOJTHQFfgtlM0oKOX4XYW/3O7z0Q1izwDLrM
	A53lWUb0jY9rsge4C/6pQ7azS9UfCxSsUepPf1zUGmVluwXOE7uI7uWHWBnTDlXO2eq0/+4nW0N
	BUg==
X-Google-Smtp-Source: AGHT+IH2owv/6vAcDUclyQAUBPpXZML+0TY1cp18tBuYlF77q64/3DW7j0fCUYXEjIcrd4RwSSlgXQ==
X-Received: by 2002:a17:902:d490:b0:20c:f27f:fcc with SMTP id d9443c01a7336-210c6c6d9b0mr481931735ad.44.1730784281771;
        Mon, 04 Nov 2024 21:24:41 -0800 (PST)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a5ff1sm70108505ad.123.2024.11.04.21.24.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 21:24:41 -0800 (PST)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20ca4877690so108855ad.1
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 21:24:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViyewyl1uorngnnvZust7v2VX3NLlbVkxapH409Tw3YR+t35Yo6AHNjICW4CJX32H+TQrCdUuRjXOOtA==@vger.kernel.org
X-Received: by 2002:a17:903:120a:b0:20c:79d7:d8c9 with SMTP id
 d9443c01a7336-2115e2c51f2mr1318095ad.26.1730784280209; Mon, 04 Nov 2024
 21:24:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814020643.2229637-1-yunkec@chromium.org> <20240814020643.2229637-3-yunkec@chromium.org>
 <ee2f1ece-30fc-44e7-bf36-1c6c8f04301d@linaro.org>
In-Reply-To: <ee2f1ece-30fc-44e7-bf36-1c6c8f04301d@linaro.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 5 Nov 2024 14:24:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dpd-TdGwTRSmoqHd4xCsSQuPuL_V11nGXrZvS9x2G=2Q@mail.gmail.com>
Message-ID: <CAAFQd5Dpd-TdGwTRSmoqHd4xCsSQuPuL_V11nGXrZvS9x2G=2Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] media: videobuf2-core: release all planes first in __prepare_dmabuf()
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Yunke Cao <yunkec@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	kernel-team@android.com, William McVicker <willmcvicker@google.com>, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tudor,

On Tue, Nov 5, 2024 at 2:40=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> +linux-samsung-soc@vger.kernel.org
>
> Hi, Yunke, Tomasz, Hans,
>
> On 8/14/24 3:06 AM, Yunke Cao wrote:
> > In the existing implementation, validating planes, checking if the plan=
es
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
> > Acked-by: Tomasz Figa <tfiga@chromium.org>
> > ---
> > v3:
> > - Applied Tomasz's review comment:
> > - Rename err_put_dbuf as err_put_planes.
> > - Move code that only executed once into if (reacquired) to simply it.
> > - In error handling, only call dma_buf_put() for valid pointers.
> > ---
> >  .../media/common/videobuf2/videobuf2-core.c   | 115 +++++++++---------
> >  1 file changed, 59 insertions(+), 56 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/=
media/common/videobuf2/videobuf2-core.c
> > index 4d232b08f950..b53d94659e30 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -1387,11 +1387,13 @@ static int __prepare_dmabuf(struct vb2_buffer *=
vb)
>
> cut
> > +
> > +     if (reacquired) {
>
> cut
>
> > -     /*
> > -      * Now that everything is in order, copy relevant information
> > -      * provided by userspace.
> > -      */
> > -     for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > -             vb->planes[plane].bytesused =3D planes[plane].bytesused;
> > -             vb->planes[plane].length =3D planes[plane].length;
> > -             vb->planes[plane].m.fd =3D planes[plane].m.fd;
> > -             vb->planes[plane].data_offset =3D planes[plane].data_offs=
et;
> > -     }
> > +             /*
> > +              * Now that everything is in order, copy relevant informa=
tion
> > +              * provided by userspace.
> > +              */
> > +             for (plane =3D 0; plane < vb->num_planes; ++plane) {
> > +                     vb->planes[plane].bytesused =3D planes[plane].byt=
esused;
> > +                     vb->planes[plane].length =3D planes[plane].length=
;
> > +                     vb->planes[plane].m.fd =3D planes[plane].m.fd;
> > +                     vb->planes[plane].data_offset =3D planes[plane].d=
ata_offset;
> > +             }
>
> I'm running into an issue on my Pixel 6 device with this change.
>
> I see that this chunk of code was moved only for the `reacquired` case.

Thanks for the report!

If I remember correctly the idea was that if the buffer was validated
to be the same as given previously, there is no need to update the
fields, because they should already be the same. However, I can see
that this may not be true for bytesused, m.fd and data_offset in some
scenarios.

>
> > -     if (reacquired) {
> >               /*
> >                * Call driver-specific initialization on the newly acqui=
red buffer,
> >                * if provided.
> > @@ -1479,19 +1473,28 @@ static int __prepare_dmabuf(struct vb2_buffer *=
vb)
> >               ret =3D call_vb_qop(vb, buf_init, vb);
> >               if (ret) {
> >                       dprintk(q, 1, "buffer initialization failed\n");
> > -                     goto err;
> > +                     goto err_put_vb2_buf;
> >               }
> > +     } else {
> > +             for (plane =3D 0; plane < vb->num_planes; ++plane)
> > +                     dma_buf_put(planes[plane].dbuf);
> >       }
> >
> >       ret =3D call_vb_qop(vb, buf_prepare, vb);
>
> But then the above method is called, were the pixel downstream driver
> [1] tries to:
>         bufcon_dmabuf[i] =3D dma_buf_get(vb->planes[i].m.fd);
>
> This fails with -EBADF as the core driver did not set
> vb->planes[plane].m.fd for `!reacquired`.
>
> The following diff makes the Pixel 6 downstream driver work as before
> this change. Shall we set the relevant data copied from userspace to
> vb->planes in the `!reacquired` case again?
>
> Thanks,
> ta
>
> [1]
> https://android.googlesource.com/kernel/gs/+/refs/tags/android-15.0.0_r0.=
14/drivers/media/platform/exynos/mfc/mfc_enc_vb2.c#215
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c
> b/drivers/media/common/videobuf2/videobuf2-core.c
> index 02fe81b9be28..0acaf8deaf78 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1365,6 +1365,18 @@ static int __prepare_userptr(struct vb2_buffer *vb=
)
>         return ret;
>  }
>
> +static void __v2buf_set_planes(struct vb2_buffer *vb, struct vb2_plane
> *planes)
> +{
> +       unsigned int plane;
> +
> +       for (plane =3D 0; plane < vb->num_planes; ++plane) {
> +               vb->planes[plane].bytesused =3D planes[plane].bytesused;
> +               vb->planes[plane].length =3D planes[plane].length;
> +               vb->planes[plane].m.fd =3D planes[plane].m.fd;
> +               vb->planes[plane].data_offset =3D planes[plane].data_offs=
et;
> +       }
> +}
> +
>  /*
>   * __prepare_dmabuf() - prepare a DMABUF buffer
>   */
> @@ -1459,12 +1471,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>                  * Now that everything is in order, copy relevant
> information
>                  * provided by userspace.
>                  */
> -               for (plane =3D 0; plane < vb->num_planes; ++plane) {
> -                       vb->planes[plane].bytesused =3D
> planes[plane].bytesused;
> -                       vb->planes[plane].length =3D planes[plane].length=
;
> -                       vb->planes[plane].m.fd =3D planes[plane].m.fd;
> -                       vb->planes[plane].data_offset =3D
> planes[plane].data_offset;
> -               }

I think it should be fine to just move the following parts outside of
this if block and then call the buf_init op conditionally if
(reacquired), like it was in the old code.

Would you mind sending a fix patch (with a Fixes: tag)?

Best regards,
Tomasz

> +               __v2buf_set_planes(vb, planes);
>
>                 /*
>                  * Call driver-specific initialization on the newly
> acquired buffer,
> @@ -1476,6 +1483,8 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>                         goto err_put_vb2_buf;
>                 }
>         } else {
> +               __v2buf_set_planes(vb, planes);

I

> +
>                 for (plane =3D 0; plane < vb->num_planes; ++plane)
>                         dma_buf_put(planes[plane].dbuf);
>         }

