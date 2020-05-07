Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED081C87B8
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 13:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgEGLLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 07:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgEGLL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 07:11:29 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57ED2C05BD09
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 04:11:28 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id k81so5475102qke.5
        for <linux-media@vger.kernel.org>; Thu, 07 May 2020 04:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9+z8Vig6tu/4iCmN680okp/HEFrigNrXuRs6YGZcIcQ=;
        b=jGFqcvkLIVDhPVkhaawWw3ebeUwyi8xCpUAQ8aVio9xu3Nq+ggSNWuYCtN1ge7Sys2
         MqBb2eQbmXyYlaqd2Xx4EzzPyBT6NCNJ5VPRKwNTp7l5yUth38JFvYDbxziCj01nN4Qu
         yXDJli4c+8Szft4S6BTxoWgzRKMXmye+L9qzXDOWiO0Bh0NjB0b2HCugCy5Wb1bP3Qdq
         sz9s/KazAfwPSKyIcxhrwu2MSOwtLXtGbCw9Dn7p1/IgmnZOic7MWkRI7jnzn57hXd7p
         D99ZPsElGgX4ga30AEr/PZ/YqSFgw32zRl53gsf+6s9sk8aTDlix4A7p6nhBKMqjCKza
         5U3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9+z8Vig6tu/4iCmN680okp/HEFrigNrXuRs6YGZcIcQ=;
        b=cOqLtPesbbaEbYlbTxUmWmAqDLE1OCKvnHbbjbg+akDbZ2TPf+d+dWrRFwshXKN43b
         n7QxtHcloupRyZ0AZ62Df4guTq4x4ZHpqIcKAYskPDmA8wz3iJN6YuSoxDg1OCYPThDL
         xehxTubqga/8FdHkAHdeFYsxhRKk0qObFWoC3HzjgbJ+ZvL0lMzuOfIITVvmXtVdaGlb
         NVm/wWk1zjZaWJNYf4FtUOC6lDrcv/Lik9Y8BCVph0LjGYXllbAczBo5lblGNu4LwhZO
         5MQO/p222E1CKGlP5o8fycPafdVgVD8SZSu71Lq1kau2l9AMB7wwMBbrSiPyW/s3ns1/
         ni+g==
X-Gm-Message-State: AGi0PuYno48BWHgzrviV3qpR2y4LUzweIkkAQgZkMs1mNKhiQkibvyh5
        NV7vuvetvPuQZbSznlAal9C9imZe40kGH/TZQumcIg==
X-Google-Smtp-Source: APiQypIpFZDUmJWZDLpif9MrqiW+gmDvX1YERT6QVCSL1p0w+LxrGoAFlKWhFaJM2Cg0+Sg71XI3eBVza513jDMWx64=
X-Received: by 2002:a05:620a:3c5:: with SMTP id r5mr13996137qkm.138.1588849886756;
 Thu, 07 May 2020 04:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200506084039.249977-1-eizan@chromium.org> <20200506184018.v2.1.I27dac0775ba64deff6a91837f39bfba83dccdf84@changeid>
 <CAFqH_513GOtvB8Ydfe_Z3wfoLMgrJ70E1z4sZ6hOv_7L3fRn3g@mail.gmail.com>
In-Reply-To: <CAFqH_513GOtvB8Ydfe_Z3wfoLMgrJ70E1z4sZ6hOv_7L3fRn3g@mail.gmail.com>
From:   Eizan Miyamoto <eizan@google.com>
Date:   Thu, 7 May 2020 21:11:14 +1000
Message-ID: <CAOak1e9os2RxEtsLkkFMfCpOxvmHg2B0UB+1cNt2nL=5CE8Mmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] [media] mtk-mdp: add driver to probe mdp components
To:     Enric Balletbo Serra <eballetbo@gmail.com>
Cc:     Eizan Miyamoto <eizan@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
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

