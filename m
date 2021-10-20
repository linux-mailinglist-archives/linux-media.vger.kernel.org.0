Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4664347F4
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 11:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhJTJcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 05:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhJTJcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 05:32:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6ECC061749;
        Wed, 20 Oct 2021 02:29:53 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id A711B1F43D72
Subject: Re: [PATCH v2 2/9] soc: mediatek: mutex: expand parameter for mdp
 mutex function
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
References: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
 <20211020071448.14187-3-roy-cw.yeh@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <0eaea2d4-1683-622a-e814-8b6c7c3eab2e@collabora.com>
Date:   Wed, 20 Oct 2021 11:29:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020071448.14187-3-roy-cw.yeh@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 20/10/21 09:14, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Expand parameter for mdp mutex function
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
>   drivers/soc/mediatek/mtk-mutex.c       | 26 ++++++++++++++++++--------
>   include/linux/soc/mediatek/mtk-mutex.h |  2 +-
>   2 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 814f58f692cf..c100a5249016 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -25,8 +25,9 @@
>   #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
>   #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
>   #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
> -#define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg + 0x20 * (n))
> -#define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	(mutex_sof_reg + 0x20 * (n))
> +#define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20 * (n))
> +#define DISP_REG_MUTEX_MOD1(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20 * (n) + 0x4)
> +#define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	((mutex_sof_reg) + 0x20 * (n))
>   #define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 * (n))
>   
>   #define INT_MUTEX				BIT(1)
> @@ -116,6 +117,11 @@
>   #define MT8183_MUTEX_MDP_MOD_MASK		0x07FFFFFF
>   #define MT8183_MUTEX_MDP_SOF_MASK		0x00000007
>   
> +#define MT8183_MDP_PIPE_IMGI			MT8183_MUTEX_MDP_START
> +#define MT8183_MDP_PIPE_RDMA0			(MT8183_MUTEX_MDP_START + 1)
> +#define MT8183_MDP_PIPE_WPEI			(MT8183_MUTEX_MDP_START + 2)
> +#define MT8183_MDP_PIPE_WPEI2			(MT8183_MUTEX_MDP_START + 3)
> +
>   struct mtk_mutex {
>   	int id;
>   	bool claimed;
> @@ -254,10 +260,10 @@ static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>   
>   /* indicate which mutex is used by each pipepline */
>   static const unsigned int mt8183_mutex_mdp_offset[MDP_PIPE_MAX] = {
> -	[MDP_PIPE_IMGI] = MT8183_MUTEX_MDP_START,
> -	[MDP_PIPE_RDMA0] = MT8183_MUTEX_MDP_START + 1,
> -	[MDP_PIPE_WPEI] = MT8183_MUTEX_MDP_START + 2,
> -	[MDP_PIPE_WPEI2] = MT8183_MUTEX_MDP_START + 3
> +	[MDP_PIPE_IMGI] = MT8183_MDP_PIPE_IMGI,
> +	[MDP_PIPE_RDMA0] = MT8183_MDP_PIPE_RDMA0,
> +	[MDP_PIPE_WPEI] = MT8183_MDP_PIPE_WPEI,
> +	[MDP_PIPE_WPEI2] = MT8183_MDP_PIPE_WPEI2,
>   };
>   
>   static const struct mtk_mutex_data mt2701_mutex_driver_data = {
> @@ -410,7 +416,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>   EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
>   
>   void mtk_mutex_add_mdp_mod(struct mtk_mutex *mutex, u32 mod,
> -			   struct mmsys_cmdq_cmd *cmd)
> +			   u32 mod1, u32 sof, struct mmsys_cmdq_cmd *cmd)
>   {
>   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
>   						 mutex[mutex->id]);
> @@ -422,9 +428,13 @@ void mtk_mutex_add_mdp_mod(struct mtk_mutex *mutex, u32 mod,
>   	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
>   			    mod, mtx->data->mutex_mdp_mod_mask);
>   
> +	offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg, mutex->id);
> +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
> +			    mod1, mtx->data->mutex_mdp_mod_mask);
> +
>   	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
>   	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
> -			    0, mtx->data->mutex_mdp_sof_mask);
> +			    sof, mtx->data->mutex_mdp_sof_mask);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_add_mdp_mod);
>   
> diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
> index d08b98419dd9..a2b81ce55b5d 100644
> --- a/include/linux/soc/mediatek/mtk-mutex.h
> +++ b/include/linux/soc/mediatek/mtk-mutex.h
> @@ -17,7 +17,7 @@ int mtk_mutex_prepare(struct mtk_mutex *mutex);
>   void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>   			enum mtk_ddp_comp_id id);
>   void mtk_mutex_add_mdp_mod(struct mtk_mutex *mutex, u32 mod,
> -			   struct mmsys_cmdq_cmd *cmd);
> +			   u32 mod1, u32 sof, struct mmsys_cmdq_cmd *cmd);
>   void mtk_mutex_enable(struct mtk_mutex *mutex);
>   void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
>   			      struct mmsys_cmdq_cmd *cmd);
> 


