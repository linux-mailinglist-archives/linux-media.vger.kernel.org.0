Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F2E435F0C
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 12:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhJUKaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 06:30:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42768 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhJUKaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 06:30:55 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id D75221F44855
Subject: Re: [PATCH v1 3/4] media: platform: mtk-mdp3: Set
 dma_set_mask_and_coherent
To:     "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        "jason-jh . lin" <jason-jh.lin@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Moudy Ho <moudy.ho@mediatek.com>,
        "river . cheng" <river.cheng@mediatek.com>,
        Yongqiang Niu <yongqiang.niu@mediatek.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20211021063414.23663-1-roy-cw.yeh@mediatek.com>
 <20211021063414.23663-4-roy-cw.yeh@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <d0db66a3-04b4-1b1f-f6bb-8b45154559ff@collabora.com>
Date:   Thu, 21 Oct 2021 12:28:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021063414.23663-4-roy-cw.yeh@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 21/10/21 08:34, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Set dma_set_mask_and_coherent
> 

Please explain why you're setting that and why 34 bits in the commit description.

> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
>   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> index 1e61ac7ca790..875326afb686 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> @@ -1141,6 +1141,8 @@ static int mdp_probe(struct platform_device *pdev)
>   	mdp->pdev = pdev;
>   	mdp->mdp_data = of_device_get_match_data(&pdev->dev);
>   
> +	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
> +
>   	ret = of_property_read_u32(dev->of_node, "mediatek,mdp3-id", &id);
>   	if (ret) {
>   		dev_err(dev, "Failed to get mdp-id\n");
> 

