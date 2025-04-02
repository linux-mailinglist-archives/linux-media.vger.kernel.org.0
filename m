Return-Path: <linux-media+bounces-29250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B2A792C0
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 18:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 667381890E83
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 16:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E8A18DF80;
	Wed,  2 Apr 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/0wQUIl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B973139D0A;
	Wed,  2 Apr 2025 16:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743610334; cv=none; b=fkAREyc9dBJW2DwINBwOULGuXfKwykVUDzHqD3aJ3kfrC1q86AicxAMkrA5H5SyoMwoVH/Z3BS7xYc95NbKbtW6WBqK2AEPx4ihnY5L/3+c66J124cGNRlIwuCYdfi2gCzi5EguzSigux7wTWh+vHroGBRCI9Xntm+2jT77yaKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743610334; c=relaxed/simple;
	bh=CmJZSvVlPvhoNUkiAMzo21sJ0WPv8J2bj1Yx+V83y4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JchqCCW9sjgpOHRH9/ABtKOviTsvj+4OWBMDdzefZykWxicc+tSSAHmNlC5NbvzXrfQAB2xOuEtxq0ffZ0ME28Mgi6V2YsEMImRy543hEIzQ4bfF1KORZBgY8gUaMP2yi49uAj07J99lpIym0CGyXUCd7d6o7b3kNRyCMLBKb2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/0wQUIl; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d442a77a03so120745ab.1;
        Wed, 02 Apr 2025 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743610331; x=1744215131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rK9kTwLfXEgDnRykzZWh9AEgnuJfNseTnoRiIhmpsc=;
        b=K/0wQUIlWZAKX1A/VS1FWCMS7YE8ilwjmQbbxSX2I1/Miu61Od4yf7C9Katl+h7fkS
         89Su4z8RsuzJRYm4dEFCJPtSH4zvsZUwlgoUAZ2xLfRsptEaQIhZOGJmN5bUjcn1dSEz
         T44DIlL5emK+Uz5rWKNaCVNtH/DzJkIIV33yvwqqaCV/OKg6/KC4pjsuasJnPJ/CvQsH
         CZ3V8nL9oGfzW/5t3MST3pZlDmr8AZOwKeq5+Kq23Y/1JhwtoJHj0SdTBxV7t4QT57Fs
         ZWbB0FpzpNjEEExdeQJb/OVBGKrHQEISI4FnMYpZ/dCJ7zzsSj7J1+RfsOPYfUfeggF0
         DWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743610331; x=1744215131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rK9kTwLfXEgDnRykzZWh9AEgnuJfNseTnoRiIhmpsc=;
        b=jDAjo7FjtN87MdNVtvgo9DNrKouCQ35hPZvRGnBnn6ZXNA9oqAGn0+Aopq8W/7fUqH
         LyQpsVazYJ07JRxw4Ztugf0/s0iZXE2lzRAJsKD/4alqTNhEFeiAMFgxkWvfncH47ECx
         2iaMa3lR8OrK3LvbKQez3bj1jC2s+YwT1b6KaJ0IXs1geRCPxkrshRK/S6dfgAS4Md14
         y+bak7+5SIhZ81a3Pdv2pjXVVaT/sNhKD6OvovqT6J5LRNo8KgNqKpZ/as8Qf50f1Cxk
         BoRRAMzXfjiznWIcJkfMKl+d6QN6xWdTbHaBdHRZqxKwhpTQ/cDXRTTprMDwgLRiiMMY
         hfag==
X-Forwarded-Encrypted: i=1; AJvYcCWnkLxrumrwwHUhcpnfvynyODzimS8sknyIuWkm8uKs6XP57HeVQbJMIusXT9gfxt2h/dOIrz9hDgfxUR4=@vger.kernel.org, AJvYcCXSXtJAXwaFMODWjLbzD2QD41cy2h9GfT/s08qVVkk3V8pzs/jBaLkUsxm8ogSWs4jtAdOPpw5pn1KKmqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YypAWDuOHa6JKQjOV1ys2uTEleIEmmXiS92/l8bRgGgFPNmXzDb
	36u0XddZqj0htV7hnUBranWSMDgVBZmwhidilUkrtSlcNrGeE6e/dNVrEOunBSwzfOKRhvnJ5di
	ZZZ0eWnAl6RGtxtOm7k/6n9ix/qs=
