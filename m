Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C1F431F24
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 16:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbhJROQY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 10:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbhJROQT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 10:16:19 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2C3C037A52;
        Mon, 18 Oct 2021 06:51:03 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 2D3F81F420D4
Subject: Re: [PATCH v8 1/7] soc: mediatek: mmsys: add support for MDP
To:     Moudy Ho <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, drinkcat@chromium.org, acourbot@chromium.org,
        pihsun@chromium.org, menghui.lin@mediatek.com,
        sj.huang@mediatek.com, allen-kh.cheng@mediatek.com,
        randy.wu@mediatek.com, srv_heupstream@mediatek.com,
        hsinyi@google.com
References: <20211015123832.17914-1-moudy.ho@mediatek.com>
 <20211015123832.17914-2-moudy.ho@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <31577e05-34b8-2e5e-14f0-db9949ffdd3d@collabora.com>
Date:   Mon, 18 Oct 2021 15:50:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015123832.17914-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 15/10/21 14:38, Moudy Ho ha scritto:
> For the purpose of module independence, related settings should be moved
> from MDP to the corresponding driver.
> This patch adds more 8183 MDP settings and interface. and MDP
> related settings must be set via CMDQ to avoid frame unsynchronized.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   drivers/soc/mediatek/Kconfig           |   1 +
>   drivers/soc/mediatek/mt8183-mmsys.h    | 219 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       |  52 ++++++
>   drivers/soc/mediatek/mtk-mmsys.h       |   2 +
>   include/linux/soc/mediatek/mtk-mmsys.h |  56 +++++++
>   5 files changed, 330 insertions(+)
> 

snip...

> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index a78e88f27b62..31fec490617e 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -7,8 +7,10 @@
>   #include <linux/device.h>
>   #include <linux/io.h>
>   #include <linux/of_device.h>
> +#include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/soc/mediatek/mtk-mmsys.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
>   
>   #include "mtk-mmsys.h"
>   #include "mt8167-mmsys.h"
> @@ -51,6 +53,8 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.clk_driver = "clk-mt8183-mm",
>   	.routes = mmsys_mt8183_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> +	.mdp_routes = mmsys_mt8183_mdp_routing_table,
> +	.mdp_num_routes = ARRAY_SIZE(mmsys_mt8183_mdp_routing_table),
>   };
>   
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
> @@ -62,6 +66,8 @@ static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
>   struct mtk_mmsys {
>   	void __iomem *regs;
>   	const struct mtk_mmsys_driver_data *data;
> +	phys_addr_t addr;
> +	u8 subsys_id;
>   };
>   
>   void mtk_mmsys_ddp_connect(struct device *dev,
> @@ -101,12 +107,49 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> +void mtk_mmsys_mdp_connect(struct device *dev, struct mmsys_cmdq_cmd *cmd,
> +			   enum mtk_mdp_comp_id cur,
> +			   enum mtk_mdp_comp_id next)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const struct mtk_mmsys_routes *routes = mmsys->data->mdp_routes;
> +	int i;
> +
> +	WARN_ON(!routes);

Sorry, I didn't notice this one in the previous version review.

> +	WARN_ON(mmsys->subsys_id == 0);
> +	for (i = 0; i < mmsys->data->mdp_num_routes; i++)
> +		if (cur == routes[i].from_comp && next == routes[i].to_comp)

If routes is NULL, you'll get a NULL pointer kernel panic here, so you should
avoid reaching this point if that happens.

After fixing that,
Acked-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

