Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA65740EEB0
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 03:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237647AbhIQBZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 21:25:01 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:43468 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232222AbhIQBZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 21:25:00 -0400
X-UUID: 3fe0887dc5174655a9317812a8c572ad-20210917
X-UUID: 3fe0887dc5174655a9317812a8c572ad-20210917
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 398700776; Fri, 17 Sep 2021 09:23:34 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 09:23:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Sep 2021 09:23:32 +0800
Message-ID: <e42db754228d577979833657a5c2d8c32a20d47e.camel@mediatek.com>
Subject: Re: [PATCH v7 1/5] soc: mediatek: mutex: add support for MDP
From:   moudy ho <moudy.ho@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
CC:     Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>,
        <drinkcat@chromium.org>, <acourbot@chromium.org>,
        <pihsun@chromium.org>, <menghui.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
        <randy.wu@mediatek.com>, <srv_heupstream@mediatek.com>,
        <hsinyi@google.com>
Date:   Fri, 17 Sep 2021 09:23:32 +0800
In-Reply-To: <01e4d221-0c77-fdcb-0e01-540e315481d8@gmail.com>
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
         <20210824100027.25989-2-moudy.ho@mediatek.com>
         <01e4d221-0c77-fdcb-0e01-540e315481d8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-09-07 at 13:52 +0200, Matthias Brugger wrote:
