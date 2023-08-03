Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B81B076EAEF
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 15:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236512AbjHCNoh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 09:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237060AbjHCNoB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 09:44:01 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA68A3C2D
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 06:41:29 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-78bb7b89cabso34798939f.1
        for <linux-media@vger.kernel.org>; Thu, 03 Aug 2023 06:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691070089; x=1691674889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJXJGpiApFlVq6HRKnLawaCIUOC3Cyf4EbZoKn3qQAY=;
        b=p+vd566U59JgYbzQTUNpoI2fiXtDjOBOOpWnNH+Rvf3a4WUc05ZuBycdgbKDu1Xyr0
         jfagyqPjQKm1V7iebVgrdJ8SVfU6p6UP0GPU3RWZJjBMODaTUVYX1jYeNoZv+19yu8tq
         i9V9klr57FJWXhMfgpXFcgodbDFPpK2lvp60wHW/kqIwCothNcb4M7KD90FZUEHP31Bc
         JEBKWwfeBeTkXL3I88xgoXKSj/Vaqe6JHGxAq9YgwFUaE2OWFAREHS5BeC12XLBG7z2E
         V+QHRaGMIzEYuoXG5XMO68SJIxlgRkioUZugtwgpng5V1UIDuklXV91W1j2+YtllIMRu
         ufYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070089; x=1691674889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJXJGpiApFlVq6HRKnLawaCIUOC3Cyf4EbZoKn3qQAY=;
        b=EpQ6XjiBRTw6+VkZvr7veyi/j5DkNjgMEL8ErdsUnhJMCFooPWyQNRSBJflAzbo0Ez
         UiYG9+iXd7XV6kPCxUR2tuCq6/VqQYxH9ZukKWrTMccTmGV+la6/tx0XMfpcUlV7lcFi
         o2F9LAefTHicf5Bq+uq90vT7QteOR5r854XUYOjX1CXAsZAmhwA69F2dywUPI4M11Nzk
         FTnLxOpkA5g4C986+DtJ9f++WQ2dPTZf+q0hHC/xzJma75zwXpo7bGrPZ6Nh6mxFW9Gs
         jth8uCDCr0GcOpYWKaGxrE1bClDsSYfHJa/CYdgWh7mY0PphCVbJZrJonoguXeLNDimA
         MobQ==
X-Gm-Message-State: ABy/qLYMdfcAHGtvusN9j3eHhta2KMg3BC3iSI/S9qzLFgulRNHSmAFg
        wEByIRD/+Ke1YoT3Zf+/x6jUyeuLPtnF9yMZZu1HOQJoYGt0xA==
X-Google-Smtp-Source: APBJJlH+uNEy+uEW3sOsFClQkWI7/DA1nCLBT10wG60T5zU1jI1uDg2CZsbgBZlZyTH3y2aArrV6NRfaMNzyLWQgyHo=
X-Received: by 2002:a5d:9543:0:b0:787:1f16:53ce with SMTP id
 a3-20020a5d9543000000b007871f1653cemr17553834ios.18.1691070089014; Thu, 03
 Aug 2023 06:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230731120212.2017996-1-ruanjinjie@huawei.com>
In-Reply-To: <20230731120212.2017996-1-ruanjinjie@huawei.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 3 Aug 2023 14:40:26 +0100
Message-ID: <CA+V-a8um1cZ+Hxx_7s10LEBf9nz9sXbpMv3jJAyT31ZdaoECwg@mail.gmail.com>
Subject: Re: [PATCH -next] media: platform: ti: fix the return value handle
 for platform_get_irq()
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 31, 2023 at 1:02=E2=80=AFPM Ruan Jinjie <ruanjinjie@huawei.com>=
 wrote:
>
> There is no possible for platform_get_irq() to return 0,
> and the return value of platform_get_irq() is more sensible
> to show the error reason.
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c | 4 +---
>  drivers/media/platform/ti/omap3isp/isp.c       | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/med=
ia/platform/ti/am437x/am437x-vpfe.c
> index 81a63a3865cf..a85b97107de7 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2420,10 +2420,8 @@ static int vpfe_probe(struct platform_device *pdev=
)
>         }
>
>         ret =3D platform_get_irq(pdev, 0);
> -       if (ret <=3D 0) {
> -               ret =3D -ENODEV;
> +       if (ret < 0)
>                 goto probe_out_cleanup;
> -       }
>         vpfe->irq =3D ret;
>
>         ret =3D devm_request_irq(vpfe->pdev, vpfe->irq, vpfe_isr, 0,
> diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/pla=
tform/ti/omap3isp/isp.c
> index f3aaa9e76492..226db75221cd 100644
> --- a/drivers/media/platform/ti/omap3isp/isp.c
> +++ b/drivers/media/platform/ti/omap3isp/isp.c
> @@ -2398,10 +2398,8 @@ static int isp_probe(struct platform_device *pdev)
>
>         /* Interrupt */
>         ret =3D platform_get_irq(pdev, 0);
> -       if (ret <=3D 0) {
> -               ret =3D -ENODEV;
> +       if (ret < 0)
>                 goto error_iommu;
> -       }
>         isp->irq_num =3D ret;
>
>         if (devm_request_irq(isp->dev, isp->irq_num, isp_isr, IRQF_SHARED=
,
> --
> 2.34.1
>
