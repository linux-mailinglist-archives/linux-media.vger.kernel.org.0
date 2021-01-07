Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C812ED324
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 16:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbhAGPB5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 10:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbhAGPB4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 10:01:56 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7E1C0612F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 07:01:16 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id d203so7699824oia.0
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 07:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lRuPU9umpCPLAhll6r1iIf/JWLdFOM2xKfxX1yXPDlE=;
        b=QrBz+ve8qOe96yaYflYAOFpINGns0+Y69TngqDff6CotGQOTQCXWcvgsmElmowfr4I
         GWwswtogxYdk+0UeaEhDJRms8Oc2WnnslFKtoknrXJSp/TtYx7VL2TY0BGO/++aZLdEF
         Lz78AOJXjw4TcA5g95wBQNtwhpxBL5t0tfvAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lRuPU9umpCPLAhll6r1iIf/JWLdFOM2xKfxX1yXPDlE=;
        b=JVNVKc4lZCvjCxMcjWBrfvhdu9ZAQ5loxE30Ft4Q73y+n+J+DbhiJ7VFpVxE96gEl3
         vJwmyv9KyvE1Msr/12M6yibLtG0yfyGm5J2IyXl9OUr4NCMB00BKW0IuyE/SZdQRV+n8
         6Vg+krqDioIArQ1RIXRNs7FfW15OrGW+e5TJpIIxuJLQIPiUqY19cHJj0CBom7SrAavC
         lrMRKdkt1bhsnoogWI7FSjg25p1cJwYU8xMdlDckeQOxVRKbNSfjcmicYwbFrOyyLEHM
         +SSuVn0nmhk67oSZzQoYuCXCkGQ9ZIBCA5m9Lw0H77zNq0xdrmX/4NDS3EQW37osvKQq
         cxFA==
X-Gm-Message-State: AOAM533Ntd6bUGQiLc7RzGVhJ0tm5rvRxLIOtNSMTJA3BZvXDr03m8vc
        L1xpFgkMum5paKFiogQqEEnRjQOp1d8onk+WLteCYg==
X-Google-Smtp-Source: ABdhPJzeoQi0mU/0zp962GRvvfmnOChU58uvZh2r7ylY02qvk281DJjjkZTZwoR/mjpbloPnrUy/lyXWUzGGZh3CLSc=
X-Received: by 2002:aca:4d08:: with SMTP id a8mr1611789oib.128.1610031675839;
 Thu, 07 Jan 2021 07:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20201209142527.26415-1-tzimmermann@suse.de> <20201209142527.26415-7-tzimmermann@suse.de>
 <20201211095016.GL401619@phenom.ffwll.local> <e3b3062d-2fc6-4871-3562-5272188414dd@suse.de>
In-Reply-To: <e3b3062d-2fc6-4871-3562-5272188414dd@suse.de>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 7 Jan 2021 16:01:04 +0100
Message-ID: <CAKMK7uH7GZvOQVGttnByJv_nhGyh=-fukLQJjd+UDtZzZMiZXA@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] drm/shmem-helper: Provide a vmap function for
 short-term mappings
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sean Paul <sean@poorly.run>, "Anholt, Eric" <eric@anholt.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:VIRTIO CORE, NET..." 
        <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 7, 2021 at 11:28 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi Daniel
