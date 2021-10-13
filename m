Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB51E42C16A
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 15:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234162AbhJMNbe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 09:31:34 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37072 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhJMNbd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 09:31:33 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id EC87F1F445B5
Subject: Re: [PATCH v7 1/5] soc: mediatek: mutex: add support for MDP
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
        sj.huang@mediatek.com, ben.lok@mediatek.com, randy.wu@mediatek.com,
        srv_heupstream@mediatek.com, hsinyi@google.com,
        benjamin.gaignard@collabora.com
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-2-moudy.ho@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <ee3668b3-f84c-fe8d-05bc-40e65c60e24f@collabora.com>
Date:   Wed, 13 Oct 2021 15:29:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824100027.25989-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Moudy,

thanks for the patch! Though, there are a few things to improve.

> Add functions to support MDP:
>    1. Get mutex function
>    2. Enable/disable mutex
>    3. Enable MDP's modules
>    4. Write register via CMDQ
> 
> Add MDP related settings for 8183 SoC
>    1. Register settings
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mutex.c       | 106 +++++++++++++++++++++++--
>   include/linux/soc/mediatek/mtk-mutex.h |   8 ++
>   2 files changed, 108 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 2e4bcc300576..935f2849a094 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -7,9 +7,11 @@
>   #include <linux/iopoll.h>
>   #include <linux/module.h>
>   #include <linux/of_device.h>
> +#include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/soc/mediatek/mtk-mmsys.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
>   #include <linux/soc/mediatek/mtk-mutex.h>
>   
>   #define MT2701_MUTEX0_MOD0			0x2c
> @@ -107,6 +109,10 @@
>   #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
>   #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
>   
> +#define MT8183_MUTEX_MDP_START			5
> +#define MT8183_MUTEX_MDP_MOD_MASK		0x07FFFFFF
> +#define MT8183_MUTEX_MDP_SOF_MASK		0x00000007
> +
>   struct mtk_mutex {
>   	int id;
>   	bool claimed;
> @@ -123,11 +129,14 @@ enum mtk_mutex_sof_id {
>   };
>   
>   struct mtk_mutex_data {
> -	const unsigned int *mutex_mod;
> -	const unsigned int *mutex_sof;
> -	const unsigned int mutex_mod_reg;
> -	const unsigned int mutex_sof_reg;
> -	const bool no_clk;
> +	const unsigned int	*mutex_mod;
> +	const unsigned int	*mutex_sof;
> +	const unsigned int	mutex_mod_reg;
> +	const unsigned int	mutex_sof_reg;
> +	const unsigned int	*mutex_mdp_offset;
> +	const unsigned int	mutex_mdp_mod_mask;
> +	const unsigned int	mutex_mdp_sof_mask;
> +	const bool		no_clk;

As a rule of thumb, if you're changing any formatting, not only you should have
a good reason, but also it's something that shall be done in a different commit,
so, one for functional changes, one for cosmetic changes (not necessarily in this
order).

This will make it easier for everyone to review your patches.

>   };
>   
>   struct mtk_mutex_ctx {
> @@ -136,6 +145,8 @@ struct mtk_mutex_ctx {
>   	void __iomem			*regs;
>   	struct mtk_mutex		mutex[10];
>   	const struct mtk_mutex_data	*data;
> +	phys_addr_t			addr;
> +	u8				subsys_id;
>   };
>   
>   static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> @@ -238,6 +249,14 @@ static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
>   	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
>   };
>   
> +/* indicate which mutex is used by each pipepline */
> +static const unsigned int mt8183_mutex_mdp_offset[MDP_PIPE_MAX] = {
> +	[MDP_PIPE_IMGI] = MT8183_MUTEX_MDP_START,
> +	[MDP_PIPE_RDMA0] = MT8183_MUTEX_MDP_START + 1,
> +	[MDP_PIPE_WPEI] = MT8183_MUTEX_MDP_START + 2,
> +	[MDP_PIPE_WPEI2] = MT8183_MUTEX_MDP_START + 3
> +};
> +
>   static const struct mtk_mutex_data mt2701_mutex_driver_data = {
>   	.mutex_mod = mt2701_mutex_mod,
>   	.mutex_sof = mt2712_mutex_sof,
> @@ -272,6 +291,9 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
>   	.mutex_sof = mt8183_mutex_sof,
>   	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
>   	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> +	.mutex_mdp_offset = mt8183_mutex_mdp_offset,
> +	.mutex_mdp_mod_mask = MT8183_MUTEX_MDP_MOD_MASK,
> +	.mutex_mdp_sof_mask = MT8183_MUTEX_MDP_SOF_MASK,
>   	.no_clk = true,
>   };
>   
> @@ -290,6 +312,21 @@ struct mtk_mutex *mtk_mutex_get(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_get);
>   
> +struct mtk_mutex *mtk_mutex_mdp_get(struct device *dev,
> +				    enum mtk_mdp_pipe_id id)
> +{
> +	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> +	int i = mtx->data->mutex_mdp_offset[id];
> +
> +	if (!mtx->mutex[i].claimed) {

I'm not sure that tracking the usage of this mutex here is the right thing
to do: from what I understand, this is being acquired by the MDP driver, at
mdp_probe(), and only once... so this check may be mostly useless, if not
in order to avoid possible race conditions due to really bad code.

Can anyone else give an opinion on that?

> +		mtx->mutex[i].claimed = true;
> +		return &mtx->mutex[i];
> +	}
> +
> +	return ERR_PTR(-EBUSY);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_mdp_get);
> +
>   void mtk_mutex_put(struct mtk_mutex *mutex)
>   {
>   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> @@ -369,6 +406,25 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
>   
> +void mtk_mutex_add_mdp_mod(struct mtk_mutex *mutex, u32 mod,
> +			   struct mmsys_cmdq_cmd *cmd)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +	unsigned int offset;
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg, mutex->id);
> +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
> +			    mod, mtx->data->mutex_mdp_mod_mask);
> +

