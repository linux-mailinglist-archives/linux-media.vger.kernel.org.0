Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF8B361071D
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 03:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235081AbiJ1BLs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Oct 2022 21:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234492AbiJ1BLr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Oct 2022 21:11:47 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F61A3F4F
        for <linux-media@vger.kernel.org>; Thu, 27 Oct 2022 18:11:46 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id r187so4659240oia.8
        for <linux-media@vger.kernel.org>; Thu, 27 Oct 2022 18:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EA/rRsqesB5knK6U60b9qGTqZ/vIiOct5OFzn794j8=;
        b=qjm6RD/RmBJahmvvVeY6o5kMWk/aRac6DF01OEVkSagU9ZipwnIjs8nfU7VZkcm2VY
         8+830Hy6A+I4LhTVia6tejtfM50lm/SIRDBJBSS2d09WfaoXuQQwptw2839hi1Oj5C0Y
         wmlkeuT+o9nWmposOEhB7ronNJt0pnA3b/Qfo6WNR4xb9lqUwYGfD7TxKvWiP1QFZxSz
         W88DQ14iQwoTNwiOuaTSYE7XwQNdiogY0ySbppLTd2CNAssVlJQF7/2LXD0S69e/JHUw
         zVAVjEgPAAjiVLOOheAzz0hW4SQ+yQYAHFAfiYJ7tTh+QMLxSQ3Xf3+KfFKtpa17GxiT
         A8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5EA/rRsqesB5knK6U60b9qGTqZ/vIiOct5OFzn794j8=;
        b=LENXlzQ2gkrt/VGwHF30DGYkjTFQg9z8HZuzisfHU/JZwx8JNzW6ZxSRZ0X5VvIJSG
         UPNwKLYEzb9MfwWyRO5QaRvwArHp9VpWcwZOlKQ+bIN1dEtGAJ8EHPioE3MPK8W/Xvga
         jjto/kK8vsd1zNrYQmSDyvDLSuY5dVoFXcUyxftUw0yrRTb8VFZsH6Et0aFc1zBy8/fi
         ktqMbM2gNIz2aRqQzxVfib16suchnlxE+TZSsX0rtfKONrRoo55i8EumnyzUUg9RPcQD
         ONY6rtBwudsJO4qHH7J8b6cnX12UExLA/k7yMYTdmEeD16gcaFWR9jZBDDMFDc2WVvi4
         iO3g==
X-Gm-Message-State: ACrzQf0hnHn7jBI6vxhpZeECFziqMq9ZrH4Npot+yjEPmLKjsQLIVg8n
        YJGcoWTcI2/DZHrCfZS+BKAgEJBcTAfOCjjYOyM=
X-Google-Smtp-Source: AMsMyM69+M9JkB7n7pEjm9pG4X2UrOlWxyLLPQP8olANKeo9vGbNd7nNGot4Jggqx2IeD4VJZouh8j2E5wD/aymEsNA=
X-Received: by 2002:a05:6808:8f4:b0:354:946e:8dc5 with SMTP id
 d20-20020a05680808f400b00354946e8dc5mr6340635oic.183.1666919505708; Thu, 27
 Oct 2022 18:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <20221020121316.3946-3-christian.koenig@amd.com> <CAF6AEGsw=J6Y5jd0A5_hVg1A5BF87hz00Ggmbi8OtTjPJKMDGA@mail.gmail.com>
 <fd168175-71ce-2a9e-f8f1-1cc66e052235@amd.com>
In-Reply-To: <fd168175-71ce-2a9e-f8f1-1cc66e052235@amd.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 27 Oct 2022 18:11:56 -0700
Message-ID: <CAF6AEGuCZpKQMH6mra97tZNOFq8kryoCoi-8V21zmmCyGyZDZQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/prime: set the dma_coherent flag for export
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 20, 2022 at 7:57 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.10.22 um 16:43 schrieb Rob Clark:
> > On Thu, Oct 20, 2022 at 5:13 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> When a device driver is snooping the CPU cache during access we assume
> >> that all importers need to be able to snoop the CPU cache as well.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/drm_prime.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> >> index 20e109a802ae..d5c70b6fe8a4 100644
> >> --- a/drivers/gpu/drm/drm_prime.c
> >> +++ b/drivers/gpu/drm/drm_prime.c
> >> @@ -28,6 +28,7 @@
> >>
> >>   #include <linux/export.h>
> >>   #include <linux/dma-buf.h>
> >> +#include <linux/dma-map-ops.h>
> >>   #include <linux/rbtree.h>
> >>   #include <linux/module.h>
> >>
> >> @@ -889,6 +890,7 @@ struct dma_buf *drm_gem_prime_export(struct drm_ge=
m_object *obj,
> >>                  .size =3D obj->size,
> >>                  .flags =3D flags,
> >>                  .priv =3D obj,
> >> +               .coherent =3D dev_is_dma_coherent(dev->dev),
> > To set the coherent flag correctly, I think I'd need a way to override
> > on a per buffer basis, since coherency is a property of the gpu
> > pgtables (which in the msm case is an immutable property of the gem
> > object).  We also have some awkwardness that drm->dev isn't actually
> > the GPU, thanks to the kernels device model seeing a collection of
> > other small devices shoehorned into a single drm device to fit
> > userspace's view of the world.  So relying on drm->dev isn't really
> > going to give sensible results.
>
> Yeah, I've the same problem for amdgpu where some buffers are snooped
> while others aren't.
>
> But this should be unproblematic since the flag can always be cleared by
> the driver later on (it just can't be set).
>
> Additional to that I've just noted that armada, i915, omap and tegra use
> their own DMA-buf export function. MSM could do the same as well if the
> device itself is marked as not coherent while some buffers are mapped
> cache coherent.

yeah, I guess that would work.. it would be a bit unfortunate to need
to use our own export function, but I guess it is a small price to pay
and I like the overall idea, so a-b for the series

For the VMM case, it would be nice to expose this to userspace, but
I've sent a patch to do this in an msm specific way, and I guess at
least solving that problem for one driver and better than the current
state of "iff driver =3D=3D "i915" { it's mmap'd cached } else { it's
writecombine }" in crosvm

Admittedly the VMM case is a rather special case compared to your
average userspace dealing with dmabuf's, but it would be nice to get
out of the current situation where it is having to make assumptions
which are quite possibly wrong, so giving the VMM some information
even if it is "the cachability isn't static, you should bail now if
your arch can't cope" would be an improvement.  (For background, this
case is also a bit specific for android/gralloc.. for driver allocated
buffers in a VM, with the native usermode driver (UMD) in guest, you
still have some control within the UMD)

BR,
-R


> Regards,
> Christian.
>
> > I guess msm could just bury our heads in the sand and continue to do
> > things the way we have been (buffers that are mapped cached-coherent
> > are only self-shared) but would be nice to catch if userspace tried to
> > import one into (for ex) v4l2..
> >
> > BR,
> > -R
> >
> >>                  .resv =3D obj->resv,
> >>          };
> >>
> >> --
> >> 2.25.1
> >>
>
