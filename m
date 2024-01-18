Return-Path: <linux-media+bounces-3855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5345983184C
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 12:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A47561F234E7
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 11:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD9423776;
	Thu, 18 Jan 2024 11:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N3paDk4r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E464723760
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 11:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705576600; cv=none; b=TANGzjzibBIzit1bcQfWXEH81BqlUma3DF27HoVBPNeBq9NQypby1HsM4WtJ5TkRZjhUmKp1/mAsbRElJ4jbu1pC2X/mdRszHEBiRJOdoMzne0n02PCQuu+TactBmMlMrur0Nx1Oku7d6pdeieSfmPG0R4Dd42UCYAbAU/m45b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705576600; c=relaxed/simple;
	bh=u4Y/58hWqXpLd3kzPGlsjapYo2DRAmjcYjaB0V8SM64=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding; b=rxYIRsb8M4yUKc9eB964lToQeErKuTntU/JZ+anw/ufJB8kY2XOLPJNdcWIkFs4Efg2ss9yx4M9uI8b6KKRJurDf3ZsA6JKCgxxT+Rlp5fKPvo1+J0yhU4f0MhZGOTMu9WGablMimyjbrAL7WC/wgpQSbhijTccQ4g6WFeuW00s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N3paDk4r; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2c67be31edso844591966b.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 03:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705576597; x=1706181397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85a3E0mpfe0m79s+ZJIAUUBBRHdGw9T5vNx2mwEMJpQ=;
        b=N3paDk4rJUkgfls995SWWqfcu/im3HDmuGmxgoHbYmMgnd1rqXjc0DN9JEbaNG74oi
         7TDhldr2XuLR7WSdKSHTa6iy+pmE/JMvcNxNg+a5ZPp9tgaKhd/FKRP0vkPyg8nFls4Y
         ZQ5Cl282VxT3XHV2JZPU6+usjYjfUccJf9U5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705576597; x=1706181397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85a3E0mpfe0m79s+ZJIAUUBBRHdGw9T5vNx2mwEMJpQ=;
        b=ajDy9zaNZ8k55gms8WdbO223ohbg57rNR9R9LlY1rcHi0ZFPiE/FYL51QiEgObsntO
         XJlIpmdYJ2zgLPetKpJn1EgX/9p4TpgBhtctVmeMq+A/YlulSL087XyZmr/sTZPnLr3p
         JBe+iC3YDn9iM0fIHg5ghhBRqTWvwwVlAfy+xDRn0KcUKbm4MSF0hCGCSa4eDHQ28+10
         CWbRX5A6rOc8el213fFTTWpzwfqf3H/fuhSluuTT1f1bs5LrSbMg6CbGiX+EKsRoOvr0
         JBfPy4RtN623eZcUXzc1J7wjLKGUIxQYTdXks5HOZoU1Gu+e1hqJvgv2LIbPoUocglvz
         OaFw==
X-Gm-Message-State: AOJu0YyvQO1A81EBkSlNTaNTxTG7j3pnEMF4JL28FC7ANNiF4PHtFplo
	Yyx2Nca8B1n4KrCP05vzB3NXNWZ7PnhWR+0Hbuyd4eze4U66t/WgeCz29t6z2j0kYf6XsnP7bvu
	EQA==
X-Google-Smtp-Source: AGHT+IHFi4aPlgOTxlJ+EG7qV94yiNxXIVXAGk+lIowM+1HxzMWAIkBld6/HWKVgaJyPqQCqYSNIvQ==
X-Received: by 2002:a17:906:6812:b0:a2e:9ef8:3634 with SMTP id k18-20020a170906681200b00a2e9ef83634mr212023ejr.49.1705576596714;
        Thu, 18 Jan 2024 03:16:36 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id ap3-20020a17090735c300b00a2c879e89a8sm8560870ejc.188.2024.01.18.03.16.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 03:16:27 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e72a567eeso45945535e9.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 03:16:27 -0800 (PST)
X-Received: by 2002:a05:600c:4e89:b0:40e:491e:e387 with SMTP id
 f9-20020a05600c4e8900b0040e491ee387mr211451wmq.355.1705576586396; Thu, 18 Jan
 2024 03:16:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5df8141c-c0eb-4f55-b380-94cda08bd5ad@xs4all.nl>
In-Reply-To: <5df8141c-c0eb-4f55-b380-94cda08bd5ad@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 18 Jan 2024 20:16:09 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CPiw9D9SMTnoBkv9Soe1ki_+=oMNGTcEpHA2YkCoPKMQ@mail.gmail.com>
Message-ID: <CAAFQd5CPiw9D9SMTnoBkv9Soe1ki_+=oMNGTcEpHA2YkCoPKMQ@mail.gmail.com>
Subject: Re: [PATCH] media: vb2: refactor setting flags and caps, fix missing cap
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: m.szyprowski@samsung.com, mchehab@kernel.org, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
> -       p->index =3D vdev->queue->num_buffers;
> -       fill_buf_caps(vdev->queue, &p->capabilities);
> -       validate_memory_flags(vdev->queue, p->memory, &p->flags);
> +       p->index =3D vb2_get_num_buffers(vdev->queue);

The change to replace vdev->queue->num_buffers with
vb2_get_num_buffers() is not mentioned in the commit message.

Sorry, missed this one in the first reply.

Best regards,
Tomasz

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

