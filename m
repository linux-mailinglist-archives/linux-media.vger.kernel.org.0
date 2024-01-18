Return-Path: <linux-media+bounces-3853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B7283183F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 12:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88A871C22A64
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 11:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DC42376B;
	Thu, 18 Jan 2024 11:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dcXSsObf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7B24B37
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705576493; cv=none; b=s+bzifO3aPteDXC88yc8a+oQfnwML/ejm8NnuRqfIUE3wpt2eDPKRQjG3acQIHnqfnZH9hUd/C/oA3hSg49xEAXh1jYQ4fvG/x3lWIhuA6U05ZukMwiMgdUxoQ7fdDWn81266RC22xVrnvnKCYhmfyX+aeOtv/nnY+JX+HR0sDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705576493; c=relaxed/simple;
	bh=/ymBhqPIuQoCSRC2tEgtBcxSFCFPK8v5gxyJBJKW3gI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding; b=KtznLm5gWGpPLSevn/8BEO3ZRzoP14bjYYu+86vtWI9c9Lz7Zjj/Kizl58S/CMm5vDHvHxRDBJDF0pmVRi0hahY0SzZc5fRVdPRh5vXEKlMlrfCquqDtVJOHyEnpO1osYut4Q/O4EPjM3Ic8oQQ/wQ0VUM/+SGjWmnm7dA8MX6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dcXSsObf; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55a3a875f7fso162716a12.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 03:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705576489; x=1706181289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xexQ3ag/9H/ehwwDvU02wBWzrC9cINHFV/4f6hFJ6Ac=;
        b=dcXSsObf9/qs1Z0SmywnlYHCC5IEnzI9FimurdeCqu2rAuc9V3S2qrQCew1Xbj9vZr
         WKXl38Qx/W6v4KCF55m4B+w4wa5R2QBjvKUPWaYUUPrS1U0daNCQ5QfHLtsdKzrAR8Sj
         b43FOAL5qgiDg+nbwITzXi7a19t62zdJaAfo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705576489; x=1706181289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xexQ3ag/9H/ehwwDvU02wBWzrC9cINHFV/4f6hFJ6Ac=;
        b=gmk1PFHP2WIndlYkdNiGdbDtRI9vW7QrHjv2U/caZD/IQgvCpDtl0AuW+x8Ry6nmux
         qxN6TZhtY5aYHD8wLj1gLaDC0b3y2svp370W/JZ9QWVKrCnTHdxRAOC+ZzsIW17TOl/8
         grYNMSXMyL5GJOtpey7q9WO4Ieh5+3Uv4RxpXeW+6mTVqfOmZBbxtji/oz7uWeJjK0uX
         RdmaRLAnlPeo4msBlExEVAxCo/GDKfmgGhmstW44YexUamo1fAfV3ijz2EPsrvReFzm4
         Bt2mRescx63GxDlzwZtonekfsR1pkUDYwPS0gkrWaAbZfvhRdtrq2JVI+JKiEE6Tjsyz
         +feA==
X-Gm-Message-State: AOJu0YwE3cwN7/Di48uHpO3LH6FXi0PepO/Cf2mFjdCWPcOlnZp1R9+i
	U8eYTaVQqksczXf3UG0Oi+Z0g4TXphkZCAzAHoF31zxbr5XKf/mD3z3WrWySEZf+yodeaBX5azA
	=
X-Google-Smtp-Source: AGHT+IHrOFZ6sK6VtQ5ixdkE6hruZsVSEkoeYwD15011fiaJMbWDJ5yDGEDFlJBtvE4X3Igc+38gWw==
X-Received: by 2002:a17:906:eb0b:b0:a2b:efa3:6b25 with SMTP id mb11-20020a170906eb0b00b00a2befa36b25mr334249ejb.5.1705576488942;
        Thu, 18 Jan 2024 03:14:48 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id ll5-20020a170907190500b00a2cc5199dd0sm7836270ejc.135.2024.01.18.03.14.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 03:14:48 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-337c5bcf79fso1335080f8f.2
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 03:14:48 -0800 (PST)
X-Received: by 2002:adf:fcc4:0:b0:337:c4d7:d062 with SMTP id
 f4-20020adffcc4000000b00337c4d7d062mr381058wrs.27.1705576487916; Thu, 18 Jan
 2024 03:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5df8141c-c0eb-4f55-b380-94cda08bd5ad@xs4all.nl>
