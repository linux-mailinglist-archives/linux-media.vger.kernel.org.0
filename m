Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFF8E73E333
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 17:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbjFZPYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jun 2023 11:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbjFZPYG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jun 2023 11:24:06 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C31E73
        for <linux-media@vger.kernel.org>; Mon, 26 Jun 2023 08:24:02 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-77797beb42dso117074939f.2
        for <linux-media@vger.kernel.org>; Mon, 26 Jun 2023 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687793042; x=1690385042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5gUlf88lNqDawp+QDFqKpyx0S67oKkp8rSQiNcf0ao=;
        b=QQGrky/kwcGc/aD60kB9o032Dwc2C9f5k8hnpd83zwXSXngUbyqtAvtnVqlHaLgTKc
         ObFPdaXMpPvH1O65CyeyxnsZA4dPqBMRAW5Nl1DmGacCyFzQNSLWDdB/gYk99nWlOKuo
         wVP5CEq0tmzJkjQyBabb6MMAegE5DZuJwGiNXWhjnUuKeQToXAhiKw1APKF5iqsaPGyz
         IPnbr29RBJCYHUKHw5G1goaC0hldHC7Eo5YCmDTNP4S4gIZX0x+NGv5bcTSZi4AgHshm
         ym78LpgaM3favbz4TR2y5zoXwOFF9QIywaYV2+p55Q7ltn6xV0cylUWpmdjYdD21bfpP
         FSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793042; x=1690385042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5gUlf88lNqDawp+QDFqKpyx0S67oKkp8rSQiNcf0ao=;
        b=bo2Lwvb1LHYLs5IKjJCsfwAAHXdrsNZELMg1nxn19vQIq75+y/KPBkQRo3Ffl8gQvu
         2muJ3wcNH8w/oozQT7wOsfQAP9OeDuhNjFXC8P+owbL94paX7usZ/qIZTtV+GyWxdesx
         UbN8GcLDxICpYRmq8QOXF67cVzpytHt2Q2UOQf7n4NDiOlFHiyFUEZgHDBIR1K6AeDce
         niInmCe/lsMT3adKv8BAxVwSuqjyU1vB1xG2kdV/pqaHraCHjmjidg3PiwJV6Svjiq01
         mCmwvvtnJfYdHXPXgetuevB2S/RXJa+olVb/c8zbgbCAtgoEZ6f/F/x7wJKjK2Pwur9T
         dlaw==
X-Gm-Message-State: AC+VfDyMypDMnOKlz7n/g5paekWLEQpPyk6GSUSevDoxm2ETfQXPcP9Z
        n0dD/qw6xQGQTqR2DH67lh8w54hOEQE9UjVkGMA=
X-Google-Smtp-Source: ACHHUZ6GuKpKFX27+dRXX044lc3aAZ+dpmQJWZZm2DhUA2msuAn300owtei0lUyDNQpFF4InrLtN7dzYwxN9SJ/zU3Q=
X-Received: by 2002:a5d:9c13:0:b0:783:63ac:25cf with SMTP id
 19-20020a5d9c13000000b0078363ac25cfmr1676550ioe.7.1687793041913; Mon, 26 Jun
 2023 08:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230622114028.908825-1-sakari.ailus@linux.intel.com> <20230622114028.908825-33-sakari.ailus@linux.intel.com>
In-Reply-To: <20230622114028.908825-33-sakari.ailus@linux.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 26 Jun 2023 16:23:36 +0100
Message-ID: <CA+V-a8uHp3pAzDygSC=0iJVpoXorq1zs5utmVGBs3Mj9dwYE4g@mail.gmail.com>
Subject: Re: [PATCH v4 32/38] media: am437x-vpfe: Register V4L2 device early
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, Jun 22, 2023 at 12:41=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Register V4L2 device before the async notifier.This way the device can be
> made available to the V4L2 async framework from the notifier init time
> onwards. A subsequent patch will add struct v4l2_device as an argument to
> v4l2_async_nf_init().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
> Tested_by: Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se> # rcar +=
 adv746x
