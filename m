Return-Path: <linux-media+bounces-29168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0040A78059
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 18:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DF3A1887083
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 16:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC4921D3CD;
	Tue,  1 Apr 2025 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMmNOcRD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B86B21CFEF;
	Tue,  1 Apr 2025 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743524293; cv=none; b=Jzcc+LbD3dbklOTnkg2GlSF2XF0iwyF3hNzO7Zil1RMvvY88wA5FjxdAJSDXbvZPYxlMU7IBsoqgIaBIzuxWg1xO5OQdQs0v5EKSmgzWknBF/ao/KKTMgB49Rp+o0httqJR3Ssd6vAkmSbMi2H8LQmOjfb4U9F4pgo7L5h2zQ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743524293; c=relaxed/simple;
	bh=a8uk6fIu9fAH703/RnsJYU5IwzgzlSLs8qPFMf8mmJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFLAsZ5PZGBeYgA03SfWBI3QfsbFnYTCbsLrryT1Zk0a5RQHTkWU93PYXkQIVpGLPtMDHXdZ0EC3zBnN0x8mqlIhuVDKnAqahtonDpiTY8C2SE96465A77+EiOm1XnPGmxgPghz6Jkd86+tS5fyVW8xyE3bKxs3qpUAa0J2fnkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMmNOcRD; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d59c8f0979so19248555ab.0;
        Tue, 01 Apr 2025 09:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743524290; x=1744129090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqFXSYEwhYNvuYelKTlJfqjn2CtSSo/5QPRUsnL00Bs=;
        b=LMmNOcRDwZCcrGFjGxJyNarKO+4lQ10TeIXXls1FB+yXv7Cg98C791QxBi/Xlu3MZ6
         ixfd6OHLmUknCNSb6mc8FYcU3AZPAYJywg81E8KDeB6dnHhkQ7k6/V2qjMjMvtT/WZrI
         VYJGTClHx9rianlfd2BG3axJrJa6Q54ZM0vgjnTnMbJi3jeB3BmvKI+0ctH7r5CxRk+x
         5xFZar4mzhTnXRCV/c4eVphHnTkjKf2Rvgn6Rk4XMFyFcffFvyaEolwY28Rs+AGNrBaW
         9S2TRwTg3vI8pXiOMU8rifFZjRmts5Suj6/xE9eYBykDiGpTRpbAaZsVv9BTYZImAO99
         9Vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743524290; x=1744129090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqFXSYEwhYNvuYelKTlJfqjn2CtSSo/5QPRUsnL00Bs=;
        b=suniodTrdqAXGOk1gc4LAagRl7KJ0OF9/8k2wiVA7LZnI783Y128IVvxmMqKyq82UH
         t1ORC7RjGWBkyGQmvaOgmOTISHwcUXVRgTiirf1jiY569w5n/C4NOtfSOXdftqUe4XPY
         HpO65rYJK1tNn2517nRuebMLCugVxaOH0xV1KetpKuVXRq0nPcaWWIrRg/T6qXVWQTYA
         0SKFrXdzuVsMXCI+y9aSDfrTzOM6h+3nWbjGRMC6FzcUVTacK8/VrTOCY5dHrY/2L8Kt
         wd5o8r93/46TsSq9WMaoEFiGK771tlKRIMswFm3nd3WlgKwSIcSVJlrYH80ADKpR67od
         A9GA==
X-Forwarded-Encrypted: i=1; AJvYcCUI33IBARs168X8xMfCHbo3K+utNTC1WrfdmQe4NAkNS61GuVzcxtJBr7apj/irGgvijGYNNXdNQWGdoD0=@vger.kernel.org, AJvYcCXgu+4ks2aPMUpbDKrWw2cMR6vYUeQyC0vkAtEW6DwDYs8vdYYelMJInS5cJeMGJ9yreesKVZGmrsBcZKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJvWDVk87YTiqXpjk2xltrex4SxfZp8RbFnuQ8TLrOgGZ3P9mu
	Ydc+ztlpervKkWaqQilqnJ1eztEyAGPi190ZFyD3GGzvyocXroRyVlgwXFhvEOiKkac+iCewu8R
	bOj47Wkke5olRNIRvfgd0KuJ7S2Q=
