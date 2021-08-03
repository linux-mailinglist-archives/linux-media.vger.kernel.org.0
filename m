Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34563DEAD0
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 12:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235073AbhHCK1V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 06:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234871AbhHCK1U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 06:27:20 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CCBC06175F;
        Tue,  3 Aug 2021 03:27:10 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id q6so27577412oiw.7;
        Tue, 03 Aug 2021 03:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yjepP2tt83ouvtIOEKbzyCrf4qjAa8v3mG00/xCenBs=;
        b=E017a48x7taw97swX0CyjRaJ0rxUQwhxpUQ/+dXrZ9/VXZxYlwoKxIRik9356HTaon
         MfCXQf9Uafcz1qIlaqfL07ctJhhhpGZVkZmTeAcnYsJF+E56/wYOxIr34ctNV2C+0lK2
         1kduxVQXok4FVvdzEWaFSLI/bKBgeS6XcmY+sUfGvB/kGp/YnJqGlLYcoW29bmZNDFbv
         LgenqrEndVJ5vRvZ/G1HWA8iiqYIFLCG1PkcYLgunF5F2WXublwpAW0vJ2axfCvn+mbb
         kIX6Qcq+oT9Om2z2wDmone8nu81hcRW86snIaFMujGMw6ywii44vh9Y6VlX2RHOhvbEm
         82uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yjepP2tt83ouvtIOEKbzyCrf4qjAa8v3mG00/xCenBs=;
        b=BW5tyAAYH3xYjUdyk5dgugsz37LIeRlbgY6cUxUIogiOFrYcgd6+iBJqyGcT/S/CVR
         obA1NN2OAeH9MjOHypDhA38rgmC4xEa48mkxgCqyERfGTUbndKTxH8z6jFnAKi3w//d6
         vKESjX1yOi4WHbicDa/T0O7mwKchsajvoUmT7e1jfsB5sp3uFA9IF5GiExtnpbEOi9L7
         enAHgoWhMSHBFvxGOuysV0VDRWWA2SchnaJjulUHYe3+cHxxXPGE3PEQko3+D9LFxfmV
         CobfyGLZ9+5vHMbnUvVNJbflptUx/9DYqzwXdTjNvpyJUBB6CFzzVoDK61lk2jYBJAcp
         Dzxg==
X-Gm-Message-State: AOAM530bgTdEp6jI270Dx6QtALoycYbKM5ASgevUPl3PM75mCQskOF/2
        t76CicwGOwExhXx7mVzV3MwXubX8KQWNKFd47ao=
X-Google-Smtp-Source: ABdhPJxOriS0uU3bz4OzAUToJ1L15HhSqnYr5/vISQZtuFM8FL76DUYRaSF2y3ZeMza+0jo904QVyPbpVPYaobgQG2I=
X-Received: by 2002:aca:c6c9:: with SMTP id w192mr13900572oif.47.1627986429287;
 Tue, 03 Aug 2021 03:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org> <20210802220943.v6.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
