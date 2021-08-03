Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B89F3DEACC
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 12:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235059AbhHCK1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 06:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234863AbhHCK1O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 06:27:14 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A8CC061764;
        Tue,  3 Aug 2021 03:27:03 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id t128so27666284oig.1;
        Tue, 03 Aug 2021 03:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SqM/oJoSvzSobxq+NRIrAXdGV2FVgUmDDxPLkyPPcTQ=;
        b=GO+GBvXQjZzUcn2PSHWiy5aNWfSj5Nflq8cZPBm1/eE2/rGkZoAsGtVLfSuNeNXjZJ
         uDOvdJpreBU+ep8b59D4dzlzOPK7J/bFtKnnPAtIxQe/ScQFO+Y3gxNHQu/boyq+m+zy
         F0riRgYC72zY0QIvLLvJdKmgz7aAXLZzyD8Um+DXUSwcObVsiqhHQu+AOx/i6mXo6pQ/
         R1Ojm6zF4OaaW/QCwGn+deanoAfRHZd5cE0u2TsiaaH7eYauxH/R8XAKqK2nEGL8D9fe
         jJs1TMN3HJyxXiOTZizOFzXOxC873CEprgwEXqLX3sP2/WDPORm4ShAX3WX/nNBptr48
         MKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SqM/oJoSvzSobxq+NRIrAXdGV2FVgUmDDxPLkyPPcTQ=;
        b=i5NmLVCXxZv19yXwGV4PXQnyX9gkyVwYEEuIgmVYRbbhpfILHjooXP0H6MfCr8Vt+X
         ndRULZFjuG/L4a8wrwynWnM4FFJmL7/xSc+NlZJr5Ker5dKYmwaw2OMQln0R+y6jK0as
         if2wuhW6al7ZVGhFDxZMAjq5k0yPTBDQlClTUE/uM8OfRmisvujchVa6SVxkinqe4ed+
         xy3ppPigipcUxshrhhbQ/PxcKW4sSv3AgBEnT2aNMVLBo+1fIf4OaixijGYGqUF5DrY+
         6BaMzRvde7rMWY7DJuZLfrDHJvvnpNBb7QHweM4H78E+xs/PLq7HRbE1xGmDdvKZR8ac
         TOEg==
X-Gm-Message-State: AOAM530wkUavAQzgyIj0LUMX3ETuDXS1nCF7uBQwbKVWt6VAs6pf9kv9
        kGSQYWRMTI7ng7C6y8k4AoqM/7ZbiInP8IIJB38=
X-Google-Smtp-Source: ABdhPJyuVxKpBkp+AM1eSSbFrWppWiASs+gUV+Cz2msdcywU5eJmvTXn6woluOElwpzG8OB7EryTrYZxlB1RDVgeILE=
X-Received: by 2002:a05:6808:20aa:: with SMTP id s42mr2431911oiw.129.1627986422784;
 Tue, 03 Aug 2021 03:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org> <20210802220943.v6.3.I909f5375d930f5d0cc877128e30e2a67078b674c@changeid>
In-Reply-To: <20210802220943.v6.3.I909f5375d930f5d0cc877128e30e2a67078b674c@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 3 Aug 2021 12:26:50 +0200
Message-ID: <CAFqH_50CLCXSQ=24MpPMQb5DtC6k3iUaWp5dLrbjfAr-3MBpBQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] mtk-mdp: use pm_runtime in MDP component driver
To:     Eizan Miyamoto <eizan@chromium.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        devicetree <devicetree@vger.kernel.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan,

Thank you for your patch.

Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dl., 2 d=E2=80=99ag=
.
2021 a les 14:14:
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

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>