In-Reply-To: <5df8141c-c0eb-4f55-b380-94cda08bd5ad@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 18 Jan 2024 20:14:27 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BGCNj4PDV2BVP=77yM8rzugu0U_7X0T4EiOnZkTSzx1A@mail.gmail.com>
Message-ID: <CAAFQd5BGCNj4PDV2BVP=77yM8rzugu0U_7X0T4EiOnZkTSzx1A@mail.gmail.com>
Subject: Re: [PATCH] media: vb2: refactor setting flags and caps, fix missing cap
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: m.szyprowski@samsung.com, mchehab@kernel.org, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Jan 16, 2024 at 11:05=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4al=
l.nl> wrote:
>
> Several functions implementing VIDIOC_REQBUFS and _CREATE_BUFS all use al=
most
> the same code to fill in the flags and capability fields. Refactor this i=
nto a
> new vb2_set_flags_and_caps() function that replaces the old fill_buf_caps=
()
> and validate_memory_flags() functions.
>
> This also fixes a bug where vb2_ioctl_create_bufs() would not set the
> V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS cap and also not fill in the
> max_num_buffers field.
>
> Fixes: d055a76c0065 ("media: core: Report the maximum possible number of =
buffers for the queue")
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 55 +++++++++----------
>  1 file changed, 26 insertions(+), 29 deletions(-)
>

Thanks for the patch! Please check my comments inline.

> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/me=
dia/common/videobuf2/videobuf2-v4l2.c
> index 54d572c3b515..c575198e8354 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -671,8 +671,20 @@ int vb2_querybuf(struct vb2_queue *q, struct v4l2_bu=
ffer *b)
>  }
>  EXPORT_SYMBOL(vb2_querybuf);
>
> -static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
> +static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
> +                                  u32 *flags, u32 *caps, u32 *max_num_bu=
fs)
>  {
> +       if (!q->allow_cache_hints || memory !=3D V4L2_MEMORY_MMAP) {
> +               /*
> +                * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only=
,
> +                * but in order to avoid bugs we zero out all bits.
> +                */
> +               *flags =3D 0;
> +       } else {
> +               /* Clear all unknown flags. */
> +               *flags &=3D V4L2_MEMORY_FLAG_NON_COHERENT;
> +       }
> +
>         *caps =3D V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
>         if (q->io_modes & VB2_MMAP)
>                 *caps |=3D V4L2_BUF_CAP_SUPPORTS_MMAP;
> @@ -686,21 +698,9 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *=
caps)
>                 *caps |=3D V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
>         if (q->supports_requests)
>                 *caps |=3D V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> -}
> -
> -static void validate_memory_flags(struct vb2_queue *q,
> -                                 int memory,
> -                                 u32 *flags)
> -{
> -       if (!q->allow_cache_hints || memory !=3D V4L2_MEMORY_MMAP) {
> -               /*
> -                * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only=
,
> -                * but in order to avoid bugs we zero out all bits.
> -                */
> -               *flags =3D 0;
> -       } else {
> -               /* Clear all unknown flags. */
> -               *flags &=3D V4L2_MEMORY_FLAG_NON_COHERENT;
> +       if (max_num_bufs) {
> +               *max_num_bufs =3D q->max_num_buffers;
> +               *caps |=3D V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
>         }
>  }
>
> @@ -709,8 +709,8 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requ=
estbuffers *req)
>         int ret =3D vb2_verify_memory_type(q, req->memory, req->type);
>         u32 flags =3D req->flags;

I think we have a bug here, we check the memory type, but just let the
code continue even if it's invalid.

>
> -       fill_buf_caps(q, &req->capabilities);
> -       validate_memory_flags(q, req->memory, &flags);
> +       vb2_set_flags_and_caps(q, req->memory, &flags,
> +                              &req->capabilities, NULL);
>         req->flags =3D flags;
>         return ret ? ret : vb2_core_reqbufs(q, req->memory,
>                                             req->flags, &req->count);
> @@ -751,11 +751,9 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2=
_create_buffers *create)
>         int ret =3D vb2_verify_memory_type(q, create->memory, f->type);
>         unsigned i;
>

Ditto.

> -       fill_buf_caps(q, &create->capabilities);
> -       validate_memory_flags(q, create->memory, &create->flags);
>         create->index =3D vb2_get_num_buffers(q);
> -       create->max_num_buffers =3D q->max_num_buffers;
> -       create->capabilities |=3D V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
> +       vb2_set_flags_and_caps(q, create->memory, &create->flags,
> +                              &create->capabilities, &create->max_num_bu=
ffers);
>         if (create->count =3D=3D 0)
>                 return ret !=3D -EBUSY ? ret : 0;
>
> @@ -1006,8 +1004,8 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv=
,
>         int res =3D vb2_verify_memory_type(vdev->queue, p->memory, p->typ=
e);
>         u32 flags =3D p->flags;
>
> -       fill_buf_caps(vdev->queue, &p->capabilities);
> -       validate_memory_flags(vdev->queue, p->memory, &flags);
> +       vb2_set_flags_and_caps(vdev->queue, p->memory, &flags,
> +                              &p->capabilities, NULL);

Could we just call vb2_reqbufs() instead of vb2_core_reqbufs() and
avoid all the duplicate checks?

>         p->flags =3D flags;
>         if (res)
>                 return res;
> @@ -1026,12 +1024,11 @@ int vb2_ioctl_create_bufs(struct file *file, void=
 *priv,
>                           struct v4l2_create_buffers *p)
>  {
>         struct video_device *vdev =3D video_devdata(file);
> -       int res =3D vb2_verify_memory_type(vdev->queue, p->memory,
> -                       p->format.type);
> +       int res =3D vb2_verify_memory_type(vdev->queue, p->memory, p->for=
mat.type);
>
> -       p->index =3D vdev->queue->num_buffers;
> -       fill_buf_caps(vdev->queue, &p->capabilities);
> -       validate_memory_flags(vdev->queue, p->memory, &p->flags);
> +       p->index =3D vb2_get_num_buffers(vdev->queue);
> +       vb2_set_flags_and_caps(vdev->queue, p->memory, &p->flags,
> +                              &p->capabilities, &p->max_num_buffers);

This function in fact already calls vb2_create_bufs() which includes
all the checks above, except the one for vb2_queue_is_bus() that
continues down below, so maybe we can just remove them?

Best regards,
Tomasz

>         /*
>          * If count =3D=3D 0, then just check if memory and type are vali=
d.
>          * Any -EBUSY result from vb2_verify_memory_type can be mapped to=
 0.
> --
> 2.42.0
>
>