In-Reply-To: <20210802220943.v6.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Tue, 3 Aug 2021 12:26:55 +0200
Message-ID: <CAFqH_516sHNQMYf-whxM7V8Cw91J4QsLPo5obU=VNoZNC3Av=Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] mtk-mdp: add driver to probe mdp components
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
2021 a les 14:13:
>
> Broadly, this patch (1) adds a driver for various MTK MDP components to
> go alongside the main MTK MDP driver, and (2) hooks them all together
> using the component framework.
>
> (1) Up until now, the MTK MDP driver controls 8 devices in the device
> tree on its own. When running tests for the hardware video decoder, we
> found that the iommus and LARBs were not being properly configured. To
> configure them, a driver for each be added to mtk_mdp_comp so that
> mtk_iommu_add_device() can (eventually) be called from dma_configure()
> inside really_probe().
>
> (2) The integration into the component framework allows us to defer the
> registration with the v4l2 subsystem until all the MDP-related devices
> have been probed, so that the relevant device node does not become
> available until initialization of all the components is complete.
>
> Some notes about how the component framework has been integrated:
>
> - The driver for the rdma0 component serves double duty as the "master"
>   (aggregate) driver as well as a component driver. This is a non-ideal
>   compromise until a better solution is developed. This device is
>   differentiated from the rest by checking for a "mediatek,vpu" property
>   in the device node.
>
> - The list of mdp components remains hard-coded as mtk_mdp_comp_dt_ids[]
>   in mtk_mdp_core.c, and as mtk_mdp_comp_driver_dt_match[] in
>   mtk_mdp_comp.c. This unfortunate duplication of information is
>   addressed in a following patch in this series.
>
> - The component driver calls component_add() for each device that is
>   probed.
>
> - In mtk_mdp_probe (the "master" device), we scan the device tree for
>   any matching nodes against mtk_mdp_comp_dt_ids, and add component
>   matches for them. The match criteria is a matching device node
>   pointer.
>
> - When the set of components devices that have been probed corresponds
>   with the list that is generated by the "master", the callback to
>   mtk_mdp_master_bind() is made, which then calls the component bind
>   functions.
>
> - Inside mtk_mdp_master_bind(), once all the component bind functions
>   have been called, we can then register our device to the v4l2
>   subsystem.
>
> - The call to pm_runtime_enable() in the master device is called after
>   all the components have been registered by their bind() functions
>   called by mtk_mtp_master_bind(). As a result, the list of components
>   will not change while power management callbacks mtk_mdp_suspend()/
>   resume() are accessing the list of components.
>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>