X-Gm-Gg: ASbGncsWjrLuRdILo7sMpFdJWFWTIr4U/xQt+yuhPY0CJ1DrME1yW40Wp/lYxDcDFa6
	n+nxN0nnOh+Crj/fqompuQ9xPDI/DSxGwGYymkxkZcKsbUUa6HRW/FTgJCB9EbJP05NIJddaQEb
	MZCNcw8h530/bpIr1zd+0e2i6/07BAYTxr5XKBNSFR5iepT8utzbd04X6TOFdywjZ3kfz2c/w=
X-Google-Smtp-Source: AGHT+IFkYI6mSsCBU3Xd58kZsuiXhxMXIV+xUr1NKSGa56kWg9906qGj0TOjzVUzEtK07ut+ViwxdQy4wwNXDrQnrD0=
X-Received: by 2002:a05:6e02:4401:10b0:3d6:d3f7:8813 with SMTP id
 e9e14a558f8ab-3d6d3f7c3c0mr33927585ab.22.1743610331229; Wed, 02 Apr 2025
 09:12:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401155758.48855-1-robdclark@gmail.com> <CAF6AEGsKbjq_q7ezQTn5vyAF1cjXahgbv84uYK35BJH1KBXSpw@mail.gmail.com>
 <ff614cb7-94ca-4d74-9bbb-f97c95893113@collabora.com> <b636faa5-ab31-41d6-b957-4dfe89a2b47d@amd.com>
In-Reply-To: <b636faa5-ab31-41d6-b957-4dfe89a2b47d@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 2 Apr 2025 09:11:59 -0700
X-Gm-Features: AQ5f1JoTRdjAnHaCZTeG_hJr4mmegr_fGINI7Zx0FF-EN5SHZjfv1OdMb7Fb8uc
Message-ID: <CAF6AEGutP-TTJjt=HrzpYooUerQ3jETYz=Mw8NEb2h3kLo=3kA@mail.gmail.com>
Subject: Re: [PATCH v6] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, dri-devel@lists.freedesktop.org, 
	Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 11:55=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 01.04.25 um 22:46 schrieb Dmitry Osipenko:
> > On 4/1/25 23:40, Rob Clark wrote:
> >> On Tue, Apr 1, 2025 at 8:58=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Add support for exporting a dma_fence fd for a specific point on a
> >>> timeline.  This is needed for vtest/vpipe[1][2] to implement timeline
> >>> syncobj support, as it needs a way to turn a point on a timeline back
> >>> into a dma_fence fd.  It also closes an odd omission from the syncobj
> >>> UAPI.
> >>>
> >>> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
> >>> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_reques=
ts/805
> >>>
> >>> v2: Add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
> >>> v3: Add unstaged uabi header hunk
> >>> v4: Also handle IMPORT_SYNC_FILE case
> >>> v5: Address comments from Dmitry
> >>> v6: checkpatch.pl nits
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>> ---
> >>>  drivers/gpu/drm/drm_syncobj.c | 47 +++++++++++++++++++++++++++------=
--
> >>>  include/uapi/drm/drm.h        |  4 +++
> >>>  2 files changed, 41 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_sync=
obj.c
> >>> index 4f2ab8a7b50f..636cd83ca29e 100644
> >>> --- a/drivers/gpu/drm/drm_syncobj.c
> >>> +++ b/drivers/gpu/drm/drm_syncobj.c
> >>> @@ -741,7 +741,7 @@ static int drm_syncobj_fd_to_handle(struct drm_fi=
le *file_private,
> >>>  }
> >>>
> >>>  static int drm_syncobj_import_sync_file_fence(struct drm_file *file_=
private,
> >>> -                                             int fd, int handle)
> >>> +                                             int fd, int handle, u64=
 point)
