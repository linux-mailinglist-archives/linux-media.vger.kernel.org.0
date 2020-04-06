Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCAD519FBAA
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 19:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729533AbgDFReh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 13:34:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52668 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbgDFReh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 13:34:37 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2703B1031;
        Mon,  6 Apr 2020 19:34:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586194474;
        bh=OGW4c+P9fFS1PSMqFifiUAu605HJXi05WA0RoAqLBCc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tcPYpWFFD07G9ZvZRgLzeLNEsYyAtR/ugbRuA4O+xeTaVeKLLhI9gATMVR6PVaEtt
         R+79ybXYpC2Z0yRx/HZQVkIWOHAIykOHWSJtyb89VkEdngDFtdJJVCfazdDYEeiGw2
         piIZeBaytyo6ZWhihn9HmYLMzbRsi2fxakI7UoU4=
Date:   Mon, 6 Apr 2020 20:34:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v5 2/5] media: i2c: ov5645: Drop reading clock-frequency
 dt-property
Message-ID: <20200406173425.GE16885@pendragon.ideasonboard.com>
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1586191361-16598-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1586191361-16598-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Mon, Apr 06, 2020 at 05:42:38PM +0100, Lad Prabhakar wrote:
> Modes in the driver are based on xvclk frequency fixed to 24MHz, but where
> as the OV5645 sensor can support the xvclk frequency ranging from 6MHz to
> 24MHz. So instead making clock-frequency as dt-property just let the
> driver enforce the required clock frequency.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov5645.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index a6c17d15d754..52848fff8a08 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -61,6 +61,8 @@
>  #define OV5645_SDE_SAT_U		0x5583
>  #define OV5645_SDE_SAT_V		0x5584
>  
> +#define OV5645_XVCLK_FREQ		24000000
> +
>  /* regulator supplies */
>  static const char * const ov5645_supply_name[] = {
>  	"vdddo", /* Digital I/O (1.8V) supply */
> @@ -1094,25 +1096,19 @@ static int ov5645_probe(struct i2c_client *client)
>  		return PTR_ERR(ov5645->xclk);
>  	}
>  
> -	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
> +	ret = clk_set_rate(ov5645->xclk, OV5645_XVCLK_FREQ);
>  	if (ret) {
> -		dev_err(dev, "could not get xclk frequency\n");
> +		dev_err(dev, "could not set xclk frequency\n");
>  		return ret;
>  	}
> -

I think you can keep the blank line here.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	/* external clock must be 24MHz, allow 1% tolerance */
> +	xclk_freq = clk_get_rate(ov5645->xclk);
>  	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
>  		dev_err(dev, "external clock frequency %u is not supported\n",
>  			xclk_freq);
>  		return -EINVAL;
>  	}
>  
> -	ret = clk_set_rate(ov5645->xclk, xclk_freq);
> -	if (ret) {
> -		dev_err(dev, "could not set xclk frequency\n");
> -		return ret;
> -	}
> -
>  	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
>  		ov5645->supplies[i].supply = ov5645_supply_name[i];
>  

-- 
Regards,

Laurent Pinchart