> 
> On 24/08/2021 12:00, Moudy Ho wrote:
> > Add functions to support MDP:
> >    1. Get mutex function
> >    2. Enable/disable mutex
> >    3. Enable MDP's modules
> >    4. Write register via CMDQ
> > 
> > Add MDP related settings for 8183 SoC
> >    1. Register settings
> > 
> 
> Please write some good commit message.
> 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-mutex.c       | 106
> > +++++++++++++++++++++++--
> >   include/linux/soc/mediatek/mtk-mutex.h |   8 ++
> >   2 files changed, 108 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index 2e4bcc300576..935f2849a094 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -7,9 +7,11 @@
> >   #include <linux/iopoll.h>
> >   #include <linux/module.h>
> >   #include <linux/of_device.h>
> > +#include <linux/of_address.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/regmap.h>
> >   #include <linux/soc/mediatek/mtk-mmsys.h>
> > +#include <linux/soc/mediatek/mtk-cmdq.h>
> >   #include <linux/soc/mediatek/mtk-mutex.h>
> >   
> >   #define MT2701_MUTEX0_MOD0			0x2c
> > @@ -107,6 +109,10 @@
> >   #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_S
> > OF_DSI0 << 6)
> >   #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_S
> > OF_DPI0 << 6)
> >   
> > +#define MT8183_MUTEX_MDP_START			5
> > +#define MT8183_MUTEX_MDP_MOD_MASK		0x07FFFFFF
> > +#define MT8183_MUTEX_MDP_SOF_MASK		0x00000007
> > +
> >   struct mtk_mutex {
> >   	int id;
> >   	bool claimed;
> > @@ -123,11 +129,14 @@ enum mtk_mutex_sof_id {
> >   };
> >   
> >   struct mtk_mutex_data {
> > -	const unsigned int *mutex_mod;
> > -	const unsigned int *mutex_sof;
> > -	const unsigned int mutex_mod_reg;
> > -	const unsigned int mutex_sof_reg;
> > -	const bool no_clk;
> > +	const unsigned int	*mutex_mod;
> > +	const unsigned int	*mutex_sof;
> > +	const unsigned int	mutex_mod_reg;
> > +	const unsigned int	mutex_sof_reg;
> > +	const unsigned int	*mutex_mdp_offset;
> > +	const unsigned int	mutex_mdp_mod_mask;
> > +	const unsigned int	mutex_mdp_sof_mask;
> > +	const bool		no_clk;
> 
> Not needed, please drop.
> 
> >   };
> >   
> >   struct mtk_mutex_ctx {
> > @@ -136,6 +145,8 @@ struct mtk_mutex_ctx {
> >   	void __iomem			*regs;
> >   	struct mtk_mutex		mutex[10];
> >   	const struct mtk_mutex_data	*data;
> > +	phys_addr_t			addr;
> > +	u8				subsys_id;
> >   };
> >   
> >   static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX]
> > = {
> > @@ -238,6 +249,14 @@ static const unsigned int
> > mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
> >   	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 |
> > MT8183_MUTEX_EOF_DPI0,
> >   };
> >   
> > +/* indicate which mutex is used by each pipepline */
> > +static const unsigned int mt8183_mutex_mdp_offset[MDP_PIPE_MAX] =
> > {
> 
> Does this code even compile?
> There is some basic rules for patches, for example that they have to
> compile, 
> don't break anything etc.
> Please read the documentation and stick to it, before submitting
> patches:
> 
https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/process/submitting-patches.html__;!!CTRNKA9wMg0ARbw!ydpwywaE1_wrjDqXOQ2N-a98Tw2kejngWaJOgZAWmh-y8tBOW0M_BRXfuhKHSZQ9$
>  
> 
> Regards,
> Matthias

Hi Matthias,

I shouldn't have applied patches directly after chip compatibility
testing in internal codebase that it had to resolve some conflict and
been recorded automatically by GIT.
Sorry for the inconvenience, those redundant codes that cause
compilation errors will be removed and confirmed in future versions.

Thanks & Regards,
Moudy Ho
> 
> > +	[MDP_PIPE_IMGI] = MT8183_MUTEX_MDP_START,
> > +	[MDP_PIPE_RDMA0] = MT8183_MUTEX_MDP_START + 1,
> > +	[MDP_PIPE_WPEI] = MT8183_MUTEX_MDP_START + 2,
> > +	[MDP_PIPE_WPEI2] = MT8183_MUTEX_MDP_START + 3
> > +};
> > +
> >   static const struct mtk_mutex_data mt2701_mutex_driver_data = {
> >   	.mutex_mod = mt2701_mutex_mod,
> >   	.mutex_sof = mt2712_mutex_sof,
> > @@ -272,6 +291,9 @@ static const struct mtk_mutex_data
> > mt8183_mutex_driver_data = {
> >   	.mutex_sof = mt8183_mutex_sof,
> >   	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
> >   	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
> > +	.mutex_mdp_offset = mt8183_mutex_mdp_offset,
> > +	.mutex_mdp_mod_mask = MT8183_MUTEX_MDP_MOD_MASK,
> > +	.mutex_mdp_sof_mask = MT8183_MUTEX_MDP_SOF_MASK,
> >   	.no_clk = true,
> >   };
> >   
> > @@ -290,6 +312,21 @@ struct mtk_mutex *mtk_mutex_get(struct device
> > *dev)
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mutex_get);
> >   
> > +struct mtk_mutex *mtk_mutex_mdp_get(struct device *dev,
> > +				    enum mtk_mdp_pipe_id id)
> > +{
> > +	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
> > +	int i = mtx->data->mutex_mdp_offset[id];
> > +
> > +	if (!mtx->mutex[i].claimed) {
> > +		mtx->mutex[i].claimed = true;
> > +		return &mtx->mutex[i];
> > +	}
> > +
> > +	return ERR_PTR(-EBUSY);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_mdp_get);
> > +
> >   void mtk_mutex_put(struct mtk_mutex *mutex)
> >   {
> >   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > @@ -369,6 +406,25 @@ void mtk_mutex_add_comp(struct mtk_mutex
> > *mutex,
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
> >   
> > +void mtk_mutex_add_mdp_mod(struct mtk_mutex *mutex, u32 mod,
> > +			   struct mmsys_cmdq_cmd *cmd)
> > +{
> > +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > +						 mutex[mutex->id]);
> > +	unsigned int offset;
> > +
> > +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> > +
> > +	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg, mutex-
> > >id);
> > +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr +
> > offset,
> > +			    mod, mtx->data->mutex_mdp_mod_mask);
> > +
> > +	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex-
> > >id);
> > +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr +
> > offset,
> > +			    0, mtx->data->mutex_mdp_sof_mask);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_add_mdp_mod);
> > +
> >   void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
> >   			   enum mtk_ddp_comp_id id)
> >   {
> > @@ -420,6 +476,20 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mutex_enable);
> >   
> > +void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
> > +			      struct mmsys_cmdq_cmd *cmd)
> > +{
> > +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > +						 mutex[mutex->id]);
> > +
> > +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> > +
> > +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id,
> > +			    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),
> > +			    0x1, 0x00000001);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
> > +
> >   void mtk_mutex_disable(struct mtk_mutex *mutex)
> >   {
> >   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > @@ -431,6 +501,20 @@ void mtk_mutex_disable(struct mtk_mutex
> > *mutex)
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mutex_disable);
> >   
> > +void mtk_mutex_disable_by_cmdq(struct mtk_mutex *mutex,
> > +			       struct mmsys_cmdq_cmd *cmd)
> > +{
> > +	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > +						 mutex[mutex->id]);
> > +
> > +	WARN_ON(&mtx->mutex[mutex->id] != mutex);
> > +
> > +	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id,
> > +			    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),
> > +			    0x0, 0x00000001);
> > +}
> > +EXPORT_SYMBOL_GPL(mtk_mutex_disable_by_cmdq);
> > +
> >   void mtk_mutex_acquire(struct mtk_mutex *mutex)
> >   {
> >   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct
> > mtk_mutex_ctx,
> > @@ -458,7 +542,8 @@ static int mtk_mutex_probe(struct
> > platform_device *pdev)
> >   {
> >   	struct device *dev = &pdev->dev;
> >   	struct mtk_mutex_ctx *mtx;
> > -	struct resource *regs;
> > +	struct cmdq_client_reg cmdq_reg;
> > +	struct resource *regs, addr;
> >   	int i;
> >   
> >   	mtx = devm_kzalloc(dev, sizeof(*mtx), GFP_KERNEL);
> > @@ -479,6 +564,15 @@ static int mtk_mutex_probe(struct
> > platform_device *pdev)
> >   		}
> >   	}
> >   
> > +	if (of_address_to_resource(dev->of_node, 0, &addr) < 0)
> > +		mtx->addr = 0L;
> > +	else
> > +		mtx->addr = addr.start;
> > +
> > +	if (cmdq_dev_get_client_reg(dev, &cmdq_reg, 0) != 0)
> > +		dev_info(dev, "cmdq subsys id has not been set\n");
> > +	mtx->subsys_id = cmdq_reg.subsys;
> > +
> >   	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >   	mtx->regs = devm_ioremap_resource(dev, regs);
> >   	if (IS_ERR(mtx->regs)) {
> > diff --git a/include/linux/soc/mediatek/mtk-mutex.h
> > b/include/linux/soc/mediatek/mtk-mutex.h
> > index 6fe4ffbde290..d08b98419dd9 100644
> > --- a/include/linux/soc/mediatek/mtk-mutex.h
> > +++ b/include/linux/soc/mediatek/mtk-mutex.h
> > @@ -11,11 +11,19 @@ struct device;
> >   struct mtk_mutex;
> >   
> >   struct mtk_mutex *mtk_mutex_get(struct device *dev);
> > +struct mtk_mutex *mtk_mutex_mdp_get(struct device *dev,
> > +				    enum mtk_mdp_pipe_id id);
> >   int mtk_mutex_prepare(struct mtk_mutex *mutex);
> >   void mtk_mutex_add_comp(struct mtk_mutex *mutex,
> >   			enum mtk_ddp_comp_id id);
> > +void mtk_mutex_add_mdp_mod(struct mtk_mutex *mutex, u32 mod,
> > +			   struct mmsys_cmdq_cmd *cmd);
> >   void mtk_mutex_enable(struct mtk_mutex *mutex);
> > +void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
> > +			      struct mmsys_cmdq_cmd *cmd);
> >   void mtk_mutex_disable(struct mtk_mutex *mutex);
> > +void mtk_mutex_disable_by_cmdq(struct mtk_mutex *mutex,
> > +			       struct mmsys_cmdq_cmd *cmd);
> >   void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
> >   			   enum mtk_ddp_comp_id id);
> >   void mtk_mutex_unprepare(struct mtk_mutex *mutex);
> > 

