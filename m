Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FF6358024
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 12:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhDHKAS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 06:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhDHKAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 06:00:16 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4366BC061760
        for <linux-media@vger.kernel.org>; Thu,  8 Apr 2021 03:00:05 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id q26so1539773qkm.6
        for <linux-media@vger.kernel.org>; Thu, 08 Apr 2021 03:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TjMXPxgdcWLwg3HHxfz7xUxG8qs2PWdH8nXM2CLjB+o=;
        b=gMg1WWlwvL/P1OTnrl6+6JpkrxhoO/PiyHdKo9peBiI09ZW3TEVzuVXZpZg2vYBioS
         PfYZMgTHRRMMXrv0DRG63sU6Ei/j3p03EGaIlLS4/29rS3l4UhdkKn0HJmxmt+wKoDQ9
         ayPQOBNw9f7Z2CKEc6TOjro7NGUyqm1RTgXxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TjMXPxgdcWLwg3HHxfz7xUxG8qs2PWdH8nXM2CLjB+o=;
        b=CAQufNNvPYqYdppiUgiKJfjiceiX/L9O+ID1fjwwaiUBIqpYixUm5mPZ18Tphot4DC
         Q9P1HZUBo+kBMSBDt0qqLFfSqZNkKjclPaS4QDVL+xxVMTNO0Enezkzq/Nqvh/dF/6px
         8jmPluPcK9Rz48qv3roqACFD+w6+g6RTd6MJv/wDiXVHViCsyvlSc0CUDMYGq5CFerFP
         YT1Cqn5eh2y7rCnvwWR4MQFvhfySBzGdPXAf6jDenIzMBfr0jk4cbr1PsZZTFqqV3Bx4
         oUehGO8kSoUXyX6NbC5krtbPwoGQsCQl+EZXkt7+rJg4N39ZWttt/nn79dZLAUPxqB3j
         teuQ==
X-Gm-Message-State: AOAM531JEOyo2irzZb9hmVwykYBoWNCYYz886TGDOfNg9ZKYe85YxTW9
        uNOqprFe7DPOfoFTKrTtS60DXIMAb9Up4S0U15RD0Q==
X-Google-Smtp-Source: ABdhPJz56m2S81SB+Vk01VDd0B9PR6rluJ8GjWc0odS3E5DUUz2POvMdARG4DmvutKcBbWwWPMGfDeZeb5j+spF4RDM=
X-Received: by 2002:a05:620a:2190:: with SMTP id g16mr7476782qka.241.1617876004539;
 Thu, 08 Apr 2021 03:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210408095428.3983055-1-stevensd@google.com> <ce605cb0-ad27-e1b0-84c8-647ad1e19405@amd.com>
In-Reply-To: <ce605cb0-ad27-e1b0-84c8-647ad1e19405@amd.com>
From:   David Stevens <stevensd@chromium.org>
Date:   Thu, 8 Apr 2021 18:59:54 +0900
Message-ID: <CAD=HUj4Lgm9MbBD1-VvYpAySvKf0k2rK5heDNz35h8s6qTLZ0A@mail.gmail.com>
Subject: Re: [PATCH v3] drm/syncobj: use newly allocated stub fences
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

Pushing to drm-misc-next works for me. Thanks for the quick responses.

-David

