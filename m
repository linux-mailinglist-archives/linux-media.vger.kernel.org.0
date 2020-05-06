Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37FCE1C741B
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 17:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729165AbgEFPTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 11:19:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55464 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728821AbgEFPTo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 May 2020 11:19:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id BB4F92A2500
Subject: Re: [PATCH v2 1/5] [media] mtk-mdp: remove mtk_mdp_comp.regs from
 mtk_mdp_comp.h
To:     Eizan Miyamoto <eizan@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20200506054920.109738-1-eizan@chromium.org>
 <20200506154832.v2.1.I0d52fd84fe481e254a10960b060f32c47ce0d202@changeid>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <0cd4d52b-e4bb-90c2-a5b5-a2e39169bf1c@collabora.com>
Date:   Wed, 6 May 2020 17:19:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506154832.v2.1.I0d52fd84fe481e254a10960b060f32c47ce0d202@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eizan,

Thank you for the patch.

On 6/5/20 7:49, Eizan Miyamoto wrote:
> These fields are not used and can be removed.
> 
> Signed-off-by: eizan@chromium.org

You need to drop the above line, for this and the other patches.

> Reviewed-by: Enric Balletbo I Serra <enric.balletbo@collabora.com>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
> Changes in v1: None
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 1 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 2 --
>  2 files changed, 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 58abfbdfb82d..c76cd61fb178 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -106,7 +106,6 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>  	comp->dev_node = of_node_get(node);
>  	comp->id = comp_id;
>  	comp->type = mtk_mdp_matches[comp_id].type;
> -	comp->regs = of_iomap(node, 0);
>  
>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		comp->clk[i] = of_clk_get(node, i);
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 998a4b953025..3b83bd6e0d8b 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -38,7 +38,6 @@ enum mtk_mdp_comp_id {
>   * struct mtk_mdp_comp - the MDP's function component data
>   * @dev_node:	component device node
>   * @clk:	clocks required for component
> - * @regs:	Mapped address of component registers.
>   * @larb_dev:	SMI device required for component
>   * @type:	component type
>   * @id:		component ID
> @@ -46,7 +45,6 @@ enum mtk_mdp_comp_id {
>  struct mtk_mdp_comp {
>  	struct device_node	*dev_node;
>  	struct clk		*clk[2];
> -	void __iomem		*regs;
>  	struct device		*larb_dev;
>  	enum mtk_mdp_comp_type	type;
>  	enum mtk_mdp_comp_id	id;
> 
