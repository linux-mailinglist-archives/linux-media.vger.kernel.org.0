Return-Path: <linux-media+bounces-3864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD59831A1A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 14:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60F9D1C213D2
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 13:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADB8250EF;
	Thu, 18 Jan 2024 13:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bnzuStxp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3C324B5D
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705583399; cv=none; b=WmSp56U9CHsVxwr191WTIBXxzFJahgzKJsRxTvVk7nnPlu9RmoqT3umZ1yjOMbWVP7zQLOjko0BJNgfoZcVul0vpslY2VzXkFuiRIjgv5xPsPlEI38Q+5d2ZfvpNNPLpGgfBvS8sPhMUlOFBDM+XB4TVq0gre28LS9Lsc4RmVGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705583399; c=relaxed/simple;
	bh=vm9nAGVNzifg/P98Wu/7vI37ByiyybqUBE1JLi1SwXg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding; b=n82Dn89l0it00xdj68a+Bhh/Ny8keX0F2rrq2jRidiirTTZlUBQHT9htrGQgZaULAfC53xdfAq67FyItR1GCYLjiNDeeNMkRCM56Xf+hceHiEmWW4sTVYVWIJv/g5uxKFZsbnqIXRrCUsdcoiIyRnk8A6CI2eTzgIuhHT4HAuPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bnzuStxp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-337ae00f39dso3507137f8f.2
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 05:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705583395; x=1706188195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nLVa4LoBDe6HA9aCgAdaN+NpiM1nlOvFbUDhQdDTwQ=;
        b=bnzuStxppmdO2UHBfTPg1ps500wbRa5WxPiZrPi8epz+dRaPG8sCTvCrFTZ77tVCBb
         n7SCQLEhEWUWvHuYDUVGoBnNqBJsIl61H+5IfZBqC78PsJPoR7qs0KKRiT9C/rfYqu/m
         dyOalVniW09zUFhzqYPJoXWmU/SjMl9K9cUc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705583395; x=1706188195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nLVa4LoBDe6HA9aCgAdaN+NpiM1nlOvFbUDhQdDTwQ=;
        b=Uja3IWKPsIjw6PdVD0ocvoAlEjyOKlJTPDoBMtyQ2LnWpywBo2BF2Fy0rJ96Qlb+Qg
         yjv4I7rTbm0NRneELImQEylIn+ieHjB/zMQQg9vcE7JIp1Paq5P7PDfwlyfyWNyK+p8B
         RwCqtnH0p8KBVj4inxaU2RkM+Ast2YTe2WX9zGYixkR7S5boboQruvG+kXe/Ut5Q4Xi9
         bHDTZvI73VHq2oPwqRgfIqxOIRhrz7e6Khuh8K8WSeuQQBr856cVd4couTaTQCtxW9Wp
         CH452Xlc7Qz1cNObw3PyDYyCcIKbH2Us9jinGC10TjnpAugYPmgsPe0NDd5EGxtcjdpm
         WQkw==
X-Gm-Message-State: AOJu0YxDvrWEJ6URNHr4S3UMXEW+rnAAnF4Mkb+0n1NrES2bYgfRKfH+
	k8wdhcpHu+xJqjNfk5CP04RMo6mlx1djJFOAKI2fTiseWoOTVtjg27wgTSYVpZBjYgKlFLj8/BE
	11g==
X-Google-Smtp-Source: AGHT+IE/VAQD/zBN6Y0UvrIVX2nuVhnPKs2ebAlPVK5vRI6qun+0W+q7sleYn/0w25XGr8RCTCPZmA==
X-Received: by 2002:a5d:4cc6:0:b0:337:c0de:2ace with SMTP id c6-20020a5d4cc6000000b00337c0de2acemr553272wrt.103.1705583395054;
        Thu, 18 Jan 2024 05:09:55 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id i4-20020a5d5224000000b003374555d88esm4036277wra.56.2024.01.18.05.09.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 05:09:54 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-337ae00f39dso3507103f8f.2
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 05:09:54 -0800 (PST)
X-Received: by 2002:adf:e788:0:b0:337:9d3b:c180 with SMTP id
 n8-20020adfe788000000b003379d3bc180mr495386wrm.4.1705583393620; Thu, 18 Jan
 2024 05:09:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5df8141c-c0eb-4f55-b380-94cda08bd5ad@xs4all.nl>
 <CAAFQd5BGCNj4PDV2BVP=77yM8rzugu0U_7X0T4EiOnZkTSzx1A@mail.gmail.com> <ec90fefb-fe81-4766-bd81-7bfcfbc6ddbd@xs4all.nl>
