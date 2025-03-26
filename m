Return-Path: <linux-media+bounces-28790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD1A71962
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 15:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ABB517D299
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 14:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A631F3BAE;
	Wed, 26 Mar 2025 14:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYXN9ZXj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBF618EB0;
	Wed, 26 Mar 2025 14:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000418; cv=none; b=s+ndm18scIOlGFCx2eTyXemOyVBIc28PJJlKyY+EX7+EASZ65p1W7jHMalbmquUGRTTFTBv+hkbdcDsbjuJelLIFOXf6M2PcWK+DJ4RezLg4HRIfnsiXonTswcPdIeiYFaAhu48xpNQwUMrK4xhkGaBm4bGxgwyltCSfFNxEFSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000418; c=relaxed/simple;
	bh=MDabLycR3eVXHjW9aTAlVmTDW1NcgLcT6BbTcpxQhE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUY06VxZd8cCDVE0Mnb+X4UfSadILtAm/jhmFjGECT6VEYG5UW99iheOGoWDN0aVp4S+MoMvqbpu1oXD+czk3Cyhu5rRd2sqilmZeASk5UZGgXoP3kvslRQIri0HBbVFBTF/vBj/BoWHkJXoRs9Jpdv/P760Apaz4XRFsfRHPX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYXN9ZXj; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3cf8e017abcso26432335ab.1;
        Wed, 26 Mar 2025 07:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000415; x=1743605215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIzY6JuPtPbu1sd31VEp2X/O3x/UgKedEbGz6vT002k=;
        b=JYXN9ZXjYplhuYwBq5nYLwduBEQj34MxftePDxokCU8EQxnFB+VrMcGY5srJ7u6v9U
         VuoPFFnkOn8y8L0E5cCN9wAu2p+hcOHCNEwgvSQWhDaqkOw8N76DF6ALM7+61vEDs7bT
         aDTmwxL8e215SnFxSnDZO7spEvJjQ65RTXLupdvJAJdt1XaP1E/NrsH9s+Cx2caP98bq
         ArBSr9H+PQstpEICf5By+pz1ySZqHaNcLTEKehZU64jqBrdNI3wmDQjhkz8xm69Ip6F+
         ib4MWpOGk/VcL/xp9LQijvhovbFqln4QoCKFS9RS93CyrwJUoR9oxl8m6A6WmvHIapiQ
         YpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000415; x=1743605215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIzY6JuPtPbu1sd31VEp2X/O3x/UgKedEbGz6vT002k=;
        b=ftKRxQvQLMfPQ65EC4yVjqMo8mtTAxfgjl5+COEqtHJXs0wN8HwyFxMJ2O63CI7AFN
         uuM9Os0dTjd646nI3Z5bu83fWLcd8ShPbXmmLxbr17dnHSQ0w6t00PJmA994jnU+KqDe
         iiFOw00nbp3BzL8rqrIPog0HLv54HmX/jo9JrSXvSbWbpYjwKd7bTqfvKEPoRjA4QGtX
         8jhTEiw+BB2OTK811fXD93REx5d4yJOAaS0WFlQt553i4m0eXSQXjwzHH6n6fsLBQFnY
         HpW7etAI8UdPSo52mPkIn1gjNs65ChrO9/ZRWMr0icL1DOp/fXAqRR6PfhX0C2+F6s0I
         ZIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUD/jWIpnOkOHPESIt0VZUsnzLCNCMK12P8qlFB28aGbb45UgQzl8wIxziACxIstwVo84+ThA/JS4WpIE=@vger.kernel.org, AJvYcCWoDouDevyMwhUgFRgKhKW1uKrr0eAtDOKXsW1N6NThZYSVpBPBzssYxUmhr+jlc6lRoioDk2i9OYvSvBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YySExPbnVZNifGt4mDrXVX+8HmbGR/FAsst3TJSI7PNLXanb72W
	UQZsYc4z7IVPJVzGA7GCRAf4DjAymbDbH9cYouisjsFmAjvUn4QMjesftVdohIPNkyvYzHTdUlA
	ZNNVlBqF6mQ2AMJcfi7Y69pbCzZk=
X-Gm-Gg: ASbGncsHQhvuoxe8tC2YS3hOUewYnkZsd7hFCH8BrI1zbTLap457yu156LYN4ryq8q4
	nMmh0c50y2uRwCfT5lEC8JhGT7rXhEECGOfNv/zqgASpYsRoMiMMYGS1QtIqVVSLgv9iF4qkZ3L
	sZ82BHqwWRfh1VzlYjrLtiWi02fgl/fkwOcS/KC1wKd/xgSKGBtvScw7I=
X-Google-Smtp-Source: AGHT+IH8ychrG0Yq2ngyD0ecOqCO0RE/LXSO0aLcakG9T0PKFMWXaArBnOsdvh7pxztVoJ5s0s/eUYqjpz4S8ZEnOmM=
X-Received: by 2002:a05:6e02:260f:b0:3d3:ced4:db9b with SMTP id
 e9e14a558f8ab-3d5960bf801mr234679015ab.5.1743000415399; Wed, 26 Mar 2025
 07:46:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326143903.24380-1-robdclark@gmail.com> <342ee079-ee0e-470d-afd2-c2870115b489@amd.com>
In-Reply-To: <342ee079-ee0e-470d-afd2-c2870115b489@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Mar 2025 07:46:43 -0700
X-Gm-Features: AQ5f1Jot6jmzcgenF9qhrGVKGty_zzWylGXQwExIfmbDgtMjYHnUNBwSawcKJxY
Message-ID: <CAF6AEGu2Ax+u3QmD2VADwh4A4s5TAmP5Lq4DcYYadKP4csH-=g@mail.gmail.com>
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

On Wed, Mar 26, 2025 at 7:41=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.03.25 um 15:39 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add support for exporting a dma_fence fd for a specific point on a
> > timeline.
>
> Looks good on first glance. What's the userspace use case?

Timeline syncobj support for vtest/vpipe[1][2].. since core
virglrender and drm native ctx works in terms of fences (since in the
VM case, everything is a fence below the guest kernel uabi), we need
to be able to turn a point on a timeline back into a fence fd.  (Plus
it seemed like an odd omission from the existing uabi.)

BR,
-R

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
[2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/805

>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_syncobj.c | 8 ++++++--
> >  include/uapi/drm/drm.h        | 2 ++
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 4f2ab8a7b50f..eb7a2dd2e261 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -762,7 +762,7 @@ static int drm_syncobj_import_sync_file_fence(struc=
t drm_file *file_private,
> >  }
> >
> >  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> > -                                     int handle, int *p_fd)
> > +                                     int handle, u64 point, int *p_fd)
> >  {
> >       int ret;
> >       struct dma_fence *fence;
> > @@ -772,7 +772,7 @@ static int drm_syncobj_export_sync_file(struct drm_=
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
> > @@ -882,8 +882,12 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *=
dev, void *data,
> >
> >       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE=
)
> >               return drm_syncobj_export_sync_file(file_private, args->h=
andle,
> > +                                                 args->point,
> >                                                   &args->fd);
> >
> > +     if (args->point)
> > +             return -EINVAL;
> > +
> >       return drm_syncobj_handle_to_fd(file_private, args->handle,
> >                                       &args->fd);
> >  }
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 7fba37b94401..c71a8f4439f2 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -912,6 +912,8 @@ struct drm_syncobj_handle {
> >
> >       __s32 fd;
> >       __u32 pad;
> > +
> > +     __u64 point;
> >  };
> >
> >  struct drm_syncobj_transfer {
>

