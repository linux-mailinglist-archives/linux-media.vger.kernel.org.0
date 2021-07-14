Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BC53C800F
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 10:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238539AbhGNIcG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 04:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhGNIcF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 04:32:05 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F30C06175F;
        Wed, 14 Jul 2021 01:29:14 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623] (unknown [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3997C1F42822;
        Wed, 14 Jul 2021 09:29:12 +0100 (BST)
Subject: Re: [PATCH v6 05/11] media: mtk-mdp: Get rid of mtk_smi_larb_get/put
To:     Yong Wu <yong.wu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        David Airlie <airlied@linux.ie>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Evan Green <evgreen@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Will Deacon <will.deacon@arm.com>,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
        ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
        acourbot@chromium.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Eizan Miyamoto <eizan@chromium.org>,
        anthony.huang@mediatek.com,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-6-yong.wu@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <f8d2ecfa-d0e0-87ed-429a-cb2dfd4e0745@collabora.com>
Date:   Wed, 14 Jul 2021 10:29:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714025626.5528-6-yong.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 14.07.21 04:56, Yong Wu wrote:
> MediaTek IOMMU has already added the device_link between the consumer
> and smi-larb device. If the mdp device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> CC: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
> CC: Houlong Wei <houlong.wei@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 46 +------------------
>   drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
>   drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
>   3 files changed, 1 insertion(+), 48 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index de2d425efdd1..5e0ea83a9f7f 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -13,7 +13,6 @@
>   #include <linux/of.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_platform.h>
> -#include <soc/mediatek/smi.h>
>   #include <linux/pm_runtime.h>
>   
>   #include "mtk_mdp_comp.h"
> @@ -57,13 +56,6 @@ int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
>   {
>   	int status, err;
>   
> -	if (comp->larb_dev) {
> -		err = mtk_smi_larb_get(comp->larb_dev);
> -		if (err)
> -			dev_err(comp->dev,
> -				"failed to get larb, err %d.\n", err);
> -	}
> -
>   	err = pm_runtime_get_sync(comp->dev);
>   	if (err < 0) {
>   		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);
> @@ -146,9 +138,6 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
>   			continue;
>   		clk_disable_unprepare(comp->clk[i]);
>   	}
> -
> -	if (comp->larb_dev)
> -		mtk_smi_larb_put(comp->larb_dev);
>   }
>   
>   /*
> @@ -236,9 +225,6 @@ static const struct component_ops mtk_mdp_component_ops = {
>   
>   int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>   {
> -	struct device_node *larb_node;
> -	struct platform_device *larb_pdev;
> -	int ret;
>   	int i;
>   	struct device_node *node = dev->of_node;
>   	enum mtk_mdp_comp_type comp_type =
> @@ -252,8 +238,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>   		if (IS_ERR(comp->clk[i])) {
>   			if (PTR_ERR(comp->clk[i]) != -EPROBE_DEFER)
>   				dev_err(dev, "Failed to get clock\n");
> -			ret = PTR_ERR(comp->clk[i]);
> -			goto err;
> +			return PTR_ERR(comp->clk[i]);
>   		}
>   
>   		/* Only RDMA needs two clocks */
> @@ -261,36 +246,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>   			break;
>   	}
>   
> -	/* Only DMA capable components need the LARB property */
> -	comp->larb_dev = NULL;
> -	if (comp_type != MTK_MDP_RDMA &&
> -	    comp_type != MTK_MDP_WDMA &&
> -	    comp_type != MTK_MDP_WROT)
> -		return 0;
> -
> -	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
> -	if (!larb_node) {
> -		dev_err(dev,
> -			"Missing mediadek,larb phandle in %pOF node\n", node);
> -		ret = -EINVAL;
> -		goto err;
> -	}
> -
> -	larb_pdev = of_find_device_by_node(larb_node);
> -	if (!larb_pdev) {
> -		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
> -		of_node_put(larb_node);
> -		ret = -EPROBE_DEFER;
> -		goto err;
> -	}
> -	of_node_put(larb_node);
> -
> -	comp->larb_dev = &larb_pdev->dev;
> -
>   	return 0;
> -
> -err:
> -	return ret;
>   }
>   
>   static int mtk_mdp_comp_probe(struct platform_device *pdev)
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 5201c47f7baa..2bd229cc7eae 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -11,13 +11,11 @@
>    * struct mtk_mdp_comp - the MDP's function component data
>    * @node:	list node to track sibing MDP components
>    * @clk:	clocks required for component
> - * @larb_dev:	SMI device required for component
>    * @dev:	component's device
>    */
>   struct mtk_mdp_comp {
>   	struct list_head	node;
>   	struct clk		*clk[2];
> -	struct device           *larb_dev;
>   	struct device		*dev;
>   };
>   
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index e1fb39231248..be7d35b3e3ff 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -18,7 +18,6 @@
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/workqueue.h>
> -#include <soc/mediatek/smi.h>
>   
>   #include "mtk_mdp_comp.h"
>   #include "mtk_mdp_core.h"
> 