> ---
>
> (no changes since v1)
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 24 +++++++++++++++----
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  6 +++--
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  7 +++---
>  3 files changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_comp.c
> index 7a0e3acffab9..472c261b01e8 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <soc/mediatek/smi.h>
> +#include <linux/pm_runtime.h>
>
>  #include "mtk_mdp_comp.h"
>  #include "mtk_mdp_core.h"
> @@ -50,14 +51,22 @@ static const struct of_device_id mtk_mdp_comp_driver_=
dt_match[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
>
> -int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
> +int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
>  {
>         int i, err, status;
>
>         if (comp->larb_dev) {
>                 err =3D mtk_smi_larb_get(comp->larb_dev);
>                 if (err)
> -                       dev_err(dev, "failed to get larb, err %d.\n", err=
);
> +                       dev_err(comp->dev, "failed to get larb, err %d.\n=
", err);
> +       }
> +
> +       err =3D pm_runtime_get_sync(comp->dev);
> +       if (err < 0) {
> +               dev_err(comp->dev,
> +                       "failed to runtime get, err %d.\n",
> +                       err);
> +               return err;
>         }
>
>         for (i =3D 0; i < ARRAY_SIZE(comp->clk); i++) {
> @@ -66,7 +75,7 @@ int mtk_mdp_comp_clock_on(struct device *dev, struct mt=
k_mdp_comp *comp)
>                 err =3D clk_prepare_enable(comp->clk[i]);
>                 if (err) {
>                         status =3D err;
> -                       dev_err(dev, "failed to enable clock, err %d. i:%=
d\n", err, i);
> +                       dev_err(comp->dev, "failed to enable clock, err %=
d. i:%d\n", err, i);
>                         goto err_clk_prepare_enable;
>                 }
>         }
> @@ -80,10 +89,12 @@ int mtk_mdp_comp_clock_on(struct device *dev, struct =
mtk_mdp_comp *comp)
>                 clk_disable_unprepare(comp->clk[i]);
>         }
>
> +       pm_runtime_put_sync(comp->dev);
> +
>         return status;
>  }
>
> -void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *com=
p)
> +int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>  {
>         int i;
>
> @@ -95,6 +106,8 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct=
 mtk_mdp_comp *comp)
>
>         if (comp->larb_dev)
>                 mtk_smi_larb_put(comp->larb_dev);
> +
> +       return pm_runtime_put_sync(comp->dev);
>  }
>
>  static int mtk_mdp_comp_bind(struct device *dev, struct device *master, =
void *data)
> @@ -103,6 +116,7 @@ static int mtk_mdp_comp_bind(struct device *dev, stru=
ct device *master, void *da
>         struct mtk_mdp_dev *mdp =3D data;
>
>         mtk_mdp_register_component(mdp, comp);
> +       pm_runtime_enable(dev);
>
>         return 0;
>  }
> @@ -113,6 +127,7 @@ static void mtk_mdp_comp_unbind(struct device *dev, s=
truct device *master,
>         struct mtk_mdp_comp *comp =3D dev_get_drvdata(dev);
>         struct mtk_mdp_dev *mdp =3D data;
>
> +       pm_runtime_disable(dev);
>         mtk_mdp_unregister_component(mdp, comp);
>  }
>
> @@ -132,6 +147,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, stru=
ct device *dev)
>                  (enum mtk_mdp_comp_type)of_device_get_match_data(dev);
>
>         INIT_LIST_HEAD(&comp->node);
> +       comp->dev =3D dev;
>
>         for (i =3D 0; i < ARRAY_SIZE(comp->clk); i++) {
>                 comp->clk[i] =3D of_clk_get(node, i);
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_comp.h
> index df5fc4c94f90..f2e22e7e7c45 100644
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
> +       struct device           *dev;
>         struct device           *larb_dev;
>  };
>
>  int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
>
> -int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)=
;
> -void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *com=
p);
> +int mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp);
> +int mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp);
>
>  extern struct platform_driver mtk_mdp_component_driver;
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_core.c
> index b813a822439a..714154450981 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -58,7 +58,7 @@ static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>         int err;
>
>         list_for_each_entry(comp_node, &mdp->comp_list, node) {
> -               err =3D mtk_mdp_comp_clock_on(dev, comp_node);
> +               err =3D mtk_mdp_comp_clock_on(comp_node);
>                 if (err) {
>                         status =3D err;
>                         goto err_mtk_mdp_comp_clock_on;
> @@ -69,18 +69,17 @@ static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>
>  err_mtk_mdp_comp_clock_on:
>         list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, =
node)
> -               mtk_mdp_comp_clock_off(dev, comp_node);
> +               mtk_mdp_comp_clock_off(comp_node);
>
>         return status;
>  }
>
>  static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
>  {
> -       struct device *dev =3D &mdp->pdev->dev;
>         struct mtk_mdp_comp *comp_node;
>
>         list_for_each_entry(comp_node, &mdp->comp_list, node)
> -               mtk_mdp_comp_clock_off(dev, comp_node);
> +               mtk_mdp_comp_clock_off(comp_node);
>  }
>
>  static void mtk_mdp_wdt_worker(struct work_struct *work)
> --
> 2.32.0.554.ge1b32706d8-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
