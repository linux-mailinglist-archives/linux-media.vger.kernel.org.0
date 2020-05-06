Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0486F1C776F
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 19:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729939AbgEFRHF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 13:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729553AbgEFRHF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 13:07:05 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C5AC061A0F;
        Wed,  6 May 2020 10:07:05 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id i68so2030341qtb.5;
        Wed, 06 May 2020 10:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=INRLer8tPzqwikZ236RQ8wL9bG2r0gnyDywNRRQv8rU=;
        b=IHvXGWM8/+N0VUXxUa8P998D8ZLCGDrOU9t4L2IZwmORWdpnjDpp4irhErnhc2CE9P
         n91lSysgyKnQfLBuHTKmO7YXdDXOVvJI423CReuJY7yNua0sfbKyteo3uizZjS4TT7ji
         +4T6ny6ynXyjllaU7d9E7JIP3br82htBVIJYUcqzsCNWPHvgNNbJ+nLJ/EETz6virWjT
         dGftL9UYBr96DqQv1tyOIjbvG1jPsdSAMtBAgXbs6c4Xkx2V1EUfeMoJKPBfr8TrCDDs
         bh7hODU5h5AL9KzW4Kr1B/+/NWY44GYcpNLuE6B6nB+0qW5uuHwZ7VcVKc6j70wSEW2/
         7lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=INRLer8tPzqwikZ236RQ8wL9bG2r0gnyDywNRRQv8rU=;
        b=D5hkDo6ywN/j8p9iVxVtdpz20hSyhk+4SwRvrCrRu9yXuJg9HGcukbHDgWDF6lqcsO
         4nmKUXSf3o1GMZGbi6+JP0c1XVtM+bjkv8XeC0NCxlkdlcnPv0Un9MzElFi7UKAkeyBV
         Hi9/O8poxg9AzMfQ4/z24iE6XJO1ODBBgtyC0V5UM/qhrQHhx61Tses0GP7N3gATAn/P
         o50HRFUfYBI6O/4X/sCU0iDCsUb96tBMLKKRc5qB+e2cXpFdqhwrRnCNNU0R8/VoZ7Bb
         cMMgioe5EOhZ58pIqS4xoQ/Fe6qoT8RGRl+wMApeDr8CRcWDupae04iUQ492hpGq8v3C
         sWRg==
X-Gm-Message-State: AGi0PuaVWThOhokUV9S5ieQ34Qc9m3AqHAmtQ+cdUcf6n02+ilmYxjtd
        fKKNAlQgeT3lHH+vakSHR9CpYBFS5y8ULDr/ovI=
X-Google-Smtp-Source: APiQypLMchmj31m9xdDxa5B93JFCjjuKAEhOojWveGb5LGrE88JxteLJ6rRME83HrJApWyY8krLyAdTXPDN4iqrmBMU=
X-Received: by 2002:ac8:4987:: with SMTP id f7mr9172888qtq.160.1588784824302;
 Wed, 06 May 2020 10:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200506084039.249977-1-eizan@chromium.org> <20200506184018.v2.2.I87cf35a058328c780bd3b8b2191209a5011b7016@changeid>
In-Reply-To: <20200506184018.v2.2.I87cf35a058328c780bd3b8b2191209a5011b7016@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Wed, 6 May 2020 19:06:52 +0200
Message-ID: <CAFqH_50_Py7Diu5bwmjLBPGiy3F5J5qNGmtrbH7i7aTUaHif9A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] [media] mtk-mdp: use pm_runtime in MDP component driver
To:     Eizan Miyamoto <eizan@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan,

Thank you for the patch.

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dc., 6 de maig
2020 a les 10:42:
>
> Without this change, the MDP components are not fully integrated into
> the runtime power management subsystem, and the MDP driver does not
> work.
>
> For each of the component device drivers to be able to call
> pm_runtime_get/put_sync() a pointer to the component's device struct
> had to be added to struct mtk_mdp_comp, set by mtk_mdp_comp_init().
>
> Note that the dev argument to mtk_mdp_comp_clock_on/off() has been
> removed. Those functions used to be called from the "master" mdp driver
> in mtk_mdp_core.c, but the component's device pointer no longer
> corresponds to the mdp master device pointer, which is not the right
> device to pass to pm_runtime_put/get_sync() which we had to add to get
> the driver to work properly.
>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
>
> Changes in v2:

Ah, I guess this change log corresponds to the first patch.

