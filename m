Return-Path: <linux-media+bounces-29172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD02A78361
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 22:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E58713ABEE9
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 20:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AB0214202;
	Tue,  1 Apr 2025 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSxHJvSu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA0A3594F;
	Tue,  1 Apr 2025 20:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743540063; cv=none; b=hQUGHwdaq4f5zV07N8hGu/naTYRCEdrx167QhSAtqMd3DYQGrNqYfyxYCozz7VwUiDMy1dQNjovieVD2yc7vZxHm7M6BMI2sddiKftL7pt/+eTBOxtULeYvRiCQEONhfOJUl7X0eRvNxRW6VFrKNWahYUK6lxxYP28cUq4X/Low=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743540063; c=relaxed/simple;
	bh=mgoj2LmOzSdQWqzKSQIr6XK+nGpBkja3pWfiePVcXbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fyuwRIF+nG5TN8t3FXdykYjwqfehER3LXWKFzNH6IDbqK3Ld1ihp4S4S+jCG4ZTrFpqpAwZxT6qgjFT11we983CkyZdiYok8deDdQeCxpAaLJdQK0qfxw1I+wPBvOuH2nFVMt/+Gtk80XVdfjL0r6jH5I2qj2hvQupelpF2FPOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSxHJvSu; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85b5e49615aso566131639f.1;
        Tue, 01 Apr 2025 13:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743540061; x=1744144861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siRhwdkGqZcq/rdLOAyWJygNm07mlGX8YXe+LkcnPjg=;
        b=PSxHJvSuA23eN/jf925EuM9iPY+9sLIZ6dh/9KYCvagrUELj0YwUGbCfLkIbMxLdvT
         mW2r9huh++HXxqpXUYZ3zmFyEeSUIZnMKlKE515VHOD4nXmySPZH0cAazPvZSUCiO/QS
         /MQUsPWaof0W4ifWvkGX47+gpwLXm/0ItQaKiFWB07WfyaC0+T3EW2tFPvHJl35T7J6M
         I8xd6W4IEzNAJig8Aj11v4v0aLvXrERIuEVqShZIX6XI49fVUERceBq1z/ESGZ8jLitr
         GQ75HO3s4Z+m9l3T7bFeuiOiq/7rfsGfx3Lla82reFOP2+zswkFZFjzL++2hZrpMNtAQ
         aDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540061; x=1744144861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siRhwdkGqZcq/rdLOAyWJygNm07mlGX8YXe+LkcnPjg=;
        b=vGje2YErMSh0P9vmIYzo1OPI7EpeLdKNTuI20+6r8DPzEGB02AyF5TpCxweLCCwLiP
         0ru/W+sDxveM7leSQVKTrg9iTIa8R+faPe+9YhO11taJxtlSOI45kfYRvLjbJhAA+vGn
         pIsSCY9r2PudWxBch35Qb4y+PaLEnvj11ZpuJFkOLz8zVWwYpmbAAYfhMP2H9/JN9bhB
         IcjNGjAhyLJXHKJrtnR3kcJkzaklLS6KR860lruWR36g7bbZbLf/O0cjl9Q6/TwZ3WFc
         zyARFRxa5g2HGPEduKcIfA5+d+2uWyOTmIhQR4GVmvfLXON3ExySHs9jH7BiQqLDFBk3
         E3ig==
X-Forwarded-Encrypted: i=1; AJvYcCWVOzYC0a7DNLuzrUcofI/wou77yimXnkUKJPerXNlAmOLU9PNgYWlKgNk5370mHrsJ3qw1yzj0h++VMO0=@vger.kernel.org, AJvYcCWyrY1fQrnCHgqqkeKXE7hrRFuwaL0T9UV/lG/0Fh5x48aDdJYYVLT7w6jVtIz0fpbwwaQ9LledgFY9qo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyMAOAG8wdMXk9z6am4dCdmsGwTzXS7bVnNV5z9a7WqTmmNcYC
	7pm34wsAZGVWpP73HekwefgxDfTXJafSUHcYf0QIsqi4nyGLZRD8Sk8YjeHVEADwjeX5+gwZIV5
	2munHnK7oM/1d6uyBS+V8ot06QMA=
X-Gm-Gg: ASbGncskWiMendZzCxANAUcORY2Jf9D5wIxj3uTLSPAdnWAULuUyZwANUFzE2r0pGtY
	qetIaQvqCITqLds96uJiTNgeb4goCiI+cO0vW0tI2LiYOU7vHDQUwEVVe2BbGFJkuBe+LRtMUsx
	nF0t9c0A2LceTzBw9GBEwWj6rdr2hZBoXtfst5HML6Zrq8qQ5uZ7xouH/VkuSv
X-Google-Smtp-Source: AGHT+IFLlhtX4Th4iaWF6gmgGrgmSI2sNYPTK5C3v32iqwrOki9gMq65N8YIiPUx2AS0QMSgiiHdclEstrrecxsEUTg=
X-Received: by 2002:a05:6e02:330e:b0:3d4:2ea4:6b8a with SMTP id
 e9e14a558f8ab-3d6ca680434mr58428335ab.22.1743540061217; Tue, 01 Apr 2025
 13:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401155758.48855-1-robdclark@gmail.com>
