Return-Path: <linux-media+bounces-28799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5880DA72025
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 21:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A2297A6301
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 20:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEF825E455;
	Wed, 26 Mar 2025 20:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5e2V9tM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99461EA7F3;
	Wed, 26 Mar 2025 20:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743022014; cv=none; b=myztkfqQJoyjNvR7WiF+P13RruwC7/Mmpy+qtsU/rybV/wIXGC1Kds0T0CnhHfzCv2rP2Cpxd8gTeGJiiRcjMiYbaDshGxuiyNazr5igu7Rw9M8dBkn7JdWB/biN1sOBQA8AZuwsYMh7pGn9xFvtqYFrYfMgSIjiaY/zkBMiOYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743022014; c=relaxed/simple;
	bh=XVvYprEkbjnr0JIrMIvTTJqMyViugTfS1DVRscCfwoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVEExqt6T+PnF7w1GGfXslLyoXKf0LyI1zT3qwyXM3dERhydSoAcocf4/AwJZOUisKgEkQxby/txwXpnJNQtWB0gx89swNTtOEflKpoN3G4ZdZNFDuZe1HduZhVlhaF/RhRqTNSyZIgNel60E0R/zZVspqsfxYOxaJAD/NwdXXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5e2V9tM; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so929425ab.2;
        Wed, 26 Mar 2025 13:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743022012; x=1743626812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JhMoKQ5EpQ1pQUTEtH4nghhLWcwT/i5YVCywj3TCE4=;
        b=d5e2V9tMEcmrPVq84rCbmwVXZK1bf2xG6xrCl2qHnr3obnVi0ekZNHLRZRNGmfRLdm
         hoKth9laikV9bH8Tz5y+Ma8lLwrfHoIQ8LY+Z3jJUejCqrlwyBuh15M+yA0lR5ybcIy/
         kt6MrBxvJeKVbDUn/LBLabEPN5qFgp7no25sPFJ4q7uu1IklnoTR0nAk+21y1kmvKNCu
         7wqKmoe6UwGZW+ucf8O/vKL/3oMwDbQluxwTckUG9fA1nHownI/btuxYkKNrlvEPUuCQ
         uWVbRx5r12uVhzbMLk7Kgk1n0mhcswhcAPia1ai4svhbtxoM1rdrvQtAdNMsFNx4nfYu
         p85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743022012; x=1743626812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JhMoKQ5EpQ1pQUTEtH4nghhLWcwT/i5YVCywj3TCE4=;
        b=F2eGP81H/j8wEHtpzvlVKdoD4vlQBaKoasJUDgSNQjjPjP/XPmVROxt25ZWReEEYMy
         MbCyJsbMOlaAF8CjjtDcVcAAicQlutrwimtLn+EagLepPLDQjuciRPu8DVUl6YwTMssW
         u9Q0rtTRbWmDWyA0i1IO1NYCUhNljtQAUZK10rvdUmk3LhBdG2bV30v50Abt0obmT2BT
         IwFam7iZ+CFJV0Q8SLD9B8BHDDaVUyJq7YEj5WqfNwRklhJAaR3PniqUmKWY1bg6NYyZ
         OkkatefdyhbB1bEIzQqrrsFH0/A1jhyQif7SoW322cChSowFyriF4GLHaTrT7FQUpsbV
         FWMw==
X-Forwarded-Encrypted: i=1; AJvYcCVMTQnmaJ9BtueMhjNyYQmBhL8W7Tnpc1PSmsKtg5wLxxtbaNJSM9gHPUz8U63/I/pE3/RGKMRzhp/Pg84=@vger.kernel.org, AJvYcCXbe1sYVmN4IK7FjVya946pO3Rkd33Kd5UD80Q21tVdmFf9JvlnNWrx4ITdhYbFbgnS60/61830ts8UwUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/708GuQXW6VVoJr5ISwTNu/PkJolOw39pwWA7U02xZh1YVUMT
	QvhDRzONF+xuDBoEbxFhWw20RqbawTMyDzNkS1HtN/BH8D62woooTREgRot3JkBG6UTdeUUHerp
	oOxTqRw68Vz64Mv7Dvx0cQ6sQ2+3sftWG
X-Gm-Gg: ASbGncuH4IrrUngO3bRo+BGWVcJQEZSRLvsdToZOmwoH5Nc8+7+sz6u4du0kgrRjTO7
	8BLiI2woDIvpcyiWw82U+mgW5wvOhk3eC/EHdz0eq9R/M4C1HZKY/au/QPZxPJ0MXRE4Jp9g4dd
	8D19zAKriZtQGCyKkpXCxBvNs2u8yYbZGIvQ6y8hfKtABJt79UNe6U3X4mcffmB8BCKT8=