Calls to this function makes this driver to depend on CONFIG_MTK_CMDQ.
Failing to meet this requirement will make the build to fail with:
drivers/soc/mediatek/mtk-mutex.c:545: undefined reference to `cmdq_pkt_write_mask'

> +	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
> +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
> +			    0, mtx->data->mutex_mdp_sof_mask);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_add_mdp_mod);
> +
>   void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
>   			   enum mtk_ddp_comp_id id)
>   {
> @@ -420,6 +476,20 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_enable);
>   
> +void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
> +			      struct mmsys_cmdq_cmd *cmd)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id,
> +			    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),
> +			    0x1, 0x00000001);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
> +
>   void mtk_mutex_disable(struct mtk_mutex *mutex)
>   {
>   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> @@ -431,6 +501,20 @@ void mtk_mutex_disable(struct mtk_mutex *mutex)
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_disable);
>   
> +void mtk_mutex_disable_by_cmdq(struct mtk_mutex *mutex,
> +			       struct mmsys_cmdq_cmd *cmd)
> +{
> +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> +						 mutex[mutex->id]);
> +
> +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> +
> +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id,
> +			    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),
> +			    0x0, 0x00000001);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_disable_by_cmdq);
> +
>   void mtk_mutex_acquire(struct mtk_mutex *mutex)
>   {
>   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> @@ -458,7 +542,8 @@ static int mtk_mutex_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_mutex_ctx *mtx;
> -	struct resource *regs;
> +	struct cmdq_client_reg cmdq_reg;
> +	struct resource *regs, addr;
>   	int i;
>   
>   	mtx = devm_kzalloc(dev, sizeof(*mtx), GFP_KERNEL);
> @@ -479,6 +564,15 @@ static int mtk_mutex_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	if (of_address_to_resource(dev->of_node, 0, &addr) < 0)
> +		mtx->addr = 0L;
> +	else
> +		mtx->addr = addr.start;
> +
> +	if (cmdq_dev_get_client_reg(dev, &cmdq_reg, 0) != 0)

... And it's the same here:
drivers/soc/mediatek/mtk-mutex.c:605: undefined reference to `cmdq_dev_get_client_reg'

Please add the required dependency/select in Kconfig.

Regards,
- Angelo