s/Tested_by/Tested-by (exists in the entire series)

> Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.M=
X6Q with TC358743
> ---
>  .../media/platform/ti/am437x/am437x-vpfe.c    | 27 +++++++++----------
>  1 file changed, 13 insertions(+), 14 deletions(-)
>

Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/med=
ia/platform/ti/am437x/am437x-vpfe.c
> index a1e01ef5ebddb..1457a188fea12 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2403,10 +2403,17 @@ static int vpfe_probe(struct platform_device *pde=
v)
>
>         vpfe->pdev =3D &pdev->dev;
>
> +       ret =3D v4l2_device_register(&pdev->dev, &vpfe->v4l2_dev);
> +       if (ret) {
> +               vpfe_err(vpfe, "Unable to register v4l2 device.\n");
> +               return ret;
> +       }
> +
>         vpfe_cfg =3D vpfe_get_pdata(vpfe);
>         if (!vpfe_cfg) {
>                 dev_err(&pdev->dev, "No platform data\n");
> -               return -EINVAL;
> +               ret =3D -EINVAL;
> +               goto probe_out_cleanup;
>         }
>
>         vpfe->cfg =3D vpfe_cfg;
> @@ -2433,13 +2440,6 @@ static int vpfe_probe(struct platform_device *pdev=
)
>                 goto probe_out_cleanup;
>         }
>
> -       ret =3D v4l2_device_register(&pdev->dev, &vpfe->v4l2_dev);
> -       if (ret) {
> -               vpfe_err(vpfe,
> -                       "Unable to register v4l2 device.\n");
> -               goto probe_out_cleanup;
> -       }
> -
>         /* set the driver data in platform device */
>         platform_set_drvdata(pdev, vpfe);
>         /* Enabling module functional clock */
> @@ -2449,7 +2449,7 @@ static int vpfe_probe(struct platform_device *pdev)
>         ret =3D pm_runtime_resume_and_get(&pdev->dev);
>         if (ret < 0) {
>                 vpfe_err(vpfe, "Unable to resume device.\n");
> -               goto probe_out_v4l2_unregister;
> +               goto probe_out_cleanup;
>         }
>
>         vpfe_ccdc_config_defaults(ccdc);
> @@ -2462,7 +2462,7 @@ static int vpfe_probe(struct platform_device *pdev)
>                                 GFP_KERNEL);
>         if (!vpfe->sd) {
>                 ret =3D -ENOMEM;
> -               goto probe_out_v4l2_unregister;
> +               goto probe_out_cleanup;
>         }
>
>         vpfe->notifier.ops =3D &vpfe_async_ops;
> @@ -2470,15 +2470,14 @@ static int vpfe_probe(struct platform_device *pde=
v)
>         if (ret) {
>                 vpfe_err(vpfe, "Error registering async notifier\n");
>                 ret =3D -EINVAL;
> -               goto probe_out_v4l2_unregister;
> +               goto probe_out_cleanup;
>         }
>
>         return 0;
>
> -probe_out_v4l2_unregister:
> -       v4l2_device_unregister(&vpfe->v4l2_dev);
>  probe_out_cleanup:
>         v4l2_async_nf_cleanup(&vpfe->notifier);
> +       v4l2_device_unregister(&vpfe->v4l2_dev);
>         return ret;
>  }
>
> @@ -2493,8 +2492,8 @@ static void vpfe_remove(struct platform_device *pde=
v)
>
>         v4l2_async_nf_unregister(&vpfe->notifier);
>         v4l2_async_nf_cleanup(&vpfe->notifier);
> -       v4l2_device_unregister(&vpfe->v4l2_dev);
>         video_unregister_device(&vpfe->video_dev);
> +       v4l2_device_unregister(&vpfe->v4l2_dev);
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> --
> 2.39.2
>