> ---
>
> (no changes since v1)
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 143 ++++++++++++--
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  25 +--
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 174 +++++++++++++-----
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   1 +
>  4 files changed, 252 insertions(+), 91 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_comp.c
> index 76e295c8d9bc..7a0e3acffab9 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -5,13 +5,50 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/component.h>
>  #include <linux/device.h>
>  #include <linux/of.h>
> +#include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <soc/mediatek/smi.h>
>
>  #include "mtk_mdp_comp.h"
> +#include "mtk_mdp_core.h"
> +
> +/**
> + * enum mtk_mdp_comp_type - the MDP component
> + * @MTK_MDP_RDMA:              Read DMA
> + * @MTK_MDP_RSZ:               Reszer
> + * @MTK_MDP_WDMA:              Write DMA
> + * @MTK_MDP_WROT:              Write DMA with rotation
> + * @MTK_MDP_COMP_TYPE_MAX:     Placeholder for num elems in this enum
> + */
> +enum mtk_mdp_comp_type {
> +       MTK_MDP_RDMA,
> +       MTK_MDP_RSZ,
> +       MTK_MDP_WDMA,
> +       MTK_MDP_WROT,
> +       MTK_MDP_COMP_TYPE_MAX,
> +};
> +
> +static const struct of_device_id mtk_mdp_comp_driver_dt_match[] =3D {
> +       {
> +               .compatible =3D "mediatek,mt8173-mdp-rdma",
> +               .data =3D (void *)MTK_MDP_RDMA
> +       }, {
> +               .compatible =3D "mediatek,mt8173-mdp-rsz",
> +               .data =3D (void *)MTK_MDP_RSZ
> +       }, {
> +               .compatible =3D "mediatek,mt8173-mdp-wdma",
> +               .data =3D (void *)MTK_MDP_WDMA
> +       }, {
> +               .compatible =3D "mediatek,mt8173-mdp-wrot",
> +               .data =3D (void *)MTK_MDP_WROT
> +       },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
>
>  int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>  {
> @@ -20,9 +57,7 @@ int mtk_mdp_comp_clock_on(struct device *dev, struct mt=
k_mdp_comp *comp)
>         if (comp->larb_dev) {
>                 err =3D mtk_smi_larb_get(comp->larb_dev);
>                 if (err)
> -                       dev_err(dev,
> -                               "failed to get larb, err %d. type:%d\n",
> -                               err, comp->type);
> +                       dev_err(dev, "failed to get larb, err %d.\n", err=
);
>         }
>
>         for (i =3D 0; i < ARRAY_SIZE(comp->clk); i++) {
> @@ -62,17 +97,41 @@ void mtk_mdp_comp_clock_off(struct device *dev, struc=
t mtk_mdp_comp *comp)
>                 mtk_smi_larb_put(comp->larb_dev);
>  }
>
> -int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
> -                     struct mtk_mdp_comp *comp,
> -                     enum mtk_mdp_comp_type comp_type)
> +static int mtk_mdp_comp_bind(struct device *dev, struct device *master, =
void *data)
> +{
> +       struct mtk_mdp_comp *comp =3D dev_get_drvdata(dev);
> +       struct mtk_mdp_dev *mdp =3D data;
> +
> +       mtk_mdp_register_component(mdp, comp);
> +
> +       return 0;
> +}
> +
> +static void mtk_mdp_comp_unbind(struct device *dev, struct device *maste=
r,
> +                          void *data)
> +{
> +       struct mtk_mdp_comp *comp =3D dev_get_drvdata(dev);
> +       struct mtk_mdp_dev *mdp =3D data;
> +
> +       mtk_mdp_unregister_component(mdp, comp);
> +}
> +
> +static const struct component_ops mtk_mdp_component_ops =3D {
> +       .bind   =3D mtk_mdp_comp_bind,
> +       .unbind =3D mtk_mdp_comp_unbind,
> +};
> +
> +int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>  {
>         struct device_node *larb_node;
>         struct platform_device *larb_pdev;
>         int ret;
>         int i;
> +       struct device_node *node =3D dev->of_node;
> +       enum mtk_mdp_comp_type comp_type =3D
> +                (enum mtk_mdp_comp_type)of_device_get_match_data(dev);
>
> -       comp->dev_node =3D of_node_get(node);
> -       comp->type =3D comp_type;
> +       INIT_LIST_HEAD(&comp->node);
>
>         for (i =3D 0; i < ARRAY_SIZE(comp->clk); i++) {
>                 comp->clk[i] =3D of_clk_get(node, i);
> @@ -80,19 +139,17 @@ int mtk_mdp_comp_init(struct device *dev, struct dev=
ice_node *node,
>                         if (PTR_ERR(comp->clk[i]) !=3D -EPROBE_DEFER)
>                                 dev_err(dev, "Failed to get clock\n");
>                         ret =3D PTR_ERR(comp->clk[i]);
> -                       goto put_dev;
> +                       goto err;
>                 }
>
>                 /* Only RDMA needs two clocks */
> -               if (comp->type !=3D MTK_MDP_RDMA)
> +               if (comp_type !=3D MTK_MDP_RDMA)
>                         break;
>         }
>
>         /* Only DMA capable components need the LARB property */
>         comp->larb_dev =3D NULL;
> -       if (comp->type !=3D MTK_MDP_RDMA &&
> -           comp->type !=3D MTK_MDP_WDMA &&
> -           comp->type !=3D MTK_MDP_WROT)
> +       if (comp_type !=3D MTK_MDP_RDMA && comp_type !=3D MTK_MDP_WDMA &&=
 comp_type !=3D MTK_MDP_WROT)
>                 return 0;
>
>         larb_node =3D of_parse_phandle(node, "mediatek,larb", 0);
> @@ -100,7 +157,7 @@ int mtk_mdp_comp_init(struct device *dev, struct devi=
ce_node *node,
>                 dev_err(dev,
>                         "Missing mediadek,larb phandle in %pOF node\n", n=
ode);
>                 ret =3D -EINVAL;
> -               goto put_dev;
> +               goto err;
>         }
>
>         larb_pdev =3D of_find_device_by_node(larb_node);
> @@ -108,7 +165,7 @@ int mtk_mdp_comp_init(struct device *dev, struct devi=
ce_node *node,
>                 dev_warn(dev, "Waiting for larb device %pOF\n", larb_node=
);
>                 of_node_put(larb_node);
>                 ret =3D -EPROBE_DEFER;
> -               goto put_dev;
> +               goto err;
>         }
>         of_node_put(larb_node);
>
> @@ -116,13 +173,59 @@ int mtk_mdp_comp_init(struct device *dev, struct de=
vice_node *node,
>
>         return 0;
>
> -put_dev:
> -       of_node_put(comp->dev_node);
> -
> +err:
>         return ret;
>  }
>
> -void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp)
> +static int mtk_mdp_comp_probe(struct platform_device *pdev)
>  {
> -       of_node_put(comp->dev_node);
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *vpu_node;
> +       int status;
> +       struct mtk_mdp_comp *comp;
> +
> +       vpu_node =3D of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> +       if (vpu_node) {
> +               of_node_put(vpu_node);
> +               /*
> +                * The device tree node with a mediatek,vpu property is d=
eemed
> +                * the MDP "master" device, we don't want to add a compon=
ent
> +                * for it in this function because the initialization for=
 the
> +                * master is done elsewhere.
> +                */
> +               dev_info(dev, "vpu node found, not probing\n");
> +               return -ENODEV;
> +       }
> +
> +       comp =3D devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
> +       if (!comp)
> +               return -ENOMEM;
> +
> +       status =3D mtk_mdp_comp_init(comp, dev);
> +       if (status) {
> +               dev_err(dev, "Failed to initialize component: %d\n", stat=
us);
> +               return status;
> +       }
> +
> +       dev_set_drvdata(dev, comp);
> +
> +       return component_add(dev, &mtk_mdp_component_ops);
>  }
> +
> +static int mtk_mdp_comp_remove(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +
> +       component_del(dev, &mtk_mdp_component_ops);
> +       return 0;
> +}
> +
> +struct platform_driver mtk_mdp_component_driver =3D {
> +       .probe          =3D mtk_mdp_comp_probe,
> +       .remove         =3D mtk_mdp_comp_remove,
> +       .driver         =3D {
> +               .name   =3D "mediatek-mdp-comp",
> +               .owner  =3D THIS_MODULE,
> +               .of_match_table =3D mtk_mdp_comp_driver_dt_match,
> +       },
> +};
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_comp.h
> index 92ab5249bcad..df5fc4c94f90 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -7,42 +7,23 @@
>  #ifndef __MTK_MDP_COMP_H__
>  #define __MTK_MDP_COMP_H__
>
> -/**
> - * enum mtk_mdp_comp_type - the MDP component
> - * @MTK_MDP_RDMA:      Read DMA
> - * @MTK_MDP_RSZ:       Riszer
> - * @MTK_MDP_WDMA:      Write DMA
> - * @MTK_MDP_WROT:      Write DMA with rotation
> - */
> -enum mtk_mdp_comp_type {
> -       MTK_MDP_RDMA,
> -       MTK_MDP_RSZ,
> -       MTK_MDP_WDMA,
> -       MTK_MDP_WROT,
> -};
> -
>  /**
>   * struct mtk_mdp_comp - the MDP's function component data
>   * @node:      list node to track sibing MDP components
> - * @dev_node:  component device node
>   * @clk:       clocks required for component
>   * @larb_dev:  SMI device required for component
> - * @type:      component type
>   */
>  struct mtk_mdp_comp {
>         struct list_head        node;
> -       struct device_node      *dev_node;
>         struct clk              *clk[2];
>         struct device           *larb_dev;
> -       enum mtk_mdp_comp_type  type;
>  };
>
> -int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
> -                     struct mtk_mdp_comp *comp,
> -                     enum mtk_mdp_comp_type comp_type);
> -void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp);
> +int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
> +
>  int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)=
;
>  void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *com=
p);
>
> +extern struct platform_driver mtk_mdp_component_driver;
>
>  #endif /* __MTK_MDP_COMP_H__ */
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_core.c
> index 412bbec0f735..b813a822439a 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/component.h>
>  #include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/interrupt.h>
> @@ -19,6 +20,7 @@
>  #include <linux/workqueue.h>
>  #include <soc/mediatek/smi.h>
>
> +#include "mtk_mdp_comp.h"
>  #include "mtk_mdp_core.h"
>  #include "mtk_mdp_m2m.h"
>  #include "mtk_vpu.h"
> @@ -32,16 +34,12 @@ module_param(mtk_mdp_dbg_level, int, 0644);
>  static const struct of_device_id mtk_mdp_comp_dt_ids[] =3D {
>         {
>                 .compatible =3D "mediatek,mt8173-mdp-rdma",
> -               .data =3D (void *)MTK_MDP_RDMA
>         }, {
>                 .compatible =3D "mediatek,mt8173-mdp-rsz",
> -               .data =3D (void *)MTK_MDP_RSZ
>         }, {
>                 .compatible =3D "mediatek,mt8173-mdp-wdma",
> -               .data =3D (void *)MTK_MDP_WDMA
>         }, {
>                 .compatible =3D "mediatek,mt8173-mdp-wrot",
> -               .data =3D (void *)MTK_MDP_WROT
>         },
>         { },
>  };
> @@ -106,6 +104,63 @@ static void mtk_mdp_reset_handler(void *priv)
>         queue_work(mdp->wdt_wq, &mdp->wdt_work);
>  }
>
> +static int compare_of(struct device *dev, void *data)
> +{
> +       return dev->of_node =3D=3D data;
> +}
> +
> +static void release_of(struct device *dev, void *data)
> +{
> +       of_node_put(data);
> +}
> +
> +static int mtk_mdp_master_bind(struct device *dev)
> +{
> +       int status;
> +       struct mtk_mdp_dev *mdp =3D dev_get_drvdata(dev);
> +
> +       mtk_mdp_register_component(mdp, &mdp->comp_self);
> +
> +       status =3D component_bind_all(dev, mdp);
> +       if (status) {
> +               dev_err(dev, "Failed to bind all components: %d\n", statu=
s);
> +               goto err_component_bind_all;
> +       }
> +
> +       status =3D mtk_mdp_register_m2m_device(mdp);
> +       if (status) {
> +               dev_err(dev, "Failed to register m2m device: %d\n", statu=
s);
> +               goto err_mtk_mdp_register_m2m_device;
> +       }
> +
> +       pm_runtime_enable(dev);
> +
> +       return 0;
> +
> +err_mtk_mdp_register_m2m_device:
> +       component_unbind_all(dev, mdp);
> +
> +err_component_bind_all:
> +       mtk_mdp_unregister_component(mdp, &mdp->comp_self);
> +
> +       return status;
> +}
> +
> +static void mtk_mdp_master_unbind(struct device *dev)
> +{
> +       struct mtk_mdp_dev *mdp =3D dev_get_drvdata(dev);
> +
> +       pm_runtime_disable(dev);
> +       mtk_mdp_unregister_m2m_device(mdp);
> +       component_unbind_all(dev, mdp);
> +       mtk_mdp_unregister_component(mdp, &mdp->comp_self);
> +}
> +
> +static const struct component_master_ops mtk_mdp_com_ops =3D {
> +       .bind           =3D mtk_mdp_master_bind,
> +       .unbind         =3D mtk_mdp_master_unbind,
> +};
> +
>  void mtk_mdp_register_component(struct mtk_mdp_dev *mdp,
>                                 struct mtk_mdp_comp *comp)
>  {
> @@ -123,8 +178,8 @@ static int mtk_mdp_probe(struct platform_device *pdev=
)
>         struct mtk_mdp_dev *mdp;
>         struct device *dev =3D &pdev->dev;
>         struct device_node *node, *parent;
> -       struct mtk_mdp_comp *comp, *comp_temp;
> -       int ret =3D 0;
> +       int i, ret =3D 0;
> +       struct component_match *match =3D NULL;
>
>         mdp =3D devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
>         if (!mdp)
> @@ -149,36 +204,43 @@ static int mtk_mdp_probe(struct platform_device *pd=
ev)
>         }
>
>         /* Iterate over sibling MDP function blocks */
> +       i =3D 0;
>         for_each_child_of_node(parent, node) {
> -               const struct of_device_id *of_id;
> -               enum mtk_mdp_comp_type comp_type;
> +               struct platform_device *pdev;
>
> -               of_id =3D of_match_node(mtk_mdp_comp_dt_ids, node);
> -               if (!of_id)
> +               if (!of_match_node(mtk_mdp_comp_dt_ids, node))
>                         continue;
>
> -               if (!of_device_is_available(node)) {
> -                       dev_err(dev, "Skipping disabled component %pOF\n"=
,
> -                               node);
> +               if (!of_device_is_available(node))
>                         continue;
> -               }
> -
> -               comp_type =3D (enum mtk_mdp_comp_type)of_id->data;
>
> -               comp =3D devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
> -               if (!comp) {
> -                       ret =3D -ENOMEM;
> -                       of_node_put(node);
> -                       goto err_comp;
> +               pdev =3D of_find_device_by_node(node);
> +               if (!pdev) {
> +                       dev_warn(dev, "Unable to find comp device %s\n",
> +                                node->full_name);
> +                       continue;
>                 }
>
> -               ret =3D mtk_mdp_comp_init(dev, node, comp, comp_type);
> -               if (ret) {
> -                       of_node_put(node);
> -                       goto err_comp;
> +               /*
> +                * Do not add a match for my own (rdma0) device node.
> +                * I will be managing it directly instead using comp_self=
.
> +                */
> +               if (&pdev->dev !=3D dev) {
> +                       dev_dbg(dev, "adding match %d for: %pOF\n", i++, =
node);
> +                       component_match_add_release(dev, &match, release_=
of,
> +                                                   compare_of,
> +                                                   of_node_get(node));
>                 }
> +       }
>
> -               mtk_mdp_register_component(mdp, comp);
> +       /*
> +        * Create a component for myself so that clocks can be toggled in
> +        * clock_on().
> +        */
> +       ret =3D mtk_mdp_comp_init(&mdp->comp_self, dev);
> +       if (ret) {
> +               dev_err(dev, "Failed to initialize component\n");
> +               goto err_comp;
>         }
>
>         mdp->job_wq =3D create_singlethread_workqueue(MTK_MDP_MODULE_NAME=
);
> @@ -203,18 +265,12 @@ static int mtk_mdp_probe(struct platform_device *pd=
ev)
>                 goto err_dev_register;
>         }
>
> -       ret =3D mtk_mdp_register_m2m_device(mdp);
> -       if (ret) {
> -               v4l2_err(&mdp->v4l2_dev, "Failed to init mem2mem device\n=
");
> -               goto err_m2m_register;
> -       }
> -
>         mdp->vpu_dev =3D vpu_get_plat_device(pdev);
>         ret =3D vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, =
mdp,
>                                   VPU_RST_MDP);
>         if (ret) {
>                 dev_err(&pdev->dev, "Failed to register reset handler\n")=
;
> -               goto err_m2m_register;
> +               goto err_wdt_reg;
>         }
>
>         platform_set_drvdata(pdev, mdp);
> @@ -222,15 +278,25 @@ static int mtk_mdp_probe(struct platform_device *pd=
ev)
>         ret =3D vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(=
32));
>         if (ret) {
>                 dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n=
");
> -               goto err_m2m_register;
> +               goto err_set_max_seg_size;
> +       }
> +
> +       ret =3D component_master_add_with_match(dev, &mtk_mdp_com_ops, ma=
tch);
> +       if (ret) {
> +               dev_err(dev, "Component master add failed\n");
> +               goto err_component_master_add;
>         }
>
> -       pm_runtime_enable(dev);
>         dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
>
>         return 0;
>
> -err_m2m_register:
> +err_component_master_add:
> +       vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> +
> +err_set_max_seg_size:
> +
> +err_wdt_reg:
>         v4l2_device_unregister(&mdp->v4l2_dev);
>
>  err_dev_register:
> @@ -242,11 +308,6 @@ static int mtk_mdp_probe(struct platform_device *pde=
v)
>  err_alloc_job_wq:
>
>  err_comp:
> -       list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) =
{
> -               mtk_mdp_unregister_component(mdp, comp);
> -               mtk_mdp_comp_deinit(dev, comp);
> -       }
> -
>         dev_dbg(dev, "err %d\n", ret);
>         return ret;
>  }
> @@ -254,11 +315,10 @@ static int mtk_mdp_probe(struct platform_device *pd=
ev)
>  static int mtk_mdp_remove(struct platform_device *pdev)
>  {
>         struct mtk_mdp_dev *mdp =3D platform_get_drvdata(pdev);
> -       struct mtk_mdp_comp *comp, *comp_temp;
>
> -       pm_runtime_disable(&pdev->dev);
> +       component_master_del(&pdev->dev, &mtk_mdp_com_ops);
> +
>         vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> -       mtk_mdp_unregister_m2m_device(mdp);
>         v4l2_device_unregister(&mdp->v4l2_dev);
>
>         flush_workqueue(mdp->wdt_wq);
> @@ -267,10 +327,8 @@ static int mtk_mdp_remove(struct platform_device *pd=
ev)
>         flush_workqueue(mdp->job_wq);
>         destroy_workqueue(mdp->job_wq);
>
> -       list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) =
{
> -               mtk_mdp_unregister_component(mdp, comp);
> -               mtk_mdp_comp_deinit(&pdev->dev, comp);
> -       }
> +       if (!list_empty(&mdp->comp_list))
> +               dev_warn(&pdev->dev, "not all components removed\n");
>
>         dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
>         return 0;
> @@ -323,7 +381,25 @@ static struct platform_driver mtk_mdp_driver =3D {
>         }
>  };
>
> -module_platform_driver(mtk_mdp_driver);
> +static struct platform_driver * const mtk_mdp_drivers[] =3D {
> +       &mtk_mdp_driver,
> +       &mtk_mdp_component_driver,
> +};
> +
> +static int __init mtk_mdp_init(void)
> +{
> +       return platform_register_drivers(mtk_mdp_drivers,
> +                                        ARRAY_SIZE(mtk_mdp_drivers));
> +}
> +
> +static void __exit mtk_mdp_exit(void)
> +{
> +       platform_unregister_drivers(mtk_mdp_drivers,
> +                                   ARRAY_SIZE(mtk_mdp_drivers));
> +}
> +
> +module_init(mtk_mdp_init);
> +module_exit(mtk_mdp_exit);
>
>  MODULE_AUTHOR("Houlong Wei <houlong.wei@mediatek.com>");
>  MODULE_DESCRIPTION("Mediatek image processor driver");
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/medi=
a/platform/mtk-mdp/mtk_mdp_core.h
> index a6e6dc36307b..8a52539b15d4 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> @@ -155,6 +155,7 @@ struct mtk_mdp_dev {
>         struct mtk_mdp_variant          *variant;
>         u16                             id;
>         struct list_head                comp_list;
> +       struct mtk_mdp_comp             comp_self;
>         struct v4l2_m2m_dev             *m2m_dev;
>         struct list_head                ctx_list;
>         struct video_device             *vdev;
> --
> 2.32.0.554.ge1b32706d8-goog
>
