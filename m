Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59F181677FD
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729708AbgBUHvP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 02:51:15 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54966 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729703AbgBUHvO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 02:51:14 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id BFD5D29329C
Subject: Re: [PATCH v8 6/6] clk/drm: mediatek: Fix mediatek-drm device probing
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
References: <20200220172147.919996-1-enric.balletbo@collabora.com>
 <20200220172147.919996-7-enric.balletbo@collabora.com>
 <1582262295.30425.8.camel@mtksdaap41>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <83aa2ed6-5bd7-6883-4c00-43f1d6f5f522@collabora.com>
Date:   Fri, 21 Feb 2020 08:51:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582262295.30425.8.camel@mtksdaap41>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi CK,

Thanks for your quick feedback.

On 21/2/20 6:18, CK Hu wrote:
> Hi, Enric:
> 
> On Thu, 2020-02-20 at 18:21 +0100, Enric Balletbo i Serra wrote:
>> In the actual implementation the same compatible string
>> "mediatek,<chip>-mmsys" is used to bind the clock drivers
>> (drivers/clk/mediatek) as well as to the gpu driver
>> (drivers/gpu/drm/mediatek/mtk_drm_drv.c). This ends with the problem
>> that the only probed driver is the clock driver and there is no display
>> at all.
>>
>> In any case having the same compatible string for two drivers is not
>> correct and should be fixed. To fix this, and maintain backward
>> compatibility, we can consider that the clk-<chip>-mm driver is the
>> top-level entry point for the MMSYS subsystem, so is not a pure clock
>> controller but a system controller, and the drm driver is instantiated
>> by that MMSYS driver.
>>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>> Changes in v8:
>> - New patch introduced in this series.
>>
>> Changes in v7: None
>>
>>  drivers/clk/mediatek/clk-mt2701-mm.c   |  30 ++++++++
>>  drivers/clk/mediatek/clk-mt2712-mm.c   |  44 +++++++++++
>>  drivers/clk/mediatek/clk-mt8173-mm.c   |  35 +++++++++
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 102 ++-----------------------
>>  4 files changed, 115 insertions(+), 96 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt2701-mm.c b/drivers/clk/mediatek/clk-mt2701-mm.c
>> index 054b597d4a73..b1281680d5bf 100644
>> --- a/drivers/clk/mediatek/clk-mt2701-mm.c
>> +++ b/drivers/clk/mediatek/clk-mt2701-mm.c
>> @@ -5,6 +5,7 @@
>>   */
> 
> [snip]
> 
>>  
>>  
>> diff --git a/drivers/clk/mediatek/clk-mt2712-mm.c b/drivers/clk/mediatek/clk-mt2712-mm.c
>> index 1c5948be35f3..0ae971783997 100644
>> --- a/drivers/clk/mediatek/clk-mt2712-mm.c
>> +++ b/drivers/clk/mediatek/clk-mt2712-mm.c
>> @@ -5,6 +5,7 @@
>>   */
>>  
>>  #include <linux/clk-provider.h>
>> +#include <linux/platform_data/mtk_mmsys.h>
>>  #include <linux/platform_device.h>
>>  
>>  #include "clk-mtk.h"
>> @@ -126,9 +127,45 @@ static const struct mtk_gate mm_clks[] = {
>>  	GATE_MM2(CLK_MM_DSI3_DIGITAL, "mm_dsi3_digital", "dsi1_lntc", 6),
>>  };
>>  
>> +static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
>> +	DDP_COMPONENT_OVL0,
>> +	DDP_COMPONENT_COLOR0,
>> +	DDP_COMPONENT_AAL0,
>> +	DDP_COMPONENT_OD0,
>> +	DDP_COMPONENT_RDMA0,
>> +	DDP_COMPONENT_DPI0,
>> +	DDP_COMPONENT_PWM0,
>> +};
>> +
>> +static const enum mtk_ddp_comp_id mt2712_mtk_ddp_ext[] = {
>> +	DDP_COMPONENT_OVL1,
>> +	DDP_COMPONENT_COLOR1,
>> +	DDP_COMPONENT_AAL1,
>> +	DDP_COMPONENT_OD1,
>> +	DDP_COMPONENT_RDMA1,
>> +	DDP_COMPONENT_DPI1,
>> +	DDP_COMPONENT_PWM1,
>> +};
>> +
>> +static const enum mtk_ddp_comp_id mt2712_mtk_ddp_third[] = {
>> +	DDP_COMPONENT_RDMA2,
>> +	DDP_COMPONENT_DSI3,
>> +	DDP_COMPONENT_PWM2,
>> +};
>> +
>> +static struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
>> +	.main_path = mt2712_mtk_ddp_main,
>> +	.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
>> +	.ext_path = mt2712_mtk_ddp_ext,
>> +	.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
>> +	.third_path = mt2712_mtk_ddp_third,
>> +	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
>> +};
>> +
> 
> [snip]
> 
>>  
>> diff --git a/drivers/clk/mediatek/clk-mt8173-mm.c b/drivers/clk/mediatek/clk-mt8173-mm.c
>> index 83884fd5a750..9136c7f543f1 100644
>> --- a/drivers/clk/mediatek/clk-mt8173-mm.c
>> +++ b/drivers/clk/mediatek/clk-mt8173-mm.c
>> @@ -5,6 +5,7 @@
>>   */
>>  
>>  #include <linux/clk-provider.h>
>> +#include <linux/platform_data/mtk_mmsys.h>
>>  #include <linux/platform_device.h>
>>  
>>  #include "clk-mtk.h"
>> @@ -99,10 +100,37 @@ static const struct mtk_gate mm_clks[] = {
>>  	GATE_MM1(CLK_MM_HDMI_HDCP24M, "mm_hdmi_hdcp24m", "hdcp_24m_sel", 20),
>>  };
>>  
>> +static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
>> +	DDP_COMPONENT_OVL0,
>> +	DDP_COMPONENT_COLOR0,
>> +	DDP_COMPONENT_AAL0,
>> +	DDP_COMPONENT_OD0,
>> +	DDP_COMPONENT_RDMA0,
>> +	DDP_COMPONENT_UFOE,
>> +	DDP_COMPONENT_DSI0,
>> +	DDP_COMPONENT_PWM0,
>> +};
>> +
>> +static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
>> +	DDP_COMPONENT_OVL1,
>> +	DDP_COMPONENT_COLOR1,
>> +	DDP_COMPONENT_GAMMA,
>> +	DDP_COMPONENT_RDMA1,
>> +	DDP_COMPONENT_DPI0,
>> +};
>> +
>> +static struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>> +	.main_path = mt8173_mtk_ddp_main,
>> +	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
>> +	.ext_path = mt8173_mtk_ddp_ext,
>> +	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
>> +};
>> +
>>  static int clk_mt8173_mm_probe(struct platform_device *pdev)
>>  {
>>  	struct device_node *node = pdev->dev.of_node;
>>  	struct clk_onecell_data *clk_data;
>> +	struct platform_device *drm;
>>  	int ret;
>>  
>>  	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
>> @@ -118,6 +146,13 @@ static int clk_mt8173_mm_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> +	platform_set_drvdata(pdev, &mt8173_mmsys_driver_data);
>> +
>> +	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
>> +					    PLATFORM_DEVID_NONE, NULL, 0);
>> +	if (IS_ERR(drm))
>> +		return PTR_ERR(drm);
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index b68837ea02b3..5b60f6b7d710 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -61,88 +61,6 @@ static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
>>  	.atomic_commit = drm_atomic_helper_commit,
>>  };
>>  
>> -static const enum mtk_ddp_comp_id mt2701_mtk_ddp_main[] = {
>> -	DDP_COMPONENT_OVL0,
>> -	DDP_COMPONENT_RDMA0,
>> -	DDP_COMPONENT_COLOR0,
>> -	DDP_COMPONENT_BLS,
>> -	DDP_COMPONENT_DSI0,
>> -};
>> -
>> -static const enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] = {
>> -	DDP_COMPONENT_RDMA1,
>> -	DDP_COMPONENT_DPI0,
>> -};
>> -
>> -static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
>> -	DDP_COMPONENT_OVL0,
>> -	DDP_COMPONENT_COLOR0,
>> -	DDP_COMPONENT_AAL0,
>> -	DDP_COMPONENT_OD0,
>> -	DDP_COMPONENT_RDMA0,
>> -	DDP_COMPONENT_DPI0,
>> -	DDP_COMPONENT_PWM0,
>> -};
>> -
>> -static const enum mtk_ddp_comp_id mt2712_mtk_ddp_ext[] = {
>> -	DDP_COMPONENT_OVL1,
>> -	DDP_COMPONENT_COLOR1,
>> -	DDP_COMPONENT_AAL1,
>> -	DDP_COMPONENT_OD1,
>> -	DDP_COMPONENT_RDMA1,
>> -	DDP_COMPONENT_DPI1,
>> -	DDP_COMPONENT_PWM1,
>> -};
>> -
>> -static const enum mtk_ddp_comp_id mt2712_mtk_ddp_third[] = {
>> -	DDP_COMPONENT_RDMA2,
>> -	DDP_COMPONENT_DSI3,
>> -	DDP_COMPONENT_PWM2,
>> -};
>> -
>> -static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
>> -	DDP_COMPONENT_OVL0,
>> -	DDP_COMPONENT_COLOR0,
>> -	DDP_COMPONENT_AAL0,
>> -	DDP_COMPONENT_OD0,
>> -	DDP_COMPONENT_RDMA0,
>> -	DDP_COMPONENT_UFOE,
>> -	DDP_COMPONENT_DSI0,
>> -	DDP_COMPONENT_PWM0,
>> -};
>> -
>> -static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
>> -	DDP_COMPONENT_OVL1,
>> -	DDP_COMPONENT_COLOR1,
>> -	DDP_COMPONENT_GAMMA,
>> -	DDP_COMPONENT_RDMA1,
>> -	DDP_COMPONENT_DPI0,
>> -};
> 
> I prefer that display routing is placed in drm driver. If you want to
> move display routing into mmsys driver, I think you should move
> mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_path() into
> mmsys driver because that is the register configuration part. This array
> could be changed by display driver according to its application. For
> example, the another routing could be:
> 
> static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
> 	DDP_COMPONENT_OVL0,
> 	DDP_COMPONENT_COLOR0,
> 	DDP_COMPONENT_AAL0,
> 	DDP_COMPONENT_OD0,
> 	DDP_COMPONENT_RDMA0,
> 	DDP_COMPONENT_UFOE,
> 	DDP_COMPONENT_DPI0,
> };
> 
> static const enum mtk_ddp_comp_id mt8173_mtk_ddp_ext[] = {
> 	DDP_COMPONENT_OVL1,
> 	DDP_COMPONENT_COLOR1,
> 	DDP_COMPONENT_GAMMA,
> 	DDP_COMPONENT_RDMA1,
> 	DDP_COMPONENT_DSI0,
> 	DDP_COMPONENT_PWM0,
> };
> 
> I exchange the dsi and dpi component for the two display output. This
> array is how display driver want to route, so I think this should be
> kept in display driver.
> 
> Regards,
> CK
> 

I think that what I can do is leave all this part in the drm driver and get the
compatible string of the parent to match the data with the proper SoC. I'll try
to do this in next version.

Thanks.

>> -
>> -static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>> -	.main_path = mt2701_mtk_ddp_main,
>> -	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
>> -	.ext_path = mt2701_mtk_ddp_ext,
>> -	.ext_len = ARRAY_SIZE(mt2701_mtk_ddp_ext),
>> -	.shadow_register = true,
>> -};
>> -
>> -static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
>> -	.main_path = mt2712_mtk_ddp_main,
>> -	.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
>> -	.ext_path = mt2712_mtk_ddp_ext,
>> -	.ext_len = ARRAY_SIZE(mt2712_mtk_ddp_ext),
>> -	.third_path = mt2712_mtk_ddp_third,
>> -	.third_len = ARRAY_SIZE(mt2712_mtk_ddp_third),
>> -};
>> -
>> -static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>> -	.main_path = mt8173_mtk_ddp_main,
>> -	.main_len = ARRAY_SIZE(mt8173_mtk_ddp_main),
>> -	.ext_path = mt8173_mtk_ddp_ext,
>> -	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
>> -};
>> -
> 
> 
