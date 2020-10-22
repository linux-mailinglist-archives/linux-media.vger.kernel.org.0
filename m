Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1BE295C99
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 12:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896446AbgJVKVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 06:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896384AbgJVKVW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 06:21:22 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535C0C0613CE
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 03:21:22 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id t15so1020080otk.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2020 03:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5NIyadkpsx3TzJkX5ZsP+SweN4sKS84ZLyEuupL4jV0=;
        b=kX5gvpbI6Hf2MYOKYuXkmRgr2kaaY9M5LbYCnRyLjOp/Lz02Os2A6z4Aq+rsZLosJ2
         M40DsB8reXplQuB/qrDWVA5FqGJtYFM6i8vJW9MvS++v1iXLrhj8qzSZ7rNR1n5yxmI7
         vyrNJoQc1BgrM//GO5oEndyGtaxbYgwsx17/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5NIyadkpsx3TzJkX5ZsP+SweN4sKS84ZLyEuupL4jV0=;
        b=K6qp+SPMzUbMoI8hnueixtnreo4TgXwKD2qfar/0FN0YZgARf2Z0cGjgBYFIQzqUZn
         J1OV2FIisXAI9pJNyyD/xCEogbccgM1Hb8EStka+lhsXocsbyMOEpIiEyfrYwoLWDanX
         AVXXB3sbvlpJppDkbpNYIGrkRn3QtuemAoiVODFcbyglMp1o5GqqRTXCA7JcUGoLXnmZ
         8FJgGhm2WXgwRV5cY1vAyFub3EGwjW2mRljOyPeXQJf2jCJCEJoGEXJ7usehFlEPZut6
         TjTqIJ/gc8l9dEfzhesZNfW2u7cYrR0O2nI4isvJYQ204AG+COcb5hiTuPrkztNAKsIe
         C2SQ==
X-Gm-Message-State: AOAM532otgoUU33YXfe7p0+CDxxh28K8iKC4h3NZhdGQrP4FS0Cgz0Iq
        i2yh+Pcv7QsIS17rhs6L6/TqWZhzI9NBrS1Ib4mZ9w==
X-Google-Smtp-Source: ABdhPJygQ9KUnAKAlt6h9nc1uLqv50lVI2ThhRnR4aecj/Qy/MtijtMr1CHsIeYGKKQcbMMd5YG/A53hu9KqBTBsBQ8=
X-Received: by 2002:a05:6830:8b:: with SMTP id a11mr1304398oto.303.1603362080697;
 Thu, 22 Oct 2020 03:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201020122046.31167-1-tzimmermann@suse.de> <20201020122046.31167-9-tzimmermann@suse.de>
 <20201022084919.GU401619@phenom.ffwll.local> <f2d83a8b-91b3-ac64-b77f-2b1c78729014@suse.de>
In-Reply-To: <f2d83a8b-91b3-ac64-b77f-2b1c78729014@suse.de>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 22 Oct 2020 12:21:07 +0200
Message-ID: <CAKMK7uFek_A-rFjBc7UUny8TUYx_9dk+-QzsTZFc93X0O=b1aA@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] drm/gem: Store client buffer mappings as struct dma_buf_map
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Luben Tuikov <luben.tuikov@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Wilson, Chris" <chris@chris-wilson.co.uk>,
        Melissa Wen <melissa.srw@gmail.com>,
        Huang Rui <ray.huang@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        lima@lists.freedesktop.org,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Steven Price <steven.price@arm.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Kukjin Kim <kgene@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        "open list:DRM DRIVER FOR QXL VIRTUAL GPU" 
        <spice-devel@lists.freedesktop.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
        "open list:VIRTIO CORE, NET..." 
        <virtualization@lists.linux-foundation.org>,
        Sean Paul <sean@poorly.run>, apaneers@amd.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Qiang Yu <yuq825@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 22, 2020 at 11:18 AM Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>
