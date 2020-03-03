Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 199AA177141
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 09:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbgCCI3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 03:29:00 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54002 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgCCI3A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 03:29:00 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 34C6F294888
Subject: Re: [PATCH v11 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
To:     CK Hu <ck.hu@mediatek.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        airlied@linux.ie, mturquette@baylibre.com, sboyd@kernel.org,
        ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        rdunlap@infradead.org, dri-devel@lists.freedesktop.org,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        linux-clk@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>, wens@csie.org,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sean.wang@mediatek.com, frank-w@public-files.de,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
        Matthias Brugger <mbrugger@suse.com>,
        linux-arm-kernel@lists.infradead.org,
        Richard Fontana <rfontana@redhat.com>,
        linux-kernel@vger.kernel.org, matthias.bgg@kernel.org,
        Daniel Vetter <daniel@ffwll.ch>
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-5-enric.balletbo@collabora.com>
 <1583203972.12858.4.camel@mtksdaap41>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <4b33f74e-b71b-2536-a5e9-e605b2a8767f@collabora.com>
Date:   Tue, 3 Mar 2020 09:28:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583203972.12858.4.camel@mtksdaap41>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi CK,

On 3/3/20 3:52, CK Hu wrote:
> Hi, Enric:
> 
> On Mon, 2020-03-02 at 12:01 +0100, Enric Balletbo i Serra wrote:
>> Provide a mtk_mmsys_ddp_connect() and mtk_mmsys_disconnect() functions to
>> replace mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_path().
>> Those functions will allow DRM driver and others to control the data
>> path routing.
>>
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> But what is the base of this series? When I apply this patch to 5.6-rc1,
> some error happen, the apply --reject result is
> 

I think the conflict is because I have this patch [1] applied on my tree too.
But as you said, easy to fix. Sorry about the extra job.

[1] https://patchwork.kernel.org/patch/11406227/

> In drivers/gpu/drm/mediatek/mtk_drm_crtc.c.rej
> 
> diff a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c        (rejected hunks)
> @@ -296,9 +297,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc
> *mtk_crtc)
>         }
> 
>         for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
> -               mtk_ddp_add_comp_to_path(mtk_crtc->config_regs,
> -                                        mtk_crtc->ddp_comp[i]->id,
> -                                        mtk_crtc->ddp_comp[i + 1]->id);
> +               mtk_mmsys_ddp_connect(mtk_crtc->mmsys_dev,
> +                                     mtk_crtc->ddp_comp[i]->id,
> +                                     mtk_crtc->ddp_comp[i + 1]->id);
>                 mtk_disp_mutex_add_comp(mtk_crtc->mutex,
>                                         mtk_crtc->ddp_comp[i]->id);
>         }
> 
> I's trivial for me to fix this conflicts, so you have better to notice
> what is the base of this series in cover latter.
> 
> Regards,
> CK
> 
> 
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>> ---
>>
>> Changes in v11:
>> - Select CONFIG_MTK_MMSYS (CK)
>> - Pass device pointer of mmsys device instead of config regs (CK)
>>
>> Changes in v10:
>> - Introduced a new patch to move routing control into mmsys driver.
>> - Removed the patch to use regmap as is not needed anymore.
>>
>> Changes in v9: None
>> Changes in v8: None
>> Changes in v7: None
>>
>>  drivers/gpu/drm/mediatek/Kconfig        |   1 +
>>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  19 +-
>>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 256 ----------------------
>>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |   7 -
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  14 +-
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   2 +-
>>  drivers/soc/mediatek/mtk-mmsys.c        | 277 ++++++++++++++++++++++++
>>  include/linux/soc/mediatek/mtk-mmsys.h  |  20 ++
>>  8 files changed, 314 insertions(+), 282 deletions(-)
>>  create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h
>>
>> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
>> index fa5ffc4fe823..c420f5a3d33b 100644
>> --- a/drivers/gpu/drm/mediatek/Kconfig
>> +++ b/drivers/gpu/drm/mediatek/Kconfig
>> @@ -11,6 +11,7 @@ config DRM_MEDIATEK
>>  	select DRM_MIPI_DSI
>>  	select DRM_PANEL
>>  	select MEMORY
>> +	select MTK_MMSYS
>>  	select MTK_SMI
>>  	select VIDEOMODE_HELPERS
>>  	help
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> index fd4042de12f2..f63a885e063c 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>> @@ -6,6 +6,7 @@
>>  #include <linux/clk.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/soc/mediatek/mtk-cmdq.h>
>> +#include <linux/soc/mediatek/mtk-mmsys.h>
>>  
>>  #include <asm/barrier.h>
>>  #include <soc/mediatek/smi.h>
>> @@ -28,7 +29,7 @@
>>   * @enabled: records whether crtc_enable succeeded
>>   * @planes: array of 4 drm_plane structures, one for each overlay plane
>>   * @pending_planes: whether any plane has pending changes to be applied
>> - * @config_regs: memory mapped mmsys configuration register space
>> + * @mmsys_dev: pointer to the mmsys device for configuration registers
>>   * @mutex: handle to one of the ten disp_mutex streams
>>   * @ddp_comp_nr: number of components in ddp_comp
>>   * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
>> @@ -50,7 +51,7 @@ struct mtk_drm_crtc {
>>  	u32				cmdq_event;
>>  #endif
>>  
>> -	void __iomem			*config_regs;
>> +	struct device			*mmsys_dev;
>>  	struct mtk_disp_mutex		*mutex;
>>  	unsigned int			ddp_comp_nr;
>>  	struct mtk_ddp_comp		**ddp_comp;
>> @@ -296,9 +297,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>>  	}
>>  
>>  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
>> -		mtk_ddp_add_comp_to_path(mtk_crtc->config_regs,
>> -					 mtk_crtc->ddp_comp[i]->id,
>> -					 mtk_crtc->ddp_comp[i + 1]->id);
>> +		mtk_mmsys_ddp_connect(mtk_crtc->mmsys_dev,
>> +				      mtk_crtc->ddp_comp[i]->id,
>> +				      mtk_crtc->ddp_comp[i + 1]->id);
>>  		mtk_disp_mutex_add_comp(mtk_crtc->mutex,
>>  					mtk_crtc->ddp_comp[i]->id);
>>  	}
>> @@ -355,9 +356,9 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
>>  					   mtk_crtc->ddp_comp[i]->id);
>>  	mtk_disp_mutex_disable(mtk_crtc->mutex);
>>  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
>> -		mtk_ddp_remove_comp_from_path(mtk_crtc->config_regs,
>> -					      mtk_crtc->ddp_comp[i]->id,
>> -					      mtk_crtc->ddp_comp[i + 1]->id);
>> +		mtk_mmsys_ddp_disconnect(mtk_crtc->mmsys_dev,
>> +					 mtk_crtc->ddp_comp[i]->id,
>> +					 mtk_crtc->ddp_comp[i + 1]->id);
>>  		mtk_disp_mutex_remove_comp(mtk_crtc->mutex,
>>  					   mtk_crtc->ddp_comp[i]->id);
>>  	}
>> @@ -758,7 +759,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>>  	if (!mtk_crtc)
>>  		return -ENOMEM;
>>  
>> -	mtk_crtc->config_regs = priv->config_regs;
>> +	mtk_crtc->mmsys_dev = priv->mmsys_dev;
>>  	mtk_crtc->ddp_comp_nr = path_len;
>>  	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
>>  						sizeof(*mtk_crtc->ddp_comp),
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
>> index b885f60f474c..014c1bbe1df2 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
>> @@ -13,26 +13,6 @@
>>  #include "mtk_drm_ddp.h"
>>  #include "mtk_drm_ddp_comp.h"
>>  
>> -#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
>> -#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
>> -#define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
>> -#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
>> -#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
>> -#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
>> -#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
>> -#define DISP_REG_CONFIG_DSIE_SEL_IN		0x0a4
>> -#define DISP_REG_CONFIG_DSIO_SEL_IN		0x0a8
>> -#define DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
>> -#define DISP_REG_CONFIG_DISP_RDMA2_SOUT		0x0b8
>> -#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN	0x0c4
>> -#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN	0x0c8
>> -#define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
>> -
>> -#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030
>> -#define DISP_REG_CONFIG_OUT_SEL			0x04c
>> -#define DISP_REG_CONFIG_DSI_SEL			0x050
>> -#define DISP_REG_CONFIG_DPI_SEL			0x064
>> -
>>  #define MT2701_DISP_MUTEX0_MOD0			0x2c
>>  #define MT2701_DISP_MUTEX0_SOF0			0x30
>>  
>> @@ -94,48 +74,6 @@
>>  #define MUTEX_SOF_DSI2			5
>>  #define MUTEX_SOF_DSI3			6
>>  
>> -#define OVL0_MOUT_EN_COLOR0		0x1
>> -#define OD_MOUT_EN_RDMA0		0x1
>> -#define OD1_MOUT_EN_RDMA1		BIT(16)
>> -#define UFOE_MOUT_EN_DSI0		0x1
>> -#define COLOR0_SEL_IN_OVL0		0x1
>> -#define OVL1_MOUT_EN_COLOR1		0x1
>> -#define GAMMA_MOUT_EN_RDMA1		0x1
>> -#define RDMA0_SOUT_DPI0			0x2
>> -#define RDMA0_SOUT_DPI1			0x3
>> -#define RDMA0_SOUT_DSI1			0x1
>> -#define RDMA0_SOUT_DSI2			0x4
>> -#define RDMA0_SOUT_DSI3			0x5
>> -#define RDMA1_SOUT_DPI0			0x2
>> -#define RDMA1_SOUT_DPI1			0x3
>> -#define RDMA1_SOUT_DSI1			0x1
>> -#define RDMA1_SOUT_DSI2			0x4
>> -#define RDMA1_SOUT_DSI3			0x5
>> -#define RDMA2_SOUT_DPI0			0x2
>> -#define RDMA2_SOUT_DPI1			0x3
>> -#define RDMA2_SOUT_DSI1			0x1
>> -#define RDMA2_SOUT_DSI2			0x4
>> -#define RDMA2_SOUT_DSI3			0x5
>> -#define DPI0_SEL_IN_RDMA1		0x1
>> -#define DPI0_SEL_IN_RDMA2		0x3
>> -#define DPI1_SEL_IN_RDMA1		(0x1 << 8)
>> -#define DPI1_SEL_IN_RDMA2		(0x3 << 8)
>> -#define DSI0_SEL_IN_RDMA1		0x1
>> -#define DSI0_SEL_IN_RDMA2		0x4
>> -#define DSI1_SEL_IN_RDMA1		0x1
>> -#define DSI1_SEL_IN_RDMA2		0x4
>> -#define DSI2_SEL_IN_RDMA1		(0x1 << 16)
>> -#define DSI2_SEL_IN_RDMA2		(0x4 << 16)
>> -#define DSI3_SEL_IN_RDMA1		(0x1 << 16)
>> -#define DSI3_SEL_IN_RDMA2		(0x4 << 16)
>> -#define COLOR1_SEL_IN_OVL1		0x1
>> -
>> -#define OVL_MOUT_EN_RDMA		0x1
>> -#define BLS_TO_DSI_RDMA1_TO_DPI1	0x8
>> -#define BLS_TO_DPI_RDMA1_TO_DSI		0x2
>> -#define DSI_SEL_IN_BLS			0x0
>> -#define DPI_SEL_IN_BLS			0x0
>> -#define DSI_SEL_IN_RDMA			0x1
>>  
>>  struct mtk_disp_mutex {
>>  	int id;
>> @@ -246,200 +184,6 @@ static const struct mtk_ddp_data mt8173_ddp_driver_data = {
>>  	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
>>  };
>>  
>> -static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
>> -				    enum mtk_ddp_comp_id next,
>> -				    unsigned int *addr)
>> -{
>> -	unsigned int value;
>> -
>> -	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>> -		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
>> -		value = OVL0_MOUT_EN_COLOR0;
>> -	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
>> -		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
>> -		value = OVL_MOUT_EN_RDMA;
>> -	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
>> -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>> -		value = OD_MOUT_EN_RDMA0;
>> -	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
>> -		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
>> -		value = UFOE_MOUT_EN_DSI0;
>> -	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>> -		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
>> -		value = OVL1_MOUT_EN_COLOR1;
>> -	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
>> -		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
>> -		value = GAMMA_MOUT_EN_RDMA1;
>> -	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
>> -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>> -		value = OD1_MOUT_EN_RDMA1;
>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> -		value = RDMA0_SOUT_DPI0;
>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> -		value = RDMA0_SOUT_DPI1;
>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> -		value = RDMA0_SOUT_DSI1;
>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> -		value = RDMA0_SOUT_DSI2;
>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> -		value = RDMA0_SOUT_DSI3;
>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> -		value = RDMA1_SOUT_DSI1;
>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> -		value = RDMA1_SOUT_DSI2;
>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> -		value = RDMA1_SOUT_DSI3;
>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> -		value = RDMA1_SOUT_DPI0;
>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> -		value = RDMA1_SOUT_DPI1;
>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> -		value = RDMA2_SOUT_DPI0;
>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> -		value = RDMA2_SOUT_DPI1;
>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> -		value = RDMA2_SOUT_DSI1;
>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> -		value = RDMA2_SOUT_DSI2;
>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> -		value = RDMA2_SOUT_DSI3;
>> -	} else {
>> -		value = 0;
>> -	}
>> -
>> -	return value;
>> -}
>> -
>> -static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
>> -				   enum mtk_ddp_comp_id next,
>> -				   unsigned int *addr)
>> -{
>> -	unsigned int value;
>> -
>> -	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>> -		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
>> -		value = COLOR0_SEL_IN_OVL0;
>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> -		value = DPI0_SEL_IN_RDMA1;
>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> -		value = DPI1_SEL_IN_RDMA1;
>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> -		value = DSI0_SEL_IN_RDMA1;
>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>> -		value = DSI1_SEL_IN_RDMA1;
>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> -		value = DSI2_SEL_IN_RDMA1;
>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>> -		value = DSI3_SEL_IN_RDMA1;
>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> -		value = DPI0_SEL_IN_RDMA2;
>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> -		value = DPI1_SEL_IN_RDMA2;
>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> -		value = DSI0_SEL_IN_RDMA2;
>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>> -		value = DSI1_SEL_IN_RDMA2;
>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> -		value = DSI2_SEL_IN_RDMA2;
>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> -		value = DSI3_SEL_IN_RDMA2;
>> -	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>> -		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
>> -		value = COLOR1_SEL_IN_OVL1;
>> -	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>> -		*addr = DISP_REG_CONFIG_DSI_SEL;
>> -		value = DSI_SEL_IN_BLS;
>> -	} else {
>> -		value = 0;
>> -	}
>> -
>> -	return value;
>> -}
>> -
>> -static void mtk_ddp_sout_sel(void __iomem *config_regs,
>> -			     enum mtk_ddp_comp_id cur,
>> -			     enum mtk_ddp_comp_id next)
>> -{
>> -	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>> -		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
>> -			       config_regs + DISP_REG_CONFIG_OUT_SEL);
>> -	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
>> -		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
>> -			       config_regs + DISP_REG_CONFIG_OUT_SEL);
>> -		writel_relaxed(DSI_SEL_IN_RDMA,
>> -			       config_regs + DISP_REG_CONFIG_DSI_SEL);
>> -		writel_relaxed(DPI_SEL_IN_BLS,
>> -			       config_regs + DISP_REG_CONFIG_DPI_SEL);
>> -	}
>> -}
>> -
>> -void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
>> -			      enum mtk_ddp_comp_id cur,
>> -			      enum mtk_ddp_comp_id next)
>> -{
>> -	unsigned int addr, value, reg;
>> -
>> -	value = mtk_ddp_mout_en(cur, next, &addr);
>> -	if (value) {
>> -		reg = readl_relaxed(config_regs + addr) | value;
>> -		writel_relaxed(reg, config_regs + addr);
>> -	}
>> -
>> -	mtk_ddp_sout_sel(config_regs, cur, next);
>> -
>> -	value = mtk_ddp_sel_in(cur, next, &addr);
>> -	if (value) {
>> -		reg = readl_relaxed(config_regs + addr) | value;
>> -		writel_relaxed(reg, config_regs + addr);
>> -	}
>> -}
>> -
>> -void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
>> -				   enum mtk_ddp_comp_id cur,
>> -				   enum mtk_ddp_comp_id next)
>> -{
>> -	unsigned int addr, value, reg;
>> -
>> -	value = mtk_ddp_mout_en(cur, next, &addr);
>> -	if (value) {
>> -		reg = readl_relaxed(config_regs + addr) & ~value;
>> -		writel_relaxed(reg, config_regs + addr);
>> -	}
>> -
>> -	value = mtk_ddp_sel_in(cur, next, &addr);
>> -	if (value) {
>> -		reg = readl_relaxed(config_regs + addr) & ~value;
>> -		writel_relaxed(reg, config_regs + addr);
>> -	}
>> -}
>> -
>>  struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
>>  {
>>  	struct mtk_ddp *ddp = dev_get_drvdata(dev);
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>> index 827be424a148..6b691a57be4a 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>> @@ -12,13 +12,6 @@ struct regmap;
>>  struct device;
>>  struct mtk_disp_mutex;
>>  
>> -void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
>> -			      enum mtk_ddp_comp_id cur,
>> -			      enum mtk_ddp_comp_id next);
>> -void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
>> -				   enum mtk_ddp_comp_id cur,
>> -				   enum mtk_ddp_comp_id next);
>> -
>>  struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id);
>>  int mtk_disp_mutex_prepare(struct mtk_disp_mutex *mutex);
>>  void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index 8e2d3cb62ad5..208f9c5256ef 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -10,6 +10,7 @@
>>  #include <linux/of_address.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/pm_runtime.h>
>> +#include <linux/soc/mediatek/mtk-mmsys.h>
>>  #include <linux/dma-mapping.h>
>>  
>>  #include <drm/drm_atomic.h>
>> @@ -425,7 +426,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>>  	struct mtk_drm_private *private;
>> -	struct resource *mem;
>>  	struct device_node *node;
>>  	struct component_match *match = NULL;
>>  	int ret;
>> @@ -436,14 +436,10 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>  		return -ENOMEM;
>>  
>>  	private->data = of_device_get_match_data(dev);
>> -
>> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	private->config_regs = devm_ioremap_resource(dev, mem);
>> -	if (IS_ERR(private->config_regs)) {
>> -		ret = PTR_ERR(private->config_regs);
>> -		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
>> -			ret);
>> -		return ret;
>> +	private->mmsys_dev = dev->parent;
>> +	if (!private->mmsys_dev) {
>> +		dev_err(dev, "Failed to get MMSYS device\n");
>> +		return -ENODEV;
>>  	}
>>  
>>  	/* Iterate over sibling DISP function blocks */
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> index 17bc99b9f5d4..b5be63e53176 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>> @@ -39,7 +39,7 @@ struct mtk_drm_private {
>>  
>>  	struct device_node *mutex_node;
>>  	struct device *mutex_dev;
>> -	void __iomem *config_regs;
>> +	struct device *mmsys_dev;
>>  	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
>>  	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
>>  	const struct mtk_mmsys_driver_data *data;
>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>> index 473cdf732fb5..bb99a05fb278 100644
>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>> @@ -5,14 +5,81 @@
>>   */
>>  
>>  #include <linux/clk-provider.h>
>> +#include <linux/device.h>
>>  #include <linux/of_device.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/soc/mediatek/mtk-mmsys.h>
>>  
>>  #include "../../clk/mediatek/clk-gate.h"
>>  #include "../../clk/mediatek/clk-mtk.h"
>> +#include "../../gpu/drm/mediatek/mtk_drm_ddp.h"
>> +#include "../../gpu/drm/mediatek/mtk_drm_ddp_comp.h"
>>  
>>  #include <dt-bindings/clock/mt8173-clk.h>
>>  
>> +#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
>> +#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
>> +#define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
>> +#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
>> +#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
>> +#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
>> +#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
>> +#define DISP_REG_CONFIG_DSIE_SEL_IN		0x0a4
>> +#define DISP_REG_CONFIG_DSIO_SEL_IN		0x0a8
>> +#define DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
>> +#define DISP_REG_CONFIG_DISP_RDMA2_SOUT		0x0b8
>> +#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN	0x0c4
>> +#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN	0x0c8
>> +#define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
>> +
>> +#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030
>> +#define DISP_REG_CONFIG_OUT_SEL			0x04c
>> +#define DISP_REG_CONFIG_DSI_SEL			0x050
>> +#define DISP_REG_CONFIG_DPI_SEL			0x064
>> +
>> +#define OVL0_MOUT_EN_COLOR0			0x1
>> +#define OD_MOUT_EN_RDMA0			0x1
>> +#define OD1_MOUT_EN_RDMA1			BIT(16)
>> +#define UFOE_MOUT_EN_DSI0			0x1
>> +#define COLOR0_SEL_IN_OVL0			0x1
>> +#define OVL1_MOUT_EN_COLOR1			0x1
>> +#define GAMMA_MOUT_EN_RDMA1			0x1
>> +#define RDMA0_SOUT_DPI0				0x2
>> +#define RDMA0_SOUT_DPI1				0x3
>> +#define RDMA0_SOUT_DSI1				0x1
>> +#define RDMA0_SOUT_DSI2				0x4
>> +#define RDMA0_SOUT_DSI3				0x5
>> +#define RDMA1_SOUT_DPI0				0x2
>> +#define RDMA1_SOUT_DPI1				0x3
>> +#define RDMA1_SOUT_DSI1				0x1
>> +#define RDMA1_SOUT_DSI2				0x4
>> +#define RDMA1_SOUT_DSI3				0x5
>> +#define RDMA2_SOUT_DPI0				0x2
>> +#define RDMA2_SOUT_DPI1				0x3
>> +#define RDMA2_SOUT_DSI1				0x1
>> +#define RDMA2_SOUT_DSI2				0x4
>> +#define RDMA2_SOUT_DSI3				0x5
>> +#define DPI0_SEL_IN_RDMA1			0x1
>> +#define DPI0_SEL_IN_RDMA2			0x3
>> +#define DPI1_SEL_IN_RDMA1			(0x1 << 8)
>> +#define DPI1_SEL_IN_RDMA2			(0x3 << 8)
>> +#define DSI0_SEL_IN_RDMA1			0x1
>> +#define DSI0_SEL_IN_RDMA2			0x4
>> +#define DSI1_SEL_IN_RDMA1			0x1
>> +#define DSI1_SEL_IN_RDMA2			0x4
>> +#define DSI2_SEL_IN_RDMA1			(0x1 << 16)
>> +#define DSI2_SEL_IN_RDMA2			(0x4 << 16)
>> +#define DSI3_SEL_IN_RDMA1			(0x1 << 16)
>> +#define DSI3_SEL_IN_RDMA2			(0x4 << 16)
>> +#define COLOR1_SEL_IN_OVL1			0x1
>> +
>> +#define OVL_MOUT_EN_RDMA			0x1
>> +#define BLS_TO_DSI_RDMA1_TO_DPI1		0x8
>> +#define BLS_TO_DPI_RDMA1_TO_DSI			0x2
>> +#define DSI_SEL_IN_BLS				0x0
>> +#define DPI_SEL_IN_BLS				0x0
>> +#define DSI_SEL_IN_RDMA				0x1
>> +
>>  static const struct mtk_gate_regs mm0_cg_regs = {
>>  	.set_ofs = 0x0104,
>>  	.clr_ofs = 0x0108,
>> @@ -110,13 +177,223 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>>  	.gates_num = ARRAY_SIZE(mt8173_mm_clks),
>>  };
>>  
>> +static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
>> +					  enum mtk_ddp_comp_id next,
>> +					  unsigned int *addr)
>> +{
>> +	unsigned int value;
>> +
>> +	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>> +		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
>> +		value = OVL0_MOUT_EN_COLOR0;
>> +	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
>> +		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
>> +		value = OVL_MOUT_EN_RDMA;
>> +	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
>> +		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>> +		value = OD_MOUT_EN_RDMA0;
>> +	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
>> +		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
>> +		value = UFOE_MOUT_EN_DSI0;
>> +	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>> +		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
>> +		value = OVL1_MOUT_EN_COLOR1;
>> +	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
>> +		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
>> +		value = GAMMA_MOUT_EN_RDMA1;
>> +	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
>> +		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>> +		value = OD1_MOUT_EN_RDMA1;
>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> +		value = RDMA0_SOUT_DPI0;
>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> +		value = RDMA0_SOUT_DPI1;
>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> +		value = RDMA0_SOUT_DSI1;
>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> +		value = RDMA0_SOUT_DSI2;
>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>> +		value = RDMA0_SOUT_DSI3;
>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> +		value = RDMA1_SOUT_DSI1;
>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> +		value = RDMA1_SOUT_DSI2;
>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> +		value = RDMA1_SOUT_DSI3;
>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> +		value = RDMA1_SOUT_DPI0;
>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>> +		value = RDMA1_SOUT_DPI1;
>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> +		value = RDMA2_SOUT_DPI0;
>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> +		value = RDMA2_SOUT_DPI1;
>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> +		value = RDMA2_SOUT_DSI1;
>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> +		value = RDMA2_SOUT_DSI2;
>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>> +		value = RDMA2_SOUT_DSI3;
>> +	} else {
>> +		value = 0;
>> +	}
>> +
>> +	return value;
>> +}
>> +
>> +static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
>> +					 enum mtk_ddp_comp_id next,
>> +					 unsigned int *addr)
>> +{
>> +	unsigned int value;
>> +
>> +	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>> +		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
>> +		value = COLOR0_SEL_IN_OVL0;
>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> +		value = DPI0_SEL_IN_RDMA1;
>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> +		value = DPI1_SEL_IN_RDMA1;
>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> +		value = DSI0_SEL_IN_RDMA1;
>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>> +		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>> +		value = DSI1_SEL_IN_RDMA1;
>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> +		value = DSI2_SEL_IN_RDMA1;
>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>> +		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>> +		value = DSI3_SEL_IN_RDMA1;
>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> +		value = DPI0_SEL_IN_RDMA2;
>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>> +		value = DPI1_SEL_IN_RDMA2;
>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> +		value = DSI0_SEL_IN_RDMA2;
>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>> +		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>> +		value = DSI1_SEL_IN_RDMA2;
>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> +		value = DSI2_SEL_IN_RDMA2;
>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>> +		value = DSI3_SEL_IN_RDMA2;
>> +	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>> +		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
>> +		value = COLOR1_SEL_IN_OVL1;
>> +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>> +		*addr = DISP_REG_CONFIG_DSI_SEL;
>> +		value = DSI_SEL_IN_BLS;
>> +	} else {
>> +		value = 0;
>> +	}
>> +
>> +	return value;
>> +}
>> +
>> +static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
>> +				   enum mtk_ddp_comp_id cur,
>> +				   enum mtk_ddp_comp_id next)
>> +{
>> +	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>> +		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
>> +			       config_regs + DISP_REG_CONFIG_OUT_SEL);
>> +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
>> +		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
>> +			       config_regs + DISP_REG_CONFIG_OUT_SEL);
>> +		writel_relaxed(DSI_SEL_IN_RDMA,
>> +			       config_regs + DISP_REG_CONFIG_DSI_SEL);
>> +		writel_relaxed(DPI_SEL_IN_BLS,
>> +			       config_regs + DISP_REG_CONFIG_DPI_SEL);
>> +	}
>> +}
>> +
>> +void mtk_mmsys_ddp_connect(struct device *dev,
>> +			   enum mtk_ddp_comp_id cur,
>> +			   enum mtk_ddp_comp_id next)
>> +{
>> +	void __iomem *config_regs = dev_get_drvdata(dev);
>> +	unsigned int addr, value, reg;
>> +
>> +	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
>> +	if (value) {
>> +		reg = readl_relaxed(config_regs + addr) | value;
>> +		writel_relaxed(reg, config_regs + addr);
>> +	}
>> +
>> +	mtk_mmsys_ddp_sout_sel(config_regs, cur, next);
>> +
>> +	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
>> +	if (value) {
>> +		reg = readl_relaxed(config_regs + addr) | value;
>> +		writel_relaxed(reg, config_regs + addr);
>> +	}
>> +}
>> +
>> +void mtk_mmsys_ddp_disconnect(struct device *dev,
>> +			      enum mtk_ddp_comp_id cur,
>> +			      enum mtk_ddp_comp_id next)
>> +{
>> +	void __iomem *config_regs = dev_get_drvdata(dev);
>> +	unsigned int addr, value, reg;
>> +
>> +	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
>> +	if (value) {
>> +		reg = readl_relaxed(config_regs + addr) & ~value;
>> +		writel_relaxed(reg, config_regs + addr);
>> +	}
>> +
>> +	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
>> +	if (value) {
>> +		reg = readl_relaxed(config_regs + addr) & ~value;
>> +		writel_relaxed(reg, config_regs + addr);
>> +	}
>> +}
>> +
>>  static int mtk_mmsys_probe(struct platform_device *pdev)
>>  {
>>  	struct device_node *node = pdev->dev.of_node;
>>  	const struct mtk_mmsys_driver_data *data;
>>  	struct clk_onecell_data *clk_data;
>> +	struct device *dev = &pdev->dev;
>> +	void __iomem *config_regs;
>> +	struct resource *mem;
>>  	int ret;
>>  
>> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	config_regs = devm_ioremap_resource(dev, mem);
>> +	if (IS_ERR(config_regs)) {
>> +		ret = PTR_ERR(config_regs);
>> +		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, config_regs);
>> +
>>  	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
>>  	if (!clk_data)
>>  		return -ENOMEM;
>> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
>> new file mode 100644
>> index 000000000000..7bab5d9a3d31
>> --- /dev/null
>> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2015 MediaTek Inc.
>> + */
>> +
>> +#ifndef __MTK_MMSYS_H
>> +#define __MTK_MMSYS_H
>> +
>> +enum mtk_ddp_comp_id;
>> +struct device;
>> +
>> +void mtk_mmsys_ddp_connect(struct device *dev,
>> +			   enum mtk_ddp_comp_id cur,
>> +			   enum mtk_ddp_comp_id next);
>> +
>> +void mtk_mmsys_ddp_disconnect(struct device *dev,
>> +			      enum mtk_ddp_comp_id cur,
>> +			      enum mtk_ddp_comp_id next);
>> +
>> +#endif /* __MTK_MMSYS_H */
> 