In-Reply-To: <ec90fefb-fe81-4766-bd81-7bfcfbc6ddbd@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 18 Jan 2024 22:09:36 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Djy2M9053eYU4+hYdGc6jLQMkeA=yTCw0P03Jp-sM-1A@mail.gmail.com>
Message-ID: <CAAFQd5Djy2M9053eYU4+hYdGc6jLQMkeA=yTCw0P03Jp-sM-1A@mail.gmail.com>
Subject: Re: [PATCH] media: vb2: refactor setting flags and caps, fix missing cap
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: m.szyprowski@samsung.com, mchehab@kernel.org, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 8:47=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 1/18/24 12:14, Tomasz Figa wrote:
> > Hi Hans,
> >
> > On Tue, Jan 16, 2024 at 11:05=E2=80=AFPM Hans Verkuil <hverkuil-cisco@x=
s4all.nl> wrote:
> >>
> >> Several functions implementing VIDIOC_REQBUFS and _CREATE_BUFS all use=
 almost
> >> the same code to fill in the flags and capability fields. Refactor thi=
s into a
> >> new vb2_set_flags_and_caps() function that replaces the old fill_buf_c=
aps()
> >> and validate_memory_flags() functions.
> >>
> >> This also fixes a bug where vb2_ioctl_create_bufs() would not set the
> >> V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS cap and also not fill in the
> >> max_num_buffers field.
> >>
> >> Fixes: d055a76c0065 ("media: core: Report the maximum possible number =
of buffers for the queue")
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>  .../media/common/videobuf2/videobuf2-v4l2.c   | 55 +++++++++---------=
-
> >>  1 file changed, 26 insertions(+), 29 deletions(-)
> >>
> >
> > Thanks for the patch! Please check my comments inline.
> >
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers=
/media/common/videobuf2/videobuf2-v4l2.c
> >> index 54d572c3b515..c575198e8354 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> >> @@ -671,8 +671,20 @@ int vb2_querybuf(struct vb2_queue *q, struct v4l2=
_buffer *b)
> >>  }
> >>  EXPORT_SYMBOL(vb2_querybuf);
> >>
> >> -static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
> >> +static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
> >> +                                  u32 *flags, u32 *caps, u32 *max_num=
_bufs)
> >>  {
> >> +       if (!q->allow_cache_hints || memory !=3D V4L2_MEMORY_MMAP) {
> >> +               /*
> >> +                * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT o=
nly,
> >> +                * but in order to avoid bugs we zero out all bits.
> >> +                */
> >> +               *flags =3D 0;
> >> +       } else {
> >> +               /* Clear all unknown flags. */
> >> +               *flags &=3D V4L2_MEMORY_FLAG_NON_COHERENT;
> >> +       }
> >> +
> >>         *caps =3D V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
> >>         if (q->io_modes & VB2_MMAP)
> >>                 *caps |=3D V4L2_BUF_CAP_SUPPORTS_MMAP;
> >> @@ -686,21 +698,9 @@ static void fill_buf_caps(struct vb2_queue *q, u3=
2 *caps)
> >>                 *caps |=3D V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
> >>         if (q->supports_requests)
> >>                 *caps |=3D V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> >> -}
> >> -
> >> -static void validate_memory_flags(struct vb2_queue *q,
> >> -                                 int memory,
> >> -                                 u32 *flags)
> >> -{
> >> -       if (!q->allow_cache_hints || memory !=3D V4L2_MEMORY_MMAP) {
> >> -               /*
> >> -                * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT o=
nly,
> >> -                * but in order to avoid bugs we zero out all bits.
> >> -                */
> >> -               *flags =3D 0;
> >> -       } else {
> >> -               /* Clear all unknown flags. */
> >> -               *flags &=3D V4L2_MEMORY_FLAG_NON_COHERENT;
> >> +       if (max_num_bufs) {
> >> +               *max_num_bufs =3D q->max_num_buffers;
> >> +               *caps |=3D V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
> >>         }
> >>  }
> >>
> >> @@ -709,8 +709,8 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_r=
equestbuffers *req)
> >>         int ret =3D vb2_verify_memory_type(q, req->memory, req->type);
> >>         u32 flags =3D req->flags;
> >
> > I think we have a bug here, we check the memory type, but just let the
> > code continue even if it's invalid.
>
> It should be harmless. The old code did the same, BTW.
>

Yeah, I've double checked it and there is nothing that depends on the
valid memory type and the error code is not overwritten anywhere on
the way, so the code at the bottom takes it into account correctly.

That said, it's kind of confusing and I can imagine someone adding
some code in the middle which could easily break any of the two
assumptions and the problem may not even be visible in the diff
context.