> Hi
>
> On 22.10.20 10:49, Daniel Vetter wrote:
> > On Tue, Oct 20, 2020 at 02:20:44PM +0200, Thomas Zimmermann wrote:
> >> Kernel DRM clients now store their framebuffer address in an instance
> >> of struct dma_buf_map. Depending on the buffer's location, the address
> >> refers to system or I/O memory.
> >>
> >> Callers of drm_client_buffer_vmap() receive a copy of the value in
> >> the call's supplied arguments. It can be accessed and modified with
> >> dma_buf_map interfaces.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> Tested-by: Sam Ravnborg <sam@ravnborg.org>
> >> ---
> >>  drivers/gpu/drm/drm_client.c    | 34 +++++++++++++++++++-------------=
-
> >>  drivers/gpu/drm/drm_fb_helper.c | 23 +++++++++++++---------
> >>  include/drm/drm_client.h        |  7 ++++---
> >>  3 files changed, 38 insertions(+), 26 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client=
.c
> >> index ac0082bed966..fe573acf1067 100644
> >> --- a/drivers/gpu/drm/drm_client.c
> >> +++ b/drivers/gpu/drm/drm_client.c
> >> @@ -235,7 +235,7 @@ static void drm_client_buffer_delete(struct drm_cl=
ient_buffer *buffer)
> >>  {
> >>      struct drm_device *dev =3D buffer->client->dev;
> >>
> >> -    drm_gem_vunmap(buffer->gem, buffer->vaddr);
> >> +    drm_gem_vunmap(buffer->gem, &buffer->map);
> >>
> >>      if (buffer->gem)
> >>              drm_gem_object_put(buffer->gem);
> >> @@ -291,25 +291,31 @@ drm_client_buffer_create(struct drm_client_dev *=
client, u32 width, u32 height, u
> >>  /**
> >>   * drm_client_buffer_vmap - Map DRM client buffer into address space
> >>   * @buffer: DRM client buffer
> >> + * @map_copy: Returns the mapped memory's address
> >>   *
> >>   * This function maps a client buffer into kernel address space. If t=
he
> >> - * buffer is already mapped, it returns the mapping's address.
> >> + * buffer is already mapped, it returns the existing mapping's addres=
s.
> >>   *
> >>   * Client buffer mappings are not ref'counted. Each call to
> >>   * drm_client_buffer_vmap() should be followed by a call to
> >>   * drm_client_buffer_vunmap(); or the client buffer should be mapped
> >>   * throughout its lifetime.
> >>   *
> >> + * The returned address is a copy of the internal value. In contrast =
to
> >> + * other vmap interfaces, you don't need it for the client's vunmap
> >> + * function. So you can modify it at will during blit and draw operat=
ions.
> >> + *
> >>   * Returns:
> >> - *  The mapped memory's address
> >> + *  0 on success, or a negative errno code otherwise.
> >>   */
> >> -void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
> >> +int
> >> +drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_b=
uf_map *map_copy)
> >>  {
> >> -    struct dma_buf_map map;
> >> +    struct dma_buf_map *map =3D &buffer->map;
> >>      int ret;
> >>
> >> -    if (buffer->vaddr)
> >> -            return buffer->vaddr;
> >> +    if (dma_buf_map_is_set(map))
> >> +            goto out;
> >>
> >>      /*
> >>       * FIXME: The dependency on GEM here isn't required, we could
> >> @@ -319,13 +325,14 @@ void *drm_client_buffer_vmap(struct drm_client_b=
uffer *buffer)
> >>       * fd_install step out of the driver backend hooks, to make that
> >>       * final step optional for internal users.
> >>       */
> >> -    ret =3D drm_gem_vmap(buffer->gem, &map);
> >> +    ret =3D drm_gem_vmap(buffer->gem, map);
> >>      if (ret)
> >> -            return ERR_PTR(ret);
> >> +            return ret;
> >>
> >> -    buffer->vaddr =3D map.vaddr;
> >> +out:
> >> +    *map_copy =3D *map;
> >>
> >> -    return map.vaddr;
> >> +    return 0;
> >>  }
> >>  EXPORT_SYMBOL(drm_client_buffer_vmap);
> >>
> >> @@ -339,10 +346,9 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
> >>   */
> >>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
> >>  {
> >> -    struct dma_buf_map map =3D DMA_BUF_MAP_INIT_VADDR(buffer->vaddr);
> >> +    struct dma_buf_map *map =3D &buffer->map;
> >>
> >> -    drm_gem_vunmap(buffer->gem, &map);
> >> -    buffer->vaddr =3D NULL;
> >> +    drm_gem_vunmap(buffer->gem, map);
> >>  }
> >>  EXPORT_SYMBOL(drm_client_buffer_vunmap);
> >>
> >> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_=
helper.c
> >> index c2f72bb6afb1..6212cd7cde1d 100644
> >> --- a/drivers/gpu/drm/drm_fb_helper.c
> >> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >> @@ -378,7 +378,7 @@ static void drm_fb_helper_dirty_blit_real(struct d=
rm_fb_helper *fb_helper,
> >>      unsigned int cpp =3D fb->format->cpp[0];
> >>      size_t offset =3D clip->y1 * fb->pitches[0] + clip->x1 * cpp;
> >>      void *src =3D fb_helper->fbdev->screen_buffer + offset;
> >> -    void *dst =3D fb_helper->buffer->vaddr + offset;
> >> +    void *dst =3D fb_helper->buffer->map.vaddr + offset;
> >>      size_t len =3D (clip->x2 - clip->x1) * cpp;
> >>      unsigned int y;
> >>
> >> @@ -400,7 +400,8 @@ static void drm_fb_helper_dirty_work(struct work_s=
truct *work)
> >>      struct drm_clip_rect *clip =3D &helper->dirty_clip;
> >>      struct drm_clip_rect clip_copy;
> >>      unsigned long flags;
> >> -    void *vaddr;
> >> +    struct dma_buf_map map;
> >> +    int ret;
> >>
> >>      spin_lock_irqsave(&helper->dirty_lock, flags);
> >>      clip_copy =3D *clip;
> >> @@ -413,8 +414,8 @@ static void drm_fb_helper_dirty_work(struct work_s=
truct *work)
> >>
> >>              /* Generic fbdev uses a shadow buffer */
> >>              if (helper->buffer) {
> >> -                    vaddr =3D drm_client_buffer_vmap(helper->buffer);
> >> -                    if (IS_ERR(vaddr))
> >> +                    ret =3D drm_client_buffer_vmap(helper->buffer, &m=
ap);
> >> +                    if (ret)
> >>                              return;
> >>                      drm_fb_helper_dirty_blit_real(helper, &clip_copy)=
;
> >>              }
> >> @@ -2060,7 +2061,8 @@ static int drm_fb_helper_generic_probe(struct dr=
m_fb_helper *fb_helper,
> >>      struct drm_framebuffer *fb;
> >>      struct fb_info *fbi;
> >>      u32 format;
> >> -    void *vaddr;
> >> +    struct dma_buf_map map;
> >> +    int ret;
> >>
> >>      drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
> >>                  sizes->surface_width, sizes->surface_height,
> >> @@ -2096,11 +2098,14 @@ static int drm_fb_helper_generic_probe(struct =
drm_fb_helper *fb_helper,
> >>              fb_deferred_io_init(fbi);
> >>      } else {
> >>              /* buffer is mapped for HW framebuffer */
> >> -            vaddr =3D drm_client_buffer_vmap(fb_helper->buffer);
> >> -            if (IS_ERR(vaddr))
> >> -                    return PTR_ERR(vaddr);
> >> +            ret =3D drm_client_buffer_vmap(fb_helper->buffer, &map);
> >> +            if (ret)
> >> +                    return ret;
> >> +            if (map.is_iomem)
> >> +                    fbi->screen_base =3D map.vaddr_iomem;
> >> +            else
> >> +                    fbi->screen_buffer =3D map.vaddr;
> >>
> >> -            fbi->screen_buffer =3D vaddr;
> >>              /* Shamelessly leak the physical address to user-space */
> >>  #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
> >>              if (drm_leak_fbdev_smem && fbi->fix.smem_start =3D=3D 0)
> >
> > Just noticed a tiny thing here: I think this needs to be patched to onl=
y
> > set smem_start when the map is _not_ iomem. Since virt_to_page isn't
> > defined on iomem at all.
> >
> > I guess it'd be neat if we can set this for iomem too, but I have no id=
ea
> > how to convert an iomem pointer back to a bus_addr_t ...
>
> Not that I disagree, but that should be reviewed by the right people.
> The commit at 4be9bd10e22d ("drm/fb_helper: Allow leaking fbdev
> smem_start") appears to work around specific userspace drivers.

It's for soc drivers, which all use either shmem or cma helpers, so
all system memory. Which means your patch here doesn't break anything.
But we need to make sure that if someone enables this it doesn't blow
up at least when used on a device where we map iomem.
-Daniel

> Best regards
> Thomas
>
> >
> > Cheers, Daniel
> >
> >> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> >> index 7aaea665bfc2..f07f2fb02e75 100644
> >> --- a/include/drm/drm_client.h
> >> +++ b/include/drm/drm_client.h
> >> @@ -3,6 +3,7 @@
> >>  #ifndef _DRM_CLIENT_H_
> >>  #define _DRM_CLIENT_H_
> >>
> >> +#include <linux/dma-buf-map.h>
> >>  #include <linux/lockdep.h>
> >>  #include <linux/mutex.h>
> >>  #include <linux/types.h>
> >> @@ -141,9 +142,9 @@ struct drm_client_buffer {
> >>      struct drm_gem_object *gem;
> >>
> >>      /**
> >> -     * @vaddr: Virtual address for the buffer
> >> +     * @map: Virtual address for the buffer
> >>       */
> >> -    void *vaddr;
> >> +    struct dma_buf_map map;
> >>
> >>      /**
> >>       * @fb: DRM framebuffer
> >> @@ -155,7 +156,7 @@ struct drm_client_buffer *
> >>  drm_client_framebuffer_create(struct drm_client_dev *client, u32 widt=
h, u32 height, u32 format);
> >>  void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
> >>  int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, st=
ruct drm_rect *rect);
> >> -void *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
> >> +int drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct d=
ma_buf_map *map);
> >>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
> >>
> >>  int drm_client_modeset_create(struct drm_client_dev *client);
> >> --
> >> 2.28.0
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



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
