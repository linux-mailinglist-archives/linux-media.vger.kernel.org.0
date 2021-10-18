Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37C4431DC5
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 15:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234097AbhJRNyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 09:54:53 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34544 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbhJRNww (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 09:52:52 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id F3C4F1F4178D
Subject: Re: [PATCH v8 2/7] soc: mediatek: mmsys: add support for ISP control
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
 <20211015123832.17914-3-moudy.ho@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <e78c99b2-1032-8fe9-4100-a108661aa532@collabora.com>
Date:   Mon, 18 Oct 2021 15:50:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015123832.17914-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> This patch adds 8183 ISP settings in MMSYS domain and interface.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8183-mmsys.h    |  16 ++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 108 +++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.h       |   1 +
>   include/linux/soc/mediatek/mtk-mmsys.h |  25 ++++++
>   4 files changed, 150 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
> index 663f196fc4e7..c490cc1b1072 100644
> --- a/drivers/soc/mediatek/mt8183-mmsys.h
> +++ b/drivers/soc/mediatek/mt8183-mmsys.h
> @@ -32,6 +32,13 @@
>   #define MT8183_MDP_CCORR_SEL_IN			0xff0
>   #define MT8183_MDP_CCORR_SOUT_SEL		0xff4
>   
> +#define MT8183_ISP_CTRL_MMSYS_SW0_RST_B		0x140
> +#define MT8183_ISP_CTRL_MMSYS_SW1_RST_B		0x144
> +#define MT8183_ISP_CTRL_MDP_ASYNC_CFG_WD	0x934
> +#define MT8183_ISP_CTRL_MDP_ASYNC_IPU_CFG_WD	0x93C
> +#define MT8183_ISP_CTRL_ISP_RELAY_CFG_WD	0x994
> +#define MT8183_ISP_CTRL_IPU_RELAY_CFG_WD	0x9a0
> +
>   #define MT8183_OVL0_MOUT_EN_OVL0_2L		BIT(4)
>   #define MT8183_OVL0_2L_MOUT_EN_DISP_PATH0	BIT(0)
>   #define MT8183_OVL1_2L_MOUT_EN_RDMA1		BIT(4)
> @@ -276,5 +283,14 @@ static const struct mtk_mmsys_routes mmsys_mt8183_mdp_routing_table[] = {
>   	}
>   };
>   
> +static const unsigned int mmsys_mt8183_mdp_isp_ctrl_table[ISP_CTRL_MAX] = {
> +	[ISP_CTRL_MMSYS_SW0_RST_B] = MT8183_ISP_CTRL_MMSYS_SW0_RST_B,
> +	[ISP_CTRL_MMSYS_SW1_RST_B] = MT8183_ISP_CTRL_MMSYS_SW1_RST_B,
> +	[ISP_CTRL_MDP_ASYNC_CFG_WD] = MT8183_ISP_CTRL_MDP_ASYNC_CFG_WD,
> +	[ISP_CTRL_MDP_ASYNC_IPU_CFG_WD] = MT8183_ISP_CTRL_MDP_ASYNC_IPU_CFG_WD,
> +	[ISP_CTRL_ISP_RELAY_CFG_WD] = MT8183_ISP_CTRL_ISP_RELAY_CFG_WD,
> +	[ISP_CTRL_IPU_RELAY_CFG_WD] = MT8183_ISP_CTRL_IPU_RELAY_CFG_WD,
> +};
> +
>   #endif /* __SOC_MEDIATEK_MT8183_MMSYS_H */
>   
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 31fec490617e..f4b1d2fa41b4 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -55,6 +55,7 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>   	.mdp_routes = mmsys_mt8183_mdp_routing_table,
>   	.mdp_num_routes = ARRAY_SIZE(mmsys_mt8183_mdp_routing_table),
> +	.mdp_isp_ctrl = mmsys_mt8183_mdp_isp_ctrl_table,
>   };
>   
>   static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
> @@ -142,6 +143,113 @@ void mtk_mmsys_mdp_disconnect(struct device *dev, struct mmsys_cmdq_cmd *cmd,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_mdp_disconnect);
>   
> +void mtk_mmsys_mdp_isp_ctrl(struct device *dev, struct mmsys_cmdq_cmd *cmd,
> +			    enum mtk_mdp_comp_id id)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +	const unsigned int *isp_ctrl = mmsys->data->mdp_isp_ctrl;
> +	u32 reg;
> +
> +	WARN_ON(mmsys->subsys_id == 0);
> +	/* Direct link */
> +	if (id == MDP_COMP_CAMIN) {
> +		/* Reset MDP_DL_ASYNC_TX */
> +		/* Bit  3: MDP_DL_ASYNC_TX / MDP_RELAY */
> +		if (isp_ctrl[ISP_CTRL_MMSYS_SW0_RST_B]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MMSYS_SW0_RST_B];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    0x0, 0x00000008);

This is 				    0, 0x8);
Please remove leading zeros.

> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    1 << 3, 0x00000008);

1 << 3 is BIT(3)
Also remove leading zeros.

> +		}
> +
> +		/* Reset MDP_DL_ASYNC_RX */
> +		/* Bit  10: MDP_DL_ASYNC_RX */
> +		if (isp_ctrl[ISP_CTRL_MMSYS_SW1_RST_B]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MMSYS_SW1_RST_B];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    0x0, 0x00000400);
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    1 << 10, 0x00000400);

BIT(10) and leading zeros.

> +		}
> +
> +		/* Enable sof mode */
> +		if (isp_ctrl[ISP_CTRL_ISP_RELAY_CFG_WD]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_ISP_RELAY_CFG_WD];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    0 << 31, 0x80000000);

Shifting 0 by N bits is still zero, so this is simply 0.

> +		}
> +	}
> +
> +	if (id == MDP_COMP_CAMIN2) {
> +		/* Reset MDP_DL_ASYNC2_TX */
> +		/* Bit  4: MDP_DL_ASYNC2_TX / MDP_RELAY2 */
> +		if (isp_ctrl[ISP_CTRL_MMSYS_SW0_RST_B]) {
> +			reg = mmsys->addr + isp_ctrl[ISP_CTRL_MMSYS_SW0_RST_B];
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    0x0, 0x00000010);
> +			cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
> +					    1 << 4, 0x00000010);

Please use the BIT() macro and remove leading zeros, here and everywhere else.
Also, I would really appreciate if you defined these bits somewhere instead of
writing "magic values".

For example, here you're documenting what bit 4 is, but it would be better if
you simply defined (please use appropriate names!)
#define MY_REGISTER_BIT		BIT(4)

...and then you called your function like that:
cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
		    0, MY_REGISTER_BIT);
and then
cmdq_pkt_write_mask(cmd->pkt, mmsys->subsys_id, reg,
		    MY_REGISTER_BIT, MY_REGISTER_BIT);

So, since you're documenting it with defines, you will also be able to remove
the comments describing the same thing.

Regards,
- Angelo
