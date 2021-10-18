Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85D4E431F1F
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 16:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbhJROQQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 10:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbhJROQE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 10:16:04 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4143FC07E5FD;
        Mon, 18 Oct 2021 06:50:21 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 27FA91F4167F
Subject: Re: [PATCH v8 4/7] soc: mediatek: mutex: add functions that operate
 registers by CMDQ
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
 <20211015123832.17914-5-moudy.ho@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <c30de071-0ac4-bbbe-bde3-770c2a15025d@collabora.com>
Date:   Mon, 18 Oct 2021 15:50:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015123832.17914-5-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Considering that some functions have timing requirements
> in specific situation, this patch adds several interface that
> operate registers by CMDQ.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mutex.c       | 63 +++++++++++++++++++++++++-
>   include/linux/soc/mediatek/mtk-mutex.h |  6 +++
>   2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index adab4c9edc16..874d4c60b844 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -7,10 +7,12 @@
>   #include <linux/iopoll.h>
>   #include <linux/module.h>
>   #include <linux/of_device.h>
> +#include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/soc/mediatek/mtk-mmsys.h>
>   #include <linux/soc/mediatek/mtk-mutex.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
>   
>   #define MT2701_MUTEX0_MOD0			0x2c
>   #define MT2701_MUTEX0_SOF0			0x30
> @@ -143,6 +145,8 @@ struct mtk_mutex_ctx {
>   	void __iomem			*regs;
>   	struct mtk_mutex		mutex[10];
>   	const struct mtk_mutex_data	*data;
> +	phys_addr_t			addr;
> +	u8				subsys_id;
>   };
>   
>   static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
> @@ -442,6 +446,25 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
>   
> +void mtk_mutex_add_mod_by_cmdq(struct mtk_mutex *mutex, u32 mod,
> +			       struct mmsys_cmdq_cmd *cmd)
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
> +	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
> +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
> +			    0, mtx->data->mutex_mdp_sof_mask);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_add_mod_by_cmdq);
> +
>   void mtk_mutex_enable(struct mtk_mutex *mutex)
>   {
>   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> @@ -453,6 +476,20 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
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

(don't use this definition name if not appropriate)
#define MTK_MUTEX_ENABLE	BIT(0)

cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id,

		    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),

		    MTK_MUTEX_ENABLE, MTK_MUTEX_ENABLE);

...or anyway remove leading zeros.

> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
> +
>   void mtk_mutex_disable(struct mtk_mutex *mutex)
>   {
>   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
> @@ -464,6 +501,20 @@ void mtk_mutex_disable(struct mtk_mutex *mutex)
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

cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id,


		    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),


		    0, MTK_MUTEX_ENABLE);

> +}
> +EXPORT_SYMBOL_GPL(mtk_mutex_disable_by_cmdq);
> +

Regards,
- Angelo