On Thu, Apr 8, 2021 at 6:56 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 08.04.21 um 11:54 schrieb David Stevens:
> > From: David Stevens <stevensd@chromium.org>
> >
> > Allocate a new private stub fence in drm_syncobj_assign_null_handle,
> > instead of using a static stub fence.
> >
> > When userspace creates a fence with DRM_SYNCOBJ_CREATE_SIGNALED or when
> > userspace signals a fence via DRM_IOCTL_SYNCOBJ_SIGNAL, the timestamp
> > obtained when the fence is exported and queried with SYNC_IOC_FILE_INFO
> > should match when the fence's status was changed from the perspective o=
f
> > userspace, which is during the respective ioctl.
> >
> > When a static stub fence started being used in by these ioctls, this
> > behavior changed. Instead, the timestamp returned by SYNC_IOC_FILE_INFO
> > became the first time anything used the static stub fence, which has no
> > meaning to userspace.
> >
> > Signed-off-by: David Stevens <stevensd@chromium.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Should I push this to drm-misc-next or how do you want to upstream it?
>
> Thanks,
> Christian.
>
> > ---
> > v2 -> v3:
> >   - reuse the static stub spinlock
> > v1 -> v2:
> >   - checkpatch style fixes
> >
> >   drivers/dma-buf/dma-fence.c   | 27 ++++++++++++++++++++++++++-
> >   drivers/gpu/drm/drm_syncobj.c | 25 +++++++++++++++++++------
> >   include/linux/dma-fence.h     |  1 +
> >   3 files changed, 46 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index d64fc03929be..ce0f5eff575d 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -123,7 +123,9 @@ static const struct dma_fence_ops dma_fence_stub_op=
s =3D {
> >   /**
> >    * dma_fence_get_stub - return a signaled fence
> >    *
> > - * Return a stub fence which is already signaled.
> > + * Return a stub fence which is already signaled. The fence's
> > + * timestamp corresponds to the first time after boot this
> > + * function is called.
> >    */
> >   struct dma_fence *dma_fence_get_stub(void)
> >   {
> > @@ -141,6 +143,29 @@ struct dma_fence *dma_fence_get_stub(void)
> >   }
> >   EXPORT_SYMBOL(dma_fence_get_stub);
> >
> > +/**
> > + * dma_fence_allocate_private_stub - return a private, signaled fence
> > + *
> > + * Return a newly allocated and signaled stub fence.
> > + */
> > +struct dma_fence *dma_fence_allocate_private_stub(void)
> > +{
> > +     struct dma_fence *fence;
> > +
> > +     fence =3D kzalloc(sizeof(*fence), GFP_KERNEL);
> > +     if (fence =3D=3D NULL)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     dma_fence_init(fence,
> > +                    &dma_fence_stub_ops,
> > +                    &dma_fence_stub_lock,
> > +                    0, 0);
> > +     dma_fence_signal(fence);
> > +
> > +     return fence;
> > +}
> > +EXPORT_SYMBOL(dma_fence_allocate_private_stub);
> > +
> >   /**
> >    * dma_fence_context_alloc - allocate an array of fence contexts
> >    * @num: amount of contexts to allocate
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 349146049849..a54aa850d143 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -350,12 +350,16 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
> >    *
> >    * Assign a already signaled stub fence to the sync object.
> >    */
> > -static void drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj=
)
> > +static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
> >   {
> > -     struct dma_fence *fence =3D dma_fence_get_stub();
> > +     struct dma_fence *fence =3D dma_fence_allocate_private_stub();
> > +
> > +     if (IS_ERR(fence))
> > +             return PTR_ERR(fence);
> >
> >       drm_syncobj_replace_fence(syncobj, fence);
> >       dma_fence_put(fence);
> > +     return 0;
> >   }
> >
> >   /* 5s default for wait submission */
> > @@ -469,6 +473,7 @@ EXPORT_SYMBOL(drm_syncobj_free);
> >   int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t fla=
gs,
> >                      struct dma_fence *fence)
> >   {
> > +     int ret;
> >       struct drm_syncobj *syncobj;
> >
> >       syncobj =3D kzalloc(sizeof(struct drm_syncobj), GFP_KERNEL);
> > @@ -479,8 +484,13 @@ int drm_syncobj_create(struct drm_syncobj **out_sy=
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
> > @@ -1322,8 +1332,11 @@ drm_syncobj_signal_ioctl(struct drm_device *dev,=
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
> > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > index 9f12efaaa93a..6ffb4b2c6371 100644
> > --- a/include/linux/dma-fence.h
> > +++ b/include/linux/dma-fence.h
> > @@ -587,6 +587,7 @@ static inline signed long dma_fence_wait(struct dma=
_fence *fence, bool intr)
> >   }
> >
> >   struct dma_fence *dma_fence_get_stub(void);
> > +struct dma_fence *dma_fence_allocate_private_stub(void);
> >   u64 dma_fence_context_alloc(unsigned num);
> >
> >   #define DMA_FENCE_TRACE(f, fmt, args...) \
>
