Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274E93C5AA9
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 13:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238532AbhGLKPD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 06:15:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51718 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234631AbhGLKO6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 06:14:58 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id BD3991F4210D
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v5 2/8] mtk-mdp: use pm_runtime in MDP component driver
To:     Eizan Miyamoto <eizan@chromium.org>, linux-kernel@vger.kernel.org
Cc:     wenst@chromium.org, chunkuang.hu@kernel.org, yong.wu@mediatek.com,
        houlong.wei@mediatek.com,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20210709022324.1607884-1-eizan@chromium.org>
 <20210709122040.v5.2.I909f5375d930f5d0cc877128e30e2a67078b674c@changeid>
Message-ID: <7159c4e3-1059-7813-30a3-51027488442b@collabora.com>
Date:   Mon, 12 Jul 2021 12:12:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709122040.v5.2.I909f5375d930f5d0cc877128e30e2a67078b674c@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan,

Thank you for your patch.

On 9/7/21 4:23, Eizan Miyamoto wrote:
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
> (no changes since v1)
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 20 ++++++++++++++-----
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  8 +++++---
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 ++----
>  3 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index aec1cb5c4261..8b6158379f41 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -14,6 +14,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <soc/mediatek/smi.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "mtk_mdp_comp.h"
>  #include "mtk_mdp_core.h"
> @@ -52,7 +53,7 @@ static const struct of_device_id mtk_mdp_comp_driver_dt_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mtk_mdp_comp_driver_dt_match);
>  
> -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
> +void mtk_mdp_comp_clock_on(struct mtk_mdp_comp *comp)
>  {
>  	int i, err;
>  
> @@ -63,18 +64,22 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>  				"failed to get larb, err %d.\n", err);
>  	}
>  
> +	err = pm_runtime_get_sync(comp->dev);
> +	if (err < 0)

The pm_runtime_get_sync increases the device usage counter so, if it fails you
should decrease the usage with put.

Ok I see that put is called in off. I don't really like how the error handling
of all this is done, but also I think is not your problem, it was also a problem
before this patch.

> +		dev_err(comp->dev,
> +			"failed to runtime get, err %d.\n",
> +			err);
> +

Printing errors and not returning errors is bad design for me. But this is a
void function, so ...

>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		if (IS_ERR(comp->clk[i]))
>  			continue;
>  		err = clk_prepare_enable(comp->clk[i]);
>  		if (err)
> -			dev_err(dev,
> -				"failed to enable clock, err %d. i:%d\n",
> -				err, i);
> +			dev_err(comp->dev, "failed to enable clock, err %d. i:%d\n", err, i);


I think that if clock fails to be enabled it will already print an error, so
this print is duplicated.

>  	}
>  }
>  
> -void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
> +void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>  {
>  	int i;
>  
> @@ -86,6 +91,8 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
>  
>  	if (comp->larb_dev)
>  		mtk_smi_larb_put(comp->larb_dev);
> +
> +	pm_runtime_put_sync(comp->dev);
>  }
>  
>  static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
> @@ -95,6 +102,7 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>  	struct mtk_mdp_dev *mdp = data;
>  
>  	mtk_mdp_register_component(mdp, comp);
> +	pm_runtime_enable(dev);
>  
>  	return 0;
>  }
> @@ -105,6 +113,7 @@ static void mtk_mdp_comp_unbind(struct device *dev, struct device *master,
>  	struct mtk_mdp_dev *mdp = data;
>  	struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
>  
> +	pm_runtime_disable(dev);
>  	mtk_mdp_unregister_component(mdp, comp);
>  }
>  
> @@ -124,6 +133,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>  		 (enum mtk_mdp_comp_type)of_device_get_match_data(dev);
>  
>  	INIT_LIST_HEAD(&comp->node);
> +	comp->dev = dev;
>  
>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		comp->clk[i] = of_clk_get(node, i);
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index b5a18fe567aa..5e2ee94a1b37 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -12,17 +12,19 @@
>   * @node:	list node to track sibing MDP components
>   * @clk:	clocks required for component
>   * @larb_dev:	SMI device required for component
> + * @dev:	component's device
>   */
>  struct mtk_mdp_comp {
>  	struct list_head	node;
>  	struct clk		*clk[2];
> -	struct device		*larb_dev;
> +	struct device           *larb_dev;

This change is unrelated to this patch.

> +	struct device		*dev;
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
> index aca236dbd348..78c40a61df1d 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -52,20 +52,18 @@ MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
>  
>  static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>  {
> -	struct device *dev = &mdp->pdev->dev;
>  	struct mtk_mdp_comp *comp_node;
>  
>  	list_for_each_entry(comp_node, &mdp->comp_list, node)
> -		mtk_mdp_comp_clock_on(dev, comp_node);
> +		mtk_mdp_comp_clock_on(comp_node);
>  }
>  
>  static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
>  {
> -	struct device *dev = &mdp->pdev->dev;
>  	struct mtk_mdp_comp *comp_node;
>  
>  	list_for_each_entry(comp_node, &mdp->comp_list, node)
> -		mtk_mdp_comp_clock_off(dev, comp_node);
> +		mtk_mdp_comp_clock_off(comp_node);
>  }
>  
>  static void mtk_mdp_wdt_worker(struct work_struct *work)
> 
