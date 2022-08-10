Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC33B58F0CD
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 18:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232691AbiHJQyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 12:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232709AbiHJQyV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 12:54:21 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C812873E
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 09:54:20 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-10ec41637b3so18482392fac.4
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 09:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=qFnJPiXDvt/QHoeruEwgeFRhpkmY0PFXPqpe6g3wZZU=;
        b=LGhbnsxjx1/X15rJRc0TYcL1bz4qxZfDA2Evnfl2dumzGeP5+uqclcPWWmr/pf+jWb
         a4q19+5rDTQRmTrwwOl5SL5ABIXsJEwP49UKG1Mnw7/1TubflBVQvJ/UKCoMuxwMVJ78
         CjY+vhp6n/JsSPT0OQ9Vmb/wDzQpj3whSVHBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=qFnJPiXDvt/QHoeruEwgeFRhpkmY0PFXPqpe6g3wZZU=;
        b=BzGPLVu7jeu6gqf0J+qYnvA6PNWFEFxVjBA+wiuJ0Uscbwj1QTwmv06DNSsyJe1KRC
         x80IT3PuiAVjFthBxuwNeF0CzAYOHf6yJqMfX2EXlFEaK2iq33+qWDZzDSxNKoxxl1iM
         1aEckDcRrOxCRJuB/ac1LIZ6mbSzmEf65VAReVi1t9zB2l3GASqYZSEV5JgWUpSXyJRz
         RD/ANHp/fDFDzfJEVBBqSjyj5QfaFWFAHHDl5kCOxPwzT2QGYToE31kAHZYFvQYLKwm7
         pE6hi+95vx0JYR7KmpP/u7zAgj2i3yvSXOJ1YyB5TTAozdER5xszivWC8qJk56+bkm8C
         TFZQ==
X-Gm-Message-State: ACgBeo37aWTKCsQx35DgVIJqshBMwz6JB8PBtPoIKwo85BI5Et8WjTQa
        3ZvQsNsiOlncoX5s7rIEglkVcwXWGVFGA/vFkMFwAA==
X-Google-Smtp-Source: AA6agR5BxNAMgR0BbKjTGtTiiGxByAbsJkt0nZFvCCcqLD64Pb/P4Ac5rjVwhlwBfdom5d2UrFzbBCj6QDIiYW0WqaE=
X-Received: by 2002:a05:6870:a90a:b0:10d:9e83:98a6 with SMTP id
 eq10-20020a056870a90a00b0010d9e8398a6mr1769155oab.228.1660150458375; Wed, 10
 Aug 2022 09:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220712102849.1562-1-christian.koenig@amd.com>
In-Reply-To: <20220712102849.1562-1-christian.koenig@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 10 Aug 2022 18:54:07 +0200
Message-ID: <CAKMK7uFnMSKXcU+v_g-Sh62O5MB1uY=K2H-Fq7-5UYtmmjCZ_w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] dma-buf: revert "return only unsignaled
 fences in dma_fence_unwrap_for_each v3"
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     karolina.drobnik@intel.com, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 12 Jul 2022 at 12:28, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> This reverts commit 8f61973718485f3e89bc4f408f929048b7b47c83.
>
> It turned out that this is not correct. Especially the sync_file info
> IOCTL needs to see even signaled fences to correctly report back their
> status to userspace.
>
> Instead add the filter in the merge function again where it makes sense.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-unwrap.c | 3 ++-
>  include/linux/dma-fence-unwrap.h   | 6 +-----
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fen=
ce-unwrap.c
> index 502a65ea6d44..7002bca792ff 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -72,7 +72,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int=
 num_fences,
>         count =3D 0;
>         for (i =3D 0; i < num_fences; ++i) {
>                 dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
> -                       ++count;
> +                       if (!dma_fence_is_signaled(tmp))
> +                               ++count;
>         }
>
>         if (count =3D=3D 0)
> diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-u=
nwrap.h
> index 390de1ee9d35..66b1e56fbb81 100644
> --- a/include/linux/dma-fence-unwrap.h
> +++ b/include/linux/dma-fence-unwrap.h
> @@ -43,14 +43,10 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fe=
nce_unwrap *cursor);
>   * Unwrap dma_fence_chain and dma_fence_array containers and deep dive i=
nto all
>   * potential fences in them. If @head is just a normal fence only that o=
ne is
>   * returned.
> - *
> - * Note that signalled fences are opportunistically filtered out, which
> - * means the iteration is potentially over no fence at all.
>   */
>  #define dma_fence_unwrap_for_each(fence, cursor, head)                 \
>         for (fence =3D dma_fence_unwrap_first(head, cursor); fence;      =
 \
> -            fence =3D dma_fence_unwrap_next(cursor))                    =
 \
> -               if (!dma_fence_is_signaled(fence))
> +            fence =3D dma_fence_unwrap_next(cursor))

Not sure it's worth it, but could we still filter but keep the fence
if there's an error?

I'm honestly also not entirely sure whether error propagation is a
terrific idea, since every single use-case I've seen in i915 was a
mis-design and not good at all. So burning it all down and declaring
the testcases invalid might be the right thing to do here.
-Daniel

>
>  struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>                                            struct dma_fence **fences,
> --
> 2.25.1
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