> - remove empty mtk_mdp_comp_init
> - update documentation for enum mtk_mdp_comp_type
> - remove comma after last element of mtk_mdp_comp_driver_dt_match
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 22 ++++++++++++++-----
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  6 +++--
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 ++---
>  3 files changed, 23 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 5b4d482df778..228c58f92c8c 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -15,6 +15,7 @@
>  #include <linux/of_platform.h>
>  #include <soc/mediatek/smi.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>
>  #include "mtk_mdp_comp.h"
>  #include "mtk_mdp_core.h"
> @@ -53,7 +54,7 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
>
> -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
> +void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
>  {
>         int i, err;
>
> @@ -62,25 +63,31 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>                 if (err) {
>                         enum mtk_mdp_comp_type comp_type =
>                                 (enum mtk_mdp_comp_type)
> -                               of_device_get_match_data(dev);
> -                       dev_err(dev,
> +                               of_device_get_match_data(comp->dev);
> +                       dev_err(comp->dev,
>                                 "failed to get larb, err %d. type:%d\n",
>                                 err, comp_type);
>                 }
>         }
>
> +       err = pm_runtime_get_sync(comp->dev);
> +       if (err < 0)
> +               dev_err(comp->dev,
> +                       "failed to runtime get, err %d.\n",
> +                       err);

Should you really ignore this error? If that's the case I'd just call
pm_runtime_get_sync() without adding the logic to just print an error
message.

> +
>         for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>                 if (IS_ERR(comp->clk[i]))
>                         continue;
>                 err = clk_prepare_enable(comp->clk[i]);
>                 if (err)
> -                       dev_err(dev,
> +                       dev_err(comp->dev,
>                                 "failed to enable clock, err %d. i:%d\n",
>                                 err, i);

Although ignoring errors seems to be a common pattern in this file and
I know you did not introduce this.

>         }
>  }
>
> -void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
> +void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>  {
>         int i;
>
> @@ -92,6 +99,8 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
>
>         if (comp->larb_dev)
>                 mtk_smi_larb_put(comp->larb_dev);
> +
> +       pm_runtime_put_sync(comp->dev);
>  }
>
>  static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
> @@ -101,6 +110,7 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>         struct mtk_mdp_dev *mdp = data;
>
>         mtk_mdp_register_component(mdp, comp);
> +       pm_runtime_enable(dev);
>
>         return 0;
>  }
> @@ -111,6 +121,7 @@ static void mtk_mdp_comp_unbind(struct device *dev, struct device *master,
>         struct mtk_mdp_dev *mdp = data;
>         struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
>
> +       pm_runtime_disable(dev);
>         mtk_mdp_unregister_component(mdp, comp);
>  }
>
> @@ -129,6 +140,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>                  (enum mtk_mdp_comp_type)of_device_get_match_data(dev);
>
>         INIT_LIST_HEAD(&comp->node);
> +       comp->dev = dev;
>
>         for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>                 comp->clk[i] = of_clk_get(node, i);
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index b5a18fe567aa..de158d3712f6 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -12,17 +12,19 @@
>   * @node:      list node to track sibing MDP components
>   * @clk:       clocks required for component
>   * @larb_dev:  SMI device required for component
> + * @dev:       component's device
>   */
>  struct mtk_mdp_comp {
>         struct list_head        node;
>         struct clk              *clk[2];
>         struct device           *larb_dev;
> +       struct device           *dev;
>  };
>
>  int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
>
> -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
> -void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
> +void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
> +void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
>
>  extern struct platform_driver mtk_mdp_component_driver;
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 539a7942e3cb..133d107aa4e6 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -52,20 +52,18 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
>
>  static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>  {
> -       struct device *dev = &mdp->pdev->dev;
>         struct mtk_mdp_comp *comp_node;
>
>         list_for_each_entry(comp_node, &mdp->comp_list, node)
> -               mtk_mdp_comp_clock_on(dev, comp_node);
> +               mtk_mdp_comp_clock_on(comp_node);
>  }
>
>  static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
>  {
> -       struct device *dev = &mdp->pdev->dev;
>         struct mtk_mdp_comp *comp_node;
>
>         list_for_each_entry(comp_node, &mdp->comp_list, node)
> -               mtk_mdp_comp_clock_off(dev, comp_node);
> +               mtk_mdp_comp_clock_off(comp_node);
>  }
>
>  static void mtk_mdp_wdt_worker(struct work_struct *work)
> --
> 2.26.2.526.g744177e7f7-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
