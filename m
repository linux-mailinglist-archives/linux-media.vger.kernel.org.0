Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D8E435F7D
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 12:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhJUKrA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 06:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbhJUKq7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 06:46:59 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80C9C06161C;
        Thu, 21 Oct 2021 03:44:43 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id E9B121F44896
Subject: Re: [PATCH v1 4/4] media: platform: mtk-mdp3: Set rdma compression
 reg in each frame
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
 <20211021063414.23663-5-roy-cw.yeh@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <4154479c-b0cc-dde4-eb73-bc6c65c9beca@collabora.com>
Date:   Thu, 21 Oct 2021 12:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021063414.23663-5-roy-cw.yeh@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 21/10/21 08:34, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Set rdma compression reg in each frame
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
>   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c | 10 ++++++----
>   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c |  2 +-
>   2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> index 12d6c88c68d2..dc0d1b3ff218 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
> @@ -178,15 +178,17 @@ static int config_rdma_frame(struct mdp_comp_ctx *ctx,
>   			/* Setup Compression Control */
>   			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
>   				     rdma->comp_ctrl, write_mask);
> -		}
> -
> -		if (mdp_cfg->rdma_support_afbc &&
> -		    (MDP_COLOR_IS_COMPRESS(colorformat))) {
> +		} else if (mdp_cfg->rdma_support_afbc &&
> +			   (MDP_COLOR_IS_COMPRESS(colorformat))) {

Looks like you're unconditionally writing to the compression control register,

so you can just...

>   			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_SIZE_IN_PXL,
>   				     ((width + 31) >> 5) << 5, 0x001FFFFF);
>   			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_H_SIZE_IN_PXL,
>   				     ((height + 7) >> 3) << 3, 0x001FFFFF);
>   
		}
		/* Setup Compression Control */

		MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,

			     rdma->comp_ctrl, write_mask);	

... and avoid repeating the same thing over and over in all of the conditionals.

> +			/* Setup Compression Control */
> +			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
> +				     rdma->comp_ctrl, write_mask);
> +		} else {
>   			/* Setup Compression Control */
>   			MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_COMP_CON,
>   				     rdma->comp_ctrl, write_mask);
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> index 875326afb686..1a15490d45e7 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
> @@ -34,7 +34,7 @@ static const struct mdp_platform_config mt8195_plat_cfg = {
>   	.rdma_support_afbc              = true,
>   	.rdma_esl_setting               = true,
>   	.rdma_rsz1_sram_sharing         = false,
> -	.rdma_upsample_repeat_only      = true,
> +	.rdma_upsample_repeat_only      = false,
>   	.rsz_disable_dcm_small_sample   = false,
>   	.rsz_etc_control                = true,
>   	.wrot_filter_constraint         = false,
> 