X-Gm-Gg: ASbGncvQZyTUg4mhS/orPEoGvKMdssiQ4lx3BmvyZBBdZyIG08N5UAviYE2iMxrZzqs
	CHxzCMIHgSwWIKRIC6KbO35tpr7T0WRyjxUBbfUS3xNsSxjLLf+jte6ug9q7C/UEf9Sx3qQf9b+
	ln6dp6PQUbIXABvrcHUek48U3rBdh1XqCWHw+bhgs56sOMYNzd01ugOEPEniYq7tlKBxCIB9k=
X-Google-Smtp-Source: AGHT+IEB8Y1ukx7WzzSNycHm2osv0GmAeeTqv2BbGe+G8ag4TjR+T4vF4B+WdEZAuzdCZJPyEnzG046vB0c4B3SJ0tU=
X-Received: by 2002:a05:6e02:1101:b0:3d6:d147:c6a2 with SMTP id
 e9e14a558f8ab-3d6d3487727mr6919155ab.8.1743524289685; Tue, 01 Apr 2025
 09:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331212333.16029-1-robdclark@gmail.com> <593b5915-7148-446a-a240-7f7939025a5f@gmail.com>
In-Reply-To: <593b5915-7148-446a-a240-7f7939025a5f@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 1 Apr 2025 09:17:55 -0700
X-Gm-Features: AQ5f1Jr1XOgv1FGNyqKdzNaS64bxJ7dCHmN1AVvvv26tXOsRZqym_e0zrMFu_7U
Message-ID: <CAF6AEGvvTsmeESbzf0DU3171t5e+mLNLb1=J9KvTVe3BdxOOQg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v5] drm/syncobj: Extend EXPORT_SYNC_FILE
 for timeline syncobjs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb" <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 4:18=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 31.03.25 um 23:23 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add support for exporting a dma_fence fd for a specific point on a
> > timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
> > syncobj support, as it needs a way to turn a point on a timeline back
> > into a dma_fence fd.  It also closes an odd omission from the syncobj
> > UAPI.
> >
> > [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
> > [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests=
/805
> >
> > v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
> > v3: Add unstaged uabi header hunk
> > v4: Also handle IMPORT_SYNC_FILE case
> > v5: Address comments from Dmitry
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_syncobj.c | 45 +++++++++++++++++++++++++++--------
> >  include/uapi/drm/drm.h        |  4 ++++
> >  2 files changed, 39 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 4f2ab8a7b50f..b0a4c58fe726 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -741,7 +741,7 @@ static int drm_syncobj_fd_to_handle(struct drm_file=
 *file_private,
> >  }
> >
> >  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_pr=
ivate,
> > -                                           int fd, int handle)
> > +                                           int fd, int handle, u64 poi=
nt)
> >  {
> >       struct dma_fence *fence =3D sync_file_get_fence(fd);
> >       struct drm_syncobj *syncobj;
> > @@ -755,14 +755,22 @@ static int drm_syncobj_import_sync_file_fence(str=
uct drm_file *file_private,
> >               return -ENOENT;
> >       }
> >
> > -     drm_syncobj_replace_fence(syncobj, fence);
> > +     if (point) {
> > +             struct dma_fence_chain *chain =3D dma_fence_chain_alloc()=
;
> > +             if (!chain)
> > +                     return -ENOMEM;
> > +             drm_syncobj_add_point(syncobj, chain, fence, point);
>
> Just a nit pick but checkpatch.pl will complain about it: Empty line betw=
een declaration and code please.
>
> Maybe double check if checpatch.pl is otherwise happy with the patch.
>
> With that done feel free to add Reviewed-by: Christian K=C3=B6nig <christ=
ian.koenig@amd.com>.
>
> Let me know if I should push it to drm-misc-next.

Yes please, I've sent a v6

BR,
-R

> Regards,
> Christian.
>
> > +     } else {
> > +             drm_syncobj_replace_fence(syncobj, fence);
> > +     }
> > +
> >       dma_fence_put(fence);
> >       drm_syncobj_put(syncobj);
> >       return 0;
> >  }
> >
> >  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> > -                                     int handle, int *p_fd)
> > +                                     int handle, u64 point, int *p_fd)
> >  {
> >       int ret;
> >       struct dma_fence *fence;
> > @@ -772,7 +780,7 @@ static int drm_syncobj_export_sync_file(struct drm_=
file *file_private,
> >       if (fd < 0)
> >               return fd;
> >
> > -     ret =3D drm_syncobj_find_fence(file_private, handle, 0, 0, &fence=
);
> > +     ret =3D drm_syncobj_find_fence(file_private, handle, point, 0, &f=
ence);
> >       if (ret)
> >               goto err_put_fd;
> >
> > @@ -869,6 +877,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *d=
ev, void *data,
> >                                  struct drm_file *file_private)
> >  {
> >       struct drm_syncobj_handle *args =3D data;
> > +     unsigned valid_flags =3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE =
|
> > +                            DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC=
_FILE;
> > +     u64 point =3D 0;
> >
> >       if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
> >               return -EOPNOTSUPP;
> > @@ -876,13 +887,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device =
*dev, void *data,
> >       if (args->pad)
> >               return -EINVAL;
> >
> > -     if (args->flags !=3D 0 &&
> > -         args->flags !=3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_F=
ILE)
> > +     if (args->flags & ~valid_flags)
> >               return -EINVAL;
> >
> > +     if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
> > +             point =3D args->point;
> > +
> >       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE=
)
> >               return drm_syncobj_export_sync_file(file_private, args->h=
andle,
> > -                                                 &args->fd);
> > +                                                 point, &args->fd);
> > +
> > +     if (args->point)
> > +             return -EINVAL;
> >
> >       return drm_syncobj_handle_to_fd(file_private, args->handle,
> >                                       &args->fd);
> > @@ -893,6 +909,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *d=
ev, void *data,
> >                                  struct drm_file *file_private)
> >  {
> >       struct drm_syncobj_handle *args =3D data;
> > +     unsigned valid_flags =3D DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE =
|
> > +                            DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC=
_FILE;
> > +     u64 point =3D 0;
> >
> >       if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
> >               return -EOPNOTSUPP;
> > @@ -900,14 +919,20 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device =
*dev, void *data,
> >       if (args->pad)
> >               return -EINVAL;
> >
> > -     if (args->flags !=3D 0 &&
> > -         args->flags !=3D DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_F=
ILE)
> > +     if (args->flags & ~valid_flags)
> >               return -EINVAL;
> >
> > +     if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
> > +             point =3D args->point;
> > +
> >       if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE=
)
> >               return drm_syncobj_import_sync_file_fence(file_private,
> >                                                         args->fd,
> > -                                                       args->handle);
> > +                                                       args->handle,
> > +                                                       point);
> > +
> > +     if (args->point)
> > +             return -EINVAL;
> >
> >       return drm_syncobj_fd_to_handle(file_private, args->fd,
> >                                       &args->handle);
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 7fba37b94401..e63a71d3c607 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -905,13 +905,17 @@ struct drm_syncobj_destroy {
> >  };
> >
> >  #define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE (1 << 0)
> > +#define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE         (1 << 1)
> >  #define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE (1 << 0)
> > +#define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE         (1 << 1)
> >  struct drm_syncobj_handle {
> >       __u32 handle;
> >       __u32 flags;
> >
> >       __s32 fd;
> >       __u32 pad;
> > +
> > +     __u64 point;
> >  };
> >
> >  struct drm_syncobj_transfer {
>