> >
> >>
> >> -       fill_buf_caps(q, &req->capabilities);
> >> -       validate_memory_flags(q, req->memory, &flags);
> >> +       vb2_set_flags_and_caps(q, req->memory, &flags,
> >> +                              &req->capabilities, NULL);
> >>         req->flags =3D flags;
> >>         return ret ? ret : vb2_core_reqbufs(q, req->memory,
> >>                                             req->flags, &req->count);
> >> @@ -751,11 +751,9 @@ int vb2_create_bufs(struct vb2_queue *q, struct v=
4l2_create_buffers *create)
> >>         int ret =3D vb2_verify_memory_type(q, create->memory, f->type)=
;
> >>         unsigned i;
> >>
> >
> > Ditto.
> >
> >> -       fill_buf_caps(q, &create->capabilities);
> >> -       validate_memory_flags(q, create->memory, &create->flags);
> >>         create->index =3D vb2_get_num_buffers(q);
> >> -       create->max_num_buffers =3D q->max_num_buffers;
> >> -       create->capabilities |=3D V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFER=
S;
> >> +       vb2_set_flags_and_caps(q, create->memory, &create->flags,
> >> +                              &create->capabilities, &create->max_num=
_buffers);
> >>         if (create->count =3D=3D 0)
> >>                 return ret !=3D -EBUSY ? ret : 0;
> >>
> >> @@ -1006,8 +1004,8 @@ int vb2_ioctl_reqbufs(struct file *file, void *p=
riv,
> >>         int res =3D vb2_verify_memory_type(vdev->queue, p->memory, p->=
type);
> >>         u32 flags =3D p->flags;
> >>
> >> -       fill_buf_caps(vdev->queue, &p->capabilities);
> >> -       validate_memory_flags(vdev->queue, p->memory, &flags);
> >> +       vb2_set_flags_and_caps(vdev->queue, p->memory, &flags,
> >> +                              &p->capabilities, NULL);
> >
> > Could we just call vb2_reqbufs() instead of vb2_core_reqbufs() and
> > avoid all the duplicate checks?
> >
> >>         p->flags =3D flags;
> >>         if (res)
> >>                 return res;
> >> @@ -1026,12 +1024,11 @@ int vb2_ioctl_create_bufs(struct file *file, v=
oid *priv,
> >>                           struct v4l2_create_buffers *p)
> >>  {
> >>         struct video_device *vdev =3D video_devdata(file);
> >> -       int res =3D vb2_verify_memory_type(vdev->queue, p->memory,
> >> -                       p->format.type);
> >> +       int res =3D vb2_verify_memory_type(vdev->queue, p->memory, p->=
format.type);
> >>
> >> -       p->index =3D vdev->queue->num_buffers;
> >> -       fill_buf_caps(vdev->queue, &p->capabilities);
> >> -       validate_memory_flags(vdev->queue, p->memory, &p->flags);
> >> +       p->index =3D vb2_get_num_buffers(vdev->queue);
> >> +       vb2_set_flags_and_caps(vdev->queue, p->memory, &p->flags,
> >> +                              &p->capabilities, &p->max_num_buffers);
> >
> > This function in fact already calls vb2_create_bufs() which includes
> > all the checks above, except the one for vb2_queue_is_bus() that
> > continues down below, so maybe we can just remove them?
>
> Same answer for both reqbufs and create_bufs: it has to do with the
> order in which checks are done.
>
> When using vb2_ioctl_reqbufs you want to first check vb2_verify_memory_ty=
pe()
> and return if that's wrong. Next you check if the queue is busy and retur=
n
> -EBUSY. Only then do you call vb2_core_reqbufs() (or vb2_create_bufs()).

Does the order really matter here?

>
> Note that this is a fixes patch (that should have been in the subject, so=
rry
> for that), and I don't want to make more changes than strictly necessary.
>

In such a situation, I'd personally avoid the refactoring part, just
do the minimum change necessary to fix the issue and perform the
refactoring in a follow up patch.

That said, since this is really just a change for code that got
recently merged into next, I don't have a strong opinion.

I'm okay with leaving this patch as is +/- the dropping the change
around vb2_get_num_buffers() that got included in the latest version
of Benjamin's patch:

Acked-by: Tomasz Figa <tfiga@chromium.org>

> What really should happen is that the last users of vb2_reqbufs and
> vb2_create_bufs are converted to use vb2_ioctl_reqbufs/create_bufs. But
> that's another story.

That wouldn't be possible for m2m devices (and the m2m helpers),
because they have multiple queues per video node, while those
vb2_ioctl* helpers assume vdev->queue is the only queue.

Best regards,
Tomasz

>
> Regards,
>
>         Hans
>
> >
> > Best regards,
> > Tomasz
> >
> >>         /*
> >>          * If count =3D=3D 0, then just check if memory and type are v=
alid.
> >>          * Any -EBUSY result from vb2_verify_memory_type can be mapped=
 to 0.
> >> --
> >> 2.42.0
> >>
> >>
>