On Thu, May 7, 2020 at 2:54 AM Enric Balletbo Serra <eballetbo@gmail.com> wrote:
>
> Hi Eizan,
>
> Thank you for the patch.
>
> Missatge de Eizan Miyamoto <eizan@chromium.org> del dia dc., 6 de maig
> 2020 a les 10:41:
> >
> > Broadly, this patch (1) adds a driver for various MTK MDP components to
> > go alongside the main MTK MDP driver, and (2) hooks them all together
> > using the component framework.
> >
> > (1) Up until now, the MTK MDP driver controls 8 devices in the device
> > tree on its own. When running tests for the hardware video decoder, we
> > found that the iommus and LARBs were not being properly configured. To
> > configure them, a driver for each be added to mtk_mdp_comp so that
> > mtk_iommu_add_device() can (eventually) be called from dma_configure()
> > inside really_probe().
> >
> > (2) The integration into the component framework allows us to defer the
> > registration with the v4l2 subsystem until all the MDP-related devices
> > have been probed, so that the relevant device node does not become
> > available until initialization of all the components is complete.
> >
> > Some notes about how the component framework has been integrated:
> >
> > - The driver for the rdma0 component serves double duty as the "master"
> >   (aggregate) driver as well as a component driver. This is a non-ideal
> >   compromise until a better solution is developed. This device is
> >   differentiated from the rest by checking for a "mediatek,vpu" property
> >   in the device node.
> >
> > - The list of mdp components remains hard-coded as mtk_mdp_comp_dt_ids[]
> >   in mtk_mdp_core.c, and as mtk_mdp_comp_driver_dt_match[] in
> >   mtk_mdp_comp.c. This unfortunate duplication of information is
> >   addressed in a following patch in this series.
> >
> > - The component driver calls component_add() for each device that is
> >   probed.
> >
> > - In mtk_mdp_probe (the "master" device), we scan the device tree for
> >   any matching nodes against mtk_mdp_comp_dt_ids, and add component
> >   matches for them. The match criteria is a matching device node
> >   pointer.
> >
> > - When the set of components devices that have been probed corresponds
> >   with the list that is generated by the "master", the callback to
> >   mtk_mdp_master_bind() is made, which then calls the component bind
> >   functions.
> >
> > - Inside mtk_mdp_master_bind(), once all the component bind functions
> >   have been called, we can then register our device to the v4l2
> >   subsystem.
> >
> > - The call to pm_runtime_enable() in the master device is called after
> >   all the components have been registered by their bind() functions
> >   called by mtk_mtp_master_bind(). As a result, the list of components
> >   will not change while power management callbacks mtk_mdp_suspend()/
> >   resume() are accessing the list of components.
> >
> > Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> > ---
> >
> > Changes in v2: None
> >
>
> Not really true :-)
>
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 150 +++++++++++++--
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  26 +--
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 176 +++++++++++++-----
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   1 +
> >  4 files changed, 263 insertions(+), 90 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > index 362fff924aef..5b4d482df778 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> > @@ -5,14 +5,53 @@
> >   */
> >
> >  #include <linux/clk.h>
> > +#include <linux/component.h>
> >  #include <linux/device.h>
> > -#include <linux/of.h>
> > +#include <linux/module.h>
> >  #include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> >  #include <linux/of_platform.h>
> >  #include <soc/mediatek/smi.h>
> > +#include <linux/platform_device.h>
> >
> >  #include "mtk_mdp_comp.h"
> > -
> > +#include "mtk_mdp_core.h"
> > +
> > +/**
> > + * enum mtk_mdp_comp_type - the MDP component
> > + * @MTK_MDP_RDMA:              Read DMA
> > + * @MTK_MDP_RSZ:               Reszer
> > + * @MTK_MDP_WDMA:              Write DMA
> > + * @MTK_MDP_WROT:              Write DMA with rotation
> > + * @MTK_MDP_COMP_TYPE_MAX:     Placeholder for num elems in this enum
> > + */
> > +enum mtk_mdp_comp_type {
> > +       MTK_MDP_RDMA,
> > +       MTK_MDP_RSZ,
> > +       MTK_MDP_WDMA,
> > +       MTK_MDP_WROT,
> > +       MTK_MDP_COMP_TYPE_MAX,
> > +};
> > +
> > +static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
> > +       {
> > +               .compatible = "mediatek,mt8173-mdp-rdma",
> > +               .data = (void *)MTK_MDP_RDMA
> > +       }, {
> > +               .compatible = "mediatek,mt8173-mdp-rsz",
> > +               .data = (void *)MTK_MDP_RSZ
> > +       }, {
> > +               .compatible = "mediatek,mt8173-mdp-wdma",
> > +               .data = (void *)MTK_MDP_WDMA
> > +       }, {
> > +               .compatible = "mediatek,mt8173-mdp-wrot",
> > +               .data = (void *)MTK_MDP_WROT
> > +       },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
> >
> >  void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
> >  {
> > @@ -20,10 +59,14 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
> >
> >         if (comp->larb_dev) {
> >                 err = mtk_smi_larb_get(comp->larb_dev);
> > -               if (err)
> > +               if (err) {
> > +                       enum mtk_mdp_comp_type comp_type =
> > +                               (enum mtk_mdp_comp_type)
> > +                               of_device_get_match_data(dev);
> >                         dev_err(dev,
> >                                 "failed to get larb, err %d. type:%d\n",
> > -                               err, comp->type);
> > +                               err, comp_type);
> > +               }
> >         }
> >
> >         for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
> > @@ -32,8 +75,8 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
> >                 err = clk_prepare_enable(comp->clk[i]);
> >                 if (err)
> >                         dev_err(dev,
> > -                       "failed to enable clock, err %d. type:%d i:%d\n",
> > -                               err, comp->type, i);
> > +                               "failed to enable clock, err %d. i:%d\n",
> > +                               err, i);
> >         }
> >  }
> >
> > @@ -51,16 +94,41 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
> >                 mtk_smi_larb_put(comp->larb_dev);
> >  }
> >
> > -int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
> > -                     struct mtk_mdp_comp *comp,
> > -                     enum mtk_mdp_comp_type comp_type)
> > +static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
> > +                       void *data)
> > +{
> > +       struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
> > +       struct mtk_mdp_dev *mdp = data;
> > +
> > +       mtk_mdp_register_component(mdp, comp);
> > +
> > +       return 0;
> > +}
> > +
> > +static void mtk_mdp_comp_unbind(struct device *dev, struct device *master,
> > +                          void *data)
> > +{
> > +       struct mtk_mdp_dev *mdp = data;
> > +       struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
> > +
> > +       mtk_mdp_unregister_component(mdp, comp);
> > +}
> > +
> > +static const struct component_ops mtk_mdp_component_ops = {
> > +       .bind   = mtk_mdp_comp_bind,
> > +       .unbind = mtk_mdp_comp_unbind,
> > +};
> > +
> > +int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
> >  {
> >         struct device_node *larb_node;
> >         struct platform_device *larb_pdev;
> >         int i;
> > +       struct device_node *node = dev->of_node;
> > +       enum mtk_mdp_comp_type comp_type =
> > +                (enum mtk_mdp_comp_type)of_device_get_match_data(dev);
> >
> > -       comp->dev_node = of_node_get(node);
> > -       comp->type = comp_type;
> > +       INIT_LIST_HEAD(&comp->node);
> >
> >         for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
> >                 comp->clk[i] = of_clk_get(node, i);
> > @@ -72,15 +140,15 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
> >                 }
> >
> >                 /* Only RDMA needs two clocks */
> > -               if (comp->type != MTK_MDP_RDMA)
> > +               if (comp_type != MTK_MDP_RDMA)
> >                         break;
> >         }
> >
> >         /* Only DMA capable components need the LARB property */
> >         comp->larb_dev = NULL;
> > -       if (comp->type != MTK_MDP_RDMA &&
> > -           comp->type != MTK_MDP_WDMA &&
> > -           comp->type != MTK_MDP_WROT)
> > +       if (comp_type != MTK_MDP_RDMA &&
> > +           comp_type != MTK_MDP_WDMA &&
> > +           comp_type != MTK_MDP_WROT)
> >                 return 0;
> >
> >         larb_node = of_parse_phandle(node, "mediatek,larb", 0);
> > @@ -103,7 +171,55 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
> >         return 0;
> >  }
> >
> > -void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp)
> > +static int mtk_mdp_comp_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct device_node *vpu_node;
> > +       int status;
> > +       struct mtk_mdp_comp *comp;
> > +
> > +       vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> > +       if (vpu_node) {
> > +               of_node_put(vpu_node);
> > +               /*
> > +                * The device tree node with a mediatek,vpu property is deemed
> > +                * the MDP "master" device, we don't want to add a component
> > +                * for it in this function because the initialization for the
> > +                * master is done elsewhere.
> > +                */
> > +               dev_info(dev, "vpu node found, not probing\n");
>
> Could you explain a bit more this? When this can happen? I am
> wondering if you are trying to solve a non-existing problem upstream.

That line of code will be executed when probing for the rdma@14001000
device, for which the probe function in mtk_mdp_core.c will also be run
because there is a second '.compatible' string ("mediatek,mt8173-mdp") in
that device node.

In the probe function in mtk_mdp_core.c, a component is initialized, which
is component_add()ed separately by the master_bind function and so we don't
need to go through the component creation/initialization/addition done
here.

I think, ideally, the master component wouldn't also be responsible for
rdma@14001000 and we would split apart the device node. I'd like to propose
that we work on that in a follow-up change while we make incremental
progress. (There are also other changes we'd like to propose in the
meantime, like not hard-coding the components that the master binds
together into the driver but instead make it possible to specify that in
the device tree itself).

>
> > +               return -ENODEV;
> > +       }
> > +
> > +       comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
> > +       if (!comp)
> > +               return -ENOMEM;
> > +
> > +       status = mtk_mdp_comp_init(comp, dev);
> > +       if (status) {
> > +               dev_err(dev, "Failed to initialize component: %d\n", status);
> > +               return status;
> > +       }
> > +
> > +       dev_set_drvdata(dev, comp);
> > +
> > +       return component_add(dev, &mtk_mdp_component_ops);
> > +}
> > +
> > +static int mtk_mdp_comp_remove(struct platform_device *pdev)
> >  {
> > -       of_node_put(comp->dev_node);
> > +       struct device *dev = &pdev->dev;
> > +
> > +       component_del(dev, &mtk_mdp_component_ops);
> > +       return 0;
> >  }
> > +
> > +struct platform_driver mtk_mdp_component_driver = {
> > +       .probe          = mtk_mdp_comp_probe,
> > +       .remove         = mtk_mdp_comp_remove,
> > +       .driver         = {
> > +               .name   = "mediatek-mdp-comp",
> > +               .owner  = THIS_MODULE,
> > +               .of_match_table = mtk_mdp_comp_driver_dt_match,
> > +       },
> > +};
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> > index 1bf0242cce46..b5a18fe567aa 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> > @@ -7,43 +7,23 @@
> >  #ifndef __MTK_MDP_COMP_H__
> >  #define __MTK_MDP_COMP_H__
> >
> > -/**
> > - * enum mtk_mdp_comp_type - the MDP component
> > - * @MTK_MDP_RDMA:      Read DMA
> > - * @MTK_MDP_RSZ:       Riszer
> > - * @MTK_MDP_WDMA:      Write DMA
> > - * @MTK_MDP_WROT:      Write DMA with rotation
> > - */
> > -enum mtk_mdp_comp_type {
> > -       MTK_MDP_RDMA,
> > -       MTK_MDP_RSZ,
> > -       MTK_MDP_WDMA,
> > -       MTK_MDP_WROT,
> > -       MTK_MDP_COMP_TYPE_MAX,
> > -};
> > -
> >  /**
> >   * struct mtk_mdp_comp - the MDP's function component data
> >   * @node:      list node to track sibing MDP components
> > - * @dev_node:  component device node
> >   * @clk:       clocks required for component
> >   * @larb_dev:  SMI device required for component
> > - * @type:      component type
> >   */
> >  struct mtk_mdp_comp {
> >         struct list_head        node;
> > -       struct device_node      *dev_node;
> >         struct clk              *clk[2];
> >         struct device           *larb_dev;
> > -       enum mtk_mdp_comp_type  type;
> >  };
> >
> > -int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
> > -                     struct mtk_mdp_comp *comp,
> > -                     enum mtk_mdp_comp_type comp_type);
> > -void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp);
> > +int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev);
> > +
> >  void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
> >  void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
> >
> > +extern struct platform_driver mtk_mdp_component_driver;
> >
> >  #endif /* __MTK_MDP_COMP_H__ */
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > index acbc5a01ae4c..539a7942e3cb 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > @@ -6,6 +6,7 @@
> >   */
> >
> >  #include <linux/clk.h>
> > +#include <linux/component.h>
> >  #include <linux/device.h>
> >  #include <linux/errno.h>
> >  #include <linux/interrupt.h>
> > @@ -19,6 +20,7 @@
> >  #include <linux/workqueue.h>
> >  #include <soc/mediatek/smi.h>
> >
> > +#include "mtk_mdp_comp.h"
> >  #include "mtk_mdp_core.h"
> >  #include "mtk_mdp_m2m.h"
> >  #include "mtk_vpu.h"
> > @@ -32,16 +34,12 @@ module_param(mtk_mdp_dbg_level, int, 0644);
> >  static const struct of_device_id mtk_mdp_comp_dt_ids[] = {
> >         {
> >                 .compatible = "mediatek,mt8173-mdp-rdma",
> > -               .data = (void *)MTK_MDP_RDMA
> >         }, {
> >                 .compatible = "mediatek,mt8173-mdp-rsz",
> > -               .data = (void *)MTK_MDP_RSZ
> >         }, {
> >                 .compatible = "mediatek,mt8173-mdp-wdma",
> > -               .data = (void *)MTK_MDP_WDMA
> >         }, {
> >                 .compatible = "mediatek,mt8173-mdp-wrot",
> > -               .data = (void *)MTK_MDP_WROT
> >         },
> >         { },
> >  };
> > @@ -91,6 +89,64 @@ static void mtk_mdp_reset_handler(void *priv)
> >         queue_work(mdp->wdt_wq, &mdp->wdt_work);
> >  }
> >
> > +static int compare_of(struct device *dev, void *data)
> > +{
> > +       return dev->of_node == data;
> > +}
> > +
> > +static void release_of(struct device *dev, void *data)
> > +{
> > +       of_node_put(data);
> > +}
> > +
> > +static int mtk_mdp_master_bind(struct device *dev)
> > +{
> > +       int status;
> > +       struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
> > +
> > +       mtk_mdp_register_component(mdp, &mdp->comp_self);
> > +
> > +       status = component_bind_all(dev, mdp);
> > +       if (status) {
> > +               dev_err(dev, "Failed to bind all components: %d\n", status);
> > +               goto err_component_bind_all;
> > +       }
> > +
> > +       status = mtk_mdp_register_m2m_device(mdp);
> > +       if (status) {
> > +               dev_err(dev, "Failed to register m2m device: %d\n", status);
> > +               v4l2_err(&mdp->v4l2_dev, "Failed to init mem2mem device\n");
> > +               goto err_mtk_mdp_register_m2m_device;
> > +       }
> > +
> > +       pm_runtime_enable(dev);
> > +
> > +       return 0;
> > +
> > +err_mtk_mdp_register_m2m_device:
> > +       component_unbind_all(dev, mdp);
> > +
> > +err_component_bind_all:
> > +       mtk_mdp_unregister_component(mdp, &mdp->comp_self);
> > +
> > +       return status;
> > +}
> > +
> > +static void mtk_mdp_master_unbind(struct device *dev)
> > +{
> > +       struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
> > +
> > +       pm_runtime_disable(dev);
> > +       mtk_mdp_unregister_m2m_device(mdp);
> > +       component_unbind_all(dev, mdp);
> > +       mtk_mdp_unregister_component(mdp, &mdp->comp_self);
> > +}
> > +
> > +static const struct component_master_ops mtk_mdp_com_ops = {
> > +       .bind           = mtk_mdp_master_bind,
> > +       .unbind         = mtk_mdp_master_unbind,
> > +};
> > +
> >  void mtk_mdp_register_component(struct mtk_mdp_dev *mdp,
> >                                 struct mtk_mdp_comp *comp)
> >  {
> > @@ -108,8 +164,8 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >         struct mtk_mdp_dev *mdp;
> >         struct device *dev = &pdev->dev;
> >         struct device_node *node, *parent;
> > -       struct mtk_mdp_comp *comp, *comp_temp;
> > -       int ret = 0;
> > +       int i, ret = 0;
> > +       struct component_match *match = NULL;
> >
> >         mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
> >         if (!mdp)
> > @@ -134,37 +190,43 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >         }
> >
> >         /* Iterate over sibling MDP function blocks */
> > +       i = 0;
> >         for_each_child_of_node(parent, node) {
> > -               const struct of_device_id *of_id;
> > -               enum mtk_mdp_comp_type comp_type;
> > +               struct platform_device *pdev;
> >
> > -               of_id = of_match_node(mtk_mdp_comp_dt_ids, node);
> > -               if (!of_id)
> > +               if (!of_match_node(mtk_mdp_comp_dt_ids, node))
> >                         continue;
> >
> > -               if (!of_device_is_available(node)) {
> > -                       dev_err(dev, "Skipping disabled component %pOF\n",
> > -                               node);
> > +               if (!of_device_is_available(node))
> >                         continue;
> > -               }
> > -
> > -               comp_type = (enum mtk_mdp_comp_type)of_id->data;
> >
> > -
> > -               comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
> > -               if (!comp) {
> > -                       ret = -ENOMEM;
> > -                       of_node_put(node);
> > -                       goto err_comp;
> > +               pdev = of_find_device_by_node(node);
> > +               if (!pdev) {
> > +                       dev_warn(dev, "Unable to find comp device %s\n",
> > +                                node->full_name);
> > +                       continue;
> >                 }
> >
> > -               ret = mtk_mdp_comp_init(dev, node, comp, comp_type);
> > -               if (ret) {
> > -                       of_node_put(node);
> > -                       goto err_comp;
> > +               /*
> > +                * Do not add add a match for my own (rdma0) device node.
> > +                * I will be managing it directly instead using comp_self.
> > +                */
> > +               if (&pdev->dev != dev) {
> > +                       dev_dbg(dev, "adding match %d for: %pOF\n", i++, node);
> > +                       component_match_add_release(dev, &match, release_of,
> > +                                                   compare_of,
> > +                                                   of_node_get(node));
> >                 }
> > +       }
> >
> > -               mtk_mdp_register_component(mdp, comp);
> > +       /*
> > +        * Create a component for myself so that clocks can be toggled in
> > +        * clock_on().
> > +        */
> > +       ret = mtk_mdp_comp_init(&mdp->comp_self, dev);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to initialize component\n");
> > +               goto err_comp;
> >         }
> >
> >         mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
> > @@ -189,18 +251,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >                 goto err_dev_register;
> >         }
> >
> > -       ret = mtk_mdp_register_m2m_device(mdp);
> > -       if (ret) {
> > -               v4l2_err(&mdp->v4l2_dev, "Failed to init mem2mem device\n");
> > -               goto err_m2m_register;
> > -       }
> > -
> >         mdp->vpu_dev = vpu_get_plat_device(pdev);
> >         ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
> >                                   VPU_RST_MDP);
> >         if (ret) {
> >                 dev_err(&pdev->dev, "Failed to register reset handler\n");
> > -               goto err_m2m_register;
> > +               goto err_wdt_reg;
> >         }
> >
> >         platform_set_drvdata(pdev, mdp);
> > @@ -208,15 +264,25 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >         ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> >         if (ret) {
> >                 dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
> > -               goto err_m2m_register;
> > +               goto err_set_max_seg_size;
> > +       }
> > +
> > +       ret = component_master_add_with_match(dev, &mtk_mdp_com_ops, match);
> > +       if (ret) {
> > +               dev_err(dev, "Component master add failed\n");
> > +               goto err_component_master_add;
> >         }
> >
> > -       pm_runtime_enable(dev);
> >         dev_dbg(dev, "mdp-%d registered successfully\n", mdp->id);
> >
> >         return 0;
> >
> > -err_m2m_register:
> > +err_component_master_add:
> > +       vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> > +
> > +err_set_max_seg_size:
> > +
> > +err_wdt_reg:
>
> No need for two labels here, rework the above goto logic.
>
> >         v4l2_device_unregister(&mdp->v4l2_dev);
> >
> >  err_dev_register:
> > @@ -228,11 +294,6 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >  err_alloc_job_wq:
> >
> >  err_comp:
> > -       list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
> > -               mtk_mdp_unregister_component(mdp, comp);
> > -               mtk_mdp_comp_deinit(dev, comp);
> > -       }
> > -
> >         dev_dbg(dev, "err %d\n", ret);
> >         return ret;
> >  }
> > @@ -240,11 +301,10 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >  static int mtk_mdp_remove(struct platform_device *pdev)
> >  {
> >         struct mtk_mdp_dev *mdp = platform_get_drvdata(pdev);
> > -       struct mtk_mdp_comp *comp, *comp_temp;
> >
> > -       pm_runtime_disable(&pdev->dev);
> > +       component_master_del(&pdev->dev, &mtk_mdp_com_ops);
> > +
> >         vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> > -       mtk_mdp_unregister_m2m_device(mdp);
> >         v4l2_device_unregister(&mdp->v4l2_dev);
> >
> >         flush_workqueue(mdp->wdt_wq);
> > @@ -253,10 +313,8 @@ static int mtk_mdp_remove(struct platform_device *pdev)
> >         flush_workqueue(mdp->job_wq);
> >         destroy_workqueue(mdp->job_wq);
> >
> > -       list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
> > -               mtk_mdp_unregister_component(mdp, comp);
> > -               mtk_mdp_comp_deinit(&pdev->dev, comp);
> > -       }
> > +       if (!list_empty(&mdp->comp_list))
> > +               dev_err(&pdev->dev, "not all components removed\n");
> >
> >         dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
> >         return 0;
> > @@ -311,7 +369,25 @@ static struct platform_driver mtk_mdp_driver = {
> >         }
> >  };
> >
> > -module_platform_driver(mtk_mdp_driver);
> > +static struct platform_driver * const mtk_mdp_drivers[] = {
> > +       &mtk_mdp_driver,
> > +       &mtk_mdp_component_driver,
> > +};
> > +
> > +static int __init mtk_mdp_init(void)
> > +{
> > +       return platform_register_drivers(mtk_mdp_drivers,
> > +                                        ARRAY_SIZE(mtk_mdp_drivers));
> > +}
> > +
> > +static void __exit mtk_mdp_exit(void)
> > +{
> > +       platform_unregister_drivers(mtk_mdp_drivers,
> > +                                   ARRAY_SIZE(mtk_mdp_drivers));
> > +}
> > +
> > +module_init(mtk_mdp_init);
> > +module_exit(mtk_mdp_exit);
> >
> >  MODULE_AUTHOR("Houlong Wei <houlong.wei@mediatek.com>");
> >  MODULE_DESCRIPTION("Mediatek image processor driver");
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> > index a7da14b97077..230f531400ca 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.h
> > @@ -155,6 +155,7 @@ struct mtk_mdp_dev {
> >         struct mtk_mdp_variant          *variant;
> >         u16                             id;
> >         struct list_head                comp_list;
> > +       struct mtk_mdp_comp             comp_self;
> >         struct v4l2_m2m_dev             *m2m_dev;
> >         struct list_head                ctx_list;
> >         struct video_device             *vdev;
> > --
> > 2.26.2.526.g744177e7f7-goog
> >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