>
> Am 11.12.20 um 10:50 schrieb Daniel Vetter:
> [...]
> >> +/**
> >> + * drm_gem_shmem_vmap_local - Create a virtual mapping for a shmem GE=
M object
> >> + * @shmem: shmem GEM object
> >> + * @map: Returns the kernel virtual address of the SHMEM GEM object's=
 backing
> >> + *       store.
> >> + *
> >> + * This function makes sure that a contiguous kernel virtual address =
mapping
> >> + * exists for the buffer backing the shmem GEM object.
> >> + *
> >> + * The function is called with the BO's reservation object locked. Ca=
llers must
> >> + * hold the lock until after unmapping the buffer.
> >> + *
> >> + * This function can be used to implement &drm_gem_object_funcs.vmap_=
local. But
> >> + * it can also be called by drivers directly, in which case it will h=
ide the
> >> + * differences between dma-buf imported and natively allocated object=
s.
> >> + *
> >> + * Acquired mappings should be cleaned up by calling drm_gem_shmem_vu=
nmap_local().
> >> + *
> >> + * Returns:
> >> + * 0 on success or a negative error code on failure.
> >> + */
> >> +int drm_gem_shmem_vmap_local(struct drm_gem_object *obj, struct dma_b=
uf_map *map)
> >> +{
> >> +    struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> >> +    int ret;
> >> +
> >> +    dma_resv_assert_held(obj->resv);
> >> +
> >> +    ret =3D mutex_lock_interruptible(&shmem->vmap_lock);
> >
> > This bites. You need to check for shmem->import_attach and call
> > dma_buf_vmap_local directly here before you take any shmem helper locks=
.
> > Real fix would be to replace both vmap_lock and pages_lock with dma_res=
v
> > lock, but that's more work. Same for vunmap_local
>
> This comment confuses me. AFAICT vmap_lock protects vmap_use_count. Why
> does this exact code work in drm_gem_shmem_vmap() but not in _local() ?

You'd hold the dma_resv lock both inside and outside of the
->vmap_lock mutex. Which deadlocks. For the _vmap version we more or
less mandate that the caller doens't hold the dma_resv lock already,
hence why we can get away with that.
-Daniel

> Best regards
> Thomas
>
> >
> > With that fixed on the helper part of this patch:
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> >
> >> +    if (ret)
> >> +            return ret;
> >> +    ret =3D drm_gem_shmem_vmap_locked(shmem, map);
> >> +    mutex_unlock(&shmem->vmap_lock);
> >> +
> >> +    return ret;
> >> +}
> >> +EXPORT_SYMBOL(drm_gem_shmem_vmap_local);
> >> +
> >>   static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object =
*shmem,
> >>                                      struct dma_buf_map *map)
> >>   {
> >> @@ -366,7 +406,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm=
_gem_shmem_object *shmem,
> >>      drm_gem_shmem_put_pages(shmem);
> >>   }
> >>
> >> -/*
> >> +/**
> >>    * drm_gem_shmem_vunmap - Unmap a virtual mapping fo a shmem GEM obj=
ect
> >>    * @shmem: shmem GEM object
> >>    * @map: Kernel virtual address where the SHMEM GEM object was mappe=
d
> >> @@ -389,6 +429,33 @@ void drm_gem_shmem_vunmap(struct drm_gem_object *=
obj, struct dma_buf_map *map)
> >>   }
> >>   EXPORT_SYMBOL(drm_gem_shmem_vunmap);
> >>
> >> +/**
> >> + * drm_gem_shmem_vunmap_local - Unmap a virtual mapping fo a shmem GE=
M object
> >> + * @shmem: shmem GEM object
> >> + * @map: Kernel virtual address where the SHMEM GEM object was mapped
> >> + *
> >> + * This function cleans up a kernel virtual address mapping acquired =
by
> >> + * drm_gem_shmem_vmap_local(). The mapping is only removed when the u=
se count
> >> + * drops to zero.
> >> + *
> >> + * The function is called with the BO's reservation object locked.
> >> + *
> >> + * This function can be used to implement &drm_gem_object_funcs.vmap_=
local.
> >> + * But it can also be called by drivers directly, in which case it wi=
ll hide
> >> + * the differences between dma-buf imported and natively allocated ob=
jects.
> >> + */
> >> +void drm_gem_shmem_vunmap_local(struct drm_gem_object *obj, struct dm=
a_buf_map *map)
> >> +{
> >> +    struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> >> +
> >> +    dma_resv_assert_held(obj->resv);
> >> +
> >> +    mutex_lock(&shmem->vmap_lock);
> >> +    drm_gem_shmem_vunmap_locked(shmem, map);
> >> +    mutex_unlock(&shmem->vmap_lock);
> >> +}
> >> +EXPORT_SYMBOL(drm_gem_shmem_vunmap_local);
> >> +
> >>   struct drm_gem_shmem_object *
> >>   drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
> >>                               struct drm_device *dev, size_t size,
> >> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/=
mgag200/mgag200_mode.c
> >> index 1dfc42170059..a33e28d4c5e9 100644
> >> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> >> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> >> @@ -1552,22 +1552,32 @@ mgag200_handle_damage(struct mga_device *mdev,=
 struct drm_framebuffer *fb,
> >>                    struct drm_rect *clip)
> >>   {
> >>      struct drm_device *dev =3D &mdev->base;
> >> +    struct drm_gem_object *obj =3D fb->obj[0];
> >>      struct dma_buf_map map;
> >>      void *vmap;
> >>      int ret;
> >>
> >> -    ret =3D drm_gem_shmem_vmap(fb->obj[0], &map);
> >> +    ret =3D dma_resv_lock(obj->resv, NULL);
> >>      if (drm_WARN_ON(dev, ret))
> >> -            return; /* BUG: SHMEM BO should always be vmapped */
> >> +            return;
> >> +    ret =3D drm_gem_shmem_vmap_local(obj, &map);
> >> +    if (drm_WARN_ON(dev, ret))
> >> +            goto err_dma_resv_unlock; /* BUG: SHMEM BO should always =
be vmapped */
> >>      vmap =3D map.vaddr; /* TODO: Use mapping abstraction properly */
> >>
> >>      drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
> >>
> >> -    drm_gem_shmem_vunmap(fb->obj[0], &map);
> >> +    drm_gem_shmem_vunmap_local(obj, &map);
> >> +    dma_resv_unlock(obj->resv);
> >>
> >>      /* Always scanout image at VRAM offset 0 */
> >>      mgag200_set_startadd(mdev, (u32)0);
> >>      mgag200_set_offset(mdev, fb);
> >> +
> >> +    return;
> >> +
> >> +err_dma_resv_unlock:
> >> +    dma_resv_unlock(obj->resv);
> >>   }
> >>
> >>   static void
> >> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirr=
us.c
> >> index 561c49d8657a..58c694964148 100644
> >> --- a/drivers/gpu/drm/tiny/cirrus.c
> >> +++ b/drivers/gpu/drm/tiny/cirrus.c
> >> @@ -315,6 +315,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuf=
fer *fb,
> >>                             struct drm_rect *rect)
> >>   {
> >>      struct cirrus_device *cirrus =3D to_cirrus(fb->dev);
> >> +    struct drm_gem_object *obj =3D fb->obj[0];
> >>      struct dma_buf_map map;
> >>      void *vmap;
> >>      int idx, ret;
> >> @@ -323,9 +324,12 @@ static int cirrus_fb_blit_rect(struct drm_framebu=
ffer *fb,
> >>      if (!drm_dev_enter(&cirrus->dev, &idx))
> >>              goto out;
> >>
> >> -    ret =3D drm_gem_shmem_vmap(fb->obj[0], &map);
> >> +    ret =3D dma_resv_lock(obj->resv, NULL);
> >>      if (ret)
> >>              goto out_dev_exit;
> >> +    ret =3D drm_gem_shmem_vmap_local(fb->obj[0], &map);
> >> +    if (ret)
> >> +            goto out_dma_resv_unlock;
> >>      vmap =3D map.vaddr; /* TODO: Use mapping abstraction properly */
> >>
> >>      if (cirrus->cpp =3D=3D fb->format->cpp[0])
> >> @@ -345,9 +349,11 @@ static int cirrus_fb_blit_rect(struct drm_framebu=
ffer *fb,
> >>      else
> >>              WARN_ON_ONCE("cpp mismatch");
> >>
> >> -    drm_gem_shmem_vunmap(fb->obj[0], &map);
> >>      ret =3D 0;
> >>
> >> +    drm_gem_shmem_vunmap_local(obj, &map);
> >> +out_dma_resv_unlock:
> >> +    dma_resv_unlock(obj->resv);
> >>   out_dev_exit:
> >>      drm_dev_exit(idx);
> >>   out:
> >> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm=
12u320.c
> >> index 33f65f4626e5..b0c6e350f2b3 100644
> >> --- a/drivers/gpu/drm/tiny/gm12u320.c
> >> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> >> @@ -265,11 +265,16 @@ static void gm12u320_copy_fb_to_blocks(struct gm=
12u320_device *gm12u320)
> >>      y1 =3D gm12u320->fb_update.rect.y1;
> >>      y2 =3D gm12u320->fb_update.rect.y2;
> >>
> >> -    ret =3D drm_gem_shmem_vmap(fb->obj[0], &map);
> >> +    ret =3D dma_resv_lock(fb->obj[0]->resv, NULL);
> >>      if (ret) {
> >> -            GM12U320_ERR("failed to vmap fb: %d\n", ret);
> >> +            GM12U320_ERR("failed to reserve fb: %d\n", ret);
> >>              goto put_fb;
> >>      }
> >> +    ret =3D drm_gem_shmem_vmap_local(fb->obj[0], &map);
> >> +    if (ret) {
> >> +            GM12U320_ERR("failed to vmap fb: %d\n", ret);
> >> +            goto unlock_resv;
> >> +    }
> >>      vaddr =3D map.vaddr; /* TODO: Use mapping abstraction properly */
> >>
> >>      if (fb->obj[0]->import_attach) {
> >> @@ -321,8 +326,11 @@ static void gm12u320_copy_fb_to_blocks(struct gm1=
2u320_device *gm12u320)
> >>              if (ret)
> >>                      GM12U320_ERR("dma_buf_end_cpu_access err: %d\n", =
ret);
> >>      }
> >> +
> >> +unlock_resv:
> >> +    dma_resv_unlock(fb->obj[0]->resv);
> >>   vunmap:
> >> -    drm_gem_shmem_vunmap(fb->obj[0], &map);
> >> +    drm_gem_shmem_vunmap_local(fb->obj[0], &map);
> >>   put_fb:
> >>      drm_framebuffer_put(fb);
> >>      gm12u320->fb_update.fb =3D NULL;
> >> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/u=
dl_modeset.c
> >> index 9d34ec9d03f6..46b55b4d03c2 100644
> >> --- a/drivers/gpu/drm/udl/udl_modeset.c
> >> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> >> @@ -290,14 +290,18 @@ static int udl_handle_damage(struct drm_framebuf=
fer *fb, int x, int y,
> >>      else if ((clip.x2 > fb->width) || (clip.y2 > fb->height))
> >>              return -EINVAL;
> >>
> >> +    ret =3D dma_resv_lock(fb->obj[0]->resv, NULL);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >>      if (import_attach) {
> >>              ret =3D dma_buf_begin_cpu_access(import_attach->dmabuf,
> >>                                             DMA_FROM_DEVICE);
> >>              if (ret)
> >> -                    return ret;
> >> +                    goto out_dma_resv_unlock;
> >>      }
> >>
> >> -    ret =3D drm_gem_shmem_vmap(fb->obj[0], &map);
> >> +    ret =3D drm_gem_shmem_vmap_local(fb->obj[0], &map);
> >>      if (ret) {
> >>              DRM_ERROR("failed to vmap fb\n");
> >>              goto out_dma_buf_end_cpu_access;
> >> @@ -307,7 +311,7 @@ static int udl_handle_damage(struct drm_framebuffe=
r *fb, int x, int y,
> >>      urb =3D udl_get_urb(dev);
> >>      if (!urb) {
> >>              ret =3D -ENOMEM;
> >> -            goto out_drm_gem_shmem_vunmap;
> >> +            goto out_drm_gem_shmem_vunmap_local;
> >>      }
> >>      cmd =3D urb->transfer_buffer;
> >>
> >> @@ -320,7 +324,7 @@ static int udl_handle_damage(struct drm_framebuffe=
r *fb, int x, int y,
> >>                                     &cmd, byte_offset, dev_byte_offset=
,
> >>                                     byte_width);
> >>              if (ret)
> >> -                    goto out_drm_gem_shmem_vunmap;
> >> +                    goto out_drm_gem_shmem_vunmap_local;
> >>      }
> >>
> >>      if (cmd > (char *)urb->transfer_buffer) {
> >> @@ -336,8 +340,8 @@ static int udl_handle_damage(struct drm_framebuffe=
r *fb, int x, int y,
> >>
> >>      ret =3D 0;
> >>
> >> -out_drm_gem_shmem_vunmap:
> >> -    drm_gem_shmem_vunmap(fb->obj[0], &map);
> >> +out_drm_gem_shmem_vunmap_local:
> >> +    drm_gem_shmem_vunmap_local(fb->obj[0], &map);
> >>   out_dma_buf_end_cpu_access:
> >>      if (import_attach) {
> >>              tmp_ret =3D dma_buf_end_cpu_access(import_attach->dmabuf,
> >> @@ -345,6 +349,8 @@ static int udl_handle_damage(struct drm_framebuffe=
r *fb, int x, int y,
> >>              if (tmp_ret && !ret)
> >>                      ret =3D tmp_ret; /* only update ret if not set ye=
t */
> >>      }
> >> +out_dma_resv_unlock:
> >> +    dma_resv_unlock(fb->obj[0]->resv);
> >>
> >>      return ret;
> >>   }
> >> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_=
shmem_helper.h
> >> index 434328d8a0d9..3f59bdf749aa 100644
> >> --- a/include/drm/drm_gem_shmem_helper.h
> >> +++ b/include/drm/drm_gem_shmem_helper.h
> >> @@ -114,7 +114,9 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_=
object *shmem);
> >>   int drm_gem_shmem_pin(struct drm_gem_object *obj);
> >>   void drm_gem_shmem_unpin(struct drm_gem_object *obj);
> >>   int drm_gem_shmem_vmap(struct drm_gem_object *obj, struct dma_buf_ma=
p *map);
> >> +int drm_gem_shmem_vmap_local(struct drm_gem_object *obj, struct dma_b=
uf_map *map);
> >>   void drm_gem_shmem_vunmap(struct drm_gem_object *obj, struct dma_buf=
_map *map);
> >> +void drm_gem_shmem_vunmap_local(struct drm_gem_object *obj, struct dm=
a_buf_map *map);
> >>
> >>   int drm_gem_shmem_madvise(struct drm_gem_object *obj, int madv);
> >>
> >> --
> >> 2.29.2
> >>
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
