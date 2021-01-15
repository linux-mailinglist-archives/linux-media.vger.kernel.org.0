Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C222C2F7C73
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 14:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732353AbhAONXe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 08:23:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbhAONXd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 08:23:33 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81837C061795
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 05:22:56 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id v19so2181573ooj.7
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 05:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mwh1LtjEdrziWlD1tYZAI9KVjCkNuPAgA3aGBqx7fiQ=;
        b=drYwZY18wy4PPSupFJJAPIarD9EXbj9EH9ZD8XIuGnb8+t1d7R+/6ZLwgGZ7AzlOAC
         qd32ehQJYTMma177ovjGJC30HE7ZN3zR+v5bsotId2Tm7GqG50pveUncmeCMaUSGK800
         /w/ttM71/sHYo1+Gp0dH93jceFWoOK98qJmKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mwh1LtjEdrziWlD1tYZAI9KVjCkNuPAgA3aGBqx7fiQ=;
        b=GkkM4iDxZVgU4vqk0u5KUNAqDh8qSc22Hcv764Zyc8bSxH+8LHCbtG4mMkThLU19wJ
         bTBH26k8WGdi1wCM47FZLZou4yICm/16TU2piRHu6jb5Zmd2IPVZAwZCc08TjUTx3ZTr
         6JZu5Cd5z57+tymcEd/Q3xX8Vr7psDOsBdLOZor4snuW4gJL8ECdalLn+/sVYamHSJIr
         jOXVildt+kQ3fVAtRha+SOltdKcmgxOTmwlVhCmfq6mkBLkRnOR4b1NqRe/GAhQ/soNC
         5M5HH6hhF9f4e2RsjHjm0GuiP0Db+ijLavoHTtyX1PPpAa1BTlGh4D5meB8SaDmNal57
         T2dg==
X-Gm-Message-State: AOAM531Imr15xT9/potvManZJWTgq5uEeLT3QyTUh5P8f7vVpO1BrV3Q
        murkFCv8wysOMZlXdU+jEHemUbWUJI6bAloY/YvcOw==
X-Google-Smtp-Source: ABdhPJx1ceEdPEwdglvATHBHpuX/0N1o64kGv8uk83ww/5utTbMQL+T7jdkQHo31VFLwWGGiCqOU6m/GxVZh5BLTFZo=
X-Received: by 2002:a4a:9722:: with SMTP id u31mr8105856ooi.28.1610716975893;
 Fri, 15 Jan 2021 05:22:55 -0800 (PST)
MIME-Version: 1.0
References: <20210115130219.3915789-1-daniel.vetter@ffwll.ch> <8c60b2ac-d1b9-ffde-ad6d-2a3953f519de@gmail.com>
In-Reply-To: <8c60b2ac-d1b9-ffde-ad6d-2a3953f519de@gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 15 Jan 2021 14:22:44 +0100
Message-ID: <CAKMK7uEUyK17Tu6PyPpMHCoX2XMBqm2fquZJ4fUo9WY+1rK0XA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm-buf: Add debug option
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        David Stevens <stevensd@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 15, 2021 at 2:09 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 15.01.21 um 14:02 schrieb Daniel Vetter:
> > have too many people abusing the struct page they can get at but
> > really shouldn't in importers. Aside from that the backing page might
> > simply not exist (for dynamic p2p mappings) looking at it and using it
> > e.g. for mmap can also wreak the page handling of the exporter
> > completely. Importers really must go through the proper interface like
> > dma_buf_mmap for everything.
> >
> > I'm semi-tempted to enforce this for dynamic importers since those
> > really have no excuse at all to break the rules.
> >
> > Unfortuantely we can't store the right pointers somewhere safe to make
> > sure we oops on something recognizable, so best is to just wrangle
> > them a bit by flipping all the bits. At least on x86 kernel addresses
> > have all their high bits sets and the struct page array is fairly low
> > in the kernel mapping, so flipping all the bits gives us a very high
> > pointer in userspace and hence excellent chances for an invalid
> > dereference.
> >
> > v2: Add a note to the @map_dma_buf hook that exporters shouldn't do
> > fancy caching tricks, which would blow up with this address scrambling
> > trick here (Chris)
> >
> > Enable by default when CONFIG_DMA_API_DEBUG is enabled.
> >
> > Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: David Stevens <stevensd@chromium.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >   drivers/dma-buf/Kconfig   |  8 +++++++
> >   drivers/dma-buf/dma-buf.c | 49 +++++++++++++++++++++++++++++++++++---=
-
> >   include/linux/dma-buf.h   |  6 +++++
> >   3 files changed, 59 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> > index 4f8224a6ac95..4e16c71c24b7 100644
> > --- a/drivers/dma-buf/Kconfig
> > +++ b/drivers/dma-buf/Kconfig
> > @@ -50,6 +50,14 @@ config DMABUF_MOVE_NOTIFY
> >         This is marked experimental because we don't yet have a consist=
ent
> >         execution context and memory management between drivers.
> >
> > +config DMABUF_DEBUG
> > +     bool "DMA-BUF debug checks"
> > +     default y if DMA_API_DEBUG
> > +     help
> > +       This option enables additional checks for DMA-BUF importers and
> > +       exporters. Specifically it validates that importers do not peek=
 at the
