Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F258D3E0DF0
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 08:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbhHEGG2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 02:06:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52484 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234461AbhHEGG1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 02:06:27 -0400
Received: from [IPv6:2a02:810a:880:f54:e5eb:348e:79df:e71f] (unknown [IPv6:2a02:810a:880:f54:e5eb:348e:79df:e71f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 532A91F40F00;
        Thu,  5 Aug 2021 07:06:11 +0100 (BST)
Subject: Re: [PATCH v6 1/9] mtk-mdp: propagate errors from clock_on
To:     Eizan Miyamoto <eizan@chromium.org>, linux-kernel@vger.kernel.org
Cc:     wenst@chromium.org, houlong.wei@mediatek.com, yong.wu@mediatek.com,
        enric.balletbo@collabora.com, devicetree@vger.kernel.org,
        chunkuang.hu@kernel.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <8fe5ac46-a9db-710e-a6d1-856805ab2773@collabora.com>
Date:   Thu, 5 Aug 2021 08:06:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 02.08.21 14:12, Eizan Miyamoto wrote:
> Up until this change, many errors were logged but ignored when powering
> on clocks inside mtk_mdp_core. This change tries to do a better job at
> propagating errors back to the power management framework.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
> (no changes since v1)
> 
>   drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 25 ++++++++++++-----
>   drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 +-
>   drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 27 ++++++++++++++-----
>   3 files changed, 39 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index b3426a551bea..76e295c8d9bc 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -13,10 +13,9 @@
>   
>   #include "mtk_mdp_comp.h"
>   
> -
> -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
> +int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>   {
> -	int i, err;
> +	int i, err, status;
>   
>   	if (comp->larb_dev) {
>   		err = mtk_smi_larb_get(comp->larb_dev);
> @@ -30,11 +29,23 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>   		if (IS_ERR(comp->clk[i]))
>   			continue;
>   		err = clk_prepare_enable(comp->clk[i]);
> -		if (err)
> -			dev_err(dev,
> -			"failed to enable clock, err %d. type:%d i:%d\n",
> -				err, comp->type, i);
> +		if (err) {
> +			status = err;
> +			dev_err(dev, "failed to enable clock, err %d. i:%d\n", err, i);
> +			goto err_clk_prepare_enable;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_clk_prepare_enable:
> +	for (--i; i >= 0; i--) {
> +		if (IS_ERR(comp->clk[i]))
> +			continue;
> +		clk_disable_unprepare(comp->clk[i]);
>   	}
> +
> +	return status;

There is an API function clk_bulk_prepare_enable to prepare and enable an array of clks
so you can just use it.

>   }
>   
>   void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 7897766c96bb..92ab5249bcad 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -41,7 +41,7 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>   		      struct mtk_mdp_comp *comp,
>   		      enum mtk_mdp_comp_type comp_type);
>   void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp);
> -void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
> +int mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp);
>   void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp);
>   
>   
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 976aa1f4829b..412bbec0f735 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -52,13 +52,28 @@ static const struct of_device_id mtk_mdp_of_ids[] = {
>   };
>   MODULE_DEVICE_TABLE(of, mtk_mdp_of_ids);
>   
> -static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
> +static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
>   {
> -	struct device *dev = &mdp->pdev->dev;
>   	struct mtk_mdp_comp *comp_node;
> +	int status;
> +	struct device *dev = &mdp->pdev->dev;
> +	int err;
>   
> -	list_for_each_entry(comp_node, &mdp->comp_list, node)
> -		mtk_mdp_comp_clock_on(dev, comp_node);
> +	list_for_each_entry(comp_node, &mdp->comp_list, node) {
> +		err = mtk_mdp_comp_clock_on(dev, comp_node);
> +		if (err) {
> +			status = err;

You can get rid of the new var 'status' and just return ret in case of error

> +			goto err_mtk_mdp_comp_clock_on;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_mtk_mdp_comp_clock_on:
> +	list_for_each_entry_continue_reverse(comp_node, &mdp->comp_list, node)
> +		mtk_mdp_comp_clock_off(dev, comp_node);
> +
> +	return status;
>   }
>   
>   static void mtk_mdp_clock_off(struct mtk_mdp_dev *mdp)
> @@ -274,9 +289,7 @@ static int __maybe_unused mtk_mdp_pm_resume(struct device *dev)
>   {
>   	struct mtk_mdp_dev *mdp = dev_get_drvdata(dev);
>   
> -	mtk_mdp_clock_on(mdp);
> -
> -	return 0;
> +	return mtk_mdp_clock_on(mdp);
>   }
>   
>   static int __maybe_unused mtk_mdp_suspend(struct device *dev)
> 
