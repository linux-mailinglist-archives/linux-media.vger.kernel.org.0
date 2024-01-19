Return-Path: <linux-media+bounces-3928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCACB832A88
	for <lists+linux-media@lfdr.de>; Fri, 19 Jan 2024 14:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88ED328370B
	for <lists+linux-media@lfdr.de>; Fri, 19 Jan 2024 13:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152D0524DE;
	Fri, 19 Jan 2024 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XjZhSeu9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A303942053
	for <linux-media@vger.kernel.org>; Fri, 19 Jan 2024 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705671088; cv=none; b=WTtWyPkWOZWjBSI8KC1XBkmCkacXcLgLfV5opKnT8u4RdowbRuFWpDs7zndqxWJ7uXokUolXPyx56ORC6tyZVEHyb1aByAXGHoc9fzpuNmuJzinMqT4jNin6tLJpwczgivJFiVh2GcDx47jUeBRaxq9wHpiA4D+QJqL5FsDa7uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705671088; c=relaxed/simple;
	bh=0i9IImWk2BuJPCmqYI4txulLywPNr06JkFCoDwLBQbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJG2+Z+QjtYGfACj65gyKAhiAWBkJGw/DAV7pfmqer4vHVmIM8lpoQ1GccXgGNuE9+xEi/lhMxjC8fqafRH2e4GezgXXJuM9CMz8aLFaxkaV7jDy13HwaX/BVfhj/gG2lH9TTPqBwvkdhaRFv1wnsZfAjno/EVE/8UQpt1TBtp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XjZhSeu9; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a2dd05e02ffso71729966b.3
        for <linux-media@vger.kernel.org>; Fri, 19 Jan 2024 05:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705671084; x=1706275884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8xS6kxTS9LiscSu4RNMHdn9IWU5COZ7d4SlFA4uR6U=;
        b=XjZhSeu9IkEZ1Gf0xod0Oo3kiVNkFDRG5i/EEm8SXF3jyYUSHixKH/1pNnmq9SE6yn
         poY9YTee/pbBY/PFF2A1RvH8hfdQcE/qq1+DnD2m4lf3l8+wrQMpL1daNL+buMlOHMbH
         cxANjuQD4b9rrDdZ0UoCNCobjm1o2T9wOQ9ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705671084; x=1706275884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8xS6kxTS9LiscSu4RNMHdn9IWU5COZ7d4SlFA4uR6U=;
        b=La+srK9pN2CUCTAC1wt/ltDGjG8OxU2bgFEp1ovGEdwXcUiJFc+cfN+i3CZRe0L1HR
         xmQ/jDlSu+n93qFlUJ4eeo6P0l/Q81u6T3RRdLzgb1H3GqgtplRYjiA0+AYLPj8LjTfM
         d0cZ6EBrIOyQGLIUEM3gA/cUj7BtuCLF5grZQnl3AyUmM6ET02fuXnfM4FgQdO66K/8K
         X2v6l1JhhxQMZCJd/efihm5teI0vJAWm4x1iYHd4jwWOXepKJIks9cobVjgJgNYla1vX
         H46fc00nsQ2L0f8g9mXBmsV7lYqKh55mmXUcA7mptJvOSOIN+azJhK0KvU6uhBWqo2qE
         HC0g==
X-Gm-Message-State: AOJu0YzLdLieiFHxsJE7mnpz8WfI7lHaBdQFG9ieHU9+qQaVOxB9Q+gW
	cDoaORnq41i1UxA00ypbuLa7WWYh8weLBiMjRLJGdivOY7CrAH5aIJN6Fgf/wS9KIlHDj+bTT8o
	=
X-Google-Smtp-Source: AGHT+IFcqEpAv8oVknu8bq/OgK2N/odsCRdnIrPzjBsyyYtz/sqAkSMxRekhFlZ+iqDBvE3pT7sEkQ==
X-Received: by 2002:a17:906:a8e:b0:a2b:643:322 with SMTP id y14-20020a1709060a8e00b00a2b06430322mr1203072ejf.138.1705671083926;
        Fri, 19 Jan 2024 05:31:23 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id e4-20020a170906c00400b00a298adde5a1sm10247968ejz.189.2024.01.19.05.31.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 05:31:23 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-337b8da1f49so655279f8f.0
        for <linux-media@vger.kernel.org>; Fri, 19 Jan 2024 05:31:23 -0800 (PST)
X-Received: by 2002:adf:ef4e:0:b0:337:4918:471d with SMTP id
 c14-20020adfef4e000000b003374918471dmr1021879wrp.201.1705671082821; Fri, 19
 Jan 2024 05:31:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <92975c06-d6e1-4ba6-8d03-b2ef0b199c21@xs4all.nl>
In-Reply-To: <92975c06-d6e1-4ba6-8d03-b2ef0b199c21@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 19 Jan 2024 22:31:02 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Du1RMc_RWcmfiv3w39=tk7idqTN7Gj2irdVV1U9Qp02Q@mail.gmail.com>
Message-ID: <CAAFQd5Du1RMc_RWcmfiv3w39=tk7idqTN7Gj2irdVV1U9Qp02Q@mail.gmail.com>
Subject: Re: [PATCHv2] media: vb2: refactor setting flags and caps, fix
 missing cap
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: m.szyprowski@samsung.com, mchehab@kernel.org, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 6:03=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
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
> Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> Changes since v2: rebased on top of:
> https://patchwork.linuxtv.org/project/linux-media/patch/20240118121452.29=
151-1-benjamin.gaignard@collabora.com/
>
> Tomasz, I didn't make any other changes since I want to keep the behavior
> the same as before (except for fixing the missing cap issue).
>
> There is certainly room for improvement, but that's not something for a
> fixes patch.
> ---
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 53 +++++++++----------
>  1 file changed, 25 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/me=
dia/common/videobuf2/videobuf2-v4l2.c
> index 6380155d8575..c575198e8354 100644
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
>         p->index =3D vb2_get_num_buffers(vdev->queue);
> -       fill_buf_caps(vdev->queue, &p->capabilities);
> -       validate_memory_flags(vdev->queue, p->memory, &p->flags);
> +       vb2_set_flags_and_caps(vdev->queue, p->memory, &p->flags,
> +                              &p->capabilities, &p->max_num_buffers);
>         /*
>          * If count =3D=3D 0, then just check if memory and type are vali=
d.
>          * Any -EBUSY result from vb2_verify_memory_type can be mapped to=
 0.
> --
> 2.42.0
>
>

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