> > +       underlying struct page when they import a buffer.
> > +
> >   config DMABUF_SELFTESTS
> >       tristate "Selftests for the dma-buf interfaces"
> >       default n
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 1c9bd51db110..6e4725f7dfde 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -666,6 +666,30 @@ void dma_buf_put(struct dma_buf *dmabuf)
> >   }
> >   EXPORT_SYMBOL_GPL(dma_buf_put);
> >
> > +static struct sg_table * __map_dma_buf(struct dma_buf_attachment *atta=
ch,
> > +                                    enum dma_data_direction direction)
> > +{
> > +     struct sg_table *sg_table;
> > +
> > +     sg_table =3D attach->dmabuf->ops->map_dma_buf(attach, direction);
> > +
> > +#if CONFIG_DMABUF_DEBUG
> > +     if (sg_table) {
> > +             int i;
> > +             struct scatterlist *sg;
> > +
> > +             /* To catch abuse of the underlying struct page by import=
ers mix
> > +              * up the bits, but take care to preserve the low SG_ bit=
s to
> > +              * not corrupt the sgt. The mixing is undone in __unmap_d=
ma_buf
> > +              * before passing the sgt back to the exporter. */
> > +             for_each_sgtable_sg(sg_table, sg, i)
> > +                     sg->page_link ^=3D ~0xffUL;
> > +     }
> > +#endif
> > +
> > +     return sg_table;
> > +}
> > +
> >   /**
> >    * dma_buf_dynamic_attach - Add the device to dma_buf's attachments l=
ist
> >    * @dmabuf:         [in]    buffer to attach device to.
> > @@ -737,7 +761,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, stru=
ct device *dev,
> >                               goto err_unlock;
> >               }
> >
> > -             sgt =3D dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONA=
L);
> > +             sgt =3D __map_dma_buf(attach, DMA_BIDIRECTIONAL);
> >               if (!sgt)
> >                       sgt =3D ERR_PTR(-ENOMEM);
> >               if (IS_ERR(sgt)) {
> > @@ -784,6 +808,23 @@ struct dma_buf_attachment *dma_buf_attach(struct d=
ma_buf *dmabuf,
> >   }
> >   EXPORT_SYMBOL_GPL(dma_buf_attach);
> >
> > +static void __unmap_dma_buf(struct dma_buf_attachment *attach,
> > +                         struct sg_table *sg_table,
> > +                         enum dma_data_direction direction)
> > +{
> > +
> > +#if CONFIG_DMABUF_DEBUG
> > +     if (sg_table) {
> > +             int i;
> > +             struct scatterlist *sg;
> > +
> > +             for_each_sgtable_sg(sg_table, sg, i)
> > +                     sg->page_link ^=3D ~0xffUL;
> > +     }
> > +#endif
>
> Instead of duplicating this I would rather structure the code so that we
> have a helper to mangle the sgt when necessary.
>
> This can then be called from both the map() as well as the unmap() path.

Well that's why extracted the helper functions (it would be 4 copies
otherwise). It's true that it's still 2x the same operation, but
conceptually one of them mangles, the other unmangles the pointers.
It's just that with XOR mangling, that's both the same code.
Readability feels better that way to me, but I guess I can do another
tiny helper function extraction if you insist?
-Daniel

> Apart from that looks good to me,
> Christian.
>
> > +     attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> > +}
> > +
> >   /**
> >    * dma_buf_detach - Remove the given attachment from dmabuf's attachm=
ents list
> >    * @dmabuf: [in]    buffer to detach from.
> > @@ -802,7 +843,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct =
dma_buf_attachment *attach)
> >               if (dma_buf_is_dynamic(attach->dmabuf))
> >                       dma_resv_lock(attach->dmabuf->resv, NULL);
> >
> > -             dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->d=
ir);
> > +             __unmap_dma_buf(attach, attach->sgt, attach->dir);
> >
> >               if (dma_buf_is_dynamic(attach->dmabuf)) {
> >                       dma_buf_unpin(attach);
> > @@ -924,7 +965,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_=
buf_attachment *attach,
> >               }
> >       }
> >
> > -     sg_table =3D attach->dmabuf->ops->map_dma_buf(attach, direction);
> > +     sg_table =3D __map_dma_buf(attach, direction);
> >       if (!sg_table)
> >               sg_table =3D ERR_PTR(-ENOMEM);
> >
> > @@ -987,7 +1028,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attac=
hment *attach,
> >       if (dma_buf_is_dynamic(attach->dmabuf))
> >               dma_resv_assert_held(attach->dmabuf->resv);
> >
> > -     attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
> > +     __unmap_dma_buf(attach, sg_table, direction);
> >
> >       if (dma_buf_is_dynamic(attach->dmabuf) &&
> >           !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 628681bf6c99..efdc56b9d95f 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -154,6 +154,12 @@ struct dma_buf_ops {
> >        * On failure, returns a negative error value wrapped into a poin=
ter.
> >        * May also return -EINTR when a signal was received while being
> >        * blocked.
> > +      *
> > +      * Note that exporters should not try to cache the scatter list, =
or
> > +      * return the same one for multiple calls. Caching is done either=
 by the
> > +      * DMA-BUF code (for non-dynamic importers) or the importer. Owne=
rship
> > +      * of the scatter list is transferred to the caller, and returned=
 by
> > +      * @unmap_dma_buf.
> >        */
> >       struct sg_table * (*map_dma_buf)(struct dma_buf_attachment *,
> >                                        enum dma_data_direction);
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
