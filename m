Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F266E2CBFE7
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 15:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387459AbgLBOiz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 09:38:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgLBOiy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 09:38:54 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F6AC0613CF;
        Wed,  2 Dec 2020 06:38:08 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id t7so881776pfh.7;
        Wed, 02 Dec 2020 06:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ZFn9jj7ck1AeGmEuUzHYIIlYUJOzST9lxK0bajNvuY=;
        b=cNQC3QRXG4RXBAA9H4ChKE2dtSOwnaaxBVEnhqkKUT7ycCK0dRpA38X9gid4c7Sif2
         yQhPPBDur/QK+vH5gpBEfXLoIqrw2W8wC0lqnJcorbO4AEjNxtwsPl3TLTZ4c8poar5n
         Yxx+/tjJSgnQvjTQb5KQo4VAjPFMgJOcAqi7Buq7rlfz5nCBKppZR5+lpHyqkuI/Wcef
         6Za2Ck5N7j5Uz+uQBPTeM0AwrMKlSY7jB5JmhM9CUzqWQMmBG8lniwf+L15gR1WlY7vX
         rjDC/jDq5oGsKh+EjwXY1ztViDySUbBxfqubgzobKPiv1XXALIU2yDDknSLJuGsy4nbN
         TxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ZFn9jj7ck1AeGmEuUzHYIIlYUJOzST9lxK0bajNvuY=;
        b=johpKokK4va5yeowCwmEtFbY8BtTKBQ40OIjNhcETgPxak8EqSpvdEAEep5gACAjRC
         MUuQTkvQJ0vkRhd271YvDV8ynouWoKluat44Z/ubR1vTiq5qkch/3urD6nEMDZ9aUnfj
         6zC2gwvwehesZODc5W4ZvHkpsPiidOVwxWINgzlLk/vP8Gk6n7TwtV1Ul/hlvqI1PZAq
         ipQTAJWEQ+FtlCDL4mPfHhVCPP9shM20Q/V03QD6ARMfirSEmz+4tdzwL91IO66n7Rdo
         gzXbSFSY8ps7p5cqSZhcktkHoeyNe6RA+Om9usoSVv8s/o775rSuIImnnEp42QKUYHNp
         cJAQ==
X-Gm-Message-State: AOAM530SAbhLrgux/9kHGIi/jna1nV8NZCaXDo7178wJFNLduymbne/s
        HLCpsEk7E4+RR5w6PG3DvmL60DziIUp9E8OgBME=
X-Google-Smtp-Source: ABdhPJylzVGibkJj/f5n4zO+bSXmbg48YiblB42Li+yDqb0AjyqZOKB2GSOQ9QzXc9o15FpPjMxnxr26iKt7h5fGVgQ=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr2940391pfe.40.1606919887806; Wed, 02 Dec
 2020 06:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20201202141326.32645-1-festevam@gmail.com>
In-Reply-To: <20201202141326.32645-1-festevam@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 2 Dec 2020 16:38:56 +0200
Message-ID: <CAHp75VfZ7LGCKnBXXyyAXf5a+W3s4rWP=OMe8=LbAj2qeqXnQQ@mail.gmail.com>
Subject: Re: [PATCH v4] media: coda: Convert the driver to DT-only
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 2, 2020 at 4:15 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Since 5.10-rc1 i.MX is a devicetree-only platform, so simplify the code
> by removing the unused non-DT support.