> >>>  {
> >>>         struct dma_fence *fence =3D sync_file_get_fence(fd);
> >>>         struct drm_syncobj *syncobj;
> >>> @@ -755,14 +755,24 @@ static int drm_syncobj_import_sync_file_fence(s=
truct drm_file *file_private,
> >>>                 return -ENOENT;
> >>>         }
> >>>
> >>> -       drm_syncobj_replace_fence(syncobj, fence);
> >>> +       if (point) {
> >>> +               struct dma_fence_chain *chain =3D dma_fence_chain_all=
oc();
> >>> +
> >>> +               if (!chain)
> >>> +                       return -ENOMEM;
> >>> +
> >>> +               drm_syncobj_add_point(syncobj, chain, fence, point);
> >>> +       } else {
> >>> +               drm_syncobj_replace_fence(syncobj, fence);
> >>> +       }
> >>> +
> >>>         dma_fence_put(fence);
> >>>         drm_syncobj_put(syncobj);
> >>>         return 0;
> >>>  }
> >>>
> >>>  static int drm_syncobj_export_sync_file(struct drm_file *file_privat=
e,
> >>> -                                       int handle, int *p_fd)
> >>> +                                       int handle, u64 point, int *p=
_fd)
> >>>  {
> >>>         int ret;
> >>>         struct dma_fence *fence;
> >>> @@ -772,7 +782,7 @@ static int drm_syncobj_export_sync_file(struct dr=
m_file *file_private,
> >>>         if (fd < 0)
> >>>                 return fd;
> >>>
> >>> -       ret =3D drm_syncobj_find_fence(file_private, handle, 0, 0, &f=
ence);
> >>> +       ret =3D drm_syncobj_find_fence(file_private, handle, point, 0=
, &fence);
> >>>         if (ret)
> >>>                 goto err_put_fd;
> >>>
> >>> @@ -869,6 +879,9 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device =
*dev, void *data,
> >>>                                    struct drm_file *file_private)
> >>>  {
> >>>         struct drm_syncobj_handle *args =3D data;
> >>> +       unsigned int valid_flags =3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_T=
IMELINE |
> >>> +                                  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXP=
ORT_SYNC_FILE;
> >>> +       u64 point =3D 0;
> >>>
> >>>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
> >>>                 return -EOPNOTSUPP;
> >>> @@ -876,13 +889,18 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_devic=
e *dev, void *data,
> >>>         if (args->pad)
> >>>                 return -EINVAL;
> >>>
> >>> -       if (args->flags !=3D 0 &&
> >>> -           args->flags !=3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SY=
NC_FILE)
> >>> +       if (args->flags & ~valid_flags)
> >>>                 return -EINVAL;
> >>>
> >>> +       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE)
> >>> +               point =3D args->point;
> >>> +
> >>>         if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_=
FILE)
> >>>                 return drm_syncobj_export_sync_file(file_private, arg=
s->handle,
> >>> -                                                   &args->fd);
> >>> +                                                   point, &args->fd)=
;
> >>> +
> >>> +       if (args->point)
> >>> +               return -EINVAL;
> >>>
> >>>         return drm_syncobj_handle_to_fd(file_private, args->handle,
> >>>                                         &args->fd);
> >>> @@ -893,6 +911,9 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device =
*dev, void *data,
> >>>                                    struct drm_file *file_private)
> >>>  {
> >>>         struct drm_syncobj_handle *args =3D data;
> >>> +       unsigned int valid_flags =3D DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_T=
IMELINE |
> >>> +                                  DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMP=
ORT_SYNC_FILE;
> >>> +       u64 point =3D 0;
> >>>
> >>>         if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
> >>>                 return -EOPNOTSUPP;
> >> oh, I suppose I should add a check for DRIVER_SYNCOBJ_TIMELINE?  I'll
> >> send a v7 a bit later
> > Christian already applied to misc-test, please rebase and make it as a
> > new patch
>
> Yeah, sorry I was a bit to quick obviously.
>
> On the other hand I don't see an immediate need for a check for DRIVER_SY=
NCOBJ_TIMELINE here.
>
> The functions should work even when the driver doesn't handle timeline sy=
ncobj on it's own.

Ok, no problem, I'll just put an explicit cap check in virglrenderer,
rather than relying on this to tell me also if the driver supports
timeline:

         struct drm_syncobj_handle args =3D {
            .handle =3D 0,   /* invalid handle */
            .flags =3D DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE |
                     DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE,
            .fd =3D -1,
            .point =3D 1,
         };

         errno =3D 0;
         ret =3D drmIoctl(fd, DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD, &args);

         /* ENOENT means the kernel supports
DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE
          * but that we didn't provide a valid handle.  EINVAL means
the kernel does
          * not support DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE.
          */
         if (errno =3D=3D ENOENT) {
            resp[0] =3D true;
            resp[1] =3D 1;
         } else {
            assert(errno =3D=3D EINVAL);
         }


BR,
-R

> Regards,
> Christian.
>
>