X-Google-Smtp-Source: AGHT+IGLmmU7KJxynJ3JmzAzaYdjW5MSKvJRuKUzfOy/PXKBCJHqw2vGsRgic8SeuLTGlXrTd5GgP9KRL2pxFlwrF9Y=
X-Received: by 2002:a05:6e02:1fe8:b0:3d0:bd5:b863 with SMTP id
 e9e14a558f8ab-3d5cce27d98mr12686545ab.20.1743022011691; Wed, 26 Mar 2025
 13:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326143903.24380-1-robdclark@gmail.com> <342ee079-ee0e-470d-afd2-c2870115b489@amd.com>
 <CAF6AEGu2Ax+u3QmD2VADwh4A4s5TAmP5Lq4DcYYadKP4csH-=g@mail.gmail.com>
In-Reply-To: <CAF6AEGu2Ax+u3QmD2VADwh4A4s5TAmP5Lq4DcYYadKP4csH-=g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Mar 2025 13:46:39 -0700
X-Gm-Features: AQ5f1JrBlKDKgO0ATBxgVYhh5njSw5419j_VUVoZrjO0N4Ci8VzagRd6Vn0tpUY
Message-ID: <CAF6AEGv-Zad2GF-=gDdYQdZGkJ_u+eyBFvTNK49m5+1ycaZu9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 7:46=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Wed, Mar 26, 2025 at 7:41=E2=80=AFAM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 26.03.25 um 15:39 schrieb Rob Clark:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add support for exporting a dma_fence fd for a specific point on a
> > > timeline.
> >
> > Looks good on first glance. What's the userspace use case?
>
> Timeline syncobj support for vtest/vpipe[1][2].. since core
> virglrender and drm native ctx works in terms of fences (since in the
> VM case, everything is a fence below the guest kernel uabi), we need
> to be able to turn a point on a timeline back into a fence fd.  (Plus
> it seemed like an odd omission from the existing uabi.)
>
> BR,
> -R
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/8=
05
>
> >
> > Regards,
> > Christian.
> >
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/drm_syncobj.c | 8 ++++++--
> > >  include/uapi/drm/drm.h        | 2 ++
> > >  2 files changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_sync=
obj.c
> > > index 4f2ab8a7b50f..eb7a2dd2e261 100644
> > > --- a/drivers/gpu/drm/drm_syncobj.c
> > > +++ b/drivers/gpu/drm/drm_syncobj.c
> > > @@ -762,7 +762,7 @@ static int drm_syncobj_import_sync_file_fence(str=
uct drm_file *file_private,
> > >  }
> > >
> > >  static int drm_syncobj_export_sync_file(struct drm_file *file_privat=
e,
> > > -                                     int handle, int *p_fd)
> > > +                                     int handle, u64 point, int *p_f=
d)
> > >  {
> > >       int ret;
> > >       struct dma_fence *fence;
> > > @@ -772,7 +772,7 @@ static int drm_syncobj_export_sync_file(struct dr=
m_file *file_private,
> > >       if (fd < 0)
> > >               return fd;
> > >
> > > -     ret =3D drm_syncobj_find_fence(file_private, handle, 0, 0, &fen=
ce);
> > > +     ret =3D drm_syncobj_find_fence(file_private, handle, point, 0, =
&fence);
> > >       if (ret)
> > >               goto err_put_fd;
> > >
> > > @@ -882,8 +882,12 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device=
 *dev, void *data,
> > >
> > >       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FI=
LE)
> > >               return drm_syncobj_export_sync_file(file_private, args-=
>handle,
> > > +                                                 args->point,
> > >                                                   &args->fd);

Hmm, maybe I should add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE so
that userspace gets a clean error on older kernels, rather than having
the point param be silently ignored..

BR,
-R

> > >
> > > +     if (args->point)
> > > +             return -EINVAL;
> > > +
> > >       return drm_syncobj_handle_to_fd(file_private, args->handle,
> > >                                       &args->fd);
> > >  }
> > > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > > index 7fba37b94401..c71a8f4439f2 100644
> > > --- a/include/uapi/drm/drm.h
> > > +++ b/include/uapi/drm/drm.h
> > > @@ -912,6 +912,8 @@ struct drm_syncobj_handle {
> > >
> > >       __s32 fd;
> > >       __u32 pad;
> > > +
> > > +     __u64 point;
> > >  };
> > >
> > >  struct drm_syncobj_transfer {
> >