In-Reply-To: <20250401155758.48855-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 1 Apr 2025 13:40:49 -0700
X-Gm-Features: AQ5f1Jok8YMtfimcNM4pgU6iFDD8sQiU6mJe95HIx3itVvK4c_kQGvT5W1tTXT4
Message-ID: <CAF6AEGsKbjq_q7ezQTn5vyAF1cjXahgbv84uYK35BJH1KBXSpw@mail.gmail.com>
Subject: Re: [PATCH v6] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 8:58=E2=80=AFAM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add support for exporting a dma_fence fd for a specific point on a
> timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
> syncobj support, as it needs a way to turn a point on a timeline back
> into a dma_fence fd.  It also closes an odd omission from the syncobj
> UAPI.
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/8=
05
>
> v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
> v3: Add unstaged uabi header hunk
> v4: Also handle IMPORT_SYNC_FILE case
> v5: Address comments from Dmitry
> v6: checkpatch.pl nits
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 47 +++++++++++++++++++++++++++--------
>  include/uapi/drm/drm.h        |  4 +++
>  2 files changed, 41 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.=
c
> index 4f2ab8a7b50f..636cd83ca29e 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -741,7 +741,7 @@ static int drm_syncobj_fd_to_handle(struct drm_file *=
file_private,
>  }
>
>  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_priv=
ate,
> -                                             int fd, int handle)
> +                                             int fd, int handle, u64 poi=
nt)
>  {
>         struct dma_fence *fence =3D sync_file_get_fence(fd);
>         struct drm_syncobj *syncobj;
> @@ -755,14 +755,24 @@ static int drm_syncobj_import_sync_file_fence(struc=
t drm_file *file_private,
>                 return -ENOENT;
>         }
>
> -       drm_syncobj_replace_fence(syncobj, fence);
> +       if (point) {
> +               struct dma_fence_chain *chain =3D dma_fence_chain_alloc()=
;
> +
> +               if (!chain)
> +                       return -ENOMEM;
> +
> +               drm_syncobj_add_point(syncobj, chain, fence, point);
> +       } else {
> +               drm_syncobj_replace_fence(syncobj, fence);
> +       }
> +
>         dma_fence_put(fence);
>         drm_syncobj_put(syncobj);
>         return 0;
>  }
>
>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> -                                       int handle, int *p_fd)
> +                                       int handle, u64 point, int *p_fd)
>  {
>         int ret;
>         struct dma_fence *fence;
> @@ -772,7 +782,7 @@ static int drm_syncobj_export_sync_file(struct drm_fi=
le *file_private,
>         if (fd < 0)
>                 return fd;
>
> -       ret =3D drm_syncobj_find_fence(file_private, handle, 0, 0, &fence=
);
> +       ret =3D drm_syncobj_find_fence(file_private, handle, point, 0, &f=
ence);
>         if (ret)
>                 goto err_put_fd;
>
> @@ -869,6 +879,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev=
, void *data,
>                                    struct drm_file *file_private)
>  {
>         struct drm_syncobj_handle *args =3D data;
> +       unsigned int valid_flags =3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMEL=
INE |
> +                                  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_=
SYNC_FILE;
> +       u64 point =3D 0;
>
>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>                 return -EOPNOTSUPP;
> @@ -876,13 +889,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *d=
ev, void *data,
>         if (args->pad)
>                 return -EINVAL;
>
> -       if (args->flags !=3D 0 &&
> -           args->flags !=3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_F=
ILE)
> +       if (args->flags & ~valid_flags)
>                 return -EINVAL;
>
> +       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
> +               point =3D args->point;
> +
>         if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE=
)
>                 return drm_syncobj_export_sync_file(file_private, args->h=
andle,
> -                                                   &args->fd);
> +                                                   point, &args->fd);
> +
> +       if (args->point)
> +               return -EINVAL;
>
>         return drm_syncobj_handle_to_fd(file_private, args->handle,
>                                         &args->fd);
> @@ -893,6 +911,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev=
, void *data,
>                                    struct drm_file *file_private)
>  {
>         struct drm_syncobj_handle *args =3D data;
> +       unsigned int valid_flags =3D DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMEL=
INE |
> +                                  DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_=
SYNC_FILE;
> +       u64 point =3D 0;
>
>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>                 return -EOPNOTSUPP;

oh, I suppose I should add a check for DRIVER_SYNCOBJ_TIMELINE?  I'll
send a v7 a bit later

BR,
-R

> @@ -900,14 +921,20 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *d=
ev, void *data,
>         if (args->pad)
>                 return -EINVAL;
>
> -       if (args->flags !=3D 0 &&
> -           args->flags !=3D DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_F=
ILE)
> +       if (args->flags & ~valid_flags)
>                 return -EINVAL;
>
> +       if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE)
> +               point =3D args->point;
> +
>         if (args->flags & DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE=
)
>                 return drm_syncobj_import_sync_file_fence(file_private,
>                                                           args->fd,
> -                                                         args->handle);
> +                                                         args->handle,
> +                                                         point);
> +
> +       if (args->point)
> +               return -EINVAL;
>
>         return drm_syncobj_fd_to_handle(file_private, args->fd,
>                                         &args->handle);
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 7fba37b94401..e63a71d3c607 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -905,13 +905,17 @@ struct drm_syncobj_destroy {
>  };
>
>  #define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE (1 << 0)
> +#define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE         (1 << 1)
>  #define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE (1 << 0)
> +#define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE         (1 << 1)
>  struct drm_syncobj_handle {
>         __u32 handle;
>         __u32 flags;
>
>         __s32 fd;
>         __u32 pad;
> +
> +       __u64 point;
>  };
>
>  struct drm_syncobj_transfer {
> --
> 2.49.0
>

