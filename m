Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D50173E37E
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 17:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbjFZPgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jun 2023 11:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbjFZPgl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jun 2023 11:36:41 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF54F3
        for <linux-media@vger.kernel.org>; Mon, 26 Jun 2023 08:36:39 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-77acb04309dso206812839f.2
        for <linux-media@vger.kernel.org>; Mon, 26 Jun 2023 08:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687793798; x=1690385798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqPoVErgqrF1rFCO4uaZZ2AIPLilClQCeem0nDVSjFU=;
        b=fc4DKTMHsdKl6Tg08F/9XuozkWPRpnrtsowclNabyb3121VaTfIy1uUXkXUJ7+lo8O
         taDhcGHpvWlwzbdR0HTg2NDcD386VPcTH54sG0ToOjfs53iyxIu8+yMxF1eKFxADtI9M
         GJBNwVQ4b7kI8Y6LuPV9U677OADdPDeK4YSM45yAU0ZpPe3pqfhkNR1q87hI3nhX82Xf
         QmT+YJQyRkw7YFuLnT8np/vUhB5qgHyOWtyS5IkOTXrEA6Nqoj0tHLSOUqZrnX2GLDVi
         glSXHWB0q6O37bxEXnFn9NMzb/yw7r5lWZ/jZG0RNG1XHGDa1Y4gteqflBWXYIm8TF2G
         XrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793798; x=1690385798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqPoVErgqrF1rFCO4uaZZ2AIPLilClQCeem0nDVSjFU=;
        b=CQ2dD/DnVA0BZlgT/xQowe8Qaf3W2XpnPvNNLHOWvM2aI0vbt/Zq3aq5jvSsWUUlhE
         BRxECbP0VOFvcz77WbwSbCw3vFsA6DTvpDGLe5GqJFHNWM50N/VjD6BZAf8TBhRgIHm1
         VxfL33f6GvD+WiSdQ10Eaa2aCsPF+4BHpqK+4VWrTySTbyAntsLLo+fTjvO+zTGf/w7H
         mVihAeEWR3uhuIn2doo85aCIfovoCGzZQwPWSPuKCSYzCNFNbGAvca7pSNQAPi+MuBIZ
         LTQZSTuvpe2UTr+2/4ByK+yNK4g+RfEvHpN15efvN3o2U//A5slTPqvTviptH5/1dIOb
         94Fw==
X-Gm-Message-State: AC+VfDy7Kf1CTLSG/rzP6BSk3bZvuEq8nvCsFq9xBzuI/qBTcvO7yjIs
        1IDZbBRnlr8fUyiEdiW5f4AdeJNg8YIgQlDOE4l5P+Bc0Bgp9evR
X-Google-Smtp-Source: ACHHUZ5r1RizWQwB26dYDaZOe9ljJSCgs11ZHEVHGdksdcCG+NTJAw1aSTpkquf1o5WopTrfxujK8AI39f/QL6qFb40=
X-Received: by 2002:a6b:e503:0:b0:783:62f7:3e2c with SMTP id
 y3-20020a6be503000000b0078362f73e2cmr2393944ioc.9.1687793798503; Mon, 26 Jun
 2023 08:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230622114028.908825-1-sakari.ailus@linux.intel.com> <20230622114028.908825-36-sakari.ailus@linux.intel.com>
In-Reply-To: <20230622114028.908825-36-sakari.ailus@linux.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 26 Jun 2023 16:36:12 +0100
Message-ID: <CA+V-a8tH3SzG6wr6oznap2Z3Y3H5i67W51Kpk5CbndTb7ARcPg@mail.gmail.com>
Subject: Re: [PATCH v4 35/38] media: davinci: Init async notifier after
 registering V4L2 device
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
> Initialise the V4L2 async notifier after registering the V4L2 device, jus=
t
> before parsing DT for async sub-devices. This way the device can be made
> available to the V4L2 async framework from the notifier init time onwards=
.
> A subsequent patch will add struct v4l2_device as an argument to
> v4l2_async_nf_init().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
> Tested_by: Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se> # rcar +=
 adv746x
> Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.M=
X6Q with TC358743
> ---
>  .../media/platform/ti/davinci/vpif_capture.c    | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/m=
edia/platform/ti/davinci/vpif_capture.c
> index a63c9e51dac41..9b97e26be0892 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> @@ -1608,18 +1608,12 @@ static __init int vpif_probe(struct platform_devi=
ce *pdev)
>         int res_idx =3D 0;
>         int i, err;
>
> -       pdev->dev.platform_data =3D vpif_capture_get_pdata(pdev);
> -       if (!pdev->dev.platform_data) {
> -               dev_warn(&pdev->dev, "Missing platform data.  Giving up.\=
n");
> -               return -EINVAL;
> -       }
> -
>         vpif_dev =3D &pdev->dev;
>
>         err =3D initialize_vpif();
>         if (err) {
>                 v4l2_err(vpif_dev->driver, "Error initializing vpif\n");
> -               goto cleanup;
> +               return err;
>         }
>
>         err =3D v4l2_device_register(vpif_dev, &vpif_obj.v4l2_dev);
> @@ -1655,6 +1649,12 @@ static __init int vpif_probe(struct platform_devic=
e *pdev)
>                 goto vpif_unregister;
>         }
>
> +       pdev->dev.platform_data =3D vpif_capture_get_pdata(pdev);
Just a couple of lines above we reference pdev->dev.platform_data
while assigning it to vpif_obj.config, so this has to be moved prior
to assigning vpif_obj.config.

> +       if (!pdev->dev.platform_data) {
> +               dev_warn(&pdev->dev, "Missing platform data.  Giving up.\=
n");
unrelated to this patch maybe we can drop the extra space after data.  Givi=
ng..

Cheers,
Prabhakar
