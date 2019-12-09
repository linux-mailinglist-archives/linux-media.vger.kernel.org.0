Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDC4116A53
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 10:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfLIJ6l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 04:58:41 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40646 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfLIJ6k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 04:58:40 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 16FCF28BB97
Subject: Re: [resend PATCH v6 06/12] clk: mediatek: mt2701: switch mmsys to
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
 <20191207224740.24536-7-matthias.bgg@kernel.org>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <c08e8d32-6126-7be3-4f5a-1b94a175a339@collabora.com>
Date:   Mon, 9 Dec 2019 10:58:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191207224740.24536-7-matthias.bgg@kernel.org>
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
> Switch probing for the MMSYS to support invocation to a plain
> paltform device. The driver will be probed by the DRM subsystem.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  drivers/clk/mediatek/clk-mt2701-mm.c | 41 ++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt2701-mm.c b/drivers/clk/mediatek/clk-mt2701-mm.c
> index 054b597d4a73..4a9433c2b2b8 100644
> --- a/drivers/clk/mediatek/clk-mt2701-mm.c
> +++ b/drivers/clk/mediatek/clk-mt2701-mm.c
> @@ -4,14 +4,20 @@
>   * Author: Shunli Wang <shunli.wang@mediatek.com>
>   */
>  
> +#include <linux/module.h>
>  #include <linux/clk-provider.h>
>  #include <linux/platform_device.h>
> +#include <linux/slab.h>
>  
>  #include "clk-mtk.h"
>  #include "clk-gate.h"
>  
>  #include <dt-bindings/clock/mt2701-clk.h>
>  
> +struct clk_mt2701_mm_priv {
> +	struct clk_onecell_data *clk_data;
> +};
> +
>  static const struct mtk_gate_regs disp0_cg_regs = {
>  	.set_ofs = 0x0104,
>  	.clr_ofs = 0x0108,
> @@ -79,23 +85,25 @@ static const struct mtk_gate mm_clks[] = {
>  	GATE_DISP1(CLK_MM_TVE_FMM, "mm_tve_fmm", "mm_sel", 14),
>  };
>  
> -static const struct of_device_id of_match_clk_mt2701_mm[] = {
> -	{ .compatible = "mediatek,mt2701-mmsys", },
> -	{}
> -};
> -
>  static int clk_mt2701_mm_probe(struct platform_device *pdev)
>  {
> -	struct clk_onecell_data *clk_data;
>  	int r;
> -	struct device_node *node = pdev->dev.of_node;
> +	struct device_node *node = pdev->dev.parent->of_node;
> +	struct clk_mt2701_mm_priv *private;
> +
> +	private = devm_kzalloc(&pdev->dev, sizeof(*private), GFP_KERNEL);
> +	if (!private)
> +		return -ENOMEM;
>  
> -	clk_data = mtk_alloc_clk_data(CLK_MM_NR);
> +	private->clk_data = mtk_alloc_clk_data(CLK_MM_NR);
> +
> +	platform_set_drvdata(pdev, private);
>  
>  	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> -						clk_data);
> +					private->clk_data);
>  
> -	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	r = of_clk_add_provider(node, of_clk_src_onecell_get,
> +					private->clk_data);
>  	if (r)
>  		dev_err(&pdev->dev,
>  			"could not register clock provider: %s: %d\n",
> @@ -104,12 +112,21 @@ static int clk_mt2701_mm_probe(struct platform_device *pdev)
>  	return r;
>  }
>  
> +static int clk_mt2701_mm_remove(struct platform_device *pdev)
> +{
> +	struct clk_mt2701_mm_priv *private = platform_get_drvdata(pdev);
> +

I think that private->clk_data->clks is also kallocated and need to be freed?

But I think that the best approach now is to switch to use devm allocations in
clk-mt2701-mm.c and this remove function will not be needed.

> +	kfree(private->clk_data);
> +
> +	return 0;
> +}
> +
>  static struct platform_driver clk_mt2701_mm_drv = {
>  	.probe = clk_mt2701_mm_probe,
> +	.remove = clk_mt2701_mm_remove,
>  	.driver = {
>  		.name = "clk-mt2701-mm",
> -		.of_match_table = of_match_clk_mt2701_mm,
>  	},
>  };
>  
> -builtin_platform_driver(clk_mt2701_mm_drv);
> +module_platform_driver(clk_mt2701_mm_drv);
> 