I haven't checked full context but from what I see the patch looks
good to me, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v3:
> - Add a explicit OF dependency - Andy
>
>  drivers/media/platform/Kconfig            |  2 +-
>  drivers/media/platform/coda/coda-common.c | 27 ++---------------------
>  include/linux/platform_data/media/coda.h  | 14 ------------
>  3 files changed, 3 insertions(+), 40 deletions(-)
>  delete mode 100644 include/linux/platform_data/media/coda.h
>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index ffffef2267f4..9fdbfea06087 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -201,7 +201,7 @@ if V4L_MEM2MEM_DRIVERS
>
>  config VIDEO_CODA
>         tristate "Chips&Media Coda multi-standard codec IP"
> -       depends on VIDEO_DEV && VIDEO_V4L2 && (ARCH_MXC || COMPILE_TEST)
> +       depends on VIDEO_DEV && VIDEO_V4L2 && OF && (ARCH_MXC || COMPILE_TEST)
>         select SRAM
>         select VIDEOBUF2_DMA_CONTIG
>         select VIDEOBUF2_VMALLOC
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index d30eafea701d..995e95272e51 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -25,7 +25,6 @@
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
>  #include <linux/of.h>
> -#include <linux/platform_data/media/coda.h>
>  #include <linux/ratelimit.h>
>  #include <linux/reset.h>
>
> @@ -3102,13 +3101,6 @@ static const struct coda_devtype coda_devdata[] = {
>         },
>  };
>
> -static const struct platform_device_id coda_platform_ids[] = {
> -       { .name = "coda-imx27", .driver_data = CODA_IMX27 },
> -       { /* sentinel */ }
> -};
> -MODULE_DEVICE_TABLE(platform, coda_platform_ids);
> -
> -#ifdef CONFIG_OF
>  static const struct of_device_id coda_dt_ids[] = {
>         { .compatible = "fsl,imx27-vpu", .data = &coda_devdata[CODA_IMX27] },
>         { .compatible = "fsl,imx51-vpu", .data = &coda_devdata[CODA_IMX51] },
> @@ -3118,14 +3110,9 @@ static const struct of_device_id coda_dt_ids[] = {
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, coda_dt_ids);
> -#endif
>
>  static int coda_probe(struct platform_device *pdev)
>  {
> -       const struct of_device_id *of_id =
> -                       of_match_device(of_match_ptr(coda_dt_ids), &pdev->dev);
> -       const struct platform_device_id *pdev_id;
> -       struct coda_platform_data *pdata = pdev->dev.platform_data;
>         struct device_node *np = pdev->dev.of_node;
>         struct gen_pool *pool;
>         struct coda_dev *dev;
> @@ -3135,14 +3122,7 @@ static int coda_probe(struct platform_device *pdev)
>         if (!dev)
>                 return -ENOMEM;
>
> -       pdev_id = of_id ? of_id->data : platform_get_device_id(pdev);
> -
> -       if (of_id)
> -               dev->devtype = of_id->data;
> -       else if (pdev_id)
> -               dev->devtype = &coda_devdata[pdev_id->driver_data];
> -       else
> -               return -EINVAL;
> +       dev->devtype = of_device_get_match_data(&pdev->dev);
>
>         dev->dev = &pdev->dev;
>         dev->clk_per = devm_clk_get(&pdev->dev, "per");
> @@ -3200,10 +3180,8 @@ static int coda_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       /* Get IRAM pool from device tree or platform data */
> +       /* Get IRAM pool from device tree */
>         pool = of_gen_pool_get(np, "iram", 0);
> -       if (!pool && pdata)
> -               pool = gen_pool_get(pdata->iram_dev, NULL);
>         if (!pool) {
>                 dev_err(&pdev->dev, "iram pool not available\n");
>                 return -ENOMEM;
> @@ -3342,7 +3320,6 @@ static struct platform_driver coda_driver = {
>                 .of_match_table = of_match_ptr(coda_dt_ids),
>                 .pm     = &coda_pm_ops,
>         },
> -       .id_table = coda_platform_ids,
>  };
>
>  module_platform_driver(coda_driver);
> diff --git a/include/linux/platform_data/media/coda.h b/include/linux/platform_data/media/coda.h
> deleted file mode 100644
> index 293b61b60c9d..000000000000
> --- a/include/linux/platform_data/media/coda.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * Copyright (C) 2013 Philipp Zabel, Pengutronix
> - */
> -#ifndef PLATFORM_CODA_H
> -#define PLATFORM_CODA_H
> -
> -struct device;
> -
> -struct coda_platform_data {
> -       struct device *iram_dev;
> -};
> -
> -#endif
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
