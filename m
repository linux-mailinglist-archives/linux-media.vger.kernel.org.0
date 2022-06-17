Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0587F54FCB5
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 20:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383526AbiFQSFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 14:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383531AbiFQSFm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 14:05:42 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57EFB2E6A4
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 11:05:41 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id g25so10139115ejh.9
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 11:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DlzhBdhQZGkSqbILc5kEVzWlytICniT9hnMKvWlVqZw=;
        b=ILV3mz7sBacg0aN7ocCkv6eYBMa1pbhWugkAoneGtRKHC5/Sv28MmVE6yTZBeDrSts
         PR3+XJkQqDMdN+EIkPbQ8myNfFBOCPTlfs4xMp4YGgZvkxxsYn1f4TElmRvu91xegeNu
         NvqZ9goh9byggYb3MusWjevLijNjH5VdkK7FUmjPeQzzUGCIToYYXoHiVQUjxiMQwrk8
         y2LE1k6CxPVIKp8qnOumQDOeoXDu/7P6dPjgyYAI2TfpUkJt6Sheays7mfqMANQBFBI9
         THe0c9rWj7vV27yy3mOga5l9q6o5iNak0m751YWVBrmbT8G50fMlTF0xRKPCkuhVnRX0
         NO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DlzhBdhQZGkSqbILc5kEVzWlytICniT9hnMKvWlVqZw=;
        b=AwykDqu6lvzBR6uYxcyCRtCugVCVnoqAK3DEuLn7Nmvdizw9w7art/RTK3lqyV8zr4
         R3FLxo59f6ah71ZXsm64k1zxEzdGml/pK2XKOpOiQoDa9zmVyCyE4I07sEjteCqEia6G
         Kze+anDb7RlUQFEXegjrXo30ta1z+T6Zg+2ocPyikmHPi6Fpd429C8G1WlYTNW5HDk4o
         TgU29XJfFOqEbOgt+7gk3+T9kWWk2eUmRix8uubpsuNntkXrb544zuUEZo4Gv38YzP3d
         MBr4SI/OcKGl/HPIqssa/AJSdQy3TS/qq/GFbivup9O33D42i+d93VASf1ztDo/oLCXw
         R9kg==
X-Gm-Message-State: AJIora+eYaIN5KGtz4NkhxjCrNYO/oRCXkscTfAvxSqEjSYSWmu+oONl
        yvPQCu1UHJYMVmQD7MJx9zft6DhKF8tmVLq0E/A/jg==
X-Google-Smtp-Source: AGRyM1uMVrWnbWWCMTzRjwcW88cM+PF9rzfVvGectq3GOC3WJhDjyr+WhdxrfzqVtXJWcFu2xIGTUMW1CRYABq+7akE=
X-Received: by 2002:a17:907:d25:b0:711:ea61:63aa with SMTP id
 gn37-20020a1709070d2500b00711ea6163aamr10295837ejc.584.1655489139667; Fri, 17
 Jun 2022 11:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220617085702.4298-1-christian.koenig@amd.com>
In-Reply-To: <20220617085702.4298-1-christian.koenig@amd.com>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Fri, 17 Jun 2022 11:05:28 -0700
Message-ID: <CABdmKX2yD_UPUVvZEX3+Bi55eTW2=NDAxWLay1fRjGu4W0W1EA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: deprecate DMABUF_SYSFS_STATS
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        kernel-team@android.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 17, 2022 at 1:57 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Add a warning that this UAPI wasn't such a good idea and shouldn't be
> used by anybody.
>
> That should give us a better chance to remove it at some point and
> prevents others from running into the same issues.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/Kconfig | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 541efe01abc7..e4dc53a36428 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -75,7 +75,7 @@ menuconfig DMABUF_HEAPS
>           between drivers.
>
>  menuconfig DMABUF_SYSFS_STATS
> -       bool "DMA-BUF sysfs statistics"
> +       bool "DMA-BUF sysfs statistics (DEPRECATED)"
>         depends on DMA_SHARED_BUFFER
>         help
>            Choose this option to enable DMA-BUF sysfs statistics
> @@ -85,6 +85,10 @@ menuconfig DMABUF_SYSFS_STATS
>            statistics for the DMA-BUF with the unique inode number
>            <inode_number>.
>
> +          This option is deprecated and should sooner or later be remove=
d.
> +          Android is the only user of this and it turned out that this r=
esulted
> +          in quite some performance problems.
> +
>  source "drivers/dma-buf/heaps/Kconfig"
>
>  endmenu
> --
> 2.25.1
>
Reviewed-by: T.J. Mercier <tjmercier@google.com>
