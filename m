Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AC9357F24
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 11:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhDHJad (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 05:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhDHJad (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 05:30:33 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2340C061761
        for <linux-media@vger.kernel.org>; Thu,  8 Apr 2021 02:30:21 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id c4so1506518qkg.3
        for <linux-media@vger.kernel.org>; Thu, 08 Apr 2021 02:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5XAETM08UhZJwTK0Ph/sGGuD9pkmUaZXwlb/7bKpHG4=;
        b=RXSQzyKQL1eJYRKOZk+dBbXVRZto6VVGAwnc/oQX7tUGkscauRyDo6UQjNJ1X1EvJb
         3o0K4zVGa1VZhIe6Xf424YK3j6VNXjD13pXV0TxJEB29hdCGeHEw6mMLl4V+xhtK0ocp
         Io3hQ2BWehASgwBQIhMcIqohLdCGvYg0677LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5XAETM08UhZJwTK0Ph/sGGuD9pkmUaZXwlb/7bKpHG4=;
        b=jbzrClUaYDTv/CASdvdoA99llU7T+c5d/+RmhhS9+lWfwbWjdQTyPpBOxarzbmD15N
         pnk8rvm/0Le2OVlJM37aUJAwR2AO2I/W0VF8YJbsRE0ljfWtkZ7C4uyJIVzl/B0X2REs
         n2XjTyQpq5BnOhXxqyvFUy6xYqK5Kv/F8xpoTX5ri1Cph+nh8qwaWmSO2w/jpWsOOh6b
         efJWLMqTi1LWAbjIMT+2pUJ7cIULCrFDRH9GzDCA+ts5AeUhX4jiRDiY2BMNrr7bUepl
         ZNECvl9bOCwN+MwPlldUYwxDkEDxyz2EFMasuTtYY2LsA5FuCtEyW7KHe87Zb26c41g2
         D3Bw==
X-Gm-Message-State: AOAM530bdIKV7p4E/viAJ/+sZoDKjsTcSyvsotla5L0sly8lR8R0hq+M
        trAMa8Exg8RMPiGJ+bD5hci6phZKBLffg9ym+heDOA==
X-Google-Smtp-Source: ABdhPJwWEqQurfmYq870drV/cynKIHeNVetiz3skgFdCEUNUOHHIA1edbdLeID25R0yhfxOw5xD/m5nnfHR5aMC+hhc=
X-Received: by 2002:a37:9bd1:: with SMTP id d200mr7585951qke.328.1617874221077;
 Thu, 08 Apr 2021 02:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210408045926.3202160-1-stevensd@google.com> <7f22ac22-dbe0-f056-b7db-24fa60f9724e@amd.com>
In-Reply-To: <7f22ac22-dbe0-f056-b7db-24fa60f9724e@amd.com>
From:   David Stevens <stevensd@chromium.org>
Date:   Thu, 8 Apr 2021 18:30:10 +0900
Message-ID: <CAD=HUj5vS7VZQ-Meaz_Q1xEoamE_2fF0VE-RGj0sfUu0apP7Zg@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/syncobj: use dma_fence_get_stub"
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 8, 2021 at 4:03 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 08.04.21 um 06:59 schrieb David Stevens:
> > From: David Stevens <stevensd@chromium.org>
> >
> > This reverts commit 86bbd89d5da66fe760049ad3f04adc407ec0c4d6.
> >
> > Using the singleton stub fence in drm_syncobj_assign_null_handle means
> > that all syncobjs created in an already signaled state or any syncobjs
> > signaled by userspace will reference the singleton fence when exported
> > to a sync_file. If those sync_files are queried with SYNC_IOC_FILE_INFO=
,
> > then the timestamp_ns value returned will correspond to whenever the
> > singleton stub fence was first initialized. This can break the ability
> > of userspace to use timestamps of these fences, as the singleton stub
> > fence's timestamp bears no relationship to any meaningful event.
>
> And why exactly is having the timestamp of the call to
> drm_syncobj_assign_null_handle() better?

The timestamp returned by SYNC_IOC_FILE_INFO is the "timestamp of
status change in nanoseconds". If userspace signals the fence with
DRM_IOCTL_SYNCOBJ_SIGNAL, then a timestamp from
drm_syncobj_assign_null_handle corresponds to the status change. If
userspace sets DRM_SYNCOBJ_CREATE_SIGNALED when creating a fence, then
the status change happens immediately upon creation, which again
corresponds to when drm_syncobj_assign_null_handle gets called.

> Additional if you really need that please don't revert the patch.
> Instead provide a function which returns a newly initialized stub fence
> in the dma_fence.c code.

Ack.

-David

> Regards,
> Christian.
>
> >
> > Signed-off-by: David Stevens <stevensd@chromium.org>
> > ---
> >   drivers/gpu/drm/drm_syncobj.c | 58 ++++++++++++++++++++++++++--------=
-
> >   1 file changed, 44 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 349146049849..7cc11f1a83f4 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -211,6 +211,21 @@ struct syncobj_wait_entry {
> >   static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
> >                                     struct syncobj_wait_entry *wait);
> >
> > +struct drm_syncobj_stub_fence {
> > +     struct dma_fence base;
> > +     spinlock_t lock;
> > +};
> > +
> > +static const char *drm_syncobj_stub_fence_get_name(struct dma_fence *f=
ence)
> > +{
> > +     return "syncobjstub";
> > +}
> > +
> > +static const struct dma_fence_ops drm_syncobj_stub_fence_ops =3D {
> > +     .get_driver_name =3D drm_syncobj_stub_fence_get_name,
> > +     .get_timeline_name =3D drm_syncobj_stub_fence_get_name,
> > +};
> > +
> >   /**
> >    * drm_syncobj_find - lookup and reference a sync object.
> >    * @file_private: drm file private pointer
> > @@ -344,18 +359,24 @@ void drm_syncobj_replace_fence(struct drm_syncobj=
 *syncobj,
> >   }
> >   EXPORT_SYMBOL(drm_syncobj_replace_fence);
> >
> > -/**
> > - * drm_syncobj_assign_null_handle - assign a stub fence to the sync ob=
ject
> > - * @syncobj: sync object to assign the fence on
> > - *
> > - * Assign a already signaled stub fence to the sync object.
> > - */
> > -static void drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj=
)
> > +static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
> >   {
> > -     struct dma_fence *fence =3D dma_fence_get_stub();
> > +     struct drm_syncobj_stub_fence *fence;
> >
> > -     drm_syncobj_replace_fence(syncobj, fence);
> > -     dma_fence_put(fence);
> > +     fence =3D kzalloc(sizeof(*fence), GFP_KERNEL);
> > +     if (fence =3D=3D NULL)
> > +             return -ENOMEM;
> > +
> > +     spin_lock_init(&fence->lock);
> > +     dma_fence_init(&fence->base, &drm_syncobj_stub_fence_ops,
> > +                    &fence->lock, 0, 0);
> > +     dma_fence_signal(&fence->base);
> > +
> > +     drm_syncobj_replace_fence(syncobj, &fence->base);
> > +
> > +     dma_fence_put(&fence->base);
> > +
> > +     return 0;
> >   }
> >
> >   /* 5s default for wait submission */
> > @@ -469,6 +490,7 @@ EXPORT_SYMBOL(drm_syncobj_free);
> >   int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t fla=
gs,
> >                      struct dma_fence *fence)
> >   {
> > +     int ret;
> >       struct drm_syncobj *syncobj;
> >
> >       syncobj =3D kzalloc(sizeof(struct drm_syncobj), GFP_KERNEL);
> > @@ -479,8 +501,13 @@ int drm_syncobj_create(struct drm_syncobj **out_sy=
ncobj, uint32_t flags,
> >       INIT_LIST_HEAD(&syncobj->cb_list);
> >       spin_lock_init(&syncobj->lock);
> >
> > -     if (flags & DRM_SYNCOBJ_CREATE_SIGNALED)
> > -             drm_syncobj_assign_null_handle(syncobj);
> > +     if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
> > +             ret =3D drm_syncobj_assign_null_handle(syncobj);
> > +             if (ret < 0) {
> > +                     drm_syncobj_put(syncobj);
> > +                     return ret;
> > +             }
> > +     }
> >
> >       if (fence)
> >               drm_syncobj_replace_fence(syncobj, fence);
> > @@ -1322,8 +1349,11 @@ drm_syncobj_signal_ioctl(struct drm_device *dev,=
 void *data,
> >       if (ret < 0)
> >               return ret;
> >
> > -     for (i =3D 0; i < args->count_handles; i++)
> > -             drm_syncobj_assign_null_handle(syncobjs[i]);
> > +     for (i =3D 0; i < args->count_handles; i++) {
> > +             ret =3D drm_syncobj_assign_null_handle(syncobjs[i]);
> > +             if (ret < 0)
> > +                     break;
> > +     }
> >
> >       drm_syncobj_array_free(syncobjs, args->count_handles);
> >
>
