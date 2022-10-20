Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F38F8606367
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 16:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbiJTOnZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 10:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiJTOnY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 10:43:24 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47AF21A1B17
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 07:43:15 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-136b5dd6655so24842599fac.3
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smqvS8edERBdXoNssJj7nOz3hos2ngGklMmChz3LiDA=;
        b=B7stGq06cVUMTjU4yS0CNoEtIk8uPB7kTBvFcZHHvDcghDopbkfbGHpCTCbaqJeB5x
         eh0hroOlstIDQd3CdbmD9YWrEzs/dbh2ivwdseW9pzAkDHyCFnrYZbgxhT7gy9dm2YRY
         WF6g/dhYEdgr1vyG9g/eSnCh7XDn+Sw0mh1Xn9FJS1Nk6vR6rWg3N8mspvJOIr2CohsE
         SLYak9NI9Cu7l/L1mMKbp+RCgDgeTFXavok54aiA8kPCXx8DzGb1FcD+NqGBDsrUSqOs
         CkiwCq+WTcAYwtDuuYd12OrhTSIvq3iHaTe0qNf87Y0D5W40vyhLTm+7fcGqh8WPh0Qn
         ti0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smqvS8edERBdXoNssJj7nOz3hos2ngGklMmChz3LiDA=;
        b=TA2rfH5ghcBRyfUh6H/qSEv29g7mhBrBH27DLtQAyQWHRuNTGFy6zE5Q8Coo3plc6N
         7TSqpsUixcCmZ/0Rsz9bp/rEZ4iFopwolv0QW7H3w/6h6/7W0ui5TQYC5gbPhB2BP/h8
         uYqJs0ONpFhWS4cNqInI7257/D8hFo5imuk3gGcMpjO7ciEEwj8vqFKoLgptW5ZWrA8b
         fAi9MKqDjw9LHP8gdjAH3sImPSywRVpqJrWZCC39llpxbvndq5I+29xxK6EXVS7scSyY
         eGLwAPjNbloMYY6MbtdvWuDRANv1c/KBrWIuoIkrsLqk1QVD0jnwpyRXdrFlSQbuzm09
         +bDA==
X-Gm-Message-State: ACrzQf2Dk2u8sXmqdkts4AZeBKuNfORttf3di0vEAk8eVg4ecC2/ec02
        OCsV+JJ3zfRT9JLYOhIUs2lH2rYYBdYExbRW7h/p1krO
X-Google-Smtp-Source: AMsMyM6M4RUwVGE08KoWFaWKLprXNDwsz60pGxBYFegIiptEY3Pp0sWMLbxfn71oqEs2HdISiys9npc7rI5zT9+nmbU=
X-Received: by 2002:a05:6870:4286:b0:132:756f:6b97 with SMTP id
 y6-20020a056870428600b00132756f6b97mr8438996oah.38.1666276993672; Thu, 20 Oct
 2022 07:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com> <20221020121316.3946-3-christian.koenig@amd.com>
In-Reply-To: <20221020121316.3946-3-christian.koenig@amd.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 20 Oct 2022 07:43:02 -0700
Message-ID: <CAF6AEGsw=J6Y5jd0A5_hVg1A5BF87hz00Ggmbi8OtTjPJKMDGA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/prime: set the dma_coherent flag for export
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Thu, Oct 20, 2022 at 5:13 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> When a device driver is snooping the CPU cache during access we assume
> that all importers need to be able to snoop the CPU cache as well.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_prime.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 20e109a802ae..d5c70b6fe8a4 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -28,6 +28,7 @@
>
>  #include <linux/export.h>
>  #include <linux/dma-buf.h>
> +#include <linux/dma-map-ops.h>
>  #include <linux/rbtree.h>
>  #include <linux/module.h>
>
> @@ -889,6 +890,7 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_o=
bject *obj,
>                 .size =3D obj->size,
>                 .flags =3D flags,
>                 .priv =3D obj,
> +               .coherent =3D dev_is_dma_coherent(dev->dev),

To set the coherent flag correctly, I think I'd need a way to override
on a per buffer basis, since coherency is a property of the gpu
pgtables (which in the msm case is an immutable property of the gem
object).  We also have some awkwardness that drm->dev isn't actually
the GPU, thanks to the kernels device model seeing a collection of
other small devices shoehorned into a single drm device to fit
userspace's view of the world.  So relying on drm->dev isn't really
going to give sensible results.

I guess msm could just bury our heads in the sand and continue to do
things the way we have been (buffers that are mapped cached-coherent
are only self-shared) but would be nice to catch if userspace tried to
import one into (for ex) v4l2..

BR,
-R

>                 .resv =3D obj->resv,
>         };
>
> --
> 2.25.1
>
