Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0A33116A6B
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 11:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfLIKBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 05:01:34 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40746 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfLIKBe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 05:01:34 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id A9E2C28BA5C
Subject: Re: [resend PATCH v6 08/12] clk: mediatek: mt6779: switch mmsys to
 platform device probing
To:     matthias.bgg@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie,
        mturquette@baylibre.com, sboyd@kernel.org,
        ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com
Cc:     sean.wang@mediatek.com, sean.wang@kernel.org,
        rdunlap@infradead.org, wens@csie.org, hsinyi@chromium.org,
        frank-w@public-files.de, drinkcat@chromium.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mbrugger@suse.com
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-9-matthias.bgg@kernel.org>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <ef75d3d2-7a2d-5b68-ad0a-ffdf1da4bab9@collabora.com>
Date:   Mon, 9 Dec 2019 11:01:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191207224740.24536-9-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Matthias,

On 7/12/19 23:47, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Switch probing for the MMSYS to support invocation to a
> plain paltform device. The driver will be probed by the DRM subsystem.
> 
> Singed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  drivers/clk/mediatek/clk-mt6779-mm.c | 41 +++++++++++++++++++---------

And the same comment from previous patch. The comment applies to patches until 11.

>  1 file changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6779-mm.c b/drivers/clk/mediatek/clk-mt6779-mm.c
> index fb5fbb8e3e41..439ec460c166 100644
> --- a/drivers/clk/mediatek/clk-mt6779-mm.c
> +++ b/drivers/clk/mediatek/clk-mt6779-mm.c
> @@ -4,13 +4,19 @@
>   * Author: Wendell Lin <wendell.lin@mediatek.com>
>   */
>  
> +#include <linux/module.h>
>  #include <linux/clk-provider.h>
>  #include <linux/platform_device.h>
>  #include <dt-bindings/clock/mt6779-clk.h>
> +#include <linux/slab.h>
>  
>  #include "clk-mtk.h"
>  #include "clk-gate.h"
>  
> +struct clk_mt6779_mm_priv {
> +	struct clk_onecell_data *clk_data;
> +};
> +
>  static const struct mtk_gate_regs mm0_cg_regs = {
>  	.set_ofs = 0x0104,
>  	.clr_ofs = 0x0108,
> @@ -84,30 +90,39 @@ static const struct mtk_gate mm_clks[] = {
>  	GATE_MM1(CLK_MM_DISP_OVL_FBDC, "mm_disp_ovl_fbdc", "mm_sel", 16),
>  };
>  
> -static const struct of_device_id of_match_clk_mt6779_mm[] = {
> -	{ .compatible = "mediatek,mt6779-mmsys", },
> -	{}
> -};
> -
>  static int clk_mt6779_mm_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
> -	struct device_node *node = pdev->dev.of_node;
> +	struct clk_mt6779_mm_priv *private;
> +	struct device_node *node = pdev->dev.parent->of_node;
> +
> +	private = devm_kzalloc(&pdev->dev, sizeof(*private), GFP_KERNEL);
> +	if (!private)
> +		return -ENOMEM;
>  
> -	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	private->clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	platform_set_drvdata(pdev, private);
>  
>  	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> -			       clk_data);
> +			       private->clk_data);
>  
> -	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	return of_clk_add_provider(node, of_clk_src_onecell_get,
> +						private->clk_data);
> +}
> +
> +static int clk_mt6779_mm_remove(struct platform_device *pdev)
> +{
> +	struct clk_mt6779_mm_priv *private = platform_get_drvdata(pdev);
> +
> +	kfree(private->clk_data);
> +
> +	return 0;
>  }
>  
>  static struct platform_driver clk_mt6779_mm_drv = {
>  	.probe = clk_mt6779_mm_probe,
> +	.remove = clk_mt6779_mm_remove,
>  	.driver = {
>  		.name = "clk-mt6779-mm",
> -		.of_match_table = of_match_clk_mt6779_mm,
>  	},
>  };
> -
> -builtin_platform_driver(clk_mt6779_mm_drv);
> +module_platform_driver(clk_mt6779_mm_drv);
> 
